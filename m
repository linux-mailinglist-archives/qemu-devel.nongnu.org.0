Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08DE5B8E33
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:31:40 +0200 (CEST)
Received: from localhost ([::1]:55178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYWEd-0005cR-G2
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1oYVs1-0002Q1-8X
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 13:08:18 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1oYVry-0005UA-Na
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 13:08:16 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11e9a7135easo42746393fac.6
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 10:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=isZMHzU0bHDkNxTW14Pc2vLoOifI6Afwel6GN1nuBRw=;
 b=GaQqmcmTbkykrJ79JdUjVXSOrNaNuj3iqaI9JsBRLDNuK+qRj5uLM/F/YinP5pFlOn
 M3rizjOj3tEN7OStIEAvUF2zLN0oKO4GmkCtM7xh922svpI0F5bVV0xAFYJbCSv+9Q6E
 CnDIqd1KdfJYcA0nlqBzx3I4VnOrVE3NFrc3kI9iFGCj9j0TguuhVscs4c2t9qKkBs20
 WF8ANlqmtc45ewWkAmroSVMhVhhTV0j9DbNtW7hC430XuLwpGp6KFI2XxORl39Vy24BO
 RJkg4y4EThi4vNLjpTrezMjKaVHF3rAqI3L+3p/ytYuK7YzA518Jul0ZLAEHZUoygii+
 l2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=isZMHzU0bHDkNxTW14Pc2vLoOifI6Afwel6GN1nuBRw=;
 b=xPiMP4YfYzrAiRmebmGdEc25DPty5clsU8BpfGc0gZljVO4HUqjRe3BC+ifCn2wATX
 nsCtUvqd4CInDinPYdPXDo+u/yIcCLZ0+SZVRFlM+Ut8RyTFqDGOTiPLds5VpjJcZyX9
 9juj8FqTBh5p3qXk4l74DyS0vara6YxkXP00RrDF6xLcaAr1biXwCqG8tYjkuAJrrpqw
 KpZhiNwUTWcvoPtVJJVHpryS5fO1i/1rJH8Q5Eye4s+unLWKXXyLx6hXOgvcF0lvV6DG
 8eZuzD4/APz9Z9TbuPMH+Wial8nmU9RigXamx0fm9AmSYfXKyPKIt1wdH337FZ46a2Lq
 6TNQ==
X-Gm-Message-State: ACgBeo3njPNNmMDtHonyQGhAl9DbAjCJ6Mw+V/6HsQbe5Yk6fFmQh5p5
 GsgAoSOJC4rLYzRoB8p25b30bP5X+FjKsz2JIEc=
X-Google-Smtp-Source: AA6agR7EuzHUv+lFeHtqnVLPmbo7/riSWtcPyt54/GjiyNEh2CaPDQohcaTrOiDKd05k3UgsyvsIuKIvloAnnKKQzho=
X-Received: by 2002:a05:6870:8308:b0:12b:239:8cf9 with SMTP id
 p8-20020a056870830800b0012b02398cf9mr2898409oae.43.1663175293012; Wed, 14 Sep
 2022 10:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
 <CABLmASG_0fXRxDfJpcRtir95aRRLX-9KwvYFUdhy9O6eTQYEaQ@mail.gmail.com>
In-Reply-To: <CABLmASG_0fXRxDfJpcRtir95aRRLX-9KwvYFUdhy9O6eTQYEaQ@mail.gmail.com>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 14 Sep 2022 19:08:02 +0200
Message-ID: <CABLmASFSR1F_vUxwscOqwi563vn96rY1aXQv5idrh4=fZkCG9g@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/m68k: fix two writes to %sr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="0000000000008a155005e8a62c15"
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008a155005e8a62c15
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 14, 2022 at 6:48 PM Howard Spoelstra <hsp.cat7@gmail.com> wrote:

>
>
> On Tue, Sep 13, 2022 at 6:29 PM Mark Cave-Ayland <
> mark.cave-ayland@ilande.co.uk> wrote:
>
>> On 13/09/2022 15:28, Richard Henderson wrote:
>>
>> > The second was described by Mark in the lobby of KVM Forum.
>> > The first was found by inspection of other uses of gen_helper_set_sr.
>> >
>> > r~
>> >
>> > Richard Henderson (2):
>> >    target/m68k: Fix MACSR to CCR
>> >    target/m68k: Perform writback before modifying SR
>> >
>> >   target/m68k/translate.c | 14 +++++++++-----
>> >   1 file changed, 9 insertions(+), 5 deletions(-)
>>
>> I've applied these on top of my MacOS virtual memory branch at
>> https://github.com/mcayland/qemu/commits/q800.upstream2-vm and I can
>> confirm that
>> MacOS 8.1 now boots here with virtual memory enabled :)
>>
>> Possibly it might be worth including a tidied-up version of the "WIP:
>> target/m68k:
>> always exit_tb when changing sr with andi/ori/eori" commit from that
>> branch which is
>> also related to switching between supervisor and user modes under MacOS.
>> Shall I tidy
>> it up and send it to the list?
>>
>>
>> ATB,
>>
>> Mark.
>>
>>
> I've compiled the branch mentioned above with a fully updated MSYS2 on
> windows. The executable hangs when running Mac OS 8 with Virtual Memory
> enabled. On a fast machine I see Error 7 as before, on a slower machine,
> the boot screen just hangs with no error shown. A Linux build does work,
> also on the slower machine.
>
> Best,
> Howard
>

