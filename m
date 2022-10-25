Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5460C9B3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 12:15:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGuq-0002vB-Gs; Tue, 25 Oct 2022 06:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onGua-0002jh-K5
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:12:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onGuL-0005ZO-HP
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 06:11:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso9145268pjc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 03:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LUyYHFTajOMRagUGuKMbxRYybcrw0AAj8PH7k6FOjEM=;
 b=mlTep6hZZsIIzwCg7W4PmY+kAeHE4rVgJmCPBYz5asuFvlyaQlTblEWmZC1Q4cTrHl
 Xg5wXwLOiU+5yhB4SyK8Y+VVSfWvZzZ1GHuP4pvYpOtdkt76LqUHhRJpdvvBU5QVLzeV
 irSK2ast/lCHvhYDPISw/Zdmo1Wvag7+HzeHSZoL6vTT4xEDPu1ofiN0Rpj0c3h0xNZO
 3lGzTeibjo3DBGOTYv1xAttWxEw7659Q6zY0KRWhn9Srsj1nPJmvLXbplueMjQPgToi3
 hNHbjISUipNe5CJTPrLyTjnJK4VNXJvjmvdhD39P+hNOF4v0PU9kpsrFp0+mLkhlp6BS
 f0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LUyYHFTajOMRagUGuKMbxRYybcrw0AAj8PH7k6FOjEM=;
 b=XI8YieLcY6yQYHRe+ekCBUo33+orlQ9byTl1lwdF/jeEeTFCfVxxy9K2kxwnYNh1wR
 HisakCcmu4i1NPQnyjGN4WYpE05LNqMLaHKrAPAQ9iRnleCoVWr9q8wsZvlsDtzFSKau
 ocMLz4L71z0W6l7L22EFkpGHmRAVB6TjJuk9oDnBIpwsw3CqFyeQptOlJnU/1ral0n/w
 Bu8U4eIGAuIMgZXBw2+NBjcxcfSOJQFHoVU3l6UP5ro0MKqjGTCKSn96MUjlMFzkCpad
 2w7K15hFbRMGK0OFb4aV1Ah6FB/MjU9tNDoE/wH1T8qVt/izQcfZna4RTT5Yydq8D6bn
 Gbmw==
X-Gm-Message-State: ACrzQf1YzBMbrutJxwi7apcyiy07yKt2/Xr+wnk6590T/whGsn7ly6lR
 ZHwy9T3ATZm9SMI+MSII/gpp2Lwtq7c7lCUccruVjg==
X-Google-Smtp-Source: AMsMyM6nDeeg2e2M71q4Wm4Y/ElZB7z1YLlffNWmIwndCd4VAe71Vu0LmMuwmLtLCjlB1NEm70YBoRmMr3KUr3oUl0Q=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr36504465pll.19.1666692699443; Tue, 25
 Oct 2022 03:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220609135851.42193-1-alxndr@bu.edu>
 <CAFEAcA-QOqGWzeeQLLK2pH0WwABzXP2ZjFKxLY7d62bWhGRWxw@mail.gmail.com>
 <20220621155306.2mvr22dd5xuc6pqm@mozz.bu.edu>
 <Ys1AOOWLZRBxYNbC@stefanha-x1.localdomain>
 <20221020220928.7gxd33eszrv7que5@mozz.bu.edu> <Y1bdgdWXG2FYHm/K@fedora>
In-Reply-To: <Y1bdgdWXG2FYHm/K@fedora>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 11:11:27 +0100
Message-ID: <CAFEAcA9AUpK6d81hZQG7Ba06w5xTdXkgMaMu+nDKrVh8QwabhQ@mail.gmail.com>
Subject: Re: [PATCH v2] memory: prevent dma-reentracy issues
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Mauro Matteo Cascella <mcascell@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, 
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 at 19:46, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Thu, Oct 20, 2022 at 06:11:06PM -0400, Alexander Bulekov wrote:
> > Taking a stab at this. Here is the list of DMA APIs that appear to need
> > changes:
> > dma_memory_valid (1 usage)
> > dma_memory_rw (~5 uses)
> > dma_memory_read (~92 uses)
> > dma_memory_write (~71 uses)
> > dma_memory_set (~4 uses)
> > dma_memory_map (~18 uses)
> > dma_memory_unmap (~21 uses)
> > {ld,st}_{le,be}_{uw,l,q}_dma (~10 uses)
> > ldub_dma (does not appear to be used anywhere)
> > stb_dma (1 usage)
> > dma_buf_read (~18 uses)
> > dma_buf_write (~7 uses)
> >
> > These appear to be internal to the DMA API and probably don't need to be
> > changed:
> > dma_memory_read_relaxed (does not appear to be used anywhere)
> > dma_memory_write_relaxed (does not appear to be used anywhere)
> > dma_memory_rw_relaxed
> >
> > I don't think the sglist APIs need to be changed since we can get
> > DeviceState from the QEMUSGList.
> >
> > Does this look more-or-less right?
>
> That's along the lines of what I would expect. Interesting that
> map/unmap is also on the list; it makes sense when considering bounce
> buffers.

Not all devices that DMA do it via the dma_memory_* wrappers, of course:
some just use address_space_* functions directly. I guess maybe
we can just make the devices where we care about this problem
be more consistent about what function family they use.

-- PMM

