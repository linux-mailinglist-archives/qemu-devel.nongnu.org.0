Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B28A643764A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 14:01:44 +0200 (CEST)
Received: from localhost ([::1]:37260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdtF1-0002lR-Bo
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 08:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdtCU-0001Hz-LK
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 07:59:06 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mdtCT-0004jD-1E
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 07:59:06 -0400
Received: by mail-wm1-x335.google.com with SMTP id j205so1957733wmj.3
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 04:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=3ZmOKGB/T7A9+hUthh8aPyTUu2ED9LTp7/mK99CcUvo=;
 b=ihTTklx9iRcNPRep0Me7hKbj4AxggcFCOPEbucrNdZgyt7PZFk3Uk2urmR1guoSzQn
 6/LmEZ9dP3KH+3/Dw0peYmXBV8NmJ3/XpS36x2Za5dbWujfx4tjlNnyPWppRQII9qphM
 5zfiRx6UJs6xsleKGMtnr7gp/itpAvgdcpJ6b+GdOFwmiy5QNmRUQ9Q0AzOEYUt7Mq4A
 adkdcSr9CahWsnMVr0ECk59OhRpBrFW0ooKjeGQ3MRtlM7FgINHPxuyla0t9XwC2Qx0U
 3I/28+9SyY48sJnIfyMEr34g7w3bVHXU+GxDUxnMbwSqN3SRphwZsUovnJhPCDdlDsT0
 Wsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=3ZmOKGB/T7A9+hUthh8aPyTUu2ED9LTp7/mK99CcUvo=;
 b=e/mWcxj+tG9eHZGH/Xx5aVQyO3DJlttBgd0vbgAfCYZzUkheGF6g3UjMsK7Hrlvckf
 AYoqm8ke9JtVbPiazTNm+EV2g23fzHr0qCrumvD4PgFn6b1mS5mCQc5cH/OAdBLQ1rOP
 9vjCOkB+m4k2yKG0i1MkuP65lH6xMLsSTE+Ns7Y9YpnXf4aIjT+2bMlrAjPgN5O8VA+x
 0L+6NWpyuYKV7kRtsDgoRm15Qp4fkjdEJALUt0nS7HUwUifvIxGEmDBuQWa8Ya9mN8Cl
 0GE0+07K/AmX1W5tdVau6T3hmD3HngB7JirGESAnW9gPZhYeWwkxzClNEAK93djPiLnN
 ZOow==
X-Gm-Message-State: AOAM5306vMWydbpLxWFL2biWLIO6d5FFNlXlyI1JgZ5LOTm76FyXbmp/
 bZKRwDaXirPk2ckpOUQ7ShHDjg==
X-Google-Smtp-Source: ABdhPJxPIzjX5oynr1nqt7XFkZRxuXO6FGhxIbQ/IR9JlBm3Kr/jPwO+2iJ2ZpMEYxGZBlBbo9Kn2w==
X-Received: by 2002:a1c:7208:: with SMTP id n8mr13489033wmc.19.1634903943090; 
 Fri, 22 Oct 2021 04:59:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g200sm4232580wme.22.2021.10.22.04.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 04:59:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 34FA41FF96;
 Fri, 22 Oct 2021 12:59:01 +0100 (BST)
References: <20211021151136.721746-1-ruinland@andestech.com>
 <20211021151136.721746-2-ruinland@andestech.com>
 <00563f20-1867-6a4e-e9ea-a33ff85f058e@linaro.org>
 <YXJ69gaslRMnOSHm@ruinland-x1c>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ruinland ChuanTzu Tsai <ruinland@andestech.com>
Subject: Re: [RFC PATCH v1 2/2] Enable custom instruction suport for Andes
 A25 and AX25 CPU model
Date: Fri, 22 Oct 2021 12:52:18 +0100
In-reply-to: <YXJ69gaslRMnOSHm@ruinland-x1c>
Message-ID: <875ytptgmy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: ycliang@andestech.com, alankao@andestech.com, wangjunqiang@iscas.ac.cn,
 dylan@andestech.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, alistair23@gmail.com, qemu-riscv@nongnu.org,
 bmeng.cn@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ruinland ChuanTzu Tsai <ruinland@andestech.com> writes:

> On Thu, Oct 21, 2021 at 12:17:47PM -0700, Richard Henderson wrote:
>> On 10/21/21 8:11 AM, Ruinland Chuan-Tzu Tsai wrote:
>> > In this patch, we demonstrate how Andes Performance Extension(c) insn :
>> > bfos and bfoz could be used with Andes CoDense : exec.it.
>> >=20
<snip>
>> > +static int andes_v5_gen_codense_exec_it(CPURISCVState *env, DisasCont=
ext *ctx, arg_execit *a)
>> > +{
>> > +    uint32_t insn;
>> > +    uint32_t imm_ex10 =3D a->imm_codense;
>> > +    target_ulong uitb_val =3D 0;
>> > +    riscv_csrrw(env, 0x800, &uitb_val, 0, 0);
>>=20
>> This won't work -- you can't access env during translation.  So all this
>> faff around passing env through HartState is for naught.
>
> Sorry, please elaborate me a little bit more.

When dealing with translation you need to separate the translation phase
from the execution phase. CPUEnv is the current run time state of the
vCPU so the value that might be stored in it when you do translation
could very well be different when the translation runs (or runs again).

The correct way to deal with this is by the use of translation flags. If
for example the translation is only valid for a particular execution
state you represent that in a translation flag which you compute in
cpu_get_tb_cpu_state. This ensures that the translated block will only
get looked up when you are in that translation state - if it's not you
will generate a new block for the current state. See the section:

 https://qemu.readthedocs.io/en/latest/devel/tcg.html#cpu-state-optimisatio=
ns

of the developer guide.

--=20
Alex Benn=C3=A9e

