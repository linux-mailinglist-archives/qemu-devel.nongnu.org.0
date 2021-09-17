Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040AC40F9D5
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 15:58:22 +0200 (CEST)
Received: from localhost ([::1]:50022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRENh-0007wz-3f
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 09:58:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mREMs-0007B9-L4
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mREMn-0001di-UU
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 09:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631887044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E6qfhZ64Fi72fg5R4w2NyC7B1jTY5ex47JitYyalGWw=;
 b=QwIWuM8R+4sSXl3olcvnsBQuqPbMVEWgzNi4Tpx1QUpaL4zcydpAUiXOjpBZD1SLJfBkiz
 q0tBZS9D/rMDyYAqDIoydBUHx5/qF0nTjFg0WKUcZ807V23CtI6ZdhMbG2lCwknzsbIVEZ
 oowQb186SXBFkhwFpb/0borDD4nrmd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-BI2ergaYO8KIw84Clq4OzA-1; Fri, 17 Sep 2021 09:57:19 -0400
X-MC-Unique: BI2ergaYO8KIw84Clq4OzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93883100C661;
 Fri, 17 Sep 2021 13:57:18 +0000 (UTC)
Received: from redhat.com (ovpn-113-101.phx2.redhat.com [10.3.113.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE13460C9F;
 Fri, 17 Sep 2021 13:56:45 +0000 (UTC)
Date: Fri, 17 Sep 2021 08:56:44 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH RFC 1/5] qapi: Enable enum member introspection to show
 more than name
Message-ID: <20210917135644.m37z2kpbel4lk6zn@redhat.com>
References: <20210915192425.4104210-1-armbru@redhat.com>
 <20210915192425.4104210-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210915192425.4104210-2-armbru@redhat.com>
User-Agent: NeoMutt/20210205-772-2b4c52
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
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
 libvir-list@redhat.com, qemu-devel@nongnu.org, mdroth@linux.vnet.ibm.com,
 pkrempa@redhat.com, marcandre.lureau@redhat.com, jsnow@redhat.com,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 15, 2021 at 09:24:21PM +0200, Markus Armbruster wrote:
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

This makes sense if we plan to deprecate @values - if so, that
deprecation would make sense as part of this series, although we may
drag our feet for how long before we actually remove it.

> 
> 2. Like 1, but omit "boring" elements of @member, and empty @member.
> 
>    @values does not become redundant.  Output of query-qmp-schema
>    grows only as we make enum members non-boring.

Does not change whether libvirt would have to learn to query the new
members, but adds a mandatory fallback step for learning about boring
members (although the fallback step will have to be there anyway for
older qemu).  Peter probably has a better idea of which version is
nicer.

> 
> 3. Versioned query-qmp-schema.
> 
>    query-qmp-schema provides either @values or @members.  The QMP
>    client can select which version it wants.

Sounds more complicated to implement.  I'm not opposed to it, but am
leaning towards 1 or 2 myself.

> 
> This commit implements 1. simply because it's the solution I thought
> of first.  I'm prepared to implement one of the others if we decide
> that's what we want.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/introspect.json       | 20 ++++++++++++++++++--
>  scripts/qapi/introspect.py | 18 ++++++++++++++----
>  2 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/qapi/introspect.json b/qapi/introspect.json
> index 39bd303778..250748cd95 100644
> --- a/qapi/introspect.json
> +++ b/qapi/introspect.json
> @@ -142,14 +142,30 @@
>  #
>  # Additional SchemaInfo members for meta-type 'enum'.
>  #
> -# @values: the enumeration type's values, in no particular order.
> +# @members: the enum type's members, in no particular order.

Missing a '(since 6.2)' tag.

> +#
> +# @values: the enumeration type's member names, in no particular order.
> +#          Redundant with @members.  Just for backward compatibility.

Worth marking as deprecated in this patch, or in a followup?

>  #
>  # Values of this type are JSON string on the wire.
>  #
>  # Since: 2.5
>  ##
>  { 'struct': 'SchemaInfoEnum',
> -  'data': { 'values': ['str'] } }
> +  'data': { 'members': [ 'SchemaInfoEnumMember' ],
> +            'values': ['str'] } }
> +
> +##
> +# @SchemaInfoEnumMember:
> +#
> +# An object member.
> +#
> +# @name: the member's name, as defined in the QAPI schema.
> +#
> +# Since: 6.1

6.2

> +##
> +{ 'struct': 'SchemaInfoEnumMember',
> +  'data': { 'name': 'str' } }
>

Definitely more flexible.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


