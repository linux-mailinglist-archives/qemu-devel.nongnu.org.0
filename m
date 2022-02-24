Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA544C2E99
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 15:44:42 +0100 (CET)
Received: from localhost ([::1]:52700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNFMH-0000sb-89
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 09:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNFJo-0007Cx-Ov
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:42:08 -0500
Received: from [2607:f8b0:4864:20::112b] (port=36699
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNFJm-0005t2-Rc
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 09:42:08 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d310db3812so27592817b3.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sKeXaQKZcYhfHAETWvUqal4j+oBFrfcvS+Bi018smAk=;
 b=i8b3IEuY8xnQiotcb9r3BPS1DzgwwQq+MkfZUJ2zmc9sMqE2nrONKHQKOK97rONLMD
 qSUByr10cFvuEE5nG6tRQUnG3zy66iAh6czS2B+3ij1NfpakoGfQ7UtoIC54PO94RgTi
 Vl6HoPCDEd4qFVEc2D8RFfRFehEDGy+8iYg7nujWLPm/rvp+wikNCJxeXLyEdu1plEg7
 12S0XQeI3dTHm7ctppiRVdL93mrVGmP/D4VcdYzL3wehoyVLeagOyVCJ2e40cT5SJTo2
 2Igei6IdUT+nI9gCKPQ+xtVfr86W1R6rW8bqRvbOYWor6wIDojYRC4tmhSc6BF0+KZW3
 SJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sKeXaQKZcYhfHAETWvUqal4j+oBFrfcvS+Bi018smAk=;
 b=0CZxK+ZVhlZmj8EoxZte/yAUgTYHlnIJ3hjAsFvrq4V3C9DnzRgYn7YdfO33oyM3ft
 jApKKOFCvPhIu4RVNGZL14vwy7UZqgM27/KV4uQia28f+dGtU/0XGMDHVwJmwmj04GHe
 xZPLf3udiNSm9rVd0AlQFjjftLPZV/gANO7OWrcSqzTpVVt2J8e2EQH/+CBqGDNBcPR2
 7dz/Z/QH5SrpVzOgqc6FbsiXk/g5AfglUI2+d3bjldNwUm/PiZHOaNnM26OUvzl0Ygpi
 hPU+KgvnhqVAjX0uNENzqXpNORFmFWlVF/CcZUKnlUdIwWUbqdk6oSL0NAfKhpQXg5a7
 exwA==
X-Gm-Message-State: AOAM531qMqB7stnA8viBb3cQtMhPthUWbTWGetL6MeSzSq9XrxOZPiSg
 gqWMjyL5NOzu4QzbsE9QZC97sJWHxHICT1u0oaYi/A==
X-Google-Smtp-Source: ABdhPJzqE71rIb+CyINGR57iuxvzTzdiC7SlSaK0MuwvHQtjStkcp+IZ9oiEEhIc6h+HbjPjN5iezWBZlCkxcOeYnoY=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr2678540ywh.329.1645713725623; Thu, 24
 Feb 2022 06:42:05 -0800 (PST)
MIME-Version: 1.0
References: <20220224143716.14576-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220224143716.14576-1-akihiko.odaki@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 14:41:54 +0000
Message-ID: <CAFEAcA8JgMFhHGd91A=EzVNNgUZu-8YEKi_cdOnwnitrtH=3Dw@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Support PSCI 1.1 and SMCCC 1.0
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Feb 2022 at 14:37, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
>
> Support the latest PSCI on TCG and HVF. A 64-bit function called from
> AArch32 now returns NOT_SUPPORTED, which is necessary to adhere to SMC
> Calling Convention 1.0. It is still not compliant with SMCCC 1.3 since
> they do not implement mandatory functions.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>

You didn't need to repost this; I've already queued it.

thanks
-- PMM

