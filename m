Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9919E6A8848
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 19:07:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXnKv-0003f3-Op; Thu, 02 Mar 2023 13:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnKt-0003Y5-OX
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:07:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pXnKr-00053I-Qz
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 13:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677780441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIFIu9FzFlmMJ7rjilkD4RNn39gojKgiNaI+RvmuVps=;
 b=BfARNxgVHrNtcrjOEQrgsc9JvuLAdsdiLmDLW/uuRONNMt27YmZzEF1K7knX9Mrepm9rs7
 +LEyZRMzFgs1kL0LZD1HDEkSIl2JhTDgvN9x7xLZbb8JORPBUjnsQjfbQuYvOHPOkCaaly
 htLVFGU26EdXJAWGPGmGw5piG0ERe7M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-HQifpbvcNp2xRQ326_T1bQ-1; Thu, 02 Mar 2023 13:07:20 -0500
X-MC-Unique: HQifpbvcNp2xRQ326_T1bQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B25C38012D5;
 Thu,  2 Mar 2023 18:07:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A0E440DF;
 Thu,  2 Mar 2023 18:07:15 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:07:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Message-ID: <ZADlzSMBnjUgyyu0@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-4-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-4-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 05:31:03PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 16 ----------------
>  1 file changed, 16 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

There's still the mingw 32-bit x86 build, but probably wolrth
keeping that until we actually stop 32-bit from a technical
POV, because Stefan still publishes the 32-bit windows
installers currently

Similarly  the dockerfile can stay in case someone wants to
reproduce a flaw locally

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 101416080c..3ce51adf77 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -43,22 +43,6 @@ cross-arm64-user:
>    variables:
>      IMAGE: debian-arm64-cross
>  
> -cross-i386-system:
> -  extends: .cross_system_build_job
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check-qtest
> -
> -cross-i386-user:
> -  extends: .cross_user_build_job
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check
> -
>  cross-i386-tci:
>    extends: .cross_accel_build_job
>    timeout: 60m
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


