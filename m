Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1E697B79
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:08:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSGaD-0002G6-TM; Wed, 15 Feb 2023 07:08:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSGZw-00029e-8d
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:08:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pSGZu-0002Ag-MB
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:08:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676462881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEsk8UZxhhe8Zb6hvzV2ovzSyqqgrz/VTl4KtBs2Ck0=;
 b=Ma16NYviwI060twxJUs/oQ3ipRKIRv+f4+DfTF4LZwL9pJf7i7G+idfehqrpKmblzs2++Y
 VX2k4wfCVfDNCI/LuMqvWjSi0vMliK/dRRmfiJPn60cl/Bwe9WMeTbgZwe5Si3fwXC4NZH
 GFjUPiunWlNrq2vVLS/e0IxAf2g+7xc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-BDxYKbv6MBOM9ZQBoJQtZg-1; Wed, 15 Feb 2023 07:08:00 -0500
X-MC-Unique: BDxYKbv6MBOM9ZQBoJQtZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7156C181E3EF;
 Wed, 15 Feb 2023 12:07:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 508922166B30;
 Wed, 15 Feb 2023 12:07:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4FCD121E6A1F; Wed, 15 Feb 2023 13:07:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Michael Roth
 <michael.roth@amd.com>,  Eric Blake <eblake@redhat.com>,  =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 0/2] docs/devel/qapi-code-gen: Update features doc,
 minor improvements
References: <20230213132009.918801-1-armbru@redhat.com>
 <CAFn=p-brOeNFLUgpxRJSBEiXvKLZN=1iv8q6rLnX3DO_SD++6Q@mail.gmail.com>
 <CAFn=p-Yvv4Bcsu0158+3caJ2maxGb-0ZUCTfu1uLnve9-swGrg@mail.gmail.com>
Date: Wed, 15 Feb 2023 13:07:58 +0100
In-Reply-To: <CAFn=p-Yvv4Bcsu0158+3caJ2maxGb-0ZUCTfu1uLnve9-swGrg@mail.gmail.com>
 (John Snow's message of "Tue, 14 Feb 2023 11:51:34 -0500")
Message-ID: <87ilg3b081.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

John Snow <jsnow@redhat.com> writes:

> On Tue, Feb 14, 2023, 11:49 AM John Snow <jsnow@redhat.com> wrote:
>
>>
>>
>> On Mon, Feb 13, 2023, 8:20 AM Markus Armbruster <armbru@redhat.com> wrot=
e:
>>
>>> *** BLURB HERE ***
>>>
>>
>> =F0=9F=A4=AB

Uh, thank you for following my written instructions literally, and...

>>> Markus Armbruster (2):
>>>   docs/devel/qapi-code-gen: Belatedly update features documentation
>>>   docs/devel/qapi-code-gen: Fix a missing 'may', clarify SchemaInfo
>>>
>>>  docs/devel/qapi-code-gen.rst | 16 ++++++++--------
>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> --
>>> 2.39.0
>>>
>>
> Oops, also meant to add:
>
> Reviewed-by: John Snow <jsnow@redhat.com>

... thank you for reviewing!


