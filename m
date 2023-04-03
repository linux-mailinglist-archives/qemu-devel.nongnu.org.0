Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129D06D4C9D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 17:52:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMTO-0002X0-Of; Mon, 03 Apr 2023 11:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMTN-0002Wc-4t
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:51:57 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjMTL-0007wn-LK
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 11:51:56 -0400
Received: by mail-ed1-x529.google.com with SMTP id i5so119394242eda.0
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680537113;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q3Pu+GYqnETqd5Bwxxavm9BtiY85JeIs8TuECGP8lEc=;
 b=geKX7efrofWas18DKMh/THeRdtctb9VLxWjpbM2gScq9ad7enF5LLSnIjFmsxeKIuI
 I73SOOTGcf0bpMyc+J700bqD2pwWmH2V38ek0ZTpbJmvt8IUmbLbwqeTLFKKcOjwWNmy
 Onh5QPsq4maucKBaQB/uGsiBGWJxY4xbvt/26X68Zj0Rp+2TL1uPxc87Mq1Fpzy0L3/W
 zrxBq9FnvP61MZjVUmuuuGcATszaT6Upp593goL2ldzc/p1cByyX05w0DOWVrpH1SuK3
 UbjFCM9DZSjT1bivmyqahvGuFKigsDMILVkOK5ugIMc1f7DTOY4fUk7Ah/OZvzGhyo9n
 zB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680537113;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3Pu+GYqnETqd5Bwxxavm9BtiY85JeIs8TuECGP8lEc=;
 b=NPkVZg+9JeZj+T8QOgdooMUkjAC6203qdbeMlLARl0uaZZUI5+cEnr3J1eYgoXfgn8
 IIqkI05/YZuGPMCRzdKbskwPJqTEZtfIVsvyGNQygWyN3vWRXGLjznQizFu80wGwrMsr
 IeccUVafVpnfL0fh9gaKF8Hga7daiuwi5tvzjECCcjw75PYgmzFWbjVrD+6gWzQ5pRwG
 wXt8yxLvx3pSOgCDiH3fT5IuLTnsuILzXhUqfX1DLeeLorrJr9SBLrWrAEki9MyaU7iT
 Xpq8hqIhi0yW5B7XTtIAR1fed7Xgsjm6SVOnC7Ny8Om8VcxPgkqQmVVenjY/qX/uuDLQ
 +VvQ==
X-Gm-Message-State: AAQBX9dC3XPLHr4fVcE3YH/iVGqkvC3RRpFtR0Bc6v31vCZnoDK06OG1
 gyjcojNLzipmM5nSfwqh+Upmpjt6UAhtv2aF/4IGQQ==
X-Google-Smtp-Source: AKy350aapzfXXUrARzCxQ0JTGEkCXJVWZzAFLUWl/NCyq9EtRptUhBhZZs0pnFNJDwZLbRlXJUSz79lX9cndivYAzRE=
X-Received: by 2002:a50:9e89:0:b0:500:547b:4e1b with SMTP id
 a9-20020a509e89000000b00500547b4e1bmr18344214edf.6.1680537113456; Mon, 03 Apr
 2023 08:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230403152539.379399-1-pbonzini@redhat.com>
In-Reply-To: <20230403152539.379399-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Apr 2023 16:51:42 +0100
Message-ID: <CAFEAcA9TPcuGDxt4d-juvFDO86A-OCvbpS8hGr6nK8zitWk0ng@mail.gmail.com>
Subject: Re: [PATCH] coverity: update COMPONENTS.md
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Mon, 3 Apr 2023 at 16:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Hexagon is split into two components because it has hundreds of false positives
> in the generated files.
>
> capstone and slirp have been removed.
>
> hw/nvme is added to block.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

