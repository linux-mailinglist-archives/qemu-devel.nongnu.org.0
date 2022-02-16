Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 024B84B900B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:19:13 +0100 (CET)
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOtU-0008LV-2j
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKORj-0007hC-KS
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:50:31 -0500
Received: from [2a00:1450:4864:20::42d] (port=42970
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nKORh-0002Ys-Ix
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:50:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h6so4732745wrb.9
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9+ntbNNi3DTGoJYbqPoXHLTHMxRXJp9W4fi+jSO4yc=;
 b=hf3UT32feMiXMTUIvkSUYRt6CSYUxSiXHJ4oSCZpDFH/nhjcdrQl8U2Nid+t9nEY1l
 dj9hQDUN9JkrCp+qkynnJCEIqTQMWeVAr7kDK/yz7zpcJ51PvRlnIg+EGlP575IYhCsw
 fpLzgu2HS+9DhfqGfwoEjP18+PMMlAyPFbXpslk4x7N2TxlD/lBvWTzcGDgjq+VyaX6B
 h4M3qeJn7+DUgM3ca0/2kqE/ufjejRkLCa9dvjXeAsuh7q+zk2cRtFovaZNa5+pA9jP4
 P+cFDaEKwrHH3xRnv09nfAmIexNB8mDv7z+JFlaSJJ+BXN9gJXXHVdSBS7Ia6sbX+o2y
 1/Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9+ntbNNi3DTGoJYbqPoXHLTHMxRXJp9W4fi+jSO4yc=;
 b=TmQkZVhq+NqP7QfyP5bPqEUoGyhuP5pD/6dVwOug1l4JQSoUCGoAHRUV3idHPenwrS
 VBM0V2NYdnyT3bhgNPjmwUssdZYXO835TQfdGSVIzvDSU9NzKMQNRxnfWSTQaen71Q4Y
 Y6QUbWb7jKQ1rSNAwtVN1jQhLBqkxA2C1/Rn2TrDVkGEl/gyHqJIkQ6cRc5qBTbWPAwQ
 aIQJS/+H4u5XOhEbqRFYN7vn3S8Pd/L1+O/k1+4y4rGkK3D8B1YpZCQIMl7DpgzNxIm+
 Iag11dKczQWwGcbofdRN9wCcKMquVypTruNEi9XqH13lc/Y5kmiGRmpdy4bzm1BPcdnT
 cbEA==
X-Gm-Message-State: AOAM53132tiUccz3192fYPLC6n4Kg/ayfWb4kkwAHjMOj+ZChQI56fei
 R4/ovSmCixDI6myENWXu4TfT/4bwilBpRNW2kJzNuQ==
X-Google-Smtp-Source: ABdhPJxVuNg7ZZpCZrW1TzeB6SsFBLWYTlmkGk9CuI0whOyJfy/JupxlirLnOEZaKzow8SaRwX0aH7GnDbUNUX1Z/kQ=
X-Received: by 2002:adf:816e:0:b0:1e4:ad2b:cb24 with SMTP id
 101-20020adf816e000000b001e4ad2bcb24mr3224961wrm.521.1645033816390; Wed, 16
 Feb 2022 09:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-16-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Feb 2022 17:50:05 +0000
Message-ID: <CAFEAcA_tJHVbhpT5fRQyhUmYGE1fOn9uuemd5v+BH0XObr-02A@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] target/arm: Implement FEAT_LPA2
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This feature widens physical addresses (and intermediate physical
> addresses for 2-stage translation) from 48 to 52 bits, when using
> 4k or 16k pages.
>
> This introduces the DS bit to TCR_ELx, which is RES0 unless the
> page size is enabled and supports LPA2, resulting in the effective
> value of DS for a given table walk.  The DS bit changes the format
> of the page table descriptor slightly, moving the PS field out to
> TCR so that all pages have the same sharability and repurposing
> those bits of the page table descriptor for the highest bits of
> the output address.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

