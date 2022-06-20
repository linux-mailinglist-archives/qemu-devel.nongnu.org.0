Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01754551AAA
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 15:19:31 +0200 (CEST)
Received: from localhost ([::1]:38094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3HJS-0005x6-97
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 09:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3HCf-0001OR-Ot
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:12:29 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o3HCe-0001Iz-2j
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:12:29 -0400
Received: by mail-lj1-x231.google.com with SMTP id s10so11841123ljh.12
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 06:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sn4fDjK871+kOO+FBBUggX/tv07cshjN1lvMq9KTnRs=;
 b=OqmNzkMTW6L+jsGUZqOEX8t1T5okPG1DlLcH/DjaB8eqEIN07ctMuh9+7ZyCg21E9n
 ryIHWdI3sLZgpteTjGQBLdS2CM3EPTPjYybFQYPeayXpbXhtNsul11wTlZMWVenkM4Q7
 K9P3YeR3qbyss8kQ8dbZDev+7Z7idmVgHlSneFb3CiAy+VBOpBLdWIAMa8APUomL/TLl
 Ff9er4d2mnssqzAsUrPUIArhoorKxkJvFn0g2dyBePH8TBdF7PdRwuoC13+NZdNc4+Ai
 wnF1wWRSVBfPr7ylIutR9zwdn3ChKmLndUwsr0KK9T1fmyQOZAORLMhhpAETIyXHkA/p
 rKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sn4fDjK871+kOO+FBBUggX/tv07cshjN1lvMq9KTnRs=;
 b=Gt1nPyGDU/MUXSrZl7W74cwOgU9AUnZMZOXdC1f7tTmQv1V5qTYmTA/FeWVXVA7TA+
 7yDbXaLFSNMkdaHQ4ULZkl4ILqI3jHglgzjg0yiBsMPSvQ3ruBAxlnov6Ff3mARMidOL
 RnN65aheg+jxVt/12yYOguKcCIS2IiD+1UYHCniiVrwbbIJLJz6NbM7q4YSO9X9NDgAa
 d1a/fHcc78cIwHn96DPF8LaLIyhwZNBh3oWBL2yZaLH1LlP675Lu+Kjq/gsCSHCDHQJ5
 Jny5lichNpnn2joHRTb2ste4+ErcizKxFz1f5Q6ugyxqDNvBY2SKDPBx+NyjO0RAFFif
 IhMA==
X-Gm-Message-State: AJIora95EzTfViKFycYa53zIsYZVBJB7U36EHz5PmfRTIp1h1RAs6buX
 bYh43pOgFUV6OAoNsXXeXLx5nXVd6rua1Tm2gv0=
X-Google-Smtp-Source: AGRyM1sY+6v1LdRVadu0xCuqKbYYzYzHqvIqJrHNeCy66NtTAoAAXq0fcPYvjOJY51AQcyOXlK21buZzpXjrUgAOV00=
X-Received: by 2002:a05:651c:1542:b0:249:5d86:3164 with SMTP id
 y2-20020a05651c154200b002495d863164mr12009008ljp.500.1655730746474; Mon, 20
 Jun 2022 06:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
 <20220615173345.32456-2-akihiko.odaki@gmail.com>
 <CAJ+F1CJNmoyroKHvwWkKfNPPjEaM1MBAepZ_uoEdAuwY-RYEnw@mail.gmail.com>
In-Reply-To: <CAJ+F1CJNmoyroKHvwWkKfNPPjEaM1MBAepZ_uoEdAuwY-RYEnw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 20 Jun 2022 17:12:14 +0400
Message-ID: <CAJ+F1C+9Ma=A8TkDaPx61zncRwZTqJoUxDSrhkLMN4VRRLPwBw@mail.gmail.com>
Subject: Re: [PATCH v7 1/6] qga: Relocate a path emitted in the help text
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, Programmingkid <programmingkidx@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fcc37b05e1e0dacb"
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

--000000000000fcc37b05e1e0dacb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 20, 2022 at 5:11 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

>
>
> On Wed, Jun 15, 2022 at 9:43 PM Akihiko Odaki <akihiko.odaki@gmail.com>
> wrote:
>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>

Oops, could you avoid leaking the result? g_autofree makes that easy.
thanks


> ---
>>  qga/main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/qga/main.c b/qga/main.c
>> index c373fec3ee6..06e507b9979 100644
>> --- a/qga/main.c
>> +++ b/qga/main.c
>> @@ -270,7 +270,7 @@ QEMU_HELP_BOTTOM "\n"
>>      , cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT,
>>      dfl_pathnames.pidfile,
>>  #ifdef CONFIG_FSFREEZE
>> -    QGA_FSFREEZE_HOOK_DEFAULT,
>> +    get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT),
>>  #endif
>>      dfl_pathnames.state_dir);
>>  }
>> --
>> 2.32.1 (Apple Git-133)
>>
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000fcc37b05e1e0dacb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 20, 2022 at 5:11 PM Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marca=
ndre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, =
2022 at 9:43 PM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com=
" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Akihiko Odaki &lt=
;<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki=
@gmail.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Marc-An=
dr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><=
/div></div></blockquote><div><br></div><div>Oops, could you avoid leaking t=
he result? g_autofree makes that easy.</div><div>thanks<br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div class=3D"gmail_quote"><div></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
---<br>
=C2=A0qga/main.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/main.c b/qga/main.c<br>
index c373fec3ee6..06e507b9979 100644<br>
--- a/qga/main.c<br>
+++ b/qga/main.c<br>
@@ -270,7 +270,7 @@ QEMU_HELP_BOTTOM &quot;\n&quot;<br>
=C2=A0 =C2=A0 =C2=A0, cmd, QGA_VIRTIO_PATH_DEFAULT, QGA_SERIAL_PATH_DEFAULT=
,<br>
=C2=A0 =C2=A0 =C2=A0dfl_pathnames.pidfile,<br>
=C2=A0#ifdef CONFIG_FSFREEZE<br>
-=C2=A0 =C2=A0 QGA_FSFREEZE_HOOK_DEFAULT,<br>
+=C2=A0 =C2=A0 get_relocated_path(QGA_FSFREEZE_HOOK_DEFAULT),<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0dfl_pathnames.state_dir);<br>
=C2=A0}<br>
-- <br>
2.32.1 (Apple Git-133)<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fcc37b05e1e0dacb--

