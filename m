Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A76B6A8852
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:09:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnMs-0005zy-Cm; Thu, 02 Mar 2023 13:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnMp-0005vk-VR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:09:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnMn-00062U-VC
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677780561;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HiVBqMnf1rJ1eG3Qv6m/ZxXVASAu56FD87PLiyS+zOU=;
 b=VcVs+QPid+TmI03PzQUuoWF8LHMIRaLPFi+I0sPYAfPwf2MSaF61Q0iNj/9+JRfxP5e52n
 7w7ui9dx6k3Ak3f/fBHxU/osqNmRBcNdhFHWVxPJq2Q6bHCjN8qKJNRcq2rGViVdBTdhWW
 KHnMvIglVdTha2o5xznWl9+lLpXrpMM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-oGMHrVdGOk-q1eVLl11_hw-1; Thu, 02 Mar 2023 13:09:17 -0500
X-MC-Unique: oGMHrVdGOk-q1eVLl11_hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA1A877CAA;
 Thu,  2 Mar 2023 18:09:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7E02026D4B;
 Thu,  2 Mar 2023 18:09:11 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:09:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 5/6] docs/about/deprecated: Deprecate 32-bit arm hosts
Message-ID: <ZADmPwStkmFltjo7@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-6-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-6-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Thu, Mar 02, 2023 at 05:31:05PM +0100, Thomas Huth wrote:
> For running QEMU in system emulation mode, the user needs a rather
> strong host system, i.e. not only an embedded low-frequency controller.
> All recent beefy arm host machines should support 64-bit now, it's
> unlikely that anybody is still seriously using QEMU on a 32-bit arm
> CPU, so we deprecate the 32-bit arm hosts here to finally save use
> some time and precious CI minutes.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 21ce70b5c9..c7113a7510 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -229,6 +229,15 @@ discontinue it. Since all recent x86 hardware from the past >10 years
>  is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
>  should be used instead.
>  
> +System emulation on 32-bit arm hosts (since 8.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Since QEMU needs a strong host machine for running full system emulation, and
> +all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
> +support for running any system emulation on 32-bit arm hosts in general. Use
> +64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
> +continuous to be supported on 32-bit arm hosts, too)

s/continuous/continues/

s/,too/, as well as command line tools like qemu-img, qemu-nbd, etc/

> +
>  
>  QEMU API (QAPI) events
>  ----------------------
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


