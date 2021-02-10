Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA82316488
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:03:45 +0100 (CET)
Received: from localhost ([::1]:47598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nHY-000145-1X
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:03:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9nFP-00008D-PH
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:01:27 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9nFN-0007h7-B4
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 06:01:27 -0500
Received: by mail-ed1-x533.google.com with SMTP id s11so2417859edd.5
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 03:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0d80+5US/rRRtyVIzookBTteTJTV+79HZZ1Eozo2aKo=;
 b=hM+GO8njyWV34m9DL1lOiFXX5psqN26TRztDpEVITpkN33HLM41G4RzETEAZqYnznC
 DLaaJPhOwUwLDa+9iecPYhJugluNhSm+zMZ7IZILTWyWNlwLDhqpfhwu0Mm8WtCcL7RC
 V9ImAr3BnjGykYo035QIblMty7j1ilMIC08ET/zjlL3vg/ruROMh/PL/M19IuBVWHklZ
 l1R1BWRpnmsRbsNXWpWZSuo3vAlOuFEmdOIOkZIgwL4ve8c6DyuXBIfDble+XPP85H/Z
 4YjV5hzPoRVJZAt3/EOfSPud4Cxx6jgY+x6xn1xzjkG0IOPJZ+yKZVFDzfwgGBsgN8DW
 x0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0d80+5US/rRRtyVIzookBTteTJTV+79HZZ1Eozo2aKo=;
 b=Qkh4bFdNRRP9K52FnfCTNucmG/NmO0d4VEAQOrI38Ay+tO3QZ82MM1DGb/FeEB3KJu
 kCCBiWOAvu19dPA0bpwtHm1LhaIOupoMJf3OlYbFk1zJkJPWPNgHPou6PDPOke15kjr7
 aJn/k8OM+uMhNqnvfYaFsd1j65lqKKmK8L9Z6nVSB1dyweid6lO9d3CD6IB7kluO2GI4
 i3MI73BPjYX0buoivgBkBhKI5JMBrVDR6YEj+/EWyLJFmQ9ROr+OVbyGHGZXKSv7O2so
 +V9kIPU199ad/VSukuLLskZHAanFVJK8dSoiovblayhHbw+yTVShhDQjDLogKmxjwxIt
 F8KA==
X-Gm-Message-State: AOAM5334CSy/QM8uCS7rxJCzp0EG/KLWqUfC/Iygeu5nZH01EG5nBEkh
 AQUzMonHaJXXYg1T6IQHcdJrUD5gm8d5xpbVPMuwnQ==
X-Google-Smtp-Source: ABdhPJxmw7bFTgorhxz7+5bfcV8mUlL4HIj7eaK26JFi7Eoe2wWcioec78jmNuVpRDA3EC2MwnmGmcGqqFiDfdYdk/Q=
X-Received: by 2002:a05:6402:541:: with SMTP id
 i1mr2621067edx.36.1612954883866; 
 Wed, 10 Feb 2021 03:01:23 -0800 (PST)
MIME-Version: 1.0
References: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
 <YCO0Gy6ZKY5qGZgT@apples.localdomain>
 <CAEUhbmWB2PCYbe2Dd2Ui8C-=dE_FDjEMApDf1GkXzJe2LBQkRQ@mail.gmail.com>
 <YCO2BMwhJE/yoNav@apples.localdomain>
In-Reply-To: <YCO2BMwhJE/yoNav@apples.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 11:01:12 +0000
Message-ID: <CAFEAcA-Pn1RPWuUaQ-g=80Zo1UYE=L+hGgQePaCaSsz3XxKvFg@mail.gmail.com>
Subject: Re: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
To: Klaus Jensen <its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 10:31, Klaus Jensen <its@irrelevant.dk> wrote:
> On Feb 10 18:24, Bin Meng wrote:
> > I am using the default GCC 5.4 on a Ubuntu 16.04 host.
> >
>
> Alright. I'm actually not sure why newer compilers does not report this.
> The warning looks reasonable.

It's not actually ever possible for nvme_ns() to return
NULL in this loop, because nvme_ns() will only return NULL
if it is passed an nsid value that is 0 or > n->num_namespaces,
and the loop conditions mean that we never do that. So
we can only end up using an uninitialized result if
n->num_namespaces is zero.

Newer compilers tend to do deeper analysis (eg inlining a
function like nvme_ns() here and analysing on the basis of
what that function does), so they can identify that
the "if (!ns) { continue; }" codepath is never taken.
I haven't actually done the analysis but I'm guessing that
newer compilers also manage to figure out somehow that it's not
possible to get here with n->num_namespaces being zero.

GCC 5.4 is not quite so sophisticated, so it can't tell.

There does seem to be a consistent pattern in the code of

        for (i = 1; i <= n->num_namespaces; i++) {
            ns = nvme_ns(n, i);
            if (!ns) {
                continue;
            }
            [stuff]
        }

Might be worth considering replacing the "if (!ns) { continue; }"
with "assert(ns);".

thanks
-- PMM

