Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C4B6F8433
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 15:37:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvc4-00052r-KB; Fri, 05 May 2023 09:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvbz-000520-T4
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:36:39 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvby-0004NC-4S
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:36:39 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50b8d2eed3dso2753360a12.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683293795; x=1685885795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yHnlK3/J9vA42bspGNYsFHRqnY9V+IBOeoRMFxL1uR8=;
 b=rx//uw6FEWFZ9JiYZR2qlBMYfEHo03KXB7+P01GDnnldV+moGhsF/3x35SqGd9z3DY
 PU3Lug66/vKO1zMg3hvXbLRJlbXuRBJv9FTuzooRT82T32GiLJuuov6DNDBAPWpXYZNq
 CkwD5mO25jjLs+gOYbiB3cCcpY3e9IFF7xxbPL1qc9fxpwqq5iNoOz4dLPS9yWBXT4JF
 W4JsWyFnElHhhELdH3ehnoYG85Vh9pejJMZKTGJvyFZH6djzNQuEbDQ9rmNGT+H1p0xP
 smicvlWBoMdrTwmrg/vWAVslbG/LOe0xa3IxszM2FMU1dVP4IaeUJMhM+s+z2u1tlTsn
 bDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293795; x=1685885795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yHnlK3/J9vA42bspGNYsFHRqnY9V+IBOeoRMFxL1uR8=;
 b=KoTPxXEQ+h3J7hd+o6om9M+0F8alIvHFUSimzoRqRtdGTztsyFFC3XOC97pxB8fcO9
 lS55qEZ+VaJ85libLLNhPvsmGwn4BrGMzQxcUCRsj4th+lga19LigllwOu22l/0zmHGM
 eaDokXWEbctT26Hck01+4+P42tEnq3BQyzvyv1gWjLlRlZHjRg1M1FUCwKD8wIykM8Vp
 deWtmC2mI07UlKz1E3yfKKmm5IOq/sUzt0Fkb/lHDh/9BwjMtShLCmo41B1qPBSBA0Jv
 EPr90ODhYuqWVcbE0QsXslmO9WMFcCJxGuMpv++6/sCtC6zq+E/KWjIFkDugGh5hsUmN
 5J0Q==
X-Gm-Message-State: AC+VfDz4gJmpoJjabylbhPcKPs42Sz6PaRoVO1Ubz8gGiItdmfJo+aAG
 o898oe28RY6aAvT7iL6RD5tzlV4ypUDnUxlt+FV3bw==
X-Google-Smtp-Source: ACHHUZ5I5CkON9eMVXcoj/794f6VtZjYZpg0AiBhWIXtFFud6/LuIjiCh7eXmzv8d5Ux1Jp6U8cx5wcTpSpIDaX47Yg=
X-Received: by 2002:a50:e601:0:b0:509:c10d:b53d with SMTP id
 y1-20020a50e601000000b00509c10db53dmr1575897edm.23.1683293794708; Fri, 05 May
 2023 06:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-55-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-55-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:36:23 +0100
Message-ID: <CAFEAcA9jskOmO3GNjnGqs_PUN_H=sFYUHywWb07Mx-AfHUGueA@mail.gmail.com>
Subject: Re: [PATCH v4 54/57] tcg/aarch64: Rename temporaries
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We will need to allocate a second general-purpose temporary.
> Rename the existing temps to add a distinguishing number.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

