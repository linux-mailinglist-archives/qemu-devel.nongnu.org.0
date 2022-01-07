Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6473B48745A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 09:58:06 +0100 (CET)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5l4X-0004Ja-HQ
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 03:58:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n5l3Z-0002uG-2c
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:57:05 -0500
Received: from [2607:f8b0:4864:20::d34] (port=34492
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n5l3X-0007Pb-EE
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 03:57:04 -0500
Received: by mail-io1-xd34.google.com with SMTP id e128so6320244iof.1
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 00:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mityUOsj7Da/4FCmnX4F4YtZwNwZJH8/aBkpjY9qGYg=;
 b=Ec17GInKW27tau8wjHOZN9YU1kTjPZv50NZAfDrU3sNKXjAN89eq04ZMopD2nBCYPI
 z8V76OAmmZTVX8SIBhGvSaQiopyZ9cC391SgT1uP1K5o0r2V0qxtE/khPZZW1fEXzsC+
 P4x4KvbWAL+Bopd8Fz+cDUBNQBgf6uLv8BfX7w+pnfj0tW3Wwy1C/G53zPAZ9M3mJxJH
 SNN7CWMgdf0F+8p4k9RPkUsY1F0JIscOZ6eTEa+BO054tdoRWQDLntabfuRnCVA+Md8j
 JSCgnYjhjCwS5hpwkI8N77PfD9nd4q5j24fjrQVliPyzuMwweN8vFCOhLMzRnxZP3ZdT
 gyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mityUOsj7Da/4FCmnX4F4YtZwNwZJH8/aBkpjY9qGYg=;
 b=FviD+w/fcF4djhDWYODuAdNDbrT34JnPVPHuolG+S8Yjjw8afP0MYDislYiFKXAEte
 gIkpG4/FvmfuPvlLd8wzFN+S0ThlM8Qn6Taym6dpeeo4yZtJPP8coFe6Ug2/m7WAqcdM
 grWYblQFjJD+lUfpaNDeMPa3/OdW8TQKsHChObyfJShAvLBemkmPBbhZYJufMre2RA0H
 YxjekvCvC46PVvh49JJpo8/vzAXcLGU0MGNjp7QPvthvXd62SHNdtM5TLzy35HWx46D2
 NXA5jSd4+EB8MLY/ADtWnvkE/BnAuelooOJjpl07inyv1xZXu4x/fkIG4ZMo6zHvLqEi
 AqnQ==
X-Gm-Message-State: AOAM532uRn+04ghGLEEnhosVi91T0l2EvqoPt8lR0gnoLs0OgtNdZPts
 0GdO8vlGoB1f9Kr0rmporDFm6Bq5mIPbOYqsrPI=
X-Google-Smtp-Source: ABdhPJy620jJrTrRLj25su0+KlPN6gF9yIMRVKi0TT6eeg3pNXgiQr4Qmc7Aj2PU703wtMmIB+OWcoi9Fb4FBZUH3nU=
X-Received: by 2002:a02:cb0b:: with SMTP id j11mr27342744jap.190.1641545822037; 
 Fri, 07 Jan 2022 00:57:02 -0800 (PST)
MIME-Version: 1.0
References: <CADV2EAtTPjHP=H7AMAdva7UjydjM5DwK=NDAm3HYM-MHeD9wyg@mail.gmail.com>
 <49a5b6c6-8618-a9fc-2cec-ef60b8b59d62@linaro.org>
 <CADV2EAvZ_=AJbQNr4vnFFY5W9HmZjDw8kVm3ubaQ=mvsG37=Vw@mail.gmail.com>
 <5bfc479e-5929-20eb-2e94-8e0818c7f6fd@linaro.org>
In-Reply-To: <5bfc479e-5929-20eb-2e94-8e0818c7f6fd@linaro.org>
From: Stevie Lavern <stevie.lavern@gmail.com>
Date: Fri, 7 Jan 2022 09:56:50 +0100
Message-ID: <CADV2EAs4NdPQkXYf2PPhMO+_DEX1qJnENLEdAT2fxir=5=u4dQ@mail.gmail.com>
Subject: Re: Rational behind partial AVX support in Qemu
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000009ae9c405d4fa2b84"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=stevie.lavern@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009ae9c405d4fa2b84
Content-Type: text/plain; charset="UTF-8"

Indeed, my bad, i was thinking about the "trivial patch" submission process.

For reference, the submitted patch can be found here
https://lists.nongnu.org/archive/html/qemu-devel/2022-01/msg00822.html

Thanks,
Stevie

On Thu, Jan 6, 2022 at 5:29 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 1/6/22 1:14 AM, Stevie Lavern wrote:
> > Do you think it qualifies as "trivial patch" or should i go on with the
> full patch
> > submission process?
>
> There is no "short" patch submission process.
>
>
> r~
>

--0000000000009ae9c405d4fa2b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Indeed, my bad, i was thinking about the &quot;trivial pat=
ch&quot; submission process.<div><br></div><div>For reference, the submitte=
d patch can be found here=C2=A0<a href=3D"https://lists.nongnu.org/archive/=
html/qemu-devel/2022-01/msg00822.html">https://lists.nongnu.org/archive/htm=
l/qemu-devel/2022-01/msg00822.html</a></div><div><br></div><div>Thanks,</di=
v><div>Stevie</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Thu, Jan 6, 2022 at 5:29 PM Richard Henderson &lt;<a =
href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 1/6/22 1:14 AM, Stevie Lavern wrote:<br>
&gt; Do you think it qualifies as &quot;trivial patch&quot; or should i go =
on with the full patch <br>
&gt; submission process?<br>
<br>
There is no &quot;short&quot; patch submission process.<br>
<br>
<br>
r~<br>
</blockquote></div>

--0000000000009ae9c405d4fa2b84--

