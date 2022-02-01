Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADFB4A6549
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 21:02:45 +0100 (CET)
Received: from localhost ([::1]:36206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEzMR-0000q7-Ua
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 15:02:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nExUa-0006cE-8W
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:03:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nExUY-0005rn-BU
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643738577;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LehamqzVfxWQ9BedoVSKBvt8FZCJlAoJWzhTqAFcEkg=;
 b=fxDqG0b0dfYD/vOFZAP6aTcFCx5Kmtvxe+7l5+zDZKmHFwOLRhVOYrF3TcJdtRnzp1hqv4
 cVYfU93azClEaD9ChOHlN/vd71GRz3009RYh9Ap1PdGNnvIpSpK6Bn5T1cp4RE3QDscAuP
 OzXim9JjcEn0rNukHerVuAMjPBApq6U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-AuNcrW9rMUGAIqL2dJjmrw-1; Tue, 01 Feb 2022 13:02:50 -0500
X-MC-Unique: AuNcrW9rMUGAIqL2dJjmrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 669398143EB;
 Tue,  1 Feb 2022 18:02:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A423348F3;
 Tue,  1 Feb 2022 18:02:24 +0000 (UTC)
Date: Tue, 1 Feb 2022 18:02:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [PATCH 2/2] tests: Update CentOS 8 container to CentOS Stream 8
Message-ID: <Yfl1rZN6yKCyQ1O0@redhat.com>
References: <20220201101911.97900-1-thuth@redhat.com>
 <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABJz62Osah308O2pHFMWs+D2X+Mq=aOf1NAKFcUaWF5bGzwJEw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 01, 2022 at 09:08:22AM -0800, Andrea Bolognani wrote:
> On Tue, Feb 01, 2022 at 11:19:11AM +0100, Thomas Huth wrote:
> > +++ b/tests/docker/dockerfiles/centos8.docker
> > @@ -1,10 +1,10 @@
> >  # THIS FILE WAS AUTO-GENERATED
> >  #
> > -#  $ lcitool dockerfile centos-8 qemu
> > +#  $ lcitool dockerfile centos-stream-8 qemu
> >  #
> >  # https://gitlab.com/libvirt/libvirt-ci
> >
> > -FROM docker.io/library/centos:8
> > +FROM quay.io/centos/centos:stream8
> [...]
> > +++ b/tests/lcitool/refresh
> > @@ -77,7 +77,7 @@ ubuntu2004_tsanhack = [
> >  ]
> >
> >  try:
> > -   generate_dockerfile("centos8", "centos-8")
> > +   generate_dockerfile("centos8", "centos-stream-8")
> 
> I'm not convinced this is a good idea.
> 
> CentOS 8 and CentOS Stream 8 are two pretty distinct operating
> systems in terms of update cadence and stability expectations, so I
> think that using the label "centos8" for containers and CI jobs that
> are actually consuming CentOS Stream 8 is going to be a source of
> confusion.

Given the EOL of what I call the "traditional" CentOS model at the
end of 2021, both "CentOS" and "CentOS Stream" terms effectively
mean the same thing now.

If we were trying to support CI for both traditional CentOS and
CentOS Stream at the same time, then using the distinct naming
is sensible.  libvirt-ci.git is in this situation

Since QEMU should only care about CentOS Stream from this point
forwards, then I don't think we neccesarily[1] need to make the
naming more verbose by adding the word 'stream' everywhere.

The caveat is that aside from this dockerfile, we also have a
VM config in test/vm/ that historically used traditional CentOS.
That may also need updating to point to Stream unless it has
seemlessly transitioned to using Stream content without us
needing to change anything. I've not looked closely at that yet.

Regards,
Daniel

[1] what would make me change my mind is if we renamed all the
    QEMU dockerfiles so use the same distro naming convention
    as libvirt-ci.git rather than having QEMU's own naming. I've
    thought about suggesting it but it wasn't a high priority
    since lcitool usage is in its infancy in QEMU still
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


