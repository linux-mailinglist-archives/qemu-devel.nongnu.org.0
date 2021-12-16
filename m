Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CF476890
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 04:16:59 +0100 (CET)
Received: from localhost ([::1]:58080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxhGM-0003oo-1i
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 22:16:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mxhEe-00031O-FH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 22:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mxhEb-0001gm-VE
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 22:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639624508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppUO6vniSrn5PILnlWXFxibdrqyVKmXU6AvlbAwHTRs=;
 b=dbhQnlElgCFbZdQNz7HnzLHlDchjDBjc5o6ZLHCzex9JhQoJLQgv8aOwByQQZ+s/rUQhHP
 DRo24newJxNOmFx6+Hr3xbtOv9OlutLb5b1QU8no0aXMBPxjC0PCUb9wTNFB/q/utvIE0a
 thQnoiBwI9Yr5e8d5qZ75gvb6wVDTLs=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-k5DDF9gEOBmIUP72EfUSFw-1; Wed, 15 Dec 2021 22:15:07 -0500
X-MC-Unique: k5DDF9gEOBmIUP72EfUSFw-1
Received: by mail-lj1-f198.google.com with SMTP id
 y23-20020a2e3217000000b00218c6ede162so7914675ljy.23
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 19:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ppUO6vniSrn5PILnlWXFxibdrqyVKmXU6AvlbAwHTRs=;
 b=ERZeBCMHWqvRdkIBcB1COwbaH//a3fhbICPSaKPHZx6VuleDGFBgXqJjwZmLy7hPY2
 txFzJ6d4y83kS5aXIlTIi84aOUG5+HNu+9kuANLt7KM7g+1uXh2ZsSMjW9haNwEjXyAQ
 K43x18syUcPQN59q+wAFY8GoBsJcX7v39OF1LlNIc3P+9Dvh6yIxs4OmTatVk7ZN+jW2
 BASCgNQufrb3kxmTGtKHPGH2mgIedliYdz/HJziUzp+9yoqmdSVSDjlMh3tq6ZNNB/E8
 FZxjLLPvagFfM8FFzSu67vE2x0BbYZFhMpdWMmt6ybEfl2WcE92oRdkCrQ0uHZJ4utXQ
 pvQA==
X-Gm-Message-State: AOAM5319mz42LHWaJtM1vrqJ5UjoWYjH/UFgTkZHcYKAYsRkZt4LaSvt
 PpHFPyludZiRtdhXFbgeoT8AS1nNjQAdyzvidjXE8Z3j8NUtcF7lE6SA6StXeolofIlzBqqJpsY
 ab4230P/N8WDFLVOPoT1tBiJ+AYPRWH4=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr13205808lfe.84.1639624506026; 
 Wed, 15 Dec 2021 19:15:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1jJwSfT+o4f7K0MNCc64/cWm6jRB8IkzuKNJcqJlFOoe8gaYzNXIPf42UnICtt6u7Mri+6VB+LF//QkprShg=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr13205781lfe.84.1639624505766; 
 Wed, 15 Dec 2021 19:15:05 -0800 (PST)
MIME-Version: 1.0
References: <20211215205656.488940-1-philmd@redhat.com>
 <20211215205656.488940-3-philmd@redhat.com>
In-Reply-To: <20211215205656.488940-3-philmd@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Dec 2021 11:14:54 +0800
Message-ID: <CACGkMEvEeVG_+B_v1Ww-i__mM0NQeYHgh4zdurX81zarErvTVA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] hw/sd/sdhci: Prohibit DMA accesses to devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 4:57 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> The issue reported by OSS-Fuzz produces the following backtrace:
>
>   =3D=3D447470=3D=3DERROR: AddressSanitizer: heap-buffer-overflow
>   READ of size 1 at 0x61500002a080 thread T0
>       #0 0x71766d47 in sdhci_read_dataport hw/sd/sdhci.c:474:18
>       #1 0x7175f139 in sdhci_read hw/sd/sdhci.c:1022:19
>       #2 0x721b937b in memory_region_read_accessor softmmu/memory.c:440:1=
1
>       #3 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
>       #4 0x7216f47c in memory_region_dispatch_read1 softmmu/memory.c:1424=
:16
>       #5 0x7216ebb9 in memory_region_dispatch_read softmmu/memory.c:1452:=
9
>       #6 0x7212db5d in flatview_read_continue softmmu/physmem.c:2879:23
>       #7 0x7212f958 in flatview_read softmmu/physmem.c:2921:12
>       #8 0x7212f418 in address_space_read_full softmmu/physmem.c:2934:18
>       #9 0x721305a9 in address_space_rw softmmu/physmem.c:2962:16
>       #10 0x7175a392 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
>       #11 0x7175a0ea in dma_memory_rw include/sysemu/dma.h:132:12
>       #12 0x71759684 in dma_memory_read include/sysemu/dma.h:152:12
>       #13 0x7175518c in sdhci_do_adma hw/sd/sdhci.c:823:27
>       #14 0x7174bf69 in sdhci_data_transfer hw/sd/sdhci.c:935:13
>       #15 0x7176aaa7 in sdhci_send_command hw/sd/sdhci.c:376:9
>       #16 0x717629ee in sdhci_write hw/sd/sdhci.c:1212:9
>       #17 0x72172513 in memory_region_write_accessor softmmu/memory.c:492=
:5
>       #18 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
>       #19 0x72170766 in memory_region_dispatch_write softmmu/memory.c:150=
4:16
>       #20 0x721419ee in flatview_write_continue softmmu/physmem.c:2812:23
>       #21 0x721301eb in flatview_write softmmu/physmem.c:2854:12
>       #22 0x7212fca8 in address_space_write softmmu/physmem.c:2950:18
>       #23 0x721d9a53 in qtest_process_command softmmu/qtest.c:727:9
>
> A DMA descriptor is previously filled in RAM. An I/O access to the
> device (frames #22 to #16) start the DMA engine (frame #13). The
> engine fetch the descriptor and execute the request, which itself
> accesses the SDHCI I/O registers (frame #1 and #0), triggering a
> re-entrancy issue.
>
> Fix by prohibit transactions from the DMA to devices. The DMA engine
> is thus restricted to memories.
>
> Reported-by: OSS-Fuzz (Issue 36391)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/451
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sdhci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index fe2f21f0c37..0e5e988927e 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -741,6 +741,7 @@ static void sdhci_do_adma(SDHCIState *s)
>  {
>      unsigned int begin, length;
>      const uint16_t block_size =3D s->blksize & BLOCK_SIZE_MASK;
> +    const MemTxAttrs attrs =3D { .memory =3D true };
>      ADMADescr dscr =3D {};
>      MemTxResult res;
>      int i;
> @@ -794,7 +795,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                      res =3D dma_memory_write(s->dma_as, dscr.addr,
>                                             &s->fifo_buffer[begin],
>                                             s->data_count - begin,
> -                                           MEMTXATTRS_UNSPECIFIED);
> +                                           attrs);
>                      if (res !=3D MEMTX_OK) {
>                          break;
>                      }
> @@ -823,7 +824,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                      res =3D dma_memory_read(s->dma_as, dscr.addr,
>                                            &s->fifo_buffer[begin],
>                                            s->data_count - begin,
> -                                          MEMTXATTRS_UNSPECIFIED);
> +                                          attrs);
>                      if (res !=3D MEMTX_OK) {
>                          break;
>                      }

I wonder how we can fix this for other devices, as this seems to be a
known issue for many years. We've received many reports from the
networking side.

It looks like this patch simply forbids p2p which is probably not the
case for other devices.

I remember there's ideas like using bh from Paolo or detecting
reentrancy in the memory core, both of them seems more general than
this?

Thanks

> --
> 2.33.1
>


