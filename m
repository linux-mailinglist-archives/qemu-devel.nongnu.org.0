Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A850B435
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:37:31 +0200 (CEST)
Received: from localhost ([::1]:51638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpjG-0002T4-Pt
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:37:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpet-0006oV-9b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:32:59 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:47042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhper-0006LF-Ko
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:32:58 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id b26so7820644ybj.13
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lTccXWDTn11BKpXsvaJ8BfFFQNZaVmYselLZ3TLhkeU=;
 b=iw3UaZxihtdvRVJKhqEnf/5K8PsPTSjUKCH4L6iT9HLyeoDMivID3bEpudmZzayzjc
 rlOHqBo5lCPhZ150W2V+V+fjxzEybOUb3ifdLbmSiViRHrybtWTmwjgH9UFuEKTAGyzf
 SHeYe2m93BkjC5iG+o/2hKAFlAu3EDwi3/BTj2P51w3+RYJ+EW22urhcy625qnoJlvQz
 g1a6GKK8nVIY23s1DYIBHsLskflXlIbva27G2rWx7Gbh0uwBj2aMoMRSqBIczeJPk6eo
 q4KmBBEA0PtOvPubyy06k9btfN3zc2OcRA6rpW+RTZSqoh3JEUD+AVUOCjhnwQs6mzn+
 /1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lTccXWDTn11BKpXsvaJ8BfFFQNZaVmYselLZ3TLhkeU=;
 b=5GLBPxoUIVj8zwgR6kw9mbIiAnLeIxscVkhYL3q6YO/fHJpXuXLGNLV7yu2FTxWq9k
 SFyOvKlOwJKP5+0rGiwLVT+a+XOmbJ5O8zLFmoNxc7RXS3jBj8Zm0v+WOtyRWEWRGrB7
 lxnLFMk+nZY0cum257cTC5IlQJmqqrLq8MuAuU8ZF+BfauzzdibTGb09XmFTJ2EV+AM3
 cx4FvkukvgRqdUt/Rhw8U741v5rS1rlFSNeTZM3VhdjHrGKsBl0vTX7nzAYhmx/wxEvO
 w/cHFftoToHn72ilye/xb4e3zn5IUQgH0c2LaqdzmfRVqHb7g1KcyH7MhQgVLpEv6xJi
 HATQ==
X-Gm-Message-State: AOAM533/JZ1C4zfa0rXTG1NbBlC5Mztu1uDPVchIAvfclTehQ4Fk+G48
 8Js82if9N7//+xNbWkR8K4+XYe3VcD8huFrePBiFPg==
X-Google-Smtp-Source: ABdhPJwatSlhLyyQswBFXqAKTHcW2g3YOG7dOWF9tHyhVc+n/q808BkflmgGz1/sgK0WCiabmqOPa9TgEdcvmuQvpOE=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr3512464ybq.67.1650619975567; Fri, 22 Apr
 2022 02:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-26-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:32:44 +0100
Message-ID: <CAFEAcA8fqfvM6PjaNGwioxpnAr2yOdhTz=Wa47LtmwBP49+3cA@mail.gmail.com>
Subject: Re: [PATCH v3 25/60] target/arm: Reorg CPAccessResult and
 access_check_cp_reg
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rearrange the values of the enumerators of CPAccessResult
> so that we may directly extract the target el. For the two
> special cases in access_check_cp_reg, use CPAccessResult.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

