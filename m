Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ACE5F7667
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:44:43 +0200 (CEST)
Received: from localhost ([::1]:59232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjuM-0003Mh-Rc
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjmg-0006cg-6O
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:36:48 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjme-0000zB-Io
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:36:45 -0400
Received: by mail-pg1-x52c.google.com with SMTP id f193so4240637pgc.0
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DH6ybOGZenzJGwWBd9vX1QwVb7S+RbRmRNqrSr+SryA=;
 b=X8ZQ/HvxPiCSQY+fQGp0TLc7SIXItIL4/Rsh12wMH6sWMc2YJhj2VKDgrmrksodEgh
 uRvG4XKCzLeNT4eHGGz5Jez7wT2lECCnxaKW4hrSDk5eWF2O1+yr30NFHT4dglM0tHHO
 +MVr0Em7oL+VvPgK4h019Px5cFJkNqeP/E7gxOwU5Xa2lU633IFe32bNST/6YbUcTAFl
 fLeLgYpyH2LGf/dZ1h7YuGXMXbYMFHuyr+7yZwx+CjRYpu8R59WkNOqtWXKknhUrM5q/
 l2yqombjNEJwPVC1ETMGpuDLoN9PKXeWtMmmOYWU6bevZ0KRmHOcNoeIBBzIsNXRFTli
 cvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DH6ybOGZenzJGwWBd9vX1QwVb7S+RbRmRNqrSr+SryA=;
 b=kE+4NgUrQd9/hN3NP3KysMG05k6YR56Z3IDn7yA3QWVShIVfp+W3BC43ypfinF2kon
 pi7dvJFnUt/w2aaUHL7WZJze8RAF5v9wrxi9Apt4zRR6Ngz0XYBesYG2b+1jXPAFtI5c
 XfdiCXnfg+KTGV7sagXDz0l0om0xaniZ6ygPYi2o+uc+gufdZUpfdrVAlR6AQpF3DvpI
 F2z3I0gsM1Fqm2qK8orpIlU96X/frgCpOYLdLu4CFHFWtRmpn814osFCBt6+p4G7QPk/
 gXOop/+//NDnavAhgbjr6XY5Byl0hn8gtZaIy5HXeP5B2F/lu8+AsXVZcXrxQnzzrTSC
 TX3A==
X-Gm-Message-State: ACrzQf2NBgeyh3SGpd9cTf4GJvmEIZQGjnRjG918476KRTActX3qi0Rc
 jJmrYNHaTdkfBWVHq4OjTetbZoB8rMmqYisPPVw31Q==
X-Google-Smtp-Source: AMsMyM5jmOsTHCxO1WMnp/ewjTXb+LDcfRq70hHOnmdgJxQuR0+Sf91l9GJIFvDQdOfp+pdyMYWov9vsOvwK9OFa//Q=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr3745500pgi.192.1665135403061; Fri, 07
 Oct 2022 02:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-37-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:36:30 +0100
Message-ID: <CAFEAcA-rc-CAri6GQBPVfvK1Lv-4FPCPzuhr+eH+qy8AXnpZWQ@mail.gmail.com>
Subject: Re: [PATCH v3 36/42] target/arm: Add ARMFault_UnsuppAtomicUpdate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 17:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fault type is to be used with FEAT_HAFDBS when
> the guest enables hw updates, but places the tables
> in memory where atomic updates are unsupported.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

