Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5A740FADF
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:56:13 +0200 (CEST)
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRFHg-0006yn-FJ
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:56:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mRFC0-0006pS-To
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:50:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1mRFBz-00060w-1W
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631890217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xz/HoEOYThLgiJpePea/6JVoSbGp9+Bf/q/iDV48SZM=;
 b=b05jNFsWGN8TkQj+TdsXcmWwiPcOPIpE48MpkO5KmzNfmfLpFNf79A1nwDD87K9jFQJYDQ
 cnzwkjsCx8Dt919rMBfmM+aMgfxzNbFkJFOaA2isSq08TeDPSQkyJ2Xd0jHAq0Z0VxoCvS
 z51A1y5bF1eU0p/8Glo+7iAQSr6vuZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-P_cPlnSqMUmZh3iBVVOWMw-1; Fri, 17 Sep 2021 10:50:15 -0400
X-MC-Unique: P_cPlnSqMUmZh3iBVVOWMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9F0684A5E1;
 Fri, 17 Sep 2021 14:50:14 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27FC06A904;
 Fri, 17 Sep 2021 14:49:36 +0000 (UTC)
Date: Fri, 17 Sep 2021 16:49:33 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC 1/5] qapi: Enable enum member introspection to show
 more than name
Message-ID: <YUSq/ZDfLPInPIc8@angien.pipo.sk>
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915192425.4104210-2-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berrange@redhat.com,
 libvir-list@redhat.com, eblake@redhat.com, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 21:24:21 +0200, Markus Armbruster wrote:
> The next commit will add feature flags to enum members.  There's a
> problem, though: query-qmp-schema shows an enum type's members as an
> array of member names (SchemaInfoEnum member @values).  If it showed
> an array of objects with a name member, we could simply add more
> members to these objects.  Since it's just strings, we can't.
> 
> I can see three ways to correct this design mistake:
> 
> 1. Do it the way we should have done it, plus compatibility goo.
> 
>    We want a ['SchemaInfoEnumMember'] member in SchemaInfoEnum.  Since
>    changing @values would be a compatibility break, add a new member
>    @members instead.
> 
>    @values is now redundant.  We should be able to get rid of it
>    eventually.
> 
>    In my testing, output of qemu-system-x86_64's query-qmp-schema
>    grows by 11% (18.5KiB).

I prefer this one. While the schema output grows, nobody is really
reading it manually.

The implementation in libvirt is very straightforward:

https://gitlab.com/pipo.sk/libvirt/-/commit/24f1709cfae72cd765d02dc2124d6c954554ea55
https://gitlab.com/pipo.sk/libvirt/-/commit/5909db9d4994327b3f64d5c329edd4b175495bfe

> 2. Like 1, but omit "boring" elements of @member, and empty @member.
> 
>    @values does not become redundant.  Output of query-qmp-schema
>    grows only as we make enum members non-boring.

This has 2 drawbacks:
- we would never get rid of either of those
- clients would have to check both, one for whether the member is
  present and second whether it's non-boring.

IMO it's simpler for clients just to prefer the new approach when
present as the old is simply a subset.

> 3. Versioned query-qmp-schema.
> 
>    query-qmp-schema provides either @values or @members.  The QMP
>    client can select which version it wants.

At least for libvirt this poses a chicken & egg problem. We'd have to
query the schema to see that it has the switch to do the selection and
then probe with the modern one.


