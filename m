Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88274C9A46
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 02:10:46 +0100 (CET)
Received: from localhost ([::1]:56266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPDVt-0005pP-AW
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 20:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>)
 id 1nPDTN-0004qr-U1; Tue, 01 Mar 2022 20:08:09 -0500
Received: from [2a00:1450:4864:20::531] (port=39846
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>)
 id 1nPDTL-0003Py-KS; Tue, 01 Mar 2022 20:08:09 -0500
Received: by mail-ed1-x531.google.com with SMTP id g20so178426edw.6;
 Tue, 01 Mar 2022 17:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k33shDE0BkPTxMfWJ2qk+GhZxHWflVkUE5/xT7BcFfg=;
 b=VNBHhJsJtNjuprgAOe1bfv95cWPdkFtwIvelRoxzge7cVGEVG7+cfsyqe8TjDWvv/b
 FLj+Y/CFEGv4GLQEg3+ZTB6mv+l2PNIKxcljjDvUmqHwLwBUVNLn9A0xSV4GpEZos+Pn
 0+H9hsivIhU67gItU3eF4HqooXnH6xtSNmE6aE1CieKzjOZ0oAVHWYGlzGpaHKyPT6uQ
 jHCeM942wd/wZlwMJEyFWVvOvCssdoFOEbzm9NJ/0ECKJaB+9/Ju5IXFDVvmN6pyJCK2
 TPvxp/uB1Uh7duQ7Ppk6BxfI5IXsIdWgjUrwlHcUsADH2TXi57oQH1Fyw6mjYLWuebsK
 LmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k33shDE0BkPTxMfWJ2qk+GhZxHWflVkUE5/xT7BcFfg=;
 b=FknpYEwmAQYX58rt2MqlkSDZfdcr5qT9QmD9P3al7rQE9miTQh/Gr0MHkWoyHyUTsj
 JnsR/kfqU5RJ+VH10Zq6W4sA7KHxN3Fn8qX0DO/CZsNQ0ZMptuSbnYi2k1OxaBLz8Pmy
 myUHvUZGwJWSQqmXfxvxoidY0fTVBQ/KtXxzFffrRByegmrmR59SQ6UWp6wN18DQo1nj
 9G9pJLF/1RPDC9oMNjXk/4wMPMUvjKiahZl/Ezi8pVTPM7L+Q3wKcdOx0OZsx7YGRgtV
 QvW40g2GJGXF+XFG2bWyx8InL49CuPJGDi5qHTWzBLAL3x0HKQftCtQuBG/HVGVXFu84
 6z/Q==
X-Gm-Message-State: AOAM530RWQwJj1CgpG+qXPU74IPVEsF3iFdJih6cf59xk1Ltr/95R+I8
 e+v8Odwrlf5jNq+k/9jbfNkeXZcs1IMlbDpF6Tw=
X-Google-Smtp-Source: ABdhPJzDRj6AIFfByykVcFtQIvbwBVRCBHw/v/Ung6C9XWD9DkZ0qhIJSvseKU4XuxFhdQOOuqScsALZiM2iF6xWpqQ=
X-Received: by 2002:a50:fb91:0:b0:408:5100:b4a7 with SMTP id
 e17-20020a50fb91000000b004085100b4a7mr26722583edq.311.1646183284488; Tue, 01
 Mar 2022 17:08:04 -0800 (PST)
MIME-Version: 1.0
References: <164603074537.20094.1732342403585879912-0@git.sr.ht>
 <CAFEAcA8hWy3rfGtYkyQjJSGgsX448_t01xmM4cwyCO0op4h1xw@mail.gmail.com>
 <2da2f0bc-6c54-0a26-aafb-1f866cf93de8@gmail.com>
In-Reply-To: <2da2f0bc-6c54-0a26-aafb-1f866cf93de8@gmail.com>
From: Yan-Jie Wang <ubzeme@gmail.com>
Date: Wed, 2 Mar 2022 09:07:28 +0800
Message-ID: <CADyX+6p2QY5EL_JJnWUzVezagBfb1Pv9Byx6YXJK8jT7vNHvnA@mail.gmail.com>
Subject: Re: [PATCH qemu 0/7] Many improvements to HVF memory-related codes
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=ubzeme@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, I made a mistake.
The last line in the function, hvf_find_free_slot, introduced in this
commit "hvf: simplify data structures and codes of memory related
functions" should be "return NULL;"

static hvf_slot *hvf_find_free_slot(void)
{
    hvf_slot *slot;
    int x;
    for (x = 0; x < HVF_NUM_SLOTS; x++) {
        slot = &memslots[x];
        if (!slot->size) {
            return slot;
        }
    }

    return NULL;   // <---- This line is changed
}

I will submit a new version of the patch series after I go home.

