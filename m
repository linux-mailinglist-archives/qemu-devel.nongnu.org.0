Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D99F56076B6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 14:11:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqrv-0001pW-TB
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:11:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqhH-0004nv-EF
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 08:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olqh9-0004ip-5i
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:00:11 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olqh7-0006fn-3E
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 08:00:10 -0400
Received: by mail-wr1-x433.google.com with SMTP id j7so4533563wrr.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zAziDo2aeaFxhi5vHKS0IxqsHojwirApCigOxIhJRfI=;
 b=tEvyluPcW3k7Smepc8FcK4d8Tiyz3z+dsPrbaKb9y3x3EXuIGa79fHspJ9v/QnalMA
 D9DfaRwh4LbF2qhcJF/zjCl1w1Mel2bZ1U6sfnW22VxJhd+QvoRQMd2FlaVZX6atrirB
 8/IXpVB0+dRLZ56BclnDcjJ4zYLM7O57/+tUEQmjWouQ8eMiS5eIQETULddrcWCrjRmm
 fgDpNJx5pCe3yDaB/BSW08ShnTm3o0S+Hn7Egq03CztyMWJuheEJVTmf1cfUgnYRrrXy
 6yHN9m0tUg/s5TU7d+1+AEOPheVGSXG2UYCcaJ5MEGymPfqsMByB2Cs2fKoXg/x2pK3U
 ZJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zAziDo2aeaFxhi5vHKS0IxqsHojwirApCigOxIhJRfI=;
 b=Wbf/7dnrvpQOrS+MYB5SJCUqHc1ZeJhoHfGgLgm26PS6kBKn8xTu3SCZr5nnAkniyQ
 +8SHfb6W/TGXzktK5OCafa2Hn4Xkxo5s+ug+Hnu6eYH36JCryxkGcsUWLFiQClU1dzsb
 7gwnDq+w5/2bsVorCJdAQsYHsLKW/mojAxbauanNGlys03fRBeMn3Zz/ah+g3wEqv3S5
 8AWKKF5jjpeR82G/ZnFUfDUrChsUjNjJC8lki/Kw7+D4Wvn2XrlMTigRHTIRLwKLdBUb
 5vrRVXuOfdLEww29XdPvxPjNlWI4De4jSpuNXHYLJjoyPAVldO+rEJsBIhXiwHZTvexY
 yY/Q==
X-Gm-Message-State: ACrzQf0dUy3VI8XOzlrGhLcJaiIuFXD6wuVc8BMQccROKKIJlzBP6ONx
 YAxVoRjn+gvOuacU0CkLeY3Ukw==
X-Google-Smtp-Source: AMsMyM4cht+CAqNm8bQ1MrGQggjwyB1q1RGj24rVlTP+2KPGDrWLTBRWXwUljb2hDod7rxec87YdVQ==
X-Received: by 2002:a5d:47c5:0:b0:22e:6573:5621 with SMTP id
 o5-20020a5d47c5000000b0022e65735621mr11902137wrc.478.1666353607214; 
 Fri, 21 Oct 2022 05:00:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj19-20020a0560001e1300b002238ea5750csm1835849wrb.72.2022.10.21.05.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 05:00:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1F5A61FFB7;
 Fri, 21 Oct 2022 13:00:05 +0100 (BST)
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
 <bleal@redhat.com>
Subject: Re: [PATCH  v3 20/26] tests/avocado: disable sh4 rd2 tests on Gitlab
Date: Fri, 21 Oct 2022 12:59:43 +0100
In-reply-to: <20221020115209.1761864-21-alex.bennee@linaro.org>
Message-ID: <877d0t75fe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

I also forgot to add the import:

from avocado import skipIf

>      def test_sh4_r2d(self):
>          """
>          :avocado: tags=3Darch:sh4


--=20
Alex Benn=C3=A9e

