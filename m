Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3450B838
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:19:53 +0200 (CEST)
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtCS-0001hG-0s
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsnD-0003BX-0i
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:53:47 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:39820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhsn7-0000qz-RT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:53:43 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id r189so14311943ybr.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xIEh/Fjz5ogItlonfIGLROkKJ2Lb9scu4iXPw/2PHXM=;
 b=A2LEVH97cO1eF9lbRD7x/7xuJlTd4Ym3Jy+Dz7TwPAvCUvrP7m4o3X/euHF7/7mBA3
 OlunL1CRgT84nyOC3LTsi1Yv78SjBVwPYBbDynQp4B+P0eXoFmPhQONoYsDaq9UT0BEe
 BBHFVujlPE6UuIPPY3Q1eLNZAVC1Df6QB72KW0eMuN2g4zJI7tcIFhC1odGwpKCFoodo
 b/rQoth2eS/bUS/TxPbBiK2CVPFmCgYHgP88uwWamVPQ/ParjdUglqYX0fIo8XnjXfn/
 E19p1Tp3AIGL0F+TEi3zwzUk5SReUzjtFpxQPjcRb9QqCGTWnrnOh8nsMLouvex1PqcD
 WsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xIEh/Fjz5ogItlonfIGLROkKJ2Lb9scu4iXPw/2PHXM=;
 b=buNF7ooKO/VPJBjpMZLMQax+togpyP1sPCLYSMW+FIqfVHgeWVnGJtHXQE/ccYz0Ut
 F/IuVhfDS0HwGuVOrDETKTbRyCBaWGYf/waT42C3dRXsPmnL9PKVe0GQMMQax4Lzmr+d
 e56dURl+tIhm2uQ8ta0X7K0lIrfL9L2qgV9aK++G6gEhJLpOu8ffMUzjXHTQbIuTo1rf
 T1DMJXwDM2nra1Lu4wbRCk/4PkAczotxWIu3QoL1zabMzBqXHUcx2pBGZ4BwndJ7GsFF
 i14AhMQEbTPMbz/Jcq+BVTuNwLIfgSxmmP9vrbOSLxtO/cdeCt27XGSi72KHVX56Ysnt
 T39A==
X-Gm-Message-State: AOAM533Ouch1JWUnO+NmK8vi2CIwOlL5s6GQhK+TCDvi2KsMMkPY8lNP
 BOKADL5DlG9MFEi+93/oVEDxfSej6psLgC51EY58Ow==
X-Google-Smtp-Source: ABdhPJwH5vC9pBPliGEg8lcG3eZyz07n5xRoRfw8rvOMj4HAxPKmalXUOMyGTz/YK806EQAcZW65V/c9zSjCx7JgPU8=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr4226780ybq.67.1650632020647; Fri, 22 Apr
 2022 05:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-11-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 13:53:29 +0100
Message-ID: <CAFEAcA_9DHi1OWU_DNm2Ckeu2x5x6Kpiam7-+pXG7VedgBYUBg@mail.gmail.com>
Subject: Re: [PATCH v7 10/64] target/nios2: Remove nios2_cpu_record_sigsegv
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 16:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since f5ef0e518d0, we have a real page mapped for kuser,
> which means the special casing for SIGSEGV can go away.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

