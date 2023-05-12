Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3A700AAA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 16:50:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxU5v-0007Eh-8o; Fri, 12 May 2023 10:50:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU5r-0007DF-Aa
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:50:03 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxU5k-0006eB-Lq
 for qemu-devel@nongnu.org; Fri, 12 May 2023 10:50:01 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bc570b4a3so18127259a12.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683902994; x=1686494994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xZBXrg330SH5MhDt+hBaIDpHCoQ1Ljx3OTOsDdySBYs=;
 b=bUSZBhdclJMEbrjXxjoArJuet8hSNYvRWti2cvJCZKqyKAO6Z68UH40Z2WPS2h9HJZ
 MscEpeZebLBb1x0XP9mclDFQcpOIaoHDoc5A6//4dp7iqy7IUusw2SsrYFBOls+1q6jP
 jDYX9TifoagCvma5BPwjeFuc0QNKJg2r9UV/mrSC6v9JDd5GahDbB6tQWXXQ5zlOH9U0
 z/VvkBoWh1CfUezvaudXn5aGjWVY3CiMyI0MaJohyTiaI6iq33AXDHuPckU4w6Ohprcr
 qLrpLRfkVOUEE0rtczTyIPkNOgmr/xwVe3og3MhSdekydha6KJ8xXWcYvtAmehuWzwnU
 V0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683902994; x=1686494994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xZBXrg330SH5MhDt+hBaIDpHCoQ1Ljx3OTOsDdySBYs=;
 b=QeZLqqF5vRr4xZvSitxNIWdVq0C+68BDwiVOTUnKzdPoBBBH79Hr9U04q0+BKXgUTW
 vQUOVcH7d8RWzyptJiCVaHpdWjIluVl+GS0Cj4mMvQsuf8966lz94/xzgMinVkHFrELu
 W5r3Svf/FUcwmA+rr75fR/OHIYdSQWxemJOQ+sEqeBo1nHwEH74EiEWzqVQT8zjlnoHo
 W9BwcMHgEWZzWWKwb4TJLNjrPrsZnO40pkBUHah/Qgvya8i5Wo5qWAM8Bhh1sQ+++xfo
 f/Pwc6ahCDwFn+Mc3tUENrjKUupoLQIyqupjOPauWIpmJ2lUGz0fYtkVJVDfTzGE17rM
 S9AQ==
X-Gm-Message-State: AC+VfDyDdW97PYGGPp3FcPx9ja0P5QH70k6h51JA2i2FmJDiacKG0NL7
 XSoRTxhKlJ1hKoAu9oqQc72B/yS4pZm2120ZnA+3hA==
X-Google-Smtp-Source: ACHHUZ5PmAbepWDNcsTxHx4Efi8DMK4J6g0OfjVMDUhtlV/f4Xk9cLi9M/P58C+BquhFJUljRfL7KiIJJyNE7Mpf+Zc=
X-Received: by 2002:aa7:c659:0:b0:504:b325:bd4d with SMTP id
 z25-20020aa7c659000000b00504b325bd4dmr18041992edr.12.1683902993989; Fri, 12
 May 2023 07:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230508181611.2621-1-farosas@suse.de>
In-Reply-To: <20230508181611.2621-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2023 15:49:43 +0100
Message-ID: <CAFEAcA9gUthE_0VAH2EDz4pMqZL=Z=WC9piZNcMeJBFL8-_vnw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] target/arm: disable-tcg and without-default-devices
 fixes
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 8 May 2023 at 19:16, Fabiano Rosas <farosas@suse.de> wrote:
>
> Changed the cdrom test to apply to only the x86 and s390x cdrom boot
> tests.
>
> CI run: https://gitlab.com/farosas/qemu/-/pipelines/860488769
>
> v2:
> https://lore.kernel.org/r/20230505123524.23401-1-farosas@suse.de
>
> v1:
> https://lore.kernel.org/r/20230503193833.29047-1-farosas@suse.de
>
> Here's the fix for the cdrom test failure that we discussed in the
> list, plus 2 fixes for the ---without-default-devices build.
>
> When I moved the boards CONFIGs from default.mak to Kconfig, it became
> possible (due to --without-default-devices) to disable the CONFIGs for
> all the boards that require ARM_V7M. That breaks the build because
> ARM_V7M is required to be always set.



Applied to target-arm.next, thanks.

-- PMM

