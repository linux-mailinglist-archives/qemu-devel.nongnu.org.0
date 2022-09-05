Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9128D5AD346
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 14:56:51 +0200 (CEST)
Received: from localhost ([::1]:43852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVBek-0000nR-HZ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 08:56:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVBEg-0005xJ-MV
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:29:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oVBEc-0004Hs-Hd
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:29:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662380989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OF3o0GhfRrLNWkDv+HjFa50QVWIEbUn5Xm8l8mS5/wE=;
 b=c+3cDh4qFSxHx1tSvcmqXLVT5gh+XUaCcw0M98Zum/jraZ85rnrEJQLeJ3CRkZcqBf6h10
 YLeuDJVIkVPUfIyJKiRSy+la/TbdonPkng+xn4ja/2ZxE10Un2jnm01Y11Y0/bIxCjJup0
 Bv1VecAoLD7nJDdAJFGaEGTSPUyTMiY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-tTWRutONOc-O5BcoWzW0ZQ-1; Mon, 05 Sep 2022 08:29:47 -0400
X-MC-Unique: tTWRutONOc-O5BcoWzW0ZQ-1
Received: by mail-lf1-f71.google.com with SMTP id
 f17-20020a05651232d100b00496818e1821so105297lfg.1
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 05:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=OF3o0GhfRrLNWkDv+HjFa50QVWIEbUn5Xm8l8mS5/wE=;
 b=V7kXWMLZN+u63+0JJRi6X4TmMZCN3uLB/CrQnsL/oFuPDpIE7E2b6cKpDfJi2P9YM/
 qE5V/whmRY12IIpRYT7ka/06IyJfiYyRQ84B7Toca6ERJ1j2bNharljlaDXMqoZ5YTR7
 bKvER4iHeTI9wT9X3wLd+2/VncxQ+ApX98tO2RVOSYb1rBzzIVNLrs1DNViht+R2jTkv
 mpBzrFrX407o25+d+PfYGTuPpqbmuYT1hnI+fnR1UXuA3s5YqDHxsTv/sFp9ici7xZC5
 /byWHK2XMIhAT+ZC/yqotH2Ni+RUvOadC4ri04qYVqvyp1ml2Sow2TFf3PHynDdP21dt
 c34w==
X-Gm-Message-State: ACgBeo3iHxkmjDcbP22VvYP9O5owqdzftbphYiB6qzbiviDapUJboOlh
 uinPwdgSHq9uozZOVekTLGPMsDLMmt5Qji+2qfMMmuB+ijrqmf2M7chaGKcpMXm8vYfQfEvA6n8
 xlmWtRWSjkyJHSpgsPZm1GeMaBkb+BoM=
X-Received: by 2002:a05:6512:104e:b0:494:8e74:95be with SMTP id
 c14-20020a056512104e00b004948e7495bemr7536513lfb.465.1662380986433; 
 Mon, 05 Sep 2022 05:29:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4JZKtZqLxoi4nbaDU1wDl4+VlAQ342r2v0G2tKAZY/yeLasQhiI3CYxSHp8Mzpf4EVs/OkpJCINgnY0e0hxTY=
X-Received: by 2002:a05:6512:104e:b0:494:8e74:95be with SMTP id
 c14-20020a056512104e00b004948e7495bemr7536510lfb.465.1662380986172; Mon, 05
 Sep 2022 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220905110151.32225-1-pbonzini@redhat.com>
 <CAJ+F1CKdHhZA8Lc_j85B4EzqHNoCvsejLZUP36GWzH=_1uAiEQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CKdHhZA8Lc_j85B4EzqHNoCvsejLZUP36GWzH=_1uAiEQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 5 Sep 2022 14:29:35 +0200
Message-ID: <CABgObfZcke7Byj06i2rp-QXa98GOiBVteo1_Om11K1cnjt2cNw@mail.gmail.com>
Subject: Re: [PATCH] tests: test-qga: close socket on failure to connect
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000029a6ef05e7ed3c3b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000029a6ef05e7ed3c3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There is no portable way to handle EINTR on close() as far as I know. You
can't really do anything but cross your fingers.

Paolo

Il lun 5 set 2022, 13:36 Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com=
> ha
scritto:

> Hi
>
> On Mon, Sep 5, 2022 at 3:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>> Reported by Coverity as CID 1432543.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>  tests/unit/test-qga.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
>> index a05a4628ed..d27ff94d13 100644
>> --- a/tests/unit/test-qga.c
>> +++ b/tests/unit/test-qga.c
>> @@ -32,6 +32,7 @@ static int connect_qga(char *path)
>>              g_usleep(G_USEC_PER_SEC);
>>          }
>>          if (i++ =3D=3D 10) {
>> +            close(s);
>>
>
> We may want to be a bit safer and use g_close(), which handles EINTR too.
> Anyway
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>>              return -1;
>>          }
>>      } while (ret =3D=3D -1);
>> --
>> 2.37.2
>>
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>

--00000000000029a6ef05e7ed3c3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There is no portable way to handle EINTR on close() as fa=
r as I know. You can&#39;t really do anything but cross your fingers.<div d=
ir=3D"auto"><br></div><div dir=3D"auto">Paolo=C2=A0</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il lun 5 set 2022,=
 13:36 Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">marcandre.lureau@gmail.com</a>&gt=
; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
 dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Sep 5, 2022 at 3:27 PM Paolo Bonzini &lt;<a href=
=3D"mailto:pbonzini@redhat.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Reported by Coverity as CID 1432543.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" rel=
=3D"noreferrer noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br=
>
---<br>
=C2=A0tests/unit/test-qga.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c<br>
index a05a4628ed..d27ff94d13 100644<br>
--- a/tests/unit/test-qga.c<br>
+++ b/tests/unit/test-qga.c<br>
@@ -32,6 +32,7 @@ static int connect_qga(char *path)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_usleep(G_USEC_PER_SEC);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i++ =3D=3D 10) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(s);<br></blockquote><div><=
br></div><div>We may want to be a bit safer and use g_close(), which handle=
s EINTR too. Anyway<br></div><div><br></div><div>Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0} while (ret =3D=3D -1);<br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div>

--00000000000029a6ef05e7ed3c3b--


