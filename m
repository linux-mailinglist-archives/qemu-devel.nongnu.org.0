Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0594EE5E6
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 04:11:30 +0200 (CEST)
Received: from localhost ([::1]:39732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na6l7-00055g-IJ
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 22:11:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na6jM-0004Ij-Tj
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1na6jH-0001qF-7T
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 22:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648778969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ovexMQk+QP17zcbRO5SbRjVtDhpzHZe+9P5CBtAjO2U=;
 b=PZiR/eHO6hbWfV8G2UQv76fpioMTNGLbu8ULFp6moBdAzkfl0SN/cwzaRaRXYllITRYIPv
 C/t2kRirGWskGWOAqG6XxMgniOcktUKpDrtS7NECnevlFhV/G2QQNTuNsJ+R03qvyPKmCn
 EWMZxtkiI1eSvJNdZhbn2LtKiUu8P/k=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-jKKYg8pgOKuGfS5IMnJLPg-1; Thu, 31 Mar 2022 22:09:28 -0400
X-MC-Unique: jKKYg8pgOKuGfS5IMnJLPg-1
Received: by mail-lf1-f72.google.com with SMTP id
 q19-20020ac24a73000000b0044a100bb508so565890lfp.14
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ovexMQk+QP17zcbRO5SbRjVtDhpzHZe+9P5CBtAjO2U=;
 b=IR7SH7Wgwqi3ZAl1ay/E4ULuYQXttkiWqBFCYJvCZvHE4L2uL+KVBS6Wfrv8JNYQPX
 YXQK/z8l9r1qh/1xW50meeY70DFmwE7fwZYDsOI9/H2Bpl6wTs5zdt78q3piWy0I2xFW
 DgB5uHwolDCbVlpZxBre8H00FcDtBTax5kT77+kUIgJYi3pM6nt98O1FG4Ta2N430mqg
 7xPMcVuptEdwqJnAW7JktbfbHJky9RcC13CQB+RiRpqnDULAGVZ9N1ahroTqbt2FHiLU
 Juxg+XeUK5QrbQqD0oosq3LHpC4mpTyaLO5kCaknxBVwgXTebqvdfUXXFuYykajhFnZD
 0zyQ==
X-Gm-Message-State: AOAM5300WgPx0QjlKVRltrwChDrddEpLL5JP7OxjEtBNklgkQPpHI9dw
 /htL9CNMIGDGT3L0iSrcX/qLcB00QBFOkROlwsorQV3XbPWjVmMsMTr8Jvn4oMV7UGOeIMxYHOS
 8ycaCSBiwZ9tWzlF4ENwlZzMcko6HKtQ=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr12602492lfd.190.1648778966488; 
 Thu, 31 Mar 2022 19:09:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFm0e4qvIN6P6QA/a/nru9Uhh43AlDZO0mHa7wtxwfaXEFqR8JrLiBI9vgbo+i2oRWtAcXV8IvuQGghozfZFQ=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr12602478lfd.190.1648778966210; Thu, 31
 Mar 2022 19:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_17Mzz7AiQd+1z50Jp-wWhfChCVi=8kjWCU6daUVqV_Q@mail.gmail.com>
 <YkXzToltd73X4WgY@xz-m1.local>
In-Reply-To: <YkXzToltd73X4WgY@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 1 Apr 2022 10:09:15 +0800
Message-ID: <CACGkMEs41rX5FqtKst4qZc1QXyY1VvMK_GMo_4NRD45zh9VSHg@mail.gmail.com>
Subject: Re: who's maintaining amd_iommu.c these days?
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Huang2, Wei" <wei.huang2@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 2:30 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Mar 31, 2022 at 05:01:52PM +0100, Peter Maydell wrote:
> > Coverity points out some problems with hw/i386/amd_iommu.c's event
> > logging code -- specifically, CID 1487115 1487116 1487190 1487200
> > 1487232 1487258 are all the same basic problem, which is that various
> > functions declare a local "uint64_t evt[4]", populate only some
> > bits of it and then write it to guest memory, so we end up using
> > uninitialized host data and leaking it to the guest. I was going to
> > write a fix for this, but in looking at the code I noticed that
> > it has more extensive problems:
> >
> > (1) these functions allocate an array of 4 64-bit values,
> > but we only copy 2 to the guest, because AMDVI_EVENT_LEN is 16.
> > Looking at the spec, I think that the length is right and it's
> > really 4 32-bit values (or 2 64-bit values, if you like).
> >
> > (2) There are host-endianness bugs, because we assemble the
> > event as a set of host-endianness values but then write them
> > to guest memory as a bag-of-bytes with dma_memory_write()
> >
> > (3) amdvi_encode_event() is throwing away most of its
> > "addr" argument, because it calls
> >   amdvi_setevent_bits(evt, addr, 63, 64) apparently intending
> > that to write 64 bits starting at 63 bits into the packet, but
> > the amdvi_setevent_bits() function only ever updates one
> > uint64_t in the array, so it will in fact write bit 63 and
> > nothing else.
> >
> > (4) The claimed bit layout of the event structure doesn't
> > match up with the one in the spec document I found. This
> > could be because I found a document for some other bit
> > of hardware, of course.
> >
> > Anyway, adding all these up, the event logging probably
> > needs a bit of a restructuring, and that should ideally be
> > done by somebody who (a) knows the hardware we're emulating
> > here and (b) is in a position to test things. Any volunteers?
>
> Copying some AMD developers (from where I saw the last patches from)...

Btw, the AMD IOMMU seems not to work for a while (just boot it with
virtio-blk and it still doesn't work).

Thanks

>
> --
> Peter Xu
>


