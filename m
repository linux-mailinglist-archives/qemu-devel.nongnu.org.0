Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 514B55FAFC7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 11:57:20 +0200 (CEST)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiC0k-0002rO-RB
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 05:57:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiBs7-0006Nx-Gp
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:48:24 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:37860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oiBs4-0003UB-QS
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 05:48:22 -0400
Received: by mail-pf1-x432.google.com with SMTP id 3so11490320pfw.4
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 02:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OzApLwxIYuEtnBDrd0GiQ2Z/nulp+/dYzIs6PEq4pUE=;
 b=D3ZzYlPZ112n+0eBJn7XFXREfMH2CIa0l4WQewkRNQK3RENuIbbdivEsnG+ynOCRPs
 9FnMSIOXg3CF6Ud6sAjIylKWlnIn0L83VDLKnaxWCwsm8Uun1uWxeaZkINxoYanNyaib
 PEUYfUqZcUMoMMDbO56rOs/Ye56in3nFLQ2XJBH/f8GxQox76x0mapx9+NBnjTDtt32O
 OnswdJ4QCwWH2C1zbpFwROWr9AjDTh5gyBglHRrodL9emU9sbWmww+wAHfFztFbZFZKr
 l/SUUEuYb/0c7Si1QFXHPI3VFPxFaDaqjo1X1i3T8ZhEVSc5w+ZrHoTi4/UPWStMEB/b
 5gXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OzApLwxIYuEtnBDrd0GiQ2Z/nulp+/dYzIs6PEq4pUE=;
 b=GG26GfwEg5vt6m1Gcz7uRtEPvd6IaXQkk80KywtiG7GIV25+1AlcdbrTJbRJxJnbZa
 vYscTXx7Gq9u02gyoGdwSSpM9ycTqJhD0uLQUUG3sz4WLmAiFhkD89jZ/q7hCtbuCt4G
 HdPCHDBOEymqJdJWAKw8yXCMgxyEu9D3UzBp/fbUb9qsr10d3bdSxCjA4qfR//v1y1la
 wXkM+XTOIv/UX8ZfctdxAZahzTPvXwebGW6TEbJfwoTTskszvqhlGLQbjaa1ebuPb7fW
 B8/O0UP1AEpBPWyozC1bz1ruOMqLHkpJVQR8lHteGXwsudqYTNudLKiNto2ip+ybghmC
 l+0g==
X-Gm-Message-State: ACrzQf13DAhaF1Vw5sD7NbNhyEwMSgiT7ZfDXTSyOPjOmwGDvDb1uNMS
 HsHGUprZRDlL1QvTZ+CYPkdIr5aXGqMoLHlnv0BjKw==
X-Google-Smtp-Source: AMsMyM7KMEI5Tabse6Iws4nW+Os0RZ03aFqkiPQZx/oXEFUibmUqNHcnjzP3PxGiaKYa7RhWC7fpuyKsCsZ6Gw7g6v0=
X-Received: by 2002:a63:9043:0:b0:458:6003:30ee with SMTP id
 a64-20020a639043000000b00458600330eemr20999795pge.231.1665481698189; Tue, 11
 Oct 2022 02:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221010222944.3923556-1-ira.weiny@intel.com>
 <20221010222944.3923556-2-ira.weiny@intel.com>
In-Reply-To: <20221010222944.3923556-2-ira.weiny@intel.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2022 10:48:06 +0100
Message-ID: <CAFEAcA9yVKWCZ-PhCbHqpaEW7Tgtqoo=wSQLy6=U5yfq2uVfPA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] qemu/bswap: Add const_le64()
To: ira.weiny@intel.com
Cc: Michael Tsirkin <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org, 
 linux-cxl@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x432.google.com
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

On Mon, 10 Oct 2022 at 23:48, <ira.weiny@intel.com> wrote:
>
> From: Ira Weiny <ira.weiny@intel.com>
>
> Gcc requires constant versions of cpu_to_le* calls.
>
> Add a 64 bit version.
>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> ---
>  include/qemu/bswap.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index 346d05f2aab3..08e607821102 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -192,10 +192,20 @@ CPU_CONVERT(le, 64, uint64_t)
>       (((_x) & 0x0000ff00U) <<  8) |              \
>       (((_x) & 0x00ff0000U) >>  8) |              \
>       (((_x) & 0xff000000U) >> 24))
> +# define const_le64(_x)                          \
> +    ((((_x) & 0x00000000000000ffU) << 56) |      \
> +     (((_x) & 0x000000000000ff00U) << 40) |      \
> +     (((_x) & 0x0000000000ff0000U) << 24) |      \
> +     (((_x) & 0x00000000ff000000U) <<  8) |      \
> +     (((_x) & 0x000000ff00000000U) >>  8) |      \
> +     (((_x) & 0x0000ff0000000000U) >> 24) |      \
> +     (((_x) & 0x00ff000000000000U) >> 40) |      \
> +     (((_x) & 0xff00000000000000U) >> 56))

Can you add this in the right place, ie above the const_le32()
definition, please ?

>  # define const_le16(_x)                          \
>      ((((_x) & 0x00ff) << 8) |                    \
>       (((_x) & 0xff00) >> 8))
>  #else
> +# define const_le64(_x) (_x)
>  # define const_le32(_x) (_x)
>  # define const_le16(_x) (_x)
>  #endif

This is kind of a weird API, because:
 * it only exists for little-endian, not big-endian
 * we use it in exactly two files (linux-user/elfload.c and
   hw/input/virtio-input-hid.c)

which leaves me wondering if there's a better way of doing
it that I'm missing. But maybe it's just that we never filled
out the missing bits of the API surface because we haven't
needed them yet. Richard ?

thanks
-- PMM

