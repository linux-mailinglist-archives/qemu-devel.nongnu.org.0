Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3172D0E1C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 11:36:52 +0100 (CET)
Received: from localhost ([::1]:56924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmDsx-00009O-Ft
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 05:36:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmDr5-0007aV-N2
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:34:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kmDr3-0006jQ-G0
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 05:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607337292;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHJ/6LZZ/l4zPSaAfktxXxObRN4BFZ04xcSZNsVRSp0=;
 b=LKxTTJXxFURrGoLIyYEGTQbCkqTqMp6MvmULSzmLDqOFC+TNC63xL9jDQlL8JF7tGAVEah
 jgcq6iFaZMir3UOZCaNPdrHQbs7VlKpo+oUdYJq7eT2Xt266PUm9tg20EGIQkHGlF3HThw
 IFbweXc3VZJxuaNbR7KqP3LnegT9DTg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-wgEpu-mVPbGqhVGeG4IaJA-1; Mon, 07 Dec 2020 05:34:49 -0500
X-MC-Unique: wgEpu-mVPbGqhVGeG4IaJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9069190B2A2;
 Mon,  7 Dec 2020 10:34:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-137.ams2.redhat.com [10.36.113.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F26E760C62;
 Mon,  7 Dec 2020 10:34:33 +0000 (UTC)
Date: Mon, 7 Dec 2020 10:34:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
Message-ID: <20201207103430.GI3102898@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
 <20201206185508.3545711-6-philmd@redhat.com>
 <66d4d0ab-2bb5-1284-b08a-43c6c30f30dc@redhat.com>
 <20201207102450.GG3102898@redhat.com>
 <9233fe7f-8d56-e1ad-b67e-40b3ce5fcabb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9233fe7f-8d56-e1ad-b67e-40b3ce5fcabb@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Paul Durrant <paul@xen.org>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 07, 2020 at 11:26:58AM +0100, Philippe Mathieu-Daudé wrote:
> On 12/7/20 11:25 AM, Daniel P. Berrangé wrote:
> > On Mon, Dec 07, 2020 at 06:46:01AM +0100, Thomas Huth wrote:
> >> On 06/12/2020 19.55, Philippe Mathieu-Daudé wrote:
> >>> Cross-build s390x target with only KVM accelerator enabled.
> >>>
> >>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >>> ---
> >>>  .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
> >>>  .gitlab-ci.yml                         | 1 +
> >>>  MAINTAINERS                            | 1 +
> >>>  3 files changed, 8 insertions(+)
> >>>  create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml
> >>>
> >>> diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
> >>> new file mode 100644
> >>> index 00000000000..1731af62056
> >>> --- /dev/null
> >>> +++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
> >>> @@ -0,0 +1,6 @@
> >>> +cross-s390x-kvm:
> >>> +  extends: .cross_accel_build_job
> >>> +  variables:
> >>> +    IMAGE: debian-s390x-cross
> >>> +    TARGETS: s390x-softmmu
> >>> +    ACCEL_CONFIGURE_OPTS: --disable-tcg
> >>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> >>> index 573afceb3c7..a69619d7319 100644
> >>> --- a/.gitlab-ci.yml
> >>> +++ b/.gitlab-ci.yml
> >>> @@ -14,6 +14,7 @@ include:
> >>>    - local: '/.gitlab-ci.d/crossbuilds.yml'
> >>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
> >>>    - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
> >>> +  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
> >>
> >> KVM code is already covered by the "cross-s390x-system" job, but an
> >> additional compilation test with --disable-tcg makes sense here. I'd then
> >> rather name it "cross-s390x-no-tcg" or so instead of "cross-s390x-kvm".
> >>
> >> And while you're at it, I'd maybe rather name the new file just
> >> crossbuilds-s390x.yml and also move the other s390x related jobs into it?
> > 
> > I don't think we really should split it up so much - just put these
> > jobs in the existing crosbuilds.yml file.
> 
> Don't we want to leverage MAINTAINERS file?

As mentioned in the cover letter, I think this is mis-using the MAINTAINERS
file to try to represent something different.

The MAINTAINERS file says who is responsible for the contents of the .yml
file, which is the CI maintainers, because we want a consistent gitlab
configuration as a whole, not everyone doing their own thing.

MAINTAINERS doesn't say who is responsible for making sure the actual
jobs that run are passing, which is potentially a completely different
person. If we want to track that, it is not the MAINTAINERS file.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


