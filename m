Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF953E920E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 15:00:23 +0200 (CEST)
Received: from localhost ([::1]:35156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDnqH-00071H-LE
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 09:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDnop-0005vf-Ev
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 08:58:52 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mDnon-0001jS-QJ
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 08:58:51 -0400
Received: by mail-ed1-x534.google.com with SMTP id i6so3628074edu.1
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9upO3Ph2SuJ26daDkR6ylu/rZtkS4nG+TndSwSADkk0=;
 b=c8WTvpxRzZMrMaLbDk8PQlxruH8qsfNuKsPTuJCu/VSKx2R813Zd0i4oIzVSw9YlZE
 RUrrQhyy8Wkx8014QvvOQ0Ufs8fSa/0ZsLX6zMpr7960DM5S7YC621UxKiADunUK4EuL
 T71RJqrwzUsBZuslAmvqGZT2J0vbT+UF5S4hiCEIbfd1KFnDc8luli3BmGT6hVSidKru
 lzQBgYBjTXCk/yZTXSsHSaN8Usvz3d+/UtSaCVjiJa4nstI+sz3UH4eUxKM0cvug48gu
 USevxO9y1/ysxDV2AuESKISvL0iLTyNZ2hqBmMNP9yvHOP0SM5UeZAoiALjGD659/QhW
 HWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9upO3Ph2SuJ26daDkR6ylu/rZtkS4nG+TndSwSADkk0=;
 b=Gr6/1Hm3utZL/+YZqiDWLTEZ7cvfhB5e6Acq+K+C2k1JA3Kaj1SJtRKKK7+eODYFMa
 UWoGcFU0bgt5Pz28yArueqKAMSrV+uIYMqCtx0qZ91zfBbIa28bBrj8lTT3G1sficdCC
 bRiCjQLDt3iOBEsfGbhNzKl01ysKQGWvXfYWHObDdw7fuUES9qvrzktyN3KjjnvkW1gi
 FCCjwWyk++WGe7yGhixGIYF+nO2JFcOsqFBqWU1zsvrcLyDyToS8EKXXa5GYGSn+fnEQ
 BnYPGAyLlToZtJVa813TSuSXu03fBtX0iJISwo/oCuvhFTayvzYglI03GbaBEUpIrdg0
 wmDQ==
X-Gm-Message-State: AOAM533YsF7F7We0KYxEfiV4GXGDXJa6BgBPldAzX6+SlYsdhhZCR4uO
 1NVR70Hgul835RW63SPFsWV5BcqTxGQqQHjT05VM3A==
X-Google-Smtp-Source: ABdhPJxK0s9IwPqJIr9lkB0Xr2yX3Fn/WMeXq1crpoq7dUo8wwK1w25N3C6mFDIHJttSFHRBC4jW0UGAYdhQ5JFG9gw=
X-Received: by 2002:a50:f615:: with SMTP id c21mr11444081edn.146.1628686727529; 
 Wed, 11 Aug 2021 05:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210811064128.2776317-1-kraxel@redhat.com>
In-Reply-To: <20210811064128.2776317-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Aug 2021 13:58:02 +0100
Message-ID: <CAFEAcA_ig5b86+8NwAkp2rVA=96gOdNBm9ip1ijJRXNuexoOvg@mail.gmail.com>
Subject: Re: [PULL 0/7] Maintainers 20210811 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Wed, 11 Aug 2021 at 07:44, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 703e8cd6189cf699c8d5c094bc68b5f3afa6ad71:
>
>   Update version for v6.1.0-rc3 release (2021-08-10 19:08:09 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/maintainers-20210811-pull-request
>
> for you to fetch changes up to a4de5e8a0667e3ee43ca9953ec7fd11ff19f2c92:
>
>   MAINTAINERS: update virtio-gpu entry. (2021-08-11 08:39:16 +0200)
>
> ----------------------------------------------------------------
> MAINTAINERS: update kraxel's entries.
>
> ----------------------------------------------------------------

I'll keep this in my list in case we need to roll an rc4, but
if we are able to release 6.1 without needing another rc then
I'll just hold this over until we reopen trunk for 6.2.

thanks
-- PMM

