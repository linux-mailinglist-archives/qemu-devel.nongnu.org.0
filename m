Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8E6209E8D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:37:38 +0200 (CEST)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joR8K-0004uO-NX
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1joR7T-00045a-17
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:36:43 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:33848 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1joR7R-0003zG-9X
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:36:42 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 049544C8B8;
 Thu, 25 Jun 2020 12:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1593088598;
 x=1594902999; bh=Hol8A+7mhqPNEujYB/wQYZprZTa55ULr3k6wmfpb2f4=; b=
 A78g/DDFuJTCFiQwkLV8QjRItighylAGKbdJmFVNvOb5d5mrGPn5WIFezwyChVcj
 Nj7kvvOBRLQAqgMPMVCnsJWIEoOrMY2EKecqHiKyN8O3eiUSDp9NIoIf9OG9Etue
 Eh0Yueqs1SSf5sG9o8gOes24r9vZHAzKMoPIXyKZnhk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ho7Ak8TueITX; Thu, 25 Jun 2020 15:36:38 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DA7674C8BA;
 Thu, 25 Jun 2020 15:36:37 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 25
 Jun 2020 15:36:37 +0300
Date: Thu, 25 Jun 2020 15:36:37 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 6/8] i386: hvf: Drop hvf_reset_vcpu()
Message-ID: <20200625123637.GG25104@SPB-NB-133.local>
References: <20200624225850.16982-1-r.bolshakov@yadro.com>
 <20200624225850.16982-7-r.bolshakov@yadro.com>
 <ac800efc-c51d-e44c-de5c-cdef81d24dec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ac800efc-c51d-e44c-de5c-cdef81d24dec@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 06:51:35
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 25, 2020 at 12:31:49PM +0200, Paolo Bonzini wrote:
> On 25/06/20 00:58, Roman Bolshakov wrote:
> > +    uint64_t pdpte[4] = {0, 0, 0, 0};
> > +    int i;
> > +
> > +    /* Reset IA-32e mode guest (LMA) */
> > +    wvmcs(cpu->hvf_fd, VMCS_ENTRY_CTLS, 0);
> > +
> 
> Where is the place (if any...) that calls macvm_set_cr0 and
> macvm_set_cr4 from cpu_synchronize_*?  If you have such a place it
> should take care of resetting LMA as well.  Assuming that no entry
> controls are ever set is quite fragile.
> 

Hi Paolo,

Yes, there's such a place. post-init and post-reset invoke
hvf_put_registers() and the latter one calls hvf_put_segments().
hvf_put_segments() sets CR4 and CR0 via macvm_set_cr0/macvm_set_cr4
using the CR0/CR4 from env. So, the reset is relying on generic QEMU
CPUX86State now. LMA in EFER is reset there as well.

I don't know any alternative for PDPTE and VMCS Entry Controls in
CPUX86State, that's why I left explicit reset of the VMCS fields in
post-reset.

Is there an outstanding issue I'm missing?

Regards,
Roman

