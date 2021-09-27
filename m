Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CB41A013
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 22:24:37 +0200 (CEST)
Received: from localhost ([::1]:42682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUxAy-0002tU-05
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 16:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jimw@sifive.com>) id 1mUx9p-0001vc-0r
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 16:23:25 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:41638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jimw@sifive.com>) id 1mUx9n-0003WJ-3K
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 16:23:24 -0400
Received: by mail-lf1-x12c.google.com with SMTP id t10so82591540lfd.8
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 13:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9MgA4BnwDel7xIUJhdQAJ5mIQQd7rhhaCS9juxkKby4=;
 b=LvaVutbGtkQGEGtgKp99ivR29WvjGGBA2e+nnxtD4Ng4Qr5dNF8J2LaT68deAsgCBN
 oPR3O1eAYJAIUp8t58opXuONBZarXv6hsTLLOVO/R64rElgrhk/nj7nGGu4nrmQnefhw
 /Yo+b2abJP4JUJkfWNY40x8AdYDhaTd3v7WuW8glZbaqhgH3o8VJQf2WZlmo06DfFR38
 qYr52ij9PyVfg377yJzfhpS0hOtIifPkFyJJsEW/HCNDP3+kfc13Eh6ENApDFgnW1Jei
 adxBIQ9lqbUKGMydNgxUzRmSkF/TNEGBwHHirL35CYyWhihnpsKecgEpnU6AhbU6XrU+
 NsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9MgA4BnwDel7xIUJhdQAJ5mIQQd7rhhaCS9juxkKby4=;
 b=nhi5xqYQNLO2ZBUEwlaL65HDpgKjXsN/TzfNGGVmt0vHnK+yiF91tV0UWX2zjZZFbt
 1uPgj/Gxz4Bu4sXYPl7HdMJ3sP1egkRpYrKnERizmDK/dx3F+IjDbRs4TASgMs9QjBub
 5AikyybYqQEPeaM6IhGn1wDqyKzyWlKxlnME6XvN3MsxgOLS8HPP4W1DUnZlIvxWzzpH
 hj+RVITOLTktB5o1j1qXyqfDmx8qD7Um0m8EaaMcJrLXtb+m2fUehMJNQ3zieljOMage
 tNWF31I6oPyCV0ZhyclQYGnoS+33sAAmL/P5QnLa1QppMXFyL1mkCJAamvEe+afJRTtK
 MH6w==
X-Gm-Message-State: AOAM533lic3hyr1P3Y7ffOe52S9SM00U4Rl8n9dUAoEFLaoLo7yBJrsh
 5h09o5rzrXAegYCykbgwNaMnGK8tpf3JVXGp7F0gLg==
X-Google-Smtp-Source: ABdhPJyBOb+HVEPHAHfHROtBADiojIetj7w1FtXHn0HPe1qGMX5/viWXFz4OvOfvCh0KM5AxnwNx1ejT6e4Q9BveEH4=
X-Received: by 2002:ac2:561a:: with SMTP id v26mr1667866lfd.500.1632774200263; 
 Mon, 27 Sep 2021 13:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
 <5be1705c-c39e-fa44-201c-467811f8e5c8@linux.dev>
In-Reply-To: <5be1705c-c39e-fa44-201c-467811f8e5c8@linux.dev>
From: Jim Wilson <jimw@sifive.com>
Date: Mon, 27 Sep 2021 13:23:09 -0700
Message-ID: <CAFyWVaaULg4rgBa50a_8LFossYmc4AfQcLDi0trEiunSckVaaw@mail.gmail.com>
Subject: Re: [PATCH v11 00/16] target/riscv: Update QEmu for Zb[abcs] 1.0.0
To: Vineet Gupta <vineetg@rivosinc.com>
Content-Type: multipart/alternative; boundary="000000000000349e2d05ccffde04"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=jimw@sifive.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000349e2d05ccffde04
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 1:01 PM Vineet Gupta <vineetg@rivosinc.com> wrote:

> So I obviously forgot to get the equivalent binutils branch, but the
> only rvb branch on sifive fork feels dated
>
>
> https://github.com/riscv-collab/riscv-binutils-gdb/tree/riscv-binutils-2.35-rvb


That is the right branch to use with the gcc that you are using.  This
stuff hasn't been actively maintained so we have old gcc and binutils
release versions.

We are in the process of putting stuff upstream now.

Jim

--000000000000349e2d05ccffde04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Mon, Sep 27, 2021 at 1:01 PM Vineet Gupta &lt;<a href=3D"m=
ailto:vineetg@rivosinc.com">vineetg@rivosinc.com</a>&gt; wrote:</div></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
So I obviously forgot to get the equivalent binutils branch, but the <br>
only rvb branch on sifive fork feels dated<br>
<br>
<a href=3D"https://github.com/riscv-collab/riscv-binutils-gdb/tree/riscv-bi=
nutils-2.35-rvb" rel=3D"noreferrer" target=3D"_blank">https://github.com/ri=
scv-collab/riscv-binutils-gdb/tree/riscv-binutils-2.35-rvb</a></blockquote>=
<div><br></div><div class=3D"gmail_default" style=3D"font-size:small">That =
is the right branch to use with the gcc that you are using.=C2=A0 This stuf=
f hasn&#39;t been actively maintained so we have old gcc and binutils relea=
se versions.</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">We are in th=
e process of putting stuff upstream now.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Jim</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div></div></div>

--000000000000349e2d05ccffde04--

