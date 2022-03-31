Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A64EE110
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:48:47 +0200 (CEST)
Received: from localhost ([::1]:56330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzqg-00029d-AK
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:48:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzZG-0005BX-4H
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:30:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZzZC-0004ZC-R8
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:30:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648751442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oz34IBp6LtxtHH48koap0VZK9XjCM1o+AjwDvS/D0lQ=;
 b=Oc+pRuJnKYWwKuY+3WfLefq/nX5juBV2Q1KHwQeX6YeAEQSrXGtQwstLHx+whiihgpMWMH
 pyA7CS6Fa/H/LwYWPsjdmyJ3rDjcfivIjUt6yqOHCFXBE3T8+hiyUKdqBRyhKO1Zhrrd3L
 +CSVctfJolngGJgS9mQPm1Zu8jAAo8A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-T6j_kK_cNGSSn5lAmiKu2A-1; Thu, 31 Mar 2022 14:30:40 -0400
X-MC-Unique: T6j_kK_cNGSSn5lAmiKu2A-1
Received: by mail-qv1-f70.google.com with SMTP id
 q4-20020a0cf5c4000000b0044346ee3627so221890qvm.16
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 11:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oz34IBp6LtxtHH48koap0VZK9XjCM1o+AjwDvS/D0lQ=;
 b=xWre50ulyEYyr5QCk+EP/WDn7+CxnBud+vPW99YBsXbhxfxmwX04f3YB1B84qPa1UM
 FT6pnif0VBMAp10P7maRMhnxsoNfQb1TpVOCPB8yu4/bFYInUTTTDRGcD+J9KlxfO1R1
 EG8u3KcFKRDbl6ZiWaB5m2NSjgG3l+X14W5vD46TU0fq2aKcFoRH4SbtqD5kojLwpxza
 vL7U+lR+HtT1ctSItYvRZk7jsLvL942imldcRBvJVpbVYqrGZhTkuEVOJJwBcV4NvdFd
 BSUYRbcL49f/I+1kJcw0XO60fjnL+goFPzE79DSwGzqfJVk6XRSDBQaSCpj5CclMBcxv
 6n8w==
X-Gm-Message-State: AOAM53217ASS2hjSEwn1Of2E6jV72tzxJ6Ixc1EvJAP9AhHMIDOGzr54
 ygOLk3pJOVajg4TjfktGK5+FDZisQjWSEx/HWoRY81jx2JHOKsWRP9YOgFXAfUM5upKv6cXnn67
 HFoYczSVpv4puCgs=
X-Received: by 2002:a05:622a:2d6:b0:2e2:1294:4a80 with SMTP id
 a22-20020a05622a02d600b002e212944a80mr5501288qtx.256.1648751440383; 
 Thu, 31 Mar 2022 11:30:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjqtyRLXHejGaUzLRDqhRjVfFti6GXeDY4GMli4zb41YNg+mQdQWFSb+1rR6XdyK+lO7n46w==
X-Received: by 2002:a05:622a:2d6:b0:2e2:1294:4a80 with SMTP id
 a22-20020a05622a02d600b002e212944a80mr5501261qtx.256.1648751440099; 
 Thu, 31 Mar 2022 11:30:40 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05622a029300b002e1a763dac1sm82463qtw.9.2022.03.31.11.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 11:30:39 -0700 (PDT)
Date: Thu, 31 Mar 2022 14:30:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: who's maintaining amd_iommu.c these days?
Message-ID: <YkXzToltd73X4WgY@xz-m1.local>
References: <CAFEAcA_17Mzz7AiQd+1z50Jp-wWhfChCVi=8kjWCU6daUVqV_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_17Mzz7AiQd+1z50Jp-wWhfChCVi=8kjWCU6daUVqV_Q@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 wei.huang2@amd.com, Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Suravee.Suthikulpanit@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 05:01:52PM +0100, Peter Maydell wrote:
> Coverity points out some problems with hw/i386/amd_iommu.c's event
> logging code -- specifically, CID 1487115 1487116 1487190 1487200
> 1487232 1487258 are all the same basic problem, which is that various
> functions declare a local "uint64_t evt[4]", populate only some
> bits of it and then write it to guest memory, so we end up using
> uninitialized host data and leaking it to the guest. I was going to
> write a fix for this, but in looking at the code I noticed that
> it has more extensive problems:
> 
> (1) these functions allocate an array of 4 64-bit values,
> but we only copy 2 to the guest, because AMDVI_EVENT_LEN is 16.
> Looking at the spec, I think that the length is right and it's
> really 4 32-bit values (or 2 64-bit values, if you like).
> 
> (2) There are host-endianness bugs, because we assemble the
> event as a set of host-endianness values but then write them
> to guest memory as a bag-of-bytes with dma_memory_write()
> 
> (3) amdvi_encode_event() is throwing away most of its
> "addr" argument, because it calls
>   amdvi_setevent_bits(evt, addr, 63, 64) apparently intending
> that to write 64 bits starting at 63 bits into the packet, but
> the amdvi_setevent_bits() function only ever updates one
> uint64_t in the array, so it will in fact write bit 63 and
> nothing else.
> 
> (4) The claimed bit layout of the event structure doesn't
> match up with the one in the spec document I found. This
> could be because I found a document for some other bit
> of hardware, of course.
> 
> Anyway, adding all these up, the event logging probably
> needs a bit of a restructuring, and that should ideally be
> done by somebody who (a) knows the hardware we're emulating
> here and (b) is in a position to test things. Any volunteers?

Copying some AMD developers (from where I saw the last patches from)...

-- 
Peter Xu


