Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489133D375A
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:05:46 +0200 (CEST)
Received: from localhost ([::1]:59244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6r7p-0004yh-At
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6r5u-0004CR-5v
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:03:46 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6r5r-0004Ws-FE
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:03:45 -0400
Received: by mail-ed1-x52a.google.com with SMTP id u12so877661eds.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 02:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlxRPw4oJC+7gOudajl4xhBtgReqnvKvdESnJRpRmBs=;
 b=YTpTo96yHulXvTPryo10efw2QZK460kAq5KO5HKPZX5fTXkauAPm38EOViO0igBoiE
 4FtcRtyqNxkFYDoc/OCfjBQFHjgx7MNEu8cLYpeuUEdYhmZqOLDlhp0Ruzr0Eqm38TFM
 frvouRfHXGH7Ykn8xtmQTvWUTNfk6OQ3/bhAuAneTEHrfrL4a9H5x+NWmmCWOXqiSIHg
 aDjxlJMyNlcfM1PCLxSCCjMwT/7y1jez1EjXrPJR5+g/rGFXTW1C4WfIhy6c+BJfrDeq
 euZGqb4tGnhO/nO6RZGQwLriLfYZtdYkbMjfquago7LMshWdHZHH49T6C6btCzDEApHt
 Z2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlxRPw4oJC+7gOudajl4xhBtgReqnvKvdESnJRpRmBs=;
 b=dQIaKcEGGfnuqmz5DfkvhxuI+7I8vEvC4KID5yhkIx0/ruQTgq6w4G5j+TpvYIu1Xp
 ajOgLC0p9t8/yXJO9c4ZwuSCWXFaXbT/XY5p8Tgikr9ifVFpsvbG2dd8VA1e3J642EVL
 cqtayWBpGDLnE57x5A1b1KuqCMuHYlzxvAnDd9joy2u58arR9U4hnDMFybZhgBz+Yxij
 hQFsv9h+NWsYfiMMITDQXsOzjAQFVAgC84zX6DyOZTanNiEp8s820BCmda+r6deoDEOj
 6DwJnjoitx2ZvCNd0oLnVR9X54lijE7kL5x21C1uXHT/Pld7ri3LZrn806Pq0niCfSg8
 GufQ==
X-Gm-Message-State: AOAM5338lHcucVAjsjoiqudp72b+riUOH17QWgThwSaD0+/1Si+gAIfB
 CsrBDAUu+VMqLYxVnqCnQdc+qci7TZbiCQ9UUbSWIw==
X-Google-Smtp-Source: ABdhPJxbVlTD5L6dWqLfdiEUCz4zJSWUFz3OPLkqUFpw1gSjEuKHKra6ecZnyjOUSlIMBuql63HuENB9G8DrmYD0PCk=
X-Received: by 2002:aa7:c14e:: with SMTP id r14mr4234616edp.251.1627031020970; 
 Fri, 23 Jul 2021 02:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210723065828.1336760-1-maozhongyi@cmss.chinamobile.com>
In-Reply-To: <20210723065828.1336760-1-maozhongyi@cmss.chinamobile.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jul 2021 10:02:59 +0100
Message-ID: <CAFEAcA8Prn1MgdAnnWtf=gstNATWKs-2hNcq1m8rJRY+as3E_g@mail.gmail.com>
Subject: Re: [PATCH] docs: Update path that mentions deprecated.rst
To: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Jul 2021 at 07:59, Mao Zhongyi
<maozhongyi@cmss.chinamobile.com> wrote:
>
> Missed in commit f3478392 "docs: Move deprecation, build
> and license info out of system/"
>
> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
> ---
>  MAINTAINERS       | 2 +-
>  configure         | 2 +-
>  target/i386/cpu.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

