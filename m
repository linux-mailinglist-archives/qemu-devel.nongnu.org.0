Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3B34EA90
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 16:40:12 +0200 (CEST)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRFXP-0004Xu-BN
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 10:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lRFSj-0008T3-Nr
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:35:26 -0400
Received: from forward3-smtp.messagingengine.com ([66.111.4.237]:53051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lRFSg-0003GT-D1
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 10:35:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id E547C194135B;
 Tue, 30 Mar 2021 10:35:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 30 Mar 2021 10:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=an9CjP
 Eia3NFZo9+jaQ9oH7WEovvSvPWesUXDrZMjmM=; b=nWgf5EWn2oHIDO/xVHuo3R
 peRvmVA3MCPzt3B6P1lUJcAAtiUn03/yxpt5QT1vrf1mS2dOVG/CxIxbClNmYcND
 aLL6mAKjnOk0DuGl+LUO64km9ConaRDNZ5eJD+TUXz7dJYzUIR7HkQ0N5nd7aF2K
 cFP7xy/rapVstdJ6VCrVgEmqQ5lLRbEf6vYd/WFBUlQ9X8eLwBR++CB2USxY432f
 s+98MqQlIHBmjaEBjDD0ZC5DllNgpGWqkSSHYH2MOxHikj1oqaRzkcpPxReTtmXB
 v00baCywqOKGO1sjMgrRu31585D/wpMip0ezbHX94XJJTQQYEr1s0CgQX1Jvxo4A
 ==
X-ME-Sender: <xms:IzdjYHn1sPQuDOoTwOrRRMduInmRqhOnO4aBNXwQJLfI-Yw8g-Bggg>
 <xme:IzdjYK1WZa1wqSaVDuxU4_IganmUNNqD4VcweJMOrNDihlRVzizUFC1wC56C0i8nV
 _QOOyU87Ilq0rcVAPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeitddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgesthdtredttddttdenucfhrhhomhepffgrvhhiugcu
 gfgumhhonhgushhonhcuoegumhgvsegumhgvrdhorhhgqeenucggtffrrghtthgvrhhnpe
 fhkeeguedtvdegffffteehjedvjeeitefgfefgffdugeffffegudehgeetgeelkeenucfk
 phepkedurddukeejrddviedrvdefkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegumhgvsegumhgvrdhorhhg
X-ME-Proxy: <xmx:IzdjYNqt4cSUU60Gg4DKksNX6g2QLwdLnReo-NrVseqf26kSVchF7w>
 <xmx:IzdjYPlNJCwO3NbS4ai-qIBmw-gqq-PkdIo8X1r7h3_RB6plntwfAw>
 <xmx:IzdjYF2tUnWxMTelBq5WUPkiaknwWvexeQnCbo-pl0SmJFVRIha9sQ>
 <xmx:JDdjYPqqGskD_cDpYRAj4TyernT9tA1iOe6bCmXNGdu7-O5dmSYI9Q>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 138CF1080063;
 Tue, 30 Mar 2021 10:35:15 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id c97b5c0f;
 Tue, 30 Mar 2021 14:35:13 +0000 (UTC)
To: Vitaly Kuznetsov <vkuznets@redhat.com>, qemu-devel@nongnu.org, Paolo
 Bonzini <pbonzini@redhat.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: Re: [PATCH] i386: Make 'hv-reenlightenment' require explicit
 'tsc-frequency' setting
In-Reply-To: <20210330123603.284354-1-vkuznets@redhat.com>
References: <20210330123603.284354-1-vkuznets@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Tue, 30 Mar 2021 15:35:13 +0100
Message-ID: <cunpmzghfq6.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.237; envelope-from=dme@dme.org;
 helo=forward3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-03-30 at 14:36:03 +02, Vitaly Kuznetsov wrote:

> Commit 561dbb41b1d7 "i386: Make migration fail when Hyper-V reenlightenment
> was enabled but 'user_tsc_khz' is unset" forbade migrations with when guest
> has opted for reenlightenment notifications but 'tsc-frequency' wasn't set
> explicitly on the command line. This works but the migration fail late and

s/fail/fails/

> this may come as an unpleasant surprise. To make things more explicit,
> require 'tsc-frequency=' on the command line when 'hv-reenlightenment' was
> enabled. Make the change affect 6.0+ machine types only to preserve
> previously-valid configurations valid.

s/ valid//

>
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  docs/hyperv.txt   |  1 +
>  hw/i386/pc.c      |  1 +
>  target/i386/cpu.c | 23 +++++++++++++++++++++--
>  target/i386/cpu.h |  1 +
>  4 files changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/docs/hyperv.txt b/docs/hyperv.txt
> index e53c581f4586..5b02d341ab25 100644
> --- a/docs/hyperv.txt
> +++ b/docs/hyperv.txt
> @@ -165,6 +165,7 @@ emulate TSC accesses after migration so 'tsc-frequency=' CPU option also has to
>  be specified to make migration succeed. The destination host has to either have
>  the same TSC frequency or support TSC scaling CPU feature.
>  
> +Requires: tsc-frequency
>  Recommended: hv-frequencies
>  
>  3.16. hv-evmcs
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25a031e..47b79e949ad7 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -98,6 +98,7 @@
>  
>  GlobalProperty pc_compat_5_2[] = {
>      { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
> +    { TYPE_X86_CPU, "x-hv-reenlightenment-requires-tscfreq", "off"},
>  };
>  const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
>  
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 6b3e9467f177..751636bafac5 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6647,10 +6647,23 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>      }
>  }
>  
> -static void x86_cpu_hyperv_realize(X86CPU *cpu)
> +static void x86_cpu_hyperv_realize(X86CPU *cpu, Error **errp)
>  {
> +    CPUX86State *env = &cpu->env;
>      size_t len;
>  
> +    /*
> +     * Reenlightenment requires explicit 'tsc-frequency' setting for successful
> +     * migration (see hyperv_reenlightenment_post_load(). As 'hv-passthrough'

s/post_load()/post_load())/

> +     * mode is not migratable, we can loosen the restriction.
> +     */
> +    if (hyperv_feat_enabled(cpu, HYPERV_FEAT_REENLIGHTENMENT) &&
> +        !cpu->hyperv_passthrough && !env->user_tsc_khz &&
> +        cpu->hyperv_reenlightenment_requires_tscfreq) {
> +        error_setg(errp, "'hv-reenlightenment' requires 'tsc-frequency=' to be set");

s/=//

> +        return;
> +    }
> +
>      /* Hyper-V vendor id */
>      if (!cpu->hyperv_vendor) {
>          memcpy(cpu->hyperv_vendor_id, "Microsoft Hv", 12);
> @@ -6846,7 +6859,11 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>      }
>  
>      /* Process Hyper-V enlightenments */
> -    x86_cpu_hyperv_realize(cpu);
> +    x86_cpu_hyperv_realize(cpu, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
>  
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err != NULL) {
> @@ -7374,6 +7391,8 @@ static Property x86_cpu_properties[] = {
>      DEFINE_PROP_INT32("x-hv-max-vps", X86CPU, hv_max_vps, -1),
>      DEFINE_PROP_BOOL("x-hv-synic-kvm-only", X86CPU, hyperv_synic_kvm_only,
>                       false),
> +    DEFINE_PROP_BOOL("x-hv-reenlightenment-requires-tscfreq", X86CPU,
> +                     hyperv_reenlightenment_requires_tscfreq, true),
>      DEFINE_PROP_BOOL("x-intel-pt-auto-level", X86CPU, intel_pt_auto_level,
>                       true),
>      DEFINE_PROP_END_OF_LIST()
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 570f916878f9..0196a300f018 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -1677,6 +1677,7 @@ struct X86CPU {
>      uint32_t hyperv_spinlock_attempts;
>      char *hyperv_vendor;
>      bool hyperv_synic_kvm_only;
> +    bool hyperv_reenlightenment_requires_tscfreq;
>      uint64_t hyperv_features;
>      bool hyperv_passthrough;
>      OnOffAuto hyperv_no_nonarch_cs;
> -- 
> 2.30.2

dme.
-- 
No proper time of day.

