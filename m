Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B042C696E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 17:31:48 +0100 (CET)
Received: from localhost ([::1]:36268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kigex-0003wm-11
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 11:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kigdl-0003Mh-3i
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kigdg-0002Gf-On
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 11:30:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606494626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wqfj/MrJHtdwNfc5MfSKu1LkHu2ZZqjOqNz4B4Jbg5A=;
 b=W2QZYoAv4ueqZaERHKZb7ze4j7DQLbVF07Xjy3E5xN28JL8nVYStQeefCEEiyN64I2wCHg
 r1bpFEryh2Ja4HJk8OUJxZFHg2DgwYym5zyv58YmM8hDw/cVb47/r1yW2DXK+TbQqe3Ye8
 X7VODq3sKpMVqVQoZxHJdPgzkNov9wM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-VhHOjBakPj-QQpTB8MEW1w-1; Fri, 27 Nov 2020 11:30:24 -0500
X-MC-Unique: VhHOjBakPj-QQpTB8MEW1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEE4D107AD3B;
 Fri, 27 Nov 2020 16:30:22 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4424A5D9D3;
 Fri, 27 Nov 2020 16:30:16 +0000 (UTC)
Date: Fri, 27 Nov 2020 17:30:13 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.0 6/6] qapi: Deprecate 'query-kvm'
Message-ID: <20201127163013.GD105758@angien.pipo.sk>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-7-r.bolshakov@yadro.com>
 <20201127105059.GC1596141@redhat.com>
 <20201127112154.GA105758@angien.pipo.sk>
 <20201127114512.GE67322@SPB-NB-133.local>
 <20201127121809.GB105758@angien.pipo.sk>
 <87h7paoldm.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87h7paoldm.fsf@dusky.pond.sub.org>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 27, 2020 at 16:44:05 +0100, Markus Armbruster wrote:
> Peter Krempa <pkrempa@redhat.com> writes:
> 
> > On Fri, Nov 27, 2020 at 14:45:12 +0300, Roman Bolshakov wrote:
> >> On Fri, Nov 27, 2020 at 12:21:54PM +0100, Peter Krempa wrote:

 [...]

> > As you can see this has an issue when we have to add support for a
> > unreleased interface, which may change during the dev cycle or plainly
> > forget that something got deprecated as we've already added an override.
> >
> > This mainly comes from libvirt trying to keep on top of the changes so
> > we refresh the QMP schema during qemu's dev cycle multiple times.
> >
> > Obviously the argument that we try to depend on unreleased functionality
> > can be used, but that would be to detrement of progress IMO.
> 
> I understand your concerns.
> 
> We have a somewhat similar problem in QEMU: there's nothing to remind us
> later on that the old interface still needs to be deprecated.

Oh, yes. That's basically the same thing.

The thing is that changes to the new interface are very rare, but very
real. Since I don't really want to increase the burden for any normal
scenario.

I'd also very much like to keep libvirt pulling in snapshots of qemu's
capabilities/qapi schema etc throughout the development cycle. It allows
us to adapt faster and develop features simultaneously.

This unfortunately undermines my own arguments partially as libvirt
regularly develops features on top of unreleased qemu features so we are
regularly risking very similar circumstances. The small but important
difference though is, that releasing a broken feature is not as bad as
breaking an existing feature.

As a conclusion of the above I'd basically prefer a sort of gentleman's
agreement, that new APIs become 'somewhat' stable at the moment the
commit deprecating the old interface hits upstream.

The 'somewhat'-stable API would mean that any changes to the new API
should be consulted with libvirt so that we can either give a go-ahead
that we didn't adapt yet, disable the adaptation until the changes can
be done, or another compromise depending on what's the state.

I know it's hard to enforce, but probably the cheapest in terms of
drawbacks any other solution would be.

I'll probably keep notifying patchsets which implement and deprecate old
api at the same time to keep in mind that we need to be kept in touch,
but I really don't want to impose any kind of extra process to
development on either side.


