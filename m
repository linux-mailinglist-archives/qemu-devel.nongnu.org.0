Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B64AC40F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:43:41 +0100 (CET)
Received: from localhost ([::1]:44524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH6B2-0000he-Eu
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:43:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5z8-0007FG-69
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:31:22 -0500
Received: from [2a00:1450:4864:20::334] (port=43705
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH5yG-0000vk-DY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 10:31:04 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso8871203wms.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 07:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Eo08Szzn+M+EL8OWj8a5kbpvovDkEP+JSFf1YPHhAfc=;
 b=w3f4YvjIogig69HnczdUkIllOpRE2RDuawe4YVkteNiveoZpjct/YYQ6s0THeywHzk
 i1HaPTjib7CTJWwxC3WzfgvdqIl3HCzAjmPpdVNNcOWU3XcmHEpxUvmDVBxtvplvtJRH
 ACRH6ElJNIngeNdlbiIWQ+5ZFzFSwogFCjJ2Znim7qyAb8NDDoaMDk1E3VBT65bIN3nn
 GMnTHkXG69jbg/Ypv6aDGu+5UJ4mTdJH9MqLvn4Bicl1nQCo7ACMgUR+PjwPw0Iei3FR
 oI2dZTXNnbtr7CW2LanMfE3qFeviy8n3SZVR8Jf0d8bDMjBeHQex7VNydEgdeDxGnhso
 Cwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Eo08Szzn+M+EL8OWj8a5kbpvovDkEP+JSFf1YPHhAfc=;
 b=dCS78Ed7dIx9L3Yucj6Cg4EgpjZ/Gd0LLgoBFpxLNqcajE/i6OQOQ7w1ulBafgBhdK
 TScmJFX09nDxhxHZlU3pmvf0m5Jpg/MfGHYV/r8B6+M7bNI9WftrJhaBUzdlfkVvlR7V
 OEi3SJyCk3iiAFpmJQEMmmZYJsy0AyhA0s/37zuY//Zk2AvcTp8sfAbq344nLdB4AHYR
 Dk+hyxOFKEA6ssMH2YQTB+QIpl3dfa/4OOoA1MqsxoG40D8tPGRTfMgrwZekwSYZeM54
 9vhBVcbUKArEdht8lXxLy4vMzNgcrtyH96oLXW4WpCnSLxTIQuX3SndE9dfBYnls3kmH
 pgpw==
X-Gm-Message-State: AOAM530jTc1Lyc+spdXrMEm+blXSgeaz4GCIoKgUTjJN/uvn2RVWo7df
 +MZGE4FIdc4EYK+h3te+frEe5kEEB9x3x2JxJu9/FQ==
X-Google-Smtp-Source: ABdhPJzY7LNytf8Zh1hZ/l4qgQOyLWid0tuM9bg0Kb6WHixhDMUcyAUIdTW3ACJHWBeiFEgBd3aashRzKzqwnSrZ2Es=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr3337936wmi.37.1644247821080; 
 Mon, 07 Feb 2022 07:30:21 -0800 (PST)
MIME-Version: 1.0
References: <20220207082759.180431-1-laurent@vivier.eu>
In-Reply-To: <20220207082759.180431-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 15:30:10 +0000
Message-ID: <CAFEAcA-H-KNEJueZ=Zb6Fgp1izCHaYRdBGMSH41-77W8wi4X3A@mail.gmail.com>
Subject: Re: [PULL 0/8] Linux user for 7.0 patches
To: Laurent Vivier <Laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Feb 2022 at 09:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-request
>
> for you to fetch changes up to 244fd08323088db73590ff2317dfe86f810b51d7:
>
>   linux-user/syscall: Translate TARGET_RLIMIT_RTTIME (2022-02-01 08:01:44 +0100)
>
> ----------------------------------------------------------------
> Linux-user pull request 20220207
>
> Fix target rlimits for alpha
> Add startime in /proc/self/stat
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

