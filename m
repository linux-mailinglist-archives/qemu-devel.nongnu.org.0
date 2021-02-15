Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3931B94C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:32:03 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBd2o-0000zW-Et
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:32:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBcpT-0005Wz-09
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:18:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBcpR-00067Y-JP
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:18:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613391492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7rGw21wUApGvwOf//pcSyLEc1Q8V/U9V4ioebfmfdLI=;
 b=Bfoh85iii/EOTQdRXpZoejlrZ4ZcvoGEXskqwigkwY+FvMcK8ghgZoE3BKu/WXCZtuI9Aw
 i8zy65KQ0u6/qdhW0+fasQCv+10M0tnXAlu/ocPtzSIHlWRtBWTrGjZzA497Aig0GRYgX2
 7YQRdGjc72oUrmFKHIa5Lf02EQ9llLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-I9BwGTqBPxWL9VhAqxeaVw-1; Mon, 15 Feb 2021 07:18:01 -0500
X-MC-Unique: I9BwGTqBPxWL9VhAqxeaVw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11EE380196E;
 Mon, 15 Feb 2021 12:18:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17F7519C79;
 Mon, 15 Feb 2021 12:17:54 +0000 (UTC)
Date: Mon, 15 Feb 2021 13:17:53 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
Message-ID: <20210215121753.GK7226@merkur.fritz.box>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de>
 <20210215101123.GC7226@merkur.fritz.box>
 <20210215101911.GA1542881@redhat.com>
 <3c6dd9d8-f842-dd9b-e56b-0bb07357f975@kamp.de>
MIME-Version: 1.0
In-Reply-To: <3c6dd9d8-f842-dd9b-e56b-0bb07357f975@kamp.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, ct@flyingcircus.io,
 mreitz@redhat.com, pbonzini@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.2021 um 12:34 hat Peter Lieven geschrieben:
> Am 15.02.21 um 11:19 schrieb Daniel P. Berrangé:
> > On Mon, Feb 15, 2021 at 11:11:23AM +0100, Kevin Wolf wrote:
> > > Am 26.01.2021 um 12:25 hat Peter Lieven geschrieben:
> > > > even luminous (version 12.2) is unmaintained for over 3 years now.
> > > > Bump the requirement to get rid of the ifdef'ry in the code.
> > > > 
> > > > Signed-off-by: Peter Lieven <pl@kamp.de>
> > > > diff --git a/meson.build b/meson.build
> > > > index 5943aa8a51..02d263ad33 100644
> > > > --- a/meson.build
> > > > +++ b/meson.build
> > > > @@ -691,19 +691,24 @@ if not get_option('rbd').auto() or have_block
> > > >                              required: get_option('rbd'),
> > > >                              kwargs: static_kwargs)
> > > >     if librados.found() and librbd.found()
> > > > -    if cc.links('''
> > > > +    result = cc.run('''
> > > Doesn't running compiled binaries break cross compilation?
> > > 
> > > >         #include <stdio.h>
> > > >         #include <rbd/librbd.h>
> > > >         int main(void) {
> > > >           rados_t cluster;
> > > >           rados_create(&cluster, NULL);
> > > > +        rados_shutdown(cluster);
> > > > +        #if LIBRBD_VERSION_CODE < LIBRBD_VERSION(1, 12, 0)
> > > > +        return 1;
> > > > +        #endif
> > > >           return 0;
> > > Would #error achieve what you want without running the binary?
> > > 
> > > But most, if not all, other version checks use pkg-config instead of
> > > trying to compile code, so that's probably what we should be doing here,
> > > too.
> > Yep, for something that is merely a version number check there's no
> > need to compile anything. pkg-config can just validate the version
> > straightup.
> 
> 
> I would have loved to, but at least the Ubuntu/Debian packages do not
> contain pkg-config files.

Oh. That's a shame.

> I can switch to #error, of course. My initial version of the patch
> distinguished between can't compile and version is too old. With
> #error we just can say doesn't compile, but I think this would be ok.

Yes, I think #error and a less specific message is better than breaking
cross compilation.

Maybe also add a comment as to why we can't use pkg-config so that
others won't take it as an example where pkg-config would work.

Kevin


