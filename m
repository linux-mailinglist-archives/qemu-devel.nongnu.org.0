Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D103031C861
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:50:51 +0100 (CET)
Received: from localhost ([::1]:45844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBx0M-0001YT-Tt
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:50:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBwyw-00014d-1n
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:49:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lBwyq-0005Pn-Nh
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:49:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613468954;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcR9Mti49PeXpEpnpVBZELAkSXzOZmOCDvhppOFGuD0=;
 b=H3C6+Rl+KjZ0EB/gMgv0DLXXI6L/03VIgO+EzWo8j5dWsHKtjdjTr1T5/RDjs1PeE7QwJC
 oAsHjb6nXrH41raIeU6SmL2jdwruDqJucfvt8t9P4uV5/hJRHzuxQ+T/V6FV1OwEJsstca
 1agycxEeh9o4trHA96HgK9nB45My8rw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-pn55FUsRNVSlla8r1mWksw-1; Tue, 16 Feb 2021 04:49:10 -0500
X-MC-Unique: pn55FUsRNVSlla8r1mWksw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9E7107ACE3;
 Tue, 16 Feb 2021 09:49:08 +0000 (UTC)
Received: from redhat.com (ovpn-112-215.ams2.redhat.com [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D6315C6AB;
 Tue, 16 Feb 2021 09:49:02 +0000 (UTC)
Date: Tue, 16 Feb 2021 09:48:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
Message-ID: <YCuVC4T+TFjuskhF@redhat.com>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Pavel.Dovgaluk@ispras.ru, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, crosa@redhat.com,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 12, 2021 at 03:10:00PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Niek and QEMU community,
> 
> On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> > The following are maintenance patches for the Allwinner H3. The first patch
> > is a proposal to relocate the binary artifacts of the acceptance tests away
> > from the apt.armbian.com domain. In the past we had problems with artifacts being
> > removed, and now the recently added Armbian 20.08.1 image has been removed as well:
> > 
> > $ wget https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
> > Connecting to dl.armbian.com (dl.armbian.com)|2605:7900:20::5|:443... connected.
> > ...
> > HTTP request sent, awaiting response... 404 Not Found
> > 2021-02-11 22:34:45 ERROR 404: Not Found.
> > 
> > I've now added the artifacts to a server maintained by me. The machine has a stable
> > uptime of several years, ~100Mbit bandwidth and plenty of available storage.
> > Also for other artifacts if needed. I'm open to discuss if there is a proposal
> > for a better location for these artifacts or a more generic qemu location.
> 
> Thanks for trying to fix this long standing problem.
> 
> While this works in your case, this doesn't scale to the community,
> as not all contributors have access to such hardware and bandwidth /
> storage.
> 
> While your first patch is useful in showing where the artifacts are
> stored doesn't matter - as long as we use cryptographic hashes - I
> think it is a step in the wrong direction, so I am not keen on
> accepting it.
> 
> My personal view is that any contributor should have the same
> possibilities to add tests to the project. Now I am also open to
> discuss with the others :) I might be proven wrong, and it could
> be better to rely on good willing contributors rather than having
> nothing useful at all.

There aren't many options here

 1. Rely on a vendor to provide stable download URLs for images

 2. QEMU host all images we use in testing

 3. Contributor finds some site to upload images to


For the armbian images we rely on (1), but the URLs didn't turn out to be
stable. In fact no OS vendor seems to have guaranteed stable URLs forever,
regardless of distro, though most eventually do have an archive site that
has good life. Armbian was an exception in this respect IIUC.

(2) would solve the long term stability problem as QEMU would be in full
control, and could open it up for any images we need. The big challenge
there is that QEMU now owns the license compliance problem. Merely uploading
binary images/packages without the corresponding source is generally a license
violation. QEMU could provide hosting, but we need to be clear about the fact
that we now own the license compliance problem ourselves. Many sites hosting
images simply ignore this problem, but that doesn't make it right.


This series is proposing (3), with a site the contributor happens to control
themselves, but using a free 3rd party hosting site is no different really.
Again there is a the same need for license compliance, but it is now the
responsibility of the user, not QEMU project.

In this http://www.freenos.org/pub/qemu/cubieboard/ site I can't even see a
directory listing, so even if corresponding source does exist in this server,
I can't find it. 

The isn't really a problem for QEMU CI to consume the images, but as a free
software developer I don't like encouraging practices that are not compliant
with licensing reuqirement.

It is an open question whether the (3) is really better than (1) in terms
of URL stability long term, especially if running off a user's personal
server.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


