Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E625BA7E9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:15:15 +0200 (CEST)
Received: from localhost ([::1]:59546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ6VG-0002Mb-30
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@freepascal.org>)
 id 1oZ6PA-0004th-JX
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:08:57 -0400
Received: from mail.freepascal.org ([178.33.235.90]:56752)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pierre@freepascal.org>) id 1oZ6P7-0000LD-RH
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:08:55 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.freepascal.org (Postfix) with ESMTP id 73FFF180058
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 08:08:50 +0000 (UTC)
Received: from mail.freepascal.org ([127.0.0.1])
 by localhost (idefixng.freepascal.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N-_IuHwvsz0c for <qemu-devel@nongnu.org>;
 Fri, 16 Sep 2022 08:08:50 +0000 (UTC)
Received: from [192.168.50.107] (gw-ics.u-strasbg.fr [130.79.210.225])
 by mail.freepascal.org (Postfix) with ESMTPSA id 504E3180057
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 08:08:50 +0000 (UTC)
Message-ID: <68abfbc9-929b-92bd-071a-11e2dec7adc1@freepascal.org>
Date: Fri, 16 Sep 2022 10:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 21/30] Deprecate 32 bit big-endian MIPS
Content-Language: fr, en-US
To: qemu-devel@nongnu.org
References: <20220914155950.804707-1-alex.bennee@linaro.org>
 <20220914155950.804707-22-alex.bennee@linaro.org>
 <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
From: Pierre Muller <pierre@freepascal.org>
In-Reply-To: <8d64e197-7002-79fd-4e97-cc224099f26f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.33.235.90; envelope-from=pierre@freepascal.org;
 helo=mail.freepascal.org
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.816,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Pierre Muller <pierre@freepascal.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


   I am using gcc230 machine for the gcc compile farm.

   This is a big endian mips64 machine runnig Debian Buster.

When compiling the qemu 7.1.0 release source,
the generated binaries are 32-bit mips binaries,
and I did not find out how to generate a 64-bit versions
of the executables.

   As mips32 seems to still be the default arch that gcc uses,
I don't really understand the idea of depreciating big endian mips32.

Is this solely related to cross-compilation issues?

Pierre Muller


More information on gcc230:
muller@gcc230:~$ uname -a
Linux gcc230 4.9.79-UBNT_E300 #9 SMP Tue Jul 13 13:04:47 BST 2021 mips64 GNU/Linux
muller@gcc230:~$ cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
muller@gcc230:~$ gcc --version
gcc (Debian 8.3.0-6) 8.3.0
Copyright (C) 2018 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

muller@gcc230:~$ gcc -print-libgcc-file-name
/usr/lib/gcc/mips-linux-gnu/8/libgcc.a
muller@gcc230:~$ gcc -mabi=64 -print-libgcc-file-name
/usr/lib/gcc/mips-linux-gnu/8/64/libgcc.a


