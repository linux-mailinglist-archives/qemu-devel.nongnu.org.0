Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8646D6DAB16
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 11:49:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkij4-00012c-4A; Fri, 07 Apr 2023 05:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkij2-00012E-JA
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:49:44 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <digit@google.com>) id 1pkij1-0002ss-0f
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 05:49:44 -0400
Received: by mail-il1-x12a.google.com with SMTP id n1so21204996ili.10
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680860981; x=1683452981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zi+Nn86R8x1UZRJcqX1ppEUXsC5TpbzNoXK4UzGc/Zk=;
 b=dyAgfaO9PVKnNIuAa3qxfVQhLayFI4qoozIEtdxStQrtQweWGFCyuHfL2QHgN4L1Ke
 Cx/MSO/yRobj5wudLjSK/VYfLoKbUG3O8rkV2H0y8O1xpkIvb0s+RCTZXMXlNLRmsplS
 AM6sKrFs3YmNgKDIjQ3b3Bl24zBTbGGHNBbINw7yXUZZ7eC/yLslak65Yf6Ng0THaNwj
 IzG00T2aUi9bq9N0eCSsC/Kurz3/jCQPXyxQDlh5x2EmBUqfpcH0w8mYSyaAi/WXspZt
 ZzuovuHe7vtwk2oTti6xGckMcz+JlyrvemL88FdziYz9NqmpTncOyXoMzq9fP2DZsjG+
 tDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680860981; x=1683452981;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zi+Nn86R8x1UZRJcqX1ppEUXsC5TpbzNoXK4UzGc/Zk=;
 b=HXNawYF68aMjIBL8vmoeUlvWScpjpLZKeQ4MtJAMeJbokNYcLIQ+krh30lWmtptr2x
 xDS2dXxV4Xhme3MuGpeQRiSbktitJmCAxqttBTwyydAFRNW2u3mHoKJwlLL/CWINEC6/
 FOa1HJHFGfbc1o/sEZS19Gj67ImBXC2OrzscVOpn/JfyXEUdLlOtcvHaNHH8F5ZA0PyY
 2sqRumTq7sEFzELwvaBJYbqqStu8SWBTQ3nlkqsUWXKfT8YDvbG0FLnbrZlJ9i8HHBBu
 T1ZkJBTNLfGjykxwIbdc6FK6KouTm30IGhMnOsNTgY9aSQ+Hl+yolQLsCuRyqlanPPOm
 Kkfw==
X-Gm-Message-State: AAQBX9f4vYx7YomF0pI158lAqmzh5uiPiDleNwQaXA6LbOtNKSjZ/Aty
 rjt3FHjUGq4yOADL8J0X0YZxoVpbsM9VDT4h6Cf52Q==
X-Google-Smtp-Source: AKy350Zw55e2E3V8YP6MD2CaAkPAxpx52093CAuZ0n8SgHcc6T/76BOg2Mwsw8eBhTfK4d0x4dH663+8h54w7uoMdVY=
X-Received: by 2002:a05:6e02:120f:b0:326:5ee1:ecc3 with SMTP id
 a15-20020a056e02120f00b003265ee1ecc3mr923543ilq.5.1680860981569; Fri, 07 Apr
 2023 02:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230405172109.3081788-1-digit@google.com>
 <20230405172109.3081788-2-digit@google.com>
 <20230407035709-mutt-send-email-mst@kernel.org>
 <CACnJMqpF9FPwtZz3Uj_amCbrRtQo7WWPm0bY_qy=80+ihb8Uhw@mail.gmail.com>
 <CACnJMqoS3L6=zTCL4__EwOk8pR0kR4P2Kbrv5U_xB8Lm2e=vXQ@mail.gmail.com>
 <CACnJMqp_+8W74_xbfkiAcR5_o6kgmyz46gkiroccNMye9ubdUw@mail.gmail.com>
 <20230407054455-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230407054455-mutt-send-email-mst@kernel.org>
From: David Turner <digit@google.com>
Date: Fri, 7 Apr 2023 11:49:30 +0200
Message-ID: <CACnJMqokdhkE5F_nDUtbAUWa8Fs8NBO1Ns0SvyPf58YsUJAfeQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Fix libvhost-user.c compilation.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b9b25605f8bbf1eb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=digit@google.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000b9b25605f8bbf1eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 11:46=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:

> On Fri, Apr 07, 2023 at 11:29:46AM +0200, David Turner wrote:
> > So it looks like that for some reason, the QEMU linux-headers directory
> is not
> > in the include search path for this compilation command, and that the
> > system-or-sysroot provided <linux/vhost.h> is picked instead. Fixing
> this might
> > be a better long-term fix than what I am proposing in this patch. I am
> not sure
> > how to do that yet though. Do you have any recommendations?
>
> Check what flags are passed to the compiler :)
>

That's what I did :-)

meson.build has:
>
> if targetos =3D=3D 'linux'
>   add_project_arguments('-isystem', meson.current_source_dir() /
> 'linux-headers',
>                         '-isystem', 'linux-headers',
>                         language: all_languages)
> endif
>
> add_project_arguments() does not apply the arguments to subprojects, henc=
e
why this fails for subprojects/libvhost-user /


> --
> MST
>
>

--000000000000b9b25605f8bbf1eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 7, 2023 at 11:46=E2=80=AF=
AM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Fri, Apr 07, 2023 at 11:29:46AM +0200, David Turner wrote:<br>
&gt; So it looks like that for some reason, the QEMU linux-headers director=
y is not<br>
&gt; in the include search path for this compilation command, and that the<=
br>
&gt; system-or-sysroot provided &lt;linux/vhost.h&gt; is picked instead. Fi=
xing this might<br>
&gt; be a better long-term fix than what I am proposing in this patch. I am=
 not sure<br>
&gt; how to do that yet though. Do you have any recommendations?<br>
<br>
Check what flags are passed to the compiler :)<br></blockquote><div><br></d=
iv><div>That&#39;s what I did :-)<br><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
meson.build has:<br>
<br>
if targetos =3D=3D &#39;linux&#39;<br>
=C2=A0 add_project_arguments(&#39;-isystem&#39;, meson.current_source_dir()=
 / &#39;linux-headers&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;-isystem&#39;, &#39;linux-headers&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 language: all_languages)<br>
endif<br>
<br></blockquote><div>add_project_arguments() does not apply the arguments =
to subprojects, hence why this fails for subprojects/libvhost-user /</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
MST<br>
<br>
</blockquote></div></div>

--000000000000b9b25605f8bbf1eb--

