Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 072852F171F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 15:02:39 +0100 (CET)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxmI-00077r-3Q
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 09:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyxWy-0005Ew-Mj
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:46:50 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyxWs-0008TE-HC
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:46:46 -0500
Received: by mail-ej1-x62c.google.com with SMTP id lt17so24855872ejb.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 05:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wq+SCJqLuTrqrl4mwPHgIWrt/IeEVoiQhlCKi86qnuA=;
 b=u7qnYq3vL7kpO1rGSt8qL9rD7dPzQGdJWdAV2f9URJm0aorlUzzNr4CAQlXPhkBJVn
 6bXZFvtPJQn3eMb/tyNa+CJkSEyMF+gUDgT0CDH+se7IAhOY6ax1OI2i+VpTP4TvZLwk
 ozFrYr8gAOcdUm2qxWDe4MZ+LDINC8HOXJiwDMkZTjB13Hnaejc6NDCkZwbXE8e2U2MV
 ebIn0gS45ws3NAl3fczWQU+M3jZpPXOIJ5C4D/v7noA4pKOcykBbpGeMJDXxpOKR60dF
 SXX7ZbtKvyCpxBLFFvgBxv9PJmXjrS0xgX3o0fblNyEaGO/OkvhY5g1ySkFH0G+sF9Sf
 dlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wq+SCJqLuTrqrl4mwPHgIWrt/IeEVoiQhlCKi86qnuA=;
 b=s7Xi78RMBcftQmsXanEhYPKo5PANz930hX7erVNFBrPzJpHMnDk8EwaLFF01OUI4dV
 g/EFnqLn8Lq+Hbd6U9JDlORkbB+OQWdMpOhtrKIQX79KA8JQ+ZLor9Cyb93Xiaa8vuCG
 TVaKXCM2F28/puzYQeKK13xIygAUKc/GVzISSXKlXZyWJw+OPC3NgsfGICDPInzwu2ip
 f4U6P76SKjWsKKg+Nd3Q/4Np3Ic/WgKMkG7Z/qBtPFrDl/I2YTHfAjlkvFmGKWDHkoAs
 X+Gl61njQ1jX0f5Hyf7YLzTmP0Td8hO5RFr02Gy4yzy/6tiJRIid8k3e/zgZbYA63rTp
 PHug==
X-Gm-Message-State: AOAM531I2k/C6yK7qlUooXr/t9IknE7iJia+gBajvW2Zbed6fADldYdP
 Eh5jUpacj9pRnfsgjEAy8j9grZdvE7dH3imj/l1/qg==
X-Google-Smtp-Source: ABdhPJzLNkucuJ1rHOexwA0huL6EPO2VBHUNul7W9LpK12RYcGBZrU3vBEaQbq0X0/E1csBbsSLbVuP0Fz7jwexw5/Q=
X-Received: by 2002:a17:906:31d2:: with SMTP id
 f18mr10730832ejf.407.1610372800650; 
 Mon, 11 Jan 2021 05:46:40 -0800 (PST)
MIME-Version: 1.0
References: <20210111134328.157775-1-thuth@redhat.com>
In-Reply-To: <20210111134328.157775-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jan 2021 13:46:29 +0000
Message-ID: <CAFEAcA9RRmZd+b3hUzfpWEbUyd3Qaa_WSvyDAuDbPwHzqKixXg@mail.gmail.com>
Subject: Re: [PULL 00/15] Testing, CI and bsd-user patches
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 at 13:43, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi,
>
> the following changes since commit 7b09f127738ae3d0e71716cea086fc8f847a5686:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210108' into staging (2021-01-08 15:37:04 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-11
>
> for you to fetch changes up to 2ee8a60bc51af853b2adfb581bf106b0db109dd9:
>
>   fuzz: map all BARs and enable PCI devices (2021-01-11 11:38:15 +0100)
>
> ----------------------------------------------------------------
> * Fuzzer improvements
> * Add OpenSUSE leap to the gitlab-CI
> * Some fixes to get our CI "green" again
> * Some initial patches to update bsd-user
> ----------------------------------------------------------------

My scripts report:

[staging f3ea435b40a] Merge remote-tracking branch
'remotes/huth-gitlab/tags/pull-request-2021-01-11' into staging
 Date: Mon Jan 11 13:45:40 2021 +0000
Cho, Yu-Chen via (1):
      gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
ERROR: pull request includes commits attributed to list

Could you fix up the attribution in that commit and resend the pullreq,
please?

thanks
-- PMM

