Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B272B4962
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 16:33:41 +0100 (CET)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kegVf-0007bS-Qb
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 10:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kegUY-00076T-JJ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:32:32 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:43484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kegUU-0003Us-HU
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 10:32:30 -0500
Received: by mail-ej1-x641.google.com with SMTP id me8so24995000ejb.10
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 07:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EivzUuW0cVvBlcvj7ngnJrD8lCaxTZu5YKiv5xyEo24=;
 b=JQzVBs138CE5Y940Ymyvest8Xy4yXADojfjwbc2ym33hmrqeuMGTefInTKJzdzXJ2r
 kWbZhf8dT5Eu5tpCPEf8tm2ESDLyCHCSIsYc7JdmydPw1YNiX4eBSVSMZHopV3kbb75U
 fDCGEWaLQpRm6j5FD3YrGYE5ovMw0p9lOvOt0Wz+8j7IYJktoB6cnyqamYMgPFMFPezf
 zlPf2a4X8ySuAdMz4B3glkcjLnFsW1e5BnR53UnkeunROCmcD0avpiaeUqgVNgMBuB8t
 Zw6juvcJPub9hRND6xoxB2d82hJNzrvsdnK+R6t5OqPji1xDpDDZWTuMrSeU4vNsN3n+
 pnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EivzUuW0cVvBlcvj7ngnJrD8lCaxTZu5YKiv5xyEo24=;
 b=j7njWmaiiuu/Wh2NIazcseZqhY07N23tA6nZXnkTh8WXD1R87vVc/SNs5ZuDrEdKXt
 A2XYuEVqXwW5y10HyxJ+JkMam7voI1DlQxyd5Hrp8FlPvcchz3dAEjAfVYMq48FjpZbu
 nH6N4BdQ5ouJmzd/cv04oe0a6jYZaY/befkWRv92jWADeG5CyOiEy1gSshTVVkvv4lPs
 ZvKuBfEJuUOvrJB4kfw0huAsTpejcJfFez7KPkYteMF9+UQ/u/bpjY47cBPbV/+iOBWj
 ThlbLxTYzxK9m0ZlAx5m3mFQKzFsscJNfir/0/DhuWfyuhOVjEC3Smj87RUs/BuksHVP
 Ln7A==
X-Gm-Message-State: AOAM5327ZzeSzomul93e/FZA13zZUYjiCxwwHebHYtj2no5wBl4sHN/4
 sGann388NqpRGCGAcYyuok3IULLhMYt6p0wZ51srTw==
X-Google-Smtp-Source: ABdhPJx5uqYAH4RFVaL4+EMSmMqkBpkNnMVO2wJ03fy5XweU8LeAPRjxksUKXJe0FpkaIlfXRyfwj028gg9JGiwIme4=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr14826500ejs.482.1605540744645; 
 Mon, 16 Nov 2020 07:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20201116145341.91606-1-thuth@redhat.com>
In-Reply-To: <20201116145341.91606-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Nov 2020 15:32:12 +0000
Message-ID: <CAFEAcA9DGwpG2JE-=-EUf6G6ER0U0gy+aW69=hkrkUSDTrKsRQ@mail.gmail.com>
Subject: Re: [PATCH for-5.2] docs: Get rid of the weird _005f links in the man
 page
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 14:53, Thomas Huth <thuth@redhat.com> wrote:
>
> The man page does not contain all the chapters from the System Emulation
> Users Guide, so some of the links that we've put into the qemu options
> descriptions can not be resolved and thus the link names are used in the
> man pages instead. These link names currently contain weird "_005f" letters
> in the middle and just do not make any sense for the users. To avoid this
> situation, replace the link names with more descriptive, natural text.

The "_005f" is a legacy from the automatic conversion from Texinfo.
In Texinfo, link names could not contain underscores and so for
instance the link to the GDB usage was "gdb_usage". The conversion
to rST seems to have taken a broad view of what might be a
punctuation character that needed escaping, and so converted the '_'
into a hex-representation (ASCII 0x5f being '_'), giving
"gdb_005fusage".

thanks
-- PMM

