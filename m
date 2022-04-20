Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C9508B25
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:50:36 +0200 (CEST)
Received: from localhost ([::1]:36328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBf9-00072S-Tj
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhBB6-00025Q-58
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:19:32 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhBB1-0004ux-Gt
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:19:31 -0400
Received: by mail-wr1-x433.google.com with SMTP id e21so2468639wrc.8
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nGWgBSjxBARJUkFPGXHnfVvujs1U73HEeWuCm94KLkY=;
 b=N7rStmKXcNivU7dm1oZ5/4OJqz3vDmzwYTEnpy1k/94JHHyJ/cXWYoi1X3JYorVOCy
 xPLXxbI87PtQBBgLZIeanqOkiiKOBI3y51G02ktTrOTvSq0crq5b+yum0oiUo2Ky21/3
 apUiJbgdP6FFfxUrHuXzOyTMG8MIexhKJLSFY8f2M0aTTjgvDl3TG8nK7o90pxeHnZzg
 C3dI0w67+Fg1C3WzxgJYqqfhqUZALCgW8WEtqJ4um9JOvzMu+RswTiHfri6t9GGjL/K+
 jkEJgg0Eezjg4jMnOrqcpyUYSLQkgaSI/U7wGqrzGcwrR0HtLF8MRtv4ecX/inwJ45Y6
 hoow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nGWgBSjxBARJUkFPGXHnfVvujs1U73HEeWuCm94KLkY=;
 b=uEmMoJqeCRXUauFox+Ocym0KUVRyOfG5lAIAo5rHiW0P7aZLtR5Mo0RvD4RO3hbJ5u
 K7S+iFlk4RPcTkB6U+9xJ8nEcD76pMtmZjsjrOkbxGGL/x3jo+NO81ETz/LGzfSQnDi9
 n7ZvIjuLE/nUUZpfzcBoY9TQrESs8SI88z+xO6UcaZUzUrnF6kxcnWtIEWYkt9sJnf+I
 nqZq+w2PYc2o08IPeKKyWUXSw7gZSiGV4SnfEoDpLizImitHoXRn71Nk2ThGdUuyQ7eW
 dYjTvshybZltVzxhq5oIynvU2pLfbulOWa6Y6+sxkuFV7tyaN0kZ84Hr/vMB9j0tlwvm
 uNTw==
X-Gm-Message-State: AOAM533pTmdVdk7/dy1Tsk95+B1O+riwC4PZXIDaajFAayeteSPJPGOk
 gShSWJjr9PAY8SLcoOll+bw=
X-Google-Smtp-Source: ABdhPJw89kbXyOsTeGaUY4HQbgqnVH1QZfXiXTFZRzIPvB/GMinXNTK5KCENivvBMXbMxaGuwOkbBA==
X-Received: by 2002:a05:6000:38b:b0:20a:923a:3aea with SMTP id
 u11-20020a056000038b00b0020a923a3aeamr12076330wrf.294.1650464366006; 
 Wed, 20 Apr 2022 07:19:26 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm20608wmb.3.2022.04.20.07.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:19:25 -0700 (PDT)
Message-ID: <d2920ee3-56b9-5f9e-1f1b-840941bc1ac3@redhat.com>
Date: Wed, 20 Apr 2022 16:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] TCG support for AVX
Content-Language: en-US
To: Paul Brook <paul@nowt.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220418173904.3746036-3-paul@nowt.org>
 <CAFEAcA_HgZmoKO8u_m7XXjKibBuT9HqeOcc+2R9yQkd9-sAdDw@mail.gmail.com>
 <4530fe387ef5a8d294122a1520ad8e25445bf344.camel@nowt.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <4530fe387ef5a8d294122a1520ad8e25445bf344.camel@nowt.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/22 21:45, Paul Brook wrote:
>> Massively too large for a single patch, I'm afraid. This needs
>> to be split, probably into at least twenty patches, which each
>> are a reviewable chunk of code that does one coherent thing.
> Hmm, I'mm see what I can do.
> 
> Unfortunately the table driven decoding means that going from two to
> three operands tends to be a bit all or nothing just to get the thing
> to compile.

Hi Paul, welcome back and thanks for this huge work.  It should be
possible at least to split the patch as follows (at least that's
what _I_ would do in order to review it):

* mechanical changes to translate.c

-    [0x10] = { SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL, SSE_SPECIAL }, /* movups, movupd, movss, movsd */
+    [0x10] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
+    [0x11] = SSE_SPECIAL, /* movups, movupd, movss, movsd */
+    [0x12] = SSE_SPECIAL, /* movlps, movlpd, movsldup, movddup */
+    [0x13] = SSE_SPECIAL, /* movlps, movlpd */

* mechanical introduction of XMM_OFFSET()

* non-AVX/VEX changes (e.g. SSE_OPF_3DNOW)

* decoding fixes for SSE instructions (CHECK_NO_VEX)

* fix zeroing of high bits

* 3-operand decoding and helpers

* AVX/AVX2 support (existing instructions)

* AVX/AVX2 support (new instructions)

I can do some of the work too since I was planning to do this
anyway (but have hardly started yet).

Paolo

