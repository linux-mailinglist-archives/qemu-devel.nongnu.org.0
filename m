Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE845DD3E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:22:13 +0100 (CET)
Received: from localhost ([::1]:44600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGZg-00084u-Oh
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:22:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGXV-0005aG-Bo
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:19:58 -0500
Received: from [2a00:1450:4864:20::42d] (port=45627
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGXT-0006Z5-AL
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:19:57 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o13so12346387wrs.12
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=p1gck3gBX86/0ejR2FzhHQNW+IwlcQxuWkiRN1EdISM=;
 b=GVcnjSBWcZDPau66VFzsZhpOAZMA2o8PJp8XwVC1G6pXB7tcemxlJZMb7F8xNe6u1m
 phjZR6BNJH0kZoS+cmpL2TofK9IMyNkDMIt3KPlrSZ9pICjbVjujAyYVLleghiRFd5pP
 rVF8nGw1uWWFibJvdToza8K3iwXex/BWtCLD+xt6WAlkR6HuinPNRr5Wq8+WEzSc1jYy
 ysKbpY3o539Xx4KHtxeK3FsWLAKvx8u93cbHSwQRjdw9LEaZiPx6qtLpUhBa7ZGh17+h
 TXFGKCFHAUHu59QAbnrAdPiDPsso7iKVtflfjKhvOl9EotZCSnSih0f7PCSlVMabyNWV
 vJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=p1gck3gBX86/0ejR2FzhHQNW+IwlcQxuWkiRN1EdISM=;
 b=vTCblY8SKhj1OJ31eWF6Vs8bEpwLv7wmegUFPO6vGv+wPdxPrIkiAZdjzeJqj0gn2Z
 6TrgvLClTmsus6ZvDBeYmXajoyMwSpgvr6Hs3sGU2ymA/10cmtU85HrjG3NCh1Qb2Nal
 J6SZK+9Req9/jYBFKFUUoJkxNG1DNDmS7hjw/Vay2t3LKH6y68/38tXeJRr4U2DdAQRy
 F3E4gCiWCc14ldbcPfjUqaZS1OEH2SRIhrMp2zwAZDdut8xUR7c7iSgnHiVnY4oe3Mde
 rX0nQZeI2rJMR+d/QF2CsFJg+YyWobmSeyEi/r7sDygwz9levv8RtQ7pnARDOl9IpJOH
 +UrA==
X-Gm-Message-State: AOAM531QmFE36F61gktCJyyFr/ky+TR5mABpf6DcTpXr9jsg8lCGUVxv
 j6TAE/uVCxMnaD5T7Vr1ps1nDg==
X-Google-Smtp-Source: ABdhPJw3Ixe/3HNTVicsRMBewcAJipjv0+0uzdSvXWhy3LSkF632SNERHSHr6mLLXsMGekS2zyS6qw==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr7212772wrc.204.1637853593154; 
 Thu, 25 Nov 2021 07:19:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h16sm3223873wrm.27.2021.11.25.07.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:19:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 849ED1FF96;
 Thu, 25 Nov 2021 15:19:51 +0000 (GMT)
References: <20211124182246.67691-1-shashi.mallela@linaro.org>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH] hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
Date: Thu, 25 Nov 2021 15:18:45 +0000
In-reply-to: <20211124182246.67691-1-shashi.mallela@linaro.org>
Message-ID: <87v90gfejs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Shashi Mallela <shashi.mallela@linaro.org> writes:

> When Enabled bit is cleared in GITS_CTLR,ITS feature continues
> to be enabled.This patch fixes the issue.
>
> Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>


Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

in so far as it doesn't break the kvm-unit-tests but it also doesn't
solve the:

  irq 55: nobody cared (try booting with the "irqpoll" option)
  CPU: 0 PID: 9 Comm: ksoftirqd/0 Not tainted 5.15.1-ajb #67
  Hardware name: linux,dummy-virt (DT)
  Call trace:
   dump_backtrace+0x0/0x1ac
   show_stack+0x18/0x24
   dump_stack_lvl+0x68/0x84
   dump_stack+0x18/0x34
   __report_bad_irq+0x4c/0x168
   note_interrupt+0x278/0x420
   handle_irq_event+0x84/0x1a0
   handle_fasteoi_irq+0x148/0x214
   handle_domain_irq+0x60/0x90
   gic_handle_irq+0xb0/0x120
   call_on_irq_stack+0x2c/0x5c
   do_interrupt_handler+0x40/0x58
   el1_interrupt+0x30/0x50
   el1h_64_irq_handler+0x18/0x24
   el1h_64_irq+0x78/0x7c
   finish_task_switch.isra.0+0x174/0x290
   __schedule+0x5e0/0x674
   __cond_resched+0x24/0x50
   run_ksoftirqd+0x44/0x5c
   smpboot_thread_fn+0x154/0x180
   kthread+0x118/0x130
   ret_from_fork+0x10/0x20
  handlers:
  [<0000000050cdc74a>] vring_interrupt
  Disabling IRQ #55

that is being seen on newer kernels.

--=20
Alex Benn=C3=A9e

