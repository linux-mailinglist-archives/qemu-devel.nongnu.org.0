Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A41F4DDA18
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:03:15 +0100 (CET)
Received: from localhost ([::1]:39906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCGA-0006kr-1H
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:03:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCBp-00043d-4F
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:58:45 -0400
Received: from [2607:f8b0:4864:20::b35] (port=41876
 helo=mail-yb1-xb35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCBn-0006Yk-EW
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 08:58:44 -0400
Received: by mail-yb1-xb35.google.com with SMTP id l2so15670872ybe.8
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7QawA1ImlUW330VZHgGvPXYjO9EHk1xkcOo8ZQLyOXY=;
 b=T02FF4vg7jNlBRYAiLWplJFL81ztF4HslxVNj+Nhk81i+ItvSaboj3ZZ+kg7Ni6zMq
 lvT5Z73Dw8LSJzVHDREUce3HMuRRBl5mVNVQLWOVV54zMReDtS8r38d7ehwF7puMEOen
 X0876HQmrIymr8akT0PDMMP5geFPW2ly2utV6psRo/EOxM7t5/PN6jiHuMef7vCSZflJ
 jWlUD8mLQSexghFfWVWAZlkH/l/6n4+bzjm+oHBXtAU6EsRtGg86XosCDIV9ydDzUylk
 mzKoKq4ZltDlClf3qQ9VSe57rNpwDSd5NxyR7tbGXPA4B6vsThoJGkn3BVWyMdfN6s9Q
 +o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7QawA1ImlUW330VZHgGvPXYjO9EHk1xkcOo8ZQLyOXY=;
 b=K+8jnnHecFI9lhwlKBRQp1+yN4nfmX7vNk1rrUDQ2DvgBZm3g8ZWrQq20x37rvAjw0
 BZ6uNcYAyzTbtPjWZPtQ+vYoM0K3/C2mXb2+E/j4nEPhs7CGdJh2Mk1Pu8iTGZLIQ0JX
 3V8XMDxMc7WElRmnNKp2HIcNxQRQe7qLD2gUMsZn56C0C8jkROumEqJuFDm4zfetZhhX
 EF83dy4bhQ2z05uGUeENthCCCPxII+GhNNLTShoFz0Fq513BtPh3W5VIWwCJDbtcWtZ1
 NoNc4aQTb8ast9x2ycH0Hh8i13nHQwJl4adClLvaIHmxMKoHRUz+Pd6ETsSWyADY+kV1
 PO+A==
X-Gm-Message-State: AOAM5327iGHkHtszcaSYfZXCmQaA0dKokQtixNeL94AD1fpnbM1/VpbO
 Zjfz7l+4zFacAmRMjNEQKs6ALRLCTShZD50vYy7VQw==
X-Google-Smtp-Source: ABdhPJzyz2eD2mQ3BJs87hQR2RMFsqkGwHz8xBPX2pNDD6sw/9Sc1Qiu3W4NJu0/NtfxkwhVNU1CA07WRwDN/SOy0C8=
X-Received: by 2002:a25:bf8b:0:b0:633:8a66:c4cd with SMTP id
 l11-20020a25bf8b000000b006338a66c4cdmr9852318ybk.85.1647608321991; Fri, 18
 Mar 2022 05:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220302130417.18551-1-ubzeme@gmail.com>
 <20220302130417.18551-8-ubzeme@gmail.com>
In-Reply-To: <20220302130417.18551-8-ubzeme@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Mar 2022 12:58:30 +0000
Message-ID: <CAFEAcA9HBwe0g2OTXgdqxSE+ecW55YLuSrKeL3DWs_tLLRY08w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] hvf: use GTree to store memory slots instead of
 fixed-size array
To: Yan-Jie Wang <ubzeme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 13:04, Yan-Jie Wang <ubzeme@gmail.com> wrote:
>
> Currently, there are only 32 memory slots in the fixed size array.
> It is not scalable. Instead of using fixed size array, use GTree
> (from glib library) and dynamically-allocated structures to store
> memory slots.
>
> Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
> ---
>  accel/hvf/hvf-mem.c | 63 +++++++++++++++++++++++----------------------
>  1 file changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
> index 081029ba98..2f70ceb307 100644
> --- a/accel/hvf/hvf-mem.c
> +++ b/accel/hvf/hvf-mem.c
> @@ -28,8 +28,6 @@
>
>  /* Memory slots */
>
> -#define HVF_NUM_SLOTS 32
> -
>  /* HVFSlot flags */
>  #define HVF_SLOT_LOG (1 << 0)
>  #define HVF_SLOT_READONLY (1 << 1)
> @@ -42,35 +40,24 @@ typedef struct HVFSlot {
>      MemoryRegion *region;
>  } HVFSlot;
>
> -static HVFSlot memslots[HVF_NUM_SLOTS];
> +static GTree *memslots;
>  static QemuMutex memlock;
>
>  static HVFSlot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
>  {
> -    HVFSlot *slot;
> -    int x;
> -    for (x = 0; x < HVF_NUM_SLOTS; ++x) {
> -        slot = &memslots[x];
> -        if (slot->size && start < (slot->start + slot->size) &&
> -            (start + size) > slot->start) {
> -            return slot;
> -        }
> -    }
> -    return NULL;
> +    HVFSlot key = {.start = start, .size = 1};

Doesn't using a size of 1 mean that this function no longer
finds an overlapping slot which starts somewhere above
our 'start' address ?

> +    return g_tree_lookup(memslots, &key);
>  }
>

-- PMM

