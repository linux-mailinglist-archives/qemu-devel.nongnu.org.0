Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F169E21F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:17:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTSJ-0006rZ-Rr; Tue, 21 Feb 2023 09:17:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTSG-0006or-8O
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:17:16 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTSE-0007zx-8p
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:17:15 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso4949275pjb.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eZaSr6p/WigV9S3zd4nAD9I7Yy+ujBKyZXaSjM8ooak=;
 b=W12+tKs4T0WGCfMlgFz3dSzQNe3rySgr20kK9KX2+XTSXlRn1l6uZPLS3+5nBxM0o5
 SMiofaXsVbIi7mAYSAF6GUrYLqvSROg9daeQBc4YPZqi63L8CBBvnDYgMz4ZXVKgUwM0
 IS34kVPgsolDmTTDRyDoDBBTl1D7Boiri6X2vrWNYi8WN5Hd7KxpWv44FITn/PyHPsHI
 ArL6NtiBfM8p+Db67JXdo2GN5QPIg5REXiW3pyqcNHOf3u42hFKnKez5RxfCPYOqWKXK
 fOnMNXtn53KKU6nFWQ8NeVLvpaOTrQj8BsBi4npiV16T4fvjv1EWB8S7YlMVw8QnLUh9
 x8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eZaSr6p/WigV9S3zd4nAD9I7Yy+ujBKyZXaSjM8ooak=;
 b=wVtLQQ4rTmoHdaovQAT2NCS3Gxmg8jBRMif/+SDi3iY+xYJzetIwShiIKVxMp8DZfP
 H6k+Pjg2fsWk764/yC+VByXoFSHqXMFJwR9+lVkZu8CNmUN8E2YMZCefO0/gu7UGaBmR
 GjZ6RpFbQd8QRAVJ1SackrGtXvqikESYm9N/irjCxlqEJ7SvjawDc6MHkl5MBIUcLwxB
 CBpjoxCRHm7iphFRqDFidZHhnGX5NYtdauAE3+JtBXkvPpr7ucF78TIttRdM8drGT6aN
 fuvMeZlFddG3LeniQwVogFSAS1ty7RCTzMiuf2QBlsD2UjRyNFGwXoXe2t6mq2MJIHcT
 0M7A==
X-Gm-Message-State: AO0yUKXklik5U1cx2V33WpNZYT0A48GNizsNhaSNw3olTcan/a++cDPp
 vDwVj81Qvd+5Bn2cKoDyvUAjZVCBMeP+nEVCJvolpg==
X-Google-Smtp-Source: AK7set8VIGtnBrIYnrw0YIA+QaV0Lh45iuUK/mJru/tdVYAQjQY3OkGE4eJ93tzPaa1CA5AU1xhN6ASPJQqldG66nwQ=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1776771pjb.92.1676989031048; Tue, 21
 Feb 2023 06:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20230217201150.22032-1-farosas@suse.de>
 <20230217201150.22032-20-farosas@suse.de>
In-Reply-To: <20230217201150.22032-20-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 14:16:59 +0000
Message-ID: <CAFEAcA__kyfbPv5tmSTiBJ_O15ND5-QpKpATx856s8XCoUNORw@mail.gmail.com>
Subject: Re: [PATCH v6 19/29] target/arm: Move 64-bit TCG CPUs into tcg/
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
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

On Fri, 17 Feb 2023 at 20:15, Fabiano Rosas <farosas@suse.de> wrote:
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
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> -/* -cpu max: if KVM is enabled, like -cpu host (best possible with this host);
> - * otherwise, a CPU with as many features enabled as our emulation supports.
> - * The version of '-cpu max' for qemu-system-arm is defined in cpu.c;
> - * this only needs to handle 64 bits.
> - */
>  static void aarch64_max_initfn(Object *obj)
>  {
> -    ARMCPU *cpu = ARM_CPU(obj);
> -    uint64_t t;
> -    uint32_t u;
> -
>      if (kvm_enabled() || hvf_enabled()) {
>          /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
>          aarch64_host_initfn(obj);
>          return;
>      }
>
> +    if (tcg_enabled() || qtest_enabled()) {
> +        aarch64_a57_initfn(obj);
> +    }
> +



> +    if (tcg_enabled()) {
> +        aarch64_max_tcg_initfn(obj);
> +    }

Why do this only for TCG, and not qtest ?

>  }

thanks
-- PMM

