Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17823321F63
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 19:50:45 +0100 (CET)
Received: from localhost ([::1]:35812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEGI5-0006Yz-Nq
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 13:50:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annieharamad@gmail.com>)
 id 1lED4J-0005tL-Bz
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:24:15 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:36498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <annieharamad@gmail.com>)
 id 1lED4H-00062k-OK
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 10:24:15 -0500
Received: by mail-ua1-x930.google.com with SMTP id i3so4436996uai.3
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 07:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ffGaIl6r7NLGXUmszFLaHOU0ip2w9N9HvkhF1fmw+9k=;
 b=C+oFI6k2XswHnP7bRkZGN/2c3YqYwBGqGXrgXcjRL5V6yaWermMPq7gU581jiQiyeD
 pkAEpv1Ry+XhXRVBewsezKiIb8YuNWoOMM1F2yPZO7nL2LIf8eSXgMRemY40KwKCD5yC
 w8NYZseCbg83PpDbfWmQY+CeU6PtyFAoWE2aVW2yHnFY88a0OyLL2erLpy/Vc6aMac5B
 CHxVuWcUIqNyzZuobS+ZwOpSi0lZZvMV98b9DFlg/DNdMmaj7Wf/X9GGmFEgCtG2Mxfn
 DBibI9GTklTk/cKjftAcfVs1aNdIYDp21ulnxbJ65MZUvgo9D285h5rUpaopYOf2OoCW
 scTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ffGaIl6r7NLGXUmszFLaHOU0ip2w9N9HvkhF1fmw+9k=;
 b=V4VvcNo7wKiO2w+V49tZTCXALHyIbgNZEUKKMpnCOBqMWATqH95dJhpyjYcIjrZ01c
 SddZ6p2CktcayU1Ml/Epb8DW/L2Ziy98JswiQEeqyWzwzRDYdmGXhlHcFgy5YoU7loaz
 nPwowTD7EmGUM2BoIqVdwbSC2HH+5pWd9LIWVVWoNmCEEbpM8ibkcyeaoUB0452WPBBh
 7dMDgikJj/ggzVQEuWZb6uM1A8mW9H7/G5SnOj/Zzg6I1MWlpRjyjOQrScowyyMarMQ/
 uRYX4L0qg76X3jtsmCNOtOUgwKiKR408INBUl5KqLLi6elbrJKxKXcIRs4GZHsjw6Kce
 aZiQ==
X-Gm-Message-State: AOAM532HQpPWtfWAdKIpsmg4KSzqbUqP16qF121I5gFncUJc4YDgRr+6
 M4eRflnYQ3SXIfo7hrXzF1ys10LEJl7YE+VFf3CK5o7jj3o=
X-Google-Smtp-Source: ABdhPJyzp/CYeEFTD4/WzW9cvdwINzU+lm9THMLBAZ/I8zP8cwN8WTFt3iKX0TvgFhX+tUVKTluhYL8YE+43Oe6HPDo=
X-Received: by 2002:ab0:160f:: with SMTP id k15mr14410226uae.69.1614007452004; 
 Mon, 22 Feb 2021 07:24:12 -0800 (PST)
MIME-Version: 1.0
From: Annie Haramad <annieharamad@gmail.com>
Date: Mon, 22 Feb 2021 17:24:02 +0200
Message-ID: <CAG-g2dHxmKC76nZO3AJ4Saa93VevUbu7J2r0rBY-FMLP75n0BA@mail.gmail.com>
Subject: Weird behavior in cortex-A7 when disabling/enabling IRQ in ISR
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000d774b205bbee6456"
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=annieharamad@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 22 Feb 2021 13:48:36 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d774b205bbee6456
Content-Type: text/plain; charset="UTF-8"

Hey, I have been running bare metal program on "mcimx7d-sabre" and I have a
weird behavior that doesn't occur on a real hardware or at least I can't
reproduce it on real hardware.

I'm running a basic program that registers interrupt for serial, and then
running in an infinite loop that formatting a string with vsnprintf, in the
ISR I have disabled IRQ Interrupts (CPSID I) handled the interrupt and
enabled IRQ Interrupts (CPISE I). After a while a data abort happens in the
strlen with arg pointer as NULL that called in vsnprintf. When I run the
same code but without the disable/enable IRQ everything works fine. You
have any idea why does it happen?

--000000000000d774b205bbee6456
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey, I have been running bare metal program on &quot;mcimx=
7d-sabre&quot; and I have a weird behavior that doesn&#39;t occur on a real=
 hardware or at least I can&#39;t reproduce it on real hardware.<div><br></=
div><div>I&#39;m running a basic program that registers interrupt for seria=
l, and then running in an infinite loop that formatting a string with vsnpr=
intf, in the ISR I have disabled IRQ Interrupts (CPSID I) handled the inter=
rupt and enabled IRQ Interrupts (CPISE I). After a while a data abort happe=
ns in the strlen with arg pointer as NULL that called in vsnprintf. When I =
run the same code but without the disable/enable IRQ everything works fine.=
 You have any idea why does it happen?</div></div>

--000000000000d774b205bbee6456--

