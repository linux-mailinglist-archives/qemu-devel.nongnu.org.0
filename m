Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E713B360BE8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 16:35:09 +0200 (CEST)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX35I-0005bq-Vx
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 10:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lX331-0004x3-C3
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:32:47 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lX32z-0005eU-GD
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 10:32:47 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so14734390wmy.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2/kD+1DAiFWJP4mpXQtlWvVQnKKRh3GNwoQvcpSfZ7Y=;
 b=Rc/NDHC27jrse4qCNARtIU2LTCObfAPQDuPEuMoyzZDX42V7n0SymgjTA2oCIu/6xD
 2BNU6rvxwg9zRMg68ylIexRX/E3y8Dn9bHD8gWeB8Ng/r7lKqZQFHBTwy0YSEnIPYRA5
 Qj8/To1tKfe+I2sC8YAKQox75exkCa0RRcCkNTS7IkZhOEt3lCSG2/MX63Aca7Hat3iB
 2C6D6OVC0Q/G39yU1wtI9GqP50oAea0EQ/wUXZakr2tKvMAcbcq6yL2K8sGa6DL5xiqt
 0qO/j5sSIk2GvtA5Xxx69wFvKcIn1NSDh2ahF/OzyDr4knyvJeZbskezJpHf1K+A8a0L
 A2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2/kD+1DAiFWJP4mpXQtlWvVQnKKRh3GNwoQvcpSfZ7Y=;
 b=bvFoO3MW0AF1cpowEu4rnkMXV1+j/us6BCXJ7GpTx13meWbd8850hmclDOJuzX4VsK
 morXcHyDMw0DjALCEMTKm9t/D/U7NYyvyq22EOIK1kWgS/fCinPDMa893yKsw47CZZmy
 qiDO+tPwFzBnSlsZ9JbmZUWp0Bb01QCE48G5Q6DlvNFqyZkPfRTGMTa3XEgKepSozSVt
 c+2yWT9iaitIHKi9KqzV+fe5PpQVTHGMXE0OuS3HvvB3KMUgeznqKIJ+7iODC0ldIMpr
 LI2nCsey12K+kquJ5BVwXtyAmikbnrPozz4zkD6j/mVx+xym7VUJi5XtegrwxYvbJAoT
 n8vw==
X-Gm-Message-State: AOAM532neG1S6ZkxNprAZUXDSrPuZn6nlcVrlNb0jkdFDT0tTMFlHOLf
 xfciWmlae7zTINV1E4UbV4y0Jg==
X-Google-Smtp-Source: ABdhPJzSOl0YyrlHS6tiVsxlRQKFpvvJwGv/t/ZBgc2Htv4EALr4UI9f2ow5Fqqiauv4bG0CGvHjEg==
X-Received: by 2002:a05:600c:1546:: with SMTP id
 f6mr3430560wmg.156.1618497163275; 
 Thu, 15 Apr 2021 07:32:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h17sm3647085wru.67.2021.04.15.07.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 07:32:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AC4F41FF7E;
 Thu, 15 Apr 2021 15:32:41 +0100 (BST)
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 18/23] accel/tcg: re-factor non-RAM execution code
Date: Thu, 15 Apr 2021 15:31:00 +0100
In-reply-to: <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
Message-ID: <87blaflit2.fsf@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--8<---------------cut here---------------start------------->8---

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 15 Apr 2021 at 14:18, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>>
>> On Thu, 18 Feb 2021 at 09:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>> >
>> > There is no real need to use CF_NOCACHE here. As long as the TB isn't
>> > linked to other TBs or included in the QHT or jump cache then it will
>> > only get executed once.
>> >
>> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> > Message-Id: <20210213130325.14781-19-alex.bennee@linaro.org>
>>
>> Hi; I've just noticed that this commit seems to break the case of:
>>  * execution of code not from a RAM block
>>  * when icount is enabled
>>  * and an instruction is an IO insn that triggers io-recompile
>>
>> because:
>>
>> > @@ -2097,6 +2086,17 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>> >          tb_reset_jump(tb, 1);
>> >      }
>> >
>> > +    /*
>> > +     * If the TB is not associated with a physical RAM page then
>> > +     * it must be a temporary one-insn TB, and we have nothing to do
>> > +     * except fill in the page_addr[] fields. Return early before
>> > +     * attempting to link to other TBs or add to the lookup table.
>> > +     */
>> > +    if (phys_pc =3D=3D -1) {
>> > +        tb->page_addr[0] =3D tb->page_addr[1] =3D -1;
>> > +        return tb;
>> > +    }
>>
>> we used to fall through here, which meant we called
>> tcg_tb_insert(tb). No we no longer do. That's bad, because
>> cpu_io_recompile() does:
>>
>>     tb =3D tcg_tb_lookup(retaddr);
>>     if (!tb) {
>>         cpu_abort(cpu, "cpu_io_recompile: could not find TB for pc=3D%p",
>>                   (void *)retaddr);
>>     }
>>
>> and since it can no longer find the TB, QEMU aborts.
>
> Adding the tcg_tb_insert() call to the early exit path:
>
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ba6ab09790e..6014285e4dc 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -2081,6 +2081,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>       */
>      if (phys_pc =3D=3D -1) {
>          tb->page_addr[0] =3D tb->page_addr[1] =3D -1;
> +        tcg_tb_insert(tb);
>          return tb;
>      }
>
> seems to fix my test case, but I don't know enough about the new
> design here to know if that has undesirable side effects.

No we don't want to do that as the comment says above. However as it's a
single instruction block it can do IO so could you try this instead
please:

--8<---------------cut here---------------start------------->8---
accel/tcg: avoid re-translating one-shot instructions

By definition a single instruction is capable of being an IO
instruction. This avoids a problem of triggering a cpu_io_recompile on
a non-cached translation which would only do exactly this anyway.

Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

1 file changed, 1 insertion(+), 1 deletion(-)
accel/tcg/translate-all.c | 2 +-

modified   accel/tcg/translate-all.c
@@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
=20
     if (phys_pc =3D=3D -1) {
         /* Generate a one-shot TB with 1 insn in it */
-        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
+        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
     }
=20
     max_insns =3D cflags & CF_COUNT_MASK;
--8<---------------cut here---------------end--------------->8---


--=20
Alex Benn=C3=A9e

