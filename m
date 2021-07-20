Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00233CF497
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 08:35:59 +0200 (CEST)
Received: from localhost ([::1]:38710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5jME-0005zi-Qb
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 02:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m5jKq-0004lX-RU
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 02:34:33 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:42934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1m5jKp-00061C-Cz
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 02:34:32 -0400
Received: by mail-io1-xd2e.google.com with SMTP id x10so22806679ion.9
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 23:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BkGJlUJmFZmppBDeAx9AdHISCcUvR1AF82e1dded7X8=;
 b=YtKORryAq5/zc52ClwjRi7PLiArfRRYk2oM/AqyuCKI9lBVjeJtbxeoFvkGpyk4kw6
 xk9VHzcbvd4YVMR8drhPIwkaZRMxXltd/lqS/VFfbUqOlB/D9ITgOvhlyzirt1rQsEc1
 TkhYHTZDJAEXn8EyCJpTwCrMHVzwi0csxFTFQwubqr30luXVGIPcOLstnY2L0ZEHCIvf
 Xum3sEfjXP8u4ROREzVdEu1tMDIbOh4MIU/3zxdd28oEyGTTPh6nxuw5BCXjA6bPR+lt
 ubgSBYbQGHziUjilDxd/iU7/BAe9qbknaVZ1DWUrx2TStwi30Qoz+UWV3+VZTFQGPMji
 /tLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BkGJlUJmFZmppBDeAx9AdHISCcUvR1AF82e1dded7X8=;
 b=bC62Lokk2jegqlCaLytAQ3EYSpzLHsLyeabDhx9tUH2s/iWkNErD95agOpOB4AZC6c
 2jkbXSkCV4u2VmzJ94+rP5ud1nO/O9wJjttly2GUxDLNdtUo2xyDwK7V8YdgYjE6btKM
 tuptpCXAKGtrfVER8aGkIgQCj+VSFnhQZwEDwG9yK1f8D+w5nga6DPeVF9thO6uU0S4q
 U4mT0fBu9EKo7Xc1wO9Mt5P/+Ys5qGorQdz+RuqPcFPUOY8TJm39098jHM7bFzi+lGZa
 9Z43468EhU67jE1d/X7kTsOhhdtMS1JopI/82WYcPXt3tnO9JSDVmI3H9+qNKulHgIjn
 M7kg==
X-Gm-Message-State: AOAM531v1JXnGpjfhvmej4ON/OFtozn93HRYIeS4W6g/lxZY26T5iMvQ
 Q05kRrlSO2RWNBMj/oPqbs/HaTczE2nPdemQuAM=
X-Google-Smtp-Source: ABdhPJxj3zK0aIVmBjUz1cOcKyLiJppzfMtV3ZIMHHB+XHzRRvpxgFQxrrFurgGwozueSww5rYUSsnEoCEhSFVoapW0=
X-Received: by 2002:a05:6638:25c7:: with SMTP id
 u7mr25046950jat.26.1626762870040; 
 Mon, 19 Jul 2021 23:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <1626732165-137461-1-git-send-email-joe.komlodi@xilinx.com>
 <1626732165-137461-3-git-send-email-joe.komlodi@xilinx.com>
In-Reply-To: <1626732165-137461-3-git-send-email-joe.komlodi@xilinx.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Jul 2021 16:34:04 +1000
Message-ID: <CAKmqyKP_0PPjfPtotuROCwaPb=cQOGsx9-Qr3fV_rhTMqwGxsg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/registerfields: Use 64-bit bitfield for
 FIELD_DP64
To: Joe Komlodi <joe.komlodi@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 8:03 AM Joe Komlodi <joe.komlodi@xilinx.com> wrote:
>
> If we have a field that's wider than 32-bits, we need a data type wide enough to
> be able to create the bitfield used to deposit the value.
>
> Signed-off-by: Joe Komlodi <joe.komlodi@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/registerfields.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index 9a03ac5..f2a3c9c 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -95,7 +95,7 @@
>      _d; })
>  #define FIELD_DP64(storage, reg, field, val) ({                           \
>      struct {                                                              \
> -        unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
> +        uint64_t v:R_ ## reg ## _ ## field ## _LENGTH;                \
>      } _v = { .v = val };                                                  \
>      uint64_t _d;                                                          \
>      _d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,          \
> --
> 2.7.4
>
>

