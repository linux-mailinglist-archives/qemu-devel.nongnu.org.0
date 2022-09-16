Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30425BA98B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Sep 2022 11:38:52 +0200 (CEST)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZ7oB-0004Dq-D0
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 05:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ7iO-00017i-FW
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:32:52 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oZ7iM-0001D3-EG
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 05:32:52 -0400
Received: by mail-ej1-x630.google.com with SMTP id go34so48118366ejc.2
 for <qemu-devel@nongnu.org>; Fri, 16 Sep 2022 02:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=j+seZhNxUchyTfIfDq9mopu2KOkdZjZOZXBz06YX3Ag=;
 b=zzgaalBs1LR2cQ61lbAw932Lhb+XKirzOC8eeidtE5HqlfM0+rsKPbCLssGXXyaIZx
 PqI99FUuk/hjS68tfgdU6myRg8tVfDVgRxe49oTkAfCgVYbVAYAyTlvnbyy4TiIpStak
 REk+uQnKtUqgdhWjVAENkbjvLjHZmNzsfF9dnmCOskAcP49zJ1x1ykgAR+g7lPqRxVHj
 sI35gt5bAMN8CRIyesszKE6xlHbS9Au4pPCVnP2W5nIo91hYIoDsf235Bliki9TYpVCb
 oofep1M9XnVyjDDjxDqGtN/v1LHcdugJoO9Zr6YSeszuUVEBrzIfqT1ci6nRmY2y4yfr
 8zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=j+seZhNxUchyTfIfDq9mopu2KOkdZjZOZXBz06YX3Ag=;
 b=cN7koCsn22wtQp7EU7Ch7p+rWLVCMIbyntiaLjXDZpDsqg7paxBDp+PP7wUpjBzUSW
 PhauyTBfl2tbP6I5ITOATp92iQdWll/oRT0EqdLDbrxAU3J2SXFxo3Z5WUspbqqpCQhD
 PjmHxO6GJnajB/m3HRYmru2GNw3vR/1TYrm3g5/sdtF9cmD6D1CICZ6BZrnViucxfblO
 bp11kcsuDPe8neo75rxrjFpScqKOuNo46+Rzp35sOrnR5/+2B+4KzxUVuKDnU73QBZ7q
 7sEB4vaRyrOz0ZL/Q1DxGC/niBFYHq/DVXrd/jJ65pgFvO94t87hSnrJYPKdf8+wfu/M
 1mCw==
X-Gm-Message-State: ACrzQf3kfZzvYUkh1sHzg6q3HEsZuBu7NTZccAp3MU9KyQ1Itdy+u9Yv
 erPgIzBJrGSb6j+mTIc/f9uden4nMwfRJuWQ78j75Q==
X-Google-Smtp-Source: AMsMyM6GUtitv3VgNoQeQN16537153BhP1vbfOo0z8H25I4A9DNfYJfXPGh1Rv0XeCRecX/m5C0gCq001IU4Rz9zQjE=
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id
 fj2-20020a1709069c8200b006e12c941616mr3018381ejc.64.1663320767556; Fri, 16
 Sep 2022 02:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220915204317.3766007-1-armbru@redhat.com>
 <20220915204317.3766007-7-armbru@redhat.com>
 <CAARzgwyZK9EuKKj0UpUxC8BYEUBDwRYG==eTfndgNmKOE_FgKA@mail.gmail.com>
 <87illnenpv.fsf@pond.sub.org>
 <CAARzgwx8x0kW4tknikPzscm59cCDBRw_+z__tm_Rb=1EmYF=kQ@mail.gmail.com>
 <YyQ147txe78shJnc@redhat.com>
 <CAARzgwyTKe=bV0ScO1VP6yx9-Th0vd4ML5oFDuYOsVqq+VnRag@mail.gmail.com>
In-Reply-To: <CAARzgwyTKe=bV0ScO1VP6yx9-Th0vd4ML5oFDuYOsVqq+VnRag@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 16 Sep 2022 15:02:36 +0530
Message-ID: <CAARzgww3zcA7in-UbL65vDttnE5R-2QyW_i1U=FZ2yn=Pp+szA@mail.gmail.com>
Subject: Re: [PATCH 06/27] qapi acpi: Elide redundant has_FOO in generated C
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, eblake@redhat.com, jsnow@redhat.com,
 michael.roth@amd.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000007f97d305e8c80b91"
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x630.google.com
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

--0000000000007f97d305e8c80b91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 14:15 Ani Sinha <ani@anisinha.ca> wrote:

>
>
> On Fri, Sep 16, 2022 at 14:08 Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
> wrote:
>
>> On Fri, Sep 16, 2022 at 01:51:14PM +0530, Ani Sinha wrote:
>> > On Fri, Sep 16, 2022 at 1:48 PM Markus Armbruster <armbru@redhat.com>
>> wrote:
>> > >
>> > > Ani Sinha <ani@anisinha.ca> writes:
>> > >
>> > > > On Fri, Sep 16, 2022 at 2:13 AM Markus Armbruster <
>> armbru@redhat.com> wrote:
>> > > >>
>> > > >> The has_FOO for pointer-valued FOO are redundant, except for
>> arrays.
>> > > >> They are also a nuisance to work with.  Recent commit "qapi: Star=
t
>> to
>> > > >> elide redundant has_FOO in generated C"
>> > > >
>> > > > Commit is referenced using <commit hash 13 chars min> ("commit
>> header")
>> > >
>> > > Apply my patches in your tree, and your hashes will differ from mine=
.
>> > > Hashes can serve as stable reference only when we git-fetch patches,
>> not
>> > > when we git-send-email then.
>> >
>> > Has the referenced patch not been pushed upstream already? I thought
>> > it was and hence was asking for the reference.
>>
>> Err, it is just a few patches earlier in this very series you're
>> looking at.
>
>
> Hmm ok. It=E2=80=99s missing from my inbox. Probably was not CC=E2=80=99d=
 to me.
>

Indeed.
https://lore.kernel.org/all/20220915204317.3766007-5-armbru@redhat.com/

>

--0000000000007f97d305e8c80b91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 16, 2022 at 14:15 Ani Sinha &lt;<a href=3D"mail=
to:ani@anisinha.ca">ani@anisinha.ca</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)=
"><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 16, 2022 at 14:08 Daniel P. Berrang=C3=A9 &lt;<=
a href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-lef=
t:1ex;border-left-color:rgb(204,204,204)">On Fri, Sep 16, 2022 at 01:51:14P=
M +0530, Ani Sinha wrote:<br>
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
=C2=A0</div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">Indeed.=C2=A0<div><a href=3D"https://lore.kernel.org/all/20220915=
204317.3766007-5-armbru@redhat.com/">https://lore.kernel.org/all/2022091520=
4317.3766007-5-armbru@redhat.com/</a></div></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div><div=
 class=3D"gmail_quote"><div dir=3D"auto"></div></div></div>
</blockquote></div></div>

--0000000000007f97d305e8c80b91--

