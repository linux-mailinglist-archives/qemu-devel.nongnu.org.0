Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2322307CD1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 18:43:17 +0100 (CET)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5BK8-0007VP-Qj
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 12:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5BD0-000219-1T
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:35:54 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:36509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5BCt-0005vK-U0
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 12:35:53 -0500
Received: by mail-ed1-x52e.google.com with SMTP id d2so7596228edz.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 09:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+kaQQYOFJNzRB4Cy7boSHTaHPSPUp5X1QRjrBhGvfBE=;
 b=NeZmM2GQpzfbhiKszNZ/0MZJMX21KzB2Z5l9t4HS6W3JD0dwj8mpQsa6c+Pq0cJgWs
 dM/c0qumPmhZSzPCFvK/FbdI9ueC72CaC3e2JhMqshw+xMQokkiVgaPSGx0kYHamTQkw
 1ST85/pEQjUOnDAFeB1KZmKApL95mJI9ny5mukwjOrV3jwed0nadAIiYBH2obsXSReso
 FrOouFhS61GBZQfdMRujognpIEf0oENc12Eyk2xb+zkVtPWVAdpwirs4S5U3mEUIxKZo
 km1FxvnpJzMeBDEMtxkJ+3LfkrT4DqW4y+D+TLwos4Ha96mGYiT6CGeRjuu6F9EJkZL6
 hCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+kaQQYOFJNzRB4Cy7boSHTaHPSPUp5X1QRjrBhGvfBE=;
 b=LqcRZVNArZ0jvTcYg3jLRLPsjx8ADZfiKI60IPCEWnmHOu+KgaxTfhm9Ojmn3hSnEe
 l+tYkganuX97ULCKp7YKR0Mzu1I7EQzALKqENyMw7iaK6vAdgzEUsq763ZIIwPwnHTvB
 N5yrETFnvE+EWTlVKA3F00EmSnRIPEfuPWNgxQFeV/CArr8iVuLVVwALlMvgr5lAqCB/
 V38UOTMODpOhP6KJ4aGoMb8DjhMYjH/TlwvTrv5H7mDbHivMSxyfrpHP9+p23Eg4EHQP
 kGcRpM49ev+OsSvMGqLjMUda8kfIVfGu5ASxWPtbSeQIuC40oEGCH0doTmZanTEuqvY/
 I4hw==
X-Gm-Message-State: AOAM533UW2mw8E1YRdNeXZ61CEgVfJc6KqnoaRza+YLepzyf6iwf85l7
 dz62baOPovLLt3f895dlPobzPL4t06sDOlHtdJZytQ==
X-Google-Smtp-Source: ABdhPJzeBNYxDyRIi6Glz5VqhXrw87PWrFWd3jqNwXw9l21vICfIbL1+u6xJitdySxI6rZ5EVJKax3IO7I/skDR8mCM=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr754060edb.44.1611855344992; 
 Thu, 28 Jan 2021 09:35:44 -0800 (PST)
MIME-Version: 1.0
References: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1611759570-3645-1-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 17:35:33 +0000
Message-ID: <CAFEAcA9n37zFEH8iVsshV_TsrJ0kkHLqjHKctvaw+S20Suz9Lg@mail.gmail.com>
Subject: Re: [PATCH v6] Add support for pvpanic pci device
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yan Vugenfirer <yvugenfi@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 at 15:46, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> This patchset adds support for pvpanic pci device.
>



Applied to target-arm.next, thanks.

-- PMM

