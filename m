Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906903B73E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jun 2019 16:24:37 +0200 (CEST)
Received: from localhost ([::1]:47102 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1haLDw-0003Mi-QE
	for lists+qemu-devel@lfdr.de; Mon, 10 Jun 2019 10:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <nisarg.ujjainkar@iitgn.ac.in>) id 1haHk4-0002i4-Gx
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:41:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nisarg.ujjainkar@iitgn.ac.in>) id 1haHk3-0005sZ-E0
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:41:32 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:42194)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nisarg.ujjainkar@iitgn.ac.in>)
 id 1haHk2-0005p2-Qd
 for qemu-devel@nongnu.org; Mon, 10 Jun 2019 06:41:31 -0400
Received: by mail-lf1-x12f.google.com with SMTP id y13so6240440lfh.9
 for <qemu-devel@nongnu.org>; Mon, 10 Jun 2019 03:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=iitgn-ac-in.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=Zm6ePcnzwkL9llB0BHCFKwSrWsmTTTt+qOFP2MdRW3c=;
 b=kKfNQvx0s/akOViGSAb/r1GnP27BwMOPqVCW+WLT3rkXpfQtYCsb/5zBWJZM9pjTMq
 Z9ETi+GUXwqfNKwPriBKd/JMdG3EIPDxZibMV6Hg6X2qwSrYHjyJDJ1KlP7dtc2VBlHT
 ReIu7xWiZ/Ltb0wmOPh6wc5x82k/0gsxQNwpaMrkiCdmgM4Qf7xLxsG3hV9eHcNb45jY
 j2+YA1/A6lOSfd1Xq7Xh6bpvU2oNke7SufnFcIz0FyHeZ8wmGepTMwUSD7F920P15eF4
 gS60jooFkxJa7LgIpi0AYrfMaXCFKL48011yAtZvnpGF3V4dBVLOT5Z2xoVsA7suvM9f
 Em2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Zm6ePcnzwkL9llB0BHCFKwSrWsmTTTt+qOFP2MdRW3c=;
 b=jSylXfKI4vVmXK4CYvvXgygjjgeIcR8gbhaWYIQXmDFq0Rv0RUi4G3sUoohSQSCivu
 nlXYIs2K8wER+JyFPJUr5XbNvFbvTcHgKHaxB3aNekX8m9y3Urh9HYbvkgnTK2U9zO2E
 yvrJYdL5C2MXfU32bzk5ecmpIxT8XI4TQRYnEjn5IDHs2Ubwba+yjNTq6WSYpYjKDytR
 srI7XrUYIKf9xNalGT3xTk+IBZXamy3IZKCvsGveWgR1d+CWlOIE+TsqRj/dOK4tdgM2
 93/mz8Z22+tppoLX+Kki3jSYbJ/zrWRQcAHAPwnBkQYO7QfnDjZUu3sggyXfYCY/uM7v
 ZPBg==
X-Gm-Message-State: APjAAAXgp5IGzNW7YBNfQ3R6r+t7swU3gnbh4fD9hF+1I1Q5Mpka9TCP
 xR9cOGB80sUwqile//qnIHgKqq52p1yplM+ZIgs14rn2YdM=
X-Google-Smtp-Source: APXvYqxLZxqQjUiywgwz915cyt6rRQ6UFmuE6IByUJwvMpRLCGuEZUEKksQYXvakK+6InFTrmRg/kKdyy33QV112uXM=
X-Received: by 2002:a19:6519:: with SMTP id z25mr33777240lfb.73.1560163288427; 
 Mon, 10 Jun 2019 03:41:28 -0700 (PDT)
MIME-Version: 1.0
From: Nisarg Ujjainkar <nisarg.ujjainkar@iitgn.ac.in>
Date: Mon, 10 Jun 2019 16:10:51 +0530
Message-ID: <CAA2c-Xp3dAfrNV41UL=Jg--MuE3Nmsc=ZNE7JkMpJL8m6FVRJQ@mail.gmail.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::12f
X-Mailman-Approved-At: Mon, 10 Jun 2019 10:07:59 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] Need help generating instruction traces from the
 emulator.
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

Hello,

I am using qemu based aosp (emu-master-dev branch of the aosp) to generate
the instruction traces for android os running on the ARM architecture.

I am able to generate the CPU instruction using the qemu invocation
<https://en.m.wikibooks.org/wiki/QEMU/Invocation#Debugging> flags. For the
purpose of my study, I need all the memory requests from all the IPs and so
far I only have the memory requests from the CPU.

Can tell me about how to generate the traces from all other IPs (GPU, GSM
chip etc.). Since memory requests from other IPs account for more than 30%
of all the memory requests from the SoC (Source unconfirmed). Getting
memory requests from these IPs is very crucial for my research.

Thanks and regards
Nisarg Ujjainkar

--=20
Nisarg Ujjainkar
Junior Undergraduate Student
Department of Computer Science and Engineering
IIT Gandhinagar
+91 9265555488 \ 9425665211
=E1=90=A7
