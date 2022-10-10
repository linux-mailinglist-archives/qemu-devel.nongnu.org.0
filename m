Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E51285F9A16
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 09:39:28 +0200 (CEST)
Received: from localhost ([::1]:46068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnNn-00032x-Gx
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 03:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dclarke@blastwave.org>)
 id 1ohnE1-0004wU-TS
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:29:22 -0400
Received: from mail.oetec.com ([108.160.241.186]:50706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dclarke@blastwave.org>)
 id 1ohnDz-0001Cw-Ul
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:29:21 -0400
X-oetec-MailScanner-From: dclarke@blastwave.org
X-oetec-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=-7.031, required 6, autolearn=not spam, ALL_TRUSTED -1.00,
 BAYES_00 -1.90, DKIM_SIGNED 0.10, DKIM_VALID -0.10,
 DKIM_VALID_AU -0.10, DKIM_VALID_EF -0.10, NICE_REPLY_A -3.93,
 URIBL_BLOCKED 0.00, URIBL_DBL_BLOCKED_OPENDNS 0.00,
 URIBL_ZEN_BLOCKED_OPENDNS 0.00)
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-ID: 29A7SaiO000371
X-oetec-MailScanner-Information: Please contact oetec for more information
Received: from [172.16.35.2]
 (cpeac202e7325b3-cmac202e7325b0.cpe.net.cable.rogers.com [99.253.170.241])
 (authenticated bits=0)
 by mail.oetec.com (8.15.2/8.15.2/Debian-8+deb9u1) with ESMTPSA id
 29A7SaiO000371
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 10 Oct 2022 03:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blastwave.org;
 s=default; t=1665386918;
 bh=dRtWWi3l3sxXjtZle7aprXylrJ8DjLwnIv/CwHQ0nmc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KzMToHV+5gYi6K77usTHT9AK4wutSa6MewaID+bT0/cyN6N0P9FVm4hvpHb9l92di
 R9+3o3dSk+S17G+F+6IW244yahMFj0nGB/9kVqpASW/xVlG1Q883PTzgDAogMbJ2OG
 uHsR0Vl/CXUtrUNhxjCZh5RgS5y1Nka1AM6fu90kPG4zZ6w9wjQdswZ8b28h9gOfm8
 exsA+c6UyQ3yeNAjSLS8658Z2LIoPgQ7RjGlcuTYRJJB9jXHDZ9VJbvnVmZymYJr6s
 uSfnCD7mOvHbfWFkuFRPNhKNNscRayRY97T4OzPqdJpDEa8Be/sUJgYM+A05znVreB
 nvn924neNzQBQ==
Message-ID: <7440865d-902a-b230-928f-8c6d72919f33@blastwave.org>
Date: Mon, 10 Oct 2022 07:28:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: total fail on FreeBSD 14.0 amd64 regardless of compiler
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>
References: <841ab433-7dcd-2cf3-de7a-eb8b890f1652@blastwave.org>
 <e84ed09e-78c4-ac7c-19ef-f53ede3330e4@redhat.com>
From: Dennis Clarke <dclarke@blastwave.org>
In-Reply-To: <e84ed09e-78c4-ac7c-19ef-f53ede3330e4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=108.160.241.186;
 envelope-from=dclarke@blastwave.org; helo=mail.oetec.com
X-Spam_score_int: -82
X-Spam_score: -8.3
X-Spam_bar: --------
X-Spam_report: (-8.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.934,
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

On 10/10/22 07:21, Thomas Huth wrote:
> On 10/10/2022 08.56, Dennis Clarke wrote:
>>
>> re: 
>> https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg01249.html
>>
>> Using GCC 12 is even worse :
>>
>> [2040/6841] Compiling C object qemu-system-aarch64.p/softmmu_main.c.o
>> [2041/6841] Linking target qemu-system-aarch64
>> FAILED: qemu-system-aarch64
>> /usr/local/bin/g++12 -m64 -mcx16 @qemu-system-aarch64.rsp
>> /usr/local/bin/ld: libqemuutil.a.p/util_filemonitor-inotify.c.o: 
>> undefined reference to symbol 'inotify_init1'
> 
> Now that sounds like the detection for inotify_init1 did not work
> right in the meson.build script...
> 
> Looking at meson.build:
> 
> config_host_data.set('CONFIG_INOTIFY1',
>                       cc.has_header_symbol('sys/inotify.h', 
> 'inotify_init1'))
> 
> ... do you have such a "inotify.h" header on your FreeBSD system
> and does it contain an inotify_init1 function?
> 
>   Thomas

Let's see :

phobos#
phobos# uname -apKU
FreeBSD phobos 14.0-CURRENT FreeBSD 14.0-CURRENT #14 
main-n258340-497cdf9673e: Sun Oct  2 09:51:14 GMT 2022 
root@phobos:/usr/obj/usr/src/amd64.amd64/sys/GENERIC amd64 amd64 1400072 
1400072
phobos# ls -lap /usr/local/include/sys/inotify.h
-rw-r--r--  1 root  wheel  4540 Oct  4 01:24 
/usr/local/include/sys/inotify.h
phobos#
phobos# grep 'inotify_init1' /usr/local/include/sys/inotify.h
/* Flags for the parameter of inotify_init1. */
int inotify_init1 (int flags) __THROW;
phobos#

Looks to be there.


-- 
Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken
GreyBeard and suspenders optional

