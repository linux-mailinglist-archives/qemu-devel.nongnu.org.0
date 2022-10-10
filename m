Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0AC5F98DA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 09:00:48 +0200 (CEST)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohmmF-0002f3-TF
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 03:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dclarke@blastwave.org>)
 id 1ohmjK-0008QA-5r
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 02:57:38 -0400
Received: from mail.oetec.com ([108.160.241.186]:50510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dclarke@blastwave.org>)
 id 1ohmjF-0004cZ-7F
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 02:57:37 -0400
X-oetec-MailScanner-From: dclarke@blastwave.org
X-oetec-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-3.097, required 6, autolearn=not spam, ALL_TRUSTED -1.00,
 BAYES_00 -1.90, DKIM_SIGNED 0.10, DKIM_VALID -0.10,
 DKIM_VALID_AU -0.10, DKIM_VALID_EF -0.10, URIBL_BLOCKED 0.00,
 URIBL_DBL_BLOCKED_OPENDNS 0.00, URIBL_ZEN_BLOCKED_OPENDNS 0.00)
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-ID: 29A6upUP030702
X-oetec-MailScanner-Information: Please contact oetec for more information
Received: from [172.16.35.2]
 (cpeac202e7325b3-cmac202e7325b0.cpe.net.cable.rogers.com [99.253.170.241])
 (authenticated bits=0)
 by mail.oetec.com (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 29A6upUP030702
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 02:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blastwave.org;
 s=default; t=1665385013;
 bh=LRyxiezqI2ypgrBIF0iyxWZd6sPmTBWFKMlgUQYB5SY=;
 h=Date:To:From:Subject:From;
 b=oDk/xQeMhK6E5OriKBfsXhfkjYDSDML9+TzCzAeqviHbDiGu0VB2XfCqfTfThHfKU
 kIQ3/85YPGIqFuBJftWIa4eyQ+Q0pu/N8hjGV9fIWZPbxBQhe035w2K2F+JcqqxXSp
 pfDBH26WfEE2G8aYWIJmNWm6eTAnMyoFeKlRsGZFJHTmT94bXyLVRSiqpojTppSvvg
 1Uwo7FmNw1X19Xv3aMtODjenPRWLal2eRumQd2m673yR7AhReMArnCQkMLlQIlPd0K
 nYVNpdQWmQbk3uopuE0PJvcJEenKczhbWJ+PlhWWo4gx1XtyrIoM9tY2+ToVb/LKha
 hWqUa82F1E+kg==
Message-ID: <841ab433-7dcd-2cf3-de7a-eb8b890f1652@blastwave.org>
Date: Mon, 10 Oct 2022 06:56:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: qemu-devel@nongnu.org
Content-Language: en-US
From: Dennis Clarke <dclarke@blastwave.org>
Subject: total fail on FreeBSD 14.0 amd64 regardless of compiler
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


re: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg01249.html

Using GCC 12 is even worse :

[2040/6841] Compiling C object qemu-system-aarch64.p/softmmu_main.c.o
[2041/6841] Linking target qemu-system-aarch64
FAILED: qemu-system-aarch64
/usr/local/bin/g++12 -m64 -mcx16 @qemu-system-aarch64.rsp
/usr/local/bin/ld: libqemuutil.a.p/util_filemonitor-inotify.c.o: 
undefined reference to symbol 'inotify_init1'
/usr/local/bin/ld: /usr/local/lib/libinotify.so.0: error adding symbols: 
DSO missing from command line
collect2: error: ld returned 1 exit status
ninja: build stopped: subcommand failed.
gmake[1]: *** [Makefile:165: run-ninja] Error 1
gmake[1]: Leaving directory '/opt/bw/build/qemu/build'
gmake: *** [GNUmakefile:11: all] Error 2

So whats the magic here ?


-- 
Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken
GreyBeard and suspenders optional

