Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880B33FAEC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 23:20:33 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMeWl-0005BC-QK
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 18:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMeVE-00046i-P8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:18:56 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:36560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMeVC-0000N1-Hp
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:18:56 -0400
Received: by mail-ed1-x535.google.com with SMTP id o19so4214375edc.3
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 15:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=veCsjmarPCtXyFLPK7gQgCo+qljPnfeyhsL32JNZMBw=;
 b=Im8S1MRNk7ukjjwcUOLD9yYBmfwArdmyHGOiS1goxgFt0XYKNoQY02J0WMnPTgzH4H
 UoXECPh4BxVmQCMTGNFiRDS0SpPEwbweKzxJ/cw6sQvVdU8RjalFrkWUVtzCdWijqDCs
 BriKahQ3hbtYTIsfPxPoYo0SU3MJRqnHRXXftvuaCGziK4lhtjkh8IKaxyXTLp3ns3O7
 ub4VAt/WiImASClHswEYD3DcVqkWz34773gl0CyB2rys9SPbeewlUS4fxoAcKC5XYbrX
 xkxI6W4St/LuSP2TGZ1DmcVRpkDkKU9POj65uJ1BxjG9n1tv4WevZRtnmauxWPuBuENg
 2xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=veCsjmarPCtXyFLPK7gQgCo+qljPnfeyhsL32JNZMBw=;
 b=obVuzN9k6p1nzLRtvAASMqcFDx8Sf1rpGujGY5f4+isFWgasy9HFRrQr+kQ2TLTXcT
 JDKbPRaYhpgTDI5H9PlTHbaKpTlF3ar71jzpDZMO8VW0ipPBsGewYMLpf3Ct3QSBkPcf
 Yxd5zR2tZ75zqaZwiRR/gXCj7rduGP48/ceV+/stJ2TpzQuCwi/Zgyvj+0qTFxqZFWB/
 9SVuQa6U87avuFwc1XNcIGp9DiAdlykgOpm5aPQOAvlg2iP4ysSRBOjfKQJUN9lYb0NS
 UU2yszUOEnzdVz6MhFq+74jWkBPprR87ZtR3EXxZWnGFBeCvJjzXljznW7HXVYBOLewV
 rKWg==
X-Gm-Message-State: AOAM531OQ8jBXa3KqqT7meCT5aq6z/q8VIbIxkKP+438isRtttnrupi8
 X05XDrwr+auXN3+Q68AQ8pTo72po2g9dulu8YPAwxQ==
X-Google-Smtp-Source: ABdhPJwM57MJZ4X5MOHRHx1/cnXcQsDI/FsWhxTZnoDTq2Xcm8CYPUW0FUfFKQAHShodHZIz9uwDbbaA2rXkuauivVc=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr44022913edt.251.1616019532418; 
 Wed, 17 Mar 2021 15:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210316203946.21761-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20210316203946.21761-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 22:18:28 +0000
Message-ID: <CAFEAcA_4Dok+j1X-YYQs08i8RxtivqVdeQoF_jm-T=xJ96yvBQ@mail.gmail.com>
Subject: Re: [PULL 0/1] qemu-openbios queue 20210316
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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

On Tue, 16 Mar 2021 at 20:39, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 6e31b3a5c34c6e5be7ef60773e607f189eaa15f3:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-03-16 10:53:47 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/mcayland/qemu.git tags/qemu-openbios-20210316
>
> for you to fetch changes up to ee2e67da8f882fcdef2c49fcc58e9962aa695f5a:
>
>   Update OpenBIOS images to 4a004110 built from submodule. (2021-03-16 20:03:00 +0000)
>
> ----------------------------------------------------------------
> qemu-openbios queue
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

