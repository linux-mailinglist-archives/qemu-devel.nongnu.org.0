Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263C2831C5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 14:49:33 +0200 (CEST)
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1huyuC-0002cf-DM
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 08:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <maxim.blinov@embecosm.com>) id 1huytj-0002CO-Gt
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 08:49:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maxim.blinov@embecosm.com>) id 1huyti-0003S1-Dk
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 08:49:03 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39408)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <maxim.blinov@embecosm.com>)
 id 1huyti-0003QD-6k
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 08:49:02 -0400
Received: by mail-wr1-x429.google.com with SMTP id x4so34610837wrt.6
 for <qemu-devel@nongnu.org>; Tue, 06 Aug 2019 05:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embecosm.com; s=google;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=SjcvDrrRWX9wfxIyquvZZsNHEQr86Hgl1KBjtw/uLpM=;
 b=FlGacSUuasGsY1k5bNXrYI7mafzaVhZLHGWhwCmKhYSGorxi4o/3ZzIUGUCcoyYUk5
 EtBHoiHDiHOOmUOnQ00xHxKiJH62BLk2hRLWr5beHEXsNU7RNogIgdtHrRh13nM4VCPP
 ouspEwtjHPwhYX7ZPufKGDsTQXToMtkTJrzEcf1d/KO0/JmgnyJsTmbGqDVOMm+CC1Fo
 oF1wrSn8UR+4PWZHF5DYEdpKYRvMwIIheDmoPGN+TUHrSlD9HzmskFr0qW709fxfm6dd
 BoeWZ9bp69wXYDz06gHG2T51Cy3zZJDIdDjX4lRu5NShEZnwPn5bRjds9doCrY+NUuNg
 Gw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=SjcvDrrRWX9wfxIyquvZZsNHEQr86Hgl1KBjtw/uLpM=;
 b=nA1fBCklQRAetWlgAed1DZH3Y1wcwx9hYrEfANsAkV1HMb957EdEaoZo6rXK59fApe
 wuDsBOi6fDUjC7ST5PJiJFRrME9GJBeZoPTH/fCT30e4uo7HJtkLNfWSsiXcr4lAJtrR
 3xjN3HxhLWxtUvZl9YiWNtaAxtPG8ry9wvSQ1x2RDIUa10Nd0kYuUemHZCeJm6ARE5Vk
 /I/sW3Q0qwELDfj5Y/oX5TjuRWbYL6i5ZyaOFxFNSSkHT2CHMUBBJpSqhYkbORkxRpya
 QsVf8TeYjG5laRoYZfHrfPtVyS5PDG+af8m//p9RpRhaQCvgbAN0sGEUT3I0shR5EBO1
 EYaw==
X-Gm-Message-State: APjAAAVAGTzNhNWSqP5Jj+b4v0tow0t+ezdylMcclLUIvIWK9Okhd+GI
 Fid88EDL9u3R1aSnfYwYVyUUIIgTyr4=
X-Google-Smtp-Source: APXvYqw25b88YRzFd+/x98ubmFIaFTHqhvAR6qbmK79kvJL9yOj1G2Nz0JRobvFXiSdiv06QPqX7AQ==
X-Received: by 2002:adf:f050:: with SMTP id t16mr4541094wro.99.1565095740412; 
 Tue, 06 Aug 2019 05:49:00 -0700 (PDT)
Received: from maxim-ThinkPad-T490 (cust64-dsl91-135-5.idnet.net.
 [91.135.5.64])
 by smtp.gmail.com with ESMTPSA id a8sm76175317wma.31.2019.08.06.05.48.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 05:48:59 -0700 (PDT)
Date: Tue, 6 Aug 2019 13:48:57 +0100
From: Maxim Blinov <maxim.blinov@embecosm.com>
To: qemu-riscv@nongnu.org
Message-ID: <20190806124857.GA18832@maxim-ThinkPad-T490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-devel] RISC-V: insn32.decode: Confusing encodings
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

Hi all,

I've been going through the insn32.decode file, and found some
confusing inconsistencies with the ISA spec that I don't understand. I
hope some of you can clarify.

There is a field defined called "%sh10" as follows:
%sh10    20:10

Which is used in the "@sh" format as follows:
@sh ...... ...... .....  ... ..... ....... &shift  shamt=%sh10     %rs1 %rd

And the "@sh" format specifier is used for the following rv32i
instruction defs:

slli     00.... ......    ..... 001 ..... 0010011 @sh
srli     00.... ......    ..... 101 ..... 0010011 @sh
srai     01.... ......    ..... 101 ..... 0010011 @sh

First question: Why does the %sh10 field exist? There are no 10-bit
shamt fields anywhere in the spec.

Second question: For rv32i, "SLLI" is defined as follows in the spec:

0000000 shamt[4:0] rs1[4:0] 001 rd[4:0] 0010011  |  SLLI

That is, the first 7 bits *must* be zero. So why does the QEMU
definition above only specify the first 2 bits, and treat the next 10
bits as a so-called "sh10" field? Surely that shouldn't work and will
catch false instructions right? And even if it does work, surely we
would want an explicit definition, something more like

%sh5    20:5
@sh ...... ...... .....  ... ..... ....... &shift  shamt=%sh5     %rs1 %rd

slli     0000000 .....    ..... 001 ..... 0010011 @sh
srli     0000000 .....    ..... 101 ..... 0010011 @sh
srai     0100000 .....    ..... 101 ..... 0010011 @sh

Another thing I noticed is that the rv64i ISA redefines the slli, srli
and srai encodings by stealing a bit from the immediate field, like
so:

000000 shamt[5:0] rs1[4:0] 001 rd[4:0] 0010011  |  SLLI

Consider the case that we have a 32 bit cpu and we wanted to have a
custom instruction encoded like so:

      |This bit set
      v
0000001 shamt[4:0] rs1[4:0] 001 rd[4:0] 0010011  |  MY_INSN

In 64 bit risc-v, we can't have that instruction because that bit is
used in the shift field for the SLLI instruction.  But it should be
fine to use in 32-bit risc-v.

There are two files currently: insn32.decode, and insn32-64.decode.
The insn32-64.decode file is additive, but some instructions as simply
encoded differently in 64 bit mode.

Why not have two separate insn32.decode and insn64.decode files?

I hope I'm understanding the ISA correctly...

Maxim

