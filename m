Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D7B28D54E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 22:25:59 +0200 (CEST)
Received: from localhost ([::1]:42480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSQru-0003fR-OH
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 16:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSQqQ-00036U-7i
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 16:24:26 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:41723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kSQqN-0007bq-Qb
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 16:24:25 -0400
Received: by mail-ed1-x541.google.com with SMTP id l24so806169edj.8
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 13:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3g6Kv3zk7x+qQX/qQjQviLQSOnyHJG3LV9xUoNF9TAc=;
 b=RP2TB5JEZ/jPKcb5xpg2chlbiC0Lj+cuxdJDtokpex8jJw9xIC4nMcd7DheBoFmiXC
 +5aagdREGCjId0llv3JELlKXE8dvbSfwYQw6TkYfF/URM4C+/6mri2ZG17zEecGarfpa
 9H8aqjXStYmgISu/q1WieMdlDUB7jTXpdzqHNTiQLGEM2fTJg95EPOG9ev7pOlcyHmM0
 jFSkO2pwX39C2sPg389l7zeowdbVaUVS9up8ephTiNm6JrxQg316J1Td/CS43iGwtz1g
 X88lcaUGBHHnZCn/K2+oYydxYoo6/9bfFWpHDwHCePpiQX6dyQbP5RBF1DuEbsZ5NRiw
 TUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3g6Kv3zk7x+qQX/qQjQviLQSOnyHJG3LV9xUoNF9TAc=;
 b=S5RLhcrH7JksW0x0vK2mbD/0X4Yn3x9lTjFFGE+cCJ8FWW8qRRcGmVZBaec9vzzcYC
 sayhNP72QiiS8RoH+aHXtr87VLYSJnFRxem8bMl9zScSiKCVmB4wY30OJiXTeOWSyZO2
 TCA1lKFw6Vl9mtUhNSV9T1KwLI6E/9hewg3qFjw4s1fOXNFyHYXTClZwhlgSAZIAkX7D
 iChI9Usd67kxwq1EsbQ38g5/X+Vu4XEDFXcj0FmZlnT5SJ048nPxpUjDT6ZExlOd0D4D
 scrYyLLHYWG9+aavau8HdVXpkg/BoK+7wwaa9q8RjplG1tjEZhi/ZvCEBg+0HhEO3KUV
 McCQ==
X-Gm-Message-State: AOAM532nc9Ak5keC99MzxlO7XlQt+oroLEvzasD+ONSie5Dvai1LmPc8
 By3o9YuB19sGsT/LdXAHpmDTgLP1KJNB0NTIA5NadA==
X-Google-Smtp-Source: ABdhPJzs3Sg2ySR+I1ZInfZb+MB+ArsjtucZAs8OoDkZYY9D61TeI9Oi5ZGQjEcNTxGUuUyJrnJt0cSWPUDo6WTS3IQ=
X-Received: by 2002:aa7:c302:: with SMTP id l2mr1500044edq.204.1602620662248; 
 Tue, 13 Oct 2020 13:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
 <CAFEAcA_MN4pzkWV65+2VtUgMdayf6pa-RCLXiomCsntF+38hNQ@mail.gmail.com>
 <9a06ae91-68e1-47a7-c6aa-19c1e2c47dda@linaro.org>
 <CAFEAcA_EHAsJTDV3JjriUC4rNj829LWCp9PNWScz+7uWFxxCGA@mail.gmail.com>
 <ceb80cfb-44ff-cca7-aae7-e4a4dbfabf0d@linaro.org>
In-Reply-To: <ceb80cfb-44ff-cca7-aae7-e4a4dbfabf0d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2020 21:24:11 +0100
Message-ID: <CAFEAcA9NxZ1WCH+wAy7QpVSsYE1AQ829Lh4DhCy8+KzoofTJuA@mail.gmail.com>
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Oct 2020 at 18:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Well, the only further comment is that, in the followup, only WLS gains the IT
> block check.  While I understand that's required to avoid an abort in QEMU for
> this case, all three of the insns have that case as CONSTRAINED UNPREDICTABLE.
>  It might be worthwhile checking for IT in all of them, just to continue our
> normal "unpredictable raises sigill, when easy" choice.

Maybe, but there are a lot of instructions that are
unpredictable-in-an-IT-block (CPSID, CRC32B, HVC...)
and our general approach seems to have been "don't check unless
it would cause an actual problem". The only place I can find
where we do check for this case is in trans_B_cond_thumb(),
which we do for the same reason as here.

thanks
-- PMM

