Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797BB400045
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:10:42 +0200 (CEST)
Received: from localhost ([::1]:57624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM8xt-0001Ww-HS
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vt-000756-0H
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mM8vq-0001LP-Dv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630674513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t6ngGaEtZC1Sw+hJnB2wnbTqJr373XZc/kHpy6ebEjk=;
 b=ZzSJyasq6J7MP8Er8XmASIF0ZwgYQKw1aSvn7A092BGC3RAxcmRMA2sXO4QLm/ttZpcchC
 olPF4lu2Kk8xGsWJLt84xNpZAPId6KSV++JKp5dwbneu+DeG5f5PSrzFz5uH9yJe5nhER6
 XJwWR6Opr82t4vn4RPxmPldUB4aMFdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-l9lw_RJjMYmhfG2ihTD9NQ-1; Fri, 03 Sep 2021 09:08:32 -0400
X-MC-Unique: l9lw_RJjMYmhfG2ihTD9NQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D985B6D5C3;
 Fri,  3 Sep 2021 13:08:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-13.ams2.redhat.com
 [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 843D75C1C5;
 Fri,  3 Sep 2021 13:08:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B18C511380CC; Wed,  1 Sep 2021 16:14:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Roth <michael.roth@amd.com>
Subject: Re: [RFC PATCH v2 12/12] i386/sev: update query-sev QAPI format to
 handle SEV-SNP
References: <20210826222627.3556-1-michael.roth@amd.com>
 <20210826222627.3556-13-michael.roth@amd.com>
Date: Wed, 01 Sep 2021 16:14:10 +0200
In-Reply-To: <20210826222627.3556-13-michael.roth@amd.com> (Michael Roth's
 message of "Thu, 26 Aug 2021 17:26:27 -0500")
Message-ID: <87tuj4qt71.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_24_48=1.34,
 DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 "Daniel P . =?utf-8?Q?Berran?= =?utf-8?Q?g=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 Eric Blake <eblake@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 qemu-devel@nongnu.org, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Michael Roth <michael.roth@amd.com> writes:

> Most of the current 'query-sev' command is relevant to both legacy
> SEV/SEV-ES guests and SEV-SNP guests, with 2 exceptions:
>
>   - 'policy' is a 64-bit field for SEV-SNP, not 32-bit, and
>     the meaning of the bit positions has changed
>   - 'handle' is not relevant to SEV-SNP
>
> To address this, this patch adds a new 'sev-type' field that can be
> used as a discriminator to select between SEV and SEV-SNP-specific
> fields/formats without breaking compatibility for existing management
> tools (so long as management tools that add support for launching
> SEV-SNP guest update their handling of query-sev appropriately).

Technically a compatibility break: query-sev can now return an object
that whose member @policy has different meaning, and also lacks @handle.

Matrix:

                            Old mgmt app    New mgmt app
    Old QEMU, SEV/SEV-ES       good            good(1)
    New QEMU, SEV/SEV-ES       good(2)         good
    New QEMU, SEV-SNP           bad(3)         good

Notes:

(1) As long as the management application can cope with absent member
@sev-type.

(2) As long as the management application ignores unknown member
@sev-type.

(3) Management application may choke on missing member @handle, or
worse, misinterpret member @policy.  Can only happen when something
other than the management application created the SEV-SNP guest (or the
user somehow made the management application create one even though it
doesn't know how, say with CLI option passthrough, but that's always
fragile, and I wouldn't worry about it here).

I think (1) and (2) are reasonable.  (3) is an issue for management
applications that support attaching to existing guests.  Thoughts?

>
> The corresponding HMP command has also been fixed up similarly.
>
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  qapi/misc-target.json  | 71 +++++++++++++++++++++++++++++++++---------
>  target/i386/monitor.c  | 29 +++++++++++++----
>  target/i386/sev.c      | 22 +++++++------
>  target/i386/sev_i386.h |  3 ++
>  4 files changed, 95 insertions(+), 30 deletions(-)
>
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 3b05ad3dbf..80f994ff9b 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -81,6 +81,49 @@
>             'send-update', 'receive-update' ],
>    'if': 'TARGET_I386' }
>  
> +##
> +# @SevGuestType:
> +#
> +# An enumeration indicating the type of SEV guest being run.
> +#
> +# @sev:     The guest is a legacy SEV or SEV-ES guest.
> +# @sev-snp: The guest is an SEV-SNP guest.
> +#
> +# Since: 6.2
> +##
> +{ 'enum': 'SevGuestType',
> +  'data': [ 'sev', 'sev-snp' ],
> +  'if': 'TARGET_I386' }
> +
> +##
> +# @SevGuestInfo:
> +#
> +# Information specific to legacy SEV/SEV-ES guests.
> +#
> +# @policy: SEV policy value
> +#
> +# @handle: SEV firmware handle
> +#
> +# Since: 2.12
> +##
> +{ 'struct': 'SevGuestInfo',
> +  'data': { 'policy': 'uint32',
> +            'handle': 'uint32' },
> +  'if': 'TARGET_I386' }
> +
> +##
> +# @SevSnpGuestInfo:
> +#
> +# Information specific to SEV-SNP guests.
> +#
> +# @policy: SEV-SNP policy value
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'SevSnpGuestInfo',
> +  'data': { 'policy': 'uint64' },
> +  'if': 'TARGET_I386' }
> +
>  ##
>  # @SevInfo:
>  #
> @@ -94,25 +137,25 @@
>  #
>  # @build-id: SEV FW build id
>  #
> -# @policy: SEV policy value
> -#
>  # @state: SEV guest state
>  #
> -# @handle: SEV firmware handle
> +# @sev-type: Type of SEV guest being run
>  #
>  # Since: 2.12
>  ##
> -{ 'struct': 'SevInfo',
> -    'data': { 'enabled': 'bool',
> -              'api-major': 'uint8',
> -              'api-minor' : 'uint8',
> -              'build-id' : 'uint8',
> -              'policy' : 'uint32',
> -              'state' : 'SevState',
> -              'handle' : 'uint32'
> -            },
> -  'if': 'TARGET_I386'
> -}
> +{ 'union': 'SevInfo',
> +  'base': { 'enabled': 'bool',
> +            'api-major': 'uint8',
> +            'api-minor' : 'uint8',
> +            'build-id' : 'uint8',
> +            'state' : 'SevState',
> +            'sev-type' : 'SevGuestType' },
> +  'discriminator': 'sev-type',
> +  'data': {
> +      'sev': 'SevGuestInfo',
> +      'sev-snp': 'SevSnpGuestInfo' },
> +  'if': 'TARGET_I386' }
> +
>  
>  ##
>  # @query-sev:

[...]


