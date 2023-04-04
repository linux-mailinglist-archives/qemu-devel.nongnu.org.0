Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 797B06D6B0E
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 20:01:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjkxB-0007vx-9Z; Tue, 04 Apr 2023 14:00:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkx8-0007vR-QL
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:00:18 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjkx7-0004MT-4V
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 14:00:18 -0400
Received: by mail-ed1-x52b.google.com with SMTP id er13so93006264edb.9
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 11:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680631215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tGOz5RYNcGRn1zJgP8755l8easHjXKXM4/CcImWfJes=;
 b=niJAH6bjlPYAEWgQpyjr1vwPsWNg16V32YBhHtIwGD9QtQRqJ5TrStZYGspL4dArap
 ixjgGVPd94Q4NGiqd0vE0jaQbX3Hw7DeMdOrXs4D9o88P6czb/UIJTrgh7a4jFNGw/c/
 EsrGjRPY3vN3F+HpUG7Uju6Bw2xDMqHvWxjnooQNDg0kHNDAixsI7T/gS8+MgzrOCEYf
 4MINmPivLrlKEz2f7hrsTCzc2uNWsaaNzDwao72gbGyqKHO2wKfjkGWmc8FrdeYUCB7H
 BNLTAqx/FBahOVdjQMMSJILsk6cybTYyVrzS/0YIigEIYXfnFNd/yCO0FaY2hWM3dXNM
 q35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680631215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tGOz5RYNcGRn1zJgP8755l8easHjXKXM4/CcImWfJes=;
 b=dKx+YAjG9VloXDgvQyDsUgmlyegE+qAA/1HuT2QAfX5Qa14HidprSd55H1va4uVGgb
 yMOk/qux9b0f12jAYWyJ9ChFqinxd973xerbZh0NbW7qNUY7kHvptj8SadPMRUinRqrT
 aWjEleBJI9KgkixJQFzBWk52JMQepeekkJNB81gzRnRYjn4vPUCrubfkvuXXzigyi9uq
 sM2LaUXuD9lWxtZcNpbjS1N7hDhe7rnVqYLhDl5EBCatgWaGJYz4K0wIJZbzdqSosmn+
 pTkZwieOAm8/0ysBonDoN8aeGto1H8aCWiDDYCSm22xq+RhZE73TLXYiOFi5UpyyMtUC
 47tQ==
X-Gm-Message-State: AAQBX9fMqUyw0qGBknA2eubk6tVAqOqBUA4+N696p0bDzfs7Y9/uq2oa
 Bd4FEWeJabXcXpGYGjdBOYtAklk0qgPPwepuCJaVUQ==
X-Google-Smtp-Source: AKy350ZTvw7yQzU9eqPBGVqlQTHSWO8/iddSoBp0+Jgp1cHJB5S942umIefofXtv9M3YwE3W8+WC1GjsFNjSaXJwg00=
X-Received: by 2002:a17:906:3e0d:b0:92f:cbfe:1635 with SMTP id
 k13-20020a1709063e0d00b0092fcbfe1635mr230023eji.6.1680631215393; Tue, 04 Apr
 2023 11:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-37-mst@redhat.com>
In-Reply-To: <20230302082343.560446-37-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 19:00:04 +0100
Message-ID: <CAFEAcA8D+Yy-G1WUY-aPLvk2b1Bh46sheF8msUMQa2Cgt+mfdQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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

On Thu, 2 Mar 2023 at 08:26, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Zhenzhong Duan <zhenzhong.duan@intel.com>
>
> On x86, there are two notifiers registered due to vtd-ir memory region
> splitting the whole address space. During replay of the address space
> for each notifier, the whole address space is scanned which is
> unnecessory.
>
> We only need to scan the space belong to notifier montiored space.
>
> Assert when notifier is used to monitor beyond iommu memory region's
> address space.

Hi. This patch seems to have regressed the mps3-an547 board,
which now asserts on startup:

$ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
-kernel /tmp/an547-mwe/build/test.elf
qemu-system-arm: ../../softmmu/memory.c:1903:
memory_region_register_iommu_notifier: Assertion `n->end <=
memory_region_size(mr)' failed.
Aborted (core dumped)

(reported under https://gitlab.com/qemu-project/qemu/-/issues/1488)

Since this commit says it's just an optimization, for the 8.0
release can we simply revert it without breaking anything?

> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9d64efca26..da7d846619 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1900,6 +1900,7 @@ int memory_region_register_iommu_notifier(MemoryRegion *mr,
>      iommu_mr = IOMMU_MEMORY_REGION(mr);
>      assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
>      assert(n->start <= n->end);
> +    assert(n->end <= memory_region_size(mr));

In the mps3-an547 case we assert here because n->end is -1.
This is because tcg_register_iommu_notifier() registers an iommu
notifier that covers the entire address space:

        iommu_notifier_init(&notifier->n,
                            tcg_iommu_unmap_notify,
                            IOMMU_NOTIFIER_UNMAP,
                            0,
                            HWADDR_MAX,
                            iommu_idx);
        memory_region_register_iommu_notifier(notifier->mr, &notifier->n,
                                              &error_fatal);

thanks
-- PMM

