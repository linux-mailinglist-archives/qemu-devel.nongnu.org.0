Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCF56AB19B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 18:43:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYsNZ-0004zZ-EB; Sun, 05 Mar 2023 12:42:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYsNW-0004z2-2r
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:42:34 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYsNT-0002PL-Jh
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:42:32 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 130so4202453pgg.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 09:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678038139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=thQWhSJiyjxgla1yzR36+aQfkzlNMaRAC/3Ew+D0BIU=;
 b=WizpzVvERdQjrs5Wgkoi2SNj+F5o3LKz8XXxUE+YTrhDGysNMP5HWisD26nDpR/JjD
 0MUHHSBwMDUDW8WF5yPjiLT+WojQAfWSvK4NRykYCWFSQJxOPqCZrrEddMkhNA1LGN27
 8xAi95gJ3EWLi0jAj3B8c514tOaAuLQ3pT7dHI05ipZ8maGQ34oCGwjCC3A0QaFc9ubs
 5OVeQAT6o1SRfyEIahAuryXX25X44V1H9j1fMhxsI3TurFsm7+AXqDlG5PUMB0g9XeYr
 pgtalrBbLHvpxTTtoAQvrDf4PSMZ1sHHl2MdFTYHkyKid1NkSIpR1F9X3+qys2wzFQB4
 uBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678038139;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thQWhSJiyjxgla1yzR36+aQfkzlNMaRAC/3Ew+D0BIU=;
 b=N/GDAk+3Uh1pWvu3Lr42+c7hhn28k3IjFgI624VbUHCCs+73uiJvqx5f7wzHC1zv9D
 bUUsYf59Rjnr87R+/JY5f4FqErLvWKE3iVy96jfgwS8P12jYqAwv47RuS0V9C13xhSQs
 C+mmvIxHZLlWqEaMrTjbPyw4vyjWXYWbLYUHq1+Jp7c1ruS0VzIkw1Htly3t5Grt+UJK
 4jeVvYmiyK8f9CVUridi5cTxZwUskzFeJpIg92HjULMTCSQtaByF4+8qC0x9lLtFmZKg
 J80iC8gjX1Q+ZaVnECb+k5JGQIZB6NzvAbi5nKesgjHN6m20jSAkD7NxJzrSzANSbSMX
 z6ng==
X-Gm-Message-State: AO0yUKUbmS9o5tTGwF8+BIWmVvulHWb297N61TdK2ZBAAGd5Vo07FPOY
 jrsE6b+DlVF+S9GYbs0uXj3/gXN8ksDUzBzZTuZYng==
X-Google-Smtp-Source: AK7set/60sMPl+MEkC8vjji95EerLgwl8zXN1VVd6PT/+a8jnDGACA1RKLHG8UbNPH1xf4N/5hcvuJyqUvC06RZIECc=
X-Received: by 2002:a62:ce4e:0:b0:5a9:c22e:7764 with SMTP id
 y75-20020a62ce4e000000b005a9c22e7764mr3417591pfg.5.1678038139081; Sun, 05 Mar
 2023 09:42:19 -0800 (PST)
MIME-Version: 1.0
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-19-richard.henderson@linaro.org>
In-Reply-To: <20230304181900.1097116-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Mar 2023 17:42:07 +0000
Message-ID: <CAFEAcA-WRYi-KN06motQp2Pk086AOqvRNZrDmh_V6LCNeN9Cww@mail.gmail.com>
Subject: Re: [PATCH v3 18/20] target/tricore: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
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

On Sat, 4 Mar 2023 at 18:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> ---
>  target/tricore/translate.c | 540 +------------------------------------
>  1 file changed, 4 insertions(+), 536 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

