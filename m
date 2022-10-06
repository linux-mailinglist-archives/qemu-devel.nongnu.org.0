Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7D5F69CA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 16:39:27 +0200 (CEST)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogS21-0000VW-2P
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 10:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRzf-0004dl-Ik
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:36:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRzc-0007Yc-SC
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 10:36:59 -0400
Received: by mail-pj1-x102a.google.com with SMTP id lx7so1980947pjb.0
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eQU6bqWNs3L7lCQx7GERfMRZmgqYiLbhYE1tNAB2m6M=;
 b=Y5bWWAapi1YPLGtNfVEb8dUHSeIIwDX2Gq0aXDgEWyzEiVjfGHb1c4/7tm29mDQZRp
 uBSPFcoGuoKYpqJlGY600/+ajdPib0bGvKTK+k6HmO1zTjeJbszeyw2s5APZhoALgMzy
 AZvKBctDgQeZOXFYStXiw0qN98gfbAp0RdnQ45gPAXY4+JECQqJGKQj94V01Iw36ZRGb
 fc0s/RjPhhJmT10/XP30V1CCB/Z5+9xfok6cyNCYprgLLOa6fnMaC4etojSOHoKAtojb
 zcFLhKo4HH2Y5quOndsuYpJNqCGUpQ4YP7XxAFNb2CV2OYjSrXjPN5EaUEnbXZCAOss6
 HGdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eQU6bqWNs3L7lCQx7GERfMRZmgqYiLbhYE1tNAB2m6M=;
 b=X0BK1aQ+1gDVcMo44YDYC4kvh6AVpdHNhRefgKYMIpR3RnyWw52f3BHwNDWOw0/Zwo
 Xed7ABRsm5NQdbjqfXgF94GHk8/PWYDhpueM7jBQvp3fJQVOQvLCcuZEXJTi8yE1Rkx9
 s0qNAc5ojkO4COP9JHsPAtLM3W2lTLw3zwjAHQk/+In9XBUpbazw7SQMhcWmaXATC5mT
 ubfokyhifiJqjoDz0czgf/pLROF30KdC+bsILktn2X6kIePwCMgvFYI/NbIZI/rXddIv
 NVoInqO4VdNcp4r7SBOzRO2p1VHm7qkMA7KB73J3aol071CTgWGwBNoiYk1lxR85SzHK
 B1xQ==
X-Gm-Message-State: ACrzQf0QSrEgyZrHlppHS6oQS1S0qs24Qa2w14RT5vdGrw5TleWJN7aa
 xrw5YatqnNsYKyTbJ5cRfgWkIk+GvdmFy8IDx5kg4+jwsCQ=
X-Google-Smtp-Source: AMsMyM4LudB4G29eGMaKh/TgDnLi3Ggy+o//C6r7U1zQTmUjL3Q7YgV+N2qF8LQlA4iTuRF4RkQQMLUTDpwmB8ef/PM=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr222699pll.19.1665067015432; Thu, 06 Oct
 2022 07:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-21-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:36:43 +0100
Message-ID: <CAFEAcA_nr8FaB790u_YQHrBhtrRqHs5Z3uopNiVwSP1+LkxJvQ@mail.gmail.com>
Subject: Re: [PATCH v3 20/42] target/arm: Use tlb_set_page_full
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Adjust GetPhysAddrResult to fill in CPUTLBEntryFull,
> so that it may be passed directly to tlb_set_page_full.
>
> The change is large, but mostly mechanical.  The major
> non-mechanical change is page_size -> lg_page_size.
> Most of the time this is obvious, and is related to
> TARGET_PAGE_BITS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

