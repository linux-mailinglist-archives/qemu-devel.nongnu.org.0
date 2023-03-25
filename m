Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54DD6C8F6F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Mar 2023 17:30:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pg6lE-0006H1-MU; Sat, 25 Mar 2023 12:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pg6lC-0006Ge-Vv
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:28:55 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pg6lB-0005AK-CI
 for qemu-devel@nongnu.org; Sat, 25 Mar 2023 12:28:54 -0400
Received: by mail-ed1-x52d.google.com with SMTP id er18so8314118edb.9
 for <qemu-devel@nongnu.org>; Sat, 25 Mar 2023 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679761730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+/zOAqIxdBddMlVwqfaB/GSCMgRgKy0tmyfBZxzZ4vU=;
 b=gQK/QDLYqZtiKcbXXsQEBIQwwFivS2Rf/wDafz0OuBJCWYXsIxLwdXyHyonARRoZN7
 QJFXT/Zoi8/P8oQexK6T1T5HeCrOiAcOUt60i3SvwqXKv8mVZ6X8V/2VmAJQIBHb+qSl
 LoqNTuL2CuxBuaNqLWeqdAhMem15+llX1556gnZiC+4/aKx4A93AUN+3vMqztCn+m1Jy
 zyF0C/2peIEnK7AuQX+gT5XnMp3BM7kDIz2y3DrryhmJAerP7fHUc+zJ98E4MchVCqkk
 gXCTwHFQDu5EvNagNkYwt1x67ZUBODtWO49B3jzctJWh0ig9m/GVWFfxXtz/pOvkw7xo
 1K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679761730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+/zOAqIxdBddMlVwqfaB/GSCMgRgKy0tmyfBZxzZ4vU=;
 b=VU56xZ9Mkp1YfrBVmYG8+h17Rhf3pt4W09uq3aXQhEn2RrqGZcXvVUsvLlIad2lgjU
 2Ve1FZ9WgVx3cinrrgl9iDjsqyJeYZDiV8PKJ3p4hpHCC1FwQy0RGcKPlabFv5UTKsjb
 fv2r8kGqb2kSQwrJCV1FXmPbeJBE/z/iQJifIYfy7cAjOlfGdh1FFI4oXNGuf+SDk9mX
 MDefI3nOatm4BKeJ/rMNV4GPtZLMsqB8Md0W1ac7KfXJVeHvtIlJAWybsALnIrj02IUT
 9X4lYBvDNaokElFPtc0vu5fTPey/6JkMnSzy3L1ozRp0WS9X3fVc4+js8hNm6QWnbMKm
 YVbg==
X-Gm-Message-State: AAQBX9fZgkLbr6RWPX3glJXwwQDgE4RV6SA04D8lWlJwcbUoU38CaQ0N
 8ndYw1mGc3X48VU5EfLs5w5oJgVNgxAx7MAGh5zENg==
X-Google-Smtp-Source: AKy350bhiYM4yB+53uVPiUa5/hWnpb8M7pKoBIodnKAJSUQ+tsAmIsYcZCGabMUzUGIYsf1H4yo1VvcDcacR8mn74Ng=
X-Received: by 2002:a50:9e89:0:b0:500:547b:4e1b with SMTP id
 a9-20020a509e89000000b00500547b4e1bmr3256584edf.6.1679761730487; Sat, 25 Mar
 2023 09:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230322192211.331226-1-kkostiuk@redhat.com>
In-Reply-To: <20230322192211.331226-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Mar 2023 16:28:39 +0000
Message-ID: <CAFEAcA_taUKSWM-T0BNDHGMcbNo6B-N=MA+8f5okm_kv2AR-jw@mail.gmail.com>
Subject: Re: [PULL 0/1] QGA warning fix
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Wed, 22 Mar 2023 at 19:22, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> From: Kostiantyn Kostiuk <kostyanf14@live.com>
>
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:kostyanf14/qemu.git tags/qga-pull-2023-03-22
>
> for you to fetch changes up to 0fcd574b025fccdf14d5140687cafe2bc30b634f:
>
>   qga/vss-win32: fix warning for clang++-15 (2023-03-22 21:02:09 +0200)
>
> ----------------------------------------------------------------
> qga-pull-2023-03-22
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

