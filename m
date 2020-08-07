Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEE023EA95
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 11:40:10 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3yrB-0005Tq-Cn
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 05:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1k3yqQ-000534-9G
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:39:22 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:43430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1k3yqO-0003m2-Pc
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:39:22 -0400
Received: by mail-pg1-x535.google.com with SMTP id d19so631852pgl.10
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTkztUbmivJRPCo+XsRK4Ev3J0cSbfzzlZVdWhD+bLw=;
 b=JdXIRsWN9VGNPXtJzUBJhESddTCYsX7CfwCVwynZC6Bs2bLcMjBiwX3KaZ5+44Qmrw
 H76nM31FwQwqUjWyH5yfgeTFRAerW5/kP7up6PxdxDSHpYdAuZ9RDlHfu5jZ1rH5t90r
 dTLZVySDXUXHuNqObUq86wVBLaQk4RnAkD/iVPplggJ0xROTigAFiIs7EJtB+rng56E6
 tJTjnTxGVgDvebEhxc+2TEmCkr7Tj42wqWbeIFa7E+LBjCfaK4RuvYCQnTlzIldkUAfl
 xjfj8zinY3Hy8LffdO4Kjdt7Ys7vz8jq2AevUUDfCBY0AxUm3ftSZN/eMWoQQHwqsfE+
 9zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTkztUbmivJRPCo+XsRK4Ev3J0cSbfzzlZVdWhD+bLw=;
 b=WBVORZlCt8bx0qvRoC6fmtP9CllAEA1wej7Btr98h0kwhdHmzrRuvKgSjgKVitZNK1
 PdFOYI4rQvJQ+bmKH0B/tXXzwYGohfBkh2GGUCkhZ5jicDjhAPLsixneG4u0NkMdSPwX
 foF/72zMUzRCunJeMJ5mxP8L1qM/8qGB0Q1uwkbCEfhuNMf0k2woSfiRT0sRq4F1n47Z
 C4KxJv44OrHct2kLKIH+Wyv7QwXvIcP7ZDwni3tLo5RnEuDm93sUQu+aZUOE5x9tVjnw
 gC4Xc+xsjGBwkgTRSqc34XbjLkFTRR802cMHQ4PqqqpZniqFl1Zv6wDopBS6gS5r7gKL
 h2Pg==
X-Gm-Message-State: AOAM530/0kliYuxcXBkwOuRkF7XL3kSmgvWk+kDHGlT/6bhrVPzDjDuG
 ofiVzKRZmU3IQaBkycFHjiDlBnMDHnEPAI+bgIM=
X-Google-Smtp-Source: ABdhPJxVfhJinPsNOa1lWwv5ZIx5RQY09C/B/J+j63cjrA3QibcVyVBooHWBKEZpZ3eNS8THpw1E3w4Pkog7Jf+rw0k=
X-Received: by 2002:a65:558b:: with SMTP id j11mr11449329pgs.61.1596793159091; 
 Fri, 07 Aug 2020 02:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAJSP0QWF8g7r5VqU_PRbskWZU3ahCq+eobR8GexUcPrAiYoCPQ@mail.gmail.com>
 <20200806115148.7lz32dro645a3wv6@mhamilton>
In-Reply-To: <20200806115148.7lz32dro645a3wv6@mhamilton>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 7 Aug 2020 10:39:07 +0100
Message-ID: <CAJSP0QUzzHST0vMc_hqu7VUsms+NaN1N=+W-Y_SZ71OMxjvkLQ@mail.gmail.com>
Subject: Re: Why QEMU should move from C to Rust (clickbait alert ;))
To: Sergio Lopez <slp@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x535.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Dave Gilbert <dgilbert@redhat.com>, "Oleinik, Alexander" <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 6, 2020 at 12:51 PM Sergio Lopez <slp@redhat.com> wrote:
>  1. Having a reference implementation for a simple device somewhere
>  close or inside the QEMU source tree. I'd say vhost-user-blk is a
>  clear candidate, given that a naive implementation for raw files
>  without any I/O optimization is quite easy to read and understand.

Yes, it's important to have crates that make it easy to build device backends.

The following common areas come to mind:
1. vhost-user protocol and vring APIs.
2. vhost-user conventions for command-line options.
3. Live migration support.
4. Sandboxing (seccomp, etc).
5. Management interface.

They can all be separate crates and you can choose which ones to use.

Rust-vmm and cloud-hypervisor have already started on some of these.
It would be nice to work together.

Stefan

