Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4741736590F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:39:38 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpfF-00077c-AU
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpdl-0005a1-5G
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:38:05 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYpdh-00078D-3J
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:38:04 -0400
Received: by mail-ej1-x62c.google.com with SMTP id r20so8265356ejo.11
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 05:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4QLJ/taxcevY56Ez95Fms1Q2DF1IqZzpUnk4oTbP87M=;
 b=P4Utweq2mRVynJF9qUoygoIZX/rIa53RZdKo9xHmE7vggkNi0uiMdU9ysUd27av1F7
 Q68CTPYPRouTtjSVlHj4grIlf4PUNSuQocMgbGcJAfA1HREfcPbZXTAnc2ErrEO+5s2m
 t+80fMQCcz2bJ5XfrZ5/Wxjbkpx3ei5WCzGSNVA7Fx+yS/AP5HiABqD1SZbkbZz5d8jh
 S4B/JVD5pl+h3dZJLqgfpIQv+nQsAxud4CO3bhKmjPjv2NqPkm6d2+ofEeWo5Y91JPjo
 CSWPKondPVS4SwY2VbonHlbHN9u/B9+HTH9xiyLC5YXimptESnOUjX3fZXDwAtQIBZNp
 o/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4QLJ/taxcevY56Ez95Fms1Q2DF1IqZzpUnk4oTbP87M=;
 b=dDlwYzCpaq8QEumOMOfdRITbvlMvCvw7UGNDvlih9kMhKaKljc16+qhpepwMTkpSxy
 QQCU024k7C9ewDPZ+KRKhLGUnrX5tRJSd5nQOQAh3Vg/Tx6fZZr80wzP/Weh7i0eTFdi
 cm6WpJCPRnf8G2W0y3JzWQLfuHi8DRNgSWzfctGhl8V6DMHaWphYNT0JOkdXO9RiqC6I
 fXy2D8b2IKZtdOtxuWq7N/lwtAtVK2/DytDLYe3yUd0HaF9tarFhg4BMbxIoJd6shmS7
 UimxeTSkIwQFJTqgc2J20h/QVpFHyqCsuB5viYJbIdbuOoLlL/U6qLkz9JUo9UruNnIT
 vqUg==
X-Gm-Message-State: AOAM531rye9YDdE7s96YdgVempzuDB1R38mIltWy596qSDio/WAdhVNO
 cIgwZ3ax731uzQ3SKleWAN9G9tQW6xzYaydpjoSgHA==
X-Google-Smtp-Source: ABdhPJwMVeJZFyexyOhfaI3XzlXC5iRo5Qh1FE5PXfWyg0EN/8EWhLl6MoLJhpaYwYCeZAEvnTxUL36PagncEoeYHu8=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr28127513eje.250.1618922279627; 
 Tue, 20 Apr 2021 05:37:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210331111900.118274-1-cohuck@redhat.com>
In-Reply-To: <20210331111900.118274-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Apr 2021 13:37:07 +0100
Message-ID: <CAFEAcA-Zt8U4mQmgjHiNDMUiH3tkVRKEtD-acW0rze1WYnmzKg@mail.gmail.com>
Subject: Re: [PATCH for-6.1] hw: add compat machines for 6.1
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 31 Mar 2021 at 12:19, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Add 6.1 machine types for arm/i440fx/q35/s390x/spapr.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  7 ++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 69 insertions(+), 6 deletions(-)

I have a pending patch for arm for 6.1 which will need to update
hw_compat_6_0[]. Does anybody mind if I take this patch via
target-arm.next, or do you already have it queued for s390?
(If so I'll just wait for it to hit master: the pending patch
I have is not urgent.)

thanks
-- PMM

