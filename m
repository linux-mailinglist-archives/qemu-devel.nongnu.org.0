Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5693CB719
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:04:01 +0200 (CEST)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4MZU-0001bn-PK
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4MXN-0007OJ-Ml
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:01:49 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4MXL-0006py-Rw
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:01:49 -0400
Received: by mail-ej1-x636.google.com with SMTP id gb6so14781623ejc.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 05:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lvF0xExXGrStXVQNKeWBDAjh/sfZVkhgCnDYAaEJrZU=;
 b=P9AuzyDGz2PNi3rK+PW2McEaXA47dGefKszK1tXdBE5p0eFEjcV4eBNDbKHr8TBt6Z
 OFkOOlDf5iMfi8G7UvyIEO5RJ4sq9f8zY35YhnZZ0/VO5VzA191C2shW2KjCzRxhomeZ
 Ac32GAu2BoM9PNYiAxuunzMCigZFH6VsNyfSKPwsL1SE602ZQbGzlBnOX3mOFKxVQscw
 f6SVK3cwnvos5ALKOWlKtjaZutP8cABvn3mhGRzqtCg1IknohvzAIty3OVFARmvUamW/
 DOpBVQBbQgbz/Zf26pQXWeGOJllwEnSbEiMAQoA5MT+behncKouG/CbGJ32Ioq6rwUqT
 x6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lvF0xExXGrStXVQNKeWBDAjh/sfZVkhgCnDYAaEJrZU=;
 b=hT0luuqDhDiusgASgVmhTsMnbH3WNJO7+2a7FS12XQOrqIRlMppyn3aN8v2TuDkyUn
 f64Ovpvm2Z6NquJ7XdoYdEyH6vuKUIkbaaAYJmtz6e43Wzi6z7rjQdehA2ivTyUuIwGF
 fwZXu3yWY+XHmH33l4SoYGwmi4kW/iOa934HHkIOSIGvIegBHbikRh83acxlcOCGiCsM
 Qfqnh3HaXDHWEG2VR5ejjSxtDK2SQrxfTqc/zEiBpTWywA0rnUq4RbLuCvsFhQ3s2DBl
 PGskY5WWHHwRydTETRnLWHULBoHDsX6remqGInaSKG3BiEQrCDzfc6MvTnLh4HTYmIc9
 9N0A==
X-Gm-Message-State: AOAM531KxgLTf68aKY++nfxHKawRhQ33d5+aBiVq088x+H5MnVVSLDD6
 i3eKodDMxQMmlh59vWRqpzWgY9fENgGBH3oBOMgpkA==
X-Google-Smtp-Source: ABdhPJyJD41b5MeQRVzcbyFtHdRpcGcmabs0xJcPlJUbna1SJGBzQra+39wuq8YpnuR2UEIf5MBRpGxl9Vz137GwzzM=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr11574441ejd.250.1626436905557; 
 Fri, 16 Jul 2021 05:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210715123206.212379-1-armbru@redhat.com>
In-Reply-To: <20210715123206.212379-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 13:01:05 +0100
Message-ID: <CAFEAcA-WMius9SUf0gLSviM0QKOLQSy26ZMgRR-n60gH2qELtA@mail.gmail.com>
Subject: Re: [PULL 0/1] QAPI patches patches for 2021-07-15
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Jul 2021 at 13:32, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit a9649a719a44894b81f38dc1c5c1888ee684acef:
>
>   Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-07-14 18:09:09 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-07-15
>
> for you to fetch changes up to a0c7b99bf75d85b616fa219a7d866fc72970f327:
>
>   qapi: Fix crash on missing enum member name (2021-07-15 12:56:41 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-07-15



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

