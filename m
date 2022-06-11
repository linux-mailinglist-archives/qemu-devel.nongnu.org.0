Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11B54736C
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 11:50:01 +0200 (CEST)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzxkm-0000F4-Tm
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 05:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzxiv-0007Ez-IE
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 05:48:10 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzxit-000076-CJ
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 05:48:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id k19so1387980wrd.8
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M/bXXY0rQ350b2cFx7YVqOQFrznktXRmHqFlBwuMHgA=;
 b=owUh4xgtCVVcgkfBkXUjmX/U1qvOSjVZwE15MKdBjJ2mjIcS2jr5uyUA1QPYE9OlZr
 QG/1Bi1kPa+XdBcoEU1u+j6awAgNpnHX32RqfwpsK/gAuHd1cSxbsVPEwl4vLEFcCTbz
 h63y5QK7KY1htF3Q1RR8exoOaREwiwGdmWd9KG3QHLjj17tk+E0tjexA8tH8vEYi1csh
 nZ6Ahi7mPF9SK21dolPKrIjuiI3ZDauCAVEpxI7Hnq7uiAA5C6NhKK/dh1siBKMMb7w2
 EHxjo7/12TdeQtKbyJCEefF0BvE1hcqg2FxPA5IUyBzsSfC9ebm49wYR2BVctncu9Ym1
 9/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M/bXXY0rQ350b2cFx7YVqOQFrznktXRmHqFlBwuMHgA=;
 b=AIooAoYoVgEoqqjwtot+PLt88MXQEjM1DMD3qFe1C27QtQDZjjRuCWEpzXljQLBm4z
 sqXPEKt4Yb6O5PUAgXLq8Qx2clEcGz+X0vouICXS+eX1+mn21CkqigLyNeNp8laozUmF
 urxl2gKyNt14wKDAy8HKmKU32Fa9r8nI54gQSXJf1arr56khAgtACAKtvQyRLBxMRaFm
 /rVHh+HPNEnLaLCNz5rCwaMYGQ/p4W7V68V9DhjDene99ElyE+DFL/ho9fUp8RU80+TA
 T5Te+md69sWw38scAP4UDmVyTTwg4SEYXvSuyv3znkijJ4zW7zEw5wIsq0gjHxKagAtE
 ijxg==
X-Gm-Message-State: AOAM530oOi0bGXaVycGYyr8R5nTfNJLCjheCKElsAkfFXrVhFPTcrgju
 zclVc4sc7IxL0PuXutJHPy4=
X-Google-Smtp-Source: ABdhPJwq9sHS3MzkBOi1qG9lIwSk1BZOexyalVPqsKMx1k6rjy/Fmi8w6eaMg+6plh68pDUs4BGXZg==
X-Received: by 2002:a5d:59c1:0:b0:218:548f:864 with SMTP id
 v1-20020a5d59c1000000b00218548f0864mr22153807wry.361.1654940881086; 
 Sat, 11 Jun 2022 02:48:01 -0700 (PDT)
Received: from [192.168.2.115] (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 m12-20020a5d6a0c000000b0020cdcb0efa2sm2035645wru.34.2022.06.11.02.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 02:48:00 -0700 (PDT)
Message-ID: <0248d411-e827-6eff-29c0-e8dfcc82e596@amsat.org>
Date: Sat, 11 Jun 2022 11:47:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v4 00/11] QOM'ify PIIX southbridge creation
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220603185045.143789-1-shentey@gmail.com>
In-Reply-To: <20220603185045.143789-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/6/22 20:50, Bernhard Beschow wrote:

> Bernhard Beschow (11):
>    hw/southbridge/piix: Aggregate all PIIX southbridge type names
>    hw/isa/piix4: Use object_initialize_child() for embedded struct
>    hw/isa/piix4: Move pci_map_irq_fn' near pci_set_irq_fn
>    hw/isa/piix4: QOM'ify PCI device creation and wiring
>    hw/isa/piix4: Factor out ISABus retrieval from piix4_create()
>    hw/isa/piix4: QOM'ify PIIX4 PM creation
>    hw/isa/piix4: Inline and remove piix4_create()
>    hw/isa/piix3: Move pci_map_irq_fn near pci_set_irq_fn
>    hw/isa/piix3: QOM'ify PCI device creation and wiring
>    hw/isa/piix3: Factor out ISABus retrieval from piix3_create()
>    hw/isa/piix3: Inline and remove piix3_create()

Series queued via mips-next, thanks!

