Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 236345E93BC
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 16:45:34 +0200 (CEST)
Received: from localhost ([::1]:45046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocSsu-0005QU-Oc
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 10:45:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ocSr5-0003vW-70
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 10:43:39 -0400
Received: from mail-vk1-f170.google.com ([209.85.221.170]:38767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ocSr3-0000vJ-8X
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 10:43:38 -0400
Received: by mail-vk1-f170.google.com with SMTP id h5so2330725vkc.5
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 07:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Pi9pV4k/eQwp2KGosxP9aAKslUmfRiJqYuFLER9Yh9I=;
 b=1tOdzpIV6hV/Lbw4eC5qDxSNUGTnGzGgXxum0+6RC6fe5QD5/kt0DGMn1//4Oj9KaK
 x3zbjReHTj1WyrLkovyfprVAjjlS3emGEnXhiXA9tdAjzK3No/XQxo5my0McVPJvW/mA
 xEI2bWds7MxjiqA79fB/IwoSn+vg/yqwq2qdvmzaOoYCMIxACBECCKVSdIC+dJWOEbqL
 CwJ4kmSI3R/gx2tjNgO4NJ7QjvbzYnfJV2mGt1VqIzThBoBo6oHMYJbeABhWx0/oXv8/
 pJosFMMwYFkxXIPzHw3UTlYjqX/yKGZGkMRKjsmAJ24k4fiuRgDvuph4HQGX4f7vOyev
 wfzA==
X-Gm-Message-State: ACrzQf0wdWLo/tA65fZqQukA2PH+rnhzMN3xArtk3JQ5Ni90Z0d3Vu2n
 PR2x2hJKJnHBGFaVjXu7Lm0MVkNkZZagGc95V0s=
X-Google-Smtp-Source: AMsMyM7P3XOhZAV0FG2GdYw8n7sp4AmL9hQJsQZh2LIUkISQ1+1TChs+mo7lUmuHMCSFPluxyRhI0GQ27CwEt2Vh5Ag=
X-Received: by 2002:a05:6122:10dc:b0:3a3:4904:2941 with SMTP id
 l28-20020a05612210dc00b003a349042941mr6895904vko.24.1664117015801; Sun, 25
 Sep 2022 07:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220925134804.139706-1-mark.cave-ayland@ilande.co.uk>
 <20220925134804.139706-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220925134804.139706-2-mark.cave-ayland@ilande.co.uk>
Date: Sun, 25 Sep 2022 16:43:24 +0200
Message-ID: <CAAdtpL6ACE=YgZoMa5XSiKiwR4TXiRtJ9MMtpAwyehL3ev7sGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/m68k: increase size of m68k CPU features from
 uint32_t to uint64_t
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.170;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f170.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Sun, Sep 25, 2022 at 3:53 PM Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> There are already 32 feature bits in use, so change the size of the m68k
> CPU features to uint64_t (along with the associated m68k_feature()
> functions) to allow up to 64 feature bits to be used.
>
> At the same time make use of the BIT_ULL() macro when reading/writing
> the CPU feature bits to improve readability, and also update m68k_feature=
()
> to return a bool rather than an int.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  target/m68k/cpu.c | 4 ++--
>  target/m68k/cpu.h | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

