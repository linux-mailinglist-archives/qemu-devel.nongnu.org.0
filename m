Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199B530FC92
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:24:48 +0100 (CET)
Received: from localhost ([::1]:42026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kFD-0002Uq-3K
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7jgP-0007gi-3J
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:48:49 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7jgL-0001Cw-5K
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 13:48:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id f16so4017825wmq.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 10:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IavaTd5JlizAcIuHAmC8EXN9WDzsqhQnUQYWWV3gHS8=;
 b=VdcRGSOVcXSi43q0kpZPsFdVkqKv+HhOkWei963l0SyemUuvlxXXjLsXw6DryIf1Qr
 +UNeV9pFGdZ+BV/cUAh1oeboN7NynazObopt8p5/wEKGGDGSIo8flPtMe+oDIdkoQ80V
 q1vMfkvfIokjbCYQBLxYCE/ndcxzePpPq5AbAz+YYcQXhlUusO5pXwcIq759M8zogOsm
 bdXe4m7hWqpMpgwTDdyrbTuSMAXc1TcIxWn0Md+REK8RzFfbw90uANCuJy2JLDH1BVES
 8s9qofrSkm/hPOhdPuICYLSA47to3i3bwsYjHhqeLLIdBT7gZqr07ur1ISVdk1lSWEnA
 xL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IavaTd5JlizAcIuHAmC8EXN9WDzsqhQnUQYWWV3gHS8=;
 b=koYdRlk4ugsQEQ2sG+D3Ut4XmGae6vvO904QS4jOtpjnmzR7Zf+Y4ZSgtT/tmy3bsS
 CQuGcUhYV+KeY0tdKo9vKPIfjjpfwTpcnN3X2+Hxa3d+3CMFig5CmfhxMuhHgT6oHe9g
 +U2I/G1aZj3Yhbpg21ftETg44X7VVaL/OQTTLaneAAqhlPG5ky4og7FP3ts6v+0YfoUR
 tuxxKrhFOqBFWadk3mqIu7pd/bqOze13ZxZ6pOT66sJhKys0QI3RyiRZAY/ZuktwMIK8
 yYwIm3wTibH80pt2E2aWXdbY0MthDUE8yV4cTTdnbeHnigH+d1HRPPSTqESK+jad00UM
 m3aw==
X-Gm-Message-State: AOAM5334b5MrOxwhyQwS6/nCfuhzWTs9vNNiFQ034M6mYZmDs4XACKwh
 sPCACyXbo8ROnthKEGRzTjyHVg==
X-Google-Smtp-Source: ABdhPJylnWi2jVGSpt+flPnPt4ZEYkyiIm98eiK/Rlyv0NnBDAct3zBZAAZcgjFO74ukdIpsLWnPgQ==
X-Received: by 2002:a1c:8083:: with SMTP id b125mr490952wmd.188.1612464518832; 
 Thu, 04 Feb 2021 10:48:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a27sm8856822wrc.94.2021.02.04.10.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 10:48:37 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B57F1FF7E;
 Thu,  4 Feb 2021 18:48:36 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-5-richard.henderson@linaro.org>
 <87tuqrq3hh.fsf@linaro.org>
 <82078884-4213-158e-9e1e-7d9b6b026536@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/93] tcg: Manage splitwx in tc_ptr_to_region_tree
 by hand
Date: Thu, 04 Feb 2021 18:45:09 +0000
In-reply-to: <82078884-4213-158e-9e1e-7d9b6b026536@linaro.org>
Message-ID: <87a6sjpt2z.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 2/4/21 5:01 AM, Alex Benn=C3=A9e wrote:
>>=20
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> The use in tcg_tb_lookup is given a random pc that comes from the pc
>>> of a signal handler.  Do not assert that the pointer is already within
>>> the code gen buffer at all, much less the writable mirror of it.
>>=20
>> Surely we are asserting that - or at least you can find a rt entry for
>> the pointer passed (which we always expect to work)?
>
> What?  No.  The pointer could be anything at all, depending on any other =
bug
> within qemu.

But you do assert it:

     struct tcg_region_tree *rt =3D tc_ptr_to_region_tree(tb->tc.ptr);
=20
     g_assert(rt !=3D NULL);

and rt is only NULL when it's !in_code_gen_buffer(p).

In tcg_tb_lookup you haven't removed an assert - you just ensure you
don't fail if it's not.

>
>
> r~


--=20
Alex Benn=C3=A9e

