Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDDC5133FF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:43:51 +0200 (CEST)
Received: from localhost ([::1]:51060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3Us-0001aa-4T
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Pu-0007Kn-Ab
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:38:42 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:34414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Ps-00072Q-Jo
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:38:41 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2f7c424c66cso51584177b3.1
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ogXsQ7bY9F8CqLkBBE5fpcRXjKSXSwqik/FtxhMKb/E=;
 b=yc4wd9/XBreD43OgXVpF/RUV4kXXj14uavBAs2yQcGejRTfJvb6uQqaRd8euuCk55L
 7baK9WB5cER9DaYFiIZnPVPGaRE/qi4uKmiMbDKJ1YVH+Js27Thnuc+Vq8byE4AC/pqh
 drgy8XzsyxqIF3hzN16nkev0KRyIbpQ31WkPyOO4s9bvkoNDrql1ish63fedux4DAanL
 gabu4Fgf97gJT80Q0eHD8MCoiaJzEkSzSxv5LrMdLZBZSH7eET6UJFUBL3/tEivJFj++
 2TWSe5iJeTcQMQi/paEB8Zwdovd55L/rDq5ZEKNLKgY9PHH1IiyEP3bPqau5VSFBOww2
 wXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ogXsQ7bY9F8CqLkBBE5fpcRXjKSXSwqik/FtxhMKb/E=;
 b=z3aLI5UpPZKUjRvivMKbAE1yOrtG9T8rEvnGN1wY2zsPWlPmU7qJHPiHcl7tAJ9AZY
 30MG6p+xybVhwX6XVahPWsLPR4ugvgmZ4PZh/FJnofF7CegD7IwGtbJBaxXXXT9cM1WB
 eNt4aWXI6kghDvC/j3PhQ0tOZSgH0h0QsAnMlhoOmL+6NEbei0YCfI+UGOEXHBYplpP9
 WOVSdBpeIo965WgTO6KGnC6o+5/4+L17HVCwQLCNE4NKh2f03XGrrChkOOC0QqIB9f0B
 04LBFgjZk5Fy5JD6ZCphIelKvboaB235lbQa1vMOO2rlMvekPWxTQC/hQjXYMT6gyog+
 9V9g==
X-Gm-Message-State: AOAM531xv8j5+YZWv1CNRrfZ3CGL2hinkthxuuXeNHl+ZH2MniMh06Vh
 Y3wnBO33e48HMMvmjn2c+RUMAbyY0JzEwZk+a2L7yQ==
X-Google-Smtp-Source: ABdhPJyFi66Cmmj3OoZ3q7KyB97oJabyYvY+W4KQNOnLVvKD2wddyAHCunwTyQVQOmq+LB2c8yxbVdhmS0w+azCsZWA=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr32596776ywt.10.1651149519016; Thu, 28
 Apr 2022 05:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:38:27 +0100
Message-ID: <CAFEAcA_BSgOoXuaTCEv6XNUPNJeThG3X-PJDp3WrT9Fv3R51ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/47] target/arm: Use tcg_constant
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split the tcg_constant patches out of my larger v3 cleanups
> patch set, and then split the 5 patches into tiny bites.

Since there was only one issue with this patchset (in patch 17),
I'm going to fix that and apply this series to target-arm.next.

thanks
-- PMM

