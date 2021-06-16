Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1613A9F1C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:32:50 +0200 (CEST)
Received: from localhost ([::1]:60680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXX7-0002YV-CT
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltXVF-0000E6-Qq
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:30:53 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltXVD-0002r9-Dp
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:30:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id m18so3186457wrv.2
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=NQccwFIO0OM1ujs8phjL0OjFBs1UaibMzCmL8EexEqg=;
 b=aLgA9GF7Cje2djxWQRbWcln2ulhtVZeK8E5IMoncW3TTYsLAfTzeHB4DtZyzFXMalY
 D8TeUAdnS4xWhBDjUAtc2DSLnUQiC4QQXiYoodSqHUo2KH/V5J6PfuDonp9g62nPwY01
 2jskXHRiBhKgQSbOkPYjhE7dBxrwDlRTy29Btyf/TfSuEnnBNdL72Dw+B3DtVLw3TJSb
 eoA0ARWS7ntKV/ZkltwCz9sR4yAdaFGQQAmN2b+7iZrs52+BOZb/5WHQXsx9ex0x7sg9
 xOeiuGES+IomAC3VDQJpJ2McWixYLz+/RI7UFxCJG+CBvYf9sFI1/pypjY4/RZGMG4PY
 SLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=NQccwFIO0OM1ujs8phjL0OjFBs1UaibMzCmL8EexEqg=;
 b=HzNay33TZH8JSyERY+g+rOTQ7mzgEUTNZypsUqGEO5wVz1yfQwLkQyf1Ru8BPwyn7r
 kHjTroGctt0aaEWJX02owQrpTRV/rr8OkdhpR3/IazL7Nl/lpjEJHpx0mPnDv0ldLtQq
 LTCuQw4HkHShXyc5COEhzISbOOyIR7iSW47JYBKLbis7VwzudnriMTMmQg2pIbiJIAPl
 OmgfKcGybBwFoOuNXX2DXujMKy48rTiwbfoyLNoa9ybNH0dliyNv/SChkjfkdUWGRBGt
 ZnSKntpTrn3irQ9Bmfs+XKnmvsc8tNi5GQTpd5ejlpcxKtHwR21pzrytbkw9CzVuRZon
 gfGQ==
X-Gm-Message-State: AOAM532VQ6cWjFxTrPZ6TM9gIgQhQKZ0iYVbfiwdO0EpPGcwTqfoQIlB
 4OGRt5Y9QS9tg1a8LQAeL3fSvA==
X-Google-Smtp-Source: ABdhPJzVCgTi0/OROTcf4XwjLk74g8iZx6yC7WJstWgyUqctqOCCkOoxwOOFRz99D4ivLT9jexPE/w==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr6121596wrt.209.1623857449481; 
 Wed, 16 Jun 2021 08:30:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j34sm2073331wms.7.2021.06.16.08.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 08:30:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 901561FF7E;
 Wed, 16 Jun 2021 16:30:47 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: tb_flush() calls causing long Windows XP boot times
References: <BCB8773B-FC54-4C25-9B60-92C263165D38@gmail.com>
 <CAFEAcA-YuyZ9kyivh1dL_chxrtvBF=jOf3L59JuroL2U-e+Xsg@mail.gmail.com>
 <1ee4b7cf-d445-6497-705f-510009fc74f8@ilande.co.uk>
 <874ke4iqf8.fsf@linaro.org>
 <3D29C466-BB81-4BCA-96E9-A46721B1ED59@gmail.com>
 <d9109542-dd68-3e8b-4f53-a09576e16b1f@redhat.com>
 <87sg1ogsvj.fsf@linaro.org>
 <f81315ce-6cf5-c0c4-5b48-9188e3dcd71a@ilande.co.uk>
 <878s3cjyvl.fsf@linaro.org>
 <4006E151-B420-4925-A6C9-CD036EE559F2@gmail.com>
 <9d0b277d-415f-0f4e-3f09-03445f89848f@linaro.org>
 <e809eeed-c635-c48c-c6b6-9c2d5718b60d@ilande.co.uk>
 <874kdygedv.fsf@linaro.org>
 <CAFEAcA-PafgiZWOi3TvM1VRpfKVRn+L-7bu037nLocSsXNtEzQ@mail.gmail.com>
Date: Wed, 16 Jun 2021 16:30:47 +0100
In-Reply-To: <CAFEAcA-PafgiZWOi3TvM1VRpfKVRn+L-7bu037nLocSsXNtEzQ@mail.gmail.com>
 (Peter Maydell's message of "Wed, 16 Jun 2021 14:06:04 +0100")
Message-ID: <87lf79g72w.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: incoming+qemu-project-qemu-11167699-3xhw7c0pviow7og92yv73e0tr-issue-404@incoming.gitlab.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Programmingkid <programmingkidx@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 16 Jun 2021 at 13:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
>> > diff --git a/exec.c b/exec.c
>> > index 67e520d18e..7f4074f95e 100644
>> > --- a/exec.c
>> > +++ b/exec.c
>> > @@ -1019,14 +1019,13 @@ void tb_invalidate_phys_addr(AddressSpace *as,
>> > hwaddr addr, MemTxAttrs attrs)
>> >
>> >  static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
>> >  {
>> > -    MemTxAttrs attrs;
>> > -    hwaddr phys =3D cpu_get_phys_page_attrs_debug(cpu, pc, &attrs);
>> > -    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
>> > -    if (phys !=3D -1) {
>> > -        /* Locks grabbed by tb_invalidate_phys_addr */
>> > -        tb_invalidate_phys_addr(cpu->cpu_ases[asidx].as,
>> > -                                phys | (pc & ~TARGET_PAGE_MASK), attr=
s);
>> > -    }
>> > +    /*
>> > +     * There may not be a virtual to physical translation for the pc
>> > +     * right now, but there may exist cached TB for this pc.
>> > +     * Flush the whole TB cache to force re-translation of such TBs.
>> > +     * This is heavyweight, but we're debugging anyway.
>> > +     */
>> > +    tb_flush(cpu);
>> >  }
>> >  #endif
>> >
>> >
>> > Unfortunately my x86-fu isn't really enough to understand what the
>> > solution should be in this case.
>>
>> It's not really an x86 issue here but that we don't have any easy way of
>> finding the subset of TranslationBlock's that might be affected. We can
>> only query the QHT for a head address + flags. Meanwhile when there is
>> an active mapping we go through the page tables
>
> Could we do something where we zap the TBs here where there is an active
> virtual-to-physical mapping for this PC, and also make a record of affect=
ed
> PCs (or PC ranges) so that before we add a new entry to the
> virtual-to-physical mapping we check the record to see if we actually need
> to flush this TB? I think if you flush all the TLBs at this point then
> you can do the "check before adding new entry" part in
> tlb_set_page_with_attrs(),
> but I'm not super familiar with the execution flow of TCG so that might be
> wrong.

So in breakpoint_invalidate can we actually probe for the existence of
an active mapping for a given virt<->phys entry? If there is we call the
tb_invalidate_phys_addr as before, if not save the data which we check
when updating the softmmu tlb.

> Also there needs to be a point where we can discard entries from
> our "dump this TB for this PC" records so they don't just grow indefinite=
ly,
> and I'm not sure what that would be.

I wondered if there was a way to use a bloom filter for this? But there
doesn't seem to be an easy way of removing entries once you've done the
thing you wanted to do. I guess we could just reset when all breakpoints
are cleared or we do a tb_flush() for other reasons.

--=20
Alex Benn=C3=A9e

