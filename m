Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FF46A46AE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 17:05:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWfzO-0008E7-7R; Mon, 27 Feb 2023 11:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWfzM-0008Dh-MV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:04:32 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWfzK-0007g9-UZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 11:04:32 -0500
Received: by mail-pf1-x435.google.com with SMTP id u20so3825268pfm.7
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 08:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/y6pnvHfzfzPeqPY1fiiZ4ZQ/X2eUSkgkLGcEy4Q47U=;
 b=FrOfTbf5tEhkAZtv9li43DuBoQd+YpuvJOAo2GLZ552LUmBlSS1y00/RmM/7wmfpxD
 vVptTQxdpgPIlP9jwfnyG4Gh3Z1nS0hCXB6ol4GAQgt7Nn6OtT2E/GmCXC3RVa7ksRh9
 X8gTnP56dscvQm0dZXi0IgKzXUOM3SwseLWL9rx7umOlhlOnKFxZhg//cm4tK5YVaFbn
 9VRuYi4ZdJkvNo7KJw/E4JsXtFFx5+KK1eNstS438/n/FCsKkjMysfj3FhRVQi6PNJaZ
 MkYsRvA1hPPJuh3afS4jMsZG+5SdLyj2Ud3iXDvmmZL0YuPuY8N/dDMKjozkdRMsSDE/
 EgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/y6pnvHfzfzPeqPY1fiiZ4ZQ/X2eUSkgkLGcEy4Q47U=;
 b=ElXjr9ADL10m6OIKWQ+r3T07q/10QsEwPi7Ab02hheVyqPDoEwod6OxlY+YHuWDnmq
 izPNttgy7oEbQL9iZVpA/x3UHVP0odvS5LpJkaHJXfJMt/kXmCBfVaS+xGvKB1XCVUuA
 +JuNEyqGkOrEie+2EodOn6vP+0ZFB5OJ5zKVQKpNQ7ZoR+vOX8jEUst0GTnoH9trIwiB
 7nm7Df0N+UQ/kwhNT1okJPXbq1Y4no6yOw55qknKHkfYnVNkS3piVZeCBcfXiuAENXzb
 le0GIf9a3Ka5Mt9Q1+WVsphaeAuYH2uajrac/tl4D8C1w4nLMihJjfAMf+TzAFtIAmhB
 yr/A==
X-Gm-Message-State: AO0yUKX2LH28dXUQrMWO9MQsHUT8fqSFFS/OcxSTxfKsIdoLM4qFRaS+
 GTXk+mVDMYsaB2GU9ndUSdzve14GDHDi2VfqU0NV1Q==
X-Google-Smtp-Source: AK7set8ECgYbF0pwYG/G3YoF18KD/6XNmOeuOfyjeIR/Z+nf3Bkk+A+rKCBs5kteOZvEQpU0DFrVPCG0logSyZWtZFo=
X-Received: by 2002:a63:b959:0:b0:4fc:7e60:d09 with SMTP id
 v25-20020a63b959000000b004fc7e600d09mr6077725pgo.9.1677513868706; Mon, 27 Feb
 2023 08:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
 <20230227084621.15cab9da.alex.williamson@redhat.com>
In-Reply-To: <20230227084621.15cab9da.alex.williamson@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2023 16:04:16 +0000
Message-ID: <CAFEAcA-Fp8nSZ6iimZH28DXGVWkFbcYv25RvVDdc8WZkBXgfrg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
To: Alex Williamson <alex.williamson@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x435.google.com
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

On Mon, 27 Feb 2023 at 15:46, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Mon, 27 Feb 2023 11:32:57 +0100
> Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Empty commit logs are a pet peeve of mine, there must be some sort of
> motivation for the change, something that changed to make this
> possible, or perhaps why this was never necessary.  Thanks,

I generally agree, but "this file doesn't actually need to
include this header" seems straightforward enough that the commit
subject says everything you'd want to say about it.
The underlying reason is going to be one of:
 * this used to be needed, but somewhere along the line the
   thing the file needs moved to a different header
 * this used to be needed, but the code in the file changed
   and no longer uses the thing the header was providing
 * this was never needed, and the include was just cut-n-pasted
   from a different file when the file was originally written

Tracking down which of those is the case for every single
"file is including unnecessary headers" cleanup seems like
a lot of work trawling through git histories and doesn't
really provide any interesting information.

thanks
-- PMM

