Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4136A0D86
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:05:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVE4d-0004i9-OO; Thu, 23 Feb 2023 11:03:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE4b-0004d2-An
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:03:57 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVE4Z-0006Fb-Oy
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:03:57 -0500
Received: by mail-pl1-x636.google.com with SMTP id ky4so14657266plb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=F97OQmeAYAFPWNscrkYAXbz94Fzjqt9Nd+VnNFVX4X0=;
 b=SibvgxmKk3jFtICXCN7mkMvfsrun52lIDSoVp3was0GrLr1wlVoTJc5pf9f9c1By2p
 U7kAEqDBq2mRZbmaOsI0T7E1XKKvEPQB7/y3LLaXKImKHey5scCrV8j6sns09nj5QZCX
 GDeDCOZ8W/0hyXqrb9/NIa+WNc7uHdEoedcvquoxphszGjoPgb6Jj+Tj+93sVD3wp9+d
 g4WK44oBSePWYdDicGNJeCVP2nah7TVBGAEwoYS71z2r3ZicbWf1SA5e8zm7AIDdlqLc
 soJT76EeyasVg9VkEbSin80F+vDHAqCunbYezM/Wf/S9/N54Pe/poM9swZutA6/vMvZp
 s2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F97OQmeAYAFPWNscrkYAXbz94Fzjqt9Nd+VnNFVX4X0=;
 b=2QUDdG/eqhjjENh+NU5gIhdclEH33/+kCZP+2IOaSgX8DlJVPZaFGZ0AyrvoGUJqk2
 7ZHkUX9vQCk9mB6kWP7Mfg84eYAEVqZzEqAa5dQipydq4utYpZOgVq/LLub4f+ne6Ied
 vHcrE9T9urX7MGKTgR0TQYy3r4vk40YP0ZlcT2pzwU50A3x5C6cofbAWxnM0Fk4KEATJ
 NV9tuqSceXwc2bs8Y2+Z1gbTqpAqygdSORDujvTYNGSMXoW9DUwPRfDGUvQX3ePrZp45
 BRLRO7TLSBDDUN9e7ke0ct7IMY+DK5pQCu+MJGMw3NA+dnbjwPb02DkQqEGmOLpDOZvM
 ju9g==
X-Gm-Message-State: AO0yUKUSYEtTuwfYBF9w1imX/G/u5LK+NGMeFnO3fa6QzFppDxLt7UBy
 3gG3Lohk+lvicQbN2Mo3GqdJiNnRTol8l8oKjz+dnw==
X-Google-Smtp-Source: AK7set8dWEo4LzYTqHZM2ChDGy3LJvQFZf3kQruDRCR4XAYml6PN470dzlxBzB177i8Vu4bGkOnfCGi+KckpY1jDbZI=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1242806pjb.137.1677168234060; Thu, 23
 Feb 2023 08:03:54 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-11-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:03:43 +0000
Message-ID: <CAFEAcA-xQmEsVGHiS97piq2_qRMBj3xDWiw9s4SDzQQSGvy6cA@mail.gmail.com>
Subject: Re: [PATCH v1 10/19] target/arm: Hoist finalize_memop out of
 do_gpr_{ld, st}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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

On Thu, 16 Feb 2023 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We are going to need the complete memop beforehand,
> so let's not compute it twice.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

