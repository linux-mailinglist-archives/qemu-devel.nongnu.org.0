Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C4640237F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 08:36:00 +0200 (CEST)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNUi6-0006Xp-LO
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 02:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNUgm-0005mG-Sj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:34:36 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mNUgk-000681-LF
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:34:36 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bt14so17614364ejb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 23:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uD2MymKzJfVZHE8kSNl+t/p3i415bCJNPB57jYrtovs=;
 b=d7UerIzaxFnfoaAUahSThWJK/22fEAG3Cc18Twat9lyxy6LZgst6Z4i9TF3ALSlvWr
 tTkL7XHynnms8jpQUyyp34fICee2wZZLjxnIw7NMfJc3JLz2EptwOHbrKEXONSPN5sxB
 XoHbBHqEWkqco/5PvS2h59qMzMxyaWJS36NaigLkrlDDcG8zt95+tCjGYaWav9g4wCy3
 +tyfaVOR6U3ImeFAJVSUtveuxKSbdWN6LuL9eWu/n4cTFVQbakaeToZv9t4bROdSSixl
 QbO1K5amN6pIt1pyI0ZqO4PeIWPByKZiIoDPvU/avByYwLxmnpeqaImCYZ1XQe+uwEbP
 Q+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uD2MymKzJfVZHE8kSNl+t/p3i415bCJNPB57jYrtovs=;
 b=LEtExMenPljF0fIqj9CZPxgaAsbw9099bwn4m57+pTnXAtHvmd77tBEytkT8Mx+c0W
 9zcb93hRT94Qd3VPqsc07X5567HNffzcptC1ANJdqrRanae0Z9yIp0r5h4G+fUlrnIYR
 XBDX7y7JlPRgehkROuYAlM4dYTUcjJA/0mXPtMxZsqXyGilN349gpGYzyrkd5udYEigG
 zVbIz4iCiC64ABaLyL7waJEHFARcuAFXCL4Qvq7bnj0Ivvx7/YzkLciBZwYhoYE/zZcs
 EnH2paXqvibmxHbwxPM2X8cJdiQvb2u1O5ZehUzQiU+tDz8OxKDDIK6/Y90LlduNUGE2
 NCPQ==
X-Gm-Message-State: AOAM530SXk9t4gV/PIlT4sQlMU14QpZ9jIFER0nMxfDqY07hxM7nX+P7
 PCM56AMNB2XfjtPZCR5QxMVip2e3jv2aV8X7DObqtg==
X-Google-Smtp-Source: ABdhPJwLJNnsKjzIxxDMhiWcuhP1HUsDi2F/9Mn4aa5WJbqJJvzTy+ckrWq9suosp4aLv0tS4QB53sX2b9sUfDLnz0I=
X-Received: by 2002:a17:906:7847:: with SMTP id
 p7mr16900887ejm.335.1630996473134; 
 Mon, 06 Sep 2021 23:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
 <alpine.DEB.2.22.394.2109061531570.2070064@anisinha-lenovo>
 <43ea19c8-fdd6-554d-5138-79b8995d22cd@redhat.com>
 <CAARzgwzkMPwgwbbSnHGH5yLF=mbr7_z1zpKTjbVkg6rgpX4MfA@mail.gmail.com>
 <CAARzgwxXCJ_a4Z-x0Bc_4PV_pEScxr2fp0cMxRf49BiZUvQ9dA@mail.gmail.com>
 <81639a95-654b-9064-de24-347561b6783e@redhat.com>
