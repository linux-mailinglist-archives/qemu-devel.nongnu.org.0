Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF6314D17
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:33:59 +0100 (CET)
Received: from localhost ([::1]:37846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9QLG-0003RI-V0
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9QK9-0002cD-1k; Tue, 09 Feb 2021 05:32:49 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:41358 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9QK7-0004XF-2d; Tue, 09 Feb 2021 05:32:48 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 315F5412E7;
 Tue,  9 Feb 2021 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1612866756;
 x=1614681157; bh=mMH9oc68+P8caVXKBQPjpOf4ecYesSWz8JCBY4Ce4f0=; b=
 cu1IoEiI8vQ6lOBfs89+qfznkIA4qKc6XCUuOAm3xXPzyZj/u0hl5SyA6hIbO4Cm
 EnUkcpqzdG8JmgjSQbExFGPQnFOwDYA7tGihAcwPTYrK56uszySntHAlg7GrDgue
 tjEaAgBzqg7RSsDx/pD7nDgc4lNw15iWKcvlW3rJBlA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7kiAKMR0C_u; Tue,  9 Feb 2021 13:32:36 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 817E541281;
 Tue,  9 Feb 2021 13:32:35 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 13:32:35 +0300
Date: Tue, 9 Feb 2021 13:32:34 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v3] target/i386/hvf: add vmware-cpuid-freq cpu feature
Message-ID: <YCJkwsLxtWuIwqU0@SPB-NB-133.local>
References: <20210114194703.134333-1-yaroshchuk2000@gmail.com>
 <20210122150518.3551-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210122150518.3551-1-yaroshchuk2000@gmail.com>
X-Originating-IP: [172.17.128.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 dirty@apple.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 06:05:18PM +0300, yaroshchuk2000@gmail.com wrote:
> From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> 
> For `-accel hvf` cpu_x86_cpuid() is wrapped with hvf_cpu_x86_cpuid() to
> add paravirtualization cpuid leaf 0x40000010
> https://lkml.org/lkml/2008/10/1/246
> 
> Leaf 0x40000010, Timing Information:
> EAX: (Virtual) TSC frequency in kHz.
> EBX: (Virtual) Bus (local apic timer) frequency in kHz.
> ECX, EDX: RESERVED (Per above, reserved fields are set to zero).
> 
> On macOS TSC and APIC Bus frequencies can be readed by sysctl call with
> names `machdep.tsc.frequency` and `hw.busfrequency`
> 
> This options is required for Darwin-XNU guest to be synchronized with
> host
> 
> Leaf 0x40000000 not exposes HVF leaving hypervisor signature empty
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>  target/i386/hvf/hvf.c | 96 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
> 

Queued, thanks!

-Roman

