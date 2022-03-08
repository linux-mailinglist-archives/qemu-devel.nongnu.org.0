Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C114D13F2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 10:55:03 +0100 (CET)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRWYW-0002X0-R6
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 04:55:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWVw-0007dS-3p
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:52:20 -0500
Received: from [2607:f8b0:4864:20::b32] (port=41777
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRWVu-0005Js-Kc
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 04:52:19 -0500
Received: by mail-yb1-xb32.google.com with SMTP id l2so17128018ybe.8
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g05sAPKQJmnYAYugF/wnp/glebvoWGQzq0MFLyPQRv8=;
 b=O2DylHDBAQtO1j7cQdHmJqFnygRWum6m2jjHBiPHQhGUZVAcGSAu9F5Q46Yx0gUm+3
 SDNm6GQ0D/SKwFSYM729c3CXqxa71DuSF6Ab8Oy22omuE05z2wIksocMBkgEoipIh/Q1
 B7l5lmHs4RtPVsBrQntPRC7Ns59c4BA+P1E4kTQAPH5RiEDfP+ifGz7e9rZoMVemLh8E
 HODwtdwEy0gsHBRqOlbwb3NFbyZJBdFfoZHliHiX+4+UwZUdw3gIsAwPcgkl7uANPPMg
 sAG/TpIMQ5sGBKvlXmkPcpRhwP6NCZqwY/88DxcjpuiJnZjG1DHKEXFXOsrIk7Ai8sA1
 kN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g05sAPKQJmnYAYugF/wnp/glebvoWGQzq0MFLyPQRv8=;
 b=70CRIV+Bhw4f/Rkwe3cuwRHLFf+WQfpTL+LJTFvOzoD9xcj32ADgu4azxGhGWm8v/Q
 8FKxFglieWB+rnPDomG/57KqjIICeSW2wI2kBL7M/ZkJ1H9NQyIBbXJHd0W54hGZBN4F
 LXzI9xKV0huhVsus4ec1DatqR7xv/DVXGB4+qSzJf6PKwmBivE/lamer7TRD/xopOTZt
 ltWfL/wWlHTC9mGdkerTj6wIpvCMsflHp1kDuTE/rFZxfJXAL+Rh4gJwM1VxnBx4QwKj
 YveXTP8qa3LyvP4PahVDoND0HQ7S6khpV6g1nGw/o1iYs6SAzbBXhuPbCgUS/kEiMNk0
 ljBw==
X-Gm-Message-State: AOAM53310z2e8ESuC1gUMSmcM9s40rXdHtAubD0s7gWEsygOSa1nWzhU
 IFDp3AE6NJ0BSCAedSsMcnXdX85jEEnvMEizJMIszTkbRSfbxQ==
X-Google-Smtp-Source: ABdhPJymHwUKslRSAvD7YZmfpHRq1f3mD1Ob5nl+NYamrJA9866vIo7tq52bfgj21PeExzcwfd3cu0DgbJSVKOqhJms=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr11029848ybp.39.1646733137863; Tue, 08
 Mar 2022 01:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-6-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 09:52:06 +0000
Message-ID: <CAFEAcA8cbcTCjXbZq7QrUQB4jKYCgxNyJ45PiXy4HV1GO29_wA@mail.gmail.com>
Subject: Re: [PATCH v4 05/33] target/nios2: Split out helper for eret
 instruction
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 07:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Amir Gonnen <amir.gonnen@neuroblade.ai>
>
> The implementation of eret will become much more complex
> with the introduction of shadow registers.
>
> Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
> Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
> [rth: Split out of a larger patch for shadow register sets.
>       Directly exit to the cpu loop from the helper.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

