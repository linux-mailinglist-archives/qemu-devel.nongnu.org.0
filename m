Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938283FE758
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 03:59:04 +0200 (CEST)
Received: from localhost ([::1]:35102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLc0N-0004qv-2F
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 21:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLbyo-00042g-3c; Wed, 01 Sep 2021 21:57:26 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:40759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mLbyk-0001ir-Ko; Wed, 01 Sep 2021 21:57:25 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id e131so721117ybb.7;
 Wed, 01 Sep 2021 18:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EbtjFN4gv1w6ZgdQDO6KZx7S9An6Ks09QmSFiTrZqzs=;
 b=eI0QhdlKqfXjhb07ZXA3erDdHJS3eoae9KWmbdbrw8bMqsaW2C5nUKIYJSW0iKA45z
 HxtGQNZWFVu0+BLmiKC0lFjFWaE6pjoeyVR48ZnkyKrFuHqV7KHs9wXlHOslw6IiJviY
 mjpVRpZtw05/qN3PO0TEZbYGwx1NrpxFmxS2ZvycngqEG4BE15GiwVuNyxVeIw/kCvln
 LHRb01VUcp5PvSRibY6M50OmmhM7YCLsPFD4yQaGdPsHOHepTZm/uz90fT3Hntn9wO0+
 jB/3ePBcJY9fOjWO0B83Xo+Ib4/bERrFqfDI6fm92Eb30GHjeRkJjN8t/fzcg2x8nH7m
 PpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EbtjFN4gv1w6ZgdQDO6KZx7S9An6Ks09QmSFiTrZqzs=;
 b=T6Sv6zi35xmxBBmLazjskB/TXhAxRSthrufJ9Man0Ng6rgwUfCfeD/FB+i9vr931Lk
 2tU6Klt3RN0h9D2nvz73r1f4hQ1kdDXPo6koolVl7+ZxDQO+XtX+0VpVf6Zt7teAXMoH
 MoFCU1pLlZP8HTJivxr9KS7mGchIAfL9IqKQ8wLzCHYivRQYDl7yH4+oydBr/zjJ7txm
 dyLa1MhJw4cVQnR5HRQauaTSkRcUTri/bKmyaBTDgJjfqFPOoBw/062HMFZ2ZTPD+W61
 96efYXC/zkg7FrgmcysfGsxhVvTEyiPVtxIjdraXDiTxtIRhmjUeeSUheiOHtr6Ddq54
 7XSQ==
X-Gm-Message-State: AOAM533j4q2MTn0fII62FiJ7PXDycFlshfvKxRloSAXaUndfd+2lx7EF
 JQ7qxysxFWIuEAGXcbicctX9r26cOPFy9Ns4Fos=
X-Google-Smtp-Source: ABdhPJzALVgHPiblsh5yJKlDNLsEKIoU4BxxrlKKichP14NRgHIHisLyu242+efFIy7I0X0QRpoGAOaK2tiDxP8eeFM=
X-Received: by 2002:a5b:391:: with SMTP id k17mr1246131ybp.152.1630547841450; 
 Wed, 01 Sep 2021 18:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <28c908de60b9b04fa20e63d113885c98586053f3.1630543194.git.alistair.francis@wdc.com>
In-Reply-To: <28c908de60b9b04fa20e63d113885c98586053f3.1630543194.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 2 Sep 2021 09:57:10 +0800
Message-ID: <CAEUhbmU793C3a+7heXuG+=JiiVK47Q5F1pCzrEOTOD3=WTH=SA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/riscv: Update the ePMP CSR address
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 2, 2021 at 8:40 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Update the ePMP CSRs to match the 0.9.3 ePMP spec
> https://github.com/riscv/riscv-tee/blob/61455747230a26002d741f64879dd78cc9689323/Smepmp/Smepmp.pdf
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 4 ++--
>  target/riscv/cpu.c      | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

