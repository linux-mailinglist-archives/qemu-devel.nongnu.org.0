Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34A6DBE49
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 04:18:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plKbn-00082u-Kd; Sat, 08 Apr 2023 22:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1plKbl-00082f-Ia; Sat, 08 Apr 2023 22:16:45 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1plKbj-0007CK-Sn; Sat, 08 Apr 2023 22:16:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 h24-20020a17090a9c1800b002404be7920aso1513446pjp.5; 
 Sat, 08 Apr 2023 19:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681006601; x=1683598601;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TnVBzbCReM+vOVNY8l2dG0DBHMhU6LYE1w3dfohFCs=;
 b=ViMFYgjjJlApO87Fj42ZiaNV0/xax+LornFnYQOLsn9sD/rpqR7BBYhYv/qJ2gQPT0
 SSs4CJz1pDm7l13o+wGNJHhuGEPGLjHdXVU6Bh6EdYIagSmWnc6IRSeq5RROkYOZ7frS
 /7FMX0A7MsmRTDaneaMfVN6l5Zwg4OamobNT4Sqp++4Ru6EE0zdswz9lEUrinE4Usn+/
 UxxwGli34wZwpYeVXqsMxiOHKUXUBKG3b5MIgLbJ9ggL4OfKt+ceNvueB7B2kfYi88pc
 BsHJfZI+tNhpFJPytlMnms+M6oSfDCgueq3NyJ1yqRA0XrHSveVOgmgNu3NB2O5/Y8oA
 ofFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681006601; x=1683598601;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7TnVBzbCReM+vOVNY8l2dG0DBHMhU6LYE1w3dfohFCs=;
 b=nq/cCjXkRpwZEz5J9vt1WzDaFezA/4H5+I8SyJyl+rc2wEbgSF4VDRplzztATyyWAC
 3556M/CLN05gP2EhU3GSvmpf5ZHXvlwjaPrZXqTgRS3n8ZK7y1JccjQt4sJ1gIRxsw5O
 Tz4iCvKOTqZDfO1Ck07LAHJmC3UThHvs3Vvot9BtHznBmA/l9QDB8CHkecfwylEqrC0S
 sIgf9ijg2DkMIeMbD9AcUssGiCYCrnj69lDSIynsPtPPApha92lCHcSpeRcqalfsMt4I
 +VGlAZH2CNtrHUpYj21SUeTGqpiptU7vanIUY69yYHq+GAiLcjno/l0bfCz6f48s/vaS
 GlxA==
X-Gm-Message-State: AAQBX9csS45TAW/9FVRoNdzjdLx3TO/sKUgZC4XBN2SSKfKp1H+kiGfS
 bvo5RsygBUGqYXbj4Kjh0A4=
X-Google-Smtp-Source: AKy350ZZDKIHYltOsbz6eNIUHt9dhxCxPhTw1FjfxV4juSyuSSTlzs+m2tWKGWzaW2cF9aRnD51AfA==
X-Received: by 2002:a17:90b:1d88:b0:23d:2415:c9a9 with SMTP id
 pf8-20020a17090b1d8800b0023d2415c9a9mr8625819pjb.34.1681006601269; 
 Sat, 08 Apr 2023 19:16:41 -0700 (PDT)
Received: from localhost ([203.59.189.25]) by smtp.gmail.com with ESMTPSA id
 ne2-20020a17090b374200b002342ccc8280sm4908438pjb.6.2023.04.08.19.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Apr 2023 19:16:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Apr 2023 12:16:34 +1000
Message-Id: <CRRV3SRW7H2U.14JIRTJFPXRSU@wheely>
Cc: <danielhb413@gmail.com>, <david@gibson.dropbear.id.au>,
 <groug@kaod.org>, <qemu-ppc@nongnu.org>, "Anton Johansson" <anjo@rev.ng>
Subject: Re: [PATCH for-8.0 v2] target/ppc: Fix temp usage in gen_op_arith_modw
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, "Richard Henderson"
 <richard.henderson@linaro.org>, <qemu-devel@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230408070547.3609447-1-richard.henderson@linaro.org>
 <606b0b02-a167-8cb1-db0f-119442d0aa16@kaod.org>
In-Reply-To: <606b0b02-a167-8cb1-db0f-119442d0aa16@kaod.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102a.google.com
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

On Sun Apr 9, 2023 at 7:24 AM AEST, C=C3=A9dric Le Goater wrote:
> On 4/8/23 09:05, Richard Henderson wrote:
> > Fix a crash writing to 't3', which is now a constant.
> > Instead, write the result of the remu to 't1'.
> >=20
> > Fixes: 7058ff5231a ("target/ppc: Avoid tcg_const_* in translate.c")
> > Reported-by: Nicholas Piggin <npiggin@gmail.com>
> > Reviewed-by: Anton Johansson <anjo@rev.ng>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>
> Looks good:
>
>    https://gitlab.com/legoater/qemu/-/pipelines/831847446
>
> I have a PR ready for this same branch. If you want to me send,
> just tell.

Thanks Richard and Cedric. LGTM.

> I don't think we have tcg tests for the prefix or mma instructions
> introduced in P10. That would be good to have.

I agree, we need to do a bit better on ppc.

I'm trying to get a handle on all the tests we have for these things,
I haven't looked too closely before. kvm-unit-tests actually works
well for TCG and I did find some (system level) prefix issues with it.
I don't know if that's the right place to focus on instruction level
testing though. QEMU's tcg tests sounds like a better place for it,
but is it only for userspace tests? There are also some verification
tests people are using for verifying hardware cores.

Seems like a common upstream project that others can use might be
useful.

Thanks,
Nick

