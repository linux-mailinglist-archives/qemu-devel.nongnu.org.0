Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83329314D19
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:34:19 +0100 (CET)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9QLa-0003po-I8
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:34:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9QKR-0002wb-9U; Tue, 09 Feb 2021 05:33:07 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:41414 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9QKP-0004ee-Nt; Tue, 09 Feb 2021 05:33:07 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id ACF6A411FB;
 Tue,  9 Feb 2021 10:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1612866782;
 x=1614681183; bh=Z1rX4ofjHHi6YocKMEYxlryyHtoT1Jr0DSWwPD6M6uI=; b=
 k3PLkx4iSOFLm8N+kXdvO7rDx/qsKJp2P7eH7fcJeN2MIGECO7hYCLm10oZxYJFj
 HYormNVL4z8TThd3raJkHIa1U7wbZcM31kgcXlxSsxBytc46nLbRy39/IeUBDuZM
 g39GOBDxqV19L+5JTYNf2AD7hNcBwlu0FbjhZUMPuBk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LhqGGvzIZVIp; Tue,  9 Feb 2021 13:33:02 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 89EC44128C;
 Tue,  9 Feb 2021 13:33:02 +0300 (MSK)
Received: from localhost (172.17.128.60) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 13:33:02 +0300
Date: Tue, 9 Feb 2021 13:33:01 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH] target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT
Message-ID: <YCJk3dGc2xnJdFXG@SPB-NB-133.local>
References: <20210113205323.33310-1-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210113205323.33310-1-yaroshchuk2000@gmail.com>
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 13, 2021 at 11:53:23PM +0300, yaroshchuk2000@gmail.com wrote:
> From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> 
> Some guests (ex. Darwin-XNU) can attemp to read this MSR to retrieve and
> validate CPU topology comparing it to ACPI MADT content
> 
> MSR description from Intel Manual:
> 35H: MSR_CORE_THREAD_COUNT: Configured State of Enabled Processor Core
>   Count and Logical Processor Count
> 
> Bits 15:0 THREAD_COUNT The number of logical processors that are
>   currently enabled in the physical package
> 
> Bits 31:16 Core_COUNT The number of processor cores that are currently
>   enabled in the physical package
> 
> Bits 63:32 Reserved
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>  target/i386/cpu.h         | 2 ++
>  target/i386/hvf/x86_emu.c | 5 +++++
>  2 files changed, 7 insertions(+)
> 

Queued, thanks!

-Roman

