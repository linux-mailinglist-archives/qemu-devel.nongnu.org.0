Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DD02B810B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:47:08 +0100 (CET)
Received: from localhost ([::1]:34346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfPfn-0006xr-AM
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfPe2-0005sQ-7N
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:45:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfPdz-0005W2-9r
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605714312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7xgZCEMv5Bc5HsdeilZjHRkSDmX4YdYITpm0NczPrwA=;
 b=cg/9Nhq4D/wdLk9goDGcTKz69a5nLyCTaVRrlZgUHpCahk/t6ZEpn7X3GBsOPAmB9c7FwS
 CCwuLEZrxYQ02g9FSsS28B57LHGb3SOqKvE2ag3uFvMNebLzmbj77JOiYQXSmL2sLAfpT2
 QJalYsDv8GrU0S+j/qx5yoTLpefeS7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-uu9K9fJbO0yjFIdNpCxYkg-1; Wed, 18 Nov 2020 10:45:10 -0500
X-MC-Unique: uu9K9fJbO0yjFIdNpCxYkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 416B5803F7B;
 Wed, 18 Nov 2020 15:45:09 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA87710016DB;
 Wed, 18 Nov 2020 15:45:08 +0000 (UTC)
Date: Wed, 18 Nov 2020 10:45:07 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH for-6.0 1/6] qapi: Add query-accel command
Message-ID: <20201118154507.GI1509407@habkost.net>
References: <20201116131011.26607-1-r.bolshakov@yadro.com>
 <20201116131011.26607-2-r.bolshakov@yadro.com>
 <2d934855-ad11-9f61-28a1-7c0a35347a66@redhat.com>
 <20201116211352.GC1235237@habkost.net>
 <87mtzgbc29.fsf@dusky.pond.sub.org>
 <20201118011917.GB10041@SPB-NB-133.local>
 <87ft57oycu.fsf@dusky.pond.sub.org>
 <20201118112845.GA11988@merkur.fritz.box>
 <20201118115612.GD229461@redhat.com>
 <87blfukbzd.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87blfukbzd.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 02:53:26PM +0100, Markus Armbruster wrote:
[...]
> Another way to skin this cat:
> 
>       {"available": {"kvm": { extra properties... },
>                      "tcg": ...,
>                      "xen": ...},
>        "active": "kvm"}

How would this structure be represented in the QAPI schema?

In other words, how do I say "Dict[str, AccelInfo]" in QAPIese?

> 
> No need for unions then.  "No dupes" is enforced.
> 
> We could inline "available":
> 
>       {"kvm": { extra properties... },
>        "tcg": ...,
>        "xen": ...,
>        "active": "kvm"}
> 
> Future accelerators can't be named "active" then.
> 
> > I guess this can be extended with a union to report extra props for the
> > accelerator, discriminated on the 'active' field eg
> >
> >      { 'available': [ 'kvm', 'tcg', 'xen' ],
> >        'active': 'kvm',
> >        'data': {
> >            "allow-nested": true,
> >        }
> >     }
> 
> Correct.

-- 
Eduardo


