Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D0B3DD5C6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:37:27 +0200 (CEST)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXCA-0005fX-Iy
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX9u-0003Gp-Qb
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:35:10 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX9s-0007e4-Qq
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:35:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id ec13so23728010edb.0
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QgFPsnhpW6bOpU6hpQXBfh/j3kP7qrQHyYS7fIb1Lj0=;
 b=z4MovzgFIbi7w5kSAmc0B0ru3ODdys2rIM0sOZcNw7LmnY+vKcwEyx2aZ++3QumCqt
 C/QBLKdvh8GARmCV74ZrvO8dFS+YyprrJPN8U54KhgXzGKh4YJNxS9qTo8EGJvc9T/P3
 xKOx6a+WxXMM7LfEUt9jlDpjKYLn1LLu1pzyAIWbpI+Y3Jc7VKeIdIuhad8iuBBRt8oI
 jmxUdUObB+Fkv+lezcJH4HGvjYJsKuazqAUsRg3RztVPg6Y10eaRfMhnBE5h7yjaynCj
 EXIAkWXMRn4AdHKbu8Jcb3airT6RdSU8xObNFngO/Yur4M1Lhr3NkeotfsUN1us89VX+
 cpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QgFPsnhpW6bOpU6hpQXBfh/j3kP7qrQHyYS7fIb1Lj0=;
 b=tV5+oBQTOz6bEqL9tc2/tXV4TrvMmUNVIMMqbruCvNxCVDlpVtpwnykeU6sA1SvjtK
 xSZT1fTCTWzp2N7Bnv6Syma8gf3P0lwTv5tmtglg6CwK8JQWlRh8lXxfsYgiJLYvBEt+
 VQoGS4eb+yzuwD27NTZILPtMH5yDuiTTe4VlnGJw2lZ+x7qQF9p9taHGb11DTt6g6+ue
 aXPPTDVs/520ooatrKKX9WERGVmni1sHJFx4m1dVOMjiy6oM0UE+CIdJxio3tnNdfkzX
 mgGKa7osy1xfePKnKTzM6BVSH0OyeVaHgADq7OCsfJSBwwPdlF0N6RIXl0fCDznx2JSM
 QUnQ==
X-Gm-Message-State: AOAM531ED1BvFUzOG7Zy46Dkje2zL3YBwnXIjpS9bjBqOLeuDw7LAzhn
 KmNhtMaA7adl0dOBpWXfqDBArr8pmGglFqUc1/qj4Q==
X-Google-Smtp-Source: ABdhPJyDX6m8dO9cy1WfcztdsUHIq9q9W9QlExwxUcVg/nm4gziYcA4zdXsFgL+/Z6bTU5wX8zVFeJ+3KNsFnpaZvcc=
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr18560453eds.251.1627907703111; 
 Mon, 02 Aug 2021 05:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-4-pbonzini@redhat.com>
In-Reply-To: <20210731062741.301102-4-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:34:19 +0100
Message-ID: <CAFEAcA9i0-Mg954X2D+1uAMtzC62ZN5=6UY1Z7JXUiL9zs5rCw@mail.gmail.com>
Subject: Re: [PATCH 3/6] coverity-model: remove model for more allocation
 functions
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 31 Jul 2021 at 07:29, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> These models are not needed anymore now that Coverity does not check
> anymore that the result is used with "g_free".  Coverity understands
> GCC attributes and uses them to detect leaks.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coverity-scan/model.c | 105 +---------------------------------
>  1 file changed, 1 insertion(+), 104 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

