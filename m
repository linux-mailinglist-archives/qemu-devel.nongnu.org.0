Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E4C5FF387
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 20:18:40 +0200 (CEST)
Received: from localhost ([::1]:36928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojPGZ-0000o4-8I
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 14:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojPBG-0004FN-WE
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:13:12 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojPBC-0004tE-6p
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 14:13:10 -0400
Received: by mail-pg1-x52a.google.com with SMTP id l6so4984616pgu.7
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 11:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RXTkHQY/TJUr6fU9hsg119+h3aly7J/lbQUytQzxvNs=;
 b=Xllkxr8J+srfHNkHpDH48aOrdBDojo271dREC5VU7atrd7WGyCwn4t4IN46IWZBUvV
 yGiW9Qw5cEnD4XIWz7c5TsFv6/7ZG0UqdhdRGKx6cHpSNuYf1OTed9/sAqv/c4GuL6Jf
 W2qerINWfX/Z9nFxoKe+xAQbVVrJF+JXB8eQ5XD8WEtFgTiDOtnox9AZALnFV32C3qNP
 xT6xJ1MCev86RKqjUfqovQTnZY2fpK1K29mwCn++YuodZETRwz/cP81AzWviXjdAe9f2
 sXjTqCgdo+IgCHATbIcqc2JKM7O8yULE+41kSu0uoB4Zi/jwDb4CjwUUY86bpjJ2mLxX
 mQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXTkHQY/TJUr6fU9hsg119+h3aly7J/lbQUytQzxvNs=;
 b=Y0YelbC462CigasPwlIVB5f5Xdz7oIbmRwxppoKs1PT4La/wvJL6jlxCoHf+2BY/sB
 ccPhhdXiWdUldwpI1nL9tB3UJh+qcJLImO3ET6grWX32a3kAvoCgc9Z0MIao/Ex8iRAJ
 z/8JxZC8ii0YyDRBhXFTTaANvIopusLF6UUrmki1vBTnFkdU67op+PvA+ox8UU1ULCpk
 x8V9piPLzAbNj7eGkIdCFAIEewCElynlgxUa7u73Y77ZdpOzUjsxTMKsJw55J+KtY4FI
 IF8HaO554WtJttVWJoS5RO/yTUvss6ce1+WQlwwVKKl39w4/cSNfHAjHM4CmYSH/0auS
 q+0w==
X-Gm-Message-State: ACrzQf36e2B1iCCkmzZKMOHbjpO65JwqR0mXiG7hOrxm56GkqaAs0tB2
 CUPY3lE2W47JRgZTTn5aDLSrtyiUWVRJo2VQ9IEY55ZNDtg=
X-Google-Smtp-Source: AMsMyM7ojCAXZAD1P2yT5sPoP7jZ0VA6MJ5xfUHeBoVzyp2MNlW4DerwXpvJifbKfR1yAj1OOsS7+vhu7tR4fMOzNBw=
X-Received: by 2002:a63:2212:0:b0:43b:f03d:856a with SMTP id
 i18-20020a632212000000b0043bf03d856amr5620011pgi.192.1665771184817; Fri, 14
 Oct 2022 11:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
 <20221011031911.2408754-7-richard.henderson@linaro.org>
In-Reply-To: <20221011031911.2408754-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Oct 2022 19:12:53 +0100
Message-ID: <CAFEAcA85XY26GpBNMA+LT72Xg4f_QfSdRh4Z3zrZpEUZQ5nusw@mail.gmail.com>
Subject: Re: [PATCH v4 06/24] target/arm: Restrict tlb flush from vttbr_write
 to vmid change
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Tue, 11 Oct 2022 at 04:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Compare only the VMID field when considering whether we need to flush.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

