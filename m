Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5F5F1F9A
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 23:04:42 +0200 (CEST)
Received: from localhost ([::1]:33446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oejf7-0000bC-Gs
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 17:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1oejaX-0006WY-Ee
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:59:57 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1oejaV-0001FH-QU
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 16:59:57 -0400
Received: by mail-qk1-x730.google.com with SMTP id s9so4765889qkg.4
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 13:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=wY97w5G35XM9tl907bjhApiyq1nwIj16TXEhCmc4VDo=;
 b=n8txCughHL1pum9aWgYmo0w1yGRBrx2kNbw2TuJWnzqPU2doJYId6r4S0e+FGcN242
 s/lza6dkZpfWV/1hQa2ZRkd/pG/psX+TjJhsopn6rOyhRWSL/iIYQYvXCAyKusCy/llC
 f/jvK1SWYTsj3keTNUeo5Kk1mgfr+3g8OL6lWW9BA50ZPAqAHlEO72gMuZCFPQZW0cXZ
 cxrPqHd35zdAFzepemjDnRgoNK5wiFiUYZ+ON0EwZe0mfh0ltK2BOnY5xIzN7eZBkWGr
 BGWOkx89M6oj8I484BglimbQPnYJEL9GwolwhKQXII5OVfUuzEFm2UBDs0Qh/ZtkTutc
 WKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wY97w5G35XM9tl907bjhApiyq1nwIj16TXEhCmc4VDo=;
 b=eRiiSDhlu10MnlXv1EVjvWJkS9X1comA/2eNKGSWYBWMyFkm2EE9ickwlrjDzmxOrT
 tuD+sj3deTlBn5UBVWt5IwFlcV6ESjlsh0ZNE+zYnuGFarjhPC2M/khl6VHW/TLUKUJR
 jkwnvliY9kUDBlEFlZMLQh/yN0+naxsnEkWNOWkT/eh9/2z0aY0h4C245aZvxFA2JqMZ
 DN4toxHo5uFrskvV8EqYFC7vLXb5ohnL3RnPRP47U3thzzUoCV5G+maNm40MphCzsKKy
 lc5Mzj/IR1E661c7TphRG+PDojSQdB989gQXvJY5nP8kRfWaF6tRxf2VJ67jsXv6zbfV
 jjsQ==
X-Gm-Message-State: ACrzQf1tLJJ7Ia8IUr1DKT2NFqqZuHnfZRp+42D1WZg+DoBmp53qpsqQ
 iYu8DTEl6sikL0ipIVaCBARZZT3r3WMEdqkJPp0=
X-Google-Smtp-Source: AMsMyM69lB0jmwdKHkKWECNWaqyhDMx21upe9amOHlxMf6t9AqToTjiqrBXQs4n3lVl5sU9aaaoPkN5YJ3vtjMEsD3Q=
X-Received: by 2002:a05:620a:4143:b0:6ce:87a7:77cb with SMTP id
 k3-20020a05620a414300b006ce87a777cbmr10252866qko.230.1664657993504; Sat, 01
 Oct 2022 13:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
 <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
In-Reply-To: <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
From: BitFriends <commandspider12@gmail.com>
Date: Sat, 1 Oct 2022 22:59:42 +0200
Message-ID: <CABVhSWPT5adYQqN-d3WgCz=RcHxt1tEvM8d0GWeixRAo4OZHzg@mail.gmail.com>
Subject: Re: access guest address from within instruction
To: richard.henderson@linaro.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000601bbd05e9ff641a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=commandspider12@gmail.com; helo=mail-qk1-x730.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000601bbd05e9ff641a
Content-Type: text/plain; charset="UTF-8"

well, it doesn't give errors, but warnings because of unsigned longs being
converted to TCGv_i64, which exact definiton I cannot find in the qemu
repo. Where is it located? When stepping through the instructions' code,
the value that should be read isn't read. Maybe that'll work when fixing
the warnings.

Regards

Am Sa., 1. Okt. 2022 um 22:23 Uhr schrieb Richard Henderson <
richard.henderson@linaro.org>:

> On 10/1/22 13:10, BitFriends wrote:
> > Hello,
> >
> > I am trying to create a custom instruction that accesses guest memory
> specified by an
> > address in a register. I specifically want to read from that address. So
> I tried to do
> > that using "tcg_gen_qemu_ld_i64(&res, env->regs[R_EDI], 0, MO_LEUQ);",
> but that doesn't
> > save any result in res.
>
> This statement should have given you compilation errors, so I don't know
> what you mean by
> "doesn't save any result".  There's clearly a disconnect between what you
> describe and
> what you actually attempted.
>
> Anyway, by the name you can see that function "gen"erates a "tcg"
> operation, which is then
> later compiled by the jit, the output of which is later executed to
> produce a result.
> Which is, in general, what you want for implementing a custom instruction.
>
>
> r~
>

--000000000000601bbd05e9ff641a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>well, it doesn&#39;t give errors, but warnings becaus=
e of unsigned longs being converted to TCGv_i64, which exact definiton I ca=
nnot find in the qemu repo. Where is it located? When stepping through the =
instructions&#39; code, the value that should be read isn&#39;t read. Maybe=
 that&#39;ll work when fixing the warnings.<br></div><div><br></div><div>Re=
gards<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Am Sa., 1. Okt. 2022 um 22:23=C2=A0Uhr schrieb Richard Hend=
erson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson=
@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On 10/1/22 13:10, BitFriends wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I am trying to create a custom instruction that accesses guest memory =
specified by an <br>
&gt; address in a register. I specifically want to read from that address. =
So I tried to do <br>
&gt; that using &quot;tcg_gen_qemu_ld_i64(&amp;res, env-&gt;regs[R_EDI], 0,=
 MO_LEUQ);&quot;, but that doesn&#39;t <br>
&gt; save any result in res.<br>
<br>
This statement should have given you compilation errors, so I don&#39;t kno=
w what you mean by <br>
&quot;doesn&#39;t save any result&quot;.=C2=A0 There&#39;s clearly a discon=
nect between what you describe and <br>
what you actually attempted.<br>
<br>
Anyway, by the name you can see that function &quot;gen&quot;erates a &quot=
;tcg&quot; operation, which is then <br>
later compiled by the jit, the output of which is later executed to produce=
 a result. <br>
Which is, in general, what you want for implementing a custom instruction.<=
br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000601bbd05e9ff641a--

