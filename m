Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9035AD39F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 15:19:39 +0200 (CEST)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVC0n-0001V5-PJ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 09:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVBL6-0002E2-0g
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:36:33 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:33495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oVBL1-0005je-N8
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 08:36:31 -0400
Received: by mail-lj1-x230.google.com with SMTP id r27so8691218ljn.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 05:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=TMUZcosU/2C8P8iV2Zwuy1CI34CUP02+GYoarMO7nA0=;
 b=WDSgPPjTSNffCZhwKjoWK77cwf0rKW1vsrwqrvsB75Nm/dvkkAufXn5CgoK43IOFYO
 ZfQgPZD5cYEqpX+W2xnLhyAbUknokoIVQh3ElgChNKMps1CPMSclaeZ8/um142M1YsUL
 /bITbH6bNHPcJ8uIoulHOa/Rzc84iTRBUkcZtccGPAjY0obPjy3gt9k2f+Zesh/+7Tlt
 1UbIh4sYXgb7Fhz9w8NdRQMKRPlHVOyFTmk4CQ02Vev9I12bzXauxUa5jw3uAn4X/ALf
 UT+6cR6Gir+IfkFhdIzWFWcMuOsgLEYzXSIqLD61cznoRUL80x0oCmRmeWc2F7UK7XlS
 QUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=TMUZcosU/2C8P8iV2Zwuy1CI34CUP02+GYoarMO7nA0=;
 b=r/sgIE3lpY2UnBjMVOGI5NMUmDV7PD9JfTGmRUPvix3imBxXePXVM301EzFVE1WyTS
 imPTfy+hOIys+Cg0m/0shX/5kv4YptgnUtYoewm17ZXWn1sI4hsVsZcuBmbTwp0939hx
 x6FGOx7eaLHBIP2gNcbBzZpnyoEGGoFb+r/Z4LXlULE7YOkfLLlgC4Yqp98h/x3SwHRL
 yBi8TZWZEiMuTxY3QF73reykH4MafKaioDgh8yWlnKbRtnhIDXHo15SH9vfG5vMLOJCB
 EfFSIfOX+mTYXqOibCy81MK+Ljv4q2eUi4iIiithRKLKx5o9EW2r3IYjaaJklHSSM4aX
 WymA==
X-Gm-Message-State: ACgBeo1u85lPMPEJ18rG9QZUfJL8rQalrc0AePbxrAwIWPCZ//wysEsP
 SbjxY7/iZQNtbHp/803asbyuhoYbRgMxHw6HRgk=
X-Google-Smtp-Source: AA6agR7GcRfX7Q2J4nJEonBm3z7LVnJfdPEhNBiMSKrJUnELVJ1e7RAxZ5WzAZmObTDtDepIVnIRqa89a09BGHYg/JY=
X-Received: by 2002:a2e:a789:0:b0:267:917b:401b with SMTP id
 c9-20020a2ea789000000b00267917b401bmr8734892ljf.452.1662381385914; Mon, 05
 Sep 2022 05:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220905110151.32225-1-pbonzini@redhat.com>
 <CAJ+F1CKdHhZA8Lc_j85B4EzqHNoCvsejLZUP36GWzH=_1uAiEQ@mail.gmail.com>
 <CABgObfZcke7Byj06i2rp-QXa98GOiBVteo1_Om11K1cnjt2cNw@mail.gmail.com>
In-Reply-To: <CABgObfZcke7Byj06i2rp-QXa98GOiBVteo1_Om11K1cnjt2cNw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Sep 2022 16:36:14 +0400
Message-ID: <CAJ+F1CLCgmYhLq4tdK7dmfE_Ngoh=zTvgBpS0vfHV0UgVPj6bQ@mail.gmail.com>
Subject: Re: [PATCH] tests: test-qga: close socket on failure to connect
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000fd1f2b05e7ed534d"
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x230.google.com
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

--000000000000fd1f2b05e7ed534d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi


On Mon, Sep 5, 2022 at 4:29 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> There is no portable way to handle EINTR on close() as far as I know. You
> can't really do anything but cross your fingers.
>
>
Right, it actually ignores EINTR at this point. See:
https://gitlab.gnome.org/GNOME/glib/-/commit/f398bec5bcc0d924e2401c76a6b941=
33e9490835

Paolo
>
> Il lun 5 set 2022, 13:36 Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.c=
om>
> ha scritto:
>
>> Hi
>>
>> On Mon, Sep 5, 2022 at 3:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>>
>>> Reported by Coverity as CID 1432543.
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>  tests/unit/test-qga.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
>>> index a05a4628ed..d27ff94d13 100644
>>> --- a/tests/unit/test-qga.c
>>> +++ b/tests/unit/test-qga.c
>>> @@ -32,6 +32,7 @@ static int connect_qga(char *path)
>>>              g_usleep(G_USEC_PER_SEC);
>>>          }
>>>          if (i++ =3D=3D 10) {
>>> +            close(s);
>>>
>>
>> We may want to be a bit safer and use g_close(), which handles EINTR too=
.
>> Anyway
>>
>> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>>
>>>              return -1;
>>>          }
>>>      } while (ret =3D=3D -1);
>>> --
>>> 2.37.2
>>>
>>>
>>>
>>
>> --
>> Marc-Andr=C3=A9 Lureau
>>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fd1f2b05e7ed534d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 5, 2022 at 4:29 PM Paol=
o Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"auto">There is no portable way to handle EINTR on close() as far a=
s I know. You can&#39;t really do anything but cross your fingers.<div dir=
=3D"auto"><br></div></div></blockquote><div><br></div><div>Right, it actual=
ly ignores EINTR at this point. See:<br></div><div><a href=3D"https://gitla=
b.gnome.org/GNOME/glib/-/commit/f398bec5bcc0d924e2401c76a6b94133e9490835">h=
ttps://gitlab.gnome.org/GNOME/glib/-/commit/f398bec5bcc0d924e2401c76a6b9413=
3e9490835</a></div><div> <br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"auto"><div dir=3D"auto"></div><div dir=3D"auto">Paol=
o=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il lun 5 set 2022, 13:36 Marc-Andr=C3=A9 Lureau &lt;<a href=3D=
"mailto:marcandre.lureau@gmail.com" rel=3D"noreferrer" target=3D"_blank">ma=
rcandre.lureau@gmail.com</a>&gt; ha scritto:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Sep 5, 2022 at 3:27 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redha=
t.com" rel=3D"noreferrer noreferrer" target=3D"_blank">pbonzini@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">R=
eported by Coverity as CID 1432543.<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fd1f2b05e7ed534d--

