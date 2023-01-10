Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B986D66479F
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:46:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHro-0008S0-6P; Tue, 10 Jan 2023 11:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFHrY-0008H5-A2
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:52:38 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFHrV-0008T9-7B
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:52:35 -0500
Received: by mail-pl1-x631.google.com with SMTP id v23so8899914plo.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nBzC//auYZ61cV9tHFKe8ZLwWLqDNW5VCqZt4Tcj6d4=;
 b=YPPLDhYqU/h/fMQgH1lJSUUyXbqnKSFJt+jCCkOBCuP7Yst8D8EmXzLybuYMj9ORFD
 VU2BsxSSJaPKU0DjMyaZUk+Jssw/THA8EHG+lGDxkb+2F1r1KbslmF04OFsU2TmM8Uvm
 cYYZ8LW+crpsOc1I6aPqkLBbl2VXfGFiic+8f5x7yWaMQT3dsjVAUz2uEC4z8gtT3Ig3
 Mcd4CSEnTCbxzTQGY6X3ReZQVx0HmVuygLzSj47/Dnoulg5ZRfhU01maI0gDphTqR90p
 oLKcTflyNEH3H4yUqc6eCpAWIWg7fP/5ZANDVpWfS5qDarjV6fDGq5kdDKRPuGxTPA6T
 uNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nBzC//auYZ61cV9tHFKe8ZLwWLqDNW5VCqZt4Tcj6d4=;
 b=NN5qC/zpiJ1qRkOQ1vILEsqIJbw/3KDmmB/z66C+GHcr/5EoxaP8daqusk+KWwbo/3
 yfEJy0PTAZMteduQsxI2H2fnVpGAmAiuo9/Z3FFLnRuxA72E4cyvLzpyit+2g2mEbQyV
 dk9R8a7TcHJmXfRg45opyvnEgVr9iRQhWQ9CqsyixiZ9ZXlYrPKY9eQDks7jj1p1iDFi
 PmvsOJmK4alMTI6T5yPG/2S/9nMCaA+I2huj5MZMPaLn/Qggrp3sGXylBjddPbDfX4VC
 Z39qu0f9dQTMPsxez773EGjdOpIdoGz2gDZjSLcTP1zF3MsHjx6pQf0hX2c7Dv9puvAF
 K0tg==
X-Gm-Message-State: AFqh2kpGcAMqnvzWi3/lUVfbn5yIMd32KRr/TIwCCzu1rl7u00zTJg8/
 nu8+zBli3uaEfwI5F8Mtj5k0w26fiwLBPOHZxn0h7w==
X-Google-Smtp-Source: AMrXdXvw8FeMTAkEAg2W/hrgGMpJaeHRA+v2nrgotuElDzJSzEhjz/IsaCtwoLs3vE391NfTYRixdO5bHfbtblV8s1w=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr2036953plb.19.1673369551590; Tue, 10
 Jan 2023 08:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-13-philmd@linaro.org>
In-Reply-To: <20230110164406.94366-13-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 16:52:20 +0000
Message-ID: <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by
 object_new(ARMCPU)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, ale@rev.ng, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, 
 Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Tue, 10 Jan 2023 at 16:45, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Replace the ARMCPU field in DigicState by a reference to
> an allocated ARMCPU. Instead of initializing the field
> with object_initialize(), allocate it with object_new().
>
> As we don't access ARMCPU internal fields or size, we can
> move digic.c from arm_ss[] to the more generic softmmu_ss[].

I'm not really a fan of this, because it moves away
from a standard coding pattern we've been using for
new QOM 'container' devices, where all the sub-components
of the device are structs embedded in the device's own
struct. This is as opposed to the old style which tended
to use "allocate memory for the sub-component and have
pointers to it". It means the CPU object is now being
treated differently from all the timers, UARTs, etc.

thanks
-- PMM

