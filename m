Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B0563382
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 14:36:31 +0200 (CEST)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Fss-0004dp-2O
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 08:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FmV-0000Tt-Df
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:29:55 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:45916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o7FmT-00050b-T2
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 08:29:55 -0400
Received: by mail-yb1-xb33.google.com with SMTP id x184so3727970ybg.12
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g55W5Fpqz8nBO+Mlq/wUDiUkCuLxOKyl15FW5KEdJJw=;
 b=KcxeB1VHbYhzrmAqccQWxXfyNt1p9CB36UdZt5iOYq01fFnffA4kzqspb7UyG1dzJj
 lJhOzhHeNI/yJK3Eh0HF65oAsppiX6V+gRn05Ls+vrLs6zvkYtm5SdaTFVyb+vxYNu+i
 fjhQN1J6mJxarUWHYdXZNFtlx6H1o7ldqhyUZbOBgHEauJvt73sLSsiu5rMJWzAw1zzj
 3+P5zIzd6KZCLHgqut+tz2UODXMy/rhAIG8fetPzI1ZqCUEp3HAWcee0wvQIU03qe23+
 jL6GDyA2g+rJYad4YsW9E6MWu1hOGsC0rxTzga3cBQOdD9WcVKMB4ScxiqHglG0hIvMu
 nv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g55W5Fpqz8nBO+Mlq/wUDiUkCuLxOKyl15FW5KEdJJw=;
 b=zt17nUgk9l0GGULl0phufcfvdBIMhXwhkSS46XYpxnwDPXPAYburbyNZZAopIdlfWw
 B3jAvtlTTSQm6ntdtG/27UUnRm6NuGcStIxLmgUrV1vKvhH0sbOLrIr/CLeXFwUIBwF8
 pg9H6Yh2AlS2c9yLT/v0EHUAFIWeUdI4Cz7ouZ3YL3JgDU/OTno3ApdEeIL5ePYVLQV1
 ByfvuEr28QZ5Q3FH8DEbBMFgzhVgvH+x8A2g/vmDIOjjWdY2TDIgGDivA1UpMYtruOOA
 nRPj3quaiWmNeZDtctoPi6X3O0ej1tOAVJA2d5EEW2f0oV2uDLt7Zq+a74YZxJiPVKv2
 NHSg==
X-Gm-Message-State: AJIora9gdO0DTKMIovjUJ23EIGkPLFplNYM8SoSN/Tn4ifpbpulWVelu
 AmWu8g3iImtRMBkQFv8egTH8ZG8vCBI5uvt4KWQ2MQ==
X-Google-Smtp-Source: AGRyM1vsHS2t9CCBlTYX5T+SiNyFN51CqIi5in7xD1fNF2CVZE2jDQysmSPiQrDErbiL9PTP2PSAWGtg3GRADQpvnic=
X-Received: by 2002:a25:d74a:0:b0:66d:eddf:c495 with SMTP id
 o71-20020a25d74a000000b0066deddfc495mr1878281ybg.479.1656678592751; Fri, 01
 Jul 2022 05:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-12-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2022 13:29:14 +0100
Message-ID: <CAFEAcA-Bsc-hZ5LYyJP9joJscbqCDCrHew4-Qktf8p19q2afzA@mail.gmail.com>
Subject: Re: [PATCH v4 11/45] target/arm: Mark gather/scatter load/store as
 non-streaming
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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

On Tue, 28 Jun 2022 at 05:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Mark these as a non-streaming instructions, which should trap
> if full a64 support is not enabled in streaming mode.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

