Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99C46DDC24
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 15:33:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmE78-00040k-1j; Tue, 11 Apr 2023 09:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE75-0003zt-Vf
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:32:48 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmE74-0007LC-9U
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 09:32:47 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5027e589e20so4528066a12.3
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 06:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681219965; x=1683811965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uhSx4ypEnRFX8817NJIShLVenbVkWq02gTOQ7+utnf4=;
 b=k5qHXgZf3H6iKyxhHTNF6Z1f1AOXnsWB2EyUQljJXnNLzxfQoanrGoYKDmthspQADm
 KtUhRuB6crtCLD+jp8wfbV9qzP8O5gmAtIoV+hhVGABaHt5wXQ1i9wlzykY+MzNgNULL
 uHqVC4To9j/vi7BvVB/dK6UNE9DPiuy9DQ8hDTPYCSQZuJW09kTguCVO4xWSj6lhIFLF
 gDxWc5sCP5JiTXAr+LWsrVO39QvCT7deOYb8fw5A3B1b+05mrrMk6TMt8SgMu5LTZZHE
 tzgRiWDpy7S+anSZrWwU7fagkUb2yWMyg1+PvEn+/NEp2u8F24NUzA9WA/KWxdLdCHIy
 tZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681219965; x=1683811965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uhSx4ypEnRFX8817NJIShLVenbVkWq02gTOQ7+utnf4=;
 b=NWgfpRDYD2qzQegZvsJD2CJD7ftFMnZLNHy0wYaB8YV1ta4dpmvm0q+FNU50LrZGLO
 PvxPj2a12SnJLOFTzaen3UIMSzVOI+rHPCFD6hO6gslHAihy8i4IL0U1kUX755z3zEgm
 D+XCpRmWKGINKSazScUGL40lv56Wn+Ock5J+YqVxh12KjK/O8/EQQYVd0H1OpyoTGstT
 Wyq0vfPuWQO9wf3QxklCqKl7mwv8jnUdQEY4hE5we34LSn4oWIsWDV2cAmwTt7ShzCXM
 JrNGHILJO3OvpquXRmS6RTEAgBgnLjDgGhRosogqhxNJNK7ZuUYpxOSxZuaKKc6pK4ba
 X+2Q==
X-Gm-Message-State: AAQBX9clBYNu/jpxlgx85roBElPO3KoK6OpKrm0RDoRwkN5yFVSSOPsH
 RuUbY9S1elH9k1l9uKCOQlz1QljpaGi1nZKjKXQkmQ==
X-Google-Smtp-Source: AKy350Z/oA9Sk1xgZDHcxhCTmLUxxhyMF6leE85lbZRh7u6VEKKVYWgQGiGnC79t9YK5D5j/dgw6D1zhDvazQ+VqoOU=
X-Received: by 2002:a50:d71e:0:b0:504:9c1f:1c65 with SMTP id
 t30-20020a50d71e000000b005049c1f1c65mr3714285edi.6.1681219964721; Tue, 11 Apr
 2023 06:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <168070611775.20412.2883242077302841473-0@git.sr.ht>
In-Reply-To: <168070611775.20412.2883242077302841473-0@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Apr 2023 14:32:33 +0100
Message-ID: <CAFEAcA96YkH=nQk_NYPUG3mgpt_B+yajn2ynihUBjkd7EyO3HQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git 0/2] hw/timer/imx_epit: fix reported issues
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Wed, 5 Apr 2023 at 15:48, ~axelheider <axelheider@git.sr.ht> wrote:
>
> This patchset fixes the following issues:
> - variable shadowing reported by Coverity
> - fix check, see https://gitlab.com/qemu-project/qemu/-/issues/1491
>
> Axel Heider (2):
>   hw/timer/imx_epit: don't shadow variable
>   hw/timer/imx_epit: fix limit check
>
>  hw/timer/imx_epit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next for 8.1, thanks.

-- PMM

