Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F154D24111D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Aug 2020 21:46:35 +0200 (CEST)
Received: from localhost ([::1]:46868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Dkd-0004LF-VX
	for lists+qemu-devel@lfdr.de; Mon, 10 Aug 2020 15:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5Djn-0003rf-Vk
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:45:40 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:45085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k5Djm-0004JW-2X
 for qemu-devel@nongnu.org; Mon, 10 Aug 2020 15:45:39 -0400
Received: by mail-ot1-x342.google.com with SMTP id c4so8235626otf.12
 for <qemu-devel@nongnu.org>; Mon, 10 Aug 2020 12:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZJGJy/IoS/TWhKiLhCBcjgCqOdJRWcoaNR/9hYSAbUM=;
 b=H+3ItxXnGWXSUi2vwqLXzBV09Qb5iaVhK7i3qC6ys7iie6XRNflTfRwttcjn5mHzIT
 5dxEr0yVIxuT2KlRiXPr/7MRo6mK2oa3T6kVIhulJDD0h94Mg7+T7JyT0ljdIYrHR/Ul
 Y84I+4CjfU3yKOYY7sdJeLS56sjNZYlRJEDjsjV7HXf2YL4rmWWk9fV06GU7jXEfw/RX
 epnWNaSPRG6//yMrzhbS1i7q3iZSzLnmNxSNJ72wxH29CDVz1GOe+dcidfogiTox7pZA
 v9TL1Ldlc4B9s+6rKRnU/oeOiYz4aUHnpRtYmB4yNHWwEhylObML/KPBXHCBfh/riU7K
 ipqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZJGJy/IoS/TWhKiLhCBcjgCqOdJRWcoaNR/9hYSAbUM=;
 b=WwL0UWIhjOBjE1JnY2fFD6MV/3ZjYdrUhBFQbrfsaQkpgCFzFlJj9O/+RbH5jj6ziQ
 lYZTIaaEKw2KWEHYunzvsa1a7S+rrGJl59p37GJssRNOumCt+r1HolEuQv93/1Gup8Je
 XB3wnN2bgGl7xB/6v51y8MmW5bWsUkz38MgP0r0D2dKProIUnN1neC8dU3tRV8vXpttD
 2q2WNORVy1t4YhNkC4NlsPzHEJ9BUXHju38vmnC1zM3L/Otwmr38O22tXOvvbEz7lW6J
 jK2kPUn7hWlmeTRiBuMroynA5d1oWLban8SdLu0K7BSa2sn6F4y+Kuw82dnF3dnQkaMO
 V7zg==
X-Gm-Message-State: AOAM533gFLuADD69no7l3ocrLltYZ9ED5pHZANqe6z+nLLEswoowNxFV
 2ZvxHTCdodRRFY2xCeMI6VP6w3saXsQ4rVr1L7ytjw==
X-Google-Smtp-Source: ABdhPJynXDGTLopXJazeDJCp7WDSS66JCnqJfSCkRdEfOfuyRWh1W6ZMULmh2CC6AfO6KBdz+KNI43ZN8Wc0M+3lOF8=
X-Received: by 2002:a9d:24e7:: with SMTP id z94mr2046446ota.91.1597088735615; 
 Mon, 10 Aug 2020 12:45:35 -0700 (PDT)
MIME-Version: 1.0
References: <1597079345-42801-1-git-send-email-pbonzini@redhat.com>
 <CAFEAcA_icj94N6eotg9W7FutXTY_6U-Ak6pJMyYH0n9eggunrg@mail.gmail.com>
 <CAFEAcA8smstwpQUD9UJzMuE6Cq2WutQzBPrKLLs=3wvfXUmpUg@mail.gmail.com>
 <b710345e-1644-782a-44a9-537493b85d95@redhat.com>
 <CAFEAcA9v7jv=SYZ0NLeSkjoM3da-apeu4OC5BMmorxMue0-viQ@mail.gmail.com>
 <6a82c3b5-037f-7cd7-68fd-0fffd8eff192@redhat.com>
In-Reply-To: <6a82c3b5-037f-7cd7-68fd-0fffd8eff192@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Aug 2020 20:45:24 +0100
Message-ID: <CAFEAcA8xB=vOLvj_w9iTWWKh6kwu7fWN8QUbVAYunRdnJG0Qmg@mail.gmail.com>
Subject: Re: [PATCH 000/147] Meson integration for 5.2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Aug 2020 at 20:36, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 10/08/20 21:26, Peter Maydell wrote:
> >> This is a real warning.  I'll see if we can add a configure option to
> >> disable the translations bug it's fairly low priority.
> > Is there a package that we could install on these VM configs
> > that would provide gettext in a way that satisfies Meson?
>
> Note that if you don't install it, you just get the previous behavior
> (plus a warning).  But if you want that, it would be simply "gettext" I
> guess.  You're using tests/vm/*bsd right?

Yes. Unless there's a strong reason for testing the no-gettext
configuration via the BSD VMs it seems like we might as well
just install the dependency. Silencing the warning would be
nice as well if the lack of it isn't actually problematic.

thanks
-- PMM

