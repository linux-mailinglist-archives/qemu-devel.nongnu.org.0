Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E892B693E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 17:00:20 +0100 (CET)
Received: from localhost ([::1]:46124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf3P1-0007MI-JR
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 11:00:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3Nh-0006qL-L9
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:58:57 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kf3Na-0005GN-6h
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:58:55 -0500
Received: by mail-ej1-x630.google.com with SMTP id y17so24473978ejh.11
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 07:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hyRxqYatZ1gPydt9nPSZMRnhjvKgV58+F+mCc6Avd0s=;
 b=WeS0qCtEBbtscSM77lQSQoY1RRMBqGl2pWliEqMdCe7WvqZhG1U1nJdBjLyKxN5a5I
 wbacm4syZd/zCfgPWz8n0ZjjGzLEv7wAta3bi/qP1j9I442oHDn97HGA55AGkLaAVRBV
 7oJfvIUUaQwtxq2Mrqmpo9jLMvC601B+A1tKp03kDSw6S8Uv1OxGheTqDZ3SUfy+XVF2
 tFZvu2OMc5U7Qj2UaxV53xBLS0x50iMYJubkWI9QlL1MDBQb2SKWlUmfPePH6xt9G5Wt
 3mHLo7KFmlBpMPZMY+VSzk78Mb+Rs1XC7HPbedrIO7afE3eNux6shk51WWvfDeEQMD/h
 vEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hyRxqYatZ1gPydt9nPSZMRnhjvKgV58+F+mCc6Avd0s=;
 b=q4NXNKqWMbaag0DTbHt23QcC0dNaTp5Wg88M3y69sFgArIx/RjrRWYYV0f2pfFXpYR
 PTS55srt67DIw0HBHvc/VPBrS5oqohZ7HYCV8SM25T+MPJK1dVg2+wijrh9pNm5PWhva
 wrhpFFS4aZWLCYvV24GqgEyaNntrhrZiO6J7BqUx8G6tLok00AzJgmY7s6MkLgegL5sh
 pbwd+AVUz6NVbHVwsvkaRvlQMDglD0mytqW1bv3Mp+Tw8md9ZySioCi5Jl/babWMiwZH
 H9hJce2ZJ7DY8uT7cy8nLnOvd3JcPO6sQQ75t9p5rwfQlCJQdjklLjeoord6FEGD1m8u
 1faA==
X-Gm-Message-State: AOAM531aRjOvzZ/79ue1BavFPCNTC3vhXqU4rbL4uGux1MX9+D74UDY4
 /ZZ+SwKLf8n/2ofRWtOzEPDIAYQG5xm1g12dS2IAWA==
X-Google-Smtp-Source: ABdhPJwMo2NPgAT0eyPV4AGGAsIbqitWDzB3BsXwbUgG1F3qYayiYNUit86z1lt/VdFn2VjJnFTDeCG4AiM4KnU3Wfo=
X-Received: by 2002:a17:906:6896:: with SMTP id
 n22mr20925160ejr.56.1605628727972; 
 Tue, 17 Nov 2020 07:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20201117105219.1185736-1-f4bug@amsat.org>
In-Reply-To: <20201117105219.1185736-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Nov 2020 15:58:36 +0000
Message-ID: <CAFEAcA9B4M+aSjD1xkF+LJZrQDhcN2WZukux68ULfKuzyhd-xA@mail.gmail.com>
Subject: Re: [PULL 0/1] SD/MMC patches for 2020-11-17
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Nov 2020 at 10:54, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5=
b0:
>
>   Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-202=
0-11-15' into staging (2020-11-16 17:00:36 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/sdmmc-20201117
>
> for you to fetch changes up to 575094b786e999e5fbd04c0456f518a5ebefab5b:
>
>   hw/sd: Fix 2 GiB card CSD register values (2020-11-17 11:45:13 +0100)
>
> ----------------------------------------------------------------
> SD/MMC patches
>
> - Correctly handle 2 GB SCSD Memory Cards (Bin Meng)
>
> CI jobs result:
> . https://cirrus-ci.com/build/4688743904837632
> . https://gitlab.com/philmd/qemu/-/pipelines/216829732
> . https://travis-ci.org/github/philmd/qemu/builds/744026099


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

