Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D22D10A7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:38:15 +0100 (CET)
Received: from localhost ([::1]:43150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFmO-0002uD-Ce
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:38:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmEqc-0008L1-8G
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmEqQ-00084u-RU
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607341094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muAFbZHcdnlA540NVtllekXZu37z+fEhka8P0LY3Jqw=;
 b=Levx0tKtdR2is0Sa1SwqQws+LdMGx3xmYaaLxkpgpHCdjSQ7g1jWGNKP0bycmf3WG4ptPk
 teTjg2w6RpVeJJg+5VHCfyFBkpiyfU6UcAkTXbbr4Ucv5sqJWB+dKyZp2x1JH7+QZHOPMj
 R2PoiMB8sE+VaA+SNLuuJALGpflKRKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-sho2lGVVNdOBmTUquj-bNA-1; Mon, 07 Dec 2020 06:38:13 -0500
X-MC-Unique: sho2lGVVNdOBmTUquj-bNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D013B180A08A;
 Mon,  7 Dec 2020 11:38:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 195BC60BD8;
 Mon,  7 Dec 2020 11:38:00 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] gitlab-ci: Introduce 'cross_accel_build_job'
 template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201207112353.3814480-1-philmd@redhat.com>
 <20201207112353.3814480-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <93d186c0-feea-8e47-2a03-5276fb898bff@redhat.com>
Date: Mon, 7 Dec 2020 12:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201207112353.3814480-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2020 12.23, Philippe Mathieu-Daudé wrote:
> Introduce a job template to cross-build accelerator specific
> jobs (enable a specific accelerator, disabling the others).
> 
> The specific accelerator is selected by the $ACCEL environment
> variable (default to KVM).
> 
> Extra options such disabling other accelerators are passed
> via the $ACCEL_CONFIGURE_OPTS environment variable.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 099949aaef3..d8685ade376 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -13,6 +13,23 @@
>            xtensa-softmmu"
>      - make -j$(expr $(nproc) + 1) all check-build
>  
> +# Job to cross-build specific accelerators.
> +#
> +# Set the $ACCEL variable to select the specific accelerator (default to
> +# KVM), and set extra options (such disabling other accelerators) via the
> +# $ACCEL_CONFIGURE_OPTS variable.
> +.cross_accel_build_job:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> +  timeout: 30m
> +  script:
> +    - mkdir build
> +    - cd build
> +    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
> +      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
> +        --enable-${ACCEL:-kvm} --target-list="$TARGETS" $ACCEL_CONFIGURE_OPTS
> +    - make -j$(expr $(nproc) + 1) all check-build
> +
>  .cross_user_build_job:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest

I wonder whether we could also simply use the .cross_user_build_job - e.g.
by adding a $EXTRA_CONFIGURE_OPTS variable in the "../configure ..." line so
that the accel-jobs could use that for their --enable... and --disable...
settings?

Anyway, I've got no strong opinion on that one, and I'm also fine if we add
this new template, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


