Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C235316A6A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:43:33 +0100 (CET)
Received: from localhost ([::1]:34376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9reO-0003d2-3z
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9rdD-0002jx-BC
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:42:19 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9rdB-0005PI-Or
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 10:42:19 -0500
Received: by mail-ed1-x52f.google.com with SMTP id q2so3512380eds.11
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PtzmDZbgIGWyp4GoZ08Mi0GTmLYg21t9oB/lKFPBdRU=;
 b=j0K9p/5sDQQ5IsT+85k/3K+2Tnoyo1pQEPai5+wrseovPY8nbaB0H3G/NofCVlG1Uv
 8N+Si9VzS/UKL8JmmiI/EMLomKxbsgSQkWbXFvAJYpbo/4RQ55hjj63Tr0IdDPH4g5LN
 WYqtpBPCnG9Y/6bGgb8jf1HJd7bJKlZi83oJMOkr7j8v+MhwSawl3vpJ24ODoAVapE25
 Kvs17s8r1vHizp2rQxv6z1wpmj3tjnh8Zs21aEwU6FuoTE/wk5MKeSj2EhLFjDQGXyKm
 nzEOab2/UFWmvutCxxhA9JkF5GAMxXLz2Re8fSNDWt288sHj8u/JXYoRPyG9LeFeA8vT
 K2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PtzmDZbgIGWyp4GoZ08Mi0GTmLYg21t9oB/lKFPBdRU=;
 b=VG2o/AoK7bbJ6LJNKZGc/J/CN8fAOrvC2rwiT7DpGGkBKwGyghgqyLEL4/cdK1/IaE
 z79bLPpWcv+CLbuYS4gJ+O18rmoXa19YcDBlosR5BQ2A961zNmDFOOSbapmEdtytV+Wa
 LYo0x0OtUQoBnMktDzdP44P24bR4p0wJVYYH3XmEdVutZjue/0RKclIANuG3Q27kBU3w
 8PHM0bzfgtBHLSOri1g7wTlta48ErwGa28085WS4kjkwKk8R/p85nNucdld0syARMR/j
 Bdw+iL7f6c9SlvShFDOmVrlmswNkf69zkR+4D5l+08bRWrhYBctLppsBfxE4vDRMWTH9
 kIUg==
X-Gm-Message-State: AOAM531Bv7aPkPOBc14FRq/gx6buB4ldI9UDy1c4730A+oAFNO7EjoJI
 phFNLCXnwitoOMgX3HgMcI0z9Z7KXTSI/y+gwdWlXA==
X-Google-Smtp-Source: ABdhPJynAfeK1hzlDDE0t+VJwk65rwaZg9A1waIx7Da6HFNu03fIYC9nVNJjGV38dCDcH1mqkyVrprNrvuLK6U6/oLE=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr3583296edn.251.1612971735766; 
 Wed, 10 Feb 2021 07:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 15:42:04 +0000
Message-ID: <CAFEAcA9-wrLg-FmphRkPVcCY7rrqoQMj-KNbp1EAh2N-0R5y=g@mail.gmail.com>
Subject: Re: [PULL 00/19] ppc-for-6.0 queue 20210210
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 06:17, David Gibson <david@gibson.dropbear.id.au> wr=
ote:
>
> The following changes since commit 1214d55d1c41fbab3a9973a05085b8760647e4=
11:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request'=
 into staging (2021-02-09 13:24:37 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210210
>
> for you to fetch changes up to 298091f831db1a8f360686369f9760849e90dd03:
>
>   target/ppc: Add E500 L2CSR0 write helper (2021-02-10 14:50:11 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue for 20201-02-10
>
> Here's the latest batch of patches for the ppc target and machine
> types.  Highlights are:
>  * Several fixes for E500 from Bin Meng
>  * Fixes and cleanups for PowerNV from C=C3=A9dric Le Goater
>  * Assorted other fixes and cleanups
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

