Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B60732420C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 17:27:49 +0100 (CET)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEx0t-000283-SN
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 11:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEwzB-0001DI-TU
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:26:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEwz9-0005I4-40
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 11:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614183958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gMkmyKX6gKMIkZECDeIqbIq4AJ7QzolxUyYQoYp7zb0=;
 b=fbj5E+Bg67ZHGUQSVPKi4hyBy64OcxLxT/dIXOpwk8w1asTEz4EzE1Ql7EORf7pNPuUyWC
 neXpAjtlN07g5H1JPmDe6DJqncmY9ZQrRJBXg1V/hmjhZDwjt+auRSPtQuImzu2m0BlPup
 bkBkImyCl6hxq5G1XBtHr4bwkTSDc2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-NWF8afzNPpip9o8_oqbNBg-1; Wed, 24 Feb 2021 11:25:55 -0500
X-MC-Unique: NWF8afzNPpip9o8_oqbNBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05188835E21;
 Wed, 24 Feb 2021 16:25:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60F242C168;
 Wed, 24 Feb 2021 16:25:45 +0000 (UTC)
Date: Wed, 24 Feb 2021 17:25:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 16/31] qapi/qom: Add ObjectOptions for
 confidential-guest-support
Message-ID: <20210224162543.GF11025@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-17-kwolf@redhat.com>
 <YDZvAGrnlhPzodbU@work-vm>
MIME-Version: 1.0
In-Reply-To: <YDZvAGrnlhPzodbU@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.2021 um 16:21 hat Dr. David Alan Gilbert geschrieben:
> * Kevin Wolf (kwolf@redhat.com) wrote:
> > This adds a QAPI schema for the properties of the objects implementing
> > the confidential-guest-support interface.
> > 
> > pef-guest and s390x-pv-guest don't have any properties, so they only
> > need to be added to the ObjectType enum without adding a new branch to
> > ObjectOptions.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/qom.json | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index e7184122e9..d5f68b5c89 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -633,6 +633,38 @@
> >    'base': 'RngProperties',
> >    'data': { '*filename': 'str' } }
> >  
> > +##
> > +# @SevGuestProperties:
> > +#
> > +# Properties for sev-guest objects.
> > +#
> > +# @sev-device: SEV device to use (default: "/dev/sev")
> > +#
> > +# @dh-cert-file: guest owners DH certificate (encoded with base64)
> > +#
> > +# @session-file: guest owners session parameters (encoded with base64)
> > +#
> > +# @policy: SEV policy value (default: 0x1)
> > +#
> > +# @handle: SEV firmware handle (default: 0)
> > +#
> > +# @cbitpos: C-bit location in page table entry (default: 0)
> > +#
> > +# @reduced-phys-bits: number of bits in physical addresses that become
> > +#                     unavailable when SEV is enabled
> > +#
> > +# Since: 2.12
> > +##
> > +{ 'struct': 'SevGuestProperties',
> > +  'data': { '*sev-device': 'str',
> > +            '*dh-cert-file': 'str',
> > +            '*session-file': 'str',
> > +            '*policy': 'uint32',
> > +            '*handle': 'uint32',
> > +            '*cbitpos': 'uint32',
> > +            'reduced-phys-bits': 'uint32' },
> > +  'if': 'defined(CONFIG_SEV)' }
> > +
> >  ##
> >  # @ObjectType:
> >  #
> > @@ -661,12 +693,15 @@
> >      'memory-backend-file',
> >      'memory-backend-memfd',
> >      'memory-backend-ram',
> > +    {'name': 'pef-guest', 'if': 'defined(CONFIG_PSERIES)' },
> >      'pr-manager-helper',
> >      'rng-builtin',
> >      'rng-egd',
> >      'rng-random',
> >      'secret',
> >      'secret_keyring',
> > +    {'name': 'sev-guest', 'if': 'defined(CONFIG_SEV)' },
> > +    's390-pv-guest',
> 
> If pef-guest is conditional on PSERIES< shouldn't this be dependent on
> s390?

The difference is that s390-pv-guest is compiled unconditionally if the
s390x target is built, whereas CONFIG_PSERIES is a separate thing from
building a ppc target.

I actually tried making it conditional on TARGET_S390X at first, but the
code generated from this schema is supposed to be target independent, so
it rightly failed to build because TARGET_* are marked as poisoned in
most of the codebase.

Kevin


