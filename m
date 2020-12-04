Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1692CEEE1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 14:40:15 +0100 (CET)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klBJm-00089E-Qx
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 08:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klBHo-0007bO-JA
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:38:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1klBHm-0004l6-Gn
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 08:38:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607089089;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=BTfAAqfGFYydiE8GB27RypdJ0WvtNOLxGmn1FahWoiM=;
 b=YeM0DxYQoipeRG7FFh9IKnQbEvogDSUnOI5/TUyF9ABYO8B8+dMGf5mUebD6KV26fNvC6f
 HmemHFXzMiUy5anN3wbLHUpz4ipR/lpXk6NfNZDgfcT0NUH2NL/7jS37RhUUWpq8uy1YFv
 RwOqjtClZ7fqUV7M+Es5pCvpAm54RZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10--K2Ajb0_OdinZH55xakNPQ-1; Fri, 04 Dec 2020 08:38:07 -0500
X-MC-Unique: -K2Ajb0_OdinZH55xakNPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 450FB10074C0;
 Fri,  4 Dec 2020 13:38:06 +0000 (UTC)
Received: from redhat.com (ovpn-115-10.ams2.redhat.com [10.36.115.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52AF160C15;
 Fri,  4 Dec 2020 13:38:01 +0000 (UTC)
Date: Fri, 4 Dec 2020 13:37:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 18/23] tests/docker: auto-generate centos7 with lcitool
Message-ID: <20201204133758.GJ3056135@redhat.com>
References: <20201201171825.2243775-1-berrange@redhat.com>
 <20201201171825.2243775-19-berrange@redhat.com>
 <20201202120739.iwej4lbv7srkz4uf@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201202120739.iwej4lbv7srkz4uf@sirius.home.kraxel.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 01:07:39PM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > +RUN echo 'skip_missing_names_on_install=0' >> /etc/yum.conf && \
> > +    yum install -y epel-release && \
> > +    yum install -y centos-release-xen-48 && \
> > +    yum update -y && \
> > +    yum install -y \
> > +        SDL2-devel \
> 
> More a comment for lcitool I guess:  rpmbuild generates provides entries
> for pkg-config files, so 'SDL2-devel' can be replaced with
> 'pkgconfig(sdl2)'.  Which should work fine on any rpm-based distro, no
> matter how the package is actually named.
> 
> Dunno whenever apt/deb has something simliar or whenever that actually
> can simplify things for lcitool ...

Yeah, it might cut down the mapping size, so i filed an issue

https://gitlab.com/libvirt/libvirt-ci/-/issues/2


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


