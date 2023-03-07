Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E0B6AE008
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZX4G-0006TL-K4; Tue, 07 Mar 2023 08:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZX4B-0006Sx-0c
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:09:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pZX49-0007pa-A0
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 08:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678194556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8eIO64XhLOmHL7eE/nud0fY2TfqNbY2XymvgfAGPHU=;
 b=YMBtuvbmXjs0tvGc/LTyxRcwD9gbV/eA+bzrgf0ro9KdBcxPldtkmTfnzWEFKHZPD2niM4
 kiH+zu+26mKEHS6UpRl8+XvnKNZW2ynGU8U3XJ0b5ho5wwdMXHyDso5HJtdnW0KJvOYNqv
 ZTFZcKrL5GfzrxJCwnuccoYYOpWyDHc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-XTqyi24hNAO5irWI2eXbyw-1; Tue, 07 Mar 2023 08:09:14 -0500
X-MC-Unique: XTqyi24hNAO5irWI2eXbyw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FBE5101A521
 for <qemu-devel@nongnu.org>; Tue,  7 Mar 2023 13:09:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5967B403570F
 for <qemu-devel@nongnu.org>; Tue,  7 Mar 2023 13:09:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1DEE721E6A1F; Tue,  7 Mar 2023 14:09:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: marcandre.lureau@redhat.com,  qemu-devel@nongnu.org
Subject: Re: [PATCH] .editorconfig: set max line at 70 chars for QAPI files
References: <20230307123027.2485499-1-marcandre.lureau@redhat.com>
 <ZAcwtl8N+ruzH4qj@redhat.com>
Date: Tue, 07 Mar 2023 14:09:13 +0100
In-Reply-To: <ZAcwtl8N+ruzH4qj@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 7 Mar 2023 12:40:22 +0000")
Message-ID: <87sfeg7lom.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Mar 07, 2023 at 04:30:27PM +0400, marcandre.lureau@redhat.com wro=
te:
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>=20
>> This seems to be the preferred style.
>>=20
>> The EditorConfig property is not supported by all editors:
>> https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Propertie=
s#max_line_length
>>=20
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  .editorconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/.editorconfig b/.editorconfig
>> index 7303759ed7..8c5ebc6a1b 100644
>> --- a/.editorconfig
>> +++ b/.editorconfig
>> @@ -47,3 +47,4 @@ emacs_mode =3D glsl
>>  [*.json]
>>  indent_style =3D space
>>  emacs_mode =3D python
>> +max_line_length =3D 70
>
> Why 70 as a hard limit ?  I thought QEMU policy was that 80 was a soft
> limit and we were happy with 90 if it avoided wrapping that would hurt
> readability.=20

We have the rule because we're tired of arguing about readability of
long lines all the time.  But readability should trump rules!

Long lines are hard to read.  It's not a matter of window width.  Humans
tend to have trouble following long lines with their eyes (I sure do).
Typographic manuals suggest to limit columns to roughly 60 characters
for exactly that reason[*].

Wider windows do help with heavily indented material, as long as the
text itself isn't too wide.

Occasionally, there's simply no good way to break a long line without
making it *less* readable.  We should accept the long line as the lesser
evil then.

The QAPI schema files consist of ~4,000 lines of code, ~18,000 lines of
doc comments, and ~1000 blank lines.

1150 lines exceed 75 characters.  271 exceed 80 characters.  Mostly doc
strings, and mostly due to carelessness, not necessity.

Some doc strings are heavily indented[**], and letting these go over the
limit can be okay.

We should employ good taste.  Unfortunately, that seems to be in short
supply.  Rules are a poor substitute, but here we are.

When I review QAPI schema patches, I flag unnecessary long lines.  I
don't intend to stop that :)


[*] https://en.wikipedia.org/wiki/Column_(typography)#Typographic_style

[**] Caused by unfortunate doc string syntax; wish I had the time to fix
it


