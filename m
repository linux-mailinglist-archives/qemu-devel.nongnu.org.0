Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0562FCD8F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 10:50:31 +0100 (CET)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2A8E-0001AT-Kn
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 04:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2A7Q-0000ki-Mb
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:49:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2A7P-0003op-01
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 04:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611136178;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cDxUHqQa95mAMcM0Z2L+82PqsISic+24yS8NEEnTaPA=;
 b=hjY31Gj9YgEe3ySCCi4pys+BnlxsoVXNWSgMY5jceGR2d4wRpGUah9KKLCR2x0wlDVZhsO
 5SJrA9KHXtwFrD1E6nTeiQc6IcDXfL2FMSW26kfdxu7WZHhTSS/8iejx00gbfBtCWjrbwY
 xkVGUysmFjv8SCI+ykS1G1oKDoowqHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-4oJxX_z3MSi5ZhR-8bgSDQ-1; Wed, 20 Jan 2021 04:49:35 -0500
X-MC-Unique: 4oJxX_z3MSi5ZhR-8bgSDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91EE18018A1;
 Wed, 20 Jan 2021 09:49:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-126.ams2.redhat.com [10.36.115.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E2162462;
 Wed, 20 Jan 2021 09:49:29 +0000 (UTC)
Date: Wed, 20 Jan 2021 09:49:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] usb: Fix clang build
Message-ID: <20210120094926.GD3015589@redhat.com>
References: <20210119230741.810007-1-eblake@redhat.com>
 <fd1b9e5f-5436-2cd7-d97a-c6136ce43c95@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fd1b9e5f-5436-2cd7-d97a-c6136ce43c95@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 20, 2021 at 12:20:43AM +0100, Philippe Mathieu-Daudé wrote:
> Hi Eric,
> 
> On 1/20/21 12:07 AM, Eric Blake wrote:
> > ../hw/usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> >     uas_iu                    status;
> >                               ^
> > 
> > Fix this by specifying a size for the add_cdb member; and at present,
> > the code does not actually use that field other than for the size
> > chosen for the packed uas_iu_command struct, and the choice of one
> > byte does not change the size of the uas_iu union.
> 
> I sent a maybe safer approach (from the bus PoV):
> https://www.mail-archive.com/qemu-block@nongnu.org/msg79192.html
> 
> Do you mind reviewing it?
> 
> > 
> > Signed-off-by: Eric Blake <eblake@redhat.com>
> > ---
> > 
> > I'm not sure why none of our CI tools pick up this particular clang
> > build failure; I hit it on Fedora 33 when configuring to build the
> > entire tree with clang.
> 
> Same issue after upgrading to f33. I sent a patch to bump our CI:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg774117.html
> 
> To track Fedora releases I was thinking about a gitlab job checking
> if we are using the latest, else failing; smth as:
> 
>  $ curl https://getfedora.org/ | grep -q 'Fedora 33 released'

We'd be better off just adding a job that targets Fedora rawhide IMHO so
we get immediate notice that a toolchain update is going to hurt us, instead
of waiting until the next Fedora is already released to find the problem.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


