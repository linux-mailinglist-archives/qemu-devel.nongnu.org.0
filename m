Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EF66D354C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 04:49:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pinlT-0000bO-Kn; Sat, 01 Apr 2023 22:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pinlR-0000at-0W; Sat, 01 Apr 2023 22:48:17 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pinlO-0002VH-Iv; Sat, 01 Apr 2023 22:48:15 -0400
Received: by mail-pj1-x1033.google.com with SMTP id x15so24267406pjk.2;
 Sat, 01 Apr 2023 19:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680403692;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mJqBv9p0bdKlPygl4z7sqawsNmtXHf7EpPOfIlP7pg=;
 b=Kk+MR2sK/NborqEr4sy4HYTND8BfAkBv7X7DVVCuOfu/0I+WpR2axIhXWfnBBJ/e9X
 D/G5gW66BwTCzHhaqAtbFV8SLKL7ty4vhqTk1JUnn//BTGr4OJlwMkCNKBGPlNdChaF1
 FJO9NfaNZ1FBLPa9RsegDmd9A5JaAVcwKK+NyMQ0oEXdnn7osbwn2rmq1WIx6tIBjDTp
 UW02Ho9hxnAsLAGzaiIqMdUrqsaScfcLDCDxYIuJQX3JDQDLj5P1znl6K7/BXUxru/ME
 xhubgOdfoasbMND5Y0h/baGghYk2aX/fVXPTo7fTEdH/mst+BMfuPXCQEY1EAyjkxcah
 NrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680403692;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+mJqBv9p0bdKlPygl4z7sqawsNmtXHf7EpPOfIlP7pg=;
 b=xyRPCrNqE7LSY6twrlYgOgK5rf7YQZAKk3DWvLuy9kK6OoK/ClNIOKt5XHZ3jit3TQ
 E7ByOP+zL+dWJuk+Wlw/Q59ufHf23Nf98fLE7YOfPGpLiFcA80LAVg5CQe6dvkrUw/25
 KP3Tf0wK9SpX3rQGVZ2LbiuHdUeHjjQFbnS0NZMgtc/CqMO4vqvZmNYEvs6Q0JRvxLPJ
 o/lBovaDzFbYuT+YJyMhm1WU6L7SXVTi6q7kN/1OaAJiaXo4PEf1T8ceo+7PYlP03ZNE
 YIFZHeztDGpLjRSScSihV1u7SGIFnwzZdHKJMeOm2S3hiQPB09jaKSenX2LFYoCXO0LG
 Gs0A==
X-Gm-Message-State: AAQBX9fMhutOZrfZnFEyA2l0IeePN1EkaUuNCs+cfR9IyynGEqVOCqEE
 6SnQfM2vv0t+jeW+1HF+3A4=
X-Google-Smtp-Source: AKy350ZcTkO1KL7GCQjExNOW0dApnWr5EhgN9d64KFofNj3EIxN6+MBOi55AfftAwwAbuURovEUn+Q==
X-Received: by 2002:a17:902:d2d2:b0:1a0:6ed9:f9d0 with SMTP id
 n18-20020a170902d2d200b001a06ed9f9d0mr40709297plc.68.1680403691713; 
 Sat, 01 Apr 2023 19:48:11 -0700 (PDT)
Received: from localhost (121-44-67-49.tpgi.com.au. [121.44.67.49])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1709028d9800b0019eae717885sm4014779plo.107.2023.04.01.19.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Apr 2023 19:48:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Apr 2023 12:48:06 +1000
Message-Id: <CRLXE4JYYFU8.1IVDQRK6W5BMF@bobo>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Michael Neuling" <mikey@neuling.org>, <qemu-ppc@nongnu.org>
Cc: <qemu-devel@nongnu.org>, "Fabiano Rosas" <farosas@suse.de>, "Daniel
 Henrique Barboza" <danielhb413@gmail.com>
Subject: Re: [PATCH v2 6/6] target/ppc: Implement HEIR SPR
X-Mailer: aerc 0.13.0
References: <20230327131218.2721044-1-npiggin@gmail.com>
 <20230327131218.2721044-6-npiggin@gmail.com>
 <56482fa613790ede02b1fe086639ae33678d1481.camel@neuling.org>
In-Reply-To: <56482fa613790ede02b1fe086639ae33678d1481.camel@neuling.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed Mar 29, 2023 at 3:51 PM AEST, Michael Neuling wrote:
> Nick,
>
> > +    case POWERPC_EXCP_HV_EMU:
> > +        env->spr[SPR_HEIR] =3D insn;
> > +        if (is_prefix_excp(env, insn)) {
> > +            uint32_t insn2 =3D ppc_ldl_code(env, env->nip + 4);
> > +            env->spr[SPR_HEIR] |=3D (uint64_t)insn2 << 32;
>
> Are inst and inst2 in the right locations here? I think you might need
> insn in the top half and insn2 in the bottom.
>
> I wrote the little test case below. I'd expect GPR0 and GPR1 to end up
> with the same value, but they don't with this code

You're right. I was a bit confused becaue the prefix instructions are
treated as two words, so ld (insn) in little endian doesn't match
HEIR, for example.

The ISA uses the term "image", but that's only really defined for 4
byte instructions AFAIKS. You can deduce though,

  There may be circumstances in which the suffix cannot be loaded [...]
  In such circumstances, bits 32:63 are set to 0s.

So prefix word goes in the high bits. Real P10 agrees, so does
systemsim. I'll fix and re-send.

Is there any better semantics in the ISA or should I raise an issue to
clarify instruction image for prefix?

Thanks,
Nick

