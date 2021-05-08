Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840F37742B
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 23:42:49 +0200 (CEST)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfUim-0002pF-3o
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 17:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@bsdio.com>) id 1lfUhz-00029V-BG
 for qemu-devel@nongnu.org; Sat, 08 May 2021 17:41:59 -0400
Received: from out03.mta.xmission.com ([166.70.13.233]:46578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@bsdio.com>) id 1lfUhw-0003Lf-U3
 for qemu-devel@nongnu.org; Sat, 08 May 2021 17:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=bsdio.com;
 s=xmission; h=Subject:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:To:From:Sender:Reply-To:Cc:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=Vqo9CFLD9bVVLrVXwlmnImZHkq7YU4gwY6DOjZFq0AM=; b=SGrfrXBPcln5oxhPFTZETJS8A/
 XC7XJXIirgBdGMwHIiAVL91GjMeAjjczQdcnXhXqcTuM5u2BKQMEiBn4z6ZTJLINsPUFaeLPS5Ttc
 ewnJXiu2eZydVmSh3G/PJYJ1xnf6pRsJvr25tqQuw6S6lH2gCp4GxMfSdeKFHMf5ivgQ=;
Received: from in01.mta.xmission.com ([166.70.13.51])
 by out03.mta.xmission.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <rebecca@bsdio.com>) id 1lfUht-001Wr2-T9
 for qemu-devel@nongnu.org; Sat, 08 May 2021 15:41:54 -0600
Received: from mta5.zcs.xmission.com ([166.70.13.69])
 by in01.mta.xmission.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.87) (envelope-from <rebecca@bsdio.com>) id 1lfUhs-0004fj-VT
 for qemu-devel@nongnu.org; Sat, 08 May 2021 15:41:53 -0600
Received: from localhost (localhost [127.0.0.1])
 by mta5.zcs.xmission.com (Postfix) with ESMTP id 8891A1280FDA
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 15:41:52 -0600 (MDT)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta5.zcs.xmission.com
Received: from mta5.zcs.xmission.com ([127.0.0.1])
 by localhost (mta5.zcs.xmission.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RcDNl2Ifoaxt for <qemu-devel@nongnu.org>;
 Sat,  8 May 2021 15:41:52 -0600 (MDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net
 [174.52.16.57])
 by mta5.zcs.xmission.com (Postfix) with ESMTPSA id 61A691280EFF
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 15:41:52 -0600 (MDT)
From: Rebecca Cran <rebecca@bsdio.com>
To: qemu-devel@nongnu.org
References: <dc3e2961-1c3a-f3c8-3b0b-915ca84bf0e3@bsdio.com>
Message-ID: <91f215a3-2076-63ed-d311-a95cfdbc9046@bsdio.com>
Date: Sat, 8 May 2021 15:41:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <dc3e2961-1c3a-f3c8-3b0b-915ca84bf0e3@bsdio.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-XM-SPF: eid=1lfUhs-0004fj-VT; ; ;
 mid=<91f215a3-2076-63ed-d311-a95cfdbc9046@bsdio.com>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=166.70.13.69; ; ; frm=rebecca@bsdio.com; ; ;
 spf=none
X-SA-Exim-Connect-IP: 166.70.13.69
X-SA-Exim-Mail-From: rebecca@bsdio.com
X-Spam-DCC: ; sa05 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;qemu-devel@nongnu.org
X-Spam-Relay-Country: 
X-Spam-Timing: total 519 ms - load_scoreonly_sql: 0.09 (0.0%),
 signal_user_changed: 15 (3.0%), b_tie_ro: 13 (2.6%), parse: 1.76
 (0.3%), extract_message_metadata: 8 (1.5%), get_uri_detail_list: 2.1
 (0.4%), tests_pri_-1000: 4.0 (0.8%), tests_pri_-950: 1.96 (0.4%),
 tests_pri_-900: 1.51 (0.3%), tests_pri_-90: 190 (36.7%), check_bayes:
 188 (36.2%), b_tokenize: 11 (2.1%), b_tok_get_all: 10 (1.8%),
 b_comp_prob: 3.0 (0.6%), b_tok_touch_all: 160 (30.9%), b_finish: 1.16
 (0.2%), tests_pri_0: 279 (53.7%), check_dkim_signature: 0.95 (0.2%),
 check_dkim_adsp: 26 (5.1%), poll_dns_idle: 17 (3.2%), tests_pri_10:
 4.4 (0.8%), tests_pri_500: 9 (1.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: io_uring code appears to be broken
X-SA-Exim-Version: 4.2.1 (built Thu, 05 May 2016 13:38:54 -0600)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Received-SPF: none client-ip=166.70.13.233; envelope-from=rebecca@bsdio.com;
 helo=out03.mta.xmission.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Of course I realized I only have headers for version 0.2 and upstream is 
now up to 2.0, so it looks like I just need to update.

-- 
Rebecca Cran

On 5/8/21 3:19 PM, Rebecca Cran wrote:
> I noticed that after installing liburing-devel-0.2-lp152.2.1.x86_64, a 
> "./configure" causes support for io_uring to be enabled by default.
> 
> It appears to be broken, so I was wondering if it should be disabled 
> unless explicitly enabled via configure?
> 
> I'm running openSUSE Leap 15.2.
> 
> [285/9281] Compiling C object libqemuutil.a.p/util_fdmon-io_uring.c.o
> FAILED: libqemuutil.a.p/util_fdmon-io_uring.c.o
> cc -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libvhost-user 
> -I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader 
> -I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 
> -I/usr/lib64/glib-2.0/include -I/usr/include/libmount 
> -I/usr/include/blkid -I/usr/include/uuid -I/usr/include/gio-unix-2.0 
> -fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu99 
> -O2 -g -isystem /home/jenkins/qemu/linux-headers -isystem linux-headers 
> -iquote . -iquote /home/jenkins/qemu -iquote /home/jenkins/qemu/include 
> -iquote /home/jenkins/qemu/disas/libvixl -iquote 
> /home/jenkins/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE 
> -D_FORTIFY_SOURCE=2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef 
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common 
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits 
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers 
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined 
> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs 
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -MD 
> -MQ libqemuutil.a.p/util_fdmon-io_uring.c.o -MF 
> libqemuutil.a.p/util_fdmon-io_uring.c.o.d -o 
> libqemuutil.a.p/util_fdmon-io_uring.c.o -c ../util/fdmon-io_uring.c
> ../util/fdmon-io_uring.c: In function ‘fdmon_io_uring_need_wait’:
> ../util/fdmon-io_uring.c:305:9: error: implicit declaration of function 
> ‘io_uring_sq_ready’; did you mean ‘io_uring_cq_ready’? 
> [-Werror=implicit-function-declaration]
>      if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
>          ^~~~~~~~~~~~~~~~~
>          io_uring_cq_ready
> ../util/fdmon-io_uring.c:305:9: error: nested extern declaration of 
> ‘io_uring_sq_ready’ [-Werror=nested-externs]
> 
> 



