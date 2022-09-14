Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B415B8E46
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:43:52 +0200 (CEST)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYWQQ-0004gg-Kz
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1oYVZJ-00038S-Ol
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:48:57 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:46640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1oYVZH-0002Gq-3G
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:48:56 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12b542cb1d3so32828840fac.13
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=e85MUpUw8podq87jNNFnycnnBoe6GgbH1eIQkFeuCsw=;
 b=V2FwHWWYWfK/EbBx7b3+S+igkqaOycfD1jB2vHH2kdzjh180uSPDu3rys5VILPcvX0
 GMlwfSRusRXf+BrbiRpmP0CyAnvwStOTxQvYuot5Sd0lMHzMQ9CJ+kzh8lhcBd1paqCk
 llXBeccv0dZ6tE5smf2zweBhDitCu9zlvqhIImLV4kiWGgvp1TCxNnO98v5gr5KH5nhI
 1RJz2bpncr+wxGBjWwAPTerhcWpoW65nTwh5/Qkwj+nKkVOLIXMcvH6rvg8jxWsa7cJE
 dDiEXx6MEIzYoMmm4fs+xYRvIo1kZ8tiEgRrzk8nAtR7sKsGPpM/9xqV0am/UVp59hIM
 lFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=e85MUpUw8podq87jNNFnycnnBoe6GgbH1eIQkFeuCsw=;
 b=54lhWYMxQwvwCjTDi7mT8f4K0DFBWSA1A236PiWk3kr8elmsJcOwNauhivGApiemyG
 zyQkgngHqfcLHpzLfSbWxO/FiNxvJyXbbtX9QD52mCmZYhtW5Z4P1YRVKF9OpaaoQvd5
 WlIIPksjAXNiJ7xiduKmLWpyLR36x1h60T/L6eSkx82GCPOyPs7fmX+uKUhwA9+VL+Wh
 w3BjzZA/Iea3SeSzoeHhdUEytW9UpoxZxO99AigX0kVpsPygNkUal0ro/uWqMg2bPWd2
 BVM02tVNKADG/IrU9viIQ82nDaF3gjrqzwKzdoejtF9yYdx2oxW69damXyrPwh+OgXvh
 GvQA==
X-Gm-Message-State: ACgBeo2EH8/Tnu07orMgmihfkQWMLTKo3yViF7Mh/CnN+GM9Zyl2m56n
 yWoBFiusxPIRN483mYl2RKrCUiRDKjh1DMlUvOI=
X-Google-Smtp-Source: AA6agR5G9yzyPxlhDvFc0OqBFNekk4ag1XO+56CjReFefXfBQC8lPcPbvXsweNtLRvDqdudZMe9CtJm/FyjSnxRnFdU=
X-Received: by 2002:a05:6870:8308:b0:12b:239:8cf9 with SMTP id
 p8-20020a056870830800b0012b02398cf9mr2849423oae.43.1663174132919; Wed, 14 Sep
 2022 09:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220913142818.7802-1-richard.henderson@linaro.org>
 <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
In-Reply-To: <5880ddb1-3a7c-139d-3833-9902b98caf01@ilande.co.uk>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 14 Sep 2022 18:48:42 +0200
Message-ID: <CABLmASG_0fXRxDfJpcRtir95aRRLX-9KwvYFUdhy9O6eTQYEaQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/m68k: fix two writes to %sr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000064737f05e8a5e7cd"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oa1-x2f.google.com
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

--00000000000064737f05e8a5e7cd
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 13, 2022 at 6:29 PM Mark Cave-Ayland <
mark.cave-ayland@ilande.co.uk> wrote:

> On 13/09/2022 15:28, Richard Henderson wrote:
>
> > The second was described by Mark in the lobby of KVM Forum.
> > The first was found by inspection of other uses of gen_helper_set_sr.
> >
> > r~
> >
> > Richard Henderson (2):
> >    target/m68k: Fix MACSR to CCR
> >    target/m68k: Perform writback before modifying SR
> >
> >   target/m68k/translate.c | 14 +++++++++-----
> >   1 file changed, 9 insertions(+), 5 deletions(-)
>
> I've applied these on top of my MacOS virtual memory branch at
> https://github.com/mcayland/qemu/commits/q800.upstream2-vm and I can
> confirm that
> MacOS 8.1 now boots here with virtual memory enabled :)
>
> Possibly it might be worth including a tidied-up version of the "WIP:
> target/m68k:
> always exit_tb when changing sr with andi/ori/eori" commit from that
> branch which is
> also related to switching between supervisor and user modes under MacOS.
> Shall I tidy
> it up and send it to the list?
>
>
> ATB,
>
> Mark.
>
>
I've compiled the branch mentioned above with a fully updated MSYS2 on
windows. The executable hangs when running Mac OS 8 with Virtual Memory
enabled. On a fast machine I see Error 7 as before, on a slower machine,
the boot screen just hangs with no error shown. A Linux build does work,
also on the slower machine.

Best,
Howard

--00000000000064737f05e8a5e7cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 13, 2022 at 6:29 PM Mark =
Cave-Ayland &lt;<a href=3D"mailto:mark.cave-ayland@ilande.co.uk">mark.cave-=
ayland@ilande.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 13/09/2022 15:28, Richard Henderson wrote:<br>
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
></div><div>Best,</div><div>Howard <br></div></div></div>

--00000000000064737f05e8a5e7cd--

