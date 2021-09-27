Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392214190FB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 10:38:00 +0200 (CEST)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUm98-0005vx-Tw
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 04:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUm71-0004Nf-Kt
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:35:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mUm6t-00073M-8B
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 04:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632731738;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9N2CPL4+0su37M4d8maWE1S/CteChUjhQOf8mqKejnk=;
 b=hLGxw6rTje05BSIZA/Fazun00zMxZVae3xmq+359tZeUk1CX1g3McyTGTyMbDHy2T9VhoV
 FCoVdm5wkLyVwIIhObpnDF7wq6rhutNmyMEv0xoliQDk5K8+ba/E/ilSt6+XdpmbUEGSZH
 XnDJgYqMzHn/Bh05mpzq11X+vbvCr1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-hiSw5il8Pz-KmDTXcVE6WQ-1; Mon, 27 Sep 2021 04:35:36 -0400
X-MC-Unique: hiSw5il8Pz-KmDTXcVE6WQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA2FD1023F50;
 Mon, 27 Sep 2021 08:35:34 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AEFB1F44B;
 Mon, 27 Sep 2021 08:35:25 +0000 (UTC)
Date: Mon, 27 Sep 2021 09:35:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: gitlab-ci: amd64-opensuse-leap-container job failing
Message-ID: <YVGCStPffR/gss2f@redhat.com>
References: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
MIME-Version: 1.0
In-Reply-To: <657cbef7-11ac-196c-01e2-aeb9744fe446@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
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
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Cho, Yu-Chen" <acho@suse.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Sep 26, 2021 at 07:23:56PM +0200, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> FYI the OpenSUSE job is failing since few days, i.e.:
> https://gitlab.com/qemu-project/qemu/-/jobs/1622345026
> 
>   Retrieving repository 'Main Repository' metadata
> [..........................................................error]
>   Repository 'Main Repository' is invalid.
> 
> [repo-oss|http://download.opensuse.org/distribution/leap/15.2/repo/oss/]
> Valid metadata not found at specified URL
>   History:
>    - Download (curl) error for
> 'http://download.opensuse.org/distribution/leap/15.2/repo/oss/repodata/repomd.xml':
>   Error code: Curl error 56
>   Error message: Recv failure: Connection reset by peer
>    - Can't provide /repodata/repomd.xml
>   Please check if the URIs defined for this repository are pointing to a
> valid repository.
>   Warning: Skipping repository 'Main Repository' because of the above error.
> 
> I tried to run 'zypper ref' with:

It isn't confined to only SuSE. In libvirt we've had similar problems
with several other jobs, though are suse jobs are the worst affected.

GitLab have finally acknowledged it is an general infra issue affecting
many things:

   https://status.gitlab.com/
   https://gitlab.com/gitlab-com/gl-infra/production/-/issues/5590

> -- >8 --
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -109,5 +109,7 @@ ENV PACKAGES \
>      zlib-devel
>  ENV QEMU_CONFIGURE_OPTS --python=/usr/bin/python3.6
> 
> -RUN zypper update -y && zypper --non-interactive install -y $PACKAGES
> +RUN zypper refresh && \
> +    zypper update -y && \
> +    zypper --non-interactive install -y $PACKAGES
>  RUN rpm -q $PACKAGES | sort > /packages.txt
> ---
> 
> but no luck: https://gitlab.com/philmd/qemu/-/jobs/1623554962
> 
> Should we temporarily disable to job and its dependencies?

Given it is believed to be a gitlab infra issue, rather than a problem
of ours, or something we're using, I think best to wait a little longer
to see if they get fix the infra.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


