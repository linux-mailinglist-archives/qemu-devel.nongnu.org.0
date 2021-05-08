Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FB9377425
	for <lists+qemu-devel@lfdr.de>; Sat,  8 May 2021 23:21:18 +0200 (CEST)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfUNx-0005u3-CS
	for lists+qemu-devel@lfdr.de; Sat, 08 May 2021 17:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@bsdio.com>) id 1lfUMc-0005B0-57
 for qemu-devel@nongnu.org; Sat, 08 May 2021 17:19:54 -0400
Received: from out01.mta.xmission.com ([166.70.13.231]:57616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@bsdio.com>) id 1lfUMa-0005dv-EV
 for qemu-devel@nongnu.org; Sat, 08 May 2021 17:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=bsdio.com;
 s=xmission; h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Date:Message-ID:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BY7xKFfQcoBCVZrIHXe/zzqqOINQ0LbwmKWmS+B9j4o=; b=mdYh+o7mszs7PFsNi12KR7IXpH
 hvupQzTrReVye+6YvzSWopsVWHoNC+FgkXWkiWK0zCs3ySck8jcnw79ojwtBGI5X7C8xaiu34xBsD
 dj2mI51gUMniC9vq/K7XmB/W2+MS7A8aOx6im91VRmz48tj8IIwNIZ2bjzxd41qRqgJ8=;
Received: from in02.mta.xmission.com ([166.70.13.52])
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <rebecca@bsdio.com>) id 1lfUMG-00AGYv-J1
 for qemu-devel@nongnu.org; Sat, 08 May 2021 15:19:32 -0600
Received: from mta5.zcs.xmission.com ([166.70.13.69])
 by in02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <rebecca@bsdio.com>) id 1lfUME-001PEG-U2
 for qemu-devel@nongnu.org; Sat, 08 May 2021 15:19:31 -0600
Received: from localhost (localhost [127.0.0.1])
 by mta5.zcs.xmission.com (Postfix) with ESMTP id A730A12815F7
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 15:19:30 -0600 (MDT)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta5.zcs.xmission.com
Received: from mta5.zcs.xmission.com ([127.0.0.1])
 by localhost (mta5.zcs.xmission.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dYKSdOlASrhR for <qemu-devel@nongnu.org>;
 Sat,  8 May 2021 15:19:30 -0600 (MDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net
 [174.52.16.57])
 by mta5.zcs.xmission.com (Postfix) with ESMTPSA id 7FA081281B59
 for <qemu-devel@nongnu.org>; Sat,  8 May 2021 15:19:30 -0600 (MDT)
To: qemu-devel@nongnu.org
From: Rebecca Cran <rebecca@bsdio.com>
Message-ID: <dc3e2961-1c3a-f3c8-3b0b-915ca84bf0e3@bsdio.com>
Date: Sat, 8 May 2021 15:19:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-XM-SPF: eid=1lfUME-001PEG-U2; ; ;
 mid=<dc3e2961-1c3a-f3c8-3b0b-915ca84bf0e3@bsdio.com>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=166.70.13.69; ; ; frm=rebecca@bsdio.com; ; ;
 spf=none
X-SA-Exim-Connect-IP: 166.70.13.69
X-SA-Exim-Mail-From: rebecca@bsdio.com
X-Spam-Virus: No
X-Spam-DCC: ; sa02 0; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;qemu-devel@nongnu.org
X-Spam-Relay-Country: 
X-Spam-Timing: total 339 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 4.3 (1.3%), b_tie_ro: 3.0 (0.9%), parse: 1.20
 (0.4%), extract_message_metadata: 4.9 (1.4%), get_uri_detail_list:
 1.02 (0.3%), tests_pri_-1000: 2.2 (0.6%), tests_pri_-950: 1.20 (0.4%),
 tests_pri_-900: 0.91 (0.3%), tests_pri_-90: 53 (15.5%), check_bayes:
 51 (15.1%), b_tokenize: 6 (1.8%), b_tok_get_all: 8 (2.4%),
 b_comp_prob: 1.96 (0.6%), b_tok_touch_all: 32 (9.6%), b_finish: 0.70
 (0.2%), tests_pri_0: 261 (76.9%), check_dkim_signature: 0.41 (0.1%),
 check_dkim_adsp: 38 (11.2%), poll_dns_idle: 33 (9.8%), tests_pri_10:
 2.2 (0.6%), tests_pri_500: 7 (1.9%), rewrite_mail: 0.00 (0.0%)
Subject: io_uring code appears to be broken
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Received-SPF: none client-ip=166.70.13.231; envelope-from=rebecca@bsdio.com;
 helo=out01.mta.xmission.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

I noticed that after installing liburing-devel-0.2-lp152.2.1.x86_64, a 
"./configure" causes support for io_uring to be enabled by default.

It appears to be broken, so I was wondering if it should be disabled 
unless explicitly enabled via configure?

I'm running openSUSE Leap 15.2.

[285/9281] Compiling C object libqemuutil.a.p/util_fdmon-io_uring.c.o
FAILED: libqemuutil.a.p/util_fdmon-io_uring.c.o
cc -Ilibqemuutil.a.p -I. -I.. -Isubprojects/libvhost-user 
-I../subprojects/libvhost-user -Iqapi -Itrace -Iui -Iui/shader 
-I/usr/include/p11-kit-1 -I/usr/include/glib-2.0 
-I/usr/lib64/glib-2.0/include -I/usr/include/libmount 
-I/usr/include/blkid -I/usr/include/uuid -I/usr/include/gio-unix-2.0 
-fdiagnostics-color=auto -pipe -Wall -Winvalid-pch -Werror -std=gnu99 
-O2 -g -isystem /home/jenkins/qemu/linux-headers -isystem linux-headers 
-iquote . -iquote /home/jenkins/qemu -iquote /home/jenkins/qemu/include 
-iquote /home/jenkins/qemu/disas/libvixl -iquote 
/home/jenkins/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE 
-D_FORTIFY_SOURCE=2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef 
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common 
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits 
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers 
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined 
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs 
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -MD 
-MQ libqemuutil.a.p/util_fdmon-io_uring.c.o -MF 
libqemuutil.a.p/util_fdmon-io_uring.c.o.d -o 
libqemuutil.a.p/util_fdmon-io_uring.c.o -c ../util/fdmon-io_uring.c
../util/fdmon-io_uring.c: In function ‘fdmon_io_uring_need_wait’:
../util/fdmon-io_uring.c:305:9: error: implicit declaration of function 
‘io_uring_sq_ready’; did you mean ‘io_uring_cq_ready’? 
[-Werror=implicit-function-declaration]
      if (io_uring_sq_ready(&ctx->fdmon_io_uring)) {
          ^~~~~~~~~~~~~~~~~
          io_uring_cq_ready
../util/fdmon-io_uring.c:305:9: error: nested extern declaration of 
‘io_uring_sq_ready’ [-Werror=nested-externs]


-- 
Rebecca Cran


