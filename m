Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BCC64DC5B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:37:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5o4r-0001GV-7j; Thu, 15 Dec 2022 08:15:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5o4n-0001En-61
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:15:05 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5o4l-0005V4-3r
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:15:04 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 n65-20020a17090a2cc700b0021bc5ef7a14so2683708pjd.0
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DwzRgHk0jCyWMBYwLf5cZtKyz3aMuE8K/kburg6nink=;
 b=ADL5UcB6E7l9h8mUxNS5e8UqO7O2NrhhMc/zt/l0zH/Vi37j0Fw3i3hUjZ3iw/rj4B
 rxCk8E3LPyMUJXKe5sphPdnANG6WfiBtwoHAwraXc6b2Jzlmr2ERUy7ZG0u9ybIGhSVx
 SYJ24CJHD7jigeNUqpcgvG1LzWimEGJodQKoenUuWbnDVLj1efTS2O2EB2qtPRotyL07
 5y69n+nWBhbidC+nE4AlzF22TlOIE+HVyJZBT6nsjIWBTGBQFJVFKK/zoo92QfXJjDZS
 LquBB2kTOXPKdGrcNKqs9G9zG2jZQLs15N/Hl4HDRcTUMyh+o0vFsJ/qHz1PKvI458Ve
 iFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DwzRgHk0jCyWMBYwLf5cZtKyz3aMuE8K/kburg6nink=;
 b=DJ2GH2Nv8y3ZQBEp48fCBHMR5J6tkJHzh/NRDIunjaIPgaxfH2rfN1SkIG+gQJFtyV
 nziEcKyYoi/TP32Fw8TkeGoLNhdCQHtWljVaVj9NZFtru1u9C6bFrKxwO47p4SrR6W05
 d0TDN7LDpEM0QO6LTM8RQms+JpE0bkuvcTy2cI2LBTsDivPfUWXoVEB5KkGfLNlYmGGb
 ycdPe3vVg4zZTfg6Cn/OvZS+AZuT2C1QqeMZdmbuh66gkM3QK8A8pm6HECPP4/Ik8Nsh
 +GwrE5C/GgBvHRREqlQ4zHpFXu4eRDz32dd4vXgA/E7dw6eZ46Mvw99hn0m9bNG4JaSi
 aSVw==
X-Gm-Message-State: ANoB5plck83sutUkpsE04HrJ6+c3NyPsoslp1sRTLcGohh3gdg9UikcA
 dbz62KzLovv5rwbfu+UQcMSkQusWBekAeq/TO56LHQ==
X-Google-Smtp-Source: AA0mqf7oZeP+lPoRtp+kyiiKQlc9b/eiYLcUaQIbBIFCP6bfwVbH5Ci8yvbq+ToCFv4NxAjAHHviWa86Kmn8Yo3Y6hs=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr23397610pla.168.1671110101713; Thu, 15
 Dec 2022 05:15:01 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8x_iM3hN2-P9F+huXnXFXy+D6FzE+Leq4erLdg7zkVGw@mail.gmail.com>
 <Y5sHtDP4vyEjhIan@work-vm>
 <CAFEAcA-PHqcGYMDj9OXKdY40Hb_rHCM9eeuh1rSnFL5-SyTfhg@mail.gmail.com>
 <Y5sYlkZ6q4/B7B2v@work-vm>
In-Reply-To: <Y5sYlkZ6q4/B7B2v@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 13:14:50 +0000
Message-ID: <CAFEAcA-yqYbjc_BVjQenTfS2_Bwo6OhtbQtwJb36aYgiocm+0Q@mail.gmail.com>
Subject: Re: migration qtest failure: "query-migrate shows failed migration:
 Unable to write to socket: Broken pipe"
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
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

On Thu, 15 Dec 2022 at 12:52, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > It doesn't seem to repro running manually, my guess is that
> > it happens because the machine is heavily loaded doing the
> > whole build-and-test cycle.
>
> Yeh; I think we'll still need a backtrace or better qmp log though to
> figure it out.

Unfortunately, often all you get is "what does 'make check' output".
Is there a way we can improve the test so it outputs something
more useful when it detects a failure ?

thanks
-- PMM

