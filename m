Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211B565884
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:21:10 +0200 (CEST)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mwn-0005jV-Av
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MH1-000774-Ri
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:59 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MH0-0005vy-Do
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:59 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-317a66d62dfso82455847b3.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0wLGboLYB9yXcKCk1KLpyuIB+V0qmr9YP91QCGgciBQ=;
 b=Jzt5QZpmZ6pYwPW6HYTF0YBuiFz1buY34fmadGhwrIRDgbtnnuiQtlTBPSRNoug1s9
 PaGMbNLprMwPslnMWSVHGBMLkM3YPBIuJeher6Y1e6b7sOjDo1E4HJgpPko0FXDKoeMR
 /x4RZ9k8p1hoptg0fxM+K4vebsnikEkhuxVzYWnOI88pOOAE+nyMdEZBKQFQmtuvzU1b
 g756QTyt+UlnjHpg9PUzgvYmVpzPVpmbacSMDxfzM3B4o2AW29t4eO5yvffv0NRg9wzI
 +H6bW3jWf9JD0mlnjzEJo80fRPRekDJ+EzirYH8FPlOLmmINQRanH/SZ2KW6ULBZh1jk
 bbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0wLGboLYB9yXcKCk1KLpyuIB+V0qmr9YP91QCGgciBQ=;
 b=jhmt1sNrlleplVSanq4NriKeEPI6Xiitz1ymulRt9UlCi23y4Pp7g24hp8E34iQm3D
 Is3MUEWlk6YST8rspP4x4yTN4IWP+Qw7meRiwro/tVkPL44Po43RRWSMd7TisQr/ELTx
 8JZqYpfP2bZXwGxnffxQn1Y5vk0UJNlfGJmMAfRTYfx/2MfAlvjZ/xpTJsaT1ISpcgby
 8eaMwSjoPxGqc6knAMPmcCIv/Pq84ZXWvG1eSXzyEjBEA9f+v+rrGEIpnDzBBMMIds6e
 gOsHxYiomNShjUJf0ujPuhbCit6KSeqMhNwiE/PotBxKzMgBYb+HWR0vT+J3qvB8t5T0
 eRgg==
X-Gm-Message-State: AJIora/pxp7IwSVyD21P2Ke5w07xJnN1zbfAvlNLz4rPurdNSIU3ujpC
 G2yPjrjITF0Je2vKT09CRXd8qMQfPPvLqt1FnHQQUQ==
X-Google-Smtp-Source: AGRyM1uAxpyGhEs3/ml6oXsDkp57YunOO9z9/dZbO2G+XfiOM4AbE1hsFFHaTgde8hUxS4/1tNnJfFNNkrLzNz8mi7c=
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr32757613ywb.10.1656941877454; Mon, 04
 Jul 2022 06:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-40-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-40-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:37:46 +0100
Message-ID: <CAFEAcA_U1Nmyqsn9y-BL4aZHLTr+_YapEEk3v-WP+1=xpOOCYg@mail.gmail.com>
Subject: Re: [PATCH 39/40] ps2: remove unused legacy ps2_mouse_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:42, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Now that the legacy ps2_mouse_init() function is no longer used, it can be completely
> removed along with its associated trace-event.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

