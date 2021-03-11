Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B353373B0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:23:35 +0100 (CET)
Received: from localhost ([::1]:45968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKLHq-0003Vt-7O
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLH4-0002pM-P9
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:22:46 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:36144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKLH3-0002Eb-B0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:22:46 -0500
Received: by mail-ej1-x62f.google.com with SMTP id e19so46238365ejt.3
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g2qf1auwqgFAwhWsO5uoVF1AymNgQO/Vvu396aZ6C5o=;
 b=B7Qf/OMOxKxsUZuBx67RCbGUJVauPVRNE1NWxV8qP1iqHyuDppnHErkCJZaOX1nE5k
 PnqdoKmwuUgxA3HWuU++QpcqEG28dqOIpoCPopKRDE7Ozc6jn6ez8MAkPGZChf6dlf1R
 YYCPUrhAbxeNoLq0sqjaOoUHMZmx8Xfk7tEqq6dYLjdKG2p47AoLnasHmeno/PeUSsHm
 Xp26I1vaP5JHIg1dpJxy6u6mMHM0aSHtts89Gib/BGkoD11xSPgOEt4j8x9rd30lf16Z
 3lpxshiKAbh6Op854l61ybjQu9ogkfENlOjrfiwl/UmKTaUWcQxJbIHVsdFLriK1TUpc
 Z8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g2qf1auwqgFAwhWsO5uoVF1AymNgQO/Vvu396aZ6C5o=;
 b=N5EGWGn74Ba6Bo2r3UBvApnEAu7raFNotG1ll06H1pq7qihYj+zKETVA2Z4xBxRUrx
 HD/3cyr5yNcGwN9Q1rc12Qf9PlF8PfB6wKk/aG89opNQt5dVThMpMFfn4K5sKzOfx91s
 jSkaeSphMD0ycQ4rQTkwUfptqwhBbCZJ/mnp9Hy10h7taAv2e4F7IlCU+DYcHwkV9aWs
 KBaobfPcYSrmOVU8+ZRD1qm31aeIieqyTzC5VBQHxQsiQY+PLeEfk0vefhceaxPLkVRi
 AJuqejm0i31WS9vhpADXGWECtvdExTJWbmQnzUyxBMZSoa4MPKsHXA40Qh/BaywUe1qo
 F6Eg==
X-Gm-Message-State: AOAM532Vz8P6XCOQeUXeOF3MQwS8OP44Q+jNXxLi3ajnNGDzm+AmLgeL
 lRKu2n/HaPrkjtoUq21q2NLM332eMXgX3p8GAzAK4w==
X-Google-Smtp-Source: ABdhPJxV5DoADqkpPYE9q3j5Ws4MLr1KwOpb4Ut3loz43Bi9u9CM1bHmQRTp0ixkFr+Gz+LbGgXXhp0h9sMu5FWPfcQ=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr3005666ejz.382.1615468963868; 
 Thu, 11 Mar 2021 05:22:43 -0800 (PST)
MIME-Version: 1.0
References: <20210309102742.30442-1-eric.auger@redhat.com>
In-Reply-To: <20210309102742.30442-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:22:25 +0000
Message-ID: <CAFEAcA-jKEGi_EUo2OH1uJWz7cAGP=uyfMjcOAAiB6XWaPEkrg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Some vIOMMU fixes
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 vivek.gautam@arm.com, qemu-arm <qemu-arm@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 10:28, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi,
>
> Here is a set of vIOMMU fixes:
>
> SMMUv3:
> - top SID computation overflow when handling SMMU_CMD_CFGI_ALL
> - internal IOTLB handling (changes related to range invalidation)
>   - smmu_iotlb_inv_iova with asid = -1
>   - non power of 2 invalidation range handling.
>
> VIRTIO-IOMMU:
>   - non power of 2 invalidation range handling.




Applied to target-arm.next, thanks.

-- PMM

