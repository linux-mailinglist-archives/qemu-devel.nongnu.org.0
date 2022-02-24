Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094274C2945
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 11:24:08 +0100 (CET)
Received: from localhost ([::1]:34044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNBI6-0006tA-TX
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 05:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNBCx-0002Xk-V1
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:18:48 -0500
Received: from [2607:f8b0:4864:20::1129] (port=40970
 helo=mail-yw1-x1129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNBCs-0000Sd-Bh
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 05:18:47 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2d62593ad9bso19037747b3.8
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 02:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJYn3pOS3/msclUqYjE7wllJeGnng9iJtqC8LQBqdh8=;
 b=bX2Ss4VuUKVOd7qYN562iGgZgjDx7ySUxSeyMapX9qUZAYobMrX1+E4oYNodLskz6U
 mgTlwLqYQgy3o4UNHdyYKX/bhYab36Ce5VXJNAqksH11JvR+4ZSS+/K6lgc+R3p5lEiu
 x4E0ByuSXQooA+JcCM1qo5xujvAPuwttefRuGHQDPMfxU7o1SAbISP9NmZComaTHKtY0
 Q5QadHf1mDR2DxkTLsA6sydjdQvNBry3G674s9x1mTpn6b18S0DPy0fI0UzSqDWjIxcB
 TT1mYySZQSt0c733VC7Rs0rnnBHhxZjdKOnC2ATStE9h/QFJi9Gsu8iccYa/9Sc1IXvp
 HNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJYn3pOS3/msclUqYjE7wllJeGnng9iJtqC8LQBqdh8=;
 b=Ej8ES9iAu+8Myy/VBE+T+lsx9ABfHbOvwS4JBvK7bavNMlkbR3NStbiyt9Q4Mon6AH
 aTtQIpR6Z8si7nVW3WGcJpDsKyhp4xW8ZgNeXV9k5ePwp8yANQ+XXfO7MgaQaLVSBQMr
 BgLYXbsT5wLZAMw4iklX3WSSzswopbbODdy15PXgncLdlUGEL/aji5XbRQHKonED36qh
 upvMi89et2qy3Y9hLrxH6AymnK2wXxSv0zugfuOCiTBEolE8uYNiPqvQ0+slq8PKNl8W
 pCKsU+xFH4zJUIE8Wlwp3L04s1nUftJrOQz0PVlezzivNgtRK3IlbWzPO1T83sByhjNy
 fQBw==
X-Gm-Message-State: AOAM530+sF4lScepSrF6kgEmlQfy4Mb1OPEuBSYbfao/kLzC3S0BR5xv
 0fIJpOM1Nc3Ut9M02aGIzlkAaIETGd45drQIELL8tA==
X-Google-Smtp-Source: ABdhPJwR3XdGmOMZ946gw0ekvRFZpWB30DrFnnOvm5qL6kL1/YSLvqJIBsNxKYtcL23I1+TR85LjXKEqlW2B9J9P9TM=
X-Received: by 2002:a0d:f603:0:b0:2d1:57e5:234 with SMTP id
 g3-20020a0df603000000b002d157e50234mr1707535ywf.469.1645697921500; Thu, 24
 Feb 2022 02:18:41 -0800 (PST)
MIME-Version: 1.0
References: <20220210210227.3203883-1-jimmy.brisson@linaro.org>
In-Reply-To: <20220210210227.3203883-1-jimmy.brisson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 10:18:30 +0000
Message-ID: <CAFEAcA8YSWNzwBS0eCkMD933O3QGT5XejGKXZYkfyeWc8M_vVg@mail.gmail.com>
Subject: Re: [PATCH] mps3-an547: Add missing user ahb interfaces
To: Jimmy Brisson <jimmy.brisson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:MPS2" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 21:02, Jimmy Brisson <jimmy.brisson@linaro.org> wrote:
>
> With these interfaces missing, TFM would delegate peripherals 0, 1,
> 2, 3 and 8, and qemu would ignore the delegation of interface 8, as
> it thought interface 4 was eth & USB.
>
> This patch corrects this behavior and allows TFM to delegate the
> eth & USB peripheral to NS mode.
>
> Signed-off-by: Jimmy Brisson <jimmy.brisson@linaro.org>
> ---
>  hw/arm/mps2-tz.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index f40e854dec..e287ad4d06 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -1078,6 +1078,10 @@ static void mps2tz_common_init(MachineState *machine)
>                  { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
>                  { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
>                  { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
> +                { /* port 4 USER AHB interface 0 */ },
> +                { /* port 5 USER AHB interface 1 */ },
> +                { /* port 6 USER AHB interface 2 */ },
> +                { /* port 7 USER AHB interface 3 */ },
>                  { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
>              },

Yes; we implemented this against the revision B of the AN547
AppNote, which had an error in the relevant table. Revision C
of the AppNote corrects the docs to follow the FPGA image behaviour,
which is to have eth-usb on port 8. (I sent a patch the other day
that updates the URL in this source file to point to the latest
pdf rather than the old rev B.)

Applied to target-arm.next, thanks.

-- PMM

