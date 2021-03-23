Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECCA3465B1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 17:53:19 +0100 (CET)
Received: from localhost ([::1]:51312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkHO-0004pw-Ap
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 12:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOjL3-0006Ta-CM
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:53:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lOjL1-00044Y-JP
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616514778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kqSbhYbabt5zE7Rqn1MwXE91RmgoMPXsixPcdC2bOqY=;
 b=YKL9cDLaI+0M/pePIFSwYcdnPa1A3BKFPYVg9tbWBNebItlfq92ZuqvIe7W9T4DWEC0qzb
 sS7FMIqxkIRj0HnLBj2aowZHBnkrZ+Kyvechpc50sb06X83ZhfqPt0ZESXp4pt8ezyLP65
 hC3MJJ63CgjbfsGqTV86CPp9syRBS/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-iBeyBsF_NF2ITIG542cIFg-1; Tue, 23 Mar 2021 11:52:55 -0400
X-MC-Unique: iBeyBsF_NF2ITIG542cIFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64E53800D53;
 Tue, 23 Mar 2021 15:52:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5997A196E3;
 Tue, 23 Mar 2021 15:52:53 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BC551809C82;
 Tue, 23 Mar 2021 15:52:53 +0000 (UTC)
Date: Tue, 23 Mar 2021 11:52:53 -0400 (EDT)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1646734908.41328831.1616514773000.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAFEAcA_j3iBiwxNCN7AdDUv6rTGTn_gAzQ9E-h2dG9bmk3ez_g@mail.gmail.com>
References: <CAFEAcA_j3iBiwxNCN7AdDUv6rTGTn_gAzQ9E-h2dG9bmk3ez_g@mail.gmail.com>
Subject: Re: 'make check-acceptance' odd error: "'bytes' object has no
 attribute 'encode'"
MIME-Version: 1.0
X-Originating-IP: [10.10.119.39, 10.4.195.26]
Thread-Topic: 'make check-acceptance' odd error: "'bytes' object has no
 attribute 'encode'"
Thread-Index: ch9wrRDzOb2ceBcJEjhyznxbHR+Zyw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



----- Original Message -----
> From: "Peter Maydell" <peter.maydell@linaro.org>
> To: "QEMU Developers" <qemu-devel@nongnu.org>
> Cc: "Cleber Rosa" <crosa@redhat.com>
> Sent: Tuesday, March 23, 2021 11:23:30 AM
> Subject: 'make check-acceptance' odd error: "'bytes' object has no attribute 'encode'"
> 
> I just got this running 'make check-acceptance': does it
> ring a bell with anybody?
> 
> [etc]
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_4k
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_16k_up
> Fetching asset from
> tests/acceptance/replay_kernel.py:ReplayKernelSlow.test_mips_malta32el_nanomips_64k_dbg
> Fetching asset from
> tests/acceptance/reverse_debugging.py:ReverseDebugging_AArch64.test_aarch64_virt
> Fetching asset from
> tests/acceptance/virtio-gpu.py:VirtioGPUx86.test_virtio_vga_virgl
> Error running method "pre_tests" of plugin "fetchasset": 'bytes'
> object has no attribute 'encode'
> JOB ID     : 71b2d5569d9ccc8b68957d3ad2b2026bea437d66
> JOB LOG    :
> /home/petmay01/linaro/qemu-from-laptop/qemu/build/clang/tests/results/job-2021-03-23T15.09-71b2d55/job.log
>  (001/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_tcg:
> PASS (465.84 s)
>  (002/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_i440fx_kvm:
> PASS (27.46 s)
>  (003/142) tests/acceptance/boot_linux.py:BootLinuxX8664.test_pc_q35_tcg:
> PASS (99.43 s)
> [etc]
> 
> thanks
> -- PMM
> 
> 

Yes.  But it's harmless, and it has been fixed here:

  https://github.com/avocado-framework/avocado/pull/4416

It will go away on the next Avocado version bump (post 6.0).

Regards,
- Cleber.


