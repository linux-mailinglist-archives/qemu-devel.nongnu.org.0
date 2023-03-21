Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4212F6C3374
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 14:54:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecQi-0000rs-9u; Tue, 21 Mar 2023 09:53:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pecQb-0000rD-Sh
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pecQa-0004IZ-4v
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 09:53:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679406807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlWA1md+A4CLbQ2P0ooYpDsj6x879jUGn+g6ne+9sOI=;
 b=Xgi3x+/dMV5GiwB6k0Ka9UJHKMwlHRVj1Uxtl0WKASTQZguz2reAJoj1zX7vN+QHz2QXxT
 uXqJ9C0QTLf5XHMAsxOheyGJKKXLySaWeV6Oqs7BSX2SSDeXSRd9l0MFdBzYWJ+BmSMxB4
 mTcOvHSNiGg/ghTbcA7LFCVUab0MOs8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-yQ_UAOFiOqSR5HLiGpd6ZQ-1; Tue, 21 Mar 2023 09:53:25 -0400
X-MC-Unique: yQ_UAOFiOqSR5HLiGpd6ZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2EF4855304;
 Tue, 21 Mar 2023 13:53:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACD4240C6E67;
 Tue, 21 Mar 2023 13:53:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 94AC721E6926; Tue, 21 Mar 2023 14:53:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] .editorconfig: set max line at 70 chars for QAPI files
References: <20230307123027.2485499-1-marcandre.lureau@redhat.com>
 <CAJ+F1CKqPfU6_L+LYty-di2BDNMBrHPynOEGc1sTFOH2PgCeBg@mail.gmail.com>
Date: Tue, 21 Mar 2023 14:53:23 +0100
In-Reply-To: <CAJ+F1CKqPfU6_L+LYty-di2BDNMBrHPynOEGc1sTFOH2PgCeBg@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Tue, 21 Mar 2023
 11:30:06 +0400")
Message-ID: <87bkkmfbxo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Tue, Mar 7, 2023 at 4:32=E2=80=AFPM <marcandre.lureau@redhat.com> wrot=
e:
>>
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> This seems to be the preferred style.
>>
>> The EditorConfig property is not supported by all editors:
>> https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Propertie=
s#max_line_length
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  .editorconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
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
> ack or nack ?

I think we should first address the doc syntax misfeature that pushes us
to the right, and clean up existing overlong lines.  Can't say how hard
the former would be, so I'm having a look.


