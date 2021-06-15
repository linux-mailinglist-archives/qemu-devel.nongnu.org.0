Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EBF3A7DA8
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 13:54:11 +0200 (CEST)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt7dy-0004K8-ID
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 07:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt7ZF-0007Zv-3s
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lt7Z9-0000yW-3q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 07:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623757749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+8cwsvkMyx94xpnrGcmcOwxQuTcYr7EspHq/Hh4Ufw=;
 b=jSBWrifdCEpovs/kH5WZzwI2DFLdD1yzfNIcolp6CuSwBv7vbn/+nIzixDmQq5UaphhxMZ
 BTV8IoShFW8VOzqd1idKgp1/445Um2OlCGAtOikyiMq1LNrCFEy3oxEUh0DY+fDxoF29VJ
 LfUmyNsw6VpEZAbHlkLRVIXZkNWw0p0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-bih9IkT1OEWWlvCXnDiunw-1; Tue, 15 Jun 2021 07:49:07 -0400
X-MC-Unique: bih9IkT1OEWWlvCXnDiunw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A62CE100C609
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 11:49:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E527960BD9;
 Tue, 15 Jun 2021 11:49:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6243E113865F; Tue, 15 Jun 2021 13:48:59 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v5 1/9] docs: update the documentation about schema
 configuration
References: <20210608120723.2268181-1-marcandre.lureau@redhat.com>
 <20210608120723.2268181-2-marcandre.lureau@redhat.com>
Date: Tue, 15 Jun 2021 13:48:59 +0200
In-Reply-To: <20210608120723.2268181-2-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Tue, 8 Jun 2021 16:07:15 +0400")
Message-ID: <874kdzqrf8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: jsnow@redhat.com, Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

marcandre.lureau@redhat.com writes:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Update the documentation describing the changes in this series.

Suggest to add "upfront" for clarity.

>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Tested-by: John Snow <jsnow@redhat.com>
> ---
>  docs/devel/qapi-code-gen.txt | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.txt b/docs/devel/qapi-code-gen.txt
> index c1cb6f987d..0162b73119 100644
> --- a/docs/devel/qapi-code-gen.txt
> +++ b/docs/devel/qapi-code-gen.txt
> @@ -781,25 +781,31 @@ downstream command __com.redhat_drive-mirror.
> =20
>  Syntax:
>      COND =3D STRING
> -         | [ STRING, ... ]
> +         | { 'all: [ COND, ... ] }
> +         | { 'any: [ COND, ... ] }
> +         | { 'not': COND }
> =20
>  All definitions take an optional 'if' member.  Its value must be a
> -string or a list of strings.  A string is shorthand for a list
> -containing just that string.  The code generated for the definition
> -will then be guarded by #if STRING for each STRING in the COND list.
> +string, or an object with a single member 'all', 'any' or 'not'.
> +
> +The C code generated for the definition will then be guarded by an #if
> +preprocessing directive generated from that condition:
> +
> +   * STRING will generate #if defined(STRING)
> +   * { 'all': [COND, ...] } will generate #if (COND && ...)
> +   * { 'any': [COND, ...] } will generate #if (COND || ...)
> +   * { 'not': COND } will generate #if !COND

I know this is exactly what I suggested.  It gets the point across, but
it's not quite accurate: the #if of course only at the root of the tree,
not at every level.  Better, I think:

   The C code generated for the definition will then be guarded by an #if
   preprocessing directive with an operand generated from that condition:

      * STRING will generate defined(STRING)
      * { 'all': [COND, ...] } will generate (COND && ...)
      * { 'any': [COND, ...] } will generate (COND || ...)
      * { 'not': COND } will generate !COND

> =20
>  Example: a conditional struct
> =20
>   { 'struct': 'IfStruct', 'data': { 'foo': 'int' },
> -   'if': ['defined(CONFIG_FOO)', 'defined(HAVE_BAR)'] }
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
> @@ -810,7 +816,7 @@ member 'bar'
> =20
>  { 'struct': 'IfStruct', 'data':
>    { 'foo': 'int',
> -    'bar': { 'type': 'int', 'if': 'defined(IFCOND)'} } }
> +    'bar': { 'type': 'int', 'if': 'IFCOND'} } }
> =20
>  A union's discriminator may not be conditional.
> =20
> @@ -822,7 +828,7 @@ value 'bar'
> =20
>  { 'enum': 'IfEnum', 'data':
>    [ 'foo',
> -    { 'name' : 'bar', 'if': 'defined(IFCOND)' } ] }
> +    { 'name' : 'bar', 'if': 'IFCOND' } ] }
> =20
>  Likewise, features can be conditional.  This requires the longhand
>  form of FEATURE.
> @@ -832,7 +838,7 @@ Example: a struct with conditional feature 'allow-neg=
ative-numbers'
>  { 'struct': 'TestType',
>    'data': { 'number': 'int' },
>    'features': [ { 'name': 'allow-negative-numbers',
> -                  'if': 'defined(IFCOND)' } ] }
> +                  'if': 'IFCOND' } ] }
> =20
>  Please note that you are responsible to ensure that the C code will
>  compile with an arbitrary combination of conditions, since the


