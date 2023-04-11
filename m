Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362A86DDE12
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 16:36:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmF5o-0000QQ-66; Tue, 11 Apr 2023 10:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmF5m-0000PX-Im
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:35:30 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmF5h-00031r-73
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 10:35:30 -0400
Received: by mail-ej1-x62b.google.com with SMTP id sg7so32347056ejc.9
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681223723; x=1683815723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3Txt+HQpQ8Mj9XB8+cfu2O7Y6JX7xFB30c+4HBEc0Y=;
 b=qNnKuI4bVRG+Yze1xxSxL6INqM4EJRCeSBz2A3KqfgGwIn601UYceNDJ65/JDqDoUb
 ZwL/+njQGKtQN5qyhs6oqHCyXoxmgPSuup8iQII9cyMyw0W0iz0qdcAOhacT0pTFlU2j
 j99nWi+ePKrxS8GCBwdL+RJnc0HLgCv3Gw4dq/fZuSAO0UGvW+LFiYQiuY8br9DzjbVQ
 kdK+jxZ8hs6UkQ6lHSVBb8/Ofs/WV3oZNr1OhMv1vKRHSBJ/czOJAdhXgfPtjRXUIDBW
 JEXAh0Toi6V2rRMQbVewtneTnsScuqJZmeupYrK/60gxG8LPMHlWZd0hcSEKTtbUIGzp
 QZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681223723; x=1683815723;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3Txt+HQpQ8Mj9XB8+cfu2O7Y6JX7xFB30c+4HBEc0Y=;
 b=CPCJPttH/Mhn4Q1LkI7n2fF6DvW83GtgIg3u6PLcPTiIlT9Q6k3XB4bmVIrO+zKJHH
 ZucrpEc8zQfml8oAl5HqQANraiq5EZzOqS9WPbJiojSiW2BJPqk92apctwTu2ObhOocf
 Ly5K4tWKplg1uU9RK5BkMBdENnFdd6k1QbEtglvFCOPXiJe/vcUg5ugUyZzP6Yozj+ml
 TBAcd77NpIlHzvgXpgDKlZlINCLTjWZYwXds2JLKEU3fcf5NEOPWtjeuV7/hxBmbcYxk
 5Ll7VUkUO8FnWHngf8CUt4F9tTVtT2S8/eCUuR8/Nsh+WBlEz1QGjy88HB/zo7qShInZ
 oqmQ==
X-Gm-Message-State: AAQBX9cZ4DdoNmEWGLfB+6prkd7cduYLEZ5jHw1N59dRF4GQ0MEHnNKg
 gceCgFS9WKF/5I+IQOcfu6IOtFhUuSONSKR3YegQTw==
X-Google-Smtp-Source: AKy350Ya/FOtb/RKu8E7+WG9sY1p3h1XruX7gAy5olNZw3A+qo7S5W/KZ769tr1UwCae8KWsft7GgpQDtDWNzrNdfKo=
X-Received: by 2002:a17:907:1628:b0:92f:41e4:e48b with SMTP id
 hb40-20020a170907162800b0092f41e4e48bmr5137574ejc.6.1681223723560; Tue, 11
 Apr 2023 07:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230405100848.76145-1-philmd@linaro.org>
 <42d004e7-efa8-cd94-950b-525eac0d7ee1@linaro.org>
In-Reply-To: <42d004e7-efa8-cd94-950b-525eac0d7ee1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 15:35:12 +0100
Message-ID: <CAFEAcA9knoY=_7+XMtQY4_vxe78MT9+LkYUrLfThVxkVm5trDg@mail.gmail.com>
Subject: Re: [PATCH 0/2] target/arm: KVM Aarch32 spring cleaning
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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

On Wed, 5 Apr 2023 at 23:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/5/23 03:08, Philippe Mathieu-Daud=C3=A9 wrote:
> > Remove unused KVM/Aarch32 definitions.
> >
> > Philippe Mathieu-Daud=C3=A9 (2):
> >    target/arm: Remove KVM AArch32 CPU definitions
> >    hw/arm/virt: Restrict Cortex-A7 check to TCG
> >
> >   target/arm/kvm-consts.h | 9 +++------
> >   hw/arm/virt.c           | 2 ++
> >   target/arm/cpu_tcg.c    | 2 --
> >   3 files changed, 5 insertions(+), 8 deletions(-)
> >
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied to target-arm.next for 8.1, thanks.

-- PMM

