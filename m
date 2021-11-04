Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7AC445565
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:34:03 +0100 (CET)
Received: from localhost ([::1]:44362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midoY-0000kQ-MX
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1midhh-0006Pz-CM
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:26:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1midhf-0004cB-6H
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636036014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9qVmHb24Dpz2hpbtPZFNbaSJn4mWha+cCr6ovRmLAuc=;
 b=LpwHaVJIxg78YckOX4lSBs5vvnGIdbc5gaOIq7RwNT8DZiDlZIzOzRtFr2F/6yyrZw75oo
 TDkxukx4yWAVlkTjpnSDuaNKNg2vtTHmP+M6Rf1kNrECA/vYqPbRCLEAKxaHVHo3gsJJJt
 j7YH9sAGfzNqx+qR+nAQ0xyKgV4G5qs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-9dVR1fvqOgC2DNfP60Ifdw-1; Thu, 04 Nov 2021 10:26:51 -0400
X-MC-Unique: 9dVR1fvqOgC2DNfP60Ifdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EA7E1054F91
 for <qemu-devel@nongnu.org>; Thu,  4 Nov 2021 14:26:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47A685F4ED;
 Thu,  4 Nov 2021 14:26:43 +0000 (UTC)
Date: Thu, 4 Nov 2021 15:26:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 00/12] QOM/QAPI integration part 1
Message-ID: <YYPtokwlkWzhrJ2u@redhat.com>
References: <20211103173002.209906-1-kwolf@redhat.com>
 <8e630c96-5d2c-d214-e594-6162356990b0@redhat.com>
 <YYOiyTcA6zZgtWBs@redhat.com>
 <13f8981a-55e5-e5d9-415f-4658aba16270@redhat.com>
MIME-Version: 1.0
In-Reply-To: <13f8981a-55e5-e5d9-415f-4658aba16270@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: eblake@redhat.com, berrange@redhat.com, armbru@redhat.com,
 ehabkost@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 04.11.2021 um 13:39 hat Paolo Bonzini geschrieben:
> On 11/4/21 10:07, Kevin Wolf wrote:
> > The class implementations always want to store only their "local" config
> > options, but 'qom-config:classname' contains those of the parent class
> > as well.
> 
> Ah, I didn't understand that (hence the rubbish tag above).  It makes sense
> given that instance_config is called per-class while ObjectOptions stores
> all the info in one class.  That's a major change from my sketch, which
> planned to call the base class config function by hand (and handle the
> marshalling via QAPI 'base': '...').

Yeah, handling inheritance and how to represent things in the schema is
probably the two more interesting things this series changes compared to
your proposal.

I started with your model, but it just didn't work out nicely, because I
always had the full configuration in the child class and apart from just
being ugly, having all options of the parent class duplicated, but
ignored, would certainly be a source for a lot of confusion and bugs.

It took me a while to figure out how to deal with this, but I'm quite
happy with the result.

> > Oh, and I also wanted to say something about why not just directly using
> > the class name, which was my first idea: 'foo': 'iothread' looks more
> > like referencing an existing iothread rather than the configuration for
> > a new one. I wanted to leave us the option that we could possibly later
> > take a string for such options (a QOM path) and then pass the referenced
> > object to QMP commands as the proper QOM type.
> 
> I agree that 'iothread' is going to be confusing when you're referring to
> the configuration.
> 
> Anyway I'm totally fine with 'qom-config:classname'.  Given this
> explanation, however, one alternative that makes sense could be
> 'classname:full-config'. Then you could use 'classname:config' for the
> autoboxed configs---and reserve 'classname' to mean the pointer to an
> object.  Classes are (generally) lowercase and QAPI structs are
> CamelCase, so there is not much potential for collisions.

Makes sense to me, too.

I just checked and I actually already forbid class names with colons in
them (check_name_str() takes care of this), so yes, suffixes actually
work on the QAPI level.

If we actually want to use these types in manually written C code, we
might have to convert the name to CamelCase, though, for consistency
with the coding style.

We already have a function camel_to_upper(), we'd need a new
lower_to_camel(), so that from a class 'rng-random', you would get types
'RngRandomConfig' (the local ones) and 'RngRandomFullConfig' (with
parent options).

Kevin


