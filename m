Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E678F31883A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:35:25 +0100 (CET)
Received: from localhost ([::1]:60466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA9Jk-00004x-VN
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA9D8-0000tB-FC
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:28:34 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lA9Ct-0003cH-3n
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:28:34 -0500
Received: by mail-wm1-x32e.google.com with SMTP id w4so5049044wmi.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 02:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JTuBoeDybe99U2vbnSm5SMa4H+2QAEPtPeKaOPws0S4=;
 b=dgIVnRPYaCH7a7w7HaceMwJAa1oBLXFtScich0uTNPTba4YOqDNann6Gjo2JQ7fuRf
 8FvfHdEsu/QedqqCS0Te4aVxiNc+sahtQIb9HnQqgBU2+MuDVc5Etp4HtfZ9darhKEWB
 hgdWJCOHC0swYYz03aB1DYmw9n7xIgz/KvaIRjvxsfmoqrHUC8oheNZ85LwlGMl6URMU
 RbrGUVIskvDtW4JMyGm0uWaUx86+qRMgcluWi/rOUu+B1Ia1kXAv8bg7AffdHTEZWJaO
 KPOT4HmOxPUQkjXZDznGtJC5C7dkrz/MelkMtk9uHQSAttUvo+E3vkAe9+3FqpGxB7UU
 X1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JTuBoeDybe99U2vbnSm5SMa4H+2QAEPtPeKaOPws0S4=;
 b=oIek0BB5J8OcdLxacNXRVo4UWTDVX7qxC32RE4mudNl0Hoz3g9g6uOTSzJgLUQkW6E
 P72e0BeX3qzeyGuVL4z0GmicLpOZTnV7fXxplr0qDF/2cMr3H9EReFf/6NtkcwoxQU9y
 ZcE/qmp0rp7Cx+IzYKvZyq1cfUTVFOLEMKgnaMu4bngK249CBeAO1OBiwt5cuH/l0Fcs
 snFN0JjhOEO+FNKDywRxxchFpbUJyiNyrjE9xGYPwVf70l6ebC3wR3bOM67QltQ7dMjL
 XLCuDasP785wWZKehJKZ7/5d+Tob+WtqV278SB6q6nb6tBg2WcKxe9I6G1160ftQTl1E
 6dIw==
X-Gm-Message-State: AOAM530gG3AiZVJtku/YFM3uMEaoC7LTxAigDwnNvngK5ng76EW9Bpuv
 agKqSB7Eku2xsp66alKxSZiEQA==
X-Google-Smtp-Source: ABdhPJz6+odUNyEmeaBWeOnqv7cALlGvQISkhvwl4gwKEWxobrRLp8w7uHMtiJlKueQmfuRHl3O3+g==
X-Received: by 2002:a7b:ce17:: with SMTP id m23mr4266676wmc.80.1613039296525; 
 Thu, 11 Feb 2021 02:28:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j4sm668575wrx.23.2021.02.11.02.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 02:28:15 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C81FF1FF7E;
 Thu, 11 Feb 2021 10:28:14 +0000 (GMT)
References: <20210207121239.2288530-1-f4bug@amsat.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
Date: Thu, 11 Feb 2021 10:28:07 +0000
In-reply-to: <20210207121239.2288530-1-f4bug@amsat.org>
Message-ID: <87wnveuce9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Travis-CI seems to have enforced memory limit on containers,
> and the 'GCC check-tcg' job started to fail on AArch64 [*]:
>
>   [2041/3679] Compiling C++ object libcommon.fa.p/disas_nanomips.cpp.o
>   FAILED: libcommon.fa.p/disas_nanomips.cpp.o
>   {standard input}: Assembler messages:
>   {standard input}:577781: Warning: end of file not at end of a line; new=
line inserted
>   {standard input}:577882: Error: unknown pseudo-op: `.lvl35769'
>   {standard input}: Error: open CFI at the end of file; missing .cfi_endp=
roc directive
>   c++: fatal error: Killed signal terminated program cc1plus
>   compilation terminated.
>
> Until we have a replacement for this job on Gitlab-CI, disable
> compilation of C++ files by forcing the c++ compiler to /bin/false
> so Meson build system can not detect it:
>
>   $ ../configure --cxx=3D/bin/false
>
>   Compilation
>                        C compiler: cc
>                   Host C compiler: cc
>                      C++ compiler: NO
>
> [*] https://travis-ci.org/github/qemu/qemu/jobs/757819402#L3754
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to testing/next, thanks.
--=20
Alex Benn=C3=A9e

