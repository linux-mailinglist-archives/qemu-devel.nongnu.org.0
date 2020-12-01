Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7002CA0C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:06:09 +0100 (CET)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk3U0-00011n-1M
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3QK-0005fn-96
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:02:20 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk3QH-0004ux-34
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:02:20 -0500
Received: by mail-ej1-x644.google.com with SMTP id f23so3274359ejk.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AX0/57Gat9N7kgfUAAkqxdQun03t9B8hNEbWW2Yfuq0=;
 b=qiNJtAnIGdygdIVa+9VvEXswh6esIFuroHvNm62UMgQKLu5o1+wCmyw70xtPVzvMdK
 C4t/B0cLSNgJ8AdtH7y+svNXo/4sdmB2xK83jg4QOaLf0fQugKGRaAnkEdvYVhMFfbSA
 pCEuNjnCnZSg/uuTH8FsbGvJQvw9VHs6xEGFM+G8ahRNsw6lOCSnfCHx433wCBSDlogE
 9C6FlZmoCQIe3LdDL4w27ngCJnwWdVLoaZg9NVYqqMIE+WutoSUKuDne5dOXsADNKrE9
 L+kTXWjDFqj4oND11E/pga8OXimeUHUQRzJkHcNhO7vB6tGcy43LgOWvVgYwfrJMdLDt
 jJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AX0/57Gat9N7kgfUAAkqxdQun03t9B8hNEbWW2Yfuq0=;
 b=sGQdie6qqmLdIOP1unISE6U7+j1ud66VqI9JxMocbcgkzfSNi3v0okqM9HqTluC3kO
 SszbH35Q17+P2DCE3gWp4PIYAFsq7fwGlFXZPNffxMu9DWSfRGoeLSGAR0jEfVUatWX+
 9L7/2mEXuOK/hmEBD0UrvTBvqjT5E5VFk6h7l0VD8hK8/XFUrOWhelvl4tMgy56DDkdi
 j2fxAFwFIwQjjsmvu0qVvEs9vtMCPZ/x4JwHk5/cM4EZwAuv3vEtlofXV/+0UwHqwO4Y
 VdzEMzXnNE2cGBvRbxQyo6X164gSCwkbl6ddSSG4CobHs4PwLaUGZidIqYFi32E8RYbQ
 9yZQ==
X-Gm-Message-State: AOAM533Jy6BekTdqmFZgyEMApaks4xKjdFcgLiqx0e267bP7r48LWA3U
 pRbpbiwRMp54jlbVtHz8qH323kqsZSUDQtZfqRcejQ==
X-Google-Smtp-Source: ABdhPJz7r129i+p5BHVNTAs8/PKdXSUcJYwb1Ova9WS2+0lqB9WfgZRw6lmQ6uWE20DWuTfonEdynAf71cTEFW7doSE=
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr2394939ejd.85.1606820534386; 
 Tue, 01 Dec 2020 03:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20201201103502.4024573-1-pbonzini@redhat.com>
 <20201201103502.4024573-32-pbonzini@redhat.com>
In-Reply-To: <20201201103502.4024573-32-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:02:03 +0000
Message-ID: <CAFEAcA-+==4F7rsShR+R4qhnciQowRg7VhpAVUUKevRAkDQ9Vg@mail.gmail.com>
Subject: Re: [PATCH v2 31/32] Revert "docs: temporarily disable the kernel-doc
 extension"
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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

On Tue, 1 Dec 2020 at 10:35, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> This reverts commit fd68a72875cf318f4310726f842139119c5f45d5.  We're
> done with the update of kernel-doc and we can restore kernel-doc's
> functionality.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/sphinx/kerneldoc.py | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

