Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0977644C296
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:56:22 +0100 (CET)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mko5M-0006Px-KF
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:56:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mko1G-0000Je-Gb
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:52:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mko1B-0006FG-KG
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636552315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y2xasQ5elESghAIaOqJcB05MPj9E2/OcMNPtqeAj29Q=;
 b=LMmUEuiyUkgXXQqomvdi2Tv9fSoiFuKOXnWKRjv87VEDWeUe5H5qK0khKHMia9rGtlOiZB
 mcD9brGAM47wMCc2bkN57Eh0gd2WS74AaH4bvJtwckJmAhW7ie6kQbKDVAR4r6NML2pW6N
 5zpXVIFr4L8tFuVUms+LUGesEN7GMdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-Tk48Nr6JN66Vtgug7b-3UA-1; Wed, 10 Nov 2021 08:51:52 -0500
X-MC-Unique: Tk48Nr6JN66Vtgug7b-3UA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB9311882FB1;
 Wed, 10 Nov 2021 13:51:51 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FCF560C0F;
 Wed, 10 Nov 2021 13:51:49 +0000 (UTC)
Date: Wed, 10 Nov 2021 14:51:47 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] cpu-models-x86.rst: Tidy up a couple of things
Message-ID: <YYvOc2n0IfLIm/Ue@paraplu>
References: <20211015152259.2948176-1-kchamart@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211015152259.2948176-1-kchamart@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 15, 2021 at 05:22:59PM +0200, Kashyap Chamarthy wrote:
> - Remove stray texinfo syntax (remnants of texinfo to rST conversion)
> - Clarify the bit about long-term stable CPU models
> 
> TODO: In a future patch, include potential examples as discussed
>       here[1].
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-10/msg03411.html
>     -- On versioned CPU models, aliases, and machine types

Ping?

I'd also appreciate if anyone can also answer the two questions I raised
in the above thread[1].

> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
> Eduardo/DanPB: I'm not 100% sure if my wording got it right; please give
> it a close reading to make sure I'm not making things worse.
> ---
>  docs/system/cpu-models-x86.rst.inc | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
> index 6e8be7d79b..e133753920 100644
> --- a/docs/system/cpu-models-x86.rst.inc
> +++ b/docs/system/cpu-models-x86.rst.inc
> @@ -25,7 +25,7 @@ Two ways to configure CPU models with QEMU / KVM
>      typically refer to specific generations of hardware released by
>      Intel and AMD.  These allow the guest VMs to have a degree of
>      isolation from the host CPU, allowing greater flexibility in live
> -    migrating between hosts with differing hardware.  @end table
> +    migrating between hosts with differing hardware.
>  
>  In both cases, it is possible to optionally add or remove individual CPU
>  features, to alter what is presented to the guest by default.
> @@ -47,11 +47,20 @@ defined. Traditionally most operating systems and toolchains would
>  only target the original baseline ABI. It is expected that in
>  future OS and toolchains are likely to target newer ABIs. The
>  table that follows illustrates which ABI compatibility levels
> -can be satisfied by the QEMU CPU models. Note that the table only
> -lists the long term stable CPU model versions (eg Haswell-v4).
> -In addition to whats listed, there are also many CPU model
> -aliases which resolve to a different CPU model version,
> -depending on the machine type is in use.
> +can be satisfied by the QEMU CPU models. Note that the table only lists
> +the long term stable CPU model versions (e.g. Haswell-v4, Haswell-v3).
> +CPU models without a version tag will alias to a CPU model with a
> +version tag, and the alias varies depending on the machine type.  In
> +addition to what is listed, there are also many CPU model aliases which
> +resolve to a different CPU model version, depending on the machine type
> +in use.
> +
> +The versioned CPU models (e.g. ``Cascadelake-Server-v4``,
> +``Broadwell-v4``) are long-term stable.  Further, when using a versioned
> +machine type (e.g. ``pc-q35-6.0``), instead of its generic alias
> +(``q35``), the CPU models that are associated with it are also long-term
> +stable.  This is because the CPUID features in the CPU models that are
> +part of a versioned machine type do not change.
>  
>  .. _ABI compatibility levels: https://gitlab.com/x86-psABIs/x86-64-ABI/
>  
> @@ -185,8 +194,8 @@ features are included if using "Host passthrough" or "Host model".
>    guest.  Instead, the host kernel uses it to populate the MDS
>    vulnerability file in ``sysfs``.
>  
> -  So it should only be enabled for VMs if the host reports @code{Not
> -  affected} in the ``/sys/devices/system/cpu/vulnerabilities/mds`` file.
> +  So it should only be enabled for VMs if the host reports ``Not
> +  affected`` in the ``/sys/devices/system/cpu/vulnerabilities/mds`` file.
>  
>  ``taa-no``
>    Recommended to inform that the guest that the host is ``not``
> -- 
> 2.31.1
> 

-- 
/kashyap