In-Reply-To: <81639a95-654b-9064-de24-347561b6783e@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 7 Sep 2021 12:04:22 +0530
Message-ID: <CAARzgwxkYk=ZMB_XqF1P1zhnFB+Tdjj=yNrPG4=MqBU=PJEF0A@mail.gmail.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006952aa05cb61f586"
Received-SPF: none client-ip=2a00:1450:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006952aa05cb61f586
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 7, 2021 at 11:44 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 9/7/21 7:55 AM, Ani Sinha wrote:
> > On Mon, Sep 6, 2021 at 4:19 PM Ani Sinha <ani@anisinha.ca> wrote:
> >>
> >> On Mon, Sep 6, 2021 at 3:54 PM Philippe Mathieu-Daud=C3=A9 <
> philmd@redhat.com> wrote:
> >>>
> >>> On 9/6/21 12:03 PM, Ani Sinha wrote:
> >>>> On Mon, 6 Sep 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>>> On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
> >>>>>> From: Ani Sinha <ani@anisinha.ca>
> >>>>>>
> >>>>>> Currently various acpi hotplug modules like cpu hotplug, memory
> hotplug, pci
> >>>>>> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is
> turned on.
> >>>>>> This brings in support for whole lot of subsystems that some
> targets like
> >>>>>> mips does not need. They are added just to satisfy symbol
> dependencies. This
> >>>>>> is ugly and should be avoided. Targets should be able to pull in
> just what they
> >>>>>> need and no more. For example, mips only needs support for PIIX4
> and does not
> >>>>>> need acpi pci hotplug support or cpu hotplug support or memory
> hotplug support
> >>>>>> etc. This change is an effort to clean this up.
> >>>>>> In this change, new config variables are added for various acpi
> hotplug
> >>>>>> subsystems. Targets like mips can only enable PIIX4 support and no=
t
> the rest
> >>>>>> of all the other modules which were being previously pulled in as =
a
> part of
> >>>>>> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4
> needs but
> >>>>>> are not required by mips (for example, symbols specific to pci
> hotplug etc)
> >>>>>> are available to satisfy the dependencies.
> >>>>>>
> >>>>>> Currently, this change only addresses issues with mips malta
> targets. In future
> >>>>>> we might be able to clean up other targets which are similarly
> pulling in lot
> >>>>>> of unnecessary hotplug modules by enabling ACPI_X86.
> >>>>>>
> >>>>>> This change should also address issues such as the following:
> >>>>>> https://gitlab.com/qemu-project/qemu/-/issues/221
> >>>>>> https://gitlab.com/qemu-project/qemu/-/issues/193
> >>>>>
> >>>>> FYI per
> https://docs.gitlab.com/ee/administration/issue_closing_pattern.html
> >>>>> this should have been:
> >>>>>
> >>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
> >>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221
> >>>>>
> >>>>
> >>>> Ah my apologies. Will do this next time.
> >>>>
> >>>>> Can we close these issues manually?
> >>>>
> >>>> Since both you and I have verified that those issues gets fixed with
> my
> >>>> change, yes we can close them. I do not have a gitlab account. Shoul=
d
> I
> >>>> have one? Is there special permissions needed to handle these ticket=
s?
> >>>
> >>> Since you are listed in the MAINTAINERS file, long-term you'll
> >>> eventually use it anyway (i.e. to run the CI pipelines before sending
> >>> patches, to subscribe to the 'ACPI' label to get notifications or
> >>> comment ACPI-related issues).
> >>>
> >>> The process is quite straight-forward, once having an account you
> >>> simply request to be member of the project via the WebUI then you
> >>> can help triaging the issues (and closing these two).
> >>
> >> Hmm. I created an account and added a comment to the tickets. However
> >> I am unable to close them. I requested access to the project.
> >
> > I could be wrong, but I think only reporters can open and close bugs
> > like yourself on gitlab.
>
> Hmm it is unclear who can close an issue, per:
>
> https://docs.gitlab.com/ee/user/permissions.html#project-members-permissi=
ons
>
> Let's wait until you get added to the project as a member: I assume
> you are currently 'guest' and would become 'reporter'.


Ok will ping people on IRC today. Btw the gitlab issue list is a goldmine
for people like me to work on my spare time :-)


>
>

--0000000000006952aa05cb61f586
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 7, 2021 at 11:44 AM Philippe Mathieu-Daud=C3=A9=
 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-lef=
t-color:rgb(204,204,204)">On 9/7/21 7:55 AM, Ani Sinha wrote:<br>
&gt; On Mon, Sep 6, 2021 at 4:19 PM Ani Sinha &lt;<a href=3D"mailto:ani@ani=
sinha.ca" target=3D"_blank">ani@anisinha.ca</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Sep 6, 2021 at 3:54 PM Philippe Mathieu-Daud=C3=A9 &lt;<a =
href=3D"mailto:philmd@redhat.com" target=3D"_blank">philmd@redhat.com</a>&g=
t; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 9/6/21 12:03 PM, Ani Sinha wrote:<br>
&gt;&gt;&gt;&gt; On Mon, 6 Sep 2021, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt;&gt;&gt;&gt; On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; From: Ani Sinha &lt;<a href=3D"mailto:ani@anisinha=
.ca" target=3D"_blank">ani@anisinha.ca</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Currently various acpi hotplug modules like cpu ho=
tplug, memory hotplug, pci<br>
&gt;&gt;&gt;&gt;&gt;&gt; hotplug, nvdimm hotplug are all pulled in when CON=
FIG_ACPI_X86 is turned on.<br>
&gt;&gt;&gt;&gt;&gt;&gt; This brings in support for whole lot of subsystems=
 that some targets like<br>
