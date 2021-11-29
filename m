Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8454616E7
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 14:44:42 +0100 (CET)
Received: from localhost ([::1]:60090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgxV-0007JB-94
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 08:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgoY-0004Ys-9n
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:35:27 -0500
Received: from [2a00:1450:4864:20::42e] (port=33741
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrgoV-0000Qn-Ra
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 08:35:26 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d24so36922737wra.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 05:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0KQTzCa7c4J1rHU9JGHeW7S9pJ4QB9yMciEz7+x4no=;
 b=HX3X3HZyK1x018BA5s0x9SZgTGTafq+yx4ILup1DGThuZDzPFugNGccrUDVz8hBIIr
 BI4QS0v1VuaODxtrLVPnLlg01OikY9hPBxlf9mO9sMZCShBAOq74rhkFPVsUaq70ljRh
 aE7PhF+nLpOAjd/4tsdzqncZ49ao8qtJnX0LQZgKMhd32h80kVdhfdv/KQ6/Tn9UZKfw
 CQgB4kL721lDKP/X8ailFega6FgTFxphDEqE9JYG2ivVAkHx3Di+nD89Z0pIXAzGhJRZ
 oFFVEZ276Zn8jOEf047QS1CcTtVqIN+WgxywjnkuUVK3FcktG7KYVFJ1XP1Op5BfVycQ
 kOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0KQTzCa7c4J1rHU9JGHeW7S9pJ4QB9yMciEz7+x4no=;
 b=kmrP2yq04CMsJsOVbBaQZwusIMb2J4o30DS/HnEcm0XjtLkenZJ6a2P+n2dXbtZl2/
 S8SydjsdfeTjjg9nQfAu8mHJ+fiFruc94TywLGQWCzmtkU+rzPmJBUABjsmgc0V0eezZ
 5KrJofxnbx/xI01xz8QxI1+narHm0wTJzGOrzn32GZ7pKFczddnO4iA+TUpV8PDHgB2L
 II6EFpEeEOQAeJdg//zS23C2iHktLOVtsdlfYCkJeSN1aK6vetMiSz5lbkOW1fAQlI8C
 ATqP++lBwo+1XatmjUnuebmTl+N51OzDieNz3crEgCGSxAEryVWwDU1uZ+R4TZtShjBN
 mK5w==
X-Gm-Message-State: AOAM533Byeke1lioKizueeFnvbd/RGnqV6lRWDacLTMsVwl+JjHR4+sP
 jwA7ujLmT3yD6vv4raFD1+yhoGKS+w3Doh3qRq8zvw==
X-Google-Smtp-Source: ABdhPJx7TW9R6XlwJipAvh2HbZG+IcN8fKKSnW4xCsbRjEBTHXLiF6Nj053MnseiKmtK64R0l7pQ0bT5Ujdpt2u/gcs=
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr33968359wrz.87.1638192922280; 
 Mon, 29 Nov 2021 05:35:22 -0800 (PST)
MIME-Version: 1.0
References: <20211124142728.1221817-1-kchamart@redhat.com>
 <20211124142728.1221817-3-kchamart@redhat.com>
In-Reply-To: <20211124142728.1221817-3-kchamart@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 13:35:11 +0000
Message-ID: <CAFEAcA-8uAu5nsyFCG6zo9+sFrywJxgeuUdgFzmdKx3wREUFrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: rSTify "report-a-bug" page; move it to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, thuth@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021 at 14:27, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> This is also based on Paolo's suggestion[1] of "report-a-bug" page[2]
> from the QEMU website being a candidate for docs/devel.
>
> Converted from Markdown to rST using:
>
>     $> pandoc -f markdown -t rst report-a-bug.md \
>             -o reporting-a-bug.rst
>
> Modifications:
>
> - Rename this from "report-a-bug" page to "reporting-a-bug" to be
>   consistent with existing in-tree docs.
>
> - Use internal rST reference to "submitting-a-patch.rst"; and slightly
>   tweak the sentence where this is referenced.
>
> - Also tweak the description at the top of the 'index.rst' to to reflect
>   that the manual also documents some of QEMU's development processes.
>
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg04002.html
> [2] https://www.qemu.org/contribute/report-a-bug/
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/devel/index.rst           |  8 +++++---
>  docs/devel/reporting-a-bug.rst | 37 ++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 3 deletions(-)
>  create mode 100644 docs/devel/reporting-a-bug.rst

I don't think the bug-reporting instructions really belong in 'devel',
because we would like all users to report bugs, not just developers.
I think the /about/ section would be a better home for this file.

-- PMM

