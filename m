Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47132D13ED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 15:45:39 +0100 (CET)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmHli-0005io-2F
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 09:45:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmHk8-00055v-L9
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmHk6-0006Yi-Lf
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 09:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607352237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYikCPcIPVfkQPyOTA1er7+ojxS2PgeXAGCbiR51IuI=;
 b=iHwXxWisxMiXzPL6x/bK02QYfui7KaNo1aOqsdWC2uhmJRBz1IFgL9GSz9D2kARYnr5uR/
 hT57THpM41hFGPfC/1mzUr+6+qc2giFdhWxnQwiQhp/neLj2aBdegESbGoQma77oG+FRYJ
 PxWG6i+GSLLzsaC6BBhDd0977aBpF/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-SPQGlG4kPs6bEH4OCatr7A-1; Mon, 07 Dec 2020 09:43:56 -0500
X-MC-Unique: SPQGlG4kPs6bEH4OCatr7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EB25107ACE6;
 Mon,  7 Dec 2020 14:43:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0439760C0F;
 Mon,  7 Dec 2020 14:43:45 +0000 (UTC)
Subject: Re: [PATCH v3 5/5] gitlab-ci: Add Xen cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201207131503.3858889-1-philmd@redhat.com>
 <20201207131503.3858889-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f69be51c-1a16-8c5a-f46c-d621d905c9ca@redhat.com>
Date: Mon, 7 Dec 2020 15:43:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201207131503.3858889-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/12/2020 14.15, Philippe Mathieu-Daudé wrote:
> Cross-build ARM and X86 targets with only Xen accelerator enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 51896bbc9fb..bd6473a75a7 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -134,3 +134,17 @@ cross-win64-system:
>    extends: .cross_system_build_job
>    variables:
>      IMAGE: fedora-win64-cross
> +
> +cross-amd64-xen-only:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-amd64-cross
> +    ACCEL: xen
> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
> +
> +cross-arm64-xen-only:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    ACCEL: xen
> +    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm

Reviewed-by: Thomas Huth <thuth@redhat.com>



