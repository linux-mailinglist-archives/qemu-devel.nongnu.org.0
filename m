Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03C63C371
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 16:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p02MH-0002jv-6S; Tue, 29 Nov 2022 10:17:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p02M6-0002jc-VU
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:17:09 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p02M2-0007iQ-Q7
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 10:17:04 -0500
Received: by mail-pf1-x431.google.com with SMTP id 21so846217pfw.4
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 07:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OzA6LjnEyjuZ9UUoaR9yAPHb5CPUD9NtKGd5Aqy9uLg=;
 b=ia3tmk8bp6fqKF5VhyL6cjGqVL0wYOSd9KGAzS56t4691kc0JkMJYWGZ0vfpYhICgy
 hxPVUznHhzoAFB3oVXZhocNVxnehzLjKKotiq3MGj5IawCuowGCPcfgdoklM19E8XrLx
 jQuB09HQ6HmFXDXk2RVqJ36IHtbjSppzoErq/OzthWky/JXG5gabITq/zhTX1S9qSd6j
 PjYw1EUCa5ZP+r1TSJbRaKwzOoMPo1mmuO+7yov9Z2SPwCPWCXtQlLBvWB8v+xjrpx6J
 +EfVDOA8dMgVDGDurjmXqbCkdzQfutp9AiEoa9l/QH0FgCYTMhfgwoHjb0jqPQ4D5gHV
 mY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OzA6LjnEyjuZ9UUoaR9yAPHb5CPUD9NtKGd5Aqy9uLg=;
 b=qUdpUB4WHVO/D072oixM/g0Ym7iJfwWhshiHcAskfQCjpd5yQ+zyy4/3p87gkspABp
 lDx6rf4H/cAXXijLx2R9WYcQSRAXonWpZw0ida+peNGR32iUpZMwrlcmFjeQyfhq5dB8
 Ztg7pXQogdJPUKS7B8r9WmfKpMGGrX07XaTQHAGS5I/99eweF72127osGwrE8oWkjwZh
 2MBaSgKHjwGpv+0xjaX+jcJusTO3TmiEEALcLADIs9xP7L9Vf3BmnR8xRCXzvq+CQyX7
 ZrNc+n+6/OtMfenhTXeidBcrs2Q6II9L+6AVCN5Z3uWbyWs+7VaMeKGX9IchMSa01S56
 Mqig==
X-Gm-Message-State: ANoB5pmDT0DnhzGkmtE44YrMDbgQoqYM89Im/y+JuFRdRsEiyH/2eYPK
 U4Ax9nQPcz/3SRs0ihB6ZHONNVyHahPxjqY6kjW+NA==
X-Google-Smtp-Source: AA0mqf79uLyzmoW+0I5UjW1P+re/4OduLYqA95MbVm+cka7zzGH3KmESNMOeAQtzSzotftWmj9rHvuzcVKSgDo43Nvc=
X-Received: by 2002:a63:1a13:0:b0:478:5420:d2c7 with SMTP id
 a19-20020a631a13000000b004785420d2c7mr897019pga.105.1669735020320; Tue, 29
 Nov 2022 07:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2022 15:16:49 +0000
Message-ID: <CAFEAcA_4q_1qDEbpgBUi6MzDpX5T=F7M0cOaKF6cftVANOi6oA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add ARM Cortex-R52 CPU
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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

On Sun, 27 Nov 2022 at 13:21, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> No worries about the delay. I'm glad you are looking at it :)
>
> v5:


I reviewed and gave my reviewed-by tags for at least
some of the patches in the previous version of this
series, but they don't seem to be listed in this version?

thanks
-- PMM

