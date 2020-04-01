Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20519AE5B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 16:55:34 +0200 (CEST)
Received: from localhost ([::1]:33180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJemD-00018e-B8
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 10:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jJel7-0000Nu-2E
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:54:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jJel4-0005l4-IR
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:54:24 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37976)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jJel4-0005kb-2u
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 10:54:22 -0400
Received: by mail-wm1-x341.google.com with SMTP id f6so7563797wmj.3
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 07:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=Osbx6HHFGQwFjcYIt2QDV44TTUd+yzKa3epcKQeFMpA=;
 b=qvSPEw7HWfga7z+JozjwhxnfXv/HE9FkaAgzeUGDKOFuHhvOBYGCzSaS3se5yta6dw
 romjnGKmP8s4dAwPxTI68Yo/epiWwuGmt6hBox49ISDU/Ni+w980H+Q4tmQV+/bHQwQJ
 5FbQO+ozwfWQNntahh4aQUe7gMTQQwqYsmKXJUdVFdJHWC0s7NCWaE4VRx15G9Tu/voA
 BQLMTP+yg5vUHmzRihcw3crS87j/PgkzjwkgqxLpJD5JdDuYu6sfYpZk5KUQTBTDwvrX
 GC9AyI5ElNKGwy+XU6wrhnhq2zbmgVHIM2ika8S+pU8PnN4ojqp7HugWH/IMTbnwyuk9
 r73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=Osbx6HHFGQwFjcYIt2QDV44TTUd+yzKa3epcKQeFMpA=;
 b=erleEyRT4L/0/uRuPtLzGbXdRXwqlwqc7DNgeIXE2UtyJAA2f+J+XM8d1kjIZ7R+Rl
 ZwcYODwNsFsoG+3SL4O65MDU29rhgi1F+Kxvf6APbyncmEBmT1uG01MpGzh6N8hiREH9
 NLja+mx+Dd7JOOhGTJj7xmBWqKD/0BFQ+cr+XSyaslOy0aaD7GUsVr/P4LIE536Jz45t
 3vObC2eLX5Om3gBpJ22m7rxDmCqo2EtEspc5sbbHDQrTT13nLOlZhNH0uZnH7EJwxFMI
 dujIgfeCTcrgTNYvuY2QnYF4AuDbm2ZhARmumi8oDNj9el4GAjXR130DAOf+QqjBwyaZ
 eBgQ==
X-Gm-Message-State: AGi0PuYA2eATXFLRm/muPoOrZu3lB03naUxSqPOJaXYYK/KidPtAzlMi
 OpjRLGYnUWym9cc2iKqkEDPmSQ==
X-Google-Smtp-Source: APiQypJ/eLylCWXzR+21SeWZ0Dkyu2/54gbeTPid7hZWiiI6ajoUoSYpZAZTPvwD2xnb5dnc1QooIg==
X-Received: by 2002:a1c:2056:: with SMTP id g83mr4636755wmg.179.1585752860182; 
 Wed, 01 Apr 2020 07:54:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r9sm2924629wma.47.2020.04.01.07.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 07:54:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8C6041FF7E;
 Wed,  1 Apr 2020 15:54:17 +0100 (BST)
References: <156345756915.8493.13426435768891424211.malonedeb@chaenomeles.canonical.com>
 <158574286655.23367.10331497924809979875.malone@wampee.canonical.com>
User-agent: mu4e 1.3.10; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bug 1837049 <1837049@bugs.launchpad.net>
Subject: Re: [Bug 1837049] Re: qemu-system-ppc segfaults with -display sdl
In-reply-to: <158574286655.23367.10331497924809979875.malone@wampee.canonical.com>
Date: Wed, 01 Apr 2020 15:54:17 +0100
Message-ID: <87sghndzom.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Andrew Randrianasulu <1837049@bugs.launchpad.net> writes:

> I think this one is fixed, I can boot Lubuntu to desktop like this:
>
> qemu-system-ppc -cdrom /dev/shm/lubuntu-16.04-desktop-powerpc.iso -boot
> d -display sdl,gl=3Don -g 1024x768x32 -M mac99,via=3Dpmu -cpu G4 -device
> ES1370 -m 2047 -accel tcg,tb-size=3D384 -device usb-mouse
>
> without any crash, tried few times.
>
> Note, tb-size seems to be important on 32-bit host now, near qemu 5.0.

There were changes this cycle to remove the TB size heuristic based on
guest RAM size. System emulation of 64 bit hosts gets a generous 1gb per
system by default where-as 32 bit hosts make do with a smaller code
buffer (which is statically allocated for user-mode).

See the commits around 600e17b2615 (pull-tcg-20200228)

>
> qemu-system-ppc --version
> QEMU emulator version 4.2.91 (v5.0.0-rc1-dirty)
> Copyright (c) 2003-2020 Fabrice Bellard and the QEMU Project developers
>
> -dirty probably because I reinstalled SDL2 (2.0.9- > 2.0.12 during
> compilation of qemu). I also have different glibc this time (2.30
> instead of 2.23)


--=20
Alex Benn=C3=A9e

