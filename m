Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E732A9F1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:04:14 +0100 (CET)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAJZ-0001XP-9m
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9bC-0008Jr-1C
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:18:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9bA-0002JR-2u
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614709098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ei+3swb5JbF0hpDNdLdmqz5ir11LoKdo90CLl24TqmQ=;
 b=X/T3XtKcHyUe7yzGiDUMi9nv7U3jyY/hDJ9O8fHqni60+XwSUR48qXLrP8y+UQCEcTSeWe
 p4VdAlcK6pov9c12oHt/mXr2X8zhz0Ro7Dx7ZogZytRXTGSYhCOz1HJzC7y9hbVvIq/U06
 zneT9s+mXnK4h70GHbPtVMTHatbCECI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-jzBxWx4yO9OVGbYaxssH_w-1; Tue, 02 Mar 2021 13:18:16 -0500
X-MC-Unique: jzBxWx4yO9OVGbYaxssH_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EED90AFA81;
 Tue,  2 Mar 2021 18:18:15 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EE185D9E2;
 Tue,  2 Mar 2021 18:18:07 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:18:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 09/31] qapi/qom: Add ObjectOptions for throttle-group
Message-ID: <20210302181805.GF5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-10-kwolf@redhat.com>
 <4cde0059-def8-4a12-f6b5-823ab8514702@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4cde0059-def8-4a12-f6b5-823ab8514702@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 18:26 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > This adds a QAPI schema for the properties of the throttle-group object.
> > 
> > The only purpose of the x-* properties is to make the nested options in
> > 'limits' available for a command line parser that doesn't support
> > structs. Any parser that will use the QAPI schema will supports structs,
> > though, so they will not be needed in the schema in the future.
> > 
> > To keep the conversion straightforward, add them to the schema anyway.
> > We can then remove the options and adjust documentation, test cases etc.
> > in a separate patch.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/block-core.json | 27 +++++++++++++++++++++++++++
> >  qapi/qom.json        |  7 +++++--
> >  2 files changed, 32 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/block-core.json b/qapi/block-core.json
> > index 9f555d5c1d..a67fa0cc59 100644
> > --- a/qapi/block-core.json
> > +++ b/qapi/block-core.json
> > @@ -2504,6 +2504,33 @@
> >              '*bps-write-max' : 'int', '*bps-write-max-length' : 'int',
> >              '*iops-size' : 'int' } }
> >  
> > +##
> > +# @ThrottleGroupProperties:
> > +#
> > +# Properties for throttle-group objects.
> 
> Corresponds to block/throttle-groups.c:throttle_group_obj_class_init()
> with its ThrottleParamInfo struct for the x- fields, and limits as-is.
> 
> > +#
> > +# The options starting with x- are aliases for the same key without x- in
> > +# the @limits object. As indicated by the x- prefix, this is not a stable
> > +# interface and may be removed or changed incompatibly in the future. Use
> > +# @limits for a supported stable interface.
> > +#
> > +# @limits: limits to apply for this throttle group
> 
> And I did check that qapi/block-core.json:ThrottleLimits has the same
> fields as the ThrottleParamInfo x- fields.  All this duplication!  But
> we're getting to a state where it will be easier to clean up the cruft.

Indeed, after this series you can use 'limit' everywhere, so there is no
real reason for the x- fields to stay. I almost included the removal in
this series, but then it turned out that some more test cases depend on
it than I wanted to fix up on the side. But it's an obvious follow-up
series.

Kevin


