Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CAA2612A0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 16:24:26 +0200 (CEST)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFeXp-0000oe-Ez
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 10:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFeWm-0008J8-BR
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:23:20 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38841
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFeWk-0006Gg-Mp
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 10:23:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599574997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZcuKtETQ6Ofw5Qdq82Ic7IsmZKsJX4vLsZIf0BkHnPU=;
 b=GVsqEeqQMa0ZJXxfPS65+DxxdCn1zdmDLZcJl60woEiN47waSNy9bVw+82WCa5o19IkSFe
 mR1jhoV2Kij9KNEPGWB5d0wikIj6wzTbIvqW9WJ15Uq70MCT1nUdRr4a3VHWYP+AJ5x6lK
 VG7qx75n+ecyLAnc11yMl5KpuLRVRA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-0HuWod-OM5mBD4H5N3EtIw-1; Tue, 08 Sep 2020 10:23:15 -0400
X-MC-Unique: 0HuWod-OM5mBD4H5N3EtIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A131B2FD03;
 Tue,  8 Sep 2020 14:23:14 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-55.ams2.redhat.com [10.36.113.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA53460DA0;
 Tue,  8 Sep 2020 14:23:09 +0000 (UTC)
Date: Tue, 8 Sep 2020 16:23:08 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH 1/4] docs: lift block-core.json rST header into parents
Message-ID: <20200908142308.GD8175@linux.fritz.box>
References: <20200908093113.47564-1-stefanha@redhat.com>
 <20200908093113.47564-2-stefanha@redhat.com>
 <f5de1038-5bf3-8bd4-d664-45d6f201ae9b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f5de1038-5bf3-8bd4-d664-45d6f201ae9b@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 03:00:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 afrosi@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 08.09.2020 um 14:03 hat Laszlo Ersek geschrieben:
> Hi Stefan,
> 
> On 09/08/20 11:31, Stefan Hajnoczi wrote:
> > block-core.json is included from several places. It has no way of
> > knowing what header level (h1, h2, ...) is appropriate. Sphinx reports
> > errors when it encounters an h2 header where it expects an h1 header.
> > This issue prevents the next patch from generating documentation for
> > qemu-storage-daemon QMP commands.
> > 
> > Move the header into parents so that the correct header level can be
> > used. Note that transaction.json is not updated since it doesn't seem to
> > need a header.
> > 
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  docs/interop/firmware.json | 4 ++++
> >  qapi/block-core.json       | 4 ----
> >  qapi/block.json            | 1 +
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/docs/interop/firmware.json b/docs/interop/firmware.json
> > index 989f10b626..48af327f98 100644
> > --- a/docs/interop/firmware.json
> > +++ b/docs/interop/firmware.json
> > @@ -15,6 +15,10 @@
> >  ##
> >  
> >  { 'include' : 'machine.json' }
> > +
> > +##
> > +# == Block devices
> > +##
> >  { 'include' : 'block-core.json' }
> >  
> >  ##
> 
> I think "docs/interop/firmware.json" deserves the same treatment as
> "transaction.json".
> 
> It's been a long time since I last looked at a rendered view of
> "docs/interop/firmware.json", but it only includes "block-core.json" so
> it can refer to some block-related types (@BlockdevDriver seems like the
> main, or only, one).
> 
> I wouldn't expect the rendered view of "firmware.json" to have a section
> header saying "Block devices".
> 
> I think it should be fine to drop this hunk (and my CC along with it ;))

I think this is actually a more general problem with the way we generate
the documentation. For example, the "Background jobs" documentation ends
up under "Block Devices" just because qapi-schema.json includes
block-core.json before job.json and block-core.json includes job.json to
be able to access some types.

Maybe we should always look for the least nested include directive to
figure out where the documentation should be placed. Then things
directly referenced by qapi-schema.json would always be on the top
level.

Possibly we would then want to remove some includes from
qapi-schema.json and include them only from some other file to group
documentation sections that actually make sense to be grouped together.

Kevin


