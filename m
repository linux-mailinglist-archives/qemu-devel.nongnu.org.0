Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9017C24D468
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 13:47:22 +0200 (CEST)
Received: from localhost ([::1]:50358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k95Vx-0001wV-J2
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 07:47:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k952i-0006W6-Ri
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 07:17:08 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:58988 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1k952g-0008Cm-RR
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 07:17:08 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 93C2856264;
 Fri, 21 Aug 2020 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1598008621; x=1599823022; bh=W149S61d3o6XZyF/c5JGKc
 FUvXKsErmA+vn1ucDWuqQ=; b=SNx5az2mwiL/cEAp+1rFa2e5/AnDn/h3ErJbIu
 rvuCbmZck7rLTd3JKHFKyCpf4+PFyO8z6PDg6cKEnTK5tmzOehfp4BIXMDF0XlX1
 B0XVU1DykCK5DSvIks29zWGYSFailW/AwEwpRyttc5SfOGUIBZDF87VufIVuZDkK
 HJQ9Y=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIMkmO2D7TN2; Fri, 21 Aug 2020 14:17:01 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 50D6B56774;
 Fri, 21 Aug 2020 14:17:01 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 21
 Aug 2020 14:17:00 +0300
Date: Fri, 21 Aug 2020 14:17:00 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 19/58] hvf: Move HVFState typedef to hvf.h
Message-ID: <20200821111700.GB89922@SPB-NB-133.local>
References: <20200820001236.1284548-1-ehabkost@redhat.com>
 <20200820001236.1284548-20-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200820001236.1284548-20-ehabkost@redhat.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 06:53:56
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Daniel P.
 Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 19, 2020 at 08:11:57PM -0400, Eduardo Habkost wrote:
> Move typedef closer to the type check macros, to make it easier
> to convert the code to OBJECT_DEFINE_TYPE() in the future.
> 
> Reviewed-by: Daniel P. Berrang� <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2: none
> 
> ---
> Cc: Cameron Esfahani <dirty@apple.com>
> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: qemu-devel@nongnu.org
> ---
>  include/sysemu/hvf.h       | 1 +
>  target/i386/hvf/hvf-i386.h | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
> index d3bed80ea8..760d6c79a2 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -35,6 +35,7 @@ void hvf_vcpu_destroy(CPUState *);
>  
>  #define TYPE_HVF_ACCEL ACCEL_CLASS_NAME("hvf")
>  
> +typedef struct HVFState HVFState;
>  #define HVF_STATE(obj) \
>      OBJECT_CHECK(HVFState, (obj), TYPE_HVF_ACCEL)
>  
> diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
> index ef20c73eca..e0edffd077 100644
> --- a/target/i386/hvf/hvf-i386.h
> +++ b/target/i386/hvf/hvf-i386.h
> @@ -57,13 +57,13 @@ typedef struct hvf_vcpu_caps {
>      uint64_t vmx_cap_preemption_timer;
>  } hvf_vcpu_caps;
>  
> -typedef struct HVFState {
> +struct HVFState {
>      AccelState parent;
>      hvf_slot slots[32];
>      int num_slots;
>  
>      hvf_vcpu_caps *hvf_caps;
> -} HVFState;
> +};
>  extern HVFState *hvf_state;
>  
>  void hvf_set_phys_mem(MemoryRegionSection *, bool);
> -- 
> 2.26.2
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

But it seems the accel misuses QOM as pointed out in the other thread.
I also don't see a place where HVF_STATE is invoked... ah, you're
replacing it later in "Use DECLARE_*CHECKER* macros".

Thanks,
Roman

