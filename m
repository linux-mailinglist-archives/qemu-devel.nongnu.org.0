Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F13CB3BA
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 10:05:12 +0200 (CEST)
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4IqL-0006wq-CR
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 04:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4IoR-00067q-O0
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:03:11 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4IoQ-0004f0-7u
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 04:03:11 -0400
Received: by mail-ed1-x52d.google.com with SMTP id ca14so11856304edb.2
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 01:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z9yDIgzc67IdkLejpBPUKlO7pz/cr4vavvFnIF//sms=;
 b=doDSXqy8ZFpmO/YSxm1qm9wzMyNtxkM8bUa8WpuppQ93PILLDdxRzyYi+C3vWBSOPV
 xZyKQCxsnjcqgFO6P7NTkb4ulk4AlQO3Gq4L/iaF8JVSEnWC7TAo1uRdKqcvz7GuEcti
 3T/0n7Z/wIB9Eiv0e3FePrkYi8bxuUI7GaB4gma/r0C3zya/opqAxu383WRSZTDE96dW
 GMPWbzv5LEqZFdJp92VucXDerj6uDGGB71oEEfXwsh6mkCX+cdkL2aYYpYmEHAgCG0WD
 Gmn7IzPBkamDgOs1MhkYOJnhmhZjM69w/YfHKh39hTNncJQ2u9B7SIBlnouI6IDMCvGn
 aQ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z9yDIgzc67IdkLejpBPUKlO7pz/cr4vavvFnIF//sms=;
 b=TM8Xm9gLIbo6gPqWS6EKPhTvUjEfzmTfNRAbJDpdlOJoLggvtEySws+FII1V8Q7jYl
 3jFgIDNbPhPXUKcJ2L4LsCnspcSiARQXtQGZA5yk1FMWjqdXoATpJZr91IOQ1rhd4/zu
 5LBZVhtwULIcRIx7PDBcbczvxJy4+yDfIZsKL3qabklpsqGdzDwGxH54kMB9tYhwIU3G
 gR9XDc29oZxO6f5dIXnLGlXgTrXiwyP7CYUVAuLu7VFOBSdumG7T0Lrq6NfGuNvUxXY2
 InNbkztWjBkZQLvev3M2TvfqIECw2nMYewWZlXRiJ/+cCz0lK6zE+RVHh1tIgwbGPTlC
 FqOg==
X-Gm-Message-State: AOAM531Ka8pbg0nhU6Du7USMp/22In4TDdwWkL2+Oy6wol2eVyX+r3Ym
 QUaKPx3W9m0EPfkgzEO96Axy3ri65hwT9kWeXghBcA==
X-Google-Smtp-Source: ABdhPJznUxiUN4oPVVoqqEPbyRORvYgkPFYJP1eZMcduTMgvpx5z+t79hiWPOIri6GVca5q7mLC+jOOHRv7N/Y0dEus=
X-Received: by 2002:aa7:d809:: with SMTP id v9mr13086652edq.146.1626422588142; 
 Fri, 16 Jul 2021 01:03:08 -0700 (PDT)
MIME-Version: 1.0
References: <162629838902.830787.15967554940825048991.stgit@omen>
In-Reply-To: <162629838902.830787.15967554940825048991.stgit@omen>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 09:02:27 +0100
Message-ID: <CAFEAcA9f=jq0woei2qczay6kcEekdFH6coXoykL54cJ=N1b9WA@mail.gmail.com>
Subject: Re: [PULL v2 0/3] VFIO update 2021-07-14 (for v6.1)
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Cai Huoqing <caihuoqing@baidu.com>,
 teawater <teawaterz@linux.alibaba.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Jul 2021 at 22:36, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> The following changes since commit a9649a719a44894b81f38dc1c5c1888ee684acef:
>
>   Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-07-14 18:09:09 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20210714.0
>
> for you to fetch changes up to 1bd9f1b14d1e9c1498bb03faf4e2bb945cf6542d:
>
>   vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI processor (2021-07-14 13:47:17 -0600)
>
> ----------------------------------------------------------------
> VFIO update 2021-07-14
>
>  * Coverity fix to discard listener (David Hildenbrand)
>
>  * MSI-X PBA quirk for BAIDU VFs, additional helper use cases (Cai Huoqing)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

