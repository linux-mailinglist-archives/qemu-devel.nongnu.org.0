Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0C68F173
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:57:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlsr-0002iw-50; Wed, 08 Feb 2023 09:57:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPlsU-0002hR-Us
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:57:01 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPlsR-0001IO-Bv
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:56:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id ba1so12968960wrb.5
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zL12JtWPJoj7GRfvjDzqGB8bnE9P5odUg4CleOA5C+M=;
 b=VcsquCYB6mwZ7fluvWnRm9UuPcgt40hPWSSqT3R6W6BUu/5da+SQIAGcbQxNTd8lnb
 stOGeMVq+glYM5XYfDesU6V9Eh/qSZR8n2PgmbuY8n9d/XPaGd9jG7Q9BpvPWQDG4mzv
 1GZXv+FUMC+3OVuN7MoMabsG08Al/lzsNc77OvswJlyENsZ951OMT8o5bFQFG0MYym7d
 +erYmfA4Pm6v56CS29wluHnROFM0jhmrqM9scp0RXzxo1JfQxT4XS+iC8z0Qj23faZhF
 3MgDAbbVXwGm9h/eKGsW6RshFSh3Ovu4rU7sWAmo2t61gEcWnilh0SLRQbpyL+A7Eezw
 n/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zL12JtWPJoj7GRfvjDzqGB8bnE9P5odUg4CleOA5C+M=;
 b=vo5I/W8Ei/YTMc7cLMhdzt/azCI6nId02QJcZVPB2Rdd2J0kNq5Cc/XxDx21BDQ0sq
 5NSzmnD8zONCjp9E8GwOFu1XmpcwaEMKA/fqs+Ncx61yPCVPy3ZNyHCxE3aYjei701Zo
 fCsR/GXOY25QWa6MPLyLNGpKkUziZX5gC9rjmZHQk85bD2byZN3V+M35ni9b8ijEgVGD
 dRGhYGbLkIvfl6S6YxXafGsAJtwUWGezxoTO143K+XR6qI9+QWGcClzGD7oEiGhqgqcR
 KpTQEzThuDyDtKlpapxWxTcXOW1dE/Jme/gFzENasN6Oj8TeR0VQwgWS3DIMT56AdvDf
 VQLQ==
X-Gm-Message-State: AO0yUKU+Vds+dwWJJSkuGF+dlcWPGidVRcSMUXmL/K1qF0YM0wFA+nEU
 gaKFWefmjyOyjkcZfbBbiRj4kg==
X-Google-Smtp-Source: AK7set8wQpCbxHGSM2KYctGeUl7XcrsmCpXmcFMD4O5ZnA2zLaykdX3QIGkewS3+lhCpOAGZrTrUwQ==
X-Received: by 2002:adf:e946:0:b0:2bd:edd6:ca3e with SMTP id
 m6-20020adfe946000000b002bdedd6ca3emr7077154wrn.2.1675868209703; 
 Wed, 08 Feb 2023 06:56:49 -0800 (PST)
Received: from [192.168.254.175] ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u2-20020adfdd42000000b002c3ec1fbc0bsm6681305wrm.94.2023.02.08.06.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:56:49 -0800 (PST)
Message-ID: <0853197a-6bf9-cd11-180c-7f110e32a812@linaro.org>
Date: Wed, 8 Feb 2023 15:56:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: rainier-bmc machine dumping core with latest qemu
Content-Language: en-US
To: Ninad Palsule <ninad@linux.vnet.ibm.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc'ing Emanuele.

On 8/2/23 15:26, Ninad Palsule wrote:
> Hello,
> 
> I am hitting core dump while running qemu with rainier-bmc machine. I 
> started
> hitting it after I rebased to latest qemu from master.
> Can someone please help?
> 
> /home/abc/dev/qemu/build/qemu-system-arm -M rainier-bmc -nographic \
>    -kernel 
> ./fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin \
>    -dtb 
> ./aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb \
>    -initrd ./obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz \
>    -drive 
> file=./obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2,if=sd,index=2 \
>    -append 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a'
> 
> 
> 
> [  OK  ] Started Journal Service.
>           Starting Flush Journal to Persistent Storage...
> [   45.873184] systemd-journald[156]: Received client request to flush 
> runtime journal.
> [   45.932231] systemd-journald[156]: File 
> /var/log/journal/97cd620eaa284caf980533438c7355c4/system.journal 
> corrupted or uncleanly shut down, renaming and replacing.
> qemu-system-arm: /home/abc/dev/qemu/block/block-gen.h:43: bdrv_poll_co: 
> Assertion `qemu_get_current_aio_context() == qemu_get_aio_context()' 
> failed.
> 
> Thread 3 "qemu-system-arm" received signal SIGABRT, Aborted.
> [Switching to Thread 0x7ffff6896640 (LWP 3898452)]
> __pthread_kill_implementation (no_tid=0, signo=6, 
> threadid=140737329587776) at ./nptl/pthread_kill.c:44
> 44  ./nptl/pthread_kill.c: No such file or directory.
> 
> 
> #6  0x00007ffff77e8e96 in __GI___assert_fail
>      (assertion=assertion@entry=0x55555603e798 
> "qemu_get_current_aio_context() ==
> qemu_get_aio_context()", file=file@entry=0x5555560aef28 
> "/home/abc/dev/qemu/block/block-gen.h", line=line@entry=43, 
> function=function@entry=0x5555560af080 <__PRETTY_FUNCTION__.9> 
> "bdrv_poll_co") at ./assert/assert.c:101
> #7  0x0000555555da91f9 in bdrv_poll_co (s=0x7ffff68957f0) at 
> /home/abc/dev/qemu/block/block-gen.h:43
> #8  bdrv_poll_co (s=0x7ffff68957f0) at 
> /home/abc/dev/qemu/block/block-gen.h:38
> #9  bdrv_getlength (bs=<optimized out>) at block/block-gen.c:310
> #10 0x0000555555e3558e in handle_aiocb_write_zeroes 
> (opaque=0x7fff419965f0) at ../block/file-posix.c:1741
> #11 0x0000555555ef80fd in worker_thread 
> (opaque=opaque@entry=0x5555569e2300) at ../util/thread-pool.c:110
> #12 0x0000555555ee3901 in qemu_thread_start (args=<optimized out>) at 
> ../util/qemu-thread-posix.c:505
> #13 0x00007ffff7843b43 in start_thread (arg=<optimized out>) at 
> ./nptl/pthread_create.c:442
> #14 0x00007ffff78d5a00 in clone3 () at 
> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
> 
> (gdb) p qemu_aio_context
> $1 = (AioContext *) 0x5555568b13d0
> 
> ---------------------------------------
> 
> 
> Reproduction steps:
> 
> 1. Clone and build qemu from https://github.com/qemu/qemu
> 2. Download following eBMC images
> 
> BLD_VERSION=20230205025034
> LINUX_VERSION="6.0.19+git0+67c9407e1f"
> wget 
> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz
> 
> wget 
> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb
> 
> wget 
> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin
> 
> wget 
> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2
> qemu-img resize 
> obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2 16G
> 
> 3. Run the qemu command as show at the start
> 
> 
> 


