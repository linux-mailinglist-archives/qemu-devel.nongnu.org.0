Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90714632437
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 14:49:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox79f-0004DP-PE; Mon, 21 Nov 2022 08:48:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox79T-0004CS-K3
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:47:59 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1ox79S-0002DV-6G
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 08:47:59 -0500
Received: by mail-yb1-xb34.google.com with SMTP id c15so13630551ybf.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o4J23za7FLxpBB5e2WlKgHD3s1uag9d/QnwyfzeZcmQ=;
 b=pa3dFap+BZqZGvxuKd+UMkV3rgd0F732utUpYUkxB4/tq9ShzivRWp/OPVcGXhnIZ+
 oKCd8myw2xP36zQx5CJvzC8TNpkjp3zX9hec5S5rCHU/aVWSE0tghi7rUmhttJy9Hilc
 x2Bxlb3VJobtsavdMkp96lgRYmb7DPXhRP2DDfMGgmFhU4CwXU3CNFNdwsU6P5YPFp6p
 PCo9qwPvMhtZPVSmMjNmyUmfl+a3DjIia1a47zHgSkux8sVMoK8P4wE4HmoSdqJklGuy
 WdsAaFDnaPo3XUwygsQlNT3BIUtblnyFfa5E92K2uyU3DoRIPFS+yjC6ymSKw9xXWt5N
 2P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4J23za7FLxpBB5e2WlKgHD3s1uag9d/QnwyfzeZcmQ=;
 b=C3FWBvvXgEcFUamPn8mBRUGPyWzq+efE6FRRWuTZBn3a0xnM31FxotzSl9AhKn+ZOw
 h1dMGkN97PTcJBHOVcCkcRViLhT+vjRdNeUZeAzLCxPBepBSPtJocqb2HgxKh+CbF5O4
 CiLc6s/crCd4ws5j3AW0oWU4+IHtddCENCmTnqSmX/fT6mVeZ0B4U3Nc+xiW65mpJEbX
 i09ZLkb147B5Ty1llcluKmSHzMvjTiaZXdM1s2etbNhmPS+IqHo9OsIrmMYOOa3OFLku
 +UKQSNlGbqKYf67FsGKC9TSR+dmkHh/+36i8EnSucDVT+lm7fyFds4c8F0LjCUVdYHli
 NTWg==
X-Gm-Message-State: ANoB5pn4ICgyIRpVzgDHQ/e2OYu6szfY4t8s3WFjWTrWIAbzqkee2LZ3
 WWG1TOqcVJBGdsrrN1QcfGAXlPesIw9+Ps7pDqc=
X-Google-Smtp-Source: AA0mqf4ImZHIzB1h6JGvPdeeWQ5nibX08qe6I1LLxAYF3KEMiW80idR7QGDeiLj2KKH0rXCT7kfKJ1IHNI0FrGrlFPs=
X-Received: by 2002:a25:820d:0:b0:6d5:a304:b9d2 with SMTP id
 q13-20020a25820d000000b006d5a304b9d2mr2739088ybk.570.1669038476421; Mon, 21
 Nov 2022 05:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20221110090444.550362-1-tkutergin@gmail.com>
 <9473a8cf-8880-a10f-525f-b06a7d92e505@nxp.com>
In-Reply-To: <9473a8cf-8880-a10f-525f-b06a7d92e505@nxp.com>
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Mon, 21 Nov 2022 16:47:45 +0300
Message-ID: <CACKEeRP3s-AiOqQ-_CeUKt==fggQn+1rJueULvk1ULAjG8utKg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: qemu-devel@nongnu.org, laurentiu.mihalcea@nxp.com, daniel.baluta@gmail.com
Content-Type: multipart/alternative; boundary="00000000000080edaa05edfb4de7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=tkutergin@gmail.com; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000080edaa05edfb4de7
Content-Type: text/plain; charset="UTF-8"

Hi all,
added some references to TRM but honestly many fields were dumped from
hardware - odroid c4/amlogic s905x3/quad cortex-a55


On Thu, Nov 17, 2022 at 6:03 PM Daniel Baluta <daniel.baluta@nxp.com> wrote:

> Patch looks good to me.
>
> Maybe you might add some references to chapters from RM where this numbers
>
> come from. Similar with aarch64_a76_initfn function for example.
>
>

--00000000000080edaa05edfb4de7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,=C2=A0<div>added some references to TRM but honestl=
y many fields were dumped from hardware - odroid c4/amlogic s905x3/quad cor=
tex-a55</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Nov 17, 2022 at 6:03 PM Daniel Baluta=
 &lt;<a href=3D"mailto:daniel.baluta@nxp.com">daniel.baluta@nxp.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Patch lo=
oks good to me.<br>
<br>
Maybe you might add some references to chapters from RM where this numbers<=
br>
<br>
come from. Similar with aarch64_a76_initfn function for example.<br>
<br>
</blockquote></div>

--00000000000080edaa05edfb4de7--

