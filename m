Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C80BE66E341
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:17:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoeC-00031Q-AR; Tue, 17 Jan 2023 11:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHoe1-0002xp-Ka
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:17:08 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHodz-0004UR-1A
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:17:05 -0500
Received: by mail-pg1-x533.google.com with SMTP id r18so22319444pgr.12
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U0S7ck160OChTYQtalHwvMVf9FHH7U/c+TVKdNXO/kI=;
 b=IerS2pgmn6RtT0riu0dw9I30WCr5FmiYXwkmbdoBcNUXLOjwQ4g2vYtDQVbaN6cfqN
 Ioi4iuEXYrMpE/mb2DPsspJ2TjPSOHWxmjA1qXs+djQfAx2vVXMfh8x/pbvCvZ4WLqvL
 p6+3IKY6Qe0UWCcr+uPMDDbBnGX8K/JdhMFL6ns/6Z33jwu8Q1I/bBX5lYO4I+2zum6g
 CVbPekdNDFTEXg3AKyfm6i778D4KSj6aSeL3r1Iwk8YAJG6TaDpiNjgxgDHDchkMEa6Q
 VW7r+8uuSiNnS6aSiIiDzTU+rPlCy6GSjU82RbeHXVu778ftMPtJ4F6Y50LjIJdE8ovu
 Id5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U0S7ck160OChTYQtalHwvMVf9FHH7U/c+TVKdNXO/kI=;
 b=0puqtwmb9eCQAy/deN7NiHIKsq7XP0TC3TqBprouGkUjrAvV5D1txtFaYXagXwmGWo
 PdKRr3k+POeAZb0z27lkbpQCx0tBNkbZ7dlI8em3T1lBBngeNg0x+nLnCx9Xc6yFbsKn
 TpVz7yhG2kcjWEyj4YrS64Rt8F4PVhSiRHoNGQ4ZJsnxflwR2bLhxk1hpT+ygplO/cae
 wybTC/W7vxbDVjUp187wT+hMzUoFtm/R65dHcMrXQogsglU8UQxcs3I0FZLR6zbIWupx
 jBwjtnLylQSyPWIqgGzQ6bEapT3eHPYkJ4mVQy/3poOLBLENNykbV1IrAGI3Z3h4FVZL
 PIeg==
X-Gm-Message-State: AFqh2kryYLaJzk7DZbjL5R3GFeh84RCSbixkJ0UziAcxW0qAUM6m8ajF
 5eGfbiJ3Kh8xFhRaN7E9XSKOqC74eO17Lnth7tkYQw==
X-Google-Smtp-Source: AMrXdXubNOVHWU0kACM5KnXKnpIM8NqjChPqCFUCKZgVUhbzg4g2HqvYphaoiNn+QGNrfytsybcbq+KlivytC6ibwNA=
X-Received: by 2002:a63:234d:0:b0:4ce:ca5c:c472 with SMTP id
 u13-20020a63234d000000b004ceca5cc472mr256570pgm.105.1673972221176; Tue, 17
 Jan 2023 08:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-2-cohuck@redhat.com>
In-Reply-To: <20230111161317.52250-2-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:16:49 +0000
Message-ID: <CAFEAcA9BKX+fSEZZbziwTNq5wsshDajuxGZ_oByVZ=gDSYOn9g@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] arm/kvm: add support for MTE
To: Cornelia Huck <cohuck@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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

On Wed, 11 Jan 2023 at 16:13, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Introduce a new cpu feature flag to control MTE support. To preserve
> backwards compatibility for tcg, MTE will continue to be enabled as
> long as tag memory has been provided.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst |  21 +++++
>  hw/arm/virt.c                    |   2 +-
>  target/arm/cpu.c                 |  18 ++---
>  target/arm/cpu.h                 |   1 +
>  target/arm/cpu64.c               | 133 +++++++++++++++++++++++++++++++
>  target/arm/internals.h           |   1 +
>  target/arm/kvm64.c               |   5 ++
>  target/arm/kvm_arm.h             |  12 +++
>  target/arm/monitor.c             |   1 +
>  9 files changed, 181 insertions(+), 13 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 00c444042ff5..e278650c837e 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -443,3 +443,24 @@ As with ``sve-default-vector-length``, if the default length is larger
>  than the maximum vector length enabled, the actual vector length will
>  be reduced.  If this property is set to ``-1`` then the default vector
>  length is set to the maximum possible length.
> +
> +MTE CPU Property
> +================
> +
> +The ``mte`` property controls the Memory Tagging Extension. For TCG, it requires
> +presence of tag memory (which can be turned on for the ``virt`` machine via
> +``mte=on``). For KVM, it requires the ``KVM_CAP_ARM_MTE`` capability; until
> +proper migration support is implemented, enabling MTE will install a migration
> +blocker.
> +
> +If not specified explicitly via ``on`` or ``off``, MTE will be available
> +according to the following rules:
> +
> +* When TCG is used, MTE will be available iff tag memory is available; i.e. it
> +  preserves the behaviour prior to introduction of the feature.
> +
> +* When KVM is used, MTE will default to off, so that migration will not
> +  unintentionally be blocked.
> +
> +* Other accelerators currently don't support MTE.

Minor nits for the documentation:
we should expand out "if and only if" -- not everybody recognizes
"iff", especially if they're not native English speakers or not
mathematicians.

Should we write specifically that in a future QEMU version KVM
might change to defaulting to "on if available" when migration
support is implemented?

thanks
-- PMM

