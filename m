Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E872151FD7A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:01:14 +0200 (CEST)
Received: from localhost ([::1]:48424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no30k-0003zh-0o
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:01:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1no2m1-0005R3-Kw; Mon, 09 May 2022 08:46:02 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:44930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1no2lz-0001GR-4M; Mon, 09 May 2022 08:46:01 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 v33-20020a4a9764000000b0035f814bb06eso380596ooi.11; 
 Mon, 09 May 2022 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZWNSLBiHy0HwskfNuWv1wWalp4DDuFtNIlT/mcoC3pc=;
 b=b8FUlu+UTzVYrRgcu5iGiU0RrO0JTAesgeoGKzQqmfmJwpWRHpHoQc+m0HNLf5Z9N4
 pLVb568/Q73e2d+xW60MIvQ20gPH+ROjJKxaBvwSYdVun3ZNe6yIJmjosnVKvuXJsBnQ
 YIeDJhCgVUaz7zhqORy4Fcb+vLyY2J7GL2lt3BXlWfkvDXMbSFtnfO4gr6VZ9sX2vwOg
 prsptZCn4u5ADGdRbEDYYTwa+RUp/h9A1yO9A7NQyp/npmrzj61LcFtNPK/qMRrp064Q
 OAIet8cM7Ox3UhAp42cfsJTjUoG7Ha+Enbvz6GmOyGzpcv/+oJvjPNe3sFRz3txh9/2F
 7bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZWNSLBiHy0HwskfNuWv1wWalp4DDuFtNIlT/mcoC3pc=;
 b=M8YcELBD12SUS/X5GKtsDnnBF92HRBjnpszHtdYG6O/5+tbN2zMm7D6Luow4920qP+
 XpYN+rKEiuH3z04+HPndifML0uSS+1r+Y4hl1E/bwVtvqtml0eWDLKYieq4G1UxLyUv7
 fL/4Kbfid8FBhkL0s9HFw0tW6iRwzoR7+q7vcd76qhz2f1qkuKckUWg3zOFGDMkNxqAj
 ZM4jOpY5+hs1hnDX6LPFkyRivYfxwy+vGrSgQXo2wSqSc3oO9jD+4VDPMHzAjROWht1p
 9tuCGPP4opg4LjX+OufV/JUL1DKLXo22LpK3JotF0KTDmiYUDLMzlKvtUWnJCAk1LmSl
 88bQ==
X-Gm-Message-State: AOAM531wraKDAuRc/gtix/z5Ai58glnmNqeliTh3RNPo5xuuujUFisTS
 Qex5ynF1rhkDggJhrzOuxBEkfCHfWLEF4bTwEJs=
X-Google-Smtp-Source: ABdhPJzYSXkixYVoROvfjuxVf2YRakAz0R7RRS97CkZ7IRzne3SwaAGh4I4IOAfLePxD8yk8YBu1Q30/SgIJaclDc8E=
X-Received: by 2002:a4a:db95:0:b0:35e:94fc:5cf8 with SMTP id
 s21-20020a4adb95000000b0035e94fc5cf8mr5767227oou.48.1652100357646; Mon, 09
 May 2022 05:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220505084208.2338968-1-stefanha@redhat.com>
 <ae41daa5-4c10-b805-59e5-442c43876036@linaro.org>
 <CAJSP0QXTrqdGhyf4b8sxC2Qmj_Gws4sr3XDBq=-vj_sEuaKCQA@mail.gmail.com>
In-Reply-To: <CAJSP0QXTrqdGhyf4b8sxC2Qmj_Gws4sr3XDBq=-vj_sEuaKCQA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 9 May 2022 13:45:46 +0100
Message-ID: <CAJSP0QXGsnr1ebEgsNy7ZutfJK02mN0pS=dDEX83x=fyyixFgw@mail.gmail.com>
Subject: Re: [PULL 0/3] Block patches
To: Richard Henderson <richard.henderson@linaro.org>, 
 Nicolas Saenz Julienne <nsaenzju@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 qemu block <qemu-block@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=stefanha@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

It looks like a race condition in the test case. The failed test case
(tests/unit/test-aio.c:test_timer_schedule()) assumes the process will
be scheduled in a timely manner. A timer is scheduled for 750 ms and
the test waits for 1 second before running the event loop. At that
point a callback schedules the timer another 750 ms in the future. The
problem is that the exact sequence of event loop (aio_poll())
invocations can be unexpected on a heavily loaded CI runner leading to
spurious test failures.

I re-ran the job and it passed:
https://gitlab.com/qemu-project/qemu/-/jobs/2430529496

I also ran it locally under Wine and didn't see a failure.

FWIW I'm about to send another block pull request and it will include
these patches again. Feel free to wait for the next pull request.

Stefan

