Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAA2FB75D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:25:34 +0100 (CET)
Received: from localhost ([::1]:47534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rwr-0003LG-PP
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:25:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rqp-0004d6-Ei
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:19:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rqf-0001O7-1P
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611065948;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4lGdVdmkN/Ga8lU/llQpCYxS+NnKTYRN5QUMOdV3ng=;
 b=CaFcoOrmppIS0rhrG1tvS9W5fDITCdMXC+22NATe8B/9N4aWpwDrXfFIa3uzraZUlp2t4D
 2KEYVFbOyGgeyZZJO9Vsbv64QUNJOUp8QbkQQUOKAlqRVt3A8N0PiaGJUdgxwaJ1N/47Lx
 PKwt2YSi1RYsDSfPpHbcMUExk6jmxSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-4sgrMPIqMluHZvnmZ8zHwg-1; Tue, 19 Jan 2021 09:19:04 -0500
X-MC-Unique: 4sgrMPIqMluHZvnmZ8zHwg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27E94802B40;
 Tue, 19 Jan 2021 14:19:01 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3162610021AA;
 Tue, 19 Jan 2021 14:18:50 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:18:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 8/9] tests/docker: Add dockerfile for Alpine Linux
Message-ID: <20210119141848.GC2335568@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-9-jiaxun.yang@flygoat.com>
 <20210118103345.GE1789637@redhat.com>
 <929c3ec1-9419-908a-6b5e-ce3ae78f6011@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <929c3ec1-9419-908a-6b5e-ce3ae78f6011@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 kvm@vger.kernel.org, qemu-block@nongnu.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-ppc@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 02:41:47PM +0100, Thomas Huth wrote:
> On 18/01/2021 11.33, Daniel P. Berrangé wrote:
> > On Mon, Jan 18, 2021 at 02:38:07PM +0800, Jiaxun Yang wrote:
> > > Alpine Linux[1] is a security-oriented, lightweight Linux distribution
> > > based on musl libc and busybox.
> > > 
> > > It it popular among Docker guests and embedded applications.
> > > 
> > > Adding it to test against different libc.
> > > 
> > > [1]: https://alpinelinux.org/
> > > 
> > > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > > ---
> > >   tests/docker/dockerfiles/alpine.docker | 57 ++++++++++++++++++++++++++
> > >   1 file changed, 57 insertions(+)
> > >   create mode 100644 tests/docker/dockerfiles/alpine.docker
> > > 
> > > diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
> > > new file mode 100644
> > > index 0000000000..5be5198d00
> > > --- /dev/null
> > > +++ b/tests/docker/dockerfiles/alpine.docker
> > > @@ -0,0 +1,57 @@
> > > +
> > > +FROM alpine:edge
> > > +
> > > +RUN apk update
> > > +RUN apk upgrade
> > > +
> > > +# Please keep this list sorted alphabetically
> > > +ENV PACKAGES \
> > > +	alsa-lib-dev \
> > > +	bash \
> > > +	bison \
> > 
> > This shouldn't be required.
> 
> bison and flex were required to avoid some warnings in the past while
> compiling the dtc submodule ... but I thought we got rid of the problem at
> one point in time, so this can be removed now, indeed.
> 
> > > +	build-base \
> > 
> > This seems to be a meta packae that pulls in other
> > misc toolchain packages. Please list the pieces we
> > need explicitly instead.
> 
> Looking at the "Depends" list on
> https://pkgs.alpinelinux.org/package/v3.3/main/x86/build-base there are only
> 6 dependencies and we need most of those for QEMU anyway, so I think it is
> ok to keep build-base here.

I would like to keep them all explicit, as it makes it easier for us to
ensure that we have provided the same set of dependancies across all our
dockerfiles. Ideally we'll add Alpiine to libvirt-ci, so that we can then
auto-generate this dockerfile in future.


> > > +	perl \
> > > +	pulseaudio-dev \
> > > +	python3 \
> > > +	py3-sphinx \
> > > +	shadow \
> > 
> > Is this really needed ?
> 
> See:
> https://www.spinics.net/lists/kvm/msg231556.html

Ok, so this is required by the docker.py commands running extra tools.

The other dockerfiles are working just by luck, and we should make this
package expicit on all of them too


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


