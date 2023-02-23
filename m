Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 601456A0B74
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:03:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCB4-0001FI-AU; Thu, 23 Feb 2023 09:02:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVCAy-0001B1-Fs
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:02:28 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVCAw-0004ni-Q8
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:02:24 -0500
Received: by mail-pl1-x630.google.com with SMTP id ky4so14154580plb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 06:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4rLBpaBId70U1KNxGgyttP7w8pr2e6fzXdrSWAqUoas=;
 b=aTzuvWwysxT3PqnoUP2CJMXTzHSYNJgBcmzG0JzeweTXHR/nXC7+fTy63vrLzRymUd
 IX9NmF8dY7yipHomWfcH8zAss/K8x2uyqtmiZahk6NVgwuzWaw0EyFXwDYEh7gHMXIAk
 E6gAJu7Nhex3zRnEpGTqLUi2OF7NvMI5lXweUdjfJm91U1lOFnGqHzgb3EMw288+ZxPa
 W8OVfHxy8EiDDYbP3wwBxrxqddfC0Vq7B/n4hEDi3pZhgXiNe0B3nMU9shzxdfH9gmEx
 dmzmU1lkIbvJbm/+pBpRCKur217OIyAlyaWRS0ezXj1T70rCAaXQko27bn040Mt8f/Dx
 H0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4rLBpaBId70U1KNxGgyttP7w8pr2e6fzXdrSWAqUoas=;
 b=fqRMLkQai0lTA48B0nYp4XqgQUOTqOGBvzyzEWLTFQXNSIxM6wst06yh+P/QtTHUK+
 t2L6dn42k1eJ8TFviF0rd6vkLF7fIJzv6r49q9jckKyCyEj0P888rlQ+ipwONOZPlwp5
 6kjleVmg9XUV793QpQffa+bHqay22GOmX57ffXG7Hr/ibVrQsDAxLzm89Yj51mZ5aA7L
 fnOGYcY/KwypMB1X5fk/VIPCT1Cph41yekua8cn/fmS2QSvBx8FdXVKAz0RZ1ocCDmsZ
 +GTZdfxvJ45o8rmy9aUoCP6hia+WYcs2ZD0novY2+X3mVRiS6X0k4uRR0Ed5WpToWGye
 wMXQ==
X-Gm-Message-State: AO0yUKXvzfx5KLW9bCJU1EtwUtFuLbkE/kn4+nah3qJHDxCtKa7TUpbn
 +C4UbJ0Rx/koGQ4g18FTumUCWVsgFWXvkSYNimSvRQ==
X-Google-Smtp-Source: AK7set9riwq1WEWdxD8If0BjBYSxehbAV6VKwD8PSWbiRW59GK277M/pXpi7iBlTC7OnJbcNK+qPgagJIz0bOekQi14=
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1127182pjb.137.1677160940968; Thu, 23
 Feb 2023 06:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-2-aaron@os.amperecomputing.com>
 <82e90bc7-8883-62f2-a6a1-9b90e032c667@linaro.org>
In-Reply-To: <82e90bc7-8883-62f2-a6a1-9b90e032c667@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 14:02:09 +0000
Message-ID: <CAFEAcA_aX_rebT5jwiOUAQLTz9u9Ps607twYeeWT13voQswV7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] target/arm: v8.3 PAC ID_AA64ISAR[12]
 feature-detection
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Wed, 22 Feb 2023 at 20:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/23 09:35, Aaron Lindsay wrote:
> > +static inline bool isar_feature_aa64_pauth_epac(const ARMISARegisters *id)
> > +{
> > +    /*
> > +     * Note that unlike most AArch64 features, EPAC is treated (in the ARM
> > +     * psedocode, at least) as not being implemented by larger values of this
> > +     * field. Our usage of '>=' rather than '==' here causes our implementation
> > +     * of PAC logic to diverge slightly from ARM pseudocode.
> > +     */
>
> I find this comment scary -- "diverge slightly"?
>
> All I need is once sentence to indicate how this is mitigated (by testing pauth2 first
> where required?), or "See function_foo" (where there is more commentary), or something.

Yeah, we structure the one place the check is used (patch 4) so that
we only check the pauth_epac feature if we already tested pauth2:

+        if (cpu_isar_feature(aa64_pauth2, env_archcpu(env))) {
+            /* No action required */
+        } else if (cpu_isar_feature(aa64_pauth_epac, env_archcpu(env))) {
             pac = 0;
         } else {

where the pseudocode currently has:
         if HaveEnhancedPAC() then
             pac = 0;
         elsif !HaveEnhancedPAC2() then
             old stuff;
and is relying on anything with PAuth2 not returning true for HaveEnhancedPAC().

It is of course possible that the pseudocode might be rephrased in future;
I think the way they've done it at the moment is kind of confusing.

thanks
-- PMM

