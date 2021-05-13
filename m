Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CADF37F02F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 02:02:46 +0200 (CEST)
Received: from localhost ([::1]:41332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgyoP-00033r-7T
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 20:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgyn0-0002GR-1n
 for qemu-devel@nongnu.org; Wed, 12 May 2021 20:01:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgymx-0003Oa-Ot
 for qemu-devel@nongnu.org; Wed, 12 May 2021 20:01:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620864072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MTEtocUe1jAG0UflyWRfB1YnhJxj5oqKWQ9LMcCh2sM=;
 b=Cc8BK3LP8zP95ZdCRWbMS7yH9SOSmcJzd9ZTnCVzn3cEH2iSBNVN8b5E+/wXMSFwBt+QN+
 XyaxKMmKhpOPHbKttJw63J0Yal4gwGh0QVqVfAk5PqQAm2SlDilo3kA1TIpjCNU2MGJeb5
 ORWxhp9tGZICSjegSsPkXlkJvlZ+4dA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-Tq324ZtlMfGAePufyK7qyQ-1; Wed, 12 May 2021 20:01:10 -0400
X-MC-Unique: Tq324ZtlMfGAePufyK7qyQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73AAB8015D0
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 00:01:09 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0150F60657;
 Thu, 13 May 2021 00:01:04 +0000 (UTC)
Subject: Re: [PATCH v3 9/9] docs: update the documentation about schema
 configuration
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-10-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <5c8cba84-5590-454a-167b-82cc74dfe286@redhat.com>
Date: Wed, 12 May 2021 20:01:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429134032.1125111-10-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 9:40 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

I see why the docs are here at the end now -- you change the AST first, 
and then the meaning of the conditional string second. You didn't wanna 
write two versions.

I'm fine with that personally, but I'm not the one to convince.

> ---
>   docs/devel/qapi-code-gen.txt | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
> index edaaf7ec40..4a3fd02723 100644
> --- a/docs/devel/qapi-code-gen.txt
> +++ b/docs/devel/qapi-code-gen.txt
> @@ -780,26 +780,31 @@ downstream command __com.redhat_drive-mirror.
>   === Configuring the schema ===
>   
>   Syntax:
> -    COND = STRING
> -         | [ STRING, ... ]
> +    COND = CFG-ID
> +         | [ COND, ... ]
> +         | { 'all: [ COND, ... ] }
> +         | { 'any: [ COND, ... ] }
> +         | { 'not': COND }
>   
> -All definitions take an optional 'if' member.  Its value must be a
> -string or a list of strings.  A string is shorthand for a list
> -containing just that string.  The code generated for the definition
> -will then be guarded by #if STRING for each STRING in the COND list.
> +    CFG-ID = STRING
> +
> +All definitions take an optional 'if' member. Its value must be a string, a list
> +of strings or an object with a single member 'all', 'any' or 'not'. A string is
> +shorthand for a list containing just that string. A list is a shorthand for a
> +'all'-member object. The C code generated for the definition will then be guarded
> +by an #if precessor expression generated from that condition: 'all': [COND, ...]
> +will generate '(COND && ...)', 'any': [COND, ...] '(COND || ...)', 'not': COND '!COND'.
>   
>   Example: a conditional struct
>   
>    { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
> -   'if': ['CONFIG_FOO', 'HAVE_BAR'] }
> +   'if': { 'all': [ 'CONFIG_FOO', 'HAVE_BAR' ] } }
>   
>   gets its generated code guarded like this:
>   
> - #if defined(CONFIG_FOO)
> - #if defined(HAVE_BAR)
> + #if defined(CONFIG_FOO) && defined(HAVE_BAR)
>    ... generated code ...
> - #endif /* defined(HAVE_BAR) */
> - #endif /* defined(CONFIG_FOO) */
> + #endif /* defined(HAVE_BAR) && defined(CONFIG_FOO) */
>   
>   Individual members of complex types, commands arguments, and
>   event-specific data can also be made conditional.  This requires the
> 

Tentatively pretty OK with the gist of the changes in this series in 
general; pending possibly some re-ordering/re-basing changes and the 
like to make various things flow better that I don't personally insist on.

Biggest personal concerns are:

- Inlining C-specific information into schema.py
- Inlining C-generators into the IfPredicate classes
- Building IfPredicate trees directly in expr.py

Tested-by: John Snow <jsnow@redhat.com>

--js


