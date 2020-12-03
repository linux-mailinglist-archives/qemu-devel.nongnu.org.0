Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00D2CCEA3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 06:27:05 +0100 (CET)
Received: from localhost ([::1]:35778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkh8y-00079x-Dk
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 00:27:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkh7f-0006bI-Ak; Thu, 03 Dec 2020 00:25:43 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:40422 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kkh7d-0005mv-8b; Thu, 03 Dec 2020 00:25:43 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8B57C413A8;
 Thu,  3 Dec 2020 05:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1606973138;
 x=1608787539; bh=2/IhSf7FyQQ55bTxTloFB8s0JWYvvdECkjYzOAmPO6Y=; b=
 It6RAH58vGCaZRoOC7U7XO1go2H5YKO4tjN0la4pqL7j0mSJI0HZ5X5T9Y2MW4hQ
 rCJ1UAZH3z91W2s9srhZvScOamlfMveDOkrLpyEWfyQw6qtvCp5vsJsiDQkGKXwQ
 D/lvuGi63EVhpIRoWrjFyT8C7Xh/rxZkFu3roR3W3eM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C1Hpi2AiGzdL; Thu,  3 Dec 2020 08:25:38 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7CA1C41277;
 Thu,  3 Dec 2020 08:25:38 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Dec
 2020 08:25:38 +0300
Date: Thu, 3 Dec 2020 08:25:57 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v3 07/10] arm: Add Hypervisor.framework build target
Message-ID: <20201203052557.GC82480@SPB-NB-133.local>
References: <20201202190408.2041-1-agraf@csgraf.de>
 <20201202190408.2041-8-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201202190408.2041-8-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 08:04:05PM +0100, Alexander Graf wrote:
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 
> ---
> 
> v1 -> v2:
> 
>   - Fix build on 32bit arm
> ---
>  meson.build                | 11 ++++++++++-
>  target/arm/hvf/meson.build |  3 +++
>  target/arm/meson.build     |  2 ++
>  3 files changed, 15 insertions(+), 1 deletion(-)
>  create mode 100644 target/arm/hvf/meson.build
> 
> diff --git a/meson.build b/meson.build
> index 2a7ff5560c..bff3fe7089 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -74,16 +74,25 @@ else
>  endif
>  
>  accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> +
> +if cpu in ['x86', 'x86_64']
> +  hvf_targets = ['i386-softmmu', 'x86_64-softmmu']

i386-softmmu had issues with hvf. Perhaps better to leave it disabled
for the target as it was before.

Thanks,
Roman

> +elif cpu in ['aarch64']
> +  hvf_targets = ['aarch64-softmmu']
> +else
> +  hvf_targets = []
> +endif
> +
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i368 emulator provides xenpv machine type for multiple architectures
>    accelerator_targets += {
>      'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': hvf_targets,
>    }
>  endif
>  if cpu in ['x86', 'x86_64']
>    accelerator_targets += {
>      'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
> -    'CONFIG_HVF': ['x86_64-softmmu'],
>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>    }
>  endif
> diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
> new file mode 100644
> index 0000000000..855e6cce5a
> --- /dev/null
> +++ b/target/arm/hvf/meson.build
> @@ -0,0 +1,3 @@
> +arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
> +  'hvf.c',
> +))
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index f5de2a77b8..95bebae216 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -56,5 +56,7 @@ arm_softmmu_ss.add(files(
>    'psci.c',
>  ))
>  
> +subdir('hvf')
> +
>  target_arch += {'arm': arm_ss}
>  target_softmmu_arch += {'arm': arm_softmmu_ss}
> -- 
> 2.24.3 (Apple Git-128)
> 

