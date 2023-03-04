Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BB86AACA7
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 22:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYZ78-0001mo-Pn; Sat, 04 Mar 2023 16:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pYZ6v-0001mY-N5
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 16:08:11 -0500
Received: from mailout12.inleed.net ([2a0b:dc80:cafe:112::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hc981@poolhem.se>) id 1pYZ6t-0001fH-Fh
 for qemu-devel@nongnu.org; Sat, 04 Mar 2023 16:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=poolhem.se; 
 s=x;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aoqMqI9XhhmR91kPSrimpxEJ960x5iL9fPqhI2abdEI=; b=KTMVEIAJV6YPAiE/NYIlpjcZgo
 V/T1+2g4bHP9Gg8taAoFr0iuu4O7KbR8Y1pleTDanuEDjshbyPki4GWR1WeC9dTXBTgMexXakIKDv
 87brmZgTt5MNM5aMgaQmitC6LuHAr+65jQDqp00CmQBhqzxH2lt8oAbxVN2iXms6ATxM40CgKjo1q
 E2GOoeG4uEDpfWQ2UybkQHpWHEP20J/EYVg0VPX435jY1x46I22vKyJ+ahgJ7bzIvubEVZXY3c/7+
 J74IZQ1WunOlAHytxSxvf+GL5BKiF6kT6hKwHgtZYm+4R6kNdwVG9D8Rp0DPj8SURkpRjxff/ZMgZ
 xR5ViYMw==;
Received: from [213.115.245.47] (helo=balrog.lkp.se)
 by ns12.inleed.net with esmtpa (Exim 4.96)
 (envelope-from <hc981@poolhem.se>) id 1pYZ6s-005U8F-0o;
 Sat, 04 Mar 2023 22:08:06 +0100
Date: Sat, 4 Mar 2023 22:07:54 +0100
From: Henrik Carlqvist <hc981@poolhem.se>
To: Henrik Carlqvist <hc981@poolhem.se>
Cc: mark.cave-ayland@ilande.co.uk, hc1245@poolhem.se, qemu-devel@nongnu.org
Subject: Re: [PATCH v5] Emulate dip switch language layout settings on SUN
 keyboard
Message-Id: <20230304220754.0c6ae562.hc981@poolhem.se>
In-Reply-To: <20230123200937.32eb19eb.hc981@poolhem.se>
References: <167305907804.10652.2746409341903316717-1@git.sr.ht>
 <d2850ef0-d825-bb03-09d4-0d1427cf6577@ilande.co.uk>
 <20230123200937.32eb19eb.hc981@poolhem.se>
X-Mailer: Sylpheed version 0.9.7 (GTK+ 1.2.10; i686-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Id: henrik@poolhem.se
Received-SPF: none client-ip=2a0b:dc80:cafe:112::1;
 envelope-from=hc981@poolhem.se; helo=mailout12.inleed.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Mar 2023 11:52:42 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:
> I've done a quick grep for similar examples for serial devices that use
> keyboard_layout but it looks like this would be the first.=20

Thanks again for your reply!

It is probably not a very common solution with hardware in the keyboard
telling the computer about its language layout. Maybe it is even less common
with such hardware possible to adjust with a dip switch to choose language
layout. But that was the solution Sun selected for their keybords back in t=
he
days and back then (and even still today) it was common for keyboards to
communicate with the computer by some kind of serial interface.

> My first instinct is that you'd want to make this a device property that =
is
> configured during machine init using keyboard_layout (rather than using
> keyboard_layout directly),

If it does matter in any way, my patch will only at first call to the
sun_keyboard_layout_dip_switch function look at the keyboard_layout variabl=
e.
Once the static "ret" variable has gotten a valid value (the initial value
0xff is not valid for a 6-bit dip swithc) the ret value assigned at the
initial call will be immediately returned without any more evaluations of t=
he
keyboard_layout string.

> but I'd be interested to hear what Paolo and Marc-Andr=E9 think about wha=
t the
> best approach should be.

As I found your latest reply only on
https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg00097.html and
can't see the email addresses of any receiver of that post this reply does =
not
go to Paolo or Marc-Andr=E9, only to you and the mailing list.

I must admit that I am not very failiar with qemu programming and device
properties.=20

> Another aspect to consider is whether keyboard_layout should just use
> standard strings, in which case it may not make sense to accept numeric h=
ex
> values.=20

I agree that those standard strings will make most sense to most people.

However, as the choices of valid keyboard layouts are limited by the 64 val=
ues
allowed by the 6 bits on the dip switch I initially did choose to also truly
emulate the dip switch value as decimal or hexadecimal number to the -k
option. It might also be worth noting that the sun keyboard layouts have
multiple dip switch settings for a single language, probably with some minor
differences in keyboard layout or keyboard type. So both value 8 and 40 (0x=
28)
will give some norwegian keyboard layout. if someone, for some reason, would
want to emulate for example one of the four possible US keyboard layouts (0=
x0,
0x1, 0x21 or 0x22) it would be harder to do without being able to give those
numerical values to the -k switch.

best regards Henrik

