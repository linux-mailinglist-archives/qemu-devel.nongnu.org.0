Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD926A9FF2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 20:12:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYAp1-0004Dn-Cn; Fri, 03 Mar 2023 14:12:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAoz-0004Cr-Pl
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:12:01 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAox-0001TX-5T
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 14:12:01 -0500
Received: by mail-pj1-x1029.google.com with SMTP id x34so3639040pjj.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 11:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=28eOft/m9pkBnuEb6pZDj/jSbnSgdzZgdAX7OcHa0J4=;
 b=htAyzCQtyGwCadomCokeH5RjkEd9h5T8IqDZ81FH7xH54/5ySxnRo/7sKJDxbR3IdQ
 1C8F29tMMDpd2ysw5GweWQ+IqbleR9bz9iM2YPO8rIp2X/wJQs8k7W0ENabo4/hOcTPG
 3s9hVqoRLWxtPPbtI6M1SSfUBLpkfk4Eo+M6YWKZFskhfUz0OfxuSEi4XyH2qmKhmgn3
 CGnSVqAMoWevKPPhdMR0x5ngxSLLeUJSeJDLKn0Yq3zOS+6ZLx7J7j48C45nVlT+ZOp3
 T6wQ1IiYFBww+C5fkn2VnEga+NWShpV8QpbdvpRL1/iSh30nDmXLBWC0JYZ6sSXbXydk
 IYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=28eOft/m9pkBnuEb6pZDj/jSbnSgdzZgdAX7OcHa0J4=;
 b=Sg81bY91UGFFqZpLxapurRl4y7NDV+zkXnhDPvWPUBEBr5thdN3aq/2Qtv7sD4jbEo
 T1OCDo/SQYWCfq7IHWFzCzYxZdAC+2o6letssnoSh4FCdjq27Yx8lXdY25zi8EFdCoDb
 b/duLSlGgRr1K4ev/NAMU0GTx7flupHby9llQ3wgbSnaNrXSXtIwscGfJfcFfbjFkd6C
 +hrzBhkh7weBEp6yGhma67JZpGM+Tbgh6N0u69yJ/yLTZanNk/+PCkemj49uet+j8llk
 85q9ohWdygNFfrIYOnYwuSDtVVvi88prQ6Ic9KJLUFCGt7B6DtWGXYlc8EKAD1V9Yn3D
 1KGw==
X-Gm-Message-State: AO0yUKV+kQLq3t7JZopx9ZETN6W2NN6/IpSCOjtwEkcg+i/rKkRSC/wg
 s8L3D4Hobqztpotmn1gl1R6p/3dtKKwzeP/c3QUeQQ==
X-Google-Smtp-Source: AK7set/obMMT0xdiw7a4pM7ofIX1caztW5tOI34FRjHddX3vkayAjZbqTzgrjoD4/drKS6KzAEhc76qITFY/CXrD8ZU=
X-Received: by 2002:a17:90a:dd86:b0:233:be3d:8a42 with SMTP id
 l6-20020a17090add8600b00233be3d8a42mr989632pjv.0.1677870717696; Fri, 03 Mar
 2023 11:11:57 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:11:46 +0000
Message-ID: <CAFEAcA-kz9oTkBnMg08Pg7g83x+YA+CkpgMD3DVjQ7c1hY+7EA@mail.gmail.com>
Subject: Re: [PATCH v2 00/76] tcg: Drop tcg_temp_free from translators
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 05:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20230225085945.1798188-1-richard.henderson@linaro.org
> ("[PATCH v3 00/30] tcg: Simplify temporary usage")
>
> In the above patch set, we changed the lifetime of the temps
> allocated by the guest translators, and eliminated their reuse,
> so that we have the best chance of reducing their strength.
>
> That we don't reuse them means that we gain nothing by freeing them.
> Therefore, drop all mention of tcg_temp_free from target/.
>
> Changes for v2:
>   * Apply r-b.
>   * Fix 74/76 "tracing: remove transform.py".

>  95 files changed, 471 insertions(+), 7165 deletions(-)

The diffstat is really nice here :-)

I've reviewed the general stuff (except the python patch),
the arm parts, and some of the orphaned/minor targets that
might otherwise struggle to get review.

thanks
-- PMM

