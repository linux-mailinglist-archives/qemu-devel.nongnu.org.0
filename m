Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9622A8201
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 16:17:51 +0100 (CET)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kah1K-0006Jo-CG
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 10:17:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kah0H-0005Ef-8T
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 10:16:45 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kah0F-0004XH-JR
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 10:16:44 -0500
Received: by mail-ed1-x52b.google.com with SMTP id v4so1940367edi.0
 for <qemu-devel@nongnu.org>; Thu, 05 Nov 2020 07:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mlV7kGW2vHnpGkLyCYRGcedrRFN36q0G3IViCu0s0lM=;
 b=hx1/opR+8nvJHGKAcVrbpS+doKROmdccNTE1JlY/R29QnlkS1z0M/8L+ItJTnhsBFV
 W/eMXLy95CZnlD125NkXJ4Uxi/az6BvT8zL3z56OrzHVmp1fxjcnGH7hpU0NHlps87/N
 aPQOMs+4a3oVXB6zEJmbdhZ0oS8DHm+bXkWFp0gP2AKEZQUXbSlNcGXtinbBmt1A0uou
 kAqNfy30XEBBUIUqNVEp/zQOXp/R+nwjcWtS2m2zVaDb8IQ0L1rPLJXP7mtc6IpYHjZ4
 5WEub/m5y1mr5dSuoGiXV+FjzoNXy6S7DRCHTPJzi4v5NZ0LFl/ExMzj7mKb9/8qeW/d
 DXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mlV7kGW2vHnpGkLyCYRGcedrRFN36q0G3IViCu0s0lM=;
 b=ddwW9R0PUU9Rd+Y6nqUftLY2bTti4dlWiN/QTNvEsrxuR6XsES6MSy1yCiArJHdfkz
 TDgWNXrsvjO3RrPttS+bsYa1+QkDEJAYerxzzEy9RLfMdtuWbxTGZJYYilgCHytHERcn
 7GUyCIUtwG+Ummm7q9bLRkul3Zt2bTslWBMtSpJ/J/rSpxi+yHwFOkFCVoJvqanjdxhe
 mhf0S1/HmAoHqZ9Ysx9PqcFKqtnYyuaVYskU2ef3t1bWm9GKzG6zyL0Kr9xw/t0a9EcS
 sPFqrSOmZ8ckIfJn2zILv34wP3j4f9Ag/uxl0ynSgOy5y4tThl0cr8GRW/aS991lekZ8
 azqw==
X-Gm-Message-State: AOAM530uzOSBHwCO/URiufdz4xMqd3Or+sNj5QmfV6EY4ESW0rVRW70u
 SeX6gYmhAlbun7tJHLaCCKfYZAGtqc1NlnJXg2zRBbBKbwY=
X-Google-Smtp-Source: ABdhPJzwubnWvZNt1NxyEBmEaPXXWhcQlV9fYnvKmC6U3pBUQbBX3G+ruGFKY8AwNHMw8SRp6e1ERdazS9UgZBssipU=
X-Received: by 2002:aa7:c9cb:: with SMTP id i11mr3164802edt.100.1604589402138; 
 Thu, 05 Nov 2020 07:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20201104170414.546578-1-pbonzini@redhat.com>
In-Reply-To: <20201104170414.546578-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Nov 2020 15:16:30 +0000
Message-ID: <CAFEAcA81o5jfPOoLL5nE4Y=5LRDE1DKbXLbBa0=GhE2L98wJPw@mail.gmail.com>
Subject: Re: [PULL v2 00/20] Misc patches for QEMU 5.2-rc1
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Wed, 4 Nov 2020 at 17:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 83851c7c60c90e9fb6a23ff48076387a77bc33cd:
>
>   Merge remote-tracking branch 'remotes/mdroth/tags/qga-pull-2020-10-27-v3-tag' into staging (2020-11-03 12:47:58 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 372bcb2585cd2f06a01f13b1a208370ccf7479cf:
>
>   qapi, qemu-options: make all parsing visitors parse boolean options the same (2020-11-04 12:00:40 -0500)
>
> ----------------------------------------------------------------
> Doc and bug fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

