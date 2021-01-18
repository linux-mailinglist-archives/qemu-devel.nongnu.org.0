Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7A62F9F5D
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:20:44 +0100 (CET)
Received: from localhost ([::1]:49802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1TWT-0004Xn-3I
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1TVN-00048M-Of
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:19:33 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:40943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1TVL-0005BU-S4
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:19:33 -0500
Received: by mail-wm1-x329.google.com with SMTP id r4so13579082wmh.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=efnu6p2A0jNrbaxm8OQdaMEvl1o4HOBSTosbyVokbgM=;
 b=fbS3tM8rN+/XQPuM1A5HXIvRnNin8mVFVAklm0LcS+gqJLCmKFkM3TFBS2VQAp5A2f
 Uk5s8TdxOHHHRX70foEg4ZjMNK2e55wurvzIRc8jc+0DKp8SQoGJzuTSUjk7rqt4TyQL
 Gylk9feACrMKE/NCTTzd1qy8VvvO/Uxv/x+wCWCPq9LMWW2ev7IvpXtEOehCruQEmrqz
 eOhYsJe3nbUMmnrAl0jsc2RCf4s1H8RMtpuc6EAy6qtC/hQ8JWeoiEvGsj7BaluKUdi1
 q7nLhRO/YZhsMuLL699G519DyurIvR4w2HinVT7Tb2SjLIo/Rp47prLTYM3wGwoa/rc0
 Kgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=efnu6p2A0jNrbaxm8OQdaMEvl1o4HOBSTosbyVokbgM=;
 b=jiMPrIMNejZ+HHl/L3hGDy3rajPGQlA6iQLMpNciTkWp7DfH5SvIgmhbaFnBPpix8P
 eGMLe/Pdrkswaa3rTwwJNJ2fYeTkgj1T+KpXspN6BOGs6s1U+LSDyblRlNCkqMa4Wixr
 ySopNih4YYJK0aUwOPbOJbTx5s2ScS9hZ65mG0lCSjP4ZZsliypqBNH76SyMO0h0FalL
 J7Rbih+CxqBxcjaSm9bqIqmeKTB0WONECdyuF5hyHO6uDSLfkDewLV2sz60veov1APN7
 a89FUqKLbHzq/ObIHfsZjkRSj4iEYug3l+sLix71wxPSDDL94qCX7PBCLHgxvRsrDStl
 D+ig==
X-Gm-Message-State: AOAM530w8YxTxtbM/a6MScLJj66amF8QPW7h5/Go+wBj2dU9suQw5vsM
 jrMzhcpuItGSeCOybjsfpjxSHA==
X-Google-Smtp-Source: ABdhPJzZAAxSvWKCbQTGFvLTmQ03Ha1M7HaOza/9tq0emf/CvnQOuObwETnBqWrW2kGo0spyu7bs/A==
X-Received: by 2002:a1c:2945:: with SMTP id p66mr14413716wmp.110.1610972369699; 
 Mon, 18 Jan 2021 04:19:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g132sm12515301wmg.2.2021.01.18.04.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:19:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D33BC1FF7E;
 Mon, 18 Jan 2021 12:19:27 +0000 (GMT)
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <CAFEAcA9HzF_-HyGZDxLN+2-Ay1rtijqOOh9WJPFS+yyDKLERPg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/30] testing, gdbstub and semihosting
Date: Mon, 18 Jan 2021 12:18:50 +0000
In-reply-to: <CAFEAcA9HzF_-HyGZDxLN+2-Ay1rtijqOOh9WJPFS+yyDKLERPg@mail.gmail.com>
Message-ID: <871reiwi7k.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 15 Jan 2021 at 13:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef68=
67d:
>>
>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-2021011=
3' into staging (2021-01-14 09:54:29 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-150121-1
>>
>> for you to fetch changes up to be846761ca8b5a7e2e7b7108c8c156126b799824:
>>
>>   semihosting: Implement SYS_ISERROR (2021-01-15 11:12:34 +0000)
>>
>> ----------------------------------------------------------------
>> Testing, gdbstub and semihosting patches:
>>
>>   - clean-ups to docker images
>>   - drop duplicate jobs from shippable
>>   - prettier tag generation (+gtags)
>>   - generate browsable source tree
>>   - more Travis->GitLab migrations
>>   - fix checkpatch to deal with commits
>>   - gate gdbstub tests on 8.3.1, expand tests
>>   - support Xfer:auxv:read gdb packet
>>   - better gdbstub cleanup
>>   - use GDB's SVE register layout
>>   - make arm-compat-semihosting common
>>   - add riscv semihosting support
>>   - add HEAPINFO, ELAPSED, TICKFREQ, TMPNAM and ISERROR to semihosting
>
> Fails to build, netbsd:
>
> ../src/gdbstub.c: In function 'handle_query_xfer_auxv':
> ../src/gdbstub.c:2258:26: error: 'struct image_info' has no member
> named 'saved_auxv'
>      saved_auxv =3D ts->info->saved_auxv;
>                           ^~
> ../src/gdbstub.c:2259:24: error: 'struct image_info' has no member
> named 'auxv_len'
>      auxv_len =3D ts->info->auxv_len;

I've:

#if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)

around the code so it won't build for the *BSDs.

Sent v2

>                         ^~
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e

