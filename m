Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA793624B7C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 21:16:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otDxS-00076b-Aa; Thu, 10 Nov 2022 15:15:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otDxP-00075u-Ip
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:15:27 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1otDxM-0008N7-Qe
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 15:15:27 -0500
Received: by mail-pg1-x52c.google.com with SMTP id e129so2641871pgc.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 12:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7kU1Fmm9CcGPpOr2iltM31XctOgHOsMqtXntGdu/Ijo=;
 b=iK4ESxze4WRcP1I9avKzOONE+8yF2PH7h583DKiZG2B5pyOQY/sPGlacjrlxsBRWmQ
 55RLpsf5HbnorXUGjt9ZDqy5kTxdOlC3dOCyvU05DoVO9GlhCW0xhk0KC6+z9i13nEuw
 hmJrK3YeO2WGqKaKDoRn1zqCu/6aeQDX3XR7z3kQvvg1DB+iSJxu23dXq8rrwVJMtQcq
 PedV4r6cICNq1O9/9Akj91Lb21tY7rZlp1SrQwIuCPkOHc0+sFD8eV/physxOuQvOtaO
 hUCxRuJ9+du/p5Sj7JYUPUfcw87F1DMmi6HT+AovUcuGOB5/+z4yyVcWn1OGaKnvQS7k
 p0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7kU1Fmm9CcGPpOr2iltM31XctOgHOsMqtXntGdu/Ijo=;
 b=EPHDzIUz+NFVm365g9E/jarwDCtD4JQnrD8LkWyMNlW3GTB0Zy6lxBO/SM9F3mZh+8
 /ruShU1hZbLkIy3B7l84BWrvEIkROWcw461uojM0gk0eUqJK7k7Dq0G8y2gAP/PWstqo
 +tnEwLpclGpDDQwZDpdITaRGVyELs+EpVNfrQnSNDhhgv/Bi/Ge9RJDk2yqAwPLq85mz
 ahfxVE3fKvhFsAgeQqVvlvI9OKtSfvxaByN79Ap3LGC/J6bPjhFdYxNj5MQPrmm6apKb
 LMSifRdj1XvUi54/h6SHl1ozjwxrrAbNrY/0xDJgrWHxOS7H75CUJ4kPpKfndKttBdtT
 CW4g==
X-Gm-Message-State: ACrzQf0dZUgKIfyWs3hw9c0aabw7NmtdvtDqf5m4Czr/Sc0vKrLpTCJt
 hfJiKj6W2zGTacx+xtfW4+2JiRbbx0pF7dLp5zC5HA==
X-Google-Smtp-Source: AMsMyM5yesfqJvEC5D1lmY2SF1qtqo9hzNcYZchexjfWttfwzk5Yn2fdpw9XgtMBILNgNns5ZTclTA4DvSIG3hXN3nA=
X-Received: by 2002:a63:1d1c:0:b0:46b:2753:2a60 with SMTP id
 d28-20020a631d1c000000b0046b27532a60mr3143167pgd.192.1668111322768; Thu, 10
 Nov 2022 12:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20221110190825.879620-1-sw@weilnetz.de>
In-Reply-To: <20221110190825.879620-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Nov 2022 20:15:11 +0000
Message-ID: <CAFEAcA_wAt7Jq=uCXf1jBT5z4-xRPMX-GZzTBBiy15456hEa=Q@mail.gmail.com>
Subject: Re: [PATCH for-7.2] Fix several typos in documentation (found by
 codespell)
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, 
 "Michael S . Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Thu, 10 Nov 2022 at 19:09, Stefan Weil via <qemu-devel@nongnu.org> wrote:
>
> Those typos are in files which are used to generate the QEMU manual.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>
> I did not fix memory_region_init_resizeable_ram. That might be done after 7.2.

I think that's a UK vs US spellings one anyway... eg
https://dictionary.cambridge.org/dictionary/english/sizable
just says "mainly US spelling of sizeable" and cross refers to:
https://dictionary.cambridge.org/dictionary/english/sizeable

and I think resizeable/resizable is the same.

-- PMM

