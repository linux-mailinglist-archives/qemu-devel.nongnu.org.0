Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC4450B404
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:27:06 +0200 (CEST)
Received: from localhost ([::1]:39066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpZB-0000xZ-5l
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpSE-0003Se-7q
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:19:54 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpSC-00045h-RZ
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:19:53 -0400
Received: by mail-yb1-xb36.google.com with SMTP id v10so4603977ybe.5
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MX9N0sOq4l0ar/1VeOFy8QzZcmFnRZUa8GW7ggry6WU=;
 b=T45PfpdUqpaIrWghcJV2YorZil6fXUKZ0LTivgIwgG50hSbASUg9vM/JngUhPY7xhO
 sAUG9ZswgFVUYXpAzyjVWp04pvz9QE9SWpNTzwNv7+Cnbi3N5byN1ld9ROeO7pip2oM6
 8rIjBnWr3mKRpK0YP09m1kIgdm7MGseKd5uY0AlAtQKSlYPzivA7nlsZWOhGvOcpzbe9
 C2Z6ZzXzNnNMBdwK7STjHsLIuiHqwbEt00WzvEGArM0aJweWoBUBLebxTkC+6noP704M
 0M6zIGyi4f6yPBuMlk+6SBmHxQ4JLyHiPDlK23DZ4re5FcRgn9W9mVoS2FCAaesB71e7
 rpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MX9N0sOq4l0ar/1VeOFy8QzZcmFnRZUa8GW7ggry6WU=;
 b=dYS34va7Qz3NYoFVGaUdqZc7mPsC7H+Mu8WN8fc9lJ+bA/3i7E54nNesmqXAsIrRz5
 o03aw6P+dp7EPLSMAr8+33KjpO9zqFsR6ecWwHYHHS8kw0+WLtP/jtG25RexJStot96l
 09OmUo8ncKdXpqZbKPwAxVCjxDdPy/XzAOJCtg68SnmsZV/Oo1vYXk8d13jt7QhDW2VH
 RAHq1+VWrJnuWcA0gWXMAHeG1JglVt0nyi8V6PPMRFTYasm0Re5YsVN93auGeeSr+qVp
 ZgAs5///a0zaN6FyNjZ3xdyL9LjZiKQvXVbTEDrwMOKBi1/nchYkcyvK1Ok1HzNcjHQu
 KhHg==
X-Gm-Message-State: AOAM530VoOn9TQujvDiyJ4crRuipLLEV+mOdM1pk8WNHKJc9efRiQ3mH
 H/9/i2kfn4WqV5wHcPTBOYba2ig3RBfgi2AOWAnEfQ==
X-Google-Smtp-Source: ABdhPJwxVql+aF/HmwdioSxj+aXPQ4eVWIg9P6sA0UkBwBSY8VnsFqHcN+eG+q6F0E4TqXzUy4NuSVR8StN72QcnX1c=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr3473789ybq.67.1650619191534; Fri, 22 Apr
 2022 02:19:51 -0700 (PDT)
MIME-Version: 1.0
References: <1650094695-121918-1-git-send-email-chenxiang66@hisilicon.com>
In-Reply-To: <1650094695-121918-1-git-send-email-chenxiang66@hisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:19:40 +0100
Message-ID: <CAFEAcA8ATBoSSWA-+kbthkwkmOdUui7Suni--M68C=8vPkoEmg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3: Pass the actual perm to returned
 IOMMUTLBEntry in smmuv3_translate()
To: chenxiang <chenxiang66@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
Cc: eric.auger@redhat.com, linuxarm@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 16 Apr 2022 at 08:46, chenxiang via <qemu-devel@nongnu.org> wrote:
>
> From: Xiang Chen <chenxiang66@hisilicon.com>
>
> It always calls the IOMMU MR translate() callback with flag=IOMMU_NONE in
> memory_region_iommu_replay(). Currently, smmuv3_translate() return an
> IOMMUTLBEntry with perm set to IOMMU_NONE even if the translation success,
> whereas it is expected to return the actual permission set in the table
> entry.
> So pass the actual perm to returned IOMMUTLBEntry in the table entry.
>
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

