Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6E66DC99
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHkFr-0003o7-Mi; Tue, 17 Jan 2023 06:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHkFa-0003lc-8q
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:35:39 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHkFX-0000XR-GI
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:35:32 -0500
Received: by mail-pf1-x432.google.com with SMTP id c26so18780061pfp.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 03:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TyYmPNOg8nIpNU/hX39hfcm7D13D/i+/kHYNQoqc/wI=;
 b=LgEWZmJnFFrCoZPDq2BMLnWu7wsaKIy7RJN3/Gt5OwALDIuPRB5gnCsGBrVgQo0qdh
 mun1Rs1KoCNQi+h7VRt9VXNu0T5uzvwRvDe4FX7YJCA/qcY0B8IxPMpN5jFyWCqgTr/f
 XE+0EnaVvMIbhI8MOUQz3UnBct5nNLOzddc2uyFrh4oYUqIPB2InkD1GxF6oEp4cGweJ
 WS0VO9U7KEPS9iTz9VErQo07zPkQyD3skpVQISq9m4DUyUY4U9o3zEAgMYoDUALF/PUr
 PoMtP69ZuhPPWJ8usIZ43fdFy9nz9/Tsw+3cCZKnun9snDHrZmwcB5VinrNwU+0l2pKJ
 Jdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TyYmPNOg8nIpNU/hX39hfcm7D13D/i+/kHYNQoqc/wI=;
 b=bYGKfflO/DULJq2A6t/O5F6WKo3HCcCZIdGAmL3NTAzKaPrIj4rmkudnZT+btjVNnQ
 tBZhFXciHIeFrFt+0vurCTIj5FgT/owy2bK60f8UmlvZyJbhVp+XSOrgfaXlIz7iFVPS
 WXfH10oHC2le7uRDahEgjIHdJEBr0UP648/XyLMkV2uY4oK7IJY/3GoqQ0LwVmyu1KyX
 dkEzRx0A5DJzmII1qEbxOZBuKAE3lrlV0s5OB1SssUR4xNEvVAZQ2mPkCBOZhXk3fG77
 5u/OFrbUSlhhcPExyiIRAjSthQZT0+dUzpL7M1SBmwMyktZgo9Da2N2CcoHccXXeCn1S
 gq1Q==
X-Gm-Message-State: AFqh2kr6eCL3Mw7zwP9HAxRq7bToshsAW+6o/KYqIyPJXi8BCoqYH7l3
 oEY5uWh6btmvgZkkZQ27iGhEJAV2jSR5zQBJHTCOIA==
X-Google-Smtp-Source: AMrXdXt0eyTWbCfqAU/lYk86ytVojBEzMPTaMLmsvzWwIpkW849tLu+WXxR+LSPLTF3FoW8wXJXPCAI1AhNtnTOeQgs=
X-Received: by 2002:a63:510f:0:b0:477:86c1:640f with SMTP id
 f15-20020a63510f000000b0047786c1640fmr207885pgb.231.1673955329209; Tue, 17
 Jan 2023 03:35:29 -0800 (PST)
MIME-Version: 1.0
References: <167330628518.10497.13100425787268927786-0@git.sr.ht>
In-Reply-To: <167330628518.10497.13100425787268927786-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 11:35:17 +0000
Message-ID: <CAFEAcA_50YsaEZ4KX5T6r01y8sFJZZ5fYccF9kBJgL+_epbTGQ@mail.gmail.com>
Subject: Re: [PATCH qemu 1/3] target/arm: Unify checking for M Main Extension
 in MRS/MSR
To: "~dreiss-meta" <dreiss@meta.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Mon, 9 Jan 2023 at 23:18, ~dreiss-meta <dreiss-meta@git.sr.ht> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> BASEPRI, FAULTMASK, and their _NS equivalents only exist on devices with
> the Main Extension.  However, the MRS instruction did not check this,
> and the MSR instruction handled it inconsistently (warning BASEPRI, but
> silently ignoring writes to BASEPRI_NS).  Unify this behavior and always
> warn when reading or writing any of these registers if the extension is
> not present.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> ---

Hi; it looks like you didn't send a cover letter for this patchset.
If you're making contributions in future, if you could send a cover
letter for a multi-patch submission, that's helpful because our
automated tooling tends to get confused by patchsets which don't
have one. (A single standalone patch doesn't need a cover letter.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

