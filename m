Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D1056ACC5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 22:32:32 +0200 (CEST)
Received: from localhost ([::1]:47882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9YAo-0005LW-Lz
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 16:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Y8d-0003ns-R0
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 16:30:15 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o9Y8c-0002dD-4J
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 16:30:15 -0400
Received: by mail-yb1-xb35.google.com with SMTP id n74so4860022yba.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 13:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I+jfIWQC8REXp1K/R3jQP2uPdBIeEhCSbE5RAr2pvSY=;
 b=e+rYTEn1XsqRTKfV79JFRQoltditI02Yu8P6qqlxJm8Bt87bCzZ6X9Jg1FBpCim6Lt
 Fe/M/0OuGrm7Qm09ZD5fDbVy5FycX7OBgTQFUjz1JvVFaUsLdKlyeT8qi3THmIArLzJD
 pPUvL54PhJOJJCRWCG4nb8PC+uc7Oj81N6CGDc1LfR2lQpEKfNfX4xlN0kAwlbrBv9OH
 S7WcHZeu7wz8U/IltT7z7hFI4l/YEgxWxyqlkXb5AAblpsr56ZWlsg2ftv/0NH6RYlB6
 EShv+Xh3Hzlb5WrpNF0yvV1shXm9WmpuXdFG40e4J8ASgj50XTK2CSBwKD0caQgrtqCv
 77ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I+jfIWQC8REXp1K/R3jQP2uPdBIeEhCSbE5RAr2pvSY=;
 b=Ns2Jw6iNjH/Vd+nzpr2tbNSnOPCA1WlG1YbeJWTHos0iUPXD1/i95kJiS3UbgQRVCS
 5kDKDxXc1/N1qcNhE6EI4aAg2rT/YOOczG4+3mdJt1VwlGWe1WZqdqh/pixeXfpLJ/P4
 6xXvkv+kdUVLndwhvIzlb+kpYweFjQEp+v3qJNX9gfobfTRGSuZJHvU8uSkVD0VKLBjv
 v3kgszbpepm1wxl3CTq+UxDBHyNZKw7zG3+0tDf9SzLktXEN42r8enSJ6NSMAs4olm19
 TPKZxlmefVdK3nujo2ZacDErGPqUMFyVSw7971ZEa+B9if/qQWcUG43X4/RsINR/q+84
 4UAw==
X-Gm-Message-State: AJIora+qkSMLY1sYfq5qqm8amAlmZxyQMoOFB0Bju7oD0j9UAKCkUpp2
 nfhDK4/Et4NFgwpExnbY+mhwk80rfQXhVwuMm8Tgeg==
X-Google-Smtp-Source: AGRyM1v5ogi3DViEm86pR0yjdTlyhVSyJxJXA3ur/XLYhVPvHopshc8wcjcKBNW+oTM7uOOYYgrjncabXZ0QyG6CLbE=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr27260811ybu.479.1657225813007; Thu, 07
 Jul 2022 13:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <CY1PR03MB213764AFCA6F51DC5558C1AEB3839@CY1PR03MB2137.namprd03.prod.outlook.com>
In-Reply-To: <CY1PR03MB213764AFCA6F51DC5558C1AEB3839@CY1PR03MB2137.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jul 2022 21:29:34 +0100
Message-ID: <CAFEAcA8s1MTvtSuX-xjqoxbz_c7_f-V97Ra6Qzy1QdMpfXTLAA@mail.gmail.com>
Subject: Re: Support for Gaisler multicore LEONx SoCs
To: Gregg Allison <Gregg.Allison@lasp.colorado.edu>
Cc: "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>, 
 Frederic Konrad <konrad.frederic@yahoo.fr>
Content-Type: multipart/alternative; boundary="000000000000e5b2a405e33cf3f5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--000000000000e5b2a405e33cf3f5
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Jul 2022 at 20:54, Gregg Allison <Gregg.Allison@lasp.colorado.edu>
wrote:

> We are considering the Gaisler GR712RC (2 core LEON3) and GR740 (4 core
> LEON4) SoCs for a new deep space mission.
>
> Does QEMU support these two multicore configurations at present? Is there
> an effort planned to provide multicore LEONx emulation?
>

I've cc'd the people listed in MAINTAINERS for Leon, but as far as I can
see there have been no Leon-related commits for a few years, so I don't
think this area of QEMU is being actively developed. We seem to have
currently LEON2 and LEON3 CPU support, and one machine type, the
"Leon-3 generic" machine.

thanks
-- PMM

--000000000000e5b2a405e33cf3f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace"><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 Jul 2022 at 20:54, Gregg =
Allison &lt;<a href=3D"mailto:Gregg.Allison@lasp.colorado.edu">Gregg.Alliso=
n@lasp.colorado.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_9049889610764523403WordSection1">
<p class=3D"MsoNormal">We are considering the Gaisler GR712RC (2 core LEON3=
) and GR740 (4 core LEON4) SoCs for a new deep space mission.<u></u><u></u>=
</p>
<p class=3D"MsoNormal">Does QEMU support these two multicore configurations=
 at present? Is there an effort planned to provide multicore LEONx emulatio=
n?<u></u><u></u></p>
</div></div></blockquote><div><br></div><div><div style=3D"font-family:mono=
space,monospace" class=3D"gmail_default">I&#39;ve cc&#39;d the people liste=
d in MAINTAINERS for Leon, but as far as I can</div><div style=3D"font-fami=
ly:monospace,monospace" class=3D"gmail_default">see there have been no Leon=
-related commits for a few years, so I don&#39;t</div><div style=3D"font-fa=
mily:monospace,monospace" class=3D"gmail_default">think this area of QEMU i=
s being actively developed. We seem to have</div><div style=3D"font-family:=
monospace,monospace" class=3D"gmail_default">currently LEON2 and LEON3 CPU =
support, and one machine type, the</div><div style=3D"font-family:monospace=
,monospace" class=3D"gmail_default">&quot;Leon-3 generic&quot; machine.</di=
v><div style=3D"font-family:monospace,monospace" class=3D"gmail_default"><b=
r></div><div style=3D"font-family:monospace,monospace" class=3D"gmail_defau=
lt">thanks<br></div><div style=3D"font-family:monospace,monospace" class=3D=
"gmail_default">-- PMM<br><br></div></div></div></div>

--000000000000e5b2a405e33cf3f5--

