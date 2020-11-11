Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDF2AF984
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 21:08:35 +0100 (CET)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwPy-0000OM-Ad
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 15:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwH0-0002uX-Rd
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:59:18 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:36018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwGz-0008OO-AO
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:59:18 -0500
Received: by mail-ej1-x643.google.com with SMTP id o21so4453787ejb.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 11:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7A1Rl/rV2uCmB7Lrj5LwXqDoZGGvupBU/KDhtULmBlM=;
 b=DoHPMKoR9LBVbKE5K9+6Db6K0FDy2xkxespiiO8tAzgLGkwnVl//z16LES/jRvzHhy
 /RQyAx4FqzEj7rVtbI+puHEl5kDulFdImpQl2v5g28AGzDysPevqKumPHYr4beI9yiHV
 A4VQVxJs7bx5Bh0aIRuL7wCd+kyEAlycwmUiXJz0xZpL6vD4S0ZZ8wSxDqEeiFWctRWR
 /WjvtZ6yowzcvJaVl3LY6pYf0Xx54W2OM8xg8LOPp9EmrXuP+sxpV51ej4bG9nVUnt5m
 uwpCnsRXL/HoDT62Fe7a69xVjDQFG3ZUxkoQjx5vYThFWcNXCov5j8WS+QJvJj6hoR4A
 Y+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7A1Rl/rV2uCmB7Lrj5LwXqDoZGGvupBU/KDhtULmBlM=;
 b=uXjKc29MfGakDNWQ9c2EF2izkiLlpGJoh8cjpEHGXXfKTbaAjPs3MfqGtk+O0t+EiT
 XKUA7qO4IfNU4BkTY06oTX0CZ+VX+XMFlYZm/8lMZMq5fmdmPBuUA2r0EgnNxrcS7Vtw
 dU4jN9tKRTjKYyIozJuCQP6S1gPDakmmP7iV37kPy0+LynmZNPoBpOpkNpCsSBnWNkVI
 x+9iq1gtWR341tSYkPO5+0Jb865Vn6uozQWS4HJsJIrsmacy6HdQ07YIKIagHDndZY+d
 QQJnPB50/8W1kR+ZaONyIEABhJrfnVdf2Ui1QRsE+gsVmY6SJ1bIjFZTf37Lh6PzR0Tm
 /ybw==
X-Gm-Message-State: AOAM5310V3rCkHGAwyaYlhnNY+HeViXiYC/I8nTHh6mnYhYD4AgIjmLC
 7CjVvtW8fHsE/FCL38v0MK0KlxqWsXRNTQHwF7Q4Hw==
X-Google-Smtp-Source: ABdhPJz86oJZ7N02J4uHYBBnfdVyYAw90p7lI8RkSWJrmWP5NVgS4aTNZBqQoY9Xl08qmHwPtpX57hHHsG3xCiw6e4w=
X-Received: by 2002:a17:906:af8c:: with SMTP id
 mj12mr25969140ejb.85.1605124755573; 
 Wed, 11 Nov 2020 11:59:15 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-2-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-2-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 19:59:04 +0000
Message-ID: <CAFEAcA-VSwkO06HskbQMgcTgGwG5++MTasn179KArXaYo4WdDA@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] vexpress: Register "secure" as class property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 at 18:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

