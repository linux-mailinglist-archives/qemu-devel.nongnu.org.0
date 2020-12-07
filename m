Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA742D0DF3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:25:16 +0100 (CET)
Received: from localhost ([::1]:36914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDhj-00087x-DO
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmDgN-0007Vt-HO
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:23:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmDgK-00038K-7A
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607336626;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0qgjftJvMWB28i7vhzEDVbkT48Qo4f02gO6Q9KnMTyo=;
 b=cGIxO2JaYQZ1vArjne8aOanS0fgGYaiYtDCS+A+HJr+skYSu8u34pX/TAz2mQgDovDLirx
 Hl7PrG3dX00XIRC19PBjr/LKZht0GnnhSJniXRnjBg3yxN/qWcVmfs87wXB9TF3Q96Hx0y
 /lNeCFKSiGMssqDBZuYg9W6CHWacZLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-W4NZmy85M4282Y90Lqh5rw-1; Mon, 07 Dec 2020 05:23:32 -0500
X-MC-Unique: W4NZmy85M4282Y90Lqh5rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7432C801AE8;
 Mon,  7 Dec 2020 10:23:29 +0000 (UTC)
Received: from redhat.com (ovpn-113-137.ams2.redhat.com [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 435C360BD8;
 Mon,  7 Dec 2020 10:23:19 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:23:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/8] gitlab-ci: Add accelerator-specific Linux jobs
Message-ID: <20201207102316.GF3102898@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, qemu-devel@nongnu.org,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 06, 2020 at 07:55:00PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I was custom to use Travis-CI for testing KVM builds on s390x/ppc
> with the Travis-CI jobs.
> 
> During October Travis-CI became unusable for me (extremely slow,
> see [1]). Then my free Travis account got updated to the new
> "10K credit minutes allotment" [2] which I burned without reading
> the notification email in time (I'd burn them eventually anyway).
> 
> Today Travis-CI is pointless to me. While I could pay to run my
> QEMU jobs, I don't think it is fair for an Open Source project to
> ask its forks to pay for a service.
> 
> As we want forks to run some CI before contributing patches, and
> we have cross-build Docker images available for Linux hosts, I
> added some cross KVM/Xen build jobs to Gitlab-CI.
> 
> Cross-building doesn't have the same coverage as native building,
> as we can not run the tests. But this is still useful to get link
> failures.
> 
> Each job is added in its own YAML file, so it is easier to notify
> subsystem maintainers in case of troubles.
> 
> Resulting pipeline:
> https://gitlab.com/philmd/qemu/-/pipelines/225948077
> 
> Regards,
> 
> Phil.
> 
> [1] https://travis-ci.community/t/build-delays-for-open-source-project/10272
> [2] https://blog.travis-ci.com/2020-11-02-travis-ci-new-billing
> 
> Philippe Mathieu-Daudé (8):
>   gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)
>   gitlab-ci: Introduce 'cross_accel_build_job' template
>   gitlab-ci: Add KVM X86 cross-build jobs
>   gitlab-ci: Add KVM ARM cross-build jobs
>   gitlab-ci: Add KVM s390x cross-build jobs
>   gitlab-ci: Add KVM PPC cross-build jobs
>   gitlab-ci: Add KVM MIPS cross-build jobs
>   gitlab-ci: Add Xen cross-build jobs
> 
>  .gitlab-ci.d/crossbuilds-kvm-arm.yml   |  5 +++
>  .gitlab-ci.d/crossbuilds-kvm-mips.yml  |  5 +++
>  .gitlab-ci.d/crossbuilds-kvm-ppc.yml   |  5 +++
>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml |  6 +++
>  .gitlab-ci.d/crossbuilds-kvm-x86.yml   |  6 +++
>  .gitlab-ci.d/crossbuilds-xen.yml       | 14 +++++++

Adding so many different files here is crazy IMHO, and then should
all be under the same GitLab CI maintainers, not the respective
arch maintainers.  The MAINTAINERS file is saying who is responsible
for the contents of the .yml file, not who is responsible for making
sure KVM works on that arch. 

>  .gitlab-ci.d/crossbuilds.yml           | 52 ++++++++++++++++----------
>  .gitlab-ci.yml                         |  6 +++
>  MAINTAINERS                            |  6 +++
>  9 files changed, 85 insertions(+), 20 deletions(-)
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-arm.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-x86.yml
>  create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


