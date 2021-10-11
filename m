Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA364296FF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 20:39:50 +0200 (CEST)
Received: from localhost ([::1]:48438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma0DE-0007Bh-T1
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 14:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0C4-0006QN-6C
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:38:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ma0Bz-0000Om-SI
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 14:38:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633977509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5OuhW2GghLeMr75sm3Gfa0NJwA+IRVUpxZH372KEKhI=;
 b=bLcwAxqp9wJ5Ei/HMOLmDn+MA/k/ZZx9dvBThuCnl0Qmpc4YX/yNdz9+2mfIrv/NLsfsiP
 rKfvLfuVK1kJQ0Jx/PEsU1ICUcCdq8S9meow5r2L5KqGqGIkSPIY4geSmbOmM91phL0hlQ
 aC5Gj74K8M+DiSsylUFovRzGIOsvKGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-LhXtf--fO4eL8jjWrJXCIg-1; Mon, 11 Oct 2021 14:38:24 -0400
X-MC-Unique: LhXtf--fO4eL8jjWrJXCIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B24A8801AC3;
 Mon, 11 Oct 2021 18:38:23 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA4E660C2B;
 Mon, 11 Oct 2021 18:37:57 +0000 (UTC)
Date: Mon, 11 Oct 2021 13:37:55 -0500
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 1/5] qapi: Enable enum member introspection to show
 more than name
Message-ID: <20211011183755.zu6sdrj7xaxudoyr@redhat.com>
References: <20211009120944.2858887-1-armbru@redhat.com>
 <20211009120944.2858887-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211009120944.2858887-2-armbru@redhat.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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

On Sat, Oct 09, 2021 at 02:09:40PM +0200, Markus Armbruster wrote:
> The next commit will add feature flags to enum members.  There's a
> problem, though: query-qmp-schema shows an enum type's members as an
> array of member names (SchemaInfoEnum member @values).  If it showed
> an array of objects with a name member, we could simply add more
> members to these objects.  Since it's just strings, we can't.
> 
> I can see three ways to correct this design mistake:
> 
> 1. Do it the way we should have done it, plus compatibility goo.
...
> 2. Like 1, but omit "boring" elements of @member, and empty @member.

> 3. Versioned query-qmp-schema.

> This commit implements 1.  Libvirt developers prefer it.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/introspect.json       | 21 +++++++++++++++++++--
>  scripts/qapi/introspect.py | 18 ++++++++++++++----
>  2 files changed, 33 insertions(+), 6 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qapi/introspect.json b/qapi/introspect.json
> index 39bd303778..f806bd7281 100644
> --- a/qapi/introspect.json
> +++ b/qapi/introspect.json
> @@ -142,14 +142,31 @@
>  #
>  # Additional SchemaInfo members for meta-type 'enum'.
>  #
> -# @values: the enumeration type's values, in no particular order.
> +# @members: the enum type's members, in no particular order
> +#           (since 6.2).
> +#
> +# @values: the enumeration type's member names, in no particular order.
> +#          Redundant with @members.  Just for backward compatibility.
>  #
>  # Values of this type are JSON string on the wire.
>  #
>  # Since: 2.5
>  ##
>  { 'struct': 'SchemaInfoEnum',
> -  'data': { 'values': ['str'] } }
> +  'data': { 'members': [ 'SchemaInfoEnumMember' ],
> +            'values': ['str'] } }

Not deprecated at this time, I agree with your choice to make the
actual deprecation of 'values' to be in a later patch (if at all).

> +
> +##
> +# @SchemaInfoEnumMember:
> +#
> +# An object member.
> +#
> +# @name: the member's name, as defined in the QAPI schema.
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'SchemaInfoEnumMember',
> +  'data': { 'name': 'str' } }

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


