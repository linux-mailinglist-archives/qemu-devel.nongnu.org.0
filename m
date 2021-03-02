Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6C432A9F8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:06:52 +0100 (CET)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAM7-00049Y-PA
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9g1-0007TI-Ff
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:23:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lH9fx-00034j-42
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614709396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=INUmph5k3H6iZH1aUe1GlchwLfdbkqUT/Yd9aRYibFY=;
 b=B0JX+FWNZo3rnFUjNOtByX4mxr1SkB9zmPls5DVrW5zQZaXuaKBEhyY1X1KHCulaujT7CU
 XPWRqCCIfzLPd8JO2SV7xw74MmP/0WwT3+F6H+7QrpAUHVBh/lSsdItjn99ByoxyRBs48z
 RcFCd9+i+uqDMrK3/fuaqoGjI1RDiv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-5tz2ZRolNv616NmPyqchQA-1; Tue, 02 Mar 2021 13:23:14 -0500
X-MC-Unique: 5tz2ZRolNv616NmPyqchQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5A48799EB;
 Tue,  2 Mar 2021 18:23:13 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-197.ams2.redhat.com [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C4FE169;
 Tue,  2 Mar 2021 18:23:04 +0000 (UTC)
Date: Tue, 2 Mar 2021 19:23:03 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v2 10/31] qapi/qom: Add ObjectOptions for secret*,
 deprecate 'loaded'
Message-ID: <20210302182303.GG5527@merkur.fritz.box>
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-11-kwolf@redhat.com>
 <1d1735c1-2780-4d9a-78dd-b8730c4df553@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1d1735c1-2780-4d9a-78dd-b8730c4df553@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, armbru@redhat.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.02.2021 um 20:17 hat Eric Blake geschrieben:
> On 2/24/21 7:52 AM, Kevin Wolf wrote:
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index 449dca8ec5..2668ad8369 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -7,6 +7,7 @@
> >  { 'include': 'authz.json' }
> >  { 'include': 'block-core.json' }
> >  { 'include': 'common.json' }
> > +{ 'include': 'crypto.json' }
> >  
> >  ##
> >  # = QEMU Object Model (QOM)
> > @@ -449,6 +450,8 @@
> >      'rng-builtin',
> >      'rng-egd',
> >      'rng-random',
> > +    'secret',
> > +    'secret_keyring',
> 
> What is stopping us from naming this 'secret-keyring'?

That it's not the name of the QOM type, so it wouldn't be possible to
create an object from it any more ('secret_keyring' would be rejected by
QAPI, but 'secret-keyring' would be rejected by QOM).

If we ever want to rename the type, this might be a case where QAPI
aliases could help. But I'm almost sure that there would be more
compatibility concerns than just with object creation for renaming a
user creatable QOM type.

Kevin


