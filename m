Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 784E15B3DE3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 19:25:26 +0200 (CEST)
Received: from localhost ([::1]:37896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWhkq-0006at-Rw
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 13:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWhhO-0003dM-BK
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 13:21:50 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1oWhhM-00062M-EG
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 13:21:50 -0400
Received: by mail-qk1-x72e.google.com with SMTP id d17so902839qko.13
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 10:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=34omRCiYyhRhRUaTudx65fKE1tmfUu5/Vq2eUS745Kg=;
 b=m4AC2sNQO+WyCASvjVaNcU98GuHJRPvzdWr4Ilhz8i2kV++YfahRb/+HkHkkAmvQlN
 rNja26VHQ3vzB6xqLnkOfv+cPa55ViDMj+CmQXBEdRXqLEH+h6qNtbLsPMZVgdR5WTVQ
 AETRHTkGP6SpjkifS32EBdPCFdADm84ntA96ly+a5StGGA97egeWy0p4xHgN/+75xdUi
 el9okFwYkHxOgZYlWufo2vRKKfz3Oq4MUWbT14gOeODS+/MqCvU7NQ2xCn8tKL2Ux6XU
 tnhoUpon7y+WrEdSilPzc0UTsOuTawYAwUaqS1UvSsLXqCNsG10D4wpgSncspPJ0mA+A
 +58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=34omRCiYyhRhRUaTudx65fKE1tmfUu5/Vq2eUS745Kg=;
 b=WwpCfgQ/eNETQVL0OHnGmi9ihpIHDeaGTEOEmPYlI9fvcp2Jj6w9Zgnu56Zfp6Oh0S
 xtZ3ODoo7Qu+TjF2ufuzdJ7o83VcLIXiAv5JZaL4HWpTrhKUJ9HP5CFCMs81KHgKuUDO
 88/t6LeAHoQbHwYf8/hEwwCABi2Oj4goWgcYPqxltAZXS3uKwI7+6+MPH8eKUckRBb4r
 9/QuP6taWL9GCm1J+jbYPqv3WkQyzVmUS+di1Ww2P6IKPm0YoO3yLKnH4khlJy0qV+gu
 aks/DeT/W/3N1Hns50DRty4C0oh+whbZgcylnlYFKxDg+0GdUX6g0rxznrIOsnzsSEko
 83pA==
X-Gm-Message-State: ACgBeo3PIKagDZPhHalxpsNf3GbNFv2XFy7MyoWU7GcEu2b1JWitJGqx
 0yT7dVQVdMfuyT/imIRF5lua0vuY8Unpc62EMRijgw==
X-Google-Smtp-Source: AA6agR5ZtbGq4iWK6cImSPQVDxauoWJyaD7gcTVbq/bpAecFte6kXG82Luvm5I242JrNZjLNMF6btH3K092Op5rh8HQ=
X-Received: by 2002:a05:620a:e0a:b0:6bc:15e9:14fe with SMTP id
 y10-20020a05620a0e0a00b006bc15e914femr10833298qkm.86.1662744106037; Fri, 09
 Sep 2022 10:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220906122243.1243354-1-christoph.muellner@vrull.eu>
 <20220906122243.1243354-4-christoph.muellner@vrull.eu>
 <f6c98fb6-38f7-5747-0db6-aec2c77edd9a@linaro.org>
In-Reply-To: <f6c98fb6-38f7-5747-0db6-aec2c77edd9a@linaro.org>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 9 Sep 2022 19:21:34 +0200
Message-ID: <CAEg0e7g08WA+05s=DX0R0Eu=UgLjrxjQi9GqZTpyiKeu0N_k8w@mail.gmail.com>
Subject: Re: [PATCH 03/11] RISC-V: Adding T-Head SYNC instructions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Nelson Chu <nelson@rivosinc.com>, 
 Kito Cheng <kito.cheng@sifive.com>, Cooper Qu <cooper.qu@linux.alibaba.com>, 
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>, 
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: multipart/alternative; boundary="000000000000cb074305e841c7da"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--000000000000cb074305e841c7da
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 9:30 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/6/22 13:22, Christoph Muellner wrote:
> > +NOP_PRIVCHECK(th_sfence_vmas, REQUIRE_PRIV_MHS)
> > +NOP_PRIVCHECK(th_sync, REQUIRE_PRIV_MHSU)
> > +NOP_PRIVCHECK(th_sync_i, REQUIRE_PRIV_MHSU)
> > +NOP_PRIVCHECK(th_sync_is, REQUIRE_PRIV_MHSU)
> > +NOP_PRIVCHECK(th_sync_s, REQUIRE_PRIV_MHSU)
>
> These should not be nops: th_sfence_vmas requires a tlb flush;
> th.sync{,.i} needs to end
> the current translation block; th.sync.{s,is} needs multiprocessor sync,
> which involves a
> call to async_safe_run_on_cpu.
>

Understood.
For a new revision, I'll do the following:
* th_sfence_vmas: async_safe_run_on_cpu() with run_on_cpu_func which
flushes TLB on all CPUs (similar like trans_sfence_vma())
* th_sync/th_sync_i: end the TB (similar like trans_fence_i())
* th_sync_s/th_sync_is: async_safe_run_on_cpu() with run_on_cpu_func which
ends the TB (similar like trans_fence_i())

Thanks!


>
>
> r~
>

--000000000000cb074305e841c7da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 8, 2022 at 9:30 AM Richar=
d Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hen=
derson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 9/6/22 13:22, Christoph Muellner wrote:<br>
&gt; +NOP_PRIVCHECK(th_sfence_vmas, REQUIRE_PRIV_MHS)<br>
&gt; +NOP_PRIVCHECK(th_sync, REQUIRE_PRIV_MHSU)<br>
&gt; +NOP_PRIVCHECK(th_sync_i, REQUIRE_PRIV_MHSU)<br>
&gt; +NOP_PRIVCHECK(th_sync_is, REQUIRE_PRIV_MHSU)<br>
&gt; +NOP_PRIVCHECK(th_sync_s, REQUIRE_PRIV_MHSU)<br>
<br>
These should not be nops: th_sfence_vmas requires a tlb flush; th.sync{,.i}=
 needs to end <br>
the current translation block; th.sync.{s,is} needs multiprocessor sync, wh=
ich involves a <br>
call to async_safe_run_on_cpu.<br></blockquote><div><br></div><div>Understo=
od.</div><div>For a new revision, I&#39;ll do the following:</div><div>* th=
_sfence_vmas:=C2=A0async_safe_run_on_cpu() with run_on_cpu_func which flush=
es TLB on all CPUs (similar like trans_sfence_vma())=C2=A0</div><div>* th_s=
ync/th_sync_i: end the TB (similar like trans_fence_i())</div><div>* th_syn=
c_s/th_sync_is: async_safe_run_on_cpu() with run_on_cpu_func which ends the=
 TB (similar like trans_fence_i())</div><div><br></div><div>Thanks!<br></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
r~<br>
</blockquote></div></div>

--000000000000cb074305e841c7da--

