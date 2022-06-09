Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3E6544DA5
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 15:27:59 +0200 (CEST)
Received: from localhost ([::1]:45852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzICc-0000AO-PW
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 09:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzl-0007lP-T9
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:06:38 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:43729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzk-0000h0-DR
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 07:06:33 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3137316bb69so42275757b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d/daiqU20WuSLhZzm2pzQu7/oPg5pIxPEgGBkydIoUo=;
 b=JgLwJvSE4e2zagGMHZTlLbw3TwLeOJ/FguVkx4Tv2fzjfFXn1Uql1MEzdSlhk+a2ip
 c+Xme188DC7GLK0k3j3altDK1P9MY3lEGbUfgDmO52OVI3/fDJVz6E3FRigtG9HCHmNF
 WQ0vMQ9tVnrHFCmtFL05W+EG+LjbhN05V8l7rvJOETfO8WdqVwM6HV8owsoicGfQkWsF
 SpkQiz62qsf7tipxObOYMvx8OLLnkHf2hFEiP9kBLzngSaitsZPFArataft4a6cMDZIB
 e6qQ1lonoxeToFlPl4nc0K02nWi49wq+vO9FI4ium088Q3KzHMR+LG6qA/9VsEqO75qC
 aWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d/daiqU20WuSLhZzm2pzQu7/oPg5pIxPEgGBkydIoUo=;
 b=BTagaHezfpJKXfR9xDzoISoyQmYMy0ccy6psknna/ZCitqyASMSv6itGneEUvcUv1H
 GQkEJWXSnDPpZ/ZgWrQowPYdQn78Ua43NKD2m2IFLOEXc7KIRvNCQ5i+H6MRgUCOZ8OM
 k5zi+h3qW9fUghDe+rPSJPlvvJAwc/+qCiMkDTRc4d7ttU66cel4qfyUcOJzGHFYLa2U
 Y444Wt3T1/y5U6m5H44kGkj3G44M4Tw7KH2A6Figpk8tbDhn8ohkXkabgz2DKxhqfvNx
 v3wp7i+KRMTAZn6w4LvKiI0poh9c7nJ8+DQXSm0FrZC4JZdYCdjdJRaMk3mHbSc9Uz2I
 sE1g==
X-Gm-Message-State: AOAM533rpsa1dfSEbZvs1ciC7KxWEoec2V5cbiGUQERGeboiKTmJUcl1
 WEBK4U6g60ogioT/HM35kRY83mnhf1MLaKvFww2oCw==
X-Google-Smtp-Source: ABdhPJwVYxLOUkd9ZLoCLgzbHz3vWsLS2wzt3kjFC+wEl4sSptBPehpMe9yJGuQwv/QP2fbLrk9TM16Cui6Ri+WIbXM=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr43923657ywd.469.1654772791429; Thu, 09
 Jun 2022 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-36-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-36-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:06:21 +0100
Message-ID: <CAFEAcA9QrjOMx22G8+nHf3Po5aZDB9KdssrzddOUqY-0UCi3CA@mail.gmail.com>
Subject: Re: [PATCH 35/50] pckbd: replace irq_kbd and irq_mouse with qemu_irq
 array in KBDState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows both IRQs to be declared as a single qdev gpio array.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

