Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144F22CA248
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:12:43 +0100 (CET)
Received: from localhost ([::1]:55078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4WP-0005G4-K3
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4TE-0003Tf-Vm
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:09:25 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:40996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4TC-0003eO-FH
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:09:24 -0500
Received: by mail-ej1-x641.google.com with SMTP id f23so3600327ejt.8
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CMeBTBQEwpHAx+Smc+p8aQUgKA9DMdr0Nba198iIT+8=;
 b=lDTWOQIwmOR/U91nS8an/oTglstFYo7TQeHdUucOM+r6QaanWAqC9hUxC3iGkKwxH/
 VrvjGSGvEvxxsfZryXUJLpS/Q5bguY4I4zH80Np8Am5ps4ise7bwbIHwnbrDIFCToCWY
 TVAbWMxrh1nEMb0Ort0KLnpp+TzBgUQzUD9Fl+NcFAgfM5aXbesIzq7dGseWH2VOiXoS
 Rq+2nSivOMcLNe4AmPHSR6OoTzn2CxcwOnltYFKjy9G1e0rAuLH0D1znebXqA1DRY/Wu
 vkgjGhzQLufaokAnFQOsWfYIjIasS85SKKLGrvLgC9qHBYQfsJGcSBNr/FnT0XnLe4h/
 4eDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CMeBTBQEwpHAx+Smc+p8aQUgKA9DMdr0Nba198iIT+8=;
 b=R4adm2yOGDzEoQTHpoAAibK3s6iycu1oT8NEB5dQZ45lEd1TChFKsNxEqq86AZ0+jN
 edC+RLAF2kbdNqfY15y1kcUR0ZIVoZ/Yh88Xik/T8VCqb4XnRr+nBMgg9vXRJq+HS1Qv
 IWesTrXQRhPS2knvjEs9vhIfDyJ742r4ZBsu8SImlNeHW/y0LDpkrHBJZb6myBihJqRf
 6O7rbfLGk6sd22xRHxm/zYk7DMV+NQRlgxY7XKgThz2+P1bcH2cHdqfwFkXhzpU3s+lP
 tTkmbot8IfzjIAbEjUe2VEDyA1FZ30XyKxqAqpEZWEDmQGE74uK1py8IybLLBumr1UOw
 nE+A==
X-Gm-Message-State: AOAM533a2E2a9SCRjSAryjZ6Il6HxH7ZD7ni0L1fF7ZVHi9eBn3WqVq8
 JjRWzzBCm/J/7mQPSkbWc/6kf3wL+k03t0+snbgQ7A==
X-Google-Smtp-Source: ABdhPJx3mTQn272egEVsNdVJ7xwlq/btPqXvi6Tna0vqlgO+c02ArgEwFFoBgU3jdTqrMPM0d+GwB2Vk4FzEb1v+8Y0=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr2668104ejd.85.1606824560911; 
 Tue, 01 Dec 2020 04:09:20 -0800 (PST)
MIME-Version: 1.0
References: <20201124092445.658647-1-mcascell@redhat.com>
 <48d8ae85-3292-921a-f249-3b88a1141cc9@amsat.org>
 <CAA8xKjXJq00HtKNJc0HVAhXXftFHEGLj_KXaiy7M9_2WvgNRrQ@mail.gmail.com>
 <cc15cf81-aaf9-0886-b988-61b6314648b9@redhat.com>
In-Reply-To: <cc15cf81-aaf9-0886-b988-61b6314648b9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 12:09:09 +0000
Message-ID: <CAFEAcA-Vzc2Uop8bsp73xLfrBkfjJtko7dhKDqKK4+xJfxQ7ww@mail.gmail.com>
Subject: Re: [PATCH] hw/net/dp8393x: fix integer underflow in
 dp8393x_do_transmit_packets()
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Finn Thain <fthain@telegraphics.com.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Gaoning Pan <pgn@zju.edu.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 05:46, Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2020/11/30 =E4=B8=8B=E5=8D=888:11, Mauro Matteo Cascella wrote:
> > On Mon, Nov 30, 2020 at 11:44 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >> +Laurent/Finn
> >>
> >> On 11/24/20 10:24 AM, Mauro Matteo Cascella wrote:
> >>> An integer underflow could occur during packet transmission due to 't=
x_len' not
> >>> being updated if SONIC_TFC register is set to zero. Check for negativ=
e 'tx_len'
> >>> when removing existing FCS.
> >>>
> >>> RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=3D1899722
> >>> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> >>> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
> >>> ---
> >>>   hw/net/dp8393x.c | 4 ++++
> >>>   1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> >>> index 674b04b354..205c0decc5 100644
> >>> --- a/hw/net/dp8393x.c
> >>> +++ b/hw/net/dp8393x.c
> >>> @@ -495,6 +495,10 @@ static void dp8393x_do_transmit_packets(dp8393xS=
tate *s)
> >>>           } else {
> >>>               /* Remove existing FCS */
> >>>               tx_len -=3D 4;
> >>> +            if (tx_len < 0) {
> >>> +                SONIC_ERROR("tx_len is %d\n", tx_len);
> >>> +                break;
> >>> +            }
> >>>           }
> >>>
> >>>           if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
> >>>
> >> Doesn't it make more sense to check 'tx_len >=3D 4'
> >> and skip tx/rx when 'tx_len =3D=3D 0'?
> >>
> > Yes, it makes sense. I thought that skipping tx/rx in case of null
> > 'tx_len' could lead to potential inconsistencies when writing the
> > status or reading the footer of the packet. but I'm not really sure. I
> > can send a new version of the patch if needed, otherwise feel free to
> > apply your changes. Thank you.
>
>
> I think we can go with this patch first and tweak on top consider it's
> near the release. So:
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> Peter, do you want to merge this patch?

rc4 is due for release today, and the dp8393x is a device not
used by any KVM platform, so this isn't a security fix. So
we don't *need* to take it for 5.2. On the other hand this is a
pretty small and constrained fix that won't affect anything
except the mips jazz and m68k q800 boards.

Applied to master for 5.2, thanks.

-- PMM

