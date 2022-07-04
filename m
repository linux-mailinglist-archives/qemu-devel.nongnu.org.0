Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F252565805
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 15:59:11 +0200 (CEST)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8MbW-0008BU-54
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 09:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGr-0006jL-Ow
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:51 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:38884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8MGo-0005ur-AU
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:37:48 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-31c8a1e9e33so30183157b3.5
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhmmSDLjUSdCxWptSms/OE7S1Hchl47Y0edu4goDPTE=;
 b=U4APaJsA9XKHEIXzGdxwxcj/YcPxZyDVbzevFmqdX5k+aIyVaTsZne80SVxeK97IhI
 bQSyuMWBrCh+/HcxHbd6OSr7kcWT8uXDORYIb5lNPo/U7+ItZg2AcNB/D7Yg9vhZ2+xW
 6SHbiNiyIMH28/Ck2xTl5XZOjeLsWJ4OsPAfaR7bwPuPnhreWc3sZGeWw2n/iC9VDQlk
 sP+OvaciqmoM55vkSiL4yTasTxk5LsI3ArK2q7T8okkqzWu9pj40dLcyxlWKaLMjZVFj
 UtwnlwF02ncuXKDCxJK2RHas1YwrzOiZU1QYxeXc8Dht5v2z8lEMcJsu2GEvr4oXSgKW
 GRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhmmSDLjUSdCxWptSms/OE7S1Hchl47Y0edu4goDPTE=;
 b=keZqvnznVJqqdvwF2G53n9K9bo8ybnRP4m+uBSs3WCwnANw8f6J4X/C7bVHFJlVUHj
 BbXQyPaIvqfoiv3vDRspQCow45ClM7EjuthkUaDUtuOPLnni4GBLZNF7IGStABc7sloZ
 TCWLxdSZx2/bSNkLJJUdE5kkmpbbzsYdPlkl4F/rcMsGrD5fU21ZBU6jb4CWyn/y0V4E
 s9/7P7vG0egqFbfw121qIbRX4hDvWqSqydmqB2Dqx0sII57r6Bipa0n5lrqivYbwbE+W
 l6e3dJzko+51bea3kk1yDBhCVmyANkZJfvDEpo5YtiW+VS+aJluD+NX3SonszTOd1iSM
 MFwg==
X-Gm-Message-State: AJIora9z4tdPWGlBtUNP4imKBo7Gy0GRSXRYsYvUzq3mUDp+bjtdATyL
 KygDiccMZjnLPi6hLSYElNj+thbZ3nSLvchc3mQeaQ==
X-Google-Smtp-Source: AGRyM1uVOKSXEZf1K3DwlRMyy+O1v7tLK69KrRZyeJ76QDKRxUyOMJgROhwsXiEZ7PKUP3OST83h+VE58dv+zjdIWhg=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr10082312ywe.455.1656941865224; Mon, 04
 Jul 2022 06:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-39-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-39-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:37:34 +0100
Message-ID: <CAFEAcA_dfRUk0fW6tzq_KT+eHMgLAypnsyMCZsUMRfpvn7p7Uw@mail.gmail.com>
Subject: Re: [PATCH 38/40] pckbd: don't use legacy ps2_mouse_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
> Instantiate the PS2 mouse device within KBDState using
> object_initialize_child() in i8042_initfn() and i8042_mmio_init() and realize
> it in i8042_realizefn() and i8042_mmio_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

