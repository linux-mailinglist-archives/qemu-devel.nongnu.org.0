Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AECD34619C
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 15:38:06 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOiAX-0002cK-IM
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 10:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOi09-0006dJ-6P
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOi04-0007GF-Qp
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 10:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616509632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXolxeAZFxlB1ijh+8kfNFCv0512TxdnopeZEcwL1r0=;
 b=cr5DEFq+XpCvoTq3EpE5Sl3ysrdUTYzz+APX9lZbp+2nux4UcSaKlJPhlM3gxVSIoMFGD3
 W8DACuISHKBQy1Fohd0SbsIbb6O6I3jH6p7ZpEPUyE//Bm516Scrs5lIIAPWK64Idd4roV
 bmCmr1/Lq3QhpzX3B+aCY49/iTk6Qrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-igxjkoKYOeSd2FgXnYWm3A-1; Tue, 23 Mar 2021 10:27:10 -0400
X-MC-Unique: igxjkoKYOeSd2FgXnYWm3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DF9D10168C6;
 Tue, 23 Mar 2021 14:27:09 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3D2E5D6D7;
 Tue, 23 Mar 2021 14:27:06 +0000 (UTC)
Subject: Re: [PATCH 03/28] tests/qapi-schema: Rework comments on longhand
 member definitions
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-4-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <cdffa1db-402e-e3bc-7266-1fe4b5f068a9@redhat.com>
Date: Tue, 23 Mar 2021 10:27:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-4-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:40 AM, Markus Armbruster wrote:
> A few old comments talk about "desired future use of defaults" and
> "anonymous inline branch types".  Kind of misleading since commit
> 87adbbffd4 "qapi: add a dictionary form for TYPE" added longhand
> member definitions.  Talk about that instead.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

I still feel a little warbley on the comment (I will probably forget 
what it means next week), but I don't have a better suggestion for it 
now that I know what it's trying to tell me.

so, er,

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   tests/qapi-schema/event-member-invalid-dict.err        | 2 +-
>   tests/qapi-schema/event-member-invalid-dict.json       | 2 ++
>   tests/qapi-schema/flat-union-inline-invalid-dict.json  | 4 ++--
>   tests/qapi-schema/nested-struct-data-invalid-dict.err  | 2 +-
>   tests/qapi-schema/nested-struct-data-invalid-dict.json | 3 ++-
>   tests/qapi-schema/nested-struct-data.json              | 2 +-
>   tests/qapi-schema/struct-member-invalid-dict.err       | 2 +-
>   tests/qapi-schema/struct-member-invalid-dict.json      | 3 ++-
>   8 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/qapi-schema/event-member-invalid-dict.err b/tests/qapi-schema/event-member-invalid-dict.err
> index c7a6a24305..82f8989344 100644
> --- a/tests/qapi-schema/event-member-invalid-dict.err
> +++ b/tests/qapi-schema/event-member-invalid-dict.err
> @@ -1,2 +1,2 @@
>   event-member-invalid-dict.json: In event 'EVENT_A':
> -event-member-invalid-dict.json:1: 'data' member 'a' misses key 'type'
> +event-member-invalid-dict.json:3: 'data' member 'a' misses key 'type'
> diff --git a/tests/qapi-schema/event-member-invalid-dict.json b/tests/qapi-schema/event-member-invalid-dict.json
> index ee6f3ecb6f..e58560abca 100644
> --- a/tests/qapi-schema/event-member-invalid-dict.json
> +++ b/tests/qapi-schema/event-member-invalid-dict.json
> @@ -1,2 +1,4 @@
> +# event 'data' member with dict value is (longhand) argument
> +# definition, not inline complex type
>   { 'event': 'EVENT_A',
>     'data': { 'a' : { 'string' : 'str', 'integer': 'int' }, 'b' : 'str' } }
> diff --git a/tests/qapi-schema/flat-union-inline-invalid-dict.json b/tests/qapi-schema/flat-union-inline-invalid-dict.json
> index 62c7cda617..1779712795 100644
> --- a/tests/qapi-schema/flat-union-inline-invalid-dict.json
> +++ b/tests/qapi-schema/flat-union-inline-invalid-dict.json
> @@ -1,5 +1,5 @@
> -# we require branches to be a struct name
> -# TODO: should we allow anonymous inline branch types?
> +# union 'data' member with dict value is (longhand) branch
> +# definition, not inline complex type
>   { 'enum': 'TestEnum',
>     'data': [ 'value1', 'value2' ] }
>   { 'struct': 'Base',
> diff --git a/tests/qapi-schema/nested-struct-data-invalid-dict.err b/tests/qapi-schema/nested-struct-data-invalid-dict.err
> index c044b2b17a..375e155fe6 100644
> --- a/tests/qapi-schema/nested-struct-data-invalid-dict.err
> +++ b/tests/qapi-schema/nested-struct-data-invalid-dict.err
> @@ -1,2 +1,2 @@
>   nested-struct-data-invalid-dict.json: In command 'foo':
> -nested-struct-data-invalid-dict.json:2: 'data' member 'a' misses key 'type'
> +nested-struct-data-invalid-dict.json:3: 'data' member 'a' misses key 'type'
> diff --git a/tests/qapi-schema/nested-struct-data-invalid-dict.json b/tests/qapi-schema/nested-struct-data-invalid-dict.json
> index efbe773ded..aa37b85e19 100644
> --- a/tests/qapi-schema/nested-struct-data-invalid-dict.json
> +++ b/tests/qapi-schema/nested-struct-data-invalid-dict.json
> @@ -1,3 +1,4 @@
> -# inline subtypes collide with our desired future use of defaults
> +# command 'data' member with dict value is (longhand) argument
> +# definition, not inline complex type
>   { 'command': 'foo',
>     'data': { 'a' : { 'string' : 'str', 'integer': 'int' }, 'b' : 'str' } }
> diff --git a/tests/qapi-schema/nested-struct-data.json b/tests/qapi-schema/nested-struct-data.json
> index 5b8a40cca3..2980d45d05 100644
> --- a/tests/qapi-schema/nested-struct-data.json
> +++ b/tests/qapi-schema/nested-struct-data.json
> @@ -1,3 +1,3 @@
> -# inline subtypes collide with our desired future use of defaults
> +# {} is not a valid type reference
>   { 'command': 'foo',
>     'data': { 'a' : { 'type': {} }, 'b' : 'str' } }
> diff --git a/tests/qapi-schema/struct-member-invalid-dict.err b/tests/qapi-schema/struct-member-invalid-dict.err
> index 0621aecfbd..f9b3f33551 100644
> --- a/tests/qapi-schema/struct-member-invalid-dict.err
> +++ b/tests/qapi-schema/struct-member-invalid-dict.err
> @@ -1,2 +1,2 @@
>   struct-member-invalid-dict.json: In struct 'foo':
> -struct-member-invalid-dict.json:2: 'data' member '*a' misses key 'type'
> +struct-member-invalid-dict.json:3: 'data' member '*a' misses key 'type'
> diff --git a/tests/qapi-schema/struct-member-invalid-dict.json b/tests/qapi-schema/struct-member-invalid-dict.json
> index 9fe0d455a9..bc3d62ae63 100644
> --- a/tests/qapi-schema/struct-member-invalid-dict.json
> +++ b/tests/qapi-schema/struct-member-invalid-dict.json
> @@ -1,3 +1,4 @@
> -# Long form of member must have a value member 'type'
> +# struct 'data' member with dict value is (longhand) member
> +# definition, not inline complex type
>   { 'struct': 'foo',
>     'data': { '*a': { 'case': 'foo' } } }
> 


