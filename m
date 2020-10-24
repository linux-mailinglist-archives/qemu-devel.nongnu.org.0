Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FCF297A7F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 05:13:03 +0200 (CEST)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW9zK-00086T-JK
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 23:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kW9xk-0007dt-Ns
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 23:11:24 -0400
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:34038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kW9xh-0001Ls-Te
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 23:11:24 -0400
Received: by mail-oo1-xc41.google.com with SMTP id f1so1061957oov.1
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 20:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WfkMD05LlmImOOKa5hrMYhhvN8ZGL5rreXOjIFb/Rhs=;
 b=IB5O9geZAlWNvdo9RlLcgSJUIihjK8EqCBS3dxIpLslK1QjxzxLPHhMYhn65SZcHW9
 mkv+QWuis4RxSiI1RcQhlkuiSzT/DWwtYNY2rQQNbzpLpApyXzDvSLtd/Sfri95tLe3e
 tOlquuh1Df9OdxohATEx4Pwo8NyEfaHXhl3Ko9s0So3oQkfg/pr6gEiktJ6KjiFlbFAv
 frj2wTbLtiPrp0mguhbk6b3ksVpylDST/0setuvPyy/fFriyGyl1mjhAvsYKyD7wwYf0
 8zRhuvCpbB5xnWzSYdTsoJ/WXL8gRj7EWQC7z068HDNYn9nl5oBv9TZBXuIHghyISEgP
 y2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WfkMD05LlmImOOKa5hrMYhhvN8ZGL5rreXOjIFb/Rhs=;
 b=P2V16FL4xa5P5cvx1TLSDTEMVDrLJkvEUTwdrUFO1Uf0kiDeSylCc9Isr9NBq6pw8V
 jDpTon5Sv9KklmiEUnm3n7fiLr+sx92UNz+YTpr38Bar8pXjTbT8QfWA/sVcoEZRaD+P
 uRok2OCMkNvfCP8QfFXjNkYTETEblRALz0aD8GtFnQ69fL+k9gM/oD3TmgmZgxWUU3EJ
 l0okqJMg4peAAr2mm7nYegCd2HYnhQ3h8lCbmQy9dPnHHLSgQrOtBo5qlPL9hbRktZ6l
 AxpBQQflGvavlbpk7kiLtpE+dSvsm75DciA0oxtolZ0ySwfGerMTr0kc2kgO749dDpkb
 TA2w==
X-Gm-Message-State: AOAM532qWrQYnpiekSO2cLms9mu7Hy+xbuc+DLsImlaF16c8Zx5vBq7C
 vXb9Qimj5rT8cyH7iJiQc7lWHpgtEj3tsDCYwvU=
X-Google-Smtp-Source: ABdhPJwr5QNvWLz+3fkPfRfQTMLi8tOESMhDF2pJ+JoP4KE44M7GdPpYZRzIozcbw4gbPYCwcSp6RkchtWlAxW8Rl14=
X-Received: by 2002:a4a:8e02:: with SMTP id q2mr4455001ook.60.1603509078406;
 Fri, 23 Oct 2020 20:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201022161938.7clfymu6a3zl46s2@mozz.bu.edu>
In-Reply-To: <20201022161938.7clfymu6a3zl46s2@mozz.bu.edu>
From: Li Qiang <liq3ea@gmail.com>
Date: Sat, 24 Oct 2020 11:10:42 +0800
Message-ID: <CAKXe6SJOqPZ0EOeGwzoEX8fe6qNGBT+AAezL4mfvbcfynOqYnQ@mail.gmail.com>
Subject: Re: Ramping up Continuous Fuzzing of Virtual Devices in QEMU
To: Alexander Bulekov <alxndr@bu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=liq3ea@gmail.com; helo=mail-oo1-xc41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, 0ops@0ops.net,
 Qemu Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Darren Kenny <darren.kenny@oracle.com>, bsd@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, andrey.shinkevich@virtuozzo.com,
 Paolo Bonzini <pbonzini@redhat.com>, dimastep@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alexander Bulekov <alxndr@bu.edu> =E4=BA=8E2020=E5=B9=B410=E6=9C=8823=E6=97=
=A5=E5=91=A8=E4=BA=94 =E4=B8=8A=E5=8D=8812:20=E5=86=99=E9=81=93=EF=BC=9A
>
> Hello,
> QEMU was accepted into Google's oss-fuzz continuous-fuzzing platform [1]
> earlier this year. The fuzzers currently running on oss-fuzz are based on=
 my
> 2019 Google Summer of Code Project, which leveraged libfuzzer, qtest and =
libqos
> to provide a framework for writing virtual-device fuzzers. At the moment,=
 there
> are a handful of fuzzers upstream and running on oss-fuzz(located in
> tests/qtest/fuzz/). They fuzz only a few devices and serve mostly as
> examples.
>
> If everything goes well, soon a generic fuzzer [2] will land upstream, wh=
ich
> allows us to fuzz many configurations of QEMU, without any device-specifi=
c
> code. To date this fuzzer has led to ~50 bug reports on launchpad. Once t=
he
> generic-fuzzer lands upstream, OSS-Fuzz will automatically start fuzzing =
a
> bunch [3] of fuzzer configurations, and it is likely to find bugs.  Other=
s will
> also be able to send simple patches to add additional device configuratio=
ns for
> fuzzing.
>
> The oss-fuzz process looks roughly like this:
>     1. oss-fuzz fuzzes QEMU
>     2. When oss-fuzz finds a bug, it reports it to a few [4] people that =
have
>     access to reports and reproducers.
>     3. If a fix is merged upstream, oss-fuzz will figure this out and mar=
k the
>     bug as fixed and make the report public 30 days later.
>     3. After 90 days the bug(fixed or not) becomes public, so anyone can =
view
>     it here https://bugs.chromium.org/p/oss-fuzz/issues/list
>
> The oss-fuzz reports look like this:
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D23701&q=3Dqemu&ca=
n=3D2
>
> This means that when oss-fuzz find new bugs, the relevant developers do n=
ot
> know about them unless someone with access files a separate report to the
> list/launchpad. So far this hasn't been a problem, since oss-fuzz has onl=
y been
> running some small example fuzzers. Once [2] lands upstream, we should
> see a significant uptick in oss-fuzz reports, and I hope that we can deve=
lop a
> process to ensure these bugs are properly dealt with. One option we have =
is to
> make the reports public immediately and send notifications to
> qemu-devel. This is the approach taken by some other projects on
> oss-fuzz, such as LLVM. Though its not on oss-fuzz, bugs found by
> syzkaller in the kernel, are also automatically sent to a public list.
> The question is:
>
> What approach should we take for dealing with bugs found on oss-fuzz?
>

Hi Alex,

I prefer to send these bugs to public list such as qemu-devel.

There are lots of low impact bugs so no need to prepare a private
bugtracker for the little important issues.
Also the maintainer's decision may take a long time.

For the public issues, the security engineer, maintainer and volunteer
can both see them and point out its
impact more quickly.



> [1] https://github.com/google/oss-fuzz
> [2] https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06331.html
> [3] https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg06345.html
> [4] https://github.com/google/oss-fuzz/blob/fbf916ce14952ba192e58fe855009=
6b868fcf62d/projects/qemu/project.yaml#L4

BTW, is there any condition to join this lists?
I'm quite interested to fix the qemu issues.

Thanks,
Li Qiang

>
> For further reference, the vast majority of these bugs, were found with t=
he
> generic-fuzzer:
> https://bugs.launchpad.net/~a1xndr/+bugs
>
> There are more that I haven't yet had time to write reports for.
> Thank you
> -Alex

