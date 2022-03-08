Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132494D1C3F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 16:46:51 +0100 (CET)
Received: from localhost ([::1]:58542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRc30-00074w-5k
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 10:46:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRc0r-0006FT-3C
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:44:37 -0500
Received: from [2607:f8b0:4864:20::1133] (port=39380
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRc0p-0000o7-JE
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 10:44:36 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2dc348dab52so172307097b3.6
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 07:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PfR2Z3+xA71J9AZM3eC278mjy7fGOkmwDhDLjIqebR0=;
 b=amWPFDeeTam2DPfxhlijbORWu5sAcVofa+Q4oQZTtYgNrDCQ95AL7N+0gjrXeHLVmK
 DYWReqcbXYOo4RN8gu+e3QrCNiMuPY7qghoC26sb40VQqZVNgsYkOcsa+bf29Edcdvoh
 f6kc1r/avlD23Wi9kXjwM4WWQbP0dxWIKTG2+Yt3kTU0NoPzuwXN0ob3JT2sYlKQN2TJ
 KOH/C3SlV4wtNLaVcdp5PJsB4ulzmdBuSnA5A0aK94cteBriTpAlWfOe4774p0URpAqg
 +9Gt2Kd/5xpA0PrYcM2UDLyjDHlmGlwtnmEMcIXGkyCARRCEEeZ7pJGwHH8i6m86LcN5
 ZgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PfR2Z3+xA71J9AZM3eC278mjy7fGOkmwDhDLjIqebR0=;
 b=6oztNecKrcQ1Y2HNxVWXhcoQOQBy3h5Cf3arBJRos7R4aY9Gw3x5m3t05UiPw4aBhc
 pG0/6jeu39Mcdc1x3+At+o5mXRuRVVbO9jJ7GeB4FPltPZRp+7LEDeOPYCcqTnJAy1FV
 Dr36WkHwPFndrqYanlzmJ7AG3rpOm5dYOeMUYwaZnk13cX2eU9zFattur5hIXY7eNPWl
 d4uuOwZVej3me6DE/bPOQ1i+wU5I0w0Xzcesh5Hqjx1/TSNbQCkzATZ6IzEYIpA1me3o
 XPwRMoJyQGoklLTtnWG5W65gH5A+/YYnVYSbyuuL0UK76/cKLhHOJOWvo26PaIG/a1L+
 0gCA==
X-Gm-Message-State: AOAM5336NuzQwrdQL6OPQkS/eCH6y/hnXB97Sh6oqm8Veae24YNCtrst
 gv4npozhy7SsbNEvYHuu4TqnUEIHxKtyvZjqpw1fuZZhEa0ZeG/F
X-Google-Smtp-Source: ABdhPJw5JmkuPqYzzkOwqutLtDZqgcJHD3OOXnVaEmr7C6704QSTSoq3MdILlbvDb0dtH/RP7lGCCl1hNHo7anRnQ5E=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr12994561ywh.329.1646754271822; Tue, 08
 Mar 2022 07:44:31 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA82N5JE+yihXMaaVC1HHBcPekamrMPOCSD2viuDjzzwNg@mail.gmail.com>
In-Reply-To: <CAFEAcA82N5JE+yihXMaaVC1HHBcPekamrMPOCSD2viuDjzzwNg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Mar 2022 15:44:20 +0000
Message-ID: <CAFEAcA8SUWaFE_anUBY0vy9e+mOGGpQ+RzN+Rx+sw+SawCKVXQ@mail.gmail.com>
Subject: Re: compile failure in cputlb.c when building with clang sanitizer
To: QEMU Developers <qemu-devel@nongnu.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Mar 2022 at 15:35, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If you build on Ubuntu with
>
> '../../configure' '--cc=clang' '--cxx=clang++' '--enable-sanitizers'
> '--enable-debug' '--extra-cflags=-O1 -fno-omit-frame-pointer
> -fno-optimize-sibling-calls'
>
> (which is something like what the clang documentation recommends)
>
> then you get a compile error in cputlb.c:

I should have been a bit more specific here. This is Ubuntu 20.04.4
(focal), with clang version 10.0.0-4ubuntu1, for x86-64 host.

thanks
-- PMM

