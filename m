Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21B02D0A51
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 06:43:10 +0100 (CET)
Received: from localhost ([::1]:38070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km9Ij-0001Gi-D6
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 00:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1km9HY-0000ir-AD
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:41:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1km9HU-0000gI-GQ
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 00:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607319711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLuvXS3NI6D8cDyFAW5Sct9681MJ4TRf7wvMzpU1WWE=;
 b=KUTPZe0k7q1cCJJETbf2zJqjPp0nXzm+KcrXR1rYKsmFbQ9eSqclqliSlJpCdEaA+VNbJu
 6QSqjH2jkADchLC+3nqTwy7AQiKQeJphvkyBB+YblFcozhCM/cvhKHxuHEVlj+IZ52YCmw
 zKKSYboTvilOvH8fAIOWiaizBJuJq8E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-EzR6j0tzNtSU__GG2EUBMw-1; Mon, 07 Dec 2020 00:41:47 -0500
X-MC-Unique: EzR6j0tzNtSU__GG2EUBMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F4CB1005513;
 Mon,  7 Dec 2020 05:41:44 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 409601A262;
 Mon,  7 Dec 2020 05:41:32 +0000 (UTC)
Subject: Re: [PATCH 4/8] gitlab-ci: Add KVM ARM cross-build jobs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2a75c6ea-013d-896e-8478-2312957d3ed2@redhat.com>
Date: Mon, 7 Dec 2020 06:41:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201206185508.3545711-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> Cross-build ARM aarch64 target with KVM and TCG accelerators enabled.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> later this job will build KVM-only.
> ---
>  .gitlab-ci.d/crossbuilds-kvm-arm.yml | 5 +++++
>  .gitlab-ci.yml                       | 1 +
>  MAINTAINERS                          | 1 +
>  3 files changed, 7 insertions(+)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml
> 
> diff --git a/.gitlab-ci.d/crossbuilds-kvm-arm.yml b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
> new file mode 100644
> index 00000000000..c74c6fdc9fb
> --- /dev/null
> +++ b/.gitlab-ci.d/crossbuilds-kvm-arm.yml
> @@ -0,0 +1,5 @@
> +cross-arm64-kvm:
> +  extends: .cross_accel_build_job
> +  variables:
> +    IMAGE: debian-arm64-cross
> +    TARGETS: aarch64-softmmu

Now that's a little bit surprising, I had expected that the KVM code is
already compiled by the "cross-arm64-system" job ... but looking at the
output of a corresponding pipeline, it says "KVM support: NO", see e.g.:

https://gitlab.com/qemu-project/qemu/-/jobs/883985039#L298

What's going wrong there? ... ah, well, it's because of the
"--target-list-exclude=aarch64-softmmu" in the template :-(
That was stupid. So instead of adding a new job, could you please simply
replace the aarch64-softmmu there by arm-softmmu?

 Thanks,
  Thomas


