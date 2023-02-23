Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D26A0D37
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDiQ-0002L7-R2; Thu, 23 Feb 2023 10:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDiO-0002Bz-JS
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:41:00 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDiM-0007JB-Ia
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:40:59 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u10so13424077pjc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yrSq04Aksca7zM44nXfT8SjDN7R7k7OwqkfjD9wknjI=;
 b=hVQylmQlPgL5Eld8R3sY9KDD20uhzQZl8zBQ+EtaBKSnHVARwAX+WGax0D2tDikIe5
 Fr9izkwafX+Lrq3R2VrqKn1Qj4TXFnnkJTAVYbZGufHwBuQTZH4hzFWEe7NNwB/57KDF
 RzHl/vT/n4FXFyD+xgq21RJZ9K4/9cFqjtO4y0iNl1wBMPcUpIjNACb8naTOT8kPT2bK
 DYhYUNIFHZY2+3SKLxmdoHvimlsNbrDNNX4DArawpPWIW41WAxSSOTD+xGKRdABP2P9F
 HOSDzrKwJpZ+qZK/02FzDH2AHyFPbaDa2Kkyxm6+tnWPza2D62+jO9FSCJSQ54xDXZfs
 bTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yrSq04Aksca7zM44nXfT8SjDN7R7k7OwqkfjD9wknjI=;
 b=R3R6LZQXsFTlZQRiLM+H+Gzdm2T1LHc/G1UxOnEKOAxOTyv6V+1XvpqcBHDyWoSNv6
 OxppatvGQjZop6vbPGr9t5i/hdYoapD8iMrjnJrKVHQwCB8XwLSA6LfobUAOVYpvyIhv
 Q7aCkuJvfvMF2FYj15MuaRixDQnnwXyX+NkHpQ66tilCVvgF46EbwI0TeJ2ijeZ8qd6U
 rFzABPwXCVOs8zrhE6TdnyZAK8R9Th2NXLDHrjX0Eb+FwBS54dRb/sqM3mow3fyy4rgw
 31410JfdZUBeZg+xFjZmDMmHOo33OlSuhBl4xOtxnnDFmKggYVaypuYZTKsx+1jT0Ho+
 cAcQ==
X-Gm-Message-State: AO0yUKVk4ziBKg2xR0FFSQGfPaF7INYhQWoW0eFDsV4p0Fkn5hOC1jJc
 +5ch3kb+jfelW6KKDpt6NMSr1VNSzQwQf/5y6BBYgQ==
X-Google-Smtp-Source: AK7set+JuiS4H0XncYZ48w5FzX7yPUlGijnk1lOy7UA9O+LGw1PW9/hfqrrKH56z7vdKRS+2UfkJW6bWfp9N6vhImJg=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1220080pjb.137.1677166856937; Thu, 23
 Feb 2023 07:40:56 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-7-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:40:45 +0000
Message-ID: <CAFEAcA_A2Cizy3SJMMUVxK50woDjZA1ohyVbMCzYyPB0jP+9dg@mail.gmail.com>
Subject: Re: [PATCH v1 06/19] target/arm: Sink gen_mte_check1 into
 load/store_exclusive
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> No need to duplicate this check across multiple call sites.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

