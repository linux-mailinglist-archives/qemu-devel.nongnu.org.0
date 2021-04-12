Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B635C87E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 16:18:08 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVxOB-0000Pj-Gm
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 10:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lVxLj-0007rs-FF
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:15:35 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lVxLh-00056W-GI
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 10:15:35 -0400
Received: by mail-wr1-x431.google.com with SMTP id p6so6400961wrn.9
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 07:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RGSeucHlLodGFO4f98Bo18pTtMMaUbXBH/bSyMZ5ye4=;
 b=tSfEeXcdwYFC8ZIcLhVXrFrweMnCtjBohIXlhgb/pH1r2L1xrBIUlfRMUUeRiTnHrl
 L5o3BekYamK1snAmxBn7Huz7SbjWaKQwSTHiUlxvUnxOiHMSbtNI6nmyNsGp3pcKlWcH
 3ooRQXPA4ywMZ335xu4+Pgw3FH9NjYybRBBefpMYUsDSiKT5uk+yCF2YM/NezdTON4aj
 3wXA0KVEZQs2Xwm4Q00iO5d9B/kDChtj6VuEsRMzPzF4CFQVKVIePvBhksIAx8H68Hq8
 RP+H+XEeJgfRLZDSVTEeh2N8E2fvSEorMhefaZJki2Irks4VFE6hUJ+E3JWy6hcTR8h6
 k3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RGSeucHlLodGFO4f98Bo18pTtMMaUbXBH/bSyMZ5ye4=;
 b=s7YJ7apcm9xXFrj/iesPQ4BzQmncbHroHS9goSOilOYo4wKNIe6ns5V3tgaMOvD47Y
 umF082KqN2JSRFDKYUHV2IcpsKEyh9dFexYsRNoo7JcOtsREC54E9QvNvU3BVm63Ig33
 oOGuRaYEZqFiVwf/pwpDU9iVMLYlkrAZSa1qyrHE6WppvxSGvXtCamb0VilyOinj2SP8
 TQiWI0RiXkZJAgwWX//OQGob3XKyI52XyS6etlbvrAsWussXkEO/lf10BB9OvOHZQQke
 ivcUIm5kprcEkPjnmOmOoMYPS8hho1gEnbTxx9L5SaSdhAqi/f7pqZLwL/C9q4c/becD
 AKkg==
X-Gm-Message-State: AOAM531xrt4tlA7Ss6bmqhJaVOpHfQxgFuF5jzaO0INTTLEs6JC5+YxE
 E+4bg4JRKGfUaL+w3JSFT1iFWw==
X-Google-Smtp-Source: ABdhPJwTiAlMQHDPOBILYw93C5zPUPk4rUzzmdiQbLfxY5VUAhw1amdJbIZH+anpkzw6i96B/0YNYQ==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr31859706wre.234.1618236931570; 
 Mon, 12 Apr 2021 07:15:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e10sm16585890wrw.14.2021.04.12.07.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 07:15:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF8001FF7E;
 Mon, 12 Apr 2021 15:15:29 +0100 (BST)
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-13-cfontana@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v12 12/65] target/arm: move physical address translation
 to cpu-mmu
Date: Mon, 12 Apr 2021 15:13:16 +0100
In-reply-to: <20210326193701.5981-13-cfontana@suse.de>
Message-ID: <87tuobmvwe.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> get_phys_addr is needed for KVM too, and in turn it requires
> the aa64_va_parameter* family of functions.
>
> Create cpu-mmu and cpu-mmu-sysemu to store these and
> other mmu-related functions.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-mmu.h               |  119 ++
>  target/arm/cpu.h                   |    3 -
>  target/arm/internals.h             |   34 -
>  target/arm/cpu-mmu-sysemu.c        | 2307 ++++++++++++++++++++++++++
>  target/arm/cpu-mmu.c               |  124 ++
>  target/arm/cpu.c                   |    1 +
>  target/arm/tcg/helper.c            | 2442 +---------------------------

I realise I reviewed the previous patch but we moved everything
wholesale into target/arm/tcg only to move stuff right back out again. I
can see there maybe an argument for a "move and pare down" approach but
that should probably be expanded on in the comment for 2/65 (move
helpers to tcg).

Anyway:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

