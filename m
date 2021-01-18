Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46AA2FA500
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:42:53 +0100 (CET)
Received: from localhost ([::1]:55106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Wg8-0007UL-T0
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1Wf7-0006bT-0e
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:41:49 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1Wex-0005Lg-13
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:41:48 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d26so16877801wrb.12
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 07:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WP6SJAm1IAdTJ4lSNwJ5i6VyzmfHzDr0uF01SM2ibPc=;
 b=jgbwcAECQHX5NkIVvmGsQQygMpoFyUkcKNNJwHB/ZJezGGytSlHT8A+EuHbTYkLDNl
 g5ZdBasTDJRWG/PMslXyDRa+Z/OK3UObX4TWIPgzvWciA7fRSN1+uRj5rTfoP+4v/nVW
 avJkvek1fcPa9uB9Wd3lM0WNQwvi3Z+12t86mMzgAGfe6WFLLlHT7o2LQGogls64XFLU
 Kc4w89WL62lBfa2lRBOohs+tMSNRB8tD1oWhyV0JKHPiZ6B3he5rZeCGaoghN/EqX5Wp
 ol5HUC0GsRtndCGvdpw7UOmCnVFG3U7zr3KHQ31uM1ARPNSqPkRNR6VNUkG6u07+xOWX
 6QIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WP6SJAm1IAdTJ4lSNwJ5i6VyzmfHzDr0uF01SM2ibPc=;
 b=NqiT2pRsSmUuGZzITadJt0ejQGwKKGE8HLc44wK8S1405w+osw0QAIYJOFGWWajawq
 AgRe8AEegfEA8YII1LlzyNJgNfBLoZJIArwymsyxqPkXJ/juqoM+s/F69eooMYafKOlP
 ukTmr9gvxHbbtxCJsdCOfGgkVM2f9W9JHCjcIJnDeEGmjFTZjCjW6cm52AyWBOpmdGCX
 BRgGoXaGJIseohXmA4PVjIhbJyMXfC73JBQ0m2lGAjjd/lm07JMGT4t+ZlxMfyjhDjan
 BVxbANqeLa81wQfhrs5UrkgGbjqBRjgJ9WQmJXc+2lc4U3VUxUNrXdXaA476hf6Y02J/
 R1lA==
X-Gm-Message-State: AOAM5307MERH/W2W5+MmhdHF1EXE5Ve5Uvk7Sg4TvuDFz3Gv8ZkFWBzt
 WSX4OCSKt6hZpnsVj1v1ByF1KA==
X-Google-Smtp-Source: ABdhPJwlqh6PJAfgIjmgbY+5fuj8XIQi48XGw4VgIXJEoipHRKkSs5HpJkQ4LCYxBk9LLzZW/Ri8rA==
X-Received: by 2002:adf:fd42:: with SMTP id h2mr102565wrs.142.1610984492842;
 Mon, 18 Jan 2021 07:41:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n9sm30089380wrq.41.2021.01.18.07.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 07:41:31 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECEC81FF7E;
 Mon, 18 Jan 2021 15:41:30 +0000 (GMT)
References: <20210115130828.23968-1-alex.bennee@linaro.org>
 <CAFEAcA9HzF_-HyGZDxLN+2-Ay1rtijqOOh9WJPFS+yyDKLERPg@mail.gmail.com>
 <871reiwi7k.fsf@linaro.org>
 <7e22d425-7e9a-afca-e035-f7e56837518d@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PULL 00/30] testing, gdbstub and semihosting
Date: Mon, 18 Jan 2021 15:38:57 +0000
In-reply-to: <7e22d425-7e9a-afca-e035-f7e56837518d@redhat.com>
Message-ID: <87sg6yuuad.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex,
>
> On 1/18/21 1:18 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>=20
>>> On Fri, 15 Jan 2021 at 13:08, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
>>>>
>>>> The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef=
6867d:
>>>>
>>>>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210=
113' into staging (2021-01-14 09:54:29 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-15012=
1-1
>>>>
>>>> for you to fetch changes up to be846761ca8b5a7e2e7b7108c8c156126b79982=
4:
>>>>
>>>>   semihosting: Implement SYS_ISERROR (2021-01-15 11:12:34 +0000)
>>>>
>>>> ----------------------------------------------------------------
>>>> Testing, gdbstub and semihosting patches:
>>>>
>>>>   - clean-ups to docker images
>>>>   - drop duplicate jobs from shippable
>>>>   - prettier tag generation (+gtags)
>>>>   - generate browsable source tree
>>>>   - more Travis->GitLab migrations
>>>>   - fix checkpatch to deal with commits
>>>>   - gate gdbstub tests on 8.3.1, expand tests
>>>>   - support Xfer:auxv:read gdb packet
>>>>   - better gdbstub cleanup
>>>>   - use GDB's SVE register layout
>>>>   - make arm-compat-semihosting common
>>>>   - add riscv semihosting support
>>>>   - add HEAPINFO, ELAPSED, TICKFREQ, TMPNAM and ISERROR to semihosting
>>>
>>> Fails to build, netbsd:
>>>
>>> ../src/gdbstub.c: In function 'handle_query_xfer_auxv':
>>> ../src/gdbstub.c:2258:26: error: 'struct image_info' has no member
>>> named 'saved_auxv'
>>>      saved_auxv =3D ts->info->saved_auxv;
>>>                           ^~
>>> ../src/gdbstub.c:2259:24: error: 'struct image_info' has no member
>>> named 'auxv_len'
>>>      auxv_len =3D ts->info->auxv_len;
>>=20
>> I've:
>>=20
>> #if defined(CONFIG_USER_ONLY) && defined(CONFIG_LINUX_USER)
>>=20
>> around the code so it won't build for the *BSDs.
>
> CONFIG_LINUX_USER implies CONFIG_USER_ONLY, right?

Probably could in a clean-up patch.

>
> Maybe long-term this can become:
>
> #if defined(CONFIG_LINUX_USER)
> #elif defined(...BSD...)
> #endif

Well the failure is missing the data in our own structures. I don't know
if BSD does support auxv, I guess if it's a POSIX thing. I guess we'll
see when we get the BSD rewrite.

> (maybe worth to fix if the pullreq isn't processed,
> else not a big deal).

Already merged so =C2=AF\_(=E3=83=84)_/=C2=AF...

--=20
Alex Benn=C3=A9e

