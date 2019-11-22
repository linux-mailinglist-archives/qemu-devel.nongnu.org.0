Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF4107453
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Nov 2019 15:57:21 +0100 (CET)
Received: from localhost ([::1]:51910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYAN6-0002vz-Cf
	for lists+qemu-devel@lfdr.de; Fri, 22 Nov 2019 09:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iYAM1-0002MX-2i
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:56:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iYAM0-0003Vm-2S
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:56:12 -0500
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37604)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iYALz-0003VX-U5
 for qemu-devel@nongnu.org; Fri, 22 Nov 2019 09:56:12 -0500
Received: by mail-ot1-x331.google.com with SMTP id d5so6399985otp.4
 for <qemu-devel@nongnu.org>; Fri, 22 Nov 2019 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xvp/DnxXq+YqNjjSVCDifTksAe6Kl9mfzOtN5VOwQN0=;
 b=Hsvg+tOMGI2uaeLmoYp6J30OnYXI+EmPbkQiFt75W2HISrdfq744lpRsGMQW5KRmY7
 kVZ6bx4o5koA5PoYsMq+CuGYO8x/7aIvtiOaE3/ZSNwCmgAZwJC2TSX6j+fNND8VBGMz
 Pg8vlAFlj6jU635rtzhwWHGATxCr2dLHl9iNsdCgph2fuBPSGWSLvjg6B1IKc3ejiUKZ
 cjJrbUKa048itvVltCHk42foSJ2F8rOrmylLjHt9wCaKRbzohk6b4n1LH6FJx5unYfXK
 cOfpK1Hn5XZOVdR0Y30vwyHaINbaOQ9IxMX6aQU6NpHOm+S7fyXxXFapV3F4dHUV7WN1
 6H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xvp/DnxXq+YqNjjSVCDifTksAe6Kl9mfzOtN5VOwQN0=;
 b=ChjxieaGRK6U7VOtRKYCRO8wXIz11DWDRZrTkaUXWY7VlDwRhcGPB39cpiJkusCoPD
 piWhbxBh/mGNtvmCscs95bc0ZONhMw8YPtnfYwXaukMB+/8RQR7YThxHM9G6K9AhXoY+
 PY5EQfPZ1LpNyLANMd8npvg73mJaztQe3jazmB0UQUbQ9laBYDUr4Nes/lZgkGqfVtz5
 fHmnTrK+ep4DSp+Jkfew6kSeNC77mHgeIOfD4eXy0LQSUIK5N7kM0Ctln7GUIc3ZzgRT
 H6R+BZ75MdFIonyaGODrmKCoM1WZoxpfojwsKCnFtGPGTB1yBFSf9gkigUB6IsMTcxNU
 kMTw==
X-Gm-Message-State: APjAAAXy4uC8JndFonMqr/X+YUyY1QBhhgwOTwQ1dszRv0V4LGmEAziO
 qsZpiQgKaZdvJfrvhT/6c8+seksyeK+LnXWekiT9X1yA
X-Google-Smtp-Source: APXvYqxocWKKQBHH1i5VSvb59Ow+y76PPdKgVGBiDiFAwyV0s0sq7zn06mQS/BkRups7FuYOH6SJnArGG3/NK3Gan9o=
X-Received: by 2002:a9d:3d05:: with SMTP id a5mr11795816otc.295.1574434570940; 
 Fri, 22 Nov 2019 06:56:10 -0800 (PST)
MIME-Version: 1.0
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 22 Nov 2019 15:56:00 +0100
Message-ID: <CAL1e-=gstogyXyAFV09-_mdqPs525bQP673+TcoxoRRDKwYAqw@mail.gmail.com>
Subject: [QUESTION] Usage of '0b' as a prefix for numerical constants?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
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

Hello, all.

I am currently reviewing some code, and I see it uses '0b' as a prefix
of numerical constants, similar to these examples:

switch (((inst >> 22) & 0b1111111000) | ((inst >> 12) & 0b0000000111)) {

or

ARRAY_FIELD_DP32(s->regs, CRB_INTF_ID, RID, 0b0000);

I remember a while ago, something stopped me from using '0b' as a
prefix in my own code (was it checkpatch.pl, or perhaps some statement
on coding style, or a compiler, or something else - I don't really
remember), so I didn't use it, and used '0x' (hexadecimal constant).

What is really the view of the community on usage of '0b'?

Please C language standard and compiler experts, and also regular
participants like me, speak up.

Sincerely,
Aleksandar

