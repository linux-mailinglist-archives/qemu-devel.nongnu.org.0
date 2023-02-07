Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E868DCBC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:17:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPiD-0000mD-Q0; Tue, 07 Feb 2023 10:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPiC-0000lQ-3s
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:16:48 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPPiA-0000yK-Dv
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:16:47 -0500
Received: by mail-pl1-x630.google.com with SMTP id v23so15969367plo.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmjDz7NwVQKVKrnkjhv2B/OLEA17s1oY+Ai/fM4GUxg=;
 b=dNgQvRjAow7z5A44ZGc3iJShiM7eGKQxyK3crx0oWz8cXyYrdsWJ/yp4nTjjOy4I7P
 MWBJfeNn4H3NSTAU3uYDkhvSPzKILDtVjGZer4poWBH4Is419UPzFwkitRHshyMRa+dq
 yzd3ChTAf2wB2OEF2j9jj7ysDbEXAvQOYwie4CVmAu6HTqeAYhDwQGGYkfhmWDrA9OfM
 M/rq71KcRMA/UfY58R4lbYbRzZRsw9wjF8mjvy4j/pQudSwtXoesnRc9dlhZyay4D5+j
 yHv4Hyz/M6tfKEbuywQJeS9I15Cyvcc/qUR5HAf8em1cKgog26nrWo6nfRBAlfhynlCI
 GzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZmjDz7NwVQKVKrnkjhv2B/OLEA17s1oY+Ai/fM4GUxg=;
 b=yytAUJx1vYCNGoozAATp6GQnw/Kkj8QBvxAGgGk+Fe52i4MyFDGkU/eZd7mkdj0JJd
 k4paLZdSY6D4G4fgsr2wU24IVHbKtA9gsKk9h8/QCKqt7Q+EuhSxmhgZ/DrZYCYCPwl7
 hFo8XREcS1qL+ytMmIebJy5VDBszRN9/ZENwXnxlGk5l/hfXJb1swDhYzPkj1Sbiwtm6
 o0SNCHBnu6J/CzXlpa12FlBpqBnsxqSnO2YIBMuOexmLdGAqHI5ygdcAIeLe5EqkicuM
 pkUkCmUM+82awgCyLRQP7WfQMiYGRMLRbqLt20rdLo4Cymf0Pyw01o2g+gmL5WY0nWP0
 nyQQ==
X-Gm-Message-State: AO0yUKXwIdIgWWof9o8ouJCl7fx50It4nu8shu4BpmbZ7j8ifsYzuSPY
 st0Tr9x7gianE+Dy32eSd8sZK0/SeTn5kpCpDPJ8cA==
X-Google-Smtp-Source: AK7set8MA6AsRiEfNA3qqlgutmYOeiQqa9eXLb+/7/cBZixTrt8sSmGJTYS6UzYDHngF9s3xrW3Xx0vMUUEmygjXU4k=
X-Received: by 2002:a17:90b:3906:b0:230:eadf:4a2e with SMTP id
 ob6-20020a17090b390600b00230eadf4a2emr725759pjb.137.1675783003427; Tue, 07
 Feb 2023 07:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230206220722.125814-1-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 15:16:32 +0000
Message-ID: <CAFEAcA-51+enq09m=3FEzfxaDkB7mXnJ6e0uXuNNFXMNQb4aSw@mail.gmail.com>
Subject: Re: [PULL 0/8] qemu-macppc queue 20230206
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Mon, 6 Feb 2023 at 22:07, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> The following changes since commit 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b:
>
>   Merge tag 'pull-ppc-20230205' of https://gitlab.com/danielhb/qemu into staging (2023-02-05 16:49:09 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/mcayland/qemu.git tags/qemu-macppc-20230206
>
> for you to fetch changes up to 5df3eb4d361fd609632281969b101f4f84f1c4d8:
>
>   mac_oldworld: Allow specifying nvram backing store (2023-02-06 11:41:39 +0000)
>
> ----------------------------------------------------------------
> qemu-macppc patches for 8.0
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

