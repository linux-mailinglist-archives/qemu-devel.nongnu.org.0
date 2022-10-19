Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52825604850
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:54:05 +0200 (CEST)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol9WG-0007oV-DM
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ol9Pr-0002ha-TH
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:47:29 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:33554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ol9Pp-0004Pm-3M
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 09:47:27 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n16-20020a05600c4f9000b003c17bf8ddecso949897wmq.0
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 06:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vT1aa1nJnb6Y7ZhrEOKACvwj0Tqr6RrrrajbwjORn5g=;
 b=hFQoc1hZz4124rXqaqDBmYZszbTkYzXYeMKcm7Zr6cRD7H/StP+oD5d5CUZk/XcGH3
 uDFY0sLa9CmoJdHq5GovI2Mb8eCUnEHoiENM6j6uHMteyDrM5YEOcvUC7SQev7KzL64x
 yR3HszKlhU5OElbHKdKKbTB8+/gX585PWxweM7dwVP18hpHK3LaXyxlE5A27IYE+StPb
 2E17hCZlnqMICgxSFNgU7bdMPlKBEi2NVouwVCR6F/P/RQ9FjGJH8a20PQk3WJQuqcOG
 kBubaCKybb3TmcYODKKJgI/Mp7mMEGKZsl/+Le6fW5W7v7Ouatss1s2CWmz7fKxrYFCg
 mucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vT1aa1nJnb6Y7ZhrEOKACvwj0Tqr6RrrrajbwjORn5g=;
 b=Od89uJtE6ry9KfXEUfyyvoWnjjIltKmb3xkBDr4k1Fgx4T0l3S88Cqn7kf223vqU+e
 P1fzVeMkdvfAFe3Cu0lQfWC5YV5jA44sFw2dT6P3GBsAWYgw/k08cuVp6cwM3p7B7HdS
 Kw3HHa2Gx8pFbd4/GjpCb4CeTfQ8AySF+xU2yELn9pxMUfNO1gcRBpyBGMrHCi2CW814
 jRpxkFqTdvxjTdIhY7bsm3ZA73yC2MoX+ZK79sygvewFfuhdJ95LcPvqJ5OTUq3qo7hH
 rHMSRET3kG0RMwiqrZyTsQcKDf0eDENzK2/SH9ASCtd+C3EYEf7u0U9ZlrySNudXm+qQ
 NWPw==
X-Gm-Message-State: ACrzQf0fNLoo3bmdLqKRZSD3wRbl3Cvzw92/oyxAI8buunXtY0fyaKLa
 +v9ccB22vHT0/a9JZxkfZM7dlw==
X-Google-Smtp-Source: AMsMyM5JNxFRzHjZgjfV/folQETM/o48LjZElK4Y9OkwoMJpzIBvWbaI72gpDUBTzJOHsphpodQHpQ==
X-Received: by 2002:a05:600c:1e87:b0:3b5:1e2:3c3c with SMTP id
 be7-20020a05600c1e8700b003b501e23c3cmr5723409wmb.130.1666187232387; 
 Wed, 19 Oct 2022 06:47:12 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d6309000000b0022afcc11f65sm13737526wru.47.2022.10.19.06.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 06:47:11 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23F7A1FFB7;
 Wed, 19 Oct 2022 14:47:11 +0100 (BST)
References: <4672400c-0084-3bf3-a596-7a42115301f0@linux.alibaba.com>
 <87lepeeno0.fsf@linaro.org>
 <4841b154-bd05-c677-cfb4-46a350ddd0aa@linux.alibaba.com>
 <b97a7b1a-f8cd-b0d5-bbde-1a06049281dd@linaro.org>
 <020dc51f-793b-bf20-41e8-5b1447711864@linux.alibaba.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 qemu-devel@nongnu.org
Subject: Re: Question about TCG backend correctness
Date: Wed, 19 Oct 2022 14:46:01 +0100
In-reply-to: <020dc51f-793b-bf20-41e8-5b1447711864@linux.alibaba.com>
Message-ID: <87k04wapsw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


LIU Zhiwei <zhiwei_liu@linux.alibaba.com> writes:

> On 2022/10/18 13:22, Richard Henderson wrote:
>
>  On 10/18/22 01:27, LIU Zhiwei wrote:=20
>
>  Maybe I can run RISU on qemu-aarch64(x86) and qemu-aarch64(risc-v) to ch=
eck the RISC-V backend.=20
>
>  This is a good start for debugging a tcg backend.=20
>
> After fixing some bugs, RISU can run  some instructions now. Thanks.
>
> IMHO,  the next 2 requests should be satisfied for TCG test.
>
> 1. Add a unit test case for any lower level and small function is easy.=20
>
>  For example, the function in risc-v backend,=20
>
>  static bool tcg_out_mov(TCGContext *s, TCGType type, TCGReg ret, TCGReg =
arg)
>   {
>       if (ret =3D=3D arg) {
>           return true;
>       }
>       switch (type) {
>       case TCG_TYPE_I32:
>       case TCG_TYPE_I64:
>           tcg_out_opc_imm(s, OPC_ADDI, ret, arg, 0);
>           break;
>       default:
>           g_assert_not_reached();
>       }
>       return true;
>   }
>
>  Write a unit test case for it is not easy currently.  I don't know how t=
o fill the TCGContext struct and other
>  parameters.
>  And there is no test framework where I can reuse.
>
>  The others may say that we can run a lot of benchmark to ensure we have =
a good coverage and don't
>  need such a low level test case. Some reasonable. But it will lead to a =
very high test burden and it is very hard to
>  get
>  a good coverage only through high level test.

You can at the very least use the gcov build to identify which bits of
the backend are not exercised by "check-tcg" and maybe write a few more
tests to fill it in. It's not a direct exercising of the code but it at
least ensures it has run and worked at least once.

>
> 2. Add a unit test case for any high level function is easy, such as tcg_=
gen_code.=20
>
>  The check-tcg test belongs to the high level testing.=20
>
> Best Regards=EF=BC=8C
> Zhiwei
>
>  It's not comprehensive, because RISU executes one instruction at a time =
then raises an exception to check the
>  results.  This means that the tcg optimizer doesn't have much to work wi=
th, which means that the tcg backend is not
>  as stressed as it could be.=20
>
>  I've long wanted to have the ability to have TCG unit tests where a=20
>  virtual processor could be defined for the purpose of directly=20
>  exercising TCG.=20
>
>  We already have many ISAs as the front end of TCG. Will the virtual proc=
essor here be some=20
>  different?=20
>
>  It wouldn't.  This is my argument against creating a new virtual process=
or.=20
>
>  I do think we should be better about creating regression tests for bugs =
fixed, in the form of small focused assembly
>  test cases which get run via check-tcg.=20
>
>  r~=20


--=20
Alex Benn=C3=A9e

