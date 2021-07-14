Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9283C8EBE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 21:47:49 +0200 (CEST)
Received: from localhost ([::1]:46238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3krE-0000lt-3l
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 15:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3kpr-0008G7-S8
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 15:46:23 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:38637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3kpq-0001la-66
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 15:46:23 -0400
Received: by mail-ed1-x52d.google.com with SMTP id ee25so4735632edb.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xJ47BL1PBnNtjksUHjy7eE1RtMuDf85wJfUn+r+VWFM=;
 b=PpsjVGD75OuHA5AADuK61DApRVzm5XjA158uYG1fVnQye0ZmX775l+JdOMSRz9Enxj
 D415qMB27nNdrRsh6uh0RXh9jCaK883WchKVbHxUcpQVtkHi+VHbGsSaSukySq4iIi+W
 R6XU72N5wXoZ6+rf8v1nBqVNaA46oEU4cZuII1eBLAkCnPuj3uK9TyMv9olmhw5Bu591
 HB04BpPo2ds2tYbyZ/QHNkoYFz/v7segZ9elYQUFsIQCp/JldYbZJX/QAai8x/6R4NrL
 mb+I0zok5+I+g35wpfN1nPGYTOSJg5qjMoH2ImTcyLKByplXkKpNe5m2ADcHw1hpk8xP
 C1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJ47BL1PBnNtjksUHjy7eE1RtMuDf85wJfUn+r+VWFM=;
 b=gpUXOxx4P+abkyK7jTLQsVbHoiutAxNM1Zt5W28I48jsvJiSb5ObP80vpzHxW/E2S3
 XJY+3BUGLvX85GXcVQAZxZKdYlERSQ1IUK/0Krwu0om8HM2ZadeRWt36jBjoir7W4iow
 PI7HPff+LwExndXtCyJObfn6YVeZsf/endjqP+VEskov/FQMF1PEVfP8qBhFfTVDonvK
 9/Me43/d2kMpNl/hc7DCgdq0xcoqA9zVXRxOtxs90ldCdrYddn/kGHfTNW4Q/ImvXHtD
 bamzhi0KXdow43MEbAxgzNh2glq45V1Fxygw19Z4oXH4bJ4zqOW4Q4DAElU91NWNUIIi
 c1NQ==
X-Gm-Message-State: AOAM533gQqIXt+RbqTamhYz4/FE8zyHvJwnTH6b9PdEbx5TQp2cbN26X
 pV2LOI0qalYVKbvVl3c+q5walWiEqd9w7V6JuS2Jgg==
X-Google-Smtp-Source: ABdhPJwXWTv8MF9s2gKYPSo4HIrVF6BXBIhI+KBBf87K4KIRDl1WHMpLo64hOkpHZVAKINN7A6fnSVUiXzZVqod0DEg=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr15714231edt.100.1626291979992; 
 Wed, 14 Jul 2021 12:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <162621155674.487037.8788212042441164398.stgit@omen>
In-Reply-To: <162621155674.487037.8788212042441164398.stgit@omen>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Jul 2021 20:45:40 +0100
Message-ID: <CAFEAcA-m0hk1CTWj2W2bvYnuZgcn9xiUiS48kdopSgV-FkWcKg@mail.gmail.com>
Subject: Re: [PULL 0/3] VFIO update 2021-07-13 (for v6.1)
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Auger Eric <eric.auger@redhat.com>, Cai Huoqing <caihuoqing@baidu.com>,
 teawater <teawaterz@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marek Kedzierski <mkedzier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Jul 2021 at 22:42, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> The following changes since commit 961fef0ace0b2a997544deec2f01981b9c9c96e3:
>
>   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20210712' into staging (2021-07-13 17:51:50 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/awilliam/qemu-vfio.git tags/vfio-update-20210713.0
>
> for you to fetch changes up to fefc1861d4ba8b9b4d7153dc6b359a65468d15cb:
>
>   vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI processor (2021-07-13 11:31:14 -0600)
>
> ----------------------------------------------------------------
> VFIO update 2021-07-13
>
>  * Coverity fix to discard listener (David Hildenbrand)
>
>  * MSI-X PBA quirk for BAIDU VFs, additional helper use cases (Cai Huoqing)
>
> ----------------------------------------------------------------
> Cai Huoqing (2):
>       vfio/pci: Change to use vfio_pci_is()
>       vfio/pci: Add pba_offset PCI quirk for BAIDU KUNLUN AI processor
>
> David Hildenbrand (1):
>       vfio: Fix CID 1458134 in vfio_register_ram_discard_listener()
>
>  hw/vfio/common.c         |  3 ++-
>  hw/vfio/pci.c            | 12 ++++++++++--
>  include/hw/pci/pci_ids.h |  3 +++
>  3 files changed, 15 insertions(+), 3 deletions(-)

Something seems to have gone wrong with your pullrequest. Specifically,
it appears to be based on commit 961fef0ace0b2a997 "Merge remote-tracking
branch 'remotes/alistair/tags/pull-riscv-to-apply-20210712' into staging",
which is not a commit that has ever been in master and indeed does not
compile on all systems. (This is lucky, because if it had compiled
I might not have noticed the mistake...)

Pull requests should always be based only on commits in master.

thanks
-- PMM

