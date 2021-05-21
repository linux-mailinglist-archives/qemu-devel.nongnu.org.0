Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D625938C61E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 13:58:29 +0200 (CEST)
Received: from localhost ([::1]:32954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk3nQ-0004Wf-NK
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 07:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk3lv-0003AP-8u
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:56:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lk3lr-0001g0-Oh
 for qemu-devel@nongnu.org; Fri, 21 May 2021 07:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621598210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzXDjSGMsxk++/d7chW7/V5I6QbfgddssUNM9gc/hv0=;
 b=bzfLw3qqJQr/TMye34NvekkuDvbpnxMrAS/iiJPgIapsW7JZmUYmQKN82mQNOcZBHlWMOg
 wnzmmF6r69z8IizfgDN71mQecG4fI2ZuQgOVRtJvveOJhfNTq7smjiUAPUkXqGkAS5oa4o
 Qgfaz0DevvMrbsQeBlQEWYCGyCptskI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-mBLHN4nnP-CD_T84HyN-bQ-1; Fri, 21 May 2021 07:56:48 -0400
X-MC-Unique: mBLHN4nnP-CD_T84HyN-bQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5239180FD6D
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 11:56:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 109851346F;
 Fri, 21 May 2021 11:56:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A0FB7113865F; Fri, 21 May 2021 13:56:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v4 9/9] docs: update the documentation about schema
 configuration
References: <20210517163040.2308926-1-marcandre.lureau@redhat.com>
 <20210517163040.2308926-10-marcandre.lureau@redhat.com>
Date: Fri, 21 May 2021 13:56:38 +0200
In-Reply-To: <20210517163040.2308926-10-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Mon, 17 May 2021 20:30:40 +0400")
Message-ID: <878s485mh5.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---
>  docs/devel/qapi-code-gen.txt | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
> index edaaf7ec40..4a3fd02723 100644
> --- a/docs/devel/qapi-code-gen.txt
> +++ b/docs/devel/qapi-code-gen.txt
> @@ -780,26 +780,31 @@ downstream command __com.redhat_drive-mirror.
>  =3D=3D=3D Configuring the schema =3D=3D=3D
> =20
>  Syntax:
> -    COND =3D STRING
> -         | [ STRING, ... ]
> +    COND =3D CFG-ID
> +         | [ COND, ... ]
> +         | { 'all: [ COND, ... ] }
> +         | { 'any: [ COND, ... ] }
> +         | { 'not': COND }
> =20
> -All definitions take an optional 'if' member.  Its value must be a
> -string or a list of strings.  A string is shorthand for a list
> -containing just that string.  The code generated for the definition
> -will then be guarded by #if STRING for each STRING in the COND list.
> +    CFG-ID =3D STRING
> +
> +All definitions take an optional 'if' member. Its value must be a string=
, a list
> +of strings or an object with a single member 'all', 'any' or 'not'. A st=
ring is
> +shorthand for a list containing just that string. A list is a shorthand =
for a
> +'all'-member object. The C code generated for the definition will then b=
e guarded

Please try to make your changes blend into the existing text: limit line
length to 70 characters, and put two spaces between sentences.

I doubt the CFG-ID non-terminal is useful.  Elsewhere, we do without,
e.g. ENUM-VALUE, ALTERNATIVE, FEATURE.

Sure the [ COND, ... ] sugar is worth the bother?

Perhaps

       COND =3D STRING
            | { 'all: [ COND, ... ] }
            | { 'any: [ COND, ... ] }
            | { 'not': COND }

   All definitions take an optional 'if' member.  The form STRING is
   shorthand for { 'any': [ STRING ] }.  The C code generated ...

> +by an #if precessor expression generated from that condition: 'all': [CO=
ND, ...]
> +will generate '(COND && ...)', 'any': [COND, ...] '(COND || ...)', 'not'=
: COND '!COND'.

The technical term is "#if preprocessing directive".  Let's use it.

I find the last part unnecessarily hard to read.  What about:

   ... generated from that condition:

   * { 'all': [COND, ...] } will generate #if (COND && ...)
   * { 'any': [COND, ...] } will generate #if (COND || ...)
   * { 'not': COND } will generate #if !COND

> =20
>  Example: a conditional struct
> =20
>   { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
> -   'if': ['CONFIG_FOO', 'HAVE_BAR'] }
> +   'if': { 'all': [ 'CONFIG_FOO', 'HAVE_BAR' ] } }
> =20
>  gets its generated code guarded like this:
> =20
> - #if defined(CONFIG_FOO)
> - #if defined(HAVE_BAR)
> + #if defined(CONFIG_FOO) && defined(HAVE_BAR)
>   ... generated code ...
> - #endif /* defined(HAVE_BAR) */
> - #endif /* defined(CONFIG_FOO) */
> + #endif /* defined(HAVE_BAR) && defined(CONFIG_FOO) */
> =20
>  Individual members of complex types, commands arguments, and
>  event-specific data can also be made conditional.  This requires the


