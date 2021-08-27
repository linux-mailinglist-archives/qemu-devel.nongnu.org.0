Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BC03F9825
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 12:35:04 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJZCR-0000u1-4E
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 06:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJZBG-0000Cl-Fx
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:33:50 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJZBE-0008L4-9L
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:33:50 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g21so9229669edw.4
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 03:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k8sUb1wOV2aLnNtv3+9q7Fcr0WXPo/gtpEo8Wl+dXvc=;
 b=q43HsHcMMNJMThX3+AOaEEJJCa6/msp7WyVXC/yiIWh8u5rOPcQPAoitVtZi0Ey2Qu
 0wBpNYqkn4oByQZXTRVe2V45CQKhWe+L25aYFO+l+3MB+4j6GLMiejHYAQuDFgFcHbv2
 EhhLPzCyIL6/DLg3gRxPggLmItNel9P9HkADjgm5I/Q874UJHg7lWbuYfF7C20rB+v2V
 lvHis8KT8mHvmtjsvHwJ3z5STSAdQlNtSTwt0vGcsY4Nj7VoI1UE0t2T696rcsxfjcQ+
 WTogj5aIC1If07MaUOkmpSTKG5Ma9Lv7XZrd1Ng4s5mZUNAR6qCjQQaAG9sonpqgscl4
 ZInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k8sUb1wOV2aLnNtv3+9q7Fcr0WXPo/gtpEo8Wl+dXvc=;
 b=DlBQoKvs36GSIe3CUoKlwbblwm0J+jp3oo/Oazz+OeCjLv8LBD7IVycsUdK2A9e0dW
 PmgfdRX1EiCbdoD61k5ZQMrixz605G3ckwn6Qashu7rNXRf5SlNrQTb7E1qcyMGCSj6W
 6c7kb3fzB5jEiLDClIka2UBqMGYEH+yizrs4AUCuG8LztZgRI7g0kyKJX0rAWKcCuzua
 NtWILn4z61y/fudvbY2uBZ4K1b2TN1RwNNauU58uEvcsrmthGjidmUciwQN/3p79td6s
 UAeDGWhBU4xtMnt7q+Zrf5W6ZWbvkv5amXhVrn4JQX6pEyC10hf0S8cb0smghmQFCuQD
 29GA==
X-Gm-Message-State: AOAM530WmhADJ7XGQrt/SmJhR63Bj73qGx/ep6L/V+UhlCvJQ1UFZAqW
 30G8TQo5sQ6PpgDNZJm+UpTvuQeL5KYoEV7qHkiAiw==
X-Google-Smtp-Source: ABdhPJwDAR6OwiJA7Wa1Q9H6suOPiPnCTlSOify4m8uhUZmSEW2X5y0ii3mAcMknralKo1BvqZODBUgTEvM3PKEbPuE=
X-Received: by 2002:a05:6402:4404:: with SMTP id
 y4mr9214961eda.52.1630060426653; 
 Fri, 27 Aug 2021 03:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210827045044.388748-1-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Aug 2021 11:32:59 +0100
Message-ID: <CAFEAcA_213jsO_45iK3a08oj7Tom+LgU_H3kgfjJMOBbtsxrZQ@mail.gmail.com>
Subject: Re: [PULL 00/15] Error reporting patches for 2021-08-26
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Aug 2021 at 05:50, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit c83fcfaf8a54d0d034bd0edf7bbb3b0d16669be9:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-08-26' into staging (2021-08-26 13:42:34 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-error-2021-08-26
>
> for you to fetch changes up to f9dfae9cb6b27649085f662a863f6167650402e0:
>
>   vl: Clean up -smp error handling (2021-08-26 17:15:28 +0200)
>
> ----------------------------------------------------------------
> Error reporting patches for 2021-08-26
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

