Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1BE3B5A7A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 10:28:24 +0200 (CEST)
Received: from localhost ([::1]:46372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxmcx-0008Vm-WB
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 04:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxmbo-0007m7-OS
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:27:12 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxmbm-0004rX-Sk
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 04:27:12 -0400
Received: by mail-ej1-x62b.google.com with SMTP id hc16so28404342ejc.12
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 01:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z0JbD0PNxCQmWjmwksoW/BsRDSTyaoTXYtQvaLezEFE=;
 b=dmt/D8M+O0eoWZk4wx5Y04uGskh590Jm88b2WYd7xh7BrIlgTK3oDwwESLXFkzwn9F
 gSYowU7JSrggBCetgrq1u+oiB924Lo7HNmSPZG3Zgqbglln0VzcMW2gIumKhIII+nq/Q
 xMFAW6G8Eujs9vCRPbkM0VUqzRUyXtVZNn6n90BxwJyrpE3fsMOraL6Z4Nm6s1BGad+c
 PN2fQG5dspZKynX4Zlb89nznA2YJLVowbHOFciHABrRzSTkrmTUGYJX/PoyCvaCHLb9b
 /08B9Zukf6d3LltJClLL58dv9K5cbcdI/TPZI/KaX37gy4ippLmoRdhrV1kJOI6iW/BX
 SKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z0JbD0PNxCQmWjmwksoW/BsRDSTyaoTXYtQvaLezEFE=;
 b=WCu6DHtS/GYymCigUI/9kVlNw+0cdP0WsMqj3DsKSthuz+cQ8dFRtZ1WJxD9yWUree
 rkqaFxgwHVmsY92qrYrXE9DyUSm/TixPgcRF5Snn/t+7EtdhBCAjzINCgW0PHCAdvk0c
 v2gcaPxTHtbALV+LFb2HCt+YHJ/hGKoG0tIImaAjVBw0K/V4Xe4OWIMLubl7BvLPGONy
 1OJzfG2hzff1Yh9kgzKelx4kJoGulH4o9ohYoLfUSc9PzfmbGyLMrM+auPbrjog3FGvm
 tGvs2JVooKpiL9uGO+owAD20Dghq8pdcV5nK2ks+YeBlPjJK3M8JzaD9UdrKkqqUPRVP
 EFXg==
X-Gm-Message-State: AOAM530yZiVfPX+7aANcefnXBjHd6sWwZ1uFj8R5+PU1w+FqnvVGvB1I
 85MpZZVZjY82mIMdgfGMU/i94orgMyDgI016LTlTsg==
X-Google-Smtp-Source: ABdhPJwyqqWMLn/QRTDOR8EKtR72qevsnOGDwqht+1omYvQf8VoUs/rlruKgRDU/LE+nuZYW/iGYs0ejFmZzzNNYp28=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr22721448ejy.407.1624868828405; 
 Mon, 28 Jun 2021 01:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210624121639.2422367-1-kraxel@redhat.com>
In-Reply-To: <20210624121639.2422367-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 09:26:31 +0100
Message-ID: <CAFEAcA-i6MWC-xtonO+HpX9Dy=B6Rzv25C2eeZjWpB1x99YjBA@mail.gmail.com>
Subject: Re: [PULL 0/2] Audio 20210624 patches
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 13:18, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit b22726abdfa54592d6ad88f65b0297c0e8b363e2:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-06-22 16:07:53 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20210624-pull-request
>
> for you to fetch changes up to 60e543f5ce46d4a90a95963b3bab5c7d13a2aaa9:
>
>   hw/audio/sb16: Restrict I/O sampling rate range for command 41h/42h (2021-06-24 11:42:54 +0200)
>
> ----------------------------------------------------------------
> audio: bugfixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

