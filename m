Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA714A3F14
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:13:03 +0100 (CET)
Received: from localhost ([::1]:49568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESkA-0002GB-AA
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:13:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nESg0-0000Np-0q
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nESfx-0004OQ-OW
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643620107;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=+o8+fo7edtCerkKoh7Uz0n32R4dvtBnaTTf9xyu8RwA=;
 b=iiBJK1agvyyt7sMqKe40iUFgC2HRtw0FYIIYJ5jbuAAlX9RC1Cebkv0xqGtTCxgYOg4iCB
 QnlVqPsO65/fIny7M6UD8+dXDmG1ySL5vttHOhs1minJqeTb6NAVD2x1ruDh4TQ3onfGHp
 /l1VToKURSOxex5keHEvURIhEyC042Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-KTGt3eVPOrqE4Aet0OPuww-1; Mon, 31 Jan 2022 04:08:23 -0500
X-MC-Unique: KTGt3eVPOrqE4Aet0OPuww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D43D190D340;
 Mon, 31 Jan 2022 09:08:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB33C10841AF;
 Mon, 31 Jan 2022 09:07:46 +0000 (UTC)
Date: Mon, 31 Jan 2022 09:07:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras <leobras@redhat.com>, Babu Moger <babu.moger@amd.com>
Subject: Re: [RFC PATCH 1/1] i386: Remove features from Epyc-Milan cpu
Message-ID: <Yfem3s94EwIxqO1a@redhat.com>
References: <20220129102336.387460-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220129102336.387460-1-leobras@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC'ing  Babu Moger who aded the Milan CPU model.

On Sat, Jan 29, 2022 at 07:23:37AM -0300, Leonardo Bras wrote:
> While trying to bring a VM with EPYC-Milan cpu on a host with
> EPYC-Milan cpu (EPYC 7313), the following warning can be seen:
> 
> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bit 9]
> qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.07H:EDX.fsrm [bit 4]
> 
> Even with this warning, the host goes up.
> 
> Then, grep'ing cpuid output on both guest and host, outputs:
> 
> extended feature flags (7):
>       enhanced REP MOVSB/STOSB                 = false
>       fast short REP MOV                       = false
>       (simple synth)  = AMD EPYC (3rd Gen) (Milan B1) [Zen 3], 7nm
>    brand = "AMD EPYC 7313 16-Core Processor               "
> 
> This means that for the same -cpu model (EPYC-Milan), the vcpu may or may
> not have the above feature bits set, which is usually not a good idea for
> live migration:
> Migrating from a host with these features to a host without them can
> be troublesome for the guest.
> 
> Remove the "optional" features (erms, fsrm) from Epyc-Milan, in order to
> avoid possible after-migration guest issues.

Babu,  can you give some insight into availability of erms / fsrm
features across the EPYC 3rd gen CPU line. Is this example missing
erms/fsrm an exception, or common place ?

> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
> 
> Does this make sense? Or maybe I am missing something here.
> 
> Having a kvm guest running with a feature bit, while the host
> does not support it seems to cause a possible break the guest.

The guest won't see the feature bit - that warning message from QEMU
is telling you that it did't honour the request to expose
erms / fsrm - it has dropped them from the CPUO exposed to the guest.

> 
> 
>  target/i386/cpu.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index aa9e636800..a4bbd38ed0 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4160,12 +4160,9 @@ static const X86CPUDefinition builtin_x86_defs[] = {
>              CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 | CPUID_7_0_EBX_AVX2 |
>              CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 | CPUID_7_0_EBX_RDSEED |
>              CPUID_7_0_EBX_ADX | CPUID_7_0_EBX_SMAP | CPUID_7_0_EBX_CLFLUSHOPT |
> -            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_ERMS |
> -            CPUID_7_0_EBX_INVPCID,
> +            CPUID_7_0_EBX_SHA_NI | CPUID_7_0_EBX_CLWB | CPUID_7_0_EBX_INVPCID,
>          .features[FEAT_7_0_ECX] =
>              CPUID_7_0_ECX_UMIP | CPUID_7_0_ECX_RDPID | CPUID_7_0_ECX_PKU,
> -        .features[FEAT_7_0_EDX] =
> -            CPUID_7_0_EDX_FSRM,
>          .features[FEAT_XSAVE] =
>              CPUID_XSAVE_XSAVEOPT | CPUID_XSAVE_XSAVEC |
>              CPUID_XSAVE_XGETBV1 | CPUID_XSAVE_XSAVES,
> -- 
> 2.34.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


