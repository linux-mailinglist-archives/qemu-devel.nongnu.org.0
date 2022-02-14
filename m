Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FADD4B55DA
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 17:13:55 +0100 (CET)
Received: from localhost ([::1]:36426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJdz8-0003QJ-1V
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 11:13:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJdD2-0007qE-8k
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:24:12 -0500
Received: from [2a00:1450:4864:20::42f] (port=36592
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJdCq-0003EM-Fa
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:24:11 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o24so24784296wro.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 07:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m8NBf7ZHekZzpePoGX6MjNim0vubBHK5zrqMwbeGY4g=;
 b=sskMdhn18qxKlbv3caHvAsb7N9LbHrYCPDYH0TQH3YN+zDirlzdcc2B54ZNmObKynr
 DznzZ9Zpa+L89OVMl0E9LTiqGqw1msTHB6ikhkNNOfft/cbZaTPOvl5Fq9Gb3DzOUgsp
 rdlq/JH504H6uq4vtGP69sZbLB/l0Apg0zliQ/sm00Wwpz2xadkXi51UCIEqjOJn+Wdc
 nRyc34bpdcr84piXloJO2jiaarBjfbDMBDIyF1O6PwSTl+QBeMpsK9H5eQb3BjXvD0W3
 JFa/X2LUS/7mjVbjOFfoelfctc/G3tfbHaKYRG6cEECsTs5prOM+EL6v73UB5qTsCciy
 yg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m8NBf7ZHekZzpePoGX6MjNim0vubBHK5zrqMwbeGY4g=;
 b=qqT/puONyFhdXrKZQ2ghQN0Nv375nA7V0eBWyokNh+kApEmFmCrS8EdPFWEhBVafuH
 WkhdpWrMFevyI+U4JH2PeOwSJDDjR9SgF0/HqPnjxPTf2SfR9/5nShrrd1oiabHim5dg
 sEY6r7pVYO6C6a2OMrAIxbfmtsv1Nw8ALga7jxAM+FpR3gVL5BuMdqCu6pv/vNboWxRP
 kGizbpl7HPWOtkp6+NMDasaT/nxphZP+PwkSfKBuquf4SH/guyMoNkeifEpcJfDBusYY
 JVnvOH9hXjPCa3OuNplQaK45gAOIBqCMOba4EjjEbT/3X9oaC+ABskzfhtqCQ53zD4Qa
 miSw==
X-Gm-Message-State: AOAM530UkJxUW2r/CVPLlClojxNzI3G3tAO9r+gd8Uea1IOgnnOpXxgU
 fkTuLl/j4fAC4hk3+qAAxI3UCm6FBjFsY025H0KXsg==
X-Google-Smtp-Source: ABdhPJxOapXOJpxrpJ78dIR+tN1euOB6fswO648qKYcrZriaG9xSTiSVXEaGeLwja/3aQ269H+Ql69l6DHppKiMDlGg=
X-Received: by 2002:a5d:4ac7:: with SMTP id y7mr100541wrs.521.1644852237111;
 Mon, 14 Feb 2022 07:23:57 -0800 (PST)
MIME-Version: 1.0
References: <20220210130008.2599950-1-clg@kaod.org>
In-Reply-To: <20220210130008.2599950-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 15:23:46 +0000
Message-ID: <CAFEAcA9Pxv2BiYsA9nd1rq-Xi08TZpVzoEovOi0FR4+QmtGTug@mail.gmail.com>
Subject: Re: [PULL 00/42] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 13:00, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 0a301624c2f4ced3331ffd5bce85b4274fe132=
af:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
20208' into staging (2022-02-08 11:40:08 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220210
>
> for you to fetch changes up to 10717c26dbe1c138ba6af6d09a3bb9958d4fe3f2:
>
>   spapr/vof: Install rom and nvram binaries (2022-02-09 09:08:56 +0100)
>
> ----------------------------------------------------------------
> ppc-7.0 queue
>
> * Exception model rework (Fabiano)
> * Unused CPU models removal (Fabiano and C=C3=A9dric)
> * Fix for VOF installation (Alexey)
> * Misc fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

