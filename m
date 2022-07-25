Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9305801D1
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 17:25:29 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzxY-0001ec-IX
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 11:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oFzvB-0007N4-9D
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:23:01 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1oFzv9-0004aB-Ct
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 11:23:00 -0400
Received: by mail-ej1-x635.google.com with SMTP id j22so21229402ejs.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 08:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUmijzKDqzBwsnUVgjSmQTv657FCQPRTPzdvQ/ShJHw=;
 b=LUnb02qhFPWb/tlt6nxq8lM2G+09RATSx8Ec8xwFWLan18x03ywJTHby9E4wwRi1zI
 alaTrAh+i5pwXZzMAjgZU+wKllQa9uEuZRrKRVGTVtk0t/pYN696HMkFaR6My9U2MON4
 V/xIoBd4rJ1UZDnnbOzCse5dQ3kCDAaQvLuwR0o1HVoGuXSH9UxbOv8J5HgwyGqQxzTu
 L9B8CHUrpFPRI2DtX04g6HE+euuGuG2/Il1POOEKl/l4mgTHxsyJi43FbhitVjw1pIpl
 LLxnC0Sjve81sKBeH3vwPv7OzXgMS4jGqieaRJvXBhM1h5HPavDx06HEweNlHsOrbARk
 jXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUmijzKDqzBwsnUVgjSmQTv657FCQPRTPzdvQ/ShJHw=;
 b=48MGccrKwGvfwJF4caaeM9I74b3ds9seATb+vW+56MVv0nvGwNPXlO+yUr8C4jrF7t
 fw4Th9xLeY9ashmIMPFEVp/UZJknOW1ts8kMMJ+bOpEpY69hsKGY0PqHcYNMYyJkKcDR
 SC5dmCQB7EumVzHA646RnbPOMDW5lIZlzr8vynxOIm4DuhZaDsVl74PR/4Ptudmg+l6b
 WuspB27Te9zF+KSV2QQnHK/YYDBxr1LGAMJk1Jq36bwS2v8925vupVYX4nTFVkApIfex
 bV4wrvgrzgqRJLe+Qe0fnTerGlQyOIGPCiPbPYcO1MVj5txqfBZXVlGtvrB2x6YlKcAS
 dUPA==
X-Gm-Message-State: AJIora/LZ9reQwa25xF7paJGF5+xFvRb9zfe5urHKydta8bbJ/H5vBdQ
 0K6XO7LLAzPEFj5pI7Eg1K9FvsCe8W/hrQUj3YbIeQ==
X-Google-Smtp-Source: AGRyM1ulBLoBDFn1vW/SQupVpCdmG3Jn0LjRDqySFzrx8qWkNV4T4q5OL7kjWfN4Crbgau+JGCMLvpy/ARLbkblJP6s=
X-Received: by 2002:a17:907:7f1a:b0:72e:f9c9:dfe2 with SMTP id
 qf26-20020a1709077f1a00b0072ef9c9dfe2mr10575707ejc.84.1658762576986; Mon, 25
 Jul 2022 08:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220718035249.17440-1-jim.shu@sifive.com>
 <CAAhSdy0XUp1KGvmiPhG0eaTk1bnzwVGrW83jDXSLsrzK_NtXDw@mail.gmail.com>
 <CALw707qqVxROpindXhxPjAvccjTYaYoC_vTjtfkM+Do_pMLQRA@mail.gmail.com>
 <CAAhSdy2dm5p8wb4YSppS=yT8L4ctZc9J9mT=-jPdLe5p=VR6=A@mail.gmail.com>
 <CAKmqyKNxOpyHxcf3JJdX+XJPYfwCVjKc87xTZ+w1qzJFr5OfKA@mail.gmail.com>
In-Reply-To: <CAKmqyKNxOpyHxcf3JJdX+XJPYfwCVjKc87xTZ+w1qzJFr5OfKA@mail.gmail.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Mon, 25 Jul 2022 23:22:45 +0800
Message-ID: <CALw707qUHDuS=NLvcuuyEC4Lj91GZ0sXxAzjNrzvQThSn=XHnQ@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Support SW update of PTE A/D bits and
 Ssptwad extension
To: Alistair Francis <alistair23@gmail.com>
Cc: Anup Patel <anup@brainfault.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, 
 Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: multipart/alternative; boundary="0000000000002b245e05e4a2c205"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=jim.shu@sifive.com; helo=mail-ej1-x635.google.com
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

--0000000000002b245e05e4a2c205
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

Why do we want to support that? We can do either and we are
> implementing the much more usual scheme. I don't see a reason to
> bother implementing the other one. Is anyone ever going to use it?
>

Thanks for your response.
I got it.

Regards,
Jim Shu

--0000000000002b245e05e4a2c205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alistair,<br><br></div><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Why do we want to support that? We can do either and we are<br>
implementing the much more usual scheme. I don&#39;t see a reason to<br>
bother implementing the other one. Is anyone ever going to use it?<br></blo=
ckquote><div><br>Thanks=C2=A0for your response.<br>I got it.<br><br></div><=
div><div dir=3D"ltr">Regards,<br>Jim Shu</div></div></div>
</div>

--0000000000002b245e05e4a2c205--

