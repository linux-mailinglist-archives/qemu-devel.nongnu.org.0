Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10FB68ED2B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 11:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPhrt-0002Uq-0S; Wed, 08 Feb 2023 05:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPhrr-0002Ud-8c
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:39:59 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPhrp-0003VC-JU
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 05:39:59 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so2007210pjq.0
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 02:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RNVcg9y8l3RvLmTrQzGV+/OF8yIa5Tllsgdtae0fjDE=;
 b=sKssWe96wkApHopZFRR8a56QYYxdbDvxeCxokHdJ4ARNafGDhcMTRDGwQkr3A/Dd+4
 cn4TXSU8hk86tpMll/gM7LCYWTmrQ1t04Aaj9IIzeQPyA88iVYTdecZrrYvAgho49rz+
 MQ09SNSAnLiNQ9RaUFW4A3NQDniWGGrLh+PH5ph6NJvsc3WHkW5F0oQsituVepqgjDlZ
 RCRTyVS+o5bGhTJFZR57r9V7/nA+9FlXubm6E8Rlhy3VT9wtPAt5fZv7o8is1UXffOzW
 PvXALSNMyBfX0J7lfeDmg5S1T3QJQ6eCo8ffyuHSL34vtdY4lUUBVv9xM/Hije4NuDXL
 pEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RNVcg9y8l3RvLmTrQzGV+/OF8yIa5Tllsgdtae0fjDE=;
 b=Ok4JjXwOT3lerRx3e9vrpXfexXW4soGJp0Qwd6FcT6DmS15DX2A6L9IhmnbqraKLy1
 O3FAwMgcOe40G/5xagTY/5WY2zh4MjJOrYSc2DGm4MEcIU9Tu6SVaG+UVPAcbMv8eUpK
 GSP0CKmENVj/WYNbF2XPfbXyS9eDGvP/OpDONxMxOxqvsUVAp3POSWCG2zYCzuNWvQQJ
 YCZNpjSj/g+diskfXwKPtRfpnI4FAejqjKtBC3To8qbm/nUleQra/UwQ8VlZPNR0ZJ9M
 YwH1CeydhB7E2FkhbskZQI6ResXqFLBBIC9sqpI1u11MJGxhuuRow73VvUbL+mQpELW7
 3avg==
X-Gm-Message-State: AO0yUKVvczDWmutjIXaBQrdjsXfNNrxOjeTki3yqqwI1jSXcZCXhmiS8
 yxJK9MugtBqF2dFMDTKV1r13EGUBiO5uaTRYoZHj7A==
X-Google-Smtp-Source: AK7set/k2/W4qRp4QCPUGb5c3C7vpKm7MYKTYlf/I2nvcf1LbSBZVWD9APH9lPYysqgirf+p8fMwjNdXOGlVQLC1V7o=
X-Received: by 2002:a17:90a:d353:b0:230:c24b:f22c with SMTP id
 i19-20020a17090ad35300b00230c24bf22cmr637955pjx.53.1675852795975; Wed, 08 Feb
 2023 02:39:55 -0800 (PST)
MIME-Version: 1.0
References: <20230207113807.67322-1-pbonzini@redhat.com>
In-Reply-To: <20230207113807.67322-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Feb 2023 10:39:44 +0000
Message-ID: <CAFEAcA8XBgA3gLs7EAp4XRsYnKaYBGAzNAaFdBPgWs-XUDvDOw@mail.gmail.com>
Subject: Re: [PULL 0/5] Update CentOS 8 custom runner to use Python 3.8
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Tue, 7 Feb 2023 at 11:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit b52388129bf0097954515c097e83e6112de1b579:
>
>   Merge tag 'pull-tcg-20230204' of https://gitlab.com/rth7680/qemu into staging (2023-02-04 19:12:41 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream-py38
>
> for you to fetch changes up to 11b4a4eeec6054161aafdcb2f2faeb7c6ff36c99:
>
>   scripts/ci: bump CentOS Python to 3.8 (2023-02-06 13:21:28 +0100)
>
> ----------------------------------------------------------------
> Update CentOS 8 playbook and CI configuration to Python 3.8
>
> The playbook has already been run by Cleber on the machine.
>
> ----------------------------------------------------------------
> Paolo Bonzini (5):
>       scripts/ci: remove unnecessary checks from CentOS playbook
>       scripts/ci: support CentOS Stream 8 in build-environment.yaml
>       scripts/ci: add capstone development packages
>       scripts/ci: unify package lists for CentOS in build-environment files
>       scripts/ci: bump CentOS Python to 3.8
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