&gt;&gt;&gt;&gt;&gt;&gt; mips does not need. They are added just to satisfy=
 symbol dependencies. This<br>
&gt;&gt;&gt;&gt;&gt;&gt; is ugly and should be avoided. Targets should be a=
ble to pull in just what they<br>
&gt;&gt;&gt;&gt;&gt;&gt; need and no more. For example, mips only needs sup=
port for PIIX4 and does not<br>
&gt;&gt;&gt;&gt;&gt;&gt; need acpi pci hotplug support or cpu hotplug suppo=
rt or memory hotplug support<br>
&gt;&gt;&gt;&gt;&gt;&gt; etc. This change is an effort to clean this up.<br=
>
&gt;&gt;&gt;&gt;&gt;&gt; In this change, new config variables are added for=
 various acpi hotplug<br>
&gt;&gt;&gt;&gt;&gt;&gt; subsystems. Targets like mips can only enable PIIX=
4 support and not the rest<br>
&gt;&gt;&gt;&gt;&gt;&gt; of all the other modules which were being previous=
ly pulled in as a part of<br>
&gt;&gt;&gt;&gt;&gt;&gt; CONFIG_ACPI_X86. Function stubs make sure that sym=
bols which piix4 needs but<br>
&gt;&gt;&gt;&gt;&gt;&gt; are not required by mips (for example, symbols spe=
cific to pci hotplug etc)<br>
&gt;&gt;&gt;&gt;&gt;&gt; are available to satisfy the dependencies.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Currently, this change only addresses issues with =
mips malta targets. In future<br>
&gt;&gt;&gt;&gt;&gt;&gt; we might be able to clean up other targets which a=
re similarly pulling in lot<br>
&gt;&gt;&gt;&gt;&gt;&gt; of unnecessary hotplug modules by enabling ACPI_X8=
6.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; This change should also address issues such as the=
 following:<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/=
issues/221" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-pr=
oject/qemu/-/issues/221</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/=
issues/193" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-pr=
oject/qemu/-/issues/193</a><br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; FYI per <a href=3D"https://docs.gitlab.com/ee/administ=
ration/issue_closing_pattern.html" rel=3D"noreferrer" target=3D"_blank">htt=
ps://docs.gitlab.com/ee/administration/issue_closing_pattern.html</a><br>
&gt;&gt;&gt;&gt;&gt; this should have been:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/q=
emu/-/issues/193" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/q=
emu-project/qemu/-/issues/193</a><br>
&gt;&gt;&gt;&gt;&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/q=
emu/-/issues/221" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/q=
emu-project/qemu/-/issues/221</a><br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Ah my apologies. Will do this next time.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Can we close these issues manually?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Since both you and I have verified that those issues gets =
fixed with my<br>
&gt;&gt;&gt;&gt; change, yes we can close them. I do not have a gitlab acco=
unt. Should I<br>
&gt;&gt;&gt;&gt; have one? Is there special permissions needed to handle th=
ese tickets?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Since you are listed in the MAINTAINERS file, long-term you&#3=
9;ll<br>
&gt;&gt;&gt; eventually use it anyway (i.e. to run the CI pipelines before =
sending<br>
&gt;&gt;&gt; patches, to subscribe to the &#39;ACPI&#39; label to get notif=
ications or<br>
&gt;&gt;&gt; comment ACPI-related issues).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The process is quite straight-forward, once having an account =
you<br>
&gt;&gt;&gt; simply request to be member of the project via the WebUI then =
you<br>
&gt;&gt;&gt; can help triaging the issues (and closing these two).<br>
&gt;&gt;<br>
&gt;&gt; Hmm. I created an account and added a comment to the tickets. Howe=
ver<br>
&gt;&gt; I am unable to close them. I requested access to the project.<br>
&gt; <br>
&gt; I could be wrong, but I think only reporters can open and close bugs<b=
r>
&gt; like yourself on gitlab.<br>
<br>
Hmm it is unclear who can close an issue, per:<br>
<a href=3D"https://docs.gitlab.com/ee/user/permissions.html#project-members=
-permissions" rel=3D"noreferrer" target=3D"_blank">https://docs.gitlab.com/=
ee/user/permissions.html#project-members-permissions</a><br>
<br>
Let&#39;s wait until you get added to the project as a member: I assume<br>
you are currently &#39;guest&#39; and would become &#39;reporter&#39;.</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok will ping people o=
n IRC today. Btw the gitlab issue list is a goldmine for people like me to =
work on my spare time :-)</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;b=
order-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"=
 dir=3D"auto"><br>
<br>
</blockquote></div></div>

--0000000000006952aa05cb61f586--

