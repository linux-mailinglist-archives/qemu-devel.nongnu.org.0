Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419926E1153
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 17:41:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmz2h-0001XX-Ib; Thu, 13 Apr 2023 11:39:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmz2e-0001T7-Sh
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:39:20 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmz2R-0003Z7-OZ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 11:39:20 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kt6so320970ejb.0
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 08:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681400343; x=1683992343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ao6z1VyKvh+32ZTHJAizbc9L4R3/qvV9z1ebCwwhQfI=;
 b=gUGDXfeNfRRv0jjR4wvm7AwMUBLA3IQU0s5Fr3aMRm8KU6ChgtCjj0Kw8I3uIhuANN
 qJkMT/M/W4MwD8JR7hNu70e9YB9Jvt2Wq7rvIFB992aObqzBikLFMM2M1kQVrS86atpJ
 CTTcqGqunjIH5B/E5slMHHVdnPPM12HFuVl8KCw/UyYKN143AZRttnLUAPA3raqJ6G05
 0zbeDZl+PNDAsQ+xRF+jZTkhgHyYPbCXxTimlee4NQbWtBkFjPa4og09ZpOLEu/8BXJe
 G//JenA3w0TiRDbITE4UGsNF84ei3uOyVnQtFVUbrIgJKSJkQnGoeq4fNNr4rN6iKAlp
 DQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681400343; x=1683992343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ao6z1VyKvh+32ZTHJAizbc9L4R3/qvV9z1ebCwwhQfI=;
 b=EJEU+WTjK7mZdqj9e99w08yCtk/oDS7PdWRHsGJyP2bkcqoeYZ9YlkyB2eReWhFb4p
 uMHtrasi3HhMfF5/waB8cO5DmLB1QovzIvnBNw4M3h63bH3Jk0y0yXP54S+qN2ZSEzH1
 OHzDzpXt3aU7igWo8/fFKJUd83t5iS8ufYPh0A3tT/gpbE41h5EEJ1pydeqXlZP1AgHi
 s5jIH2JzxdYEdDA/cQlLPeW9qUqCq74Srtx3XFLJ0QLNT4CAQhQpaNqJeVT+5hNu85P9
 GIvPZ7IQK68XEM7OjXP3GTrL5Sl90iiJ8ENc7QyxAVAZWFtQ9Qiq6kmHLGWGbjhnEC9D
 58Og==
X-Gm-Message-State: AAQBX9fcJ9EtBzto3oAEMKvKvtkt48iomnpyRXbSvEya9QDMdxSqbhII
 KFuxZv9w3X2YFfceyC5si4HgGFVFU7JqHwXiUk4ugQ==
X-Google-Smtp-Source: AKy350a3MGL25vYmjBgL6dPKbf5IvsiRIvIyjSOzrKLFPgcttp/ijPOijb4J+4RsfkHaERx2jXwJ4TNHza+iHEipafE=
X-Received: by 2002:a17:907:160c:b0:92f:cbfe:1635 with SMTP id
 hb12-20020a170907160c00b0092fcbfe1635mr1537071ejc.6.1681400343563; Thu, 13
 Apr 2023 08:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221117165554.1773409-1-stefanha@redhat.com>
 <20221117165554.1773409-4-stefanha@redhat.com>
In-Reply-To: <20221117165554.1773409-4-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 16:38:52 +0100
Message-ID: <CAFEAcA_hkABS_ydCOiDxvZh71s916o0y2Gm5rht-FPDjzVbpLA@mail.gmail.com>
Subject: Re: [PATCH for-7.2 v3 3/3] rtl8139: honor large send MSS value
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 17 Nov 2022 at 16:58, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The Large-Send Task Offload Tx Descriptor (9.2.1 Transmit) has a
> Large-Send MSS value where the driver specifies the MSS. See the
> datasheet here:
> http://realtek.info/pdf/rtl8139cp.pdf
>
> The code ignores this value and uses a hardcoded MSS of 1500 bytes
> instead. When the MTU is less than 1500 bytes the hardcoded value
> results in IP fragmentation and poor performance.
>
> Use the Large-Send MSS value to correctly size Large-Send packets.
>
> Jason Wang <jasowang@redhat.com> noticed that the Large-Send MSS value
> mask was incorrect so it is adjusted to match the datasheet and Linux
> 8139cp driver.

Hi Stefan -- in v2 of this patch

https://lore.kernel.org/qemu-devel/20221116154122.1705399-1-stefanha@redhat.com/

there was a check for "is the specified large_send_mss value
too small?":

+                /* MSS too small? */
+                if (tcp_hlen + hlen >= large_send_mss) {
+                    goto skip_offload;
+                }

but it isn't present in this final version of the patch which
went into git. Was that deliberately dropped?

I ask because the fuzzers have discovered that if you feed this
device a descriptor where the large_send_mss value is 0, then
we will now do a division by zero and crash:
https://gitlab.com/qemu-project/qemu/-/issues/1582

(The datasheet, naturally, says nothing at all about what
happens if the descriptor contains a bogus MSS value.)

thanks
-- PMM

