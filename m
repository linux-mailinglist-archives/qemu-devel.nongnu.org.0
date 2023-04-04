Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F86D6DF7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 22:24:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjnBp-0004mE-6f; Tue, 04 Apr 2023 16:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjnBn-0004ls-TH
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:23:35 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjnBl-00012f-Mh
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:23:35 -0400
Received: by mail-ed1-x531.google.com with SMTP id y4so135607296edo.2
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 13:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680639812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qtnfcb1Ih4G0AUf2ogCQJZbAbqGXwJLYMTW0UmtbEH8=;
 b=yWSBepvwTEZlKimsXf2nODwuA4yg1Lv7bplercgrVvHbHp2k0THAmf0YpcvjBNxRb+
 bisTl2CTFB+yUzduMrZnZgTvcHOzXW7HaDuiinCQXHBm2boxf+2rM1SgGqJvdBmTBg/x
 LzKF5OrNOW57A439GLBfNXGFNIdJohjqdg36EDiS0xRDqMhKiMh2Lt1Ee5ScCu1YfgKh
 9jdYQeP2NRv6dk4RM+E070j8KgDMnSz1Cw/Wz20/W4otkwMBwm3STlSqJLK4LBwGgmkH
 CpKv1uvizcexUOtlOTDZfC+L7iMSkWpT6vTg2CwBTvZBfIoKSNB+/riDqR+dL7LaRoMQ
 aEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680639812;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qtnfcb1Ih4G0AUf2ogCQJZbAbqGXwJLYMTW0UmtbEH8=;
 b=JdjY1U4Y7fcZKaRXQsumMXIwctrjWlJTDKdYVHZcna9s85+QnUCub91UfYkHLHfcNa
 +Cc3bbIfJqSSoyzDCOayskX0vdonakySRzOv8P5stWILce4vXudzXP5MMJqmTvDpOndv
 nXmtWJMvfXBidJBBG/Vhi/nAY0t45kImwfLizyoZMg36fMb4HzTmFoXx0gLiv4T7CxJy
 4MHBxI63ccrgwOCG2/5kY8IP59javhgGs5Kq9VonfFdZkwAxbJOi0lI56CWoZdV9p4rl
 DkCfNEQY+85jo9lpgxZZS8TDmY9WVlSY57W3pKNAtlIN/6mKGzrvKAsaxLbxOq45Gz+K
 2aMg==
X-Gm-Message-State: AAQBX9chmCx/XK8UyVTQgvLU7zY45rH41N1ywKJoMjj9nD2yyyscElnP
 ZPHOA350fVr8BOQKAMCqyRDVItVET+o4k8An6354jw==
X-Google-Smtp-Source: AKy350ZXcp5FjD1cXwLBBuvDzqMPvhN04BzdStZz0JUJO4H/m6S+EbHw3NSll3820GRVaYwfG9TSugukapcvMTlV+Cw=
X-Received: by 2002:a17:906:71db:b0:930:90ce:a1a6 with SMTP id
 i27-20020a17090671db00b0093090cea1a6mr439934ejk.6.1680639811815; Tue, 04 Apr
 2023 13:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-37-mst@redhat.com>
 <CAFEAcA8D+Yy-G1WUY-aPLvk2b1Bh46sheF8msUMQa2Cgt+mfdQ@mail.gmail.com>
 <20230404150929-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230404150929-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 21:23:21 +0100
Message-ID: <CAFEAcA_SN91x3W+QG-_wFAK4GgQkEW1CPYktK_JoELTG8uvo1g@mail.gmail.com>
Subject: Re: [PULL 36/53] memory: Optimize replay of guest mapping
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenzhong Duan <zhenzhong.duan@intel.com>, 
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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

On Tue, 4 Apr 2023 at 20:13, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Apr 04, 2023 at 07:00:04PM +0100, Peter Maydell wrote:
> > On Thu, 2 Mar 2023 at 08:26, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > From: Zhenzhong Duan <zhenzhong.duan@intel.com>
> > >
> > > On x86, there are two notifiers registered due to vtd-ir memory region
> > > splitting the whole address space. During replay of the address space
> > > for each notifier, the whole address space is scanned which is
> > > unnecessory.
> > >
> > > We only need to scan the space belong to notifier montiored space.
> > >
> > > Assert when notifier is used to monitor beyond iommu memory region's
> > > address space.
> >
> > Hi. This patch seems to have regressed the mps3-an547 board,
> > which now asserts on startup:
> >
> > $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> > -kernel /tmp/an547-mwe/build/test.elf
> > qemu-system-arm: ../../softmmu/memory.c:1903:
> > memory_region_register_iommu_notifier: Assertion `n->end <=
> > memory_region_size(mr)' failed.
> > Aborted (core dumped)
> >
> > (reported under https://gitlab.com/qemu-project/qemu/-/issues/1488)
> >
> > Since this commit says it's just an optimization, for the 8.0
> > release can we simply revert it without breaking anything?

> Fine to revert by me.  Zhenzhong Duan  can you pls fix up
> this regression and repost? Maybe fix typos in commit log
> when reposting. Thanks!

Would somebody also like to send the 'revert' patch, please?
I had that all ready to go, but my git send-email setup
seems to have mysteriously broken and I don't have time to
fix it this evening :-(

This is the commit message I wrote:


Revert "memory: Optimize replay of guest mapping"

This reverts commit 6da24341866fa940fd7d575788a2319514941c77
("memory: Optimize replay of guest mapping").

This change breaks the mps3-an547 board under TCG (and
probably other TCG boards using an IOMMU), which now
assert:

$ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
-kernel /tmp/an547-mwe/build/test.elf
qemu-system-arm: ../../softmmu/memory.c:1903:
memory_region_register_iommu_notifier: Assertion `n->end <=
memory_region_size(mr)' failed.

This is because tcg_register_iommu_notifier() registers
an IOMMU notifier which covers the entire address space,
so the assertion added in this commit is not correct.

For the 8.0 release, just revert this commit as it is
only an optimization.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


thanks
-- PMM

