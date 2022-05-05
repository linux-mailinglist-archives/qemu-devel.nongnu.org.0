Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2551C42B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 17:45:41 +0200 (CEST)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmdfg-00029C-DO
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 11:45:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmdci-0007jC-6c
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:42:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:50593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmdcf-0004Zc-Ug
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651765353;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=WMNcQ1ItBsDV0y8/vJ9tQ/LcILz31/YziORiasjuFXU=;
 b=hK8WvCttQ6LDAaL50g+pYBtM/BZv02C0xi1EBalVaMyKcowI1knrH/BOamHTgMo5QqaLcF
 Ed30NVpPpzPICEa1og7omOrGdgNoHRMusmes+5SdrgM84XPYvTa9tCFL4AoENOJ2Uuj8eH
 rDTxNJ6OAF7Xp1xUJyVJ+zcxIi0nnUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-5XVUab1tOLWDz-Bo8rERdQ-1; Thu, 05 May 2022 11:42:30 -0400
X-MC-Unique: 5XVUab1tOLWDz-Bo8rERdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8BC091C06EC3;
 Thu,  5 May 2022 15:42:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 116A22166BA4;
 Thu,  5 May 2022 15:41:49 +0000 (UTC)
Date: Thu, 5 May 2022 16:41:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jagannathan Raman <jag.raman@oracle.com>, qemu-devel@nongnu.org,
 mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 imammedo@redhat.com, peterx@redhat.com, john.levon@nutanix.com,
 thanos.makatos@nutanix.com, elena.ufimtseva@oracle.com,
 john.g.johnson@oracle.com, kanth.ghatraju@oracle.com
Subject: Re: [PATCH v9 06/17] vfio-user: build library
Message-ID: <YnPwOzqeuzDTgISV@redhat.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
 <7560757f7e08842bbfc78bafdee6959f2ab43f80.1651586203.git.jag.raman@oracle.com>
 <YnPvtyp54seM8ibH@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YnPvtyp54seM8ibH@stefanha-x1.localdomain>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 05, 2022 at 04:39:35PM +0100, Stefan Hajnoczi wrote:
> On Tue, May 03, 2022 at 10:16:47AM -0400, Jagannathan Raman wrote:
> > diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
> > new file mode 160000
> > index 0000000000..030d2f6e79
> > --- /dev/null
> > +++ b/subprojects/libvfio-user
> > @@ -0,0 +1 @@
> > +Subproject commit 030d2f6e7978b8ca7577b81d4f48e2771bcd8f47
> > diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
> > index 4b20925bbf..300833d8e0 100644
> > --- a/tests/docker/dockerfiles/centos8.docker
> > +++ b/tests/docker/dockerfiles/centos8.docker
> > @@ -23,6 +23,7 @@ RUN dnf update -y && \
> >          capstone-devel \
> >          ccache \
> >          clang \
> > +        cmake \
> 
> Good, CentOS 8 has CMake 3.20.0.
> 
> > diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> > index a3b38884e3..7c6131686a 100644
> > --- a/tests/docker/dockerfiles/ubuntu2004.docker
> > +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> > @@ -18,6 +18,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
> >              ca-certificates \
> >              ccache \
> >              clang \
> > +            cmake \
> 
> Ubuntu 20.04LTS has CMake 3.16.3:
> https://packages.ubuntu.com/focal/cmake
> 
> That does not meet the minimum version requirement in this patch series
> (3.19.0).
> 
> Please re-run container build to check if Ubuntu actually works.
> 
> Hopefully libvfio-user will support meson and CMake can be dropped from
> this patch series.

That's something I have proposed here:

  https://github.com/nutanix/libvfio-user/pull/666


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


