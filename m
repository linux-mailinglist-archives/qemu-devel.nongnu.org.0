Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC2358EDBE
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:59:12 +0200 (CEST)
Received: from localhost ([::1]:51184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLmEp-0001vB-SL
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlkT-0002n3-20
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:27:49 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oLlkR-0005tq-GN
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 09:27:48 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so985126wms.5
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc;
 bh=5S9fbprB6Ig5NfBl3AmoUzXZcXeUoetzN5yLla+MLiw=;
 b=tV6ej9QcMTkD64ErTCYLRB0FMRPVbyLtUH8iBwrqGpXlLUmngg8NCzctmkGakVMHT7
 M/qTUXw7UvwpSBSjuaJdhICthzI8ixfr0pAYwDK4KeVdJsx7HaZV0zOv3rxZGSNt8U9O
 19DSwJsXqSF/TAKMawjKMLkcBkTmGCpOfXw+Zs0TYZdhuCS1xcp+TmUMm0AqoK5SKt0z
 usvCuiumhAE63GwBzTPE096tZ77kjAZTnLVwWcWQwmnNosJtksXb6m9w1G02Ong7gS89
 hIYAb7JQbtNv1w4FZouiTMi/wfdO69tuBSyUV7TXAIp0xMndb+7mE1EuIEO5n3zST0mj
 2YuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc; bh=5S9fbprB6Ig5NfBl3AmoUzXZcXeUoetzN5yLla+MLiw=;
 b=eOshvuPUQA3gNi0wlZ8/DYQElNnf+64BfNyf5M+KvpVPjkQ+fCe5Qe6ZCFv5YIWpc2
 7krJlqx12wy5rcARoDV/ubpOvrj8ik3CN0EKRtWyqOkAD40bO+cvddnh0xQrynRWVA7r
 AHk0UYaJMuaiM04/+/617WLJKcaVP76z55n0dFkunegXpW1y0kJRaSEwqmkU4VokcQ4g
 xagD0Sa1tmAr0jchlUp5UydSIXH3gxZ6mrIc5st+aTl3INzFB0FzdRF7ZaEapp6Sn8/L
 Pr4Fpo6jfLW2K9qcdteTvxDvPboz93wsH2GWmWlK9sn9GJ5Sum2OQ8o1Ie89vMgMPXr7
 5hDg==
X-Gm-Message-State: ACgBeo0LPbUo2+EEd53qTYnXxzzrvLlWfzf+iNpg7/9rmiCCPugqY5eZ
 Fsd6+ja1GIq8RF+ypqrEf6vgLw==
X-Google-Smtp-Source: AA6agR4XxkeMUlYp5t5/5H/YJXSivQ8KQ0wb9m48ABjwrIx+fk2mqScrs2CEaxEySvuJOsUkZWbT6Q==
X-Received: by 2002:a05:600c:600a:b0:3a5:b621:9d1b with SMTP id
 az10-20020a05600c600a00b003a5b6219d1bmr1608946wmb.42.1660138065949; 
 Wed, 10 Aug 2022 06:27:45 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a05600c1c0400b003a31fd05e0fsm7506692wms.2.2022.08.10.06.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:27:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2E451FFB7;
 Wed, 10 Aug 2022 14:27:44 +0100 (BST)
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-30-richard.henderson@linaro.org>
User-agent: mu4e 1.8.8; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 29/62] target/arm: Add is_secure parameter to
 v7m_read_half_insn
Date: Wed, 10 Aug 2022 14:27:40 +0100
In-reply-to: <20220703082419.770989-30-richard.henderson@linaro.org>
Message-ID: <87pmh8jkj3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Remove the use of regime_is_secure from v7m_read_half_insn.
> As it happens, both callers pass true, but that is a detail
> of v7m_handle_execute_nsc we need not expose to the callee.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

