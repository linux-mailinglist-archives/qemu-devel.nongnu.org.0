Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D433D01C1
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:34:06 +0200 (CEST)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uZB-0007qU-DP
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:34:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5uWK-0005TJ-0Z
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m5uWG-0001kL-1R
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626805860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1IyOXLiyHK6plwerlIMKt+AixFpOkjQ1yu2x6QE6ho=;
 b=RKH9For5NkuM9XUlBvdrN2kK73TOhQIZ/hrQ5JRabn9XXxTzdaHWXD29o2RS3Q+bDsRTr7
 jYMaD+J9oSc4AT8y8q7+JrjzexpMObCUD5Aa/JGcRaTVc69zKem0iccfhEdbkKBPxPoJt+
 M+WY30KYbPp+mWyVRAXUy3RqhkFvD/A=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-YBJn8iYCM0SsqUsKxprTsQ-1; Tue, 20 Jul 2021 14:30:58 -0400
X-MC-Unique: YBJn8iYCM0SsqUsKxprTsQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 u17-20020a5443910000b02902409d8d9f2fso102003oiv.5
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y1IyOXLiyHK6plwerlIMKt+AixFpOkjQ1yu2x6QE6ho=;
 b=YKh+1mgsU0BFS/8Ualb1LUHIjz9KOWLo/Ulk7rwCwOh4kHkKLDysn/X0Z6Iko3TuMK
 5MAj8eWQfbOXt5pI3+5sLkHW3Dy6ZgKicZj2A5spR397VnrsaP9UujeN/9MO+lmE2+0C
 DPmgbTZ8AEDxO1vCCyRcjHMNFDVjXSt5wHCD3tcBgvlNM/ldBGLCgpNy2OgVDaA//E0R
 m6/WqyUqO2UIoXZdS7ybxhesc299iT0AMjatOhEwsv/bXuO1yIM3dyC/p/suY9TbmnJf
 25WmRxwKO+pmh8Q+LEWMsOyF9SXH47gSpAKbab4fg35FRa2+j52hgsEDS2KVObSk8u2Q
 INvA==
X-Gm-Message-State: AOAM533nT/HclANBxpDkGMdtOJ1Xcn9e5poy/uSHoUrXkf18fjC3Rhdj
 +xos+E/V2uOYmTpM6NCz4iztkBtX4lcpVcbQqbAcVACaCJ7/4a2YKgX+eqWpBlZnqzo9w8UyS1V
 JgAk/Dlt6QmsYn7O/7a20IvUwadpM588=
X-Received: by 2002:a05:6808:1309:: with SMTP id
 y9mr25640608oiv.112.1626805858178; 
 Tue, 20 Jul 2021 11:30:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK8MIL7HMa/CuhpJOABcHYohWTUEbOAPPx4RcrwoInI8CVEShz3j6HLjidbMnzXZo2XOnuqHBTIJt5N/SbsNo=
X-Received: by 2002:a05:6808:1309:: with SMTP id
 y9mr25640590oiv.112.1626805858031; 
 Tue, 20 Jul 2021 11:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210702212603.26465-1-niteesh.gs@gmail.com>
 <20210702212603.26465-2-niteesh.gs@gmail.com>
 <CAFn=p-b3gOzFtcGCH3amNTyzosMqP2HkYFSiaX04e9yVWhfgBw@mail.gmail.com>
In-Reply-To: <CAFn=p-b3gOzFtcGCH3amNTyzosMqP2HkYFSiaX04e9yVWhfgBw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 20 Jul 2021 14:30:47 -0400
Message-ID: <CAFn=p-Yv6-gscr5-ECP0h1r-iM1HT6AJWvuPzcrtbMFzz5VqOQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] python: disable pylint errors for aqmp-tui
To: G S Niteesh Babu <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000496c1805c79241f0"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000496c1805c79241f0
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 20, 2021 at 2:00 PM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Jul 2, 2021 at 5:26 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Disable missing-docstring and fixme pylint warnings.
>> This is because since the AQMP is just a prototype
>> it is currently not documented properly and lot
>> of todo and fixme's are still in place.
>>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/setup.cfg | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> index bce8807702..1a552d672a 100644
>> --- a/python/setup.cfg
>> +++ b/python/setup.cfg
>> @@ -89,6 +89,8 @@ ignore_missing_imports = True
>>  # no Warning level messages displayed, use "--disable=all
>> --enable=classes
>>  # --disable=W".
>>  disable=too-many-function-args,  # mypy handles this with less false
>> positives.
>> +        missing-docstring, # FIXME
>> +        fixme, # FIXME
>>
>
> You aren't actually using any FIXME statements in this branch right now
> that I can see, so you don't need that suppression. It could be removed in
> V3.
>
>

Sorry, I was mistaken, this will trigger on the TODO entries that you *are*
using.

--js

--000000000000496c1805c79241f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021 at 2:00 PM John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"lt=
r"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 2, 2021 at 5:26 PM G S Niteesh Babu &lt=
;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">Disable missing-docstring and fixme pylint warnings.<br>
This is because since the AQMP is just a prototype<br>
it is currently not documented properly and lot<br>
of todo and fixme&#39;s are still in place.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/setup.cfg | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/python/setup.cfg b/python/setup.cfg<br>
index bce8807702..1a552d672a 100644<br>
--- a/python/setup.cfg<br>
+++ b/python/setup.cfg<br>
@@ -89,6 +89,8 @@ ignore_missing_imports =3D True<br>
=C2=A0# no Warning level messages displayed, use &quot;--disable=3Dall --en=
able=3Dclasses<br>
=C2=A0# --disable=3DW&quot;.<br>
=C2=A0disable=3Dtoo-many-function-args,=C2=A0 # mypy handles this with less=
 false positives.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing-docstring, # FIXME<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fixme, # FIXME<br></blockquote><div><br></div>=
<div>You aren&#39;t actually using any FIXME statements in this branch righ=
t now that I can see, so you don&#39;t need that suppression. It could be r=
emoved in V3.<br></div><div>=C2=A0</div></div></div></blockquote><div><br><=
/div><div>Sorry, I was mistaken, this will trigger on the TODO entries that=
 you *are* using.</div><div><br></div><div>--js<br></div></div></div>

--000000000000496c1805c79241f0--


