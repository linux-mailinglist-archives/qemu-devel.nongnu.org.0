Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9652FB9BC
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:49:26 +0100 (CET)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sJx-0005fo-HM
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:49:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1sHU-0004WG-MG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:46:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1sHS-0005Zm-MG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611067609;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LOTEL4q/xp9fKZ32S5wbI67uG1QG0D7nHT7QIKk3wfI=;
 b=d5U/o18ebL9nLXhtqHyNId+FzSeOELoyYFqWgj/Wc3XHKQRf0ak+xDpezYi7jtj56Q6KhQ
 akCS86VkzrO6ZA6QT2PRJulaXvVWXdLJFbSCeO6HIGmy/v/rP/GAOeSFa/rIdpybkxwq1g
 jD3OnQ8ezQpPMpQolwspNmOUfOGKA4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-VBYVRbcrPoSXtM7sAS2E4Q-1; Tue, 19 Jan 2021 09:46:43 -0500
X-MC-Unique: VBYVRbcrPoSXtM7sAS2E4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 728A1180A092;
 Tue, 19 Jan 2021 14:46:41 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BC57E174;
 Tue, 19 Jan 2021 14:46:35 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:46:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] tests/docker: Allow passing --network option when
 building images
Message-ID: <20210119144632.GH2335568@redhat.com>
References: <20210119054502.531451-1-f4bug@amsat.org>
 <878s8puprg.fsf@linaro.org>
 <f34c7ff5-cd02-83b4-d3d8-c2ec7ac4334f@amsat.org>
 <20210119142030.GD2335568@redhat.com>
 <bdd4613c-219d-e06d-09e3-bc46aeb58c59@amsat.org>
MIME-Version: 1.0
In-Reply-To: <bdd4613c-219d-e06d-09e3-bc46aeb58c59@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 19, 2021 at 03:40:50PM +0100, Philippe Mathieu-Daudé wrote:
> On 1/19/21 3:20 PM, Daniel P. Berrangé wrote:
> > On Tue, Jan 19, 2021 at 02:40:13PM +0100, Philippe Mathieu-Daudé wrote:
> >> On 1/19/21 12:27 PM, Alex Bennée wrote:
> >>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> >>>
> >>>> When using the Docker engine, build fails because the container is
> >>>> unable to resolve hostnames:
> >>>>
> >>>>   $ make docker-image-debian-s390x-cross NETWORK=host ENGINE=docker
> >>>>     BUILD   debian10
> >>>>   #6 9.679 Err:1 http://deb.debian.org/debian buster InRelease
> >>>>   #6 9.679   Temporary failure resolving 'deb.debian.org'
> >>>>   #6 16.69 Err:2 http://security.debian.org/debian-security buster/updates InRelease
> >>>>   #6 16.69   Temporary failure resolving 'security.debian.org'
> >>>>   #6 22.69 Err:3 http://deb.debian.org/debian buster-updates InRelease
> >>>>   #6 22.69   Temporary failure resolving 'deb.debian.org'
> >>>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster/InRelease  Temporary failure resolving 'deb.debian.org'
> >>>>   #6 22.74 W: Failed to fetch http://security.debian.org/debian-security/dists/buster/updates/InRelease  Temporary failure resolving 'security.debian.org'
> >>>>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster-updates/InRelease  Temporary failure resolving 'deb.debian.org'
> >>>>   #6 22.74 W: Some index files failed to download. They have been
> >>>>   ignored, or old ones used instead.
> >>>
> >>> I'm confused by this one as it currently works for me. That said I
> >>> thought the actual behaviour was meant to be networking is enabled by
> >>> default and explicitly disabled by the run step (which shouldn't be
> >>> pulling extra stuff down).
> >>>
> >>> This was last tweaked by Daniel in 8a2390a4f47
> >>>
> >>> Have the defaults for docker engine changed?
> >>
> >> No idea as I'm not following their development, but TBH it
> >> becomes harder and harder to use without tricks (I had to
> >> add systemd.unified_cgroup_hierarchy=0 to kernel cmdline
> >> to keep using it).
> >>
> >> Maybe I should switch to podman which is the recommended
> >> engine on Fedora.
> >>
> >> Cc'ing Marc-André who added podman support (Daniel is in Cc).
> > 
> > I'm using podman exclusively since Docker doesn't work well with
> > modern distros that use Cgroups v2.
> 
> OK this probably explains it.
> 
> Ideally we could add a check for this ("modern distro" -> docker
> engine not recommended) but I guess I'm the only one using this
> feature on Fedora (as nobody complained) so not a problem. I'll
> see how to use podman.

I'm not sure we need to block it. If someone has docker installed
then its reasonable to assume they have ti working. We prefer
podman if both are installed.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


