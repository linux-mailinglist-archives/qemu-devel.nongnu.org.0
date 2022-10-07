Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688BA5F772A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:08:17 +0200 (CEST)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglDD-0001dU-Tv
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkoK-0001G9-B2
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:42:32 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogkoG-0002NQ-K2
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:42:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id l1so4158264pld.13
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TCOREYYe16dkbUzVNRjr/JLgLa9vMx7CIjrdeUnWlHk=;
 b=QRu1FIjHZ1lO+jI2G7XhuPlFIjYteDX4O79/1KQ3ipTdzXmDihbrPwDWQXxFEJsB7h
 kpdnK4Ru/glqYs5VrDg4cuV9b1B1TuQzB2wiHjTgwz4BBOZwZgC1LxrfqBqj71W1QQjV
 RVUn/aimMbXVRBNHu+hufoHfvWm1ENK59fvZOs1Sy7/rS5psmrRDFed4g4yYzoIZ7Lf6
 iZJmyq3loxglkxqd9I2lkk6A/WuoqCt4rvOoc/ew2tDIrtyKPZR17Q9ghTzocL8TpR6p
 aWC9vsDdkx9ciHsmP2X3+q6PRF1jIUVm7YqHA/qGzOSAfn7dwnpau06kYnMCmsGQ7NWt
 LoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TCOREYYe16dkbUzVNRjr/JLgLa9vMx7CIjrdeUnWlHk=;
 b=vESv3YEVVpuRVtRcxl/JmCdHt0busdkqeC6bffSBj8adg2sCrMB6dEs1PIs40/XrQZ
 Zu2NIqvlNDchqogpeXwZbycm+PXsgTGiX2mXqd0yFjxDw6m6S9ZuioCAtcZo7aEsL4l8
 /+T7kwS3qFoYm6jVGp/z0uOG9WfCdV+9PRi0YzfoPEsWlPN0OwvGdw2PQvjgrg+3I83R
 DvbT0YqG3Owrqepfpj3nEpRDUZKpxelQRadzd/ePulsmAGipOca1Xngxv2IZ/fBQ8woh
 zsqKcMkUFalwJXqGmRZUcglJrC5cOTg4l7UnHQOaA24lsTcY//fXHt4OLBFSYwHMXmhD
 yjBQ==
X-Gm-Message-State: ACrzQf3Yaio8cxZ5Q3F7dvCI9fDI4LBSfaZ6mvt16JmMK0ha6PzNz8EL
 bYMA5fFGGmYIABhDoW6DJ9+ANwunbNwyYia2zSb45g==
X-Google-Smtp-Source: AMsMyM5UZRc5XQ+5UwLQWVyww2USMw0I+YOHCVuv7IT2kE5wPfLekaFPqMl6BQF7aE+gfhERRujpT/kbLJfrpw+8cgw=
X-Received: by 2002:a17:90b:4b8e:b0:20a:f240:9b23 with SMTP id
 lr14-20020a17090b4b8e00b0020af2409b23mr4683595pjb.19.1665139346056; Fri, 07
 Oct 2022 03:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-43-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-43-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 11:42:14 +0100
Message-ID: <CAFEAcA-uiN94rDnjZcTzdgfLBzzMSdpuxyOFU0QPgWiB2e4giQ@mail.gmail.com>
Subject: Re: [PATCH v3 42/42] target/arm: Use the max page size in a 2-stage
 ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Sat, 1 Oct 2022 at 18:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We had only been reporting the stage2 page size.  This causes
> problems if stage1 is using a larger page size (16k, 2M, etc),
> but stage2 is using a smaller page size, because cputlb does
> not set large_page_{addr,mask} properly.
>
> Fix by using the max of the two page sizes.
>
> Reported-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

