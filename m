Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4DF2FB758
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:23:11 +0100 (CET)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ruY-000862-Nc
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:23:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rsE-0006O5-UA
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:20:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1rsC-0001oU-DG
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611066043;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3yVLqzlOI7xJ1bRljHAn8veZ+nU9G0hkiRji72NeXSw=;
 b=QZbHV/ani8H1C/8PohKSRknFOEMvquRpIc9E6h8a+QuRMKVe4MQOITn8M9ACm2bAr/x/eF
 dxm0ppYdc4c4+YIIJL+W6yfNZcP6i7ewhG4UHXZJ2b49x+XTzjbFA7Vgp4FolmXFTa8wvT
 sy+woLKedV29NgMTQ3Xne4GrqqFnIbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-JC_2gEtPMCGb0IDU61vBKA-1; Tue, 19 Jan 2021 09:20:41 -0500
X-MC-Unique: JC_2gEtPMCGb0IDU61vBKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF2E310054FF;
 Tue, 19 Jan 2021 14:20:40 +0000 (UTC)
Received: from redhat.com (ovpn-112-84.ams2.redhat.com [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8EC560C5F;
 Tue, 19 Jan 2021 14:20:32 +0000 (UTC)
Date: Tue, 19 Jan 2021 14:20:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH] tests/docker: Allow passing --network option when
 building images
Message-ID: <20210119142030.GD2335568@redhat.com>
References: <20210119054502.531451-1-f4bug@amsat.org>
 <878s8puprg.fsf@linaro.org>
 <f34c7ff5-cd02-83b4-d3d8-c2ec7ac4334f@amsat.org>
MIME-Version: 1.0
In-Reply-To: <f34c7ff5-cd02-83b4-d3d8-c2ec7ac4334f@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tue, Jan 19, 2021 at 02:40:13PM +0100, Philippe Mathieu-Daudé wrote:
> On 1/19/21 12:27 PM, Alex Bennée wrote:
> > Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> > 
> >> When using the Docker engine, build fails because the container is
> >> unable to resolve hostnames:
> >>
> >>   $ make docker-image-debian-s390x-cross NETWORK=host ENGINE=docker
> >>     BUILD   debian10
> >>   #6 9.679 Err:1 http://deb.debian.org/debian buster InRelease
> >>   #6 9.679   Temporary failure resolving 'deb.debian.org'
> >>   #6 16.69 Err:2 http://security.debian.org/debian-security buster/updates InRelease
> >>   #6 16.69   Temporary failure resolving 'security.debian.org'
> >>   #6 22.69 Err:3 http://deb.debian.org/debian buster-updates InRelease
> >>   #6 22.69   Temporary failure resolving 'deb.debian.org'
> >>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster/InRelease  Temporary failure resolving 'deb.debian.org'
> >>   #6 22.74 W: Failed to fetch http://security.debian.org/debian-security/dists/buster/updates/InRelease  Temporary failure resolving 'security.debian.org'
> >>   #6 22.74 W: Failed to fetch http://deb.debian.org/debian/dists/buster-updates/InRelease  Temporary failure resolving 'deb.debian.org'
> >>   #6 22.74 W: Some index files failed to download. They have been
> >>   ignored, or old ones used instead.
> > 
> > I'm confused by this one as it currently works for me. That said I
> > thought the actual behaviour was meant to be networking is enabled by
> > default and explicitly disabled by the run step (which shouldn't be
> > pulling extra stuff down).
> > 
> > This was last tweaked by Daniel in 8a2390a4f47
> > 
> > Have the defaults for docker engine changed?
> 
> No idea as I'm not following their development, but TBH it
> becomes harder and harder to use without tricks (I had to
> add systemd.unified_cgroup_hierarchy=0 to kernel cmdline
> to keep using it).
> 
> Maybe I should switch to podman which is the recommended
> engine on Fedora.
> 
> Cc'ing Marc-André who added podman support (Daniel is in Cc).

I'm using podman exclusively since Docker doesn't work well with
modern distros that use Cgroups v2.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


