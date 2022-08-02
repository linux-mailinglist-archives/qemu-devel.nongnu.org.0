Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC87B587DEE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 16:10:57 +0200 (CEST)
Received: from localhost ([::1]:39076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIsbo-0007jY-GJ
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 10:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIsaP-0006Mv-1Y
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:09:29 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIsaN-0004wU-GN
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 10:09:28 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-3238de26fb1so123309487b3.8
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2vbuXvr4sj4WC8CP7UZeubgyDnSl6NMrFIT8AD5GF8c=;
 b=NqtPXjx3hCqmX80rkIn85FaozgP8cQWoj8H/zoPKD6pgiPwfTdK/cdx65L6MFBLkLv
 o0YIhEe4jVsqDVPXvjWYOoSKNloKhYejtl7FPUU+msiQ88HVOOOyo3aEhPsHdeBGyEP+
 a1Rqj6umaEQiwqcZ5bAqcvDRBOYipagTdXqPPUKTXXeJ8bUol1eU7vHNAECBSDvr+9g+
 QRaWFQyvTHdYwl5gvZ9rPUXvSpLIyK0GIGTmn7BZQJD3vHUUIQXX05RrRv7VLaEXGCNA
 S+FAR7ZY17+m3YmJvxeSbhDRh6v5hot6CXPB1w/VvOc2/UHbc556H3txmj2vG1R+xR50
 JClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2vbuXvr4sj4WC8CP7UZeubgyDnSl6NMrFIT8AD5GF8c=;
 b=tml/JjadVmkMMWHc52ix2jkdYuYVz5Ko0+SsashCLeZpyELyvYBsimszD13pbSw4LF
 EvPnfkXRKTpU5/ooV+WEatVreuPrro78sTGxYSOClEoYAI3dLmB1TmCx25itJRWAzYig
 pYjoB4rw++o7+Pjc3CGJHV+811inFrJ85+xjAyyGNOob05ifaY7Slov0S+MMWz+W46Fj
 pKIudooAGoD/LvtCttQwiYA01VgWUZ8cUuVH8O3DId7RQ1CxbE7yvU7nCk7/MLLVBSez
 QFB1+IGgKiju0Tf/o5FH+pgswjMjm6/emA0QcgLZRfsM/EXxKbgM+c5aH8w4Y1h/u+Uy
 QbOA==
X-Gm-Message-State: ACgBeo3wiReUsx27zfG1Hud3VqBJHSifi3JsRE0kQymIvwstZ8/BvjSc
 xGQJjZFVbasVN1hAC5Q/XFQmjZnsp9HijLhxcwLs0A==
X-Google-Smtp-Source: AA6agR4SaNerPMMsobUkq/7dD9wdZfDvrjVtH9S478mLOjPwOvXcmMaTWDZ/NttQRyc78zluvMMuVJnMSqpnxKsLors=
X-Received: by 2002:a81:7bd6:0:b0:328:297a:f31f with SMTP id
 w205-20020a817bd6000000b00328297af31fmr133961ywc.469.1659449365970; Tue, 02
 Aug 2022 07:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220802134834.454749-1-thuth@redhat.com>
In-Reply-To: <20220802134834.454749-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Aug 2022 15:09:14 +0100
Message-ID: <CAFEAcA_oZni8G7LeciOywasY2rcEnpo=v01xCaaCTBp5_pDTLQ@mail.gmail.com>
Subject: Re: [PATCH] hw/usb/hcd-xhci: Fix endless loop in case the DMA access
 fails (CVE-2020-14394)
To: Thomas Huth <thuth@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org,
 mcascell@redhat.com, f4bug@amsat.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 Aug 2022 at 14:53, Thomas Huth <thuth@redhat.com> wrote:
>
> The XHCI code could enter an endless loop in case the guest points
> QEMU to fetch TRBs from invalid memory areas. Fix it by properly
> checking the return value of dma_memory_read().

It certainly makes sense to check the return value from
dma_memory_read(), but how can we end up in an infinite loop
if it fails? Either:

(1) there is some combination of data values which allow an
infinite loop, so we can hit those if the DMA access fails and
we use bogus uninitialized data. But then the guest could
maliciously pass us those bad values and create an infinite
loop without a failing DMA access, ie commit 05f43d44e4b
missed a case. If so we need to fix that!

Or (2) there isn't actually an infinite loop possible here,
and we're just tidying up a case which is C undefined
behaviour but in practice unlikely to have effects any
worse than the guest could provoke anyway (ie running up
to the TRB_LINK_LIMIT and stopping). In this case the
commit message here is a bit misleading.

thanks
-- PMM

