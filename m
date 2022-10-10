Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E305F9851
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 08:24:18 +0200 (CEST)
Received: from localhost ([::1]:57526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohmD2-0001B8-7D
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 02:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dclarke@blastwave.org>)
 id 1ohm8F-0005iJ-R5
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 02:19:19 -0400
Received: from mail.oetec.com ([108.160.241.186]:50492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dclarke@blastwave.org>)
 id 1ohm8D-0006bh-Qa
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 02:19:19 -0400
X-oetec-MailScanner-From: dclarke@blastwave.org
X-oetec-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-3.097, required 6, autolearn=not spam, ALL_TRUSTED -1.00,
 BAYES_00 -1.90, DKIM_SIGNED 0.10, DKIM_VALID -0.10,
 DKIM_VALID_AU -0.10, DKIM_VALID_EF -0.10, URIBL_BLOCKED 0.00,
 URIBL_DBL_BLOCKED_OPENDNS 0.00, URIBL_ZEN_BLOCKED_OPENDNS 0.00)
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-ID: 29A6IZSB030097
X-oetec-MailScanner-Information: Please contact oetec for more information
Received: from [172.16.35.2]
 (cpeac202e7325b3-cmac202e7325b0.cpe.net.cable.rogers.com [99.253.170.241])
 (authenticated bits=0)
 by mail.oetec.com (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 29A6IZSB030097
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blastwave.org;
 s=default; t=1665382716;
 bh=rhY6ol1kuH0RMjXReh/wRgHT/SlsoqbhAH9T8Jk3A5M=;
 h=Date:To:From:Subject:From;
 b=gYajuzL/QJnpyeUIVZ1tdQnHwnB2dQKNw8xsqXjiEyfv0ynNcVPXO5BRBFset10UK
 nUo/x3LkuuXs3yaLq7Ywnhui9Ped24mOD4L80VYny/HcG+Au/VuFfuKuhFeYE5mnAM
 hxoisJuFVTzdCuRxan/57tOnD0Pm/59vr+2EBOj/iZCjPuRbyKTQUZaX64JS8vitHd
 iMuLA2WxQm+ADE839bLV4uiXi0SsaWy+WX10RWViT5qr1zAA4I8Snss8AiIgZ27zNA
 jNvEQG0cbadJUVGWlYi5k4JBzNpqWCfOIs7omwIigXia/09DvV2QNkdUhjvLEN9gO+
 f2D5aQpAacDZA==
Message-ID: <af7a54fd-8194-a7fc-cfed-0c8e0cf101a0@blastwave.org>
Date: Mon, 10 Oct 2022 06:18:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Dennis Clarke <dclarke@blastwave.org>
Subject: FAILED: libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=108.160.241.186;
 envelope-from=dclarke@blastwave.org; helo=mail.oetec.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On FreeBSD 14.0 CURRENT amd64 everything seems to go swimmingly until :

[5679/6848] Compiling C object libqemu-arm-bsd-user.fa.p/bsd-user_mmap.c.o
[5680/6848] Compiling C object libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
FAILED: libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o
/usr/bin/cc -m64 -mcx16 -Ilibqemu-arm-bsd-user.fa.p -I. -I.. 
-Itarget/arm -I../target/arm -I../common-user/host/x86_64 
-I../bsd-user/include -Ibsd-user/freebsd -I../bsd-user/freebsd 
-I../bsd-user/host/x86_64 -Ibsd-user -I../bsd-user -I../bsd-user/arm 
-Iqapi -Itrace -Iui -Iui/shader -I/usr/local/include 
-I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include 
-fcolor-diagnostics -Wall -Winvalid-pch -std=gnu11 -O0 -g -iquote . 
-iquote /opt/bw/build/qemu -iquote /opt/bw/build/qemu/include -iquote 
/opt/bw/build/qemu/tcg/i386 -pthread -D_GNU_SOURCE 
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes 
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes 
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition 
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self 
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels 
-Wexpansion-to-defined -Wno-initializer-overrides 
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-string-plus-int 
-Wno-typedef-redefinition -Wno-tautological-type-limit-compare 
-Wno-psabi -Wno-gnu-variable-sized-type-not-at-end 
-fstack-protector-strong -m64 -g -O0 -fno-builtin -fPIE -DNEED_CPU_H 
'-DCONFIG_TARGET="arm-bsd-user-config-target.h"' 
'-DCONFIG_DEVICES="arm-bsd-user-config-devices.h"' -MD -MQ 
libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -MF 
libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o.d -o 
libqemu-arm-bsd-user.fa.p/bsd-user_signal.c.o -c ../bsd-user/signal.c
In file included from ../bsd-user/signal.c:27:
In file included from ../bsd-user/host/x86_64/host-signal.h:14:
In file included from /usr/include/vm/pmap.h:92:
/usr/include/machine/pmap.h:452:2: error: fields must have a constant 
size: 'variable length array in structure' extension will never be supported
         PV_CHUNK_HEADER
         ^
/usr/include/machine/pmap.h:448:12: note: expanded from macro 
'PV_CHUNK_HEADER'
         uint64_t                pc_map[_NPCM];  /* bitmap; 1 = free */  \
                                 ^
/usr/include/machine/pmap.h:456:2: error: fields must have a constant 
size: 'variable length array in structure' extension will never be supported
         PV_CHUNK_HEADER
         ^
/usr/include/machine/pmap.h:448:12: note: expanded from macro 
'PV_CHUNK_HEADER'
         uint64_t                pc_map[_NPCM];  /* bitmap; 1 = free */  \
                                 ^
2 errors generated.
ninja: build stopped: subcommand failed.
gmake[1]: *** [Makefile:165: run-ninja] Error 1
gmake[1]: Leaving directory '/opt/bw/build/qemu/build'
gmake: *** [GNUmakefile:11: all] Error 2

phobos#

Is there a trivial patch ?  Or perhaps try again using GCC and not 
LLVM/Clang?


-- 
Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken
GreyBeard and suspenders optional

