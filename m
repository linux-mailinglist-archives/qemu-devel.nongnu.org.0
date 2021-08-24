Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E823F603A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:24:19 +0200 (CEST)
Received: from localhost ([::1]:59074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXLZ-00021r-Aa
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXK1-00089E-MM
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:22:38 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mIXJz-000415-Rn
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:22:37 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g21so31974627edw.4
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Tb65nKmIYz8COIR5xel1WaO1wpGGe0tNvCL3gI+CWLQ=;
 b=YhohDDVkjad0vVuclNATWe2XD8yxRbM0J/xDZWahNj6ttNRHQ96BEGc1t4ui5HYFFI
 Km0LmdQy58oOBRG5aU/9dws6AhxBaUG3paBD0rA0KSIS0mxQ5TWpV861gwF1RwS4/7yw
 fx5FfkU/xrOEdcmMeUUaFQoVY2US9HK0EoP9rAQP6+kQHCvjzsiyXU4pzu3gBvkIEymo
 4TifM9IA5VZZqxjJSR7SbrJc/COC3VsQWf93sHml0RZRLL/j8Mj1ppTrFJYoxfmcuEH1
 8NMnsXbfzfn70JbyUEmo4qso/N22YFLrF8DEzCM/hFoLLZ2sfsVEXRnEPHF98kLuAP0C
 z8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Tb65nKmIYz8COIR5xel1WaO1wpGGe0tNvCL3gI+CWLQ=;
 b=pX42CP7m+9swxDwAVkdl2j4teBoxMthVuLzMzX25vfcglPauiB88l5p91v90g420IY
 oDL19J34BEDSrfsj9h1xVPuZDN/ajfk5/mSMQ6BD6R2gKd1dEymZO4v5GFzfnaioshO+
 BxakwLt2EK1asxM9B6YhIR+SEDKnxZvK2QLhsR5iMiUGR98oarEYqKgwlVZX9dxJOYOs
 d4xeN7pT7HfiJg/PEFmGwf/JIm+mtDGZAGYfuabBTW9DVEa1lhXPGOwVlhoc5H6gERnH
 KM5OXdHIPKkplQjbXgmomfpMVUs2RPj3FjAzqrTEFul0R5MW8ZJGFD/E3GJ0JxNzANgJ
 UNlw==
X-Gm-Message-State: AOAM533+4Sq8GfUI5LJlVzP56GvAmMBWxUusEfLOVh9G9oMPmWtGmZ/G
 WewZoTazELn7Bg+ilzqgy97HsiZUaW3buRp/L4o21Q==
X-Google-Smtp-Source: ABdhPJw3t8LtxRcXmksmIPt6ex4MtQmvOtYZ0MhxnxU8sAc+i47W5vhXDoT+FA5nKwhTEpuBASl9PWfzoG8E3KmHo54=
X-Received: by 2002:a05:6402:3099:: with SMTP id
 de25mr43007324edb.36.1629814953870; 
 Tue, 24 Aug 2021 07:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-6-philmd@redhat.com>
 <YSTw9VPd44uIZ55L@stefanha-x1.localdomain>
 <569b3a2f-2d05-700d-cae3-07d8b78fcd55@redhat.com>
In-Reply-To: <569b3a2f-2d05-700d-cae3-07d8b78fcd55@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Aug 2021 15:21:46 +0100
Message-ID: <CAFEAcA__epFKNUsZhUChOhkM18xSbm=qndCFDtVBTfm1gSz+Dw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 5/5] softmmu/physmem: Have flaview API check
 MemTxAttrs::bus_perm field
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm <qemu-arm@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Aug 2021 at 14:50, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/24/21 3:15 PM, Stefan Hajnoczi wrote:
> > On Mon, Aug 23, 2021 at 06:41:57PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> Check bus permission in flatview_access_allowed() before
> >> running any bus transaction.
> >>
> >> There is not change for the default case (MEMTXPERM_UNSPECIFIED).
> >>
> >> The MEMTXPERM_UNRESTRICTED case works as an allow list. Devices
> >> using it won't be checked by flatview_access_allowed().
> >>
> >> The only deny list equivalent is MEMTXPERM_RAM_DEVICE: devices
> >> using this flag will reject transactions and set the optional
> >> MemTxResult to MEMTX_BUS_ERROR.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  softmmu/physmem.c | 17 ++++++++++++++++-
> >>  1 file changed, 16 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> >> index 0d31a2f4199..329542dba75 100644
> >> --- a/softmmu/physmem.c
> >> +++ b/softmmu/physmem.c
> >> @@ -2772,7 +2772,22 @@ static inline bool flatview_access_allowed(Memo=
ryRegion *mr, MemTxAttrs attrs,
> >>                                             hwaddr addr, hwaddr len,
> >>                                             MemTxResult *result)
> >>  {
> >> -    return true;
> >> +    if (unlikely(attrs.bus_perm =3D=3D MEMTXPERM_RAM_DEVICE)) {
> >> +        if (memory_region_is_ram(mr) || memory_region_is_ram_device(m=
r)) {
> >> +            return true;
> >> +        }
> >> +        qemu_log_mask(LOG_GUEST_ERROR,
> >> +                      "Invalid access to non-RAM device at "
> >> +                      "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu "=
, "
> >> +                      "region '%s'\n", addr, len, memory_region_name(=
mr));
> >> +        if (result) {
> >> +            *result |=3D MEMTX_BUS_ERROR;
> >
> > Why bitwise OR?
>
> MemTxResult is not an enum but used as a bitfield.
>
> See access_with_adjusted_size():
>
>     MemTxResult r =3D MEMTX_OK;
>     ...
>     if (memory_region_big_endian(mr)) {
>         for (i =3D 0; i < size; i +=3D access_size) {
>             r |=3D access_fn(mr, addr + i, value, access_size,
>                         (size - access_size - i) * 8,
>                         access_mask, attrs);
>         }
>     } else {
>         for (i =3D 0; i < size; i +=3D access_size) {
>             r |=3D access_fn(mr, addr + i, value, access_size, i * 8,
>                         access_mask, attrs);
>         }
>     }
>     return r;
> }
>
> and flatview_read_continue() / flatview_write_continue():
>
>     for (;;) {
>         if (!memory_access_is_direct(mr, true)) {
>             release_lock |=3D prepare_mmio_access(mr);
>             l =3D memory_access_size(mr, l, addr1);
>             val =3D ldn_he_p(buf, l);
>             result |=3D memory_region_dispatch_write(mr, addr1, val,
>                                                    size_memop(l),
>                                                    attrs);
>     ...
>     return result;
> }

In these two examples we OR together the MemTxResults because
we are looping over multiple accesses and combining all the
results together; we want to return a "not OK" result if any
of the individual results failed. Is that the case for
flatview_access_allowed() ?

-- PMM

