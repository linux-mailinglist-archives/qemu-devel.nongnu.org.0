Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8F137BBBF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:28:00 +0200 (CEST)
Received: from localhost ([::1]:52474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgn1z-0007BG-EG
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmuW-0005HB-8X
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:20:16 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgmuT-0004Al-3T
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:20:15 -0400
Received: by mail-wr1-x429.google.com with SMTP id t18so23234488wry.1
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Ad+9+2MDnnVuK7GelgJgPn5SudwJaltU6W6vHSgmUQs=;
 b=uqo/N7xc/ULhkrQSTh1QMECLMDJG8gyP3UjVs9svOtUaa3eAp3tAjI+GZgmomcljry
 4dOObT4/ZoMV6FHhrQANP4PtRgqO5XtcM9nuU04NDHeKhxrKD8vCsPws0zabvU+8QD2n
 84Oe+ze7k6SMmTuCnaYSdiz1lc5yQdH8Ame94p4OOUic03sFQjO+PyZZVAi8FopjU14l
 LwruljCc73dgC4E1T3XIzUJy+OeePdIPTb0+uPIv3YBLITHgFxpuoaZZ8afU/5B2DqLt
 UmzV6Dm7t+vDhqINjVyCsnxZNLkv5nkyvkmwgi2ts1YqdCcZv4UA7FTMIFSJqf4oQvVl
 R/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Ad+9+2MDnnVuK7GelgJgPn5SudwJaltU6W6vHSgmUQs=;
 b=iQ9j4u54BCsCtW/2b3yza7k+74uhFH2VgtWefjMLYFwSJwFzmPdOj+3eBA9XPZn0Wh
 E1vfccQoZua75VFqAdnJlYX2TKwN7PZmH4s6UO3HeQeouTmFgjT5wDdWIg5XReclJWi8
 +7N6ktMZbrPNAFQuSZ2PG6te7ct5w0LsXkwjANrWsqRlST7zB6jfoc0AcwHNNp+KTqOj
 mbvP/R1f5l2heUhrBgHXio7VgZliYPc5H0QMwV+Tac9vGXzdpGA5PPk5EzWqqZzuMXXA
 AIAonBU80uBJfYhk66PIPvplVSwqDqTpe6g5Pl9dI9yesR+Dt6iQb3xGP6c0cseEq3pe
 NyQQ==
X-Gm-Message-State: AOAM5338NcZz/8BZgrkF/T74OpUeAzcq6BmY6zIZQiFPf7XMt6NoJIfc
 QFPB8SR73lXju/0JLw0PDsMzvA==
X-Google-Smtp-Source: ABdhPJwR0VNCITjtC3B7Im2JLkOfJ1poR6GH/OLtHnCUCLENTO1Y7ulmPpZLymoL5yZunSa5DrNyuQ==
X-Received: by 2002:a5d:6d8f:: with SMTP id l15mr45218594wrs.313.1620818408976; 
 Wed, 12 May 2021 04:20:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 61sm33805501wrm.52.2021.05.12.04.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 04:20:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E35581FF7E;
 Wed, 12 May 2021 12:20:06 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-4-richard.henderson@linaro.org>
 <87k0o6yc74.fsf@linaro.org>
 <90dc8203-522a-d3d2-15b8-ad95fd654f93@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 03/72] qemu/host-utils: Add wrappers for carry builtins
Date: Wed, 12 May 2021 12:17:24 +0100
In-reply-to: <90dc8203-522a-d3d2-15b8-ad95fd654f93@linaro.org>
Message-ID: <87sg2sfbbt.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 5/10/21 7:57 AM, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> These builtins came in clang 3.8, but are not present in gcc through
>>> version 11.  Even in clang the optimization is not ideal except for
>>> x86_64, but no worse than the hand-coding that we currently do.
>> Given this statement....
>
> I think you mis-read the "except for x86_64" part?
>
> Anyway, these are simply bugs to be filed against clang, so that
> hopefully clang-12 will do a good job with the builtin.  And as I
> said, while the generated code is not ideal, it's no worse.
>
>>> +static inline uint64_t uadd64_carry(uint64_t x, uint64_t y, bool *pcar=
ry)
>>> +{
>>> +#if __has_builtin(__builtin_addcll)
>>> +    unsigned long long c =3D *pcarry;
>>> +    x =3D __builtin_addcll(x, y, c, &c);
>> what happens when unsigned long long isn't the same as uint64_t?
>> Doesn't
>> C99 only specify a minimum?
>
> If you only look at C99, sure.  But looking at the set of supported
> hosts, unsigned long long is always a 64-bit type.

I guess I'm worrying about a theoretical future - but we don't worry
about it for other ll builtins so no biggy.

>
>>> +    *pcarry =3D c & 1;
>> Why do we need to clamp it here? Shouldn't the compiler
>> automatically do
>> that due to the bool?
>
> This produces a single AND insn, instead of CMP + SETcc.

Might be worth mentioning that in the commit message.=20

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

