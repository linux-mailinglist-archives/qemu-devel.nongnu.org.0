Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D723A606604
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:41:00 +0200 (CEST)
Received: from localhost ([::1]:47208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYbK-0006SV-EH
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:40:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYIp-0006Tb-Ev
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olXv5-0005oy-11
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:57:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olXv2-0006uO-FV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:57:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a10so35229005wrm.12
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LENd/EfF5Gps6kBxInjac+xQ5v0lWJCQNQaBbxWBu90=;
 b=tCGXYk/m5HihQXRnTA0g/qdfMxVswAIQbAgrthvjaqro4xz8bps3ZZw3hFr4Ju+i4Z
 0WAE9bR6+/YYvwH7dYTBBLCjGWZbKXd0xqK36ni66NieExac6M6Mip36j3CeUkGDpez4
 eW6lX7RB3Ap4WFK59s0U70Zi4bzVCriTa6OWvQlNroNv4F5yxJpvI+VOIApCeCfjS1Yf
 KN5AG8t8TOJQJJe6oUFjTC5zLqUnsqrmVW7akHEVo3o6MgDxDRdhqB9EfPMWPmZuip4O
 bNdmC3iJPjCq0IZ61ZF6C303Ya9v/HILuC7+4A2Ee1TwIKUW/g8LURVlY15yyWA3DVZ1
 cqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LENd/EfF5Gps6kBxInjac+xQ5v0lWJCQNQaBbxWBu90=;
 b=nsLoHUASf1BBWF1cWwbrILBQe95W0DuUnd5ET+6koYZ87tjsViUuFW0fV3qsewYqzg
 UymewxckB/S3C6zueftwBzT7wctX0y25E0hf7PmVYjmSUQL8Aa5vyQpix8C5ilqJI9Lp
 FIM1n0r0Bz0z8jH72b9JYHLDim2Wuwv1CjOo23xcp+2X4X2EYy5IxQGEzlBC9w6W8Bji
 LAM9wWR9GYfu4FiaNR5Y8kMdVoj0vq8OVw+x1k3S/5sowfnxXwkyV5gX7IztyWBBAxXF
 j7jadtYkywlno5jCAYpcKqTRcTzmCwUmwzOw/sbaIX5n53x8Kav/CT7JCG8Pe3gdwt4n
 0GTQ==
X-Gm-Message-State: ACrzQf3TN4ZdyoTkYsClYIIQhvb4Y+84iwFKABBV4abBBC9AUVCd8/7d
 60IyADLQeLMc6UoOcRAYutrMEQ==
X-Google-Smtp-Source: AMsMyM51yPd1MifkEiMltqVXMr34vti7puRukQFrFxhPyk78UE6JH7rtAYSpCPVbH23Skn6g5HXgAA==
X-Received: by 2002:adf:edd1:0:b0:22e:5257:a19e with SMTP id
 v17-20020adfedd1000000b0022e5257a19emr8785444wro.180.1666281433759; 
 Thu, 20 Oct 2022 08:57:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a056000108f00b0023647841c5bsm1374300wrw.60.2022.10.20.08.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 08:57:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4C171FFB7;
 Thu, 20 Oct 2022 16:57:11 +0100 (BST)
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-21-alex.bennee@linaro.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth
 <thuth@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Magnus
 Damm <magnus.damm@gmail.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH  v3 20/26] tests/avocado: disable sh4 rd2 tests on Gitlab
Date: Thu, 20 Oct 2022 16:56:28 +0100
In-reply-to: <20221020115209.1761864-21-alex.bennee@linaro.org>
Message-ID: <87v8oe8p48.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Running repeated invocations on a number of test boxes show a fairly
> high error rate:
>
>   $ retry.py -n 100 -c -- ./tests/venv/bin/avocado run tests/avocado/boot=
_linux_console.py:BootLinuxConsole.test_sh4_r2d
>   retry.py called with ['./tests/venv/bin/avocado', 'run', 'tests/avocado=
/boot_linux_console.py:BootLinuxConsole.test_sh4_r2d']
>   Results:
>   Run, Ret, Pass/Fail, Time, Total Pass, Total Run
>   ...
>   Results summary:
>   0: 94 times (94.00%), avg time 2.254 (0.00 varience/0.04 deviation)
>   1: 3 times (3.00%), avg time 1.837 (0.02 varience/0.14 deviation)
>   8: 3 times (3.00%), avg time 91.288 (0.02 varience/0.15 deviation)
>
> Examining the logs they fall into various categories of un-handled
> unaligned access by user space and unexpected FPU usage by the kernel
> which ultimately lead to the failure to reach the login prompt. This
> could be bugs in the translator that only get hit occasionally or just
> a flaky kernel - its hard to tell. To avoid these failures gating CI
> lets skip on GitLab.

I've managed to bisect this regression to ab419fd8a0 (target/sh4: Fix
TB_FLAG_UNALIGN).

>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> ---
>  tests/avocado/boot_linux_console.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_lin=
ux_console.py
> index eed4b49e6e..26eaf1a119 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -1175,6 +1175,10 @@ def test_ppc_mac99(self):
>          self.vm.add_args('-M', 'graphics=3Doff')
>          self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
>=20=20
> +    # This test has a 6-10% failure rate on various hosts that look
> +    # like issues with a buggy kernel. As a result we don't want it
> +    # gating releases on Gitlab.
> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>      def test_sh4_r2d(self):
>          """
>          :avocado: tags=3Darch:sh4


--=20
Alex Benn=C3=A9e

