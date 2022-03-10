Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44454D47A9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:05:18 +0100 (CET)
Received: from localhost ([::1]:39872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSITl-00088M-SQ
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:05:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHl4-0007NJ-T2
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:19:06 -0500
Received: from [2607:f8b0:4864:20::1133] (port=34462
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSHl3-0008PY-Ap
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 07:19:06 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2db2add4516so55888137b3.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 04:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZqwnBki7gLZUn+GFMTvEi0FvKuOBdHvHEbXCJZ7qpdw=;
 b=IzNtSW4+1r4pAstPAmyXXc4y3LrisVlSYV59RC9+BoDYtkxckhvPPritnWx+EQ3wRo
 3v7P4L1OCi5fI5VK4FJy3yuWss3fMomNfHN/U5qywC74PA/Xcghr8OX9j1R2nyNvcVMn
 AUfCqE2sIKgXlQYCE6YRSbR+RYYhoJ1G621uma5z7GCmzyz/kTHGZTSOq+oh8i60B4u4
 0tWBpWepf4XFUO4gqRGA6gexRXwuVQwMsjDhJNeoUd0mDr8uKaJ5S6k076xsqvGLq8WV
 WufNGPC7mELZWxnZ2GngE/+Mmo7fkflrNHDuZQmOOO4lQl+dUCFiqUBRdx1zQxVwVCFt
 sl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZqwnBki7gLZUn+GFMTvEi0FvKuOBdHvHEbXCJZ7qpdw=;
 b=xVkdzq+W9rVMViOXSKyIvoQKt2nifam8YZw3EDu8TaO8fMy6MWRNMOcyQ3rNFxbGS1
 UFrYdfE48blEBmANUiZrcw67OVNq5nzGv3tKnUhzMzNkqeh0Y+FB4epPfpn0meL+n6F4
 +ocU1++jr9orEMjRBb1KJVLxWlAsu2HQYYgEgAh+je+6HdVl5vjQZt/x4umNtjFrNrZ7
 F7SCm4eFRQ+SF8r7z5b4JJrxbF/OKaCnvwXEtAPtDeP4Rs1G09HhRC2R10pHuqIXTJWh
 SEU3+9KcI+HXTusyY56UsSS2TQPjH5ZHpGa+QOuv6boghbvgaCVreC4kcCphNtJpzlLu
 M/IA==
X-Gm-Message-State: AOAM530eBpt8mswxink9K1RyW5pzLqL7XFiffyC534GyOoyVwu0Oomg9
 ERTE7w3Cm4TxLZZdVFc9goOVqKJYOKgfWJstUOxk1g==
X-Google-Smtp-Source: ABdhPJzCS1aJTt7g4UyYCUMQa03VsmzLXJxxNbto/yZq1Vh0jzNxWQDDQjKovWxyd3oxlnDbCjvHCD+sg96mRa4+UFg=
X-Received: by 2002:a81:12c3:0:b0:2dc:5f5a:38ec with SMTP id
 186-20020a8112c3000000b002dc5f5a38ecmr3644064yws.347.1646914740361; Thu, 10
 Mar 2022 04:19:00 -0800 (PST)
MIME-Version: 1.0
References: <20220310112725.570053-1-richard.henderson@linaro.org>
 <20220310112725.570053-9-richard.henderson@linaro.org>
In-Reply-To: <20220310112725.570053-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 12:18:49 +0000
Message-ID: <CAFEAcA_+m0RuN7egowfYCjEz582sVMrh9GVH-+6_2BrtF1Gokg@mail.gmail.com>
Subject: Re: [PATCH v5 08/48] linux-user/nios2: Only initialize SP and PC in
 target_cpu_copy_regs
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 11:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Drop the set of estatus in init_thread; it was clearly intended
> to be setting the value of CR_STATUS for the application, but we
> never actually performed that copy.  However, the proper value is
> set in nios2_cpu_reset so we don't need to do anything here.
>
> We only initialize SP and EA in init_thread, there's no value in
> copying other uninitialized data into ENV.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

