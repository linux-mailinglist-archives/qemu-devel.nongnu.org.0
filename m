Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7945F6E10
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:19:38 +0200 (CEST)
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWPB-0007nh-O3
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogW1Q-0000o9-06
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:55:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ogW1L-0006uB-Hy
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 14:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665082498;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=0/tfFOZlJ3yNys36xCsfeyHohZpcll6a0o24okaV/UQ=;
 b=CE/FELLGWoGGPgPrilBRXCPXw+mIHHSu0yLTevpeO+GQyfUxE7gx3jUlU/t0fk7lQgFAFb
 i15sS60h6QUTqAcsSW2KHfRpx44bF6FaE6jMvovIPy48aU/9SI9QDpH2uzHz2ARRsoRq+m
 TWreXrFkJz1bbseqbDZ+/gymmT22DBQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-drqhFiLmOZ6gPHNW8ZcGAA-1; Thu, 06 Oct 2022 14:54:55 -0400
X-MC-Unique: drqhFiLmOZ6gPHNW8ZcGAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B1CE185A7A9;
 Thu,  6 Oct 2022 18:54:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6312A40C945A;
 Thu,  6 Oct 2022 18:54:54 +0000 (UTC)
Date: Thu, 6 Oct 2022 19:54:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] gitmodules: recurse by default
Message-ID: <Yz8kfJcfbbTAnmuR@redhat.com>
References: <20221006113906.179963-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221006113906.179963-1-mst@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 06, 2022 at 07:39:07AM -0400, Michael S. Tsirkin wrote:
> The most commmon complaint about submodules is that
> they don't follow when one switches branches in the
> main repo. Enable recursing into submodules by default
> to address that.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  .gitmodules | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

What am I missing, as I tried something equiv to this change
with one submodule and it didn't appear to have any effect.
I started from a clean slate:

$ git submodule  deinit --all --force

The .gitmodules config has 'recurse = true' for the ui/keycodemapdb
module:

$ grep keycodemap --after 1 .gitmodules 
[submodule "ui/keycodemapdb"]
	path = ui/keycodemapdb
	url = https://gitlab.com/qemu-project/keycodemapdb.git
	recurse = true

I have a change on master setting the submodule commit:

$ git show master | grep +Sub
+Subproject commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352

and check it out:

$ git submodule update --init ui/keycodemapdb
Submodule 'ui/keycodemapdb' (https://gitlab.com/qemu-project/keycodemapdb.git) registered for path 'ui/keycodemapdb'
Submodule path 'ui/keycodemapdb': checked out '7381b9bfadd31c4c9e9a10b5bb5032f9189d4352'


In another branch I have a different commit:

$ git show sub-foo  | grep +Sub
+Subproject commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae


Now I switch branches and nothing happens, the submodule
is marked as dirty:

$ git checkout sub-foo
M	ui/keycodemapdb
Switched to branch 'sub-foo'

$ (cd ui/keycodemapdb && git show | head -1)
commit 7381b9bfadd31c4c9e9a10b5bb5032f9189d4352


From your description (and indeed that of the man page) it
sounded like ui/keycodemapdb should have got updated to
commit 57ba70da5312170883a3d622cd2aa3fd0e2ec7ae when I did
'git checkout', but that didn't happen


> 
> diff --git a/.gitmodules b/.gitmodules
> index aedd9a03d4..5f32332aff 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -1,69 +1,92 @@
>  [submodule "roms/seabios"]
>  	path = roms/seabios
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/seabios.git/
>  [submodule "roms/SLOF"]
>  	path = roms/SLOF
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/SLOF.git
>  [submodule "roms/ipxe"]
>  	path = roms/ipxe
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/ipxe.git
>  [submodule "roms/openbios"]
>  	path = roms/openbios
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/openbios.git
>  [submodule "roms/qemu-palcode"]
>  	path = roms/qemu-palcode
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/qemu-palcode.git
>  [submodule "roms/sgabios"]
>  	path = roms/sgabios
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/sgabios.git
>  [submodule "dtc"]
>  	path = dtc
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/dtc.git
>  [submodule "roms/u-boot"]
>  	path = roms/u-boot
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/u-boot.git
>  [submodule "roms/skiboot"]
>  	path = roms/skiboot
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/skiboot.git
>  [submodule "roms/QemuMacDrivers"]
>  	path = roms/QemuMacDrivers
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/QemuMacDrivers.git
>  [submodule "ui/keycodemapdb"]
>  	path = ui/keycodemapdb
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/keycodemapdb.git
>  [submodule "roms/seabios-hppa"]
>  	path = roms/seabios-hppa
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/seabios-hppa.git
>  [submodule "roms/u-boot-sam460ex"]
>  	path = roms/u-boot-sam460ex
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/u-boot-sam460ex.git
>  [submodule "tests/fp/berkeley-testfloat-3"]
>  	path = tests/fp/berkeley-testfloat-3
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/berkeley-testfloat-3.git
>  [submodule "tests/fp/berkeley-softfloat-3"]
>  	path = tests/fp/berkeley-softfloat-3
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/berkeley-softfloat-3.git
>  [submodule "roms/edk2"]
>  	path = roms/edk2
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/edk2.git
>  [submodule "slirp"]
>  	path = slirp
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/libslirp.git
>  [submodule "roms/opensbi"]
>  	path = roms/opensbi
> +	recurse = true
>  	url = 	https://gitlab.com/qemu-project/opensbi.git
>  [submodule "roms/qboot"]
>  	path = roms/qboot
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/qboot.git
>  [submodule "meson"]
>  	path = meson
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/meson.git
>  [submodule "roms/vbootrom"]
>  	path = roms/vbootrom
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/vbootrom.git
>  [submodule "tests/lcitool/libvirt-ci"]
>  	path = tests/lcitool/libvirt-ci
> +	recurse = true
>  	url = https://gitlab.com/libvirt/libvirt-ci.git
>  [submodule "subprojects/libvfio-user"]
>  	path = subprojects/libvfio-user
> +	recurse = true
>  	url = https://gitlab.com/qemu-project/libvfio-user.git
> -- 
> MST
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


