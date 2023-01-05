Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B231F65F19E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:00:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTaF-0008Pw-Es; Thu, 05 Jan 2023 11:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTa6-0008OI-TE
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:59:07 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTa5-00065M-57
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:59:06 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso2566854pjp.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kxF5oMuNsZgYKQYpL7WB9UVdCx4v0MGii0zKTUWWehU=;
 b=NDYxpJ9WROc+MBtLlTSm4MBpcS4hSzjW522g6P0k33cy0SXU7QFfCJjZixVf8Garly
 CIb4omWALgAQLhZk1ryPYTAewft6IvHCThEMrIe1QSLjQhlPZgbgoWb5Lvh+xvXQ+DvN
 cbOWshr2MYzUz/H2DgaKJRqBg/aIznxg4fAOVSUGdYag+t8cAwBRJyilCVd6zj4zqfhK
 BG1S0GHNAqfCr38GvzEbzSgNT3XuZGVm0AByz38483VFpW3Ujcf62xL7+2mDvLI+aZCI
 Y5g0Gw+wIeIiKAwm/kCVDFMZkgM6K5lm9ooJsvlA7/b7g5kyVSkzas4e5AR5M2+F0ZZR
 XSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kxF5oMuNsZgYKQYpL7WB9UVdCx4v0MGii0zKTUWWehU=;
 b=66eWojPXKe4lsgq7r6/i11tyizQFbJYD6YXyVtag0Ykfljoa/iYkkmmnV+Jq//qtfk
 Wbzya+mJzIUK6NcLQlj/VFBl78/RuXsf4A11UXGadOCpC7egcue+041OOrXJbt78xMzM
 yh1vKxOoK1iJeXQL+AhbtEOWKQd4vtZHH6oj3DT18hnnW27f4EdtdUgpQdetnRY9c2fz
 Uuiuzw6AiZAmUmWR2IWjY4nLCVefbG8IHDgQghSCFJCo+6A2OJNEdbrXvfG7YW4/idYS
 vnVKvI9COz8MmeEC+gu6Z43sCgF31kRbT0EYPI9kdpGPKF2AB9Q+X+q9QcgKZICf7BDc
 oxxw==
X-Gm-Message-State: AFqh2kosPJjjFpc5DZl4XoZG3ByssyV/Rz/ktPJgrvYhYT2uFC0TXrek
 GQaFFco/Nx3Z1u4QljajPnRbwc4JKuaZx3Y+7zWNkA==
X-Google-Smtp-Source: AMrXdXtriF3ziPfygWEnsLuFYjtysJAwfbaK7WNiMFzdJbbYfcsXZZKP1R4ttj5KkgyLMrD6Ps2Kv1wOcIgIGNm0Pkk=
X-Received: by 2002:a17:90a:b010:b0:226:b783:67f with SMTP id
 x16-20020a17090ab01000b00226b783067fmr454913pjq.215.1672937943563; Thu, 05
 Jan 2023 08:59:03 -0800 (PST)
MIME-Version: 1.0
References: <20230102112921.68077-1-david@redhat.com>
In-Reply-To: <20230102112921.68077-1-david@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 16:58:52 +0000
Message-ID: <CAFEAcA8zzvK5dJbhF5eRh91uRv4MfROEt4NEMvs2tRF=MTUVYQ@mail.gmail.com>
Subject: Re: [GIT PULL 0/4] Host Memory Backends and Memory devices queue
 2023-01-02
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Chenyi Qiang <chenyi.qiang@intel.com>, Michal Privoznik <mprivozn@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2 Jan 2023 at 11:31, David Hildenbrand <david@redhat.com> wrote:
>
> The following changes since commit 222059a0fccf4af3be776fe35a5ea2d6a68f9a0b:
>
>   Merge tag 'pull-ppc-20221221' of https://gitlab.com/danielhb/qemu into staging (2022-12-21 18:08:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/davidhildenbrand/qemu.git tags/mem-2023-01-02
>
> for you to fetch changes up to 6bb613f0812d1364fc8fcf0846647446884d5148:
>
>   hostmem: Honor multiple preferred nodes if possible (2022-12-28 14:59:55 +0100)
>
> ----------------------------------------------------------------
> Hi,
>
> "Host Memory Backends" and "Memory devices" queue ("mem"):
> - virtio-mem fixes
> - Use new MPOL_PREFERRED_MANY mbind() policy for memory backends if
>   possible
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

