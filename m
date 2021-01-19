Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B42FB75C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:24:56 +0100 (CET)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rwF-00036T-A8
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:24:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rvB-0001XB-8Q
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:23:49 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rv8-0002D4-ND
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:23:48 -0500
Received: by mail-ej1-x635.google.com with SMTP id a10so12107147ejg.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jXmbfayX85QtfBpC3swBdbNRRUGBZnBAFg/PUwB91bI=;
 b=Hhrb1EglWsgLNmplamdUGFGixMBJCdGc3i1rRXh6+VSbfE2PbiZLUsXnAHw56VzCmU
 YW5MDDIXR9Pp8c2V5XZVZ7pLpIByffomEXxCd97chSCcadm/8SO2mqK92Ls21ezTz8Ns
 pxxjx1AKI9BWBy5ITTm9msxZCcbr4VTKhQkaO8pSxMAOASG+1I7orPZjaCCoOPJAmAyd
 H5QDz4U8HkB3gNqtmfpOZpSXMmnezkU7iCBmI0Y3iCYT/4Loo1m9zR1B1gJ/Lp8PrWm7
 BKxSQhX4xAqGsk0jswSUlat4BW1WkWfI3j0Jkjep7a8nd9cKqwYfAE7FaC1wrCTmMj+C
 Xsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXmbfayX85QtfBpC3swBdbNRRUGBZnBAFg/PUwB91bI=;
 b=U+x4PH7I7ck13AsFwJpW4N3C2FfpW9nFX8C3eyno/Y/jr8zddMPSqpr4A1KVrsZ0ho
 9hS5RY7Nppa6itRghJ8JTOUhR/ppHJ49gkGUYr/0/0E/4AZS89YMgpUZsI3qvav8LgvN
 rPQr3iPK+TnY9nTkbjzL55sT5iGEMfpu3p21rZo59oGoMZ2GbeWIiTiVR+pUAE79Scmc
 c1rwiHaixKpI+91IP3qo15gQNyxzxjC2EKDzJ0ulHiNawR69UuZ2Gv1fTGsvLKJzRDa+
 +WmbELnvQenCqjNu+gqMpNUdu2+adr6FUMoq0D9cBwnaKg5f9C38gSE9mhpQ6H2faAT3
 H17Q==
X-Gm-Message-State: AOAM5335pFqNqyU9hggFoWwE8ClItC7MEvL3Yho6Ti5c96ZWGILCA6i7
 X8F2O+Jp6wwP3d40pT0/zzFnvui4q/GbAfU9LgysKChgjLM=
X-Google-Smtp-Source: ABdhPJzK9BdoUjFuWeJZXlrJUREQkdZaGDHUaLQSfUyz5Eg+psb52kl0dP/rz/AUi0pH7n0qdWC6pGCxIQBDWC/4Lm0=
X-Received: by 2002:a17:907:1b10:: with SMTP id
 mp16mr240118ejc.482.1611066225158; 
 Tue, 19 Jan 2021 06:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20210115210456.1053477-1-richard.henderson@linaro.org>
 <20210115210456.1053477-2-richard.henderson@linaro.org>
In-Reply-To: <20210115210456.1053477-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 14:23:34 +0000
Message-ID: <CAFEAcA-NMpeJu1Gb8O4zSE44VuCX2pQACA_-tbwmcxc-ike35Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/22] tcg/tci: Drop L and S constraints
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 21:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are identical to the 'r' constraint.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target.c.inc | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

