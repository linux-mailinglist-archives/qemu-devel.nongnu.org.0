Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294835BA8B0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 10:54:34 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ77H-0001HG-0w
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 04:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ6yg-0003uI-Ti
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:45:46 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ6yf-0004j4-4q
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 04:45:38 -0400
Received: by mail-ed1-x52d.google.com with SMTP id b35so30511359edf.0
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 01:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=GsarHA+suhj/oNgxtDSG/xY7JXojUomebG8EDgniZKU=;
 b=MT0BC3iMGZXzX14PhrS2z/Lh0f5ywWghUl0tohk5JlHz+1pav+sCSXckRYpdvJvhyj
 yPuH1rV1hGaZmgNMhwnbJqTGSV988AtP7ZEfailyFvCsmfoMpFcpeYDwtZTdz+GOFLAM
 y1czO5Ill/E2USfnycQZQTRIJkIs30knoaoD4XRV/t7Hx4nBHparrBMr/gINAjCNixhK
 wxfFHtYDxsCsHuJ6a5JHnx/RtlCnM/I2UpGgy65VMbWAkeu3u8+dhvKzPkQ2inPHqRgF
 ydhlWxY7ZIYzsCPYiTrIeDfPCJiaocQmibDDPll7Yhyu/emtCDPbq4qiwBXzOSdUMqYO
 E9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=GsarHA+suhj/oNgxtDSG/xY7JXojUomebG8EDgniZKU=;
 b=8MSTNGtoiK/hYC/wi2on5S4rgb4B2J+QEJX0yIHcFZocZGhZFARGTcFRfTpxdLMZRv
 nRjPOqt52BwzUuzAQxKj8eghisZK4QdmRAu+Cr2owcwxWblts8oiWuBacd5I2smITqcu
 eHjWuxKmfLOKJ+WkoynL0u+89szz/LV9sTO9u9TBoS58GbQToL/M52C3j99lVLytXfYw
 OvTFI/Z70Kyik+jsl/90Ewl2VxVJLGVpZiGSLmhK+FD/G9srtWFJcpz7NEIoKex8V2JZ
 gumCzI0OSBfK78hsHHoFcpb7Ga9OXxeEfnvvHa21oGrfMHD/n3cjaBWbqplAEl5Evdno
 4TdQ==
X-Gm-Message-State: ACrzQf3xs3VfJ1abeToes8yYKwmkyp/MaK6isuOvjJmNYYi9ng3kxK+2
 h6HUaK6wMtlnzAqeTtt8kAnZjtEkKZj0ZaQ1iYut3g==
X-Google-Smtp-Source: AMsMyM5skOfvK/cToLDY8h7c84C7FVmK63hMOcMQgp0AEOu1pFazLWu951ADBJR+ImhBTVkTjAw1Ls/LiPEgXCExKSE=
X-Received: by 2002:aa7:cb18:0:b0:452:9071:aff with SMTP id
 s24-20020aa7cb18000000b0045290710affmr3021394edt.194.1663317935543; Fri, 16
 Sep 2022 01:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-7-armbru@redhat.com>
 <CAARzgwyZK9EuKKj0UpUxC8BYEUBDwRYG==eTfndgNmKOE_FgKA@mail.gmail.com>
 <87illnenpv.fsf@pond.sub.org>
 <CAARzgwx8x0kW4tknikPzscm59cCDBRw_+z__tm_Rb=1EmYF=kQ@mail.gmail.com>
 <YyQ147txe78shJnc@redhat.com>
In-Reply-To: <YyQ147txe78shJnc@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 16 Sep 2022 14:15:24 +0530
Message-ID: <CAARzgwyTKe=bV0ScO1VP6yx9-Th0vd4ML5oFDuYOsVqq+VnRag@mail.gmail.com>
Subject: Re: [PATCH 06/27] qapi acpi: Elide redundant has_FOO in generated C
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, eblake@redhat.com, jsnow@redhat.com,
 michael.roth@amd.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b26ba305e8c76228"
Received-SPF: none client-ip=2a00:1450:4864:20::52d;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--000000000000b26ba305e8c76228
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 14:08 Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Fri, Sep 16, 2022 at 01:51:14PM +0530, Ani Sinha wrote:
> > On Fri, Sep 16, 2022 at 1:48 PM Markus Armbruster <armbru@redhat.com>
> wrote:
> > >
> > > Ani Sinha <ani@anisinha.ca> writes:
> > >
> > > > On Fri, Sep 16, 2022 at 2:13 AM Markus Armbruster <armbru@redhat.co=
m>
> wrote:
> > > >>
> > > >> The has_FOO for pointer-valued FOO are redundant, except for array=
s.
> > > >> They are also a nuisance to work with.  Recent commit "qapi: Start
> to
> > > >> elide redundant has_FOO in generated C"
> > > >
> > > > Commit is referenced using <commit hash 13 chars min> ("commit
> header")
> > >
> > > Apply my patches in your tree, and your hashes will differ from mine.
> > > Hashes can serve as stable reference only when we git-fetch patches,
> not
> > > when we git-send-email then.
> >
> > Has the referenced patch not been pushed upstream already? I thought
> > it was and hence was asking for the reference.
>
> Err, it is just a few patches earlier in this very series you're
> looking at.


Hmm ok. It=E2=80=99s missing from my inbox. Probably was not CC=E2=80=99d t=
o me.

--000000000000b26ba305e8c76228
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 16, 2022 at 14:08 Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">On Fri, Sep 16, 2022 at 01:51:14PM +0=
530, Ani Sinha wrote:<br>
&gt; On Fri, Sep 16, 2022 at 1:48 PM Markus Armbruster &lt;<a href=3D"mailt=
o:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Ani Sinha &lt;<a href=3D"mailto:ani@anisinha.ca" target=3D"_blank=
">ani@anisinha.ca</a>&gt; writes:<br>
&gt; &gt;<br>
&gt; &gt; &gt; On Fri, Sep 16, 2022 at 2:13 AM Markus Armbruster &lt;<a hre=
f=3D"mailto:armbru@redhat.com" target=3D"_blank">armbru@redhat.com</a>&gt; =
wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; The has_FOO for pointer-valued FOO are redundant, except=
 for arrays.<br>
&gt; &gt; &gt;&gt; They are also a nuisance to work with.=C2=A0 Recent comm=
it &quot;qapi: Start to<br>
&gt; &gt; &gt;&gt; elide redundant has_FOO in generated C&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Commit is referenced using &lt;commit hash 13 chars min&gt; =
(&quot;commit header&quot;)<br>
&gt; &gt;<br>
&gt; &gt; Apply my patches in your tree, and your hashes will differ from m=
ine.<br>
&gt; &gt; Hashes can serve as stable reference only when we git-fetch patch=
es, not<br>
&gt; &gt; when we git-send-email then.<br>
&gt; <br>
&gt; Has the referenced patch not been pushed upstream already? I thought<b=
r>
&gt; it was and hence was asking for the reference.<br>
<br>
Err, it is just a few patches earlier in this very series you&#39;re<br>
looking at.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Hmm o=
k. It=E2=80=99s missing from my inbox. Probably was not CC=E2=80=99d to me.=
=C2=A0</div></div></div>

--000000000000b26ba305e8c76228--

