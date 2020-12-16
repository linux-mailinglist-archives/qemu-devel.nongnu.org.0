Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D82DC3EF
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:21:49 +0100 (CET)
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZYi-0003CX-G1
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1kpZWX-0001du-Ca
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:19:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1kpZWV-0006Oj-My
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608135568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+G9w5pq1yH4Td0Lcyk91IR8fcWdrgzmHcAb1LdFxWoU=;
 b=JxeLSPRac5/hdc7g0wJVND6K0zBY9L6T8hJILQObN8TAcDQ4ZscMHy8AOqR4OzJd/bk+24
 RqehCFK+bZBXbXVM3QcEBoZofmwiWzNPz+fOruOo2COrRqEH38vVA7566NZ7OHk/dV+qSU
 RK6IPtYQE2eDde/TGeg92Qo1U7fY/Y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-Qc2UNYBCNwm4Bj6qPYOfYg-1; Wed, 16 Dec 2020 11:19:25 -0500
X-MC-Unique: Qc2UNYBCNwm4Bj6qPYOfYg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7460481CB03;
 Wed, 16 Dec 2020 16:19:21 +0000 (UTC)
Received: from titinator (ovpn-112-61.ams2.redhat.com [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 758D31001901;
 Wed, 16 Dec 2020 16:19:15 +0000 (UTC)
References: <20201216224002.32677-1-cathy.zhang@intel.com>
User-agent: mu4e 1.5.2; emacs 27.1
From: Christophe de Dinechin <dinechin@redhat.com>
To: Cathy Zhang <cathy.zhang@intel.com>
Subject: Re: [PATCH] x86/cpu: Add AVX512_FP16 cpu feature
In-reply-to: <20201216224002.32677-1-cathy.zhang@intel.com>
Date: Wed, 16 Dec 2020 17:19:12 +0100
Message-ID: <lyft45lo5b.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020-12-16 at 23:40 CET, Cathy Zhang wrote...
> AVX512 Half-precision floating point (FP16) has better performance
> compared to FP32 if the presicion or magnitude requirements are met.

spelling: precision

> It's defined as CPUID.(EAX=7,ECX=0):EDX[bit 23].
>
> Refer to
> https://software.intel.com/content/www/us/en/develop/download/\
> intel-architecture-instruction-set-extensions-programming-reference.html
>
> Signed-off-by: Cathy Zhang <cathy.zhang@intel.com>
> ---
>  target/i386/cpu.c | 2 +-
>  target/i386/cpu.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ca997a68cd..c4d623b8b9 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -979,7 +979,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>              "avx512-vp2intersect", NULL, "md-clear", NULL,
>              NULL, NULL, "serialize", NULL,
>              "tsx-ldtrk", NULL, NULL /* pconfig */, NULL,
> -            NULL, NULL, NULL, NULL,
> +            NULL, NULL, NULL, "avx512-fp16",
>              NULL, NULL, "spec-ctrl", "stibp",
>              NULL, "arch-capabilities", "core-capability", "ssbd",
>          },
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index c4a49c06a8..6fd675c654 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -784,6 +784,8 @@ typedef uint64_t FeatureWordArray[FEATURE_WORDS];
>  #define CPUID_7_0_EDX_SERIALIZE         (1U << 14)
>  /* TSX Suspend Load Address Tracking instruction */
>  #define CPUID_7_0_EDX_TSX_LDTRK         (1U << 16)
> +/* AVX512_FP16 instruction */
> +#define CPUID_7_0_EDX_AVX512_FP16       (1U << 23)
>  /* Speculation Control */
>  #define CPUID_7_0_EDX_SPEC_CTRL         (1U << 26)
>  /* Single Thread Indirect Branch Predictors */


--
Cheers,
Christophe de Dinechin (IRC c3d)


