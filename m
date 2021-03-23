Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB9B345F73
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:18:40 +0100 (CET)
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgvf-0006n7-3p
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgtK-0005il-MP
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOgtI-0007ya-9g
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616505371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BzXivaZueuiGxTLXHcYKue7SKkN/vug4QmUlZReYjis=;
 b=bOfIi+xNVmvZpnMlhoTAOb75ai2lBKqjv864m6EHP6+AtAFGA6gN6S/puUsO7ecQouIhq8
 x8NEhglfFUp0XI+qtVwEUVqpLuiEXn0XtDjilKaFSiy00AD3dxJM9GFU2ydsOchcfAiSHR
 XtSgDE0kIr92eXrfUlcxDmfaXPXlTU4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-ScdKryezM0GlZ5wdxOLxOA-1; Tue, 23 Mar 2021 09:16:07 -0400
X-MC-Unique: ScdKryezM0GlZ5wdxOLxOA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5288580006E;
 Tue, 23 Mar 2021 13:16:06 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B70155D6AD;
 Tue, 23 Mar 2021 13:16:02 +0000 (UTC)
Subject: Re: [PATCH 05/28] tests/qapi-schema: Drop TODO comment on simple
 unions
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210323094025.3569441-1-armbru@redhat.com>
 <20210323094025.3569441-6-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <8d978c95-62aa-f26f-0810-563083d5fc4a@redhat.com>
Date: Tue, 23 Mar 2021 09:16:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323094025.3569441-6-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
> Simple unions don't need more features, they need to die.
> 

I'm willing to defer to your will here.

(And I'm not willing to implement enum discriminators to spite you.)

> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
>   tests/qapi-schema/flat-union-no-base.err  | 2 +-
>   tests/qapi-schema/flat-union-no-base.json | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qapi-schema/flat-union-no-base.err b/tests/qapi-schema/flat-union-no-base.err
> index 9bd595bcfb..5167565b00 100644
> --- a/tests/qapi-schema/flat-union-no-base.err
> +++ b/tests/qapi-schema/flat-union-no-base.err
> @@ -1,2 +1,2 @@
>   flat-union-no-base.json: In union 'TestUnion':
> -flat-union-no-base.json:9: 'discriminator' requires 'base'
> +flat-union-no-base.json:8: 'discriminator' requires 'base'
> diff --git a/tests/qapi-schema/flat-union-no-base.json b/tests/qapi-schema/flat-union-no-base.json
> index ffc4c6f0e6..327877b563 100644
> --- a/tests/qapi-schema/flat-union-no-base.json
> +++ b/tests/qapi-schema/flat-union-no-base.json
> @@ -1,5 +1,4 @@
>   # flat unions require a base
> -# TODO: simple unions should be able to use an enum discriminator
>   { 'struct': 'TestTypeA',
>     'data': { 'string': 'str' } }
>   { 'struct': 'TestTypeB',
> 


