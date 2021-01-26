Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EED6303EBD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:32:21 +0100 (CET)
Received: from localhost ([::1]:54410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4OSC-0006Qy-Ay
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4OLx-0003wy-9H
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:25:53 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:35456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l4OLu-000475-LQ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:25:52 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ox12so22975371ejb.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 05:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Tkbt/2W0KW5D6fMTxU3x2svYcTXPbM8IkzjtgmG9rk=;
 b=j7lp40fkn6eObXlj2RBMltBytXdrGdW7TH+M0qOdHVbZkpQr452lu+6z3ok/dedjLx
 AvP+sjwM7WZ4/dm5hZNXO9I8ElY5WTuaz4G1numFBgLNRuqdt0k3ncKRpNSoASzgd7Rk
 BX2R6nOItlxaqlj9Ogno/J77pibwu4a+erJywvesRyITAJ5xOhmh0XcNo3llYa5Ek83V
 rm+Cpg3thvFhN8hV5wN7wAeFpF1Pym0/6ab1QxfGeSboa2e81uJa26OC2c4zfXNfpwQg
 /zai4kr9Lbmrjsx5tVC+zVfvcuOtpT7aTcmKdnwqfOdC6n6E+OYwtyzl05dp7ZVQbd2s
 +eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Tkbt/2W0KW5D6fMTxU3x2svYcTXPbM8IkzjtgmG9rk=;
 b=qjplf4+yClSEVZSRXTScczVCEvhd4p9lZl27exoSw+Q50p0GDosfVWRtPhkQ5I+hzv
 GmsJbfqi8tLmtF2wohnxEJ1CSkwozUr5E8bqGeCDXwAXwpzxK45XJbVyRHC3G0n/Idgx
 kSPO20zriX+SVdjNVPMKbFGAibYVcoME6GIfBEsT9HpWNmk0gXPD5OBjYn8WcfqLzIXZ
 YogqHn9s2MI/fLWagTDxXi+Sdh7PsZ8vXMkCYYN8byt0IFwOopckFJxa9/d4OE0zKKOA
 +kt6BqwCjxW5NBceF9VcRut1HxBhw0ujrgJdkNKdcp56bMJww0ZoBva62epmzjc39inK
 fHUw==
X-Gm-Message-State: AOAM5302cMlQ24qwHFEUmxhS0hrujTlBmSLC8KLfn78nZbEIb4wvXoGo
 WlaqYbf1hUu5kw10OiALYrBewgBwl24DuMVkMGUVlA==
X-Google-Smtp-Source: ABdhPJzzkcMUh6QJn4fk/7AlaiXrtr6TBah2Zxmxse6EX9c3hsnSymUUv/hDCIT8G7xjwXa5XsyrQNjffG4sx90C02I=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr3363645ejz.407.1611667549029; 
 Tue, 26 Jan 2021 05:25:49 -0800 (PST)
MIME-Version: 1.0
References: <20210126020816.352782-1-stefanb@linux.vnet.ibm.com>
In-Reply-To: <20210126020816.352782-1-stefanb@linux.vnet.ibm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2021 13:25:37 +0000
Message-ID: <CAFEAcA_SaiVoX5HsOkOSnPBo4iWrL2WDO0Zjo1staoOV+j0ppA@mail.gmail.com>
Subject: Re: [PULL v1 0/1] Merge tpm 2021/01/25 v1
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Tue, 26 Jan 2021 at 02:08, Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
>
> Peter,
>
>   this PR removes an unused tracepoint from tpm_spapr.
>
>    Stefan
>
> The following changes since commit 31ee895047bdcf7387e3570cbd2a473c6f744b08:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-01-25 15:56:13 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2021-01-25-1
>
> for you to fetch changes up to 68a5b02a4684e6f9bbe5113499f88c0018469d08:
>
>   tpm: tpm_spapr: Remove unused tracepoint (2021-01-25 20:56:38 -0500)
>
> ----------------------------------------------------------------
>
> Roman Bolshakov (1):
>   tpm: tpm_spapr: Remove unused tracepoint
>
>  hw/tpm/tpm_spapr.c  | 8 ++------
>  hw/tpm/trace-events | 1 -
>  2 files changed, 2 insertions(+), 7 deletions(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

