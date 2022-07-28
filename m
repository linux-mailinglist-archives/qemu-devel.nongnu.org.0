Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB758407F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:02:57 +0200 (CEST)
Received: from localhost ([::1]:34550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH46K-0002of-KI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH3mI-0000Lm-LT; Thu, 28 Jul 2022 09:42:14 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oH3mF-0004qi-QT; Thu, 28 Jul 2022 09:42:13 -0400
Received: by mail-lf1-x136.google.com with SMTP id p11so2920647lfu.5;
 Thu, 28 Jul 2022 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5Tkw6dozGjFH9WqIvPUISKI3cJvoIf9afm/46GYdgc=;
 b=ggKMUEc3IvlrXRCcoGrPKXZwH1BG9trE4nMq8VLwa+LMsgPn5Ge+1M8CAZjGdUEsFa
 /yMn5pqxAUCEFjx/D41CeGssS/d/bIu/IE/x3vKWDbFdm4C+NC8Vuj1shYIiiiGL/Zee
 touCBArsfp56SNyym6KvL/+V7kpzgGVMwD6p57uP0iOXp7lq+uVOuViVFTcjXjHcSTT2
 cOu9HHCsn+VdURxaVW6t9fk3yOCTwZ9n4MtZtjm7fqLT7L+ZStzAGabXAdkZQ3RCcpcM
 4Y97vxuWiugvO6+sPsPtmg4gBn5YizQAODY513MwhnTfu2HhO6n3usbLzDbknqm5XtNx
 eRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5Tkw6dozGjFH9WqIvPUISKI3cJvoIf9afm/46GYdgc=;
 b=pt1A+DtB8gAA+qNXyiBpx8r0My5sghAiQ9H0kyzQS6z4WuLPdQNTDgtAAQ351l0XJ+
 fcn7qlOMN4vSvjfYx53gYl7G7psSaiO9A8oO8Z8wATt3fW3NxMVH/R5+z1S/4+JtSvbB
 eQ5dk00PlbTZZKXAW6MdqqwvuzdgyZGoxvtz230Ict93rBmcW2d6nfw2IYV+61efmojX
 E3VbXJ4EPmJ6FsvmMsT1QV9PuiQDFO5UAdG2WtlKiaU4gORyIWQim8xbx0rruS0XcuIH
 mvV2C0a8Y0c6vm40ZQyxLJAwfExjDNmNtwO3BaMRUWKd01chdhSsYi4723fuAOfC4HYA
 x+4Q==
X-Gm-Message-State: AJIora/Txgp+XiHHmCAeHX0FmEVVXy+a10fIlzGg7TxIko3U4l1OMnbj
 kkEuBJdtazyi/ml3YrYqITpmTEvrs7/8pWUykNE=
X-Google-Smtp-Source: AGRyM1uBAUcEQRAP6BH3UTTEI8QWJrEyGI+xFwa+Cm5aWa0bytPog3eW5gt84PUum2KfkBXgrIsbmWkIkUCPktlr7Yg=
X-Received: by 2002:a05:6512:3f19:b0:48a:874f:534 with SMTP id
 y25-20020a0565123f1900b0048a874f0534mr7466863lfa.446.1659015728100; Thu, 28
 Jul 2022 06:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-12-frankja@linux.ibm.com>
 <CAMxuvawu-q-Fe4ZXU2Bc1gwLfpQCCw3HxWhbBK6+8exkM1b+nw@mail.gmail.com>
 <e24cff5c-3171-69dc-3e17-d4f773be6f2b@linux.ibm.com>
 <CAJ+F1CL8qm4qiHbKyE2YCAZ1ZVMKF-UAR6f39zMgw2Xdq7zCgQ@mail.gmail.com>
 <7fe6312d-d523-2f3d-56de-ed73e267a851@linux.ibm.com>
In-Reply-To: <7fe6312d-d523-2f3d-56de-ed73e267a851@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 28 Jul 2022 17:41:56 +0400
Message-ID: <CAJ+F1C+CqaeKzxPsCFfvbAo+gvG_PF+B7Ex0WJgBymJQWU8eNQ@mail.gmail.com>
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="0000000000002679bb05e4ddb39d"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x136.google.com
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

--0000000000002679bb05e4ddb39d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Jul 26, 2022 at 6:26 PM Janosch Frank <frankja@linux.ibm.com> wrote=
:

> On 7/26/22 15:12, Marc-Andr=C3=A9 Lureau wrote:
> > On Tue, Jul 26, 2022 at 4:55 PM Janosch Frank <frankja@linux.ibm.com>
> wrote:
> >
> >> On 7/26/22 13:25, Marc-Andr=C3=A9 Lureau wrote:
> >>> Hi
> >>>
> >>> On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com>
> >> wrote:
> >>>>
> >>>> As sections don't have a type like the notes do we need another way =
to
> >>>> determine their contents. The string table allows us to assign each
> >>>> section an identification string which architectures can then use to
> >>>> tag their sections with.
> >>>>
> >>>> There will be no string table if the architecture doesn't add custom
> >>>> sections which are introduced in a following patch.
> >>>>
> >>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> [...]
> >> [..]
> >>>>        s->length =3D length;
> >>>> +    /* First index is 0, it's the special null name */
> >>>> +    s->string_table_buf =3D g_array_new(FALSE, TRUE, 1);
> >>>> +    /*
> >>>> +     * Allocate the null name, due to the clearing option set to tr=
ue
> >>>> +     * it will be 0.
> >>>> +     */
> >>>> +    g_array_set_size(s->string_table_buf, 1);
> >>>
> >>> I wonder if GByteArray wouldn't be more appropriate, even if it
> >>> doesn't have the clearing option. If it's just for one byte, ...
> >>
> >> I don't really care but I need a decision on it to change it :)
> >>
> >
> > I haven't tried, but I think it would be a better fit.
>
> Looking at this a second time there's an issue you should consider:
>
> GByteArray uses guint8 while the GArray uses gchars which are apparently
> compatible with normal C chars.
>
> I.e. I need to cast all strings to (const guint8 *) when appending them
> to the GByteArray.
>

Agh, boring.. well, we also have include/qemu/buffer.h that could be
considered perhaps

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002679bb05e4ddb39d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 26, 2022 at 6:26 P=
M Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">frankja@linux.=
ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 7/26/22 15:12, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; On Tue, Jul 26, 2022 at 4:55 PM Janosch Frank &lt;<a href=3D"mailto:fr=
ankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt; wrote:=
<br>
&gt; <br>
&gt;&gt; On 7/26/22 13:25, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt;&gt;&gt; Hi<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank &lt;<a href=3D"m=
ailto:frankja@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt=
;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; As sections don&#39;t have a type like the notes do we nee=
d another way to<br>
&gt;&gt;&gt;&gt; determine their contents. The string table allows us to as=
sign each<br>
&gt;&gt;&gt;&gt; section an identification string which architectures can t=
hen use to<br>
&gt;&gt;&gt;&gt; tag their sections with.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; There will be no string table if the architecture doesn&#3=
9;t add custom<br>
&gt;&gt;&gt;&gt; sections which are introduced in a following patch.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja=
@linux.ibm.com" target=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
[...]<br>
&gt;&gt; [..]<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;length =3D length;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /* First index is 0, it&#39;s the special n=
ull name */<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 s-&gt;string_table_buf =3D g_array_new(FALS=
E, TRUE, 1);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /*<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* Allocate the null name, due to the =
clearing option set to true<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0* it will be 0.<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 g_array_set_size(s-&gt;string_table_buf, 1)=
;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I wonder if GByteArray wouldn&#39;t be more appropriate, even =
if it<br>
&gt;&gt;&gt; doesn&#39;t have the clearing option. If it&#39;s just for one=
 byte, ...<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t really care but I need a decision on it to change it :=
)<br>
&gt;&gt;<br>
&gt; <br>
&gt; I haven&#39;t tried, but I think it would be a better fit.<br>
<br>
Looking at this a second time there&#39;s an issue you should consider:<br>
<br>
GByteArray uses guint8 while the GArray uses gchars which are apparently <b=
r>
compatible with normal C chars.<br>
<br>
I.e. I need to cast all strings to (const guint8 *) when appending them <br=
>
to the GByteArray.<br>
</blockquote></div><br clear=3D"all"></div><div>Agh, boring.. well, we also=
 have include/qemu/buffer.h that could be considered perhaps</div><div><br>=
</div><div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=
=A9 Lureau<br></div></div></div>

--0000000000002679bb05e4ddb39d--

