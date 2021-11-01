Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B83A441F29
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:23:01 +0100 (CET)
Received: from localhost ([::1]:56240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhb1Q-0001R4-Nx
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhazD-0005xo-Ts
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:20:43 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhazB-0007lq-1g
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:20:43 -0400
Received: by mail-wr1-x42e.google.com with SMTP id s13so21993537wrb.3
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFa1gXjSxM9Z1kTYtlHHNqkwm2zp5HC7+2V+Wud23qU=;
 b=XYxrHJcKvnr4Jyrg1WYbjtwNml1h3aZUPYuHrdTsufIwJuS7oQ9Xsrdd2QHd5gtlt8
 aG3jYZj06pFpG7waazctlk23Dhte4ottp3J5UyoveByqf5UQYzVUkNzOgc2Dpj+zuWxP
 qc9lDqQFgMlJFKmwMOd0YBN4WPhjcPzOSI3zCGy4uoIkjx6+IbYr2YMb2dIsg9Gn2pUG
 a1YBpD9EKbzCNXyM4mX1NlzOGNDX/W+Fsp+ay7Dzh7a1ajbxwgP0Dz9bNz1KFYouln73
 iZ06JtfQk1JzgMEfhC6BF+xkD8vklDaBtFCYFIQRR4ZE5Ok3VB+SMOuTWzfi+W4P7Vol
 Ce7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFa1gXjSxM9Z1kTYtlHHNqkwm2zp5HC7+2V+Wud23qU=;
 b=vBssp1En3I4fsMlI4sokwGrb2a50aylHxV1ayLJnY9OVhtX89tghOF2Z4I2mnpOuyb
 khdhoqn1Omq84Z9mubIqiBxCyg89G92CZGaWY36JyWLH3HKqwkieuTfJWV9b86u+PqwL
 d/9eFiqyzqEEWAXKnN2Y85Y89E73ZDMxMFJFz2j1jcGeFYwqYqjwkcJaqHBxVei9RQc3
 8aMMhmiD5fS6rc/Ggwpt0RxBDPf1C5H8Id1kszc9IxDWDlzjtQv02PZRalkz2g71mfMA
 7SDUwTNDvfq/hm/zZx3f1008sKJX9bzuFLOpmAXwey/LLUxNuirF4s+7HEqw5mmhnH1E
 0jsw==
X-Gm-Message-State: AOAM533Wqh3BoRa/fiAet4ek6TA+d/FwNtEs8OrpJosiXaj43Omd84/r
 hqUhleDrwzVtymxtM+itiLGocuk4u4qhYPiPT/T7Vg==
X-Google-Smtp-Source: ABdhPJz9scimQXnRbbB3DZGUXiP/BSlNoKbjmmgr2iOAtzN+EHDQ1XYm5lYieq1ToQQ+sS0UYvdfU3d/GG3MEF2m+fk=
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr39654944wri.376.1635787239755; 
 Mon, 01 Nov 2021 10:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
 <20211008002628.1958285-6-wuhaotsh@google.com>
In-Reply-To: <20211008002628.1958285-6-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:20:27 +0000
Message-ID: <CAFEAcA8yqpdMt=neG7KuOTVo-5UiTOdDyMNKM98UYtEn8XyUzA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] tests/qtest: add qtests for npcm7xx sdhci
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: qemu-block@nongnu.org, venture@google.com, Shengtan Mao <stmao@google.com>,
 bin.meng@windriver.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 maoshengtan2011@gmail.com, Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Oct 2021 at 01:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

