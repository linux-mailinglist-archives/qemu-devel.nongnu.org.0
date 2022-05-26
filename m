Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027D535085
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 16:24:41 +0200 (CEST)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuEPn-0007nc-Ig
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 10:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEN3-00066v-OQ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:21:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nuEN1-0001tb-ES
 for qemu-devel@nongnu.org; Thu, 26 May 2022 10:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653574906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D8v37VAQjA6W4GVOrATKDTqf9X9jTh5yeAzgycI4y1Q=;
 b=aalSP1/KOdaobAhsB86PNu9zpW8cYarMU6HsozLQfQGHYuBIBzGdMUyQpd4rJ2k+UF2fQ0
 TaXypS3PpUtSCq8+/ykBtUssy5XABwSZwanxR9cqbr6bG/OZv2ND85/X51VsGXqDQaEeN4
 LuAkDe6ZBvFy5Itp0WcZ0lemrUFnzzA=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-TSTCKrVFMnK0D7enGNtreA-1; Thu, 26 May 2022 10:21:40 -0400
X-MC-Unique: TSTCKrVFMnK0D7enGNtreA-1
Received: by mail-vk1-f198.google.com with SMTP id
 m65-20020a1f5844000000b0035adfd2bc2dso56589vkb.8
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 07:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D8v37VAQjA6W4GVOrATKDTqf9X9jTh5yeAzgycI4y1Q=;
 b=epFwZTnNeH1fxe3988taQEAw+uSZXkphZi+PfMNj9eD01JeyE188YbFZky5x1eTB/j
 XDa900l35LQmMQcKAewAVQ2u8nBZunZgCHMZrDMxhMdb1bBU2vY4w0PjamD39GHCht88
 6Fx1eZvhsbaLwNEa9xe3ybCbItoWef/+XNwkxmjvLkFNyYCSVmiOyn66PQMkOL93LnZb
 R0gMoJAvZnvwbSCjjwCv9ylGkZuVMEpHFwE78O1zDBKqHH8YHlT3yc8RkRU5kIrVi/hH
 IBZKyJubPnIH/+4S3duy0wlDq2onchPGnsIM2ydhAb+mwBJ8fBEABzoBahnZBGgbg7rn
 VnQQ==
X-Gm-Message-State: AOAM531r3r5ZMpinUn9w39URX5LuICu4ytgZAT6SaLW5Xes+QxnySlUV
 wr1Gg6qYeZgFMdo+huA70gpqKtbJ56HitCdSwa69lEaKVoDwF6GbkabXr3ErP+/d7hfydYlRGbw
 QVlCLIwvsUtIzWfrbwS/00ejqJC4HCxY=
X-Received: by 2002:a1f:bdd6:0:b0:356:f1ef:69f7 with SMTP id
 n205-20020a1fbdd6000000b00356f1ef69f7mr14968643vkf.1.1653574899448; 
 Thu, 26 May 2022 07:21:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxz9uJTV2p3ou29TFnT/F3IN09X+gSrR21jpVKKBabAujwr4ef++YVHp1rXxPDReM78sr9ESfXzbL9PhFdq6Q=
X-Received: by 2002:a1f:bdd6:0:b0:356:f1ef:69f7 with SMTP id
 n205-20020a1fbdd6000000b00356f1ef69f7mr14968634vkf.1.1653574899143; Thu, 26
 May 2022 07:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220526002512.1585246-1-jsnow@redhat.com>
 <Yo8yMoNjKsjZROQK@redhat.com>
In-Reply-To: <Yo8yMoNjKsjZROQK@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 26 May 2022 10:21:28 -0400
Message-ID: <CAFn=p-Y2+3JyTd_nn_HfCz6BbE=G3FYf5E1hZF7sovXBRK7YpQ@mail.gmail.com>
Subject: Re: [PATCH] iotests: fix source directory location
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000792ea205dfeae8ee"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000792ea205dfeae8ee
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2022, 3:54 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Wed, May 25, 2022 at 08:25:12PM -0400, John Snow wrote:
> > If you invoke the check script from outside of the tests/qemu-iotests
> > directory, the directories initialized as source_iotests and
> > build_iotests will be incorrect.
> >
> > We can use the location of the source file itself to be more accurate.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  tests/qemu-iotests/testenv.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/qemu-iotests/testenv.py
> b/tests/qemu-iotests/testenv.py
> > index a864c74b123..9b0f01e84db 100644
> > --- a/tests/qemu-iotests/testenv.py
> > +++ b/tests/qemu-iotests/testenv.py
> > @@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgproto: str,
> aiomode: str,
> >              self.build_iotests =3D
> os.path.dirname(os.path.abspath(sys.argv[0]))
> >          else:
> >              # called from the source tree
> > -            self.source_iotests =3D os.getcwd()
> > +            self.source_iotests =3D str(Path(__file__, '..').resolve()=
)
>
> Path(__file__).parent
>
> >              self.build_iotests =3D self.source_iotests
> >
> > -        self.build_root =3D os.path.join(self.build_iotests, '..', '..=
')
> > +        self.build_root =3D str(Path(self.build_iotests,
> '../..').resolve())
>
> Path(self.build_iotests).parent.parent
>
> to be portable
>

With windows? I think Path() is meant to be a fully portable class as-is,
but I'll double-check my assumption. I use ".." elsewhere in code already
checked in, so if it's a problem I ought to fix it everywhere.

--000000000000792ea205dfeae8ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 26, 2022, 3:54 AM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Wed, May 25, 2022 at 08:25:12=
PM -0400, John Snow wrote:<br>
&gt; If you invoke the check script from outside of the tests/qemu-iotests<=
br>
&gt; directory, the directories initialized as source_iotests and<br>
&gt; build_iotests will be incorrect.<br>
&gt; <br>
&gt; We can use the location of the source file itself to be more accurate.=
<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 tests/qemu-iotests/testenv.py | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testen=
v.py<br>
&gt; index a864c74b123..9b0f01e84db 100644<br>
&gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt; @@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgproto: str, a=
iomode: str,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_iotests =3D=
 os.path.dirname(os.path.abspath(sys.argv[0]))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # called from the sour=
ce tree<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.source_iotests =3D os.=
getcwd()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.source_iotests =3D str=
(Path(__file__, &#39;..&#39;).resolve())<br>
<br>
Path(__file__).parent<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_iotests =3D=
 self.source_iotests<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_root =3D os.path.join(self.bui=
ld_iotests, &#39;..&#39;, &#39;..&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_root =3D str(Path(self.build_i=
otests, &#39;../..&#39;).resolve())<br>
<br>
Path(self.build_iotests).parent.parent<br>
<br>
to be portable<br></blockquote></div></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">With windows? I think Path() is meant to be a fully portable =
class as-is, but I&#39;ll double-check my assumption. I use &quot;..&quot; =
elsewhere in code already checked in, so if it&#39;s a problem I ought to f=
ix it everywhere.</div></div>

--000000000000792ea205dfeae8ee--


