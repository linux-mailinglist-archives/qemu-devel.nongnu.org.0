Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCD66DDC0E
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 15:27:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmE0j-00014m-8O; Tue, 11 Apr 2023 09:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE0g-00014G-GI
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:26:10 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE0b-0005iL-S2
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:26:10 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gb34so20520167ejc.12
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 06:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681219564; x=1683811564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wb+YGnaty5DSULxlmHSvvk1kuuAwAtd6fHRNzAXCewU=;
 b=b1fNiV6p8A1UIksyvjDbduLrsmFgwPyCtNDQDQMtCcQ/eIk+ZMOj4rUSEihmMH5c4u
 wPFn7lfsg52k8C0RNA/i/mwgAUV9O4sB8zKHa4gyIzUacUiaQUlEwTbtdgjlOp9i2Htp
 hOzc9MzCQLxb5r6h8j5FUuvXAFsPg2+qn5Fri+W52xjGjQVkdnjXbAPV5N/rh7RPpuHp
 aPhspcfToHeU4a5UBbVgeqYKWRUrGZvw0d8p8DOirXoLxB/sU4UMNKLN3aV9nZOipkfr
 YlE14UAihXc1VrJYOWRDsnEqQh1KldR0qVdGFp6cHb1mGIP6MswaxhHPrR8aB4w/dkYJ
 tcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681219564; x=1683811564;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wb+YGnaty5DSULxlmHSvvk1kuuAwAtd6fHRNzAXCewU=;
 b=ZDr/hYxaiLyfPH4bFa4UIgTnneruzYyLFu4o/6x/DwifMKaS4FMGUjl14t7XRXlWLP
 Rwwksc+YYOe+y+4gKeNMrRfOXTv8jpVyLPyBjZGf8M5G9ZQAbPniOmsibF2Fds09LdnX
 aEqdcq3MU1J3TZqES2nQ9wV9qGd3DskFk1VgEP7/oxbdXkkDhJE0QRPXjbY/h8otwzuq
 NOASIMC2tYDPXG3qk0V3KIuJBsLPO59Uvb/zNkDSnkUyLbsc+xtZt1d+2nibrk1JGm2e
 CrKLWT3xK9sP1L7yQKzkBA5GBtsMgCsMNqDvsRbZClJCeHQ8PQx+fBJ8K/6GGn+LF/6o
 bW+A==
X-Gm-Message-State: AAQBX9fO7wMlw0TT6MXBmEl5OPnlzot2F1csMfj7AycEbN5D7VzruFCk
 cTIIjUGcmCqgyATXOV8g55tnjKlLHwnjUzCrSMUung==
X-Google-Smtp-Source: AKy350Yab4gFZbvF0sEUpkqTJKkwjUrwd65/sLjn/XKHk8Q/xY++i0/Kl1CrlZo3SgVBe8WAW6i/dIUeiccAO6BIKPI=
X-Received: by 2002:a17:907:a094:b0:947:f389:58ca with SMTP id
 hu20-20020a170907a09400b00947f38958camr5735398ejc.2.1681219564277; Tue, 11
 Apr 2023 06:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230313151058.19645-1-farosas@suse.de>
 <20230313151058.19645-3-farosas@suse.de>
In-Reply-To: <20230313151058.19645-3-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:25:53 +0100
Message-ID: <CAFEAcA8KapG3-PdoNO+mPdWrbokJ8oWR8J2ZOZzh=Pi65PZ52Q@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] target/arm: Move 64-bit TCG CPUs into tcg/
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 13 Mar 2023 at 15:11, Fabiano Rosas <farosas@suse.de> wrote:
>
> Move the 64-bit CPUs that are TCG-only:
> - cortex-a35
> - cortex-a55
> - cortex-a72
> - cortex-a76
> - a64fx
> - neoverse-n1
>
> Keep the CPUs that can be used with KVM:
> - cortex-a57
> - cortex-a53
> - max
> - host
>
> For the special case "max" CPU, there's a nuance that while KVM/HVF
> use the "host" model instead, we still cannot move all of the TCG code
> into the tcg directory because the qtests might reach the !kvm && !hvf
> branch. Keep the cortex_a57_initfn() call to cover that scenario.

> -static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
> -                                   void *opaque, Error **errp)
> -{
> -    ARMCPU *cpu = ARM_CPU(obj);
> -    uint32_t max_vq;
> -
> -    if (!visit_type_uint32(v, name, &max_vq, errp)) {
> -        return;
> -    }
> -
> -    if (kvm_enabled() && !kvm_arm_sve_supported()) {
> -        error_setg(errp, "cannot set sve-max-vq");
> -        error_append_hint(errp, "SVE not supported by KVM on this host\n");
> -        return;
> -    }
> -
> -    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
> -        error_setg(errp, "unsupported SVE vector length");
> -        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
> -                          ARM_MAX_VQ);
> -        return;
> -    }
> -
> -    cpu->sve_max_vq = max_vq;
> -}

The deleted code has 3 if() conditions...

> +static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
> +                                   void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    uint32_t max_vq;
> +
> +    if (!visit_type_uint32(v, name, &max_vq, errp)) {
> +        return;
> +    }
> +
> +    if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
> +        error_setg(errp, "unsupported SVE vector length");
> +        error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
> +                          ARM_MAX_VQ);
> +        return;
> +    }
> +
> +    cpu->sve_max_vq = max_vq;
> +}

...but the version of the function moved into the new file
has only 2. What's going on here?

Anyway, this fails to apply to current head of git.
I had a go at trying to sort it out but gave up when I
found this place where what looks like it's basically
just a "move code around" patch is actually also making
code changes.

Please can you rebase your series and rearrange it so
you aren't making code changes in the middle of
+700-700 patches?

thanks
-- PMM

