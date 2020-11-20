Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA72BAD14
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:09:09 +0100 (CET)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg827-0003qj-Ut
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:09:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kg80G-0002tG-Ip
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:07:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kg80E-0004nd-5C
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 10:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605884829;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=eOcCuMJJ9W2RRoJiZsYOlH1rHwftD7AcxVgqG3MGC6c=;
 b=dTZC5NQCobuspFS0XMW2SbEzn7fmdtIktIIcJd2AUTyumZ2xkefn1tDAMn5RmQG3SxMFQe
 BbFbA5UEUGOskG6CCw8z2zBYUpyoH8fpPrC5yrQgF18ZD2EUCOUzBsgwOfbefopip7H2rq
 8/f8OYBVUdfmM99/lOcW/xReWUhyNVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-P5E-YbT9PD22gwgp9e69AQ-1; Fri, 20 Nov 2020 10:07:04 -0500
X-MC-Unique: P5E-YbT9PD22gwgp9e69AQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 781AE1DDE3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 15:07:03 +0000 (UTC)
Received: from redhat.com (ovpn-114-243.ams2.redhat.com [10.36.114.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEB7610016DB;
 Fri, 20 Nov 2020 15:06:58 +0000 (UTC)
Date: Fri, 20 Nov 2020 15:06:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH 5/6] qapi: Add support for aliases
Message-ID: <20201120150656.GE671408@redhat.com>
References: <20201112172850.401925-1-kwolf@redhat.com>
 <20201112172850.401925-6-kwolf@redhat.com>
 <7864bd70-5567-134f-9238-bbed8a5fbfdb@redhat.com>
 <20201113094602.GB5834@merkur.fritz.box>
 <20201120144154.GT2366@angien.pipo.sk>
MIME-Version: 1.0
In-Reply-To: <20201120144154.GT2366@angien.pipo.sk>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, libvir-list@redhat.com, jsnow@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 03:41:54PM +0100, Peter Krempa wrote:
> On Fri, Nov 13, 2020 at 10:46:02 +0100, Kevin Wolf wrote:
> > Am 12.11.2020 um 19:34 hat Eric Blake geschrieben:
> > > On 11/12/20 11:28 AM, Kevin Wolf wrote:
> > > > Introduce alias definitions for object types (structs and unions). This
> > > > allows using the same QAPI type and visitor for many syntax variations
> > > > that exist in the external representation, like between QMP and the
> > > > command line. It also provides a new tool for evolving the schema while
> > > > maintaining backwards compatibility during a deprecation period.
> > > 
> > > Cool! Obvious followup patch series: deprecate all QAPI members spelled
> > > with _ by making them aliases of new members spelled with -, so that we
> > > can finally have consistent spellings.
> > 
> > Ah, that's a nice one, too. I didn't even think of it. Another one I'd
> > like to see is deprecation of SocketAddressLegacy.
> > 
> > There is one part missing in this series that we would first need to
> > address before we can actually use it to evolve parts of the schema that
> > are visible in QMP: Exposing aliases in introspection and expressing
> > that the original name of something is deprecated, but the alias will
> > stay around (and probably also deprecating an alias without the original
> > name or other aliases).
> > 
> > If we can easily figure out a way to express this that everyone agrees
> > with, I'm happy to include it in this series. Otherwise, since the first
> > user is the command line and not QMP, I'd leave that for the future.
> > 
> > For example, imagine we have an option 'foo' with a new alias 'bar'. If
> > we just directly expose the alias rule (which would be the simplest
> > solution from the QEMU perspective), management will check if the alias
> > exists before accessing 'bar'. But in the final state, we remove 'foo'
> > and 'bar' is not an alias any more, so the introspection for 'bar' would
> > change. Is this desirable?
> > 
> > On the other hand, we can't specify both as normal options because you
> > must set (at most) one of them, but not both. Also exposing things as
> > normal options becomes hard with wildcard aliases (mapping all fields
> > from a nested struct), especially if unions are involved where some
> > options exist in one or two variants, but not in others.
> > 
> > Given this, I think just exposing the alias rules and letting the
> > management tool check both alternatives - if the alias rule or the
> > future option exists - might actually still be the least bad option.
> > 
> > Hmm, I guess I should CC libvirt for this discussion, actually. :-)
> 
> I can see how that simplifies things for qemu in the long run, but to be
> honest, if you then deprecate the old name, libvirt will need to add a
> translation table for it. Either explicit by detecting the new name and
> adapting the code or by adding a lookup table or something. This would
> be needed as if you then remove the alias itself we'd no longer be able
> to use it, so I'm not entirely a fan of it, especially the deprecation
> bit.

To be fair, a key part of libvirt's value add is that it provides the
stable API to applications, insulating them from hypervisor changes.
This enables QEMU to make incompatible changes in a reasonable timeframe,
without breaking the end applications.

Of course there is a trade off here because every time QEMU changes,
libvirt gets to add back compat code to its maint burden, but the
premise is that this is still cheaper overall.

We don't want QEMU to gratuitously break things for no reason, but
if there's a compelling reason to change QEMU, libvirt is there to pick
up the pieces to protect applications.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


