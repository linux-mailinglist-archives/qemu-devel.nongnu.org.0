Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588145317F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:54:18 +0100 (CET)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmx2X-0006iw-9q
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:54:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmx0m-0004w7-HN
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:52:28 -0500
Received: from [2a00:1450:4864:20::429] (port=39444
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mmx0k-0003HL-Ny
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:52:28 -0500
Received: by mail-wr1-x429.google.com with SMTP id d27so37057396wrb.6
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=GpApgx8b9AgUNFAkG6kc5llRRqd5ul9pizwxe3QSaYk=;
 b=zyj+ZeSTkTPWb3VnLdnK4lat9pI//fPO27qV7sZwkhv1t8IZbO/vcqyfmGFGnApxoa
 V8geg4/0QETflQ6CEmgG1GVQyHAnW54HTNMtlZUL8P7kJISr0qmn/qWmN2Tz/O9hG2E5
 F7dq9WMeYO0qGH39lgCV7Hpqj23TYSTW6e3VpZ7AacsBSqsIVeq+SDi82MXwLDj3eoqr
 fyJ/G1zsRQVU2+dw8DaR74/pH73qto4SH/R+knPBgfmXzbTTIXZOei3EkLo75ZvcNmv0
 1PK/qUKBydTBQkDDK8Yy76G5o/leVCFleI2N7ujSlWxtcUEHqau+Q+ZDtdOuoX77XviS
 cmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=GpApgx8b9AgUNFAkG6kc5llRRqd5ul9pizwxe3QSaYk=;
 b=pbqbcGnAaRJ6A70K0Sl4mYIs+sGyTZsQDqrz/tUlsgN1/5ZkanC+XbEYqChgU8ziWn
 wxa8uyPDIpWHHJIjW4dcyUmtTHycDHcQqO2aEk/Ic8vz78FQLeCPTOEtRmIH7PxZHLUp
 idK0lQ825DOYc5Gtsgx3zgo3FZlDW1siNPVzfr3nVWo+l4SVT7w4hL+vQlUbWMjgwZCG
 JJxrk08EiJ/SMZm7nCj4WpdtHdFBQ1PubqOuuM8l+2ysPGaXFrjRVo00iVjd4C2+PSS3
 OD8ZdNT9YDc330zLPMvQ5MpMYamG8HHmkvE3Gf4Z497rNKk6rmgIFSi8QnFiiMoXQGuF
 kmjQ==
X-Gm-Message-State: AOAM530J4+whePxoisIxCpaO5j9dJl8N3HUY56yEXATrTSL3LDtZAUiL
 +ZjfMKs5fn+W6SFOYDXOr5tnJg==
X-Google-Smtp-Source: ABdhPJzpdVadqwzrdRzCMj6bpm65x4O5fh4GT5JKas1veZamJrU4N8PwpEn0SfNNAt6AnWVmngySvw==
X-Received: by 2002:adf:d091:: with SMTP id y17mr8400229wrh.418.1637063545086; 
 Tue, 16 Nov 2021 03:52:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z6sm2948660wmp.1.2021.11.16.03.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:52:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CBE31FF96;
 Tue, 16 Nov 2021 11:52:23 +0000 (GMT)
References: <163662450348.125458.5494710452733592356.stgit@pasha-ThinkPad-X280>
 <163662450891.125458.6706022775465303586.stgit@pasha-ThinkPad-X280>
 <87pmr6j0w6.fsf@linaro.org>
 <b7bcea58-0f1f-d641-06ae-72d47e8f2318@ispras.ru>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 1/3] icount: preserve cflags when custom tb is about
 to execute
Date: Tue, 16 Nov 2021 10:57:12 +0000
In-reply-to: <b7bcea58-0f1f-d641-06ae-72d47e8f2318@ispras.ru>
Message-ID: <87pmr0wc5k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:

> On 11.11.2021 15:20, Alex Benn=C3=A9e wrote:
>> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
>>=20
>>> When debugging with the watchpoints, qemu may need to create
>>> TB with single instruction. This is achieved by setting cpu->cflags_nex=
t_tb.
>>> But when this block is about to execute, it may be interrupted by anoth=
er
>>> thread. In this case cflags will be lost and next executed TB will not
>>> be the special one.
>>> This patch checks TB exit reason and restores cflags_next_tb to allow
>>> finding the interrupted block.
>>>
>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>> ---
>>>   accel/tcg/cpu-exec.c |   10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>> index 2d14d02f6c..df12452b8f 100644
>>> --- a/accel/tcg/cpu-exec.c
>>> +++ b/accel/tcg/cpu-exec.c
>>> @@ -846,6 +846,16 @@ static inline void cpu_loop_exec_tb(CPUState *cpu,=
 TranslationBlock *tb,
>>>            * cpu_handle_interrupt.  cpu_handle_interrupt will also
>>>            * clear cpu->icount_decr.u16.high.
>>>            */
>>> +        if (cpu->cflags_next_tb =3D=3D -1

Can cpu->cflags_next_tb ever be anything else? It is consumed in
cpu_exec() and it can only be reset if we have executed some
instructions which resulted in some sort of helper call that set it for
the next TB.

>>> +            && (!use_icount || !(tb->cflags & CF_USE_ICOUNT)
>> Why check use_icount here? The cflags should always have
>> CF_USE_ICOUNT
>> set when icount is enabled. Lets not over complicate the inverted ||
>> tests we have here.
>
> Not really.

Right this is were the logic gets complicated to follow. Are we dealing
with icount cases or non-icount cases or some mixture of both?

> Sometimes we use non-icount blocks in icount mode.
> But AFAIR they are used only for triggering the exeptions, but not for
> real execution.

Right so tcg_cpu_init_cflags ensures CF_USE_ICOUNT is set for all blocks
when use_icount() in enabled except the one special case during
exception replay where we suppress it:

  #ifndef CONFIG_USER_ONLY
          if (replay_has_exception()
              && cpu_neg(cpu)->icount_decr.u16.low + cpu->icount_extra =3D=
=3D 0) {
              /* Execute just one insn to trigger exception pending in the =
log */
              cpu->cflags_next_tb =3D (curr_cflags(cpu) & ~CF_USE_ICOUNT) |=
 1;
          }
  #endif

which still slightly scrambles my brain because does that affect the
final updating of icount_get_executed() or do we "loose" the instruction
in that case.

>
>>=20
>>> +                || cpu_neg(cpu)->icount_decr.u16.low >=3D tb->icount))
>>> {
>> Is u16.low ever set when icount isn't enabled?
>
> This condition is checked for icount mode only.
> u16.low is not used without icount.
>
>>=20
>>> +            /*
>>> +             * icount is disabled or there are enough instructions
>>> +             * in the budget, do not retranslate this block with
>>> +             * different parameters.
>>> +             */
>>> +            cpu->cflags_next_tb =3D tb->cflags;

Technically this isn't what cpu->cflags_next_tb used to be because the
eventual tb->cflags might get tweaked by various conditions in
tb_gen_code().

It seems to me what we really need is a clear unambiguous indication from
cpu_tb_exec() that the we have executed nothing apart from the initial
preamble generated by gen_tb_start(). If we have advanced beyond that
point it would never be valid to restore the cflag state form the TB.

Richard, what do you think?

--=20
Alex Benn=C3=A9e