ps: a debug enabled non-stripped build will run with Virtual Memory enabled
on Windows.

--0000000000008a155005e8a62c15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 14, 2022 at 6:48 PM Howar=
d Spoelstra &lt;<a href=3D"mailto:hsp.cat7@gmail.com">hsp.cat7@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 13, 2022 at 6:29 PM Mark Cav=
e-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk" target=3D"_bl=
ank">mark.cave-ayland@ilande.co.uk</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 13/09/2022 15:28, Richard Henderson wr=
ote:<br>
<br>
&gt; The second was described by Mark in the lobby of KVM Forum.<br>
&gt; The first was found by inspection of other uses of gen_helper_set_sr.<=
br>
&gt; <br>
&gt; r~<br>
&gt; <br>
&gt; Richard Henderson (2):<br>
&gt;=C2=A0 =C2=A0 target/m68k: Fix MACSR to CCR<br>
&gt;=C2=A0 =C2=A0 target/m68k: Perform writback before modifying SR<br>
&gt; <br>
&gt;=C2=A0 =C2=A0target/m68k/translate.c | 14 +++++++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 9 insertions(+), 5 deletions(-)<br>
<br>
I&#39;ve applied these on top of my MacOS virtual memory branch at <br>
<a href=3D"https://github.com/mcayland/qemu/commits/q800.upstream2-vm" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/mcayland/qemu/commits/=
q800.upstream2-vm</a> and I can confirm that <br>
MacOS 8.1 now boots here with virtual memory enabled :)<br>
<br>
Possibly it might be worth including a tidied-up version of the &quot;WIP: =
target/m68k: <br>
always exit_tb when changing sr with andi/ori/eori&quot; commit from that b=
ranch which is <br>
also related to switching between supervisor and user modes under MacOS. Sh=
all I tidy <br>
it up and send it to the list?<br>
<br>
<br>
ATB,<br>
<br>
Mark.<br>
<br></blockquote><div><br></div><div>I&#39;ve compiled the branch mentioned=
 above with a fully updated MSYS2 on windows. The executable hangs when run=
ning Mac OS 8 with Virtual Memory enabled. On a fast machine I see Error 7 =
as before, on a slower machine, the boot screen just hangs with no error sh=
own. A Linux build does work, also on the slower machine.<br></div><div><br=
></div><div>Best,</div><div>Howard <br></div></div></div></blockquote><div>=
<br></div><div>ps: a debug enabled non-stripped build will run with Virtual=
 Memory enabled on Windows. <br></div></div></div>

--0000000000008a155005e8a62c15--

