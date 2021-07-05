Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1233BC3C1
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:47:10 +0200 (CEST)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0WQn-0002on-AT
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0WPL-0001T2-NP
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:45:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0WPJ-0003Zy-Ge
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625521536;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0piopKm7QJVts4SW+I2SSe2Dtzi/259jMhVEjeF9HE=;
 b=EgJJA8esuCtDuYTdTNFxknmlSnMzxgNVEaPaxRinUEsnkp6XnSAGpI4sCZVzMZGgCzlhhZ
 8JspQfFYnJOgFogx5DhujE6hQ8eTWbBxKTvqWZ+1bHYH+oii/fSOyiGPPKMtYxHtEg4Lue
 dN/xFvHS6607769zR/SLcL6Dk6ku6PE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-8_xEL5LXMwiZ00SwnVyPiQ-1; Mon, 05 Jul 2021 17:45:35 -0400
X-MC-Unique: 8_xEL5LXMwiZ00SwnVyPiQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B0B31023F45;
 Mon,  5 Jul 2021 21:45:34 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E86475D6A1;
 Mon,  5 Jul 2021 21:45:24 +0000 (UTC)
Date: Mon, 5 Jul 2021 22:45:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 11/22] tests/docker: expand centos8 package list
Message-ID: <YON9ca/hOUubkdi9@redhat.com>
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-12-berrange@redhat.com>
 <87wnq4tsi3.fsf@linaro.org> <YON8o+uZqdPmdb9s@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YON8o+uZqdPmdb9s@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 10:41:55PM +0100, Daniel P. Berrangé wrote:
> On Mon, Jul 05, 2021 at 09:27:56PM +0100, Alex Bennée wrote:
> > 
> > Daniel P. Berrangé <berrange@redhat.com> writes:
> > 
> > > This is the fully expanded list of build pre-requisites QEMU can
> > > conceivably use in any scenario.
> > >
> > > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > ---
> > >  tests/docker/dockerfiles/centos8.docker | 68 +++++++++++++++++++++++++
> > >  1 file changed, 68 insertions(+)
> > >
> > > diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> > > index 5f1c57b4ad..4cc4c0c8a1 100644
> > > --- a/tests/docker/dockerfiles/centos8.docker
> > > +++ b/tests/docker/dockerfiles/centos8.docker
> > > @@ -3,36 +3,104 @@ FROM docker.io/centos:8
> > >  RUN dnf -y update
> > >  ENV PACKAGES \
> > >      SDL2-devel \
> > > +    alsa-lib-devel \
> > > +    bc \
> > > +    brlapi-devel \
> > >      bzip2 \
> > >      bzip2-devel \
> > > +    ca-certificates \
> > > +    capstone-devel \
> > 
> > CentOS8 doesn't seem to package capstone-devel or is it meant to come
> > from somewhere else?
> 
> It comes in via the EPEL repository, along with a few other of the
> packages listed here. Take a look at this job, line 1385 onwards:
> 
>   https://gitlab.com/berrange/qemu/-/jobs/1369975075

Oh actually, this is a bisect issue in the series. The EPEL and
advanced virt repos are only enabled in the later patch in the
series that converts to lcitool auto-generation.

IOW, this current patch should have gained:

 RUN dnf install -y dnf-plugins-core && \
   dnf config-manager --set-enabled powertools && \
+  dnf install -y centos-release-advanced-virtualization && \
+  dnf install -y epel-release && \
   dnf install -y $PACKAGES


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


