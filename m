Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD34EDE61
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:07:57 +0200 (CEST)
Received: from localhost ([::1]:48676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxL2-0005OM-3G
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:07:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZxFO-0006Xe-MD
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:02:06 -0400
Received: from [2607:f8b0:4864:20::112b] (port=44695
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZxFM-0006RF-Ov
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 12:02:06 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2eafabbc80aso3017037b3.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=zLbaLskPV4jZmrdpxhLXxQdvNolGRNCGNq3+DN4IqvU=;
 b=KdPOWu4V8mMXyp1hke8LWTbkTpAerEqsv/irp/tCbyjAoqXE/tdHRuGCjTaFrZl3pa
 QUou8anij5e31GYmJ5jtzQCCSEzKSI3koEn/+fbsRtVm/t9U9sN50PH0h74X+7xjbPx/
 BjdJwFSOUqVtUv7iE8wGPxI93MmumYry+aotcRYloMo2SFg2jsSm2yuOzp9DETazl8YU
 Mw74eHLV4UhVIliEBIwHnpE1TdgkRMLOM6zOcFGiCPTOpSJ6TrE2nA9lb4+4QaV/9Hx/
 xVZ6DCu1ZitlN9fDSoX1B8BKWaZ0BrLEAzez7eXIcbIEVrJV5LX0krzAnTch1MIY/w85
 x4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=zLbaLskPV4jZmrdpxhLXxQdvNolGRNCGNq3+DN4IqvU=;
 b=ReJuZQKiU8cLhPK1zj6p2N/zcFqKm82HpemA4k+axQePyU0sK/st+WBfz4VJbFDpUh
 e0Xdf9vaAc+J1AxKWYdcCahgFljsPLVGnh1fB8jeyD+u5Vgzt7rkOnoxpVbXD4txf2c3
 XhQj6zpRJ58dWwTrvdBGJ/bCnU48XckFn8e9C51xPb+ysWhB0fwRkYxCMJi/a8lAV2K7
 C3nWeF1uCJwXLvWzsdzkpCalIIAgpDbgdX/E6dzONNW9JG6nNNlBEa+HGvZECCX8s1D5
 6ACQilRT7cxM93jE2hSNbmiM4QUjTQGXm4/qBwS4ayJmG3l16WXVtAGUx64WXtpl5g/q
 YgzQ==
X-Gm-Message-State: AOAM533OXCglzaffLcPhbbJUDlu7ZqWyHxPxw7Gt2/4dx5g2ra58bipL
 8kd2UZ63lqrhjjPYfIVBeD9qq7I9xUlcW68VLvent1H5I3OUI4O5
X-Google-Smtp-Source: ABdhPJxSZ7GdwnaDSACz2q9Dh/c+hvYJrzLGNb2CjHY3FwgT0ZCqyGJnaTaLqCJlW0bgz4mJy5YBpNdgs7plvx28u9s=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr5627923ywb.257.1648742523462; Thu, 31 Mar
 2022 09:02:03 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 17:01:52 +0100
Message-ID: <CAFEAcA_17Mzz7AiQd+1z50Jp-wWhfChCVi=8kjWCU6daUVqV_Q@mail.gmail.com>
Subject: who's maintaining amd_iommu.c these days?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity points out some problems with hw/i386/amd_iommu.c's event
logging code -- specifically, CID 1487115 1487116 1487190 1487200
1487232 1487258 are all the same basic problem, which is that various
functions declare a local "uint64_t evt[4]", populate only some
bits of it and then write it to guest memory, so we end up using
uninitialized host data and leaking it to the guest. I was going to
write a fix for this, but in looking at the code I noticed that
it has more extensive problems:

(1) these functions allocate an array of 4 64-bit values,
but we only copy 2 to the guest, because AMDVI_EVENT_LEN is 16.
Looking at the spec, I think that the length is right and it's
really 4 32-bit values (or 2 64-bit values, if you like).

(2) There are host-endianness bugs, because we assemble the
event as a set of host-endianness values but then write them
to guest memory as a bag-of-bytes with dma_memory_write()

(3) amdvi_encode_event() is throwing away most of its
"addr" argument, because it calls
  amdvi_setevent_bits(evt, addr, 63, 64) apparently intending
that to write 64 bits starting at 63 bits into the packet, but
the amdvi_setevent_bits() function only ever updates one
uint64_t in the array, so it will in fact write bit 63 and
nothing else.

(4) The claimed bit layout of the event structure doesn't
match up with the one in the spec document I found. This
could be because I found a document for some other bit
of hardware, of course.

Anyway, adding all these up, the event logging probably
needs a bit of a restructuring, and that should ideally be
done by somebody who (a) knows the hardware we're emulating
here and (b) is in a position to test things. Any volunteers?

thanks
-- PMM

