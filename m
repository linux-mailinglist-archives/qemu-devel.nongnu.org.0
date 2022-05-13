Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC252662C
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:32:40 +0200 (CEST)
Received: from localhost ([::1]:57852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXHT-0001Zp-6D
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1npXE2-0006VM-KU
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:29:07 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itaru.kitayama@gmail.com>)
 id 1npXE1-0005q9-1m
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:29:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id p4so10464650edx.0
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uba6LxvHIRSL/2m/H2Ojyiur/eFSlkPUbrEcsnqLsKQ=;
 b=Wqr/ZIh7k/NA4lYm+WojDMMWqr42aYjL3hGOuI9DNjkbJcvtoSctiGuxod6WbUShnl
 GU70ojV/Aw5U71N8RYUbBOeaLI4kHOod0iTw9+iL/QPcr81ncL8brpQB1rBgRx8UPuTx
 uhT+GrSo076GxMBgplUsLt/18GsltujlFM/c6dZGpOuokah+pz0MQWUqV5ZulTdTUc9e
 PIdi43aPpls4N9ljlzyN3EuTSS8BaLzjskCcM4NO5dN8Xb5/R1m4ap28H9Pr2+kKwPQf
 GUzYrTGTJInrEQhX5xVJ8c+sAwn9QglyKe6ZU45/exe5WHXWs55fUWJad6AqMkOxwTsF
 bTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uba6LxvHIRSL/2m/H2Ojyiur/eFSlkPUbrEcsnqLsKQ=;
 b=Ouj218h7RSrbBQz3jh9scUCFbLzjyS7RD96wByoqTOzg/dcO0b+v8nKiUEiI5uq5hR
 OaEKDH9Ag/vkd7o9FCNoCbG8//nPjjWPHzqNfHWz3vvWO/smJ19A/t9jGj43DoOAkJBk
 U7DWTVJ/e9KA9WSBXAeF2x+yzdxWY1Bs467dkDunxiRAAsVJCv8IUJj4wi1R/qwVND7d
 xKwUzD0iRe2TBdPhPSimXyoPHRd2PhHKG2thtWrcYRq6srXtxPCarOs04VH2wm8JjRSC
 HlixuQUtWDY/yXvhfv7LW6pR/kx+BRTESxZjFmIAoIBP6nhrLRqRJufQR3LOfLukELZv
 69xQ==
X-Gm-Message-State: AOAM532lWF728LPSD2uttE6KUJxh9k54v4tqFxGFBpkNGsVLFc14K72L
 tWSCItrrbAgskVdmQZv1ZXpHM6WwBWODqdtGTYk=
X-Google-Smtp-Source: ABdhPJwQS/KoOnCxon7HIVTPrBdhtRAiTciUo68C2S6yLBrK7jLPjZ07R5QEskUzz06We/NbMCkw2Ud0N+QywM43wmw=
X-Received: by 2002:aa7:da04:0:b0:41c:c191:64bc with SMTP id
 r4-20020aa7da04000000b0041cc19164bcmr41723048eds.166.1652455743255; Fri, 13
 May 2022 08:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <CANW9uyswqzNGwkzbbNK_OcA-eF6Uf+Q3EkWgJrz2CudvQW4yPQ@mail.gmail.com>
 <9dcf48dc-3c58-d78d-d3c3-26c010a5fddb@linaro.org>
In-Reply-To: <9dcf48dc-3c58-d78d-d3c3-26c010a5fddb@linaro.org>
From: Itaru Kitayama <itaru.kitayama@gmail.com>
Date: Sat, 14 May 2022 00:28:51 +0900
Message-ID: <CANW9uytQrC6ynV2rD6A74GC07ZewMmQNBjUJLdCkhc6ty8pCcw@mail.gmail.com>
Subject: Re: sbsa board boot with neoverse-n1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000095794705dee65549"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=itaru.kitayama@gmail.com; helo=mail-ed1-x535.google.com
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

--00000000000095794705dee65549
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Richard I=E2=80=99ll look into it.

On Sat, May 14, 2022 at 0:03 Richard Henderson <richard.henderson@linaro.or=
g>
wrote:

> On 5/12/22 22:59, Itaru Kitayama wrote:
> > Richard,
> > I'm wondering what options you use to bring up sbsa board with
> neoverse-n1
> > as I am only able to do it with cortex-a57, no other CPU types works.
>
> I didn't attempt to boot it, because I don't have firmware for it.
> I only added it to the list of cpus that would be accepted by the board.
>
>
> r~
>

--00000000000095794705dee65549
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks=C2=A0Richard I=E2=80=99ll look into it.</div><div =
dir=3D"auto"><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, May 14, 2022 at 0:03 Richard Henderson &lt;<a hre=
f=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 5/12/22 22:59, Itaru =
Kitayama wrote:<br>
&gt; Richard,<br>
&gt; I&#39;m wondering what options you use to bring up sbsa board with neo=
verse-n1<br>
&gt; as I am only able to do it with cortex-a57, no other CPU types works.<=
br>
<br>
I didn&#39;t attempt to boot it, because I don&#39;t have firmware for it.<=
br>
I only added it to the list of cpus that would be accepted by the board.<br=
>
<br>
<br>
r~<br>
</blockquote></div></div>

--00000000000095794705dee65549--

