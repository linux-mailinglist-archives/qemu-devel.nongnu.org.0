Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C0269E368
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:30:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUah-00022M-7F; Tue, 21 Feb 2023 10:30:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUUae-000216-FZ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:00 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUUac-0000IP-S5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:30:00 -0500
Received: by mail-pl1-x629.google.com with SMTP id ko13so6044646plb.13
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m50+uIYbAQBxoxKSnswN56p1FNJUVydppVeB2uGn04o=;
 b=xamiw749RCLdrrNKMcZcO+RoEv8MCnH3nLvl8Ro+2MsrvdPGcnYXouFPrkJ31f4gqY
 tpHiLt610lnhKNx8NhFx2RYV3erOODQQvPdjdsnhnROy5REA1Fv7BUKEfMus3QLGqadI
 0t79Ma+Pr8U3lu2G3fcDssKWXfhXT7RcEgxbELQHQklyJkwxjHiY+fKaRDHo2oHj0+zL
 qaqsts5yuXdCm+c2rOLDsVw1l4iVL2S7UtFYglGUXDFEYi0bUYcej7E0QYs1o8MFIOh2
 ypdfkAR1uB/fiYU7CyAPAYzMlitBIk9NqMC3S5ZhSCeMFhWzJET60n3BfBVsCR1HYHwj
 lRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m50+uIYbAQBxoxKSnswN56p1FNJUVydppVeB2uGn04o=;
 b=o/mSb2AObTp0nLUKf3Iq/SfXRC9xYyBQZ95sAqnbyb/Dx0H8W6GOXtyx8+Tl84Vh1l
 gGE8v6bvLq7jgaJ/0dbAFRIGiOT+Gagy4f5+nVz30JFmlnwwW4Aos/nb4vAB1v+j4c4x
 d2Qu5+Y6nVZSt+oDejtpGkdnDuQwGVuuDmVZ045OmyIyAr6NJ+ajCgZRmXWjEBcFlUCz
 W5SwabHTdL3Gl7TXzl/CnrW04pbfW/YDBDZGOXnY76vU6oiCi5LjVj0Acwh6bP992IY6
 uvp6Yzv3fKZ4O97rA1Ha7OfObdS2STagmX46AVEXwaRsv14XHNZydOxqqCy80VHO/HWj
 kVjA==
X-Gm-Message-State: AO0yUKUykvNKTVGlCLbSI/yu+EKYpLo2D5er1ni3HwKVwiCiBvqbI6NZ
 sl69JC6hZ4X49wftl7+tJGIH2gzHj5oAOXp8KHOWcA==
X-Google-Smtp-Source: AK7set/G9W7IccqvWmXfDUrwGnYmoFYj7qwu9pjaV1GSNl12IVHwMFpmjUIOyGLJWpXBNutl/kIh949fOPPJEXEkOTs=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1832721pjb.92.1676993397216; Tue, 21
 Feb 2023 07:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <Y/Thas4efx14JsBi@work-vm>
In-Reply-To: <Y/Thas4efx14JsBi@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 15:29:45 +0000
Message-ID: <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
Subject: Re: [PATCH] tests: Disable migration-test
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
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

On Tue, 21 Feb 2023 at 15:21, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> Damn this is really going to impact the stability of migration if we
> don't regularly test.
> But fundamentally, I've never been able to debug much of the reports
> that come from flakyness in gitlab ci; we're not getting the most basic
> information like which subtest or where we're upto in the test which
> makes it very very hard to debug.

Right, but if you want more information you need to change the
tests and/or test harness to provide it.

thanks
-- PMM

