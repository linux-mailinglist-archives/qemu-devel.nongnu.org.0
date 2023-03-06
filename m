Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049996AB9D1
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:27:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ77p-0001WB-0Q; Mon, 06 Mar 2023 04:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZ77j-0001Vk-UL
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pZ77g-0008GE-67
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678094830;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVCxoISPsMUUVKX9jBhQfLyhrTTxfK/FPc4RIMTqVfU=;
 b=VFUr4viTTY1MKxnUvosvWDJVgfykQ0yWrgMTmTREHEDpiTUrbl313MY4MG4iV0jSleSo7k
 rWT9qf6rmHd4rxrm378XP8vEzDu1AkJcCvtzsgFlMX28E3KLrkJJNoEV/5mXv0CqnnWe8B
 vD7bC1ZHBGObOKO/tyWWXZRDQjC8Zvk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-tuDuK4RnONuyfVEmCP4RgA-1; Mon, 06 Mar 2023 04:27:07 -0500
X-MC-Unique: tuDuK4RnONuyfVEmCP4RgA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFFE1811E6E;
 Mon,  6 Mar 2023 09:27:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A0140CF8F0;
 Mon,  6 Mar 2023 09:27:03 +0000 (UTC)
Date: Mon, 6 Mar 2023 09:27:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
Message-ID: <ZAWx5eBskd1cItDx@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230306084658.29709-3-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
> Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
> binary is a proper superset of the qemu-system-i386 binary. With the
> 32-bit host support being deprecated, it is now also possible to
> deprecate the qemu-system-i386 binary.
> 
> With regards to 32-bit KVM support in the x86 Linux kernel,
> the developers confirmed that they do not need a recent
> qemu-system-i386 binary here:
> 
>  https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 1ca9dc33d6..c4fcc6b33c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
>  ``--enable-gcov`` build option remains for analysis test case
>  coverage.
>  
> +``qemu-system-i386`` binary (since 8.0)
> +'''''''''''''''''''''''''''''''''''''''
> +
> +The ``qemu-system-i386`` binary was mainly useful for running with KVM
> +on 32-bit x86 hosts, but most Linux distributions already removed their
> +support for 32-bit x86 kernels, so hardly anybody still needs this. The
> +``qemu-system-x86_64`` binary is a proper superset and can be used to
> +run 32-bit guests by selecting a 32-bit CPU model, including KVM support
> +on x86_64 hosts. Thus users are recommended to reconfigure their systems
> +to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
> +environment should be enforced, you can switch off the "long mode" CPU
> +flag, e.g. with ``-cpu max,lm=off``.

I had the idea to check this today and this is not quite sufficient,
because we have code that changes the family/model/stepping for
'max' which is target dependent:

#ifdef TARGET_X86_64
    object_property_set_int(OBJECT(cpu), "family", 15, &error_abort);
    object_property_set_int(OBJECT(cpu), "model", 107, &error_abort);
    object_property_set_int(OBJECT(cpu), "stepping", 1, &error_abort);
#else
    object_property_set_int(OBJECT(cpu), "family", 6, &error_abort);
    object_property_set_int(OBJECT(cpu), "model", 6, &error_abort);
    object_property_set_int(OBJECT(cpu), "stepping", 3, &error_abort);
#endif

The former is a 64-bit AMD model and the latter is a 32-bit model.

Seems LLVM was sensitive to this distinction to some extent:

   https://gitlab.com/qemu-project/qemu/-/issues/191


A further difference is that qemy-system-i686 does not appear to enable
the 'syscall' flag, but I've not figured out where that difference is
coming from in the code.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


