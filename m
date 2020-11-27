Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0326B2C65A7
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 13:20:03 +0100 (CET)
Received: from localhost ([::1]:59498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kicjJ-0008Dr-Tx
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 07:20:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kichk-0007NL-Ht
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:18:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kichh-0000ca-GB
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 07:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606479500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1IXb1Gl4HjSG8fvV1ghWTPqZYmyiJAIAjsgk+5Q1TYA=;
 b=Fr5DTokL5/r+PLl3damnVGrtxmOK2Z1pnc5idcPC/CmTgx2URcUL+Es2AINSEUJ3ktHD/o
 R6GD13TV/3T+qH9l6GiClkGZ4gVNIFsmFXaCHKCXahPXSF6DnVMVW0RAEJnp20EiivG18A
 k948aBui7vn0R9ifRiRiGBIQNJAGyQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-acveuB_2PDW4pvibfjyAjQ-1; Fri, 27 Nov 2020 07:18:18 -0500
X-MC-Unique: acveuB_2PDW4pvibfjyAjQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61BEF107ACF7;
 Fri, 27 Nov 2020 12:18:17 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B0E65D6D1;
 Fri, 27 Nov 2020 12:18:12 +0000 (UTC)
Date: Fri, 27 Nov 2020 13:18:09 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201127121809.GB105758@angien.pipo.sk>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
 <20201127114512.GE67322@SPB-NB-133.local>
MIME-Version: 1.0
In-Reply-To: <20201127114512.GE67322@SPB-NB-133.local>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: libvir-list@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 14:45:12 +0300, Roman Bolshakov wrote:
> On Fri, Nov 27, 2020 at 12:21:54PM +0100, Peter Krempa wrote:
> > On Fri, Nov 27, 2020 at 10:50:59 +0000, Daniel Berrange wrote:
> > > Copying libvir-list for the deprecation warning.
> > > 
> > > 
> > > On Mon, Nov 16, 2020 at 04:10:11PM +0300, Roman Bolshakov wrote:
> > > > 'query-accel' QMP command should be used instead.
> > > > 
> > > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > > ---

[...]

> > We try hard to stay on top of such changes by using the new interface as
> > soon as possible, but that is very hard if the replacement changes
> > during the dev cycle.
> > 
> 
> I see, thanks for the explanation! Perhaps I'll drop deprecation from
> the series to avoid the issue.
> 
> Then as soon as libvirt gets support for queyring accels we might
> consider deprecation again.

I don't want to imply that it's entirely necessary to postpone it, but
in such cases the new API which was added to replace the old one needs
to be considered a bit more strongly until the release.

The main reason for this is that libvirt has tests whether it uses any
deprecated interface. If anything is marked as deprecated and our tests
flag it, we add an override. Usually the override is added in the same
patchset which actually implements the new approach.

We obviously can add an override and then wait for the supported
interface, but once the override is added there's nothing to remind us
later on, so I generally like to have everything in one series.

As you can see this has an issue when we have to add support for a
unreleased interface, which may change during the dev cycle or plainly
forget that something got deprecated as we've already added an override.

This mainly comes from libvirt trying to keep on top of the changes so
we refresh the QMP schema during qemu's dev cycle multiple times.

Obviously the argument that we try to depend on unreleased functionality
can be used, but that would be to detrement of progress IMO.


