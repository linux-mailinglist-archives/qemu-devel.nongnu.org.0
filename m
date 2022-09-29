Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0365EFBD4
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:21:41 +0200 (CEST)
Received: from localhost ([::1]:56158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxEB-000773-8s
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwQP-0003Cq-2J
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:13 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odwQN-0002vA-EK
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:12 -0400
Received: by mail-ej1-x634.google.com with SMTP id hy2so3894266ejc.8
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=qJbmWe7ihXgfp2eFg1Z52taw+UVVoeZ/Nny1tLeMBmk=;
 b=iUKlC11FxrVvZDppcZhax9GN+BtPmRk3pL/uPAaSTYNJCfIBFD5MhE7WOJve6aL8NI
 GT1P3PSaX9gZln5pejh+ZzmVMNqmsc/Xax465GJKbObmxq0j4iCTXb0+Re380VNVBcbR
 VxDzBsg1rvvG63gydz7cVJnZP2XFVYjMrBYXMKBcbrEHtNAl20ymTUsi5QNLHu2txC7m
 +tXMptfWyJPzpaUSXeFSzh1xm/zEwwE0yzHGfZ3FoignZSrbs5y1hGL+nPLYBSxy49BJ
 za8FhsyNMcKPXWEOUNGyCLnVO9XR0nv4I0WMeN1AL0mkBguoXUxEKbtFwtOXnGdGnGOZ
 U4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=qJbmWe7ihXgfp2eFg1Z52taw+UVVoeZ/Nny1tLeMBmk=;
 b=3nLCNeQRoVGYEoPFf3DRmcBQcph9srGDlQ77Sgrji7fASlfB2hAARV5EnZQB3JaOdZ
 gjm0mDcsOpQOk7VKHKgCXfdxSPssEfixJRcZcdcKPizp6kazAKUZgCpuyd50E43TiPAU
 2ENSaaw6B3MIuddQjGH5wjXPrNDBgjEXyXs4oc6Qpz75+/MK3Y91XITm9UnPZr19LLIf
 miyh17fHDzpKagGCWF8qKUI+kSVymSqULL5ROPkL04LzWlsBCmKNQ9AXINRPfAgTvbox
 khVXl/0QyRMjHHvVB8XDICczzXM/UhvFZCIwDl3caJhX/I2D5K9qVYmbI+47FdScNixu
 UR1g==
X-Gm-Message-State: ACrzQf3evqmXXUSV4Z/7hwNzS3dEJSt2hJgYk6KeWpjumxBxzPGQNhap
 wEY7Gj7gnpTPkMaAshdhuQxcr98BWF7YAxoj/SwXPGt5gdM=
X-Google-Smtp-Source: AMsMyM7IvymmyAqmwT2A8aAYRUiuisFD1IgDggxyREhVmdC9VoQHVup6q5KFiU54Y7eG54HWutGlSA0KxlHIyyDY9yA=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr3546825ejc.36.1664469009685; Thu, 29
 Sep 2022 09:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220818135421.2515257-1-peter.maydell@linaro.org>
In-Reply-To: <20220818135421.2515257-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2022 17:29:58 +0100
Message-ID: <CAFEAcA_JtLJg0qfm5_rpb1K9oN7taVTTT_W+a2Uvywo5tLw5Gw@mail.gmail.com>
Subject: Re: [PATCH v2 for-7.2 0/2] pci *_by_mask() coverity fix
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping! This series has been reviewed.

I can take it via target-arm.next if you'd prefer.

thanks
-- PMM

On Thu, 18 Aug 2022 at 14:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes a Coverity nit relating to the
> pci_set_*_by_mask() helper functions, where we might shift off the
> end of a variable if the caller passes in a bogus mask argument.
> Patch 2 is the coverity fix (adding an assert() to help Coverity
> out a bit and to catch potential future actual bugs). Patch 1
> removes the _get_ versions of the functions, because they've been
> in the tree for a decade and never had any callers at any point
> in those 10 years :-)
>
> This is only de-confusing Coverity, so this is definitely
> 7.2 material at this point.
>
> All patches already have a reviewed-by tag; only change
> v1->v2 is removing a couple of unnecessary mask operations
> in patch 2.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   pci: Remove unused pci_get_*_by_mask() functions
>   pci: Sanity check mask argument to pci_set_*_by_mask()
>
>  include/hw/pci/pci.h | 48 +++++++++++++++-----------------------------
>  1 file changed, 16 insertions(+), 32 deletions(-)

