Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F2358165
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 13:12:57 +0200 (CEST)
Received: from localhost ([::1]:52276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUSam-0007IU-Nq
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 07:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSY6-00063j-Vo
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:10:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lUSY4-0008FD-60
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 07:10:10 -0400
Received: by mail-wr1-x432.google.com with SMTP id b9so1699693wrs.1
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZyLe9swHO34R2qWqHvdrajdMCg89VkbXK3LBlPAKIIk=;
 b=sSwwv1Z2DoPBKXeGPB5T7PDS2Af3pMTb7YAwacELleTYjMLcA+MSqoD9+ldCHCr43R
 r5RokknHQCLRCf45V2jlGdqJKJ3m5t2f5uxXsw+In4t5EYS95RpaFf1nOPym5mzuuN9W
 neMhI4WJzVsZ18EVA/SxFPxxS1pvdT/KNGeZ/qIBvU4asX1+SMVYGz7tTz+YercSYVO5
 ECdGO3oGW1PcNTAWCsmaL/leej4E76VNlooVE8859DWCixOHb3kKarB4j0RIWwoWX6pS
 eb4CQwtegzXkey+j0eS4XXnjhakEB/K8/SDYKeiTxrOam2pCm1HlOHefoeXDJJ/3scly
 JbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZyLe9swHO34R2qWqHvdrajdMCg89VkbXK3LBlPAKIIk=;
 b=W/LFxuZJzbdrV3WNvMHc3edqLTE9VlMDR9pnYIL2/PF2cbXSuPsyBCLF9G1zUb2bQ+
 b0wGM3PyV1CXxnSuWBCnydZsduG2czjw8+jmZseIfYWNllIUBjafqVn0AEFgW990ExZ8
 pM6g3ajx+htu8tGlr5vYhM8xsGbgtDYvH64JRAqIs/P8+2xW+vz1uvkvmrq7r/ih8xnY
 1kC2WwJ+oK5Cd6N6T+XkU/dcNI37gMgR8vmRLIhbs/gkIsSn0G2Jm2n+5yrLXsNCMBqK
 BRM7OUB70Xj4FewOa8akqMXfEUyG7wd+bUb+GXLH7euDSuarlXW8OhmDFQ72VxZ2GGjJ
 4Evw==
X-Gm-Message-State: AOAM532pzKyiMyuRzwE18woc9IlYyabztc9lmr5Pd6DXF9wuIXhIdzLP
 mmLQ+kzYIc8lFYZkaHSC9ovHOg==
X-Google-Smtp-Source: ABdhPJwW/RB1IjKK/KsatSPPLuBtbao9CeawpwLEWVMS+aaPX4ZKReWrER1PC4Qh/IQPQDM1pRR/IA==
X-Received: by 2002:adf:c70b:: with SMTP id k11mr10652560wrg.165.1617880206631; 
 Thu, 08 Apr 2021 04:10:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm47618866wrr.42.2021.04.08.04.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:10:05 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60CB31FF7E;
 Thu,  8 Apr 2021 12:10:05 +0100 (BST)
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-9-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v4 08/12] target/arm: Merge mte_check1, mte_checkN
Date: Thu, 08 Apr 2021 12:10:01 +0100
In-reply-to: <20210406174031.64299-9-richard.henderson@linaro.org>
Message-ID: <87eeflt4ky.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The mte_check1 and mte_checkN functions are now identical.
> Drop mte_check1 and rename mte_checkN to mte_check.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

