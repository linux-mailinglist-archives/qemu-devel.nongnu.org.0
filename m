Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1AF32A821
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:28:50 +0100 (CET)
Received: from localhost ([::1]:50268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8pE-0003ON-Vd
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:28:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH8oK-0002tP-4W
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:27:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH8oH-0002kX-8Z
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614706068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2apmfOVrU0bMOb/QBAFt+HYe4C4C4phBnxCY0VVW+ws=;
 b=VlZ2/7DMFIjfCadjweU9HNVd6hPfnOrFWdcDvqWGmhO2u6ZXl0sKShTaMbOEh5ewark+nl
 pmJRs/nBdN3q9BYf0zvOFqSDfx5FiqsbLNXYXueoDIz228pLYxal4LL37iVz4hnwbwCLVJ
 JA0ucRizjuZwGwQw4ccoR4TOpqOQUeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ywXD2YSKOTq81yf73nnRWQ-1; Tue, 02 Mar 2021 12:27:46 -0500
X-MC-Unique: ywXD2YSKOTq81yf73nnRWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89E038799EB;
 Tue,  2 Mar 2021 17:27:45 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C8536086F;
 Tue,  2 Mar 2021 17:27:36 +0000 (UTC)
Date: Tue, 2 Mar 2021 18:27:35 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 03/31] qapi/qom: Add ObjectOptions for iothread
Message-ID: <20210302172735.GC5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-4-kwolf@redhat.com>
 <c71ca8da-8def-e4f4-4c72-fd87b1334017@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c71ca8da-8def-e4f4-4c72-fd87b1334017@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.02.2021 um 23:55 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > Add an ObjectOptions union that will eventually describe the options of
> > all user creatable object types. As unions can't exist without any
> > branches, also add the first object type.
> > 
> > This adds a QAPI schema for the properties of the iothread object.
> > 
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  qapi/qom.json | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index 96c91c1faf..bf2ecb34be 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -202,6 +202,59 @@
> >    'returns': [ 'ObjectPropertyInfo' ],
> >    'allow-preconfig': true }
> >  
> > +##
> > +# @IothreadProperties:
> > +#
> > +# Properties for iothread objects.
> > +#
> > +# @poll-max-ns: the maximum number of nanoseconds to busy wait for events.
> > +#               0 means polling is disabled (default: 32768 on POSIX hosts,
> > +#               0 otherwise)
> > +#
> > +# @poll-grow: the multiplier used to increase the polling time when the
> > +#             algorithm detects it is missing events due to not polling long
> > +#             enough. 0 selects a default behaviour (default: 0)
> > +#
> > +# @poll-shrink: the divisor used to decrease the polling time when the
> > +#               algorithm detects it is spending too long polling without
> > +#               encountering events. 0 selects a default behaviour (default: 0)
> 
> Matches PollParamInfo declarations in iothread.c.
> 
> > +#
> > +# Since: 2.0
> 
> How did you determine this value?  (I'm not questioning it being
> something other than 6.0, because we have indeed supported QMP
> configuration of these values via the untyped magic previously present
> in add-object).

I had 6.0 in v1 of the series, but Paolo requested that I make it the
version when the object was introduced (which is arguably the more
useful information to provice), so that's what I did.

In simple cases like here, the object type was introduced together with
a new source file. In these cases it was 'git log iothread.c', finding
the first commit and then 'git describe --contains $COMMIT'. In more
complex cases basically the same, except that finding the right commit
was sometimes a little bit harder and may have involved 'git blame'.

> > +##
> > +{ 'struct': 'IothreadProperties',
> > +  'data': { '*poll-max-ns': 'int',
> > +            '*poll-grow': 'int',
> > +            '*poll-shrink': 'int' } }
> 
> These are correctly typed per the code in iothread.c, but it does raise
> the question of whether a signed 64-bit value is the best choice, or if
> we might later want to revisit things to pick more constrained types.  I
> don't think such an audit should hold up this series, though.

Yes, I'm just representing in the schema what is already there in the
code.

Kevin


