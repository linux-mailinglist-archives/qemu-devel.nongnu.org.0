Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E902F364877
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 18:45:00 +0200 (CEST)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYX19-0001HW-Nk
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 12:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWyE-0008IA-DA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:41:58 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYWyC-0002OS-NO
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 12:41:58 -0400
Received: by mail-ej1-x631.google.com with SMTP id l4so53906321ejc.10
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 09:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vv7nwbcaznpBm9E4QAvbrTyclFMpSz5+qEibl7lPpS0=;
 b=qoUD+Wq4w+lFdX+GCMgzzmdKJCXde6rPRz1IR459Pro0Hbneu6yd2FewU7SG82IVpP
 lAh2OeuUCgngdsWCoYepksEG07R9RVbZkK8pnaTqi91tSyt8bCawn45qpcSMeHU7k6/S
 dZKngusV5u+KrNQCtRGTwQ9U033NTePR0ka7Gvifc/ymHNeP1Mfjabg82eEN7bDTCRZ1
 /Sd69Q9jJgdmPhpkwcnAKEEdzLEIBEy6wcMZBfp3lk9dkKfzAb6TQ1Df+7jdgrHVc2gt
 RuidGvxVDV4WtWw89uZ+hQ+mrszUy1xTvszcCsWP3S9fQE8jaHIoXTs1H0qo5B6a8f2C
 3MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vv7nwbcaznpBm9E4QAvbrTyclFMpSz5+qEibl7lPpS0=;
 b=IbemKiPQ+CY0tmRqJjymxVma79S207PMz8c1rrWah74Mg6Ucpr+R42GCzQ4Mdwhq42
 6ttN/o0Iin8xvgyuV+QvUr3njhlhGgDEkUQ/CoFLok5Q6ZRfvGbwic6+3ljJjKbeh6ex
 eW2AhsC8+8gXJw7f3ill79QgsEdGqxu4fXPU2BaWd4U3KQsECS748nGdbAEYj0FfGTmA
 ib9KtabNTeD+mpFHnFbh8ShnKULJ11aWL+R29JQ4L1EFLbNXH1nG3tsB3Bwlu8aanXgs
 tCFWBHdAjWbK/WQJODLtQh098tATmnyrNcHdIgqd0WPZ6wWDDW+sllKXXrKyoDMg5+Bk
 I7Cw==
X-Gm-Message-State: AOAM5308davjo4mIcbaOX6tL7G1zm+A8OOAHJSA6WX87NNtb83u/X89h
 Cq44txcem2xXTe3rwvbARqfar9DwPAxebx0IoQTjtg==
X-Google-Smtp-Source: ABdhPJxVWfLWmD14Xyz/LvtOzqeBXd7AJVZD2dzXpUV98Fq3qAXbnyPqIcsIVKIDVZWmEmaM6aBR2oNNtwe/DhyS2Eo=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr22827236ejc.407.1618850515227; 
 Mon, 19 Apr 2021 09:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
In-Reply-To: <20210416183106.1516563-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 17:41:04 +0100
Message-ID: <CAFEAcA_5FKb_BO8TK4_HQLYBWi7zhSGHuSARi6KGDSwWKTMO3g@mail.gmail.com>
Subject: Re: [PATCH v5 for-6.1 0/9] target/arm mte fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v5:
>   * Rebase.  Three patches upstream and a minor conflict fixed.
>
> Changes for v4:
>   * Fix tag count computation error in mte_checkN, which when used
>     by mte_check1 in patch 5, caused all sorts of KASAN failures.
>   * Fix PAGE_ANON / PAGE_TARGET_1 overlap.
>

Since this is fully reviewed other than the minor comment tweak
I suggested in patch 1, I'm going to apply it to target-arm.next
(for 6.1) and make that comment change there rather than asking
for a respin.

thanks
-- PMM

