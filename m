Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28F31B92C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:27:06 +0100 (CET)
Received: from localhost ([::1]:38798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBcy1-0004sV-RY
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBclF-0000Ud-Eg
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:13:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBcl9-0004DU-9r
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:13:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613391224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=waGAbAnveJsVJDzRwxeaYvgixaFyMXZn1I/SEpen7T4=;
 b=BWNACSLx8op4kz8SfMIwkreZRxwzFUeqhh0YbN9HgjPad9S9+rQaZO2epe3CPY2ZU2Jzib
 WlstGfBcRpZyDaqnhYUnpYAsoCnFbdRIVyEIBrGY7aJyFuXEdVgueeGyMEvkOARn6KsgMy
 4IGHOVIw4XRqtLYf/staU8Q76VN9tuw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-HTQxIEdTPYqfLGPw9RJwbQ-1; Mon, 15 Feb 2021 07:13:42 -0500
X-MC-Unique: HTQxIEdTPYqfLGPw9RJwbQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1EA6801962;
 Mon, 15 Feb 2021 12:13:40 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17ED860C66;
 Mon, 15 Feb 2021 12:13:35 +0000 (UTC)
Date: Mon, 15 Feb 2021 13:13:34 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH V2 1/7] block/rbd: bump librbd requirement to luminous
 release
Message-ID: <20210215121334.GJ7226@merkur.fritz.box>
References: <20210126112540.11880-1-pl@kamp.de>
 <20210126112540.11880-2-pl@kamp.de>
 <20210215102401.GB1542881@redhat.com>
 <4b010479-bd8b-85e9-ef29-88524fef6495@kamp.de>
 <20210215114101.GD1542881@redhat.com>
 <5cc0ff5a-5360-5d81-2da9-724a2baf9f6d@kamp.de>
MIME-Version: 1.0
In-Reply-To: <5cc0ff5a-5360-5d81-2da9-724a2baf9f6d@kamp.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, ct@flyingcircus.io, qemu-devel@nongnu.org,
 mreitz@redhat.com, pbonzini@redhat.com, dillaman@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.2021 um 12:45 hat Peter Lieven geschrieben:
> Am 15.02.21 um 12:41 schrieb Daniel P. Berrangé:
> > On Mon, Feb 15, 2021 at 12:32:24PM +0100, Peter Lieven wrote:
> > > Am 15.02.21 um 11:24 schrieb Daniel P. Berrangé:
> > > > On Tue, Jan 26, 2021 at 12:25:34PM +0100, Peter Lieven wrote:
> > > > > even luminous (version 12.2) is unmaintained for over 3 years now.
> > > > > Bump the requirement to get rid of the ifdef'ry in the code.
> > > > We have clear rules on when we bump minimum versions, determined by
> > > > the OS platforms we target:
> > > > 
> > > >     https://qemu.readthedocs.io/en/latest/system/build-platforms.html
> > > > 
> > > > At this time RHEL-7 is usually the oldest platform, and it
> > > > builds with RBD 10.2.5, so we can't bump the version to 12.2.
> > > > 
> > > > I'm afraid this patch has to be dropped.
> > > 
> > > I have asked exactly this question before I started work on this series and got reply
> > > 
> > > from Jason that he sees no problem in bumping to a release which is already unmaintained
> > > 
> > > for 3 years.
> > I'm afraid Jason is wrong here.  It doesn't matter what the upstream
> > consider the support status to be. QEMU targets what the OS vendors
> > ship, and they still consider this to be a supported version.
> 
> 
> Okay, but the whole coroutine stuff would get a total mess with all
> the ifdef'ry.

Hm, but how are these ifdefs even related to the coroutine conversation?
It's a bit more code that you're moving around, but shouldn't it be
unchanged from the old code, just moving from an AIO callback to a
coroutine? Or am I missing some complications?

> Would it be an option to make a big ifdef in the rbd driver? One with
> old code for < 12.0.0 and one
> 
> with new code for >= 12.0.0?

I don't think this is a good idea, this would be a huge mess to
maintain.

The conversion is probably a good idea in general, simply because it's
more in line with the rest of the block layer, but I don't think it adds
anything per se, so it's hard to justify such duplication with the
benefits it brings.

Kevin


