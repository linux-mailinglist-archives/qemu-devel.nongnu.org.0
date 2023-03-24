Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379EF6C7F9F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:14:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pffBC-00044v-VQ; Fri, 24 Mar 2023 07:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pffB9-00044Z-TM
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:01:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pffAf-0002Y5-Np
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 07:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679655673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u+nMKLLFlXI/oaUI1Xhxe/1oRvijR034XE3od9w2VxM=;
 b=LLv0awyDG6X3Xb9e45PUlXr22FeLo0sGPRYw4qzSl0mSUO8+ZssGdt8YpBnnBFJhx0g+CI
 Ep/elMgiHEDHQ8mdZmv7PRzDyVQ0RSvm1X6mk4LbLWF8uMNW0tMQz+fo+E3qIDihr9KwXg
 Weekx2ij2lZb35M4TrbMMJxT8H+lhMk=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-Gwso6XdXNByxoLCHDlzRlg-1; Fri, 24 Mar 2023 07:01:11 -0400
X-MC-Unique: Gwso6XdXNByxoLCHDlzRlg-1
Received: by mail-ua1-f72.google.com with SMTP id
 w24-20020ab00918000000b0075e9c7ffadfso867907uag.13
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 04:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679655671;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+nMKLLFlXI/oaUI1Xhxe/1oRvijR034XE3od9w2VxM=;
 b=AjNbBmu9kAGcCwxsTiSvPUNEeAWfa0HZlxv9wZ8oQrKgBbAEuELZkKgkKWC5+TO4Te
 nok4LaSidSGXFl2Eqwrqh0n/8GfI2M13Hp3keA/OqaKS22Xco8mUG6MWzLDtqPzLgz01
 yugjvaHVODCP0ytOyF6fZPeB3H/gtOuakdIFlwywo1x1kCq06URVgXoYocFfBD0wfoKa
 5CHOvtzquwkgQsGjYukq+8hiHKXcRpZ7voWCN62uS78ICQr/zE0iIdi4EyxlcKwlywer
 /9zA0dqypdCaK7QoRiXFPX7pWvLuVjdQ0AUq7e1tk9N17fVbUVotRvdYhJKhRc1MEcuD
 T6sg==
X-Gm-Message-State: AAQBX9c64BekA/qYSruyXmYeOX2ygF8ufYaj8PJGPJ5YACxsuqQkB+3P
 5NrTVzSR4dGkR2/+uZKZMOK+2/LnWBDYUUCzSlwqqb2F/jz8lNcyY3h44/uIuVvP0Q7VexYURS9
 7Cl9ZsOVsGq4pNW2s7jtBoNFwwGXPx3A=
X-Received: by 2002:a67:c202:0:b0:425:d096:fd42 with SMTP id
 i2-20020a67c202000000b00425d096fd42mr1055126vsj.5.1679655669586; 
 Fri, 24 Mar 2023 04:01:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgLjCe4HzYDbPbZzsxbYZguFslqAYn98ut3Ke4jMebpyvrppuc9QD7tWhL/ncBd4RaEgxqUbaTTRIFEqQMkxA=
X-Received: by 2002:a67:c202:0:b0:425:d096:fd42 with SMTP id
 i2-20020a67c202000000b00425d096fd42mr1055117vsj.5.1679655669315; Fri, 24 Mar
 2023 04:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230116204232.1142442-1-mcascell@redhat.com>
 <110DADE7-A361-4F53-B735-B926C40C0B9B@oracle.com>
 <b84a7f60-f0de-b9e5-254f-3c3c649a08e1@linaro.org>
In-Reply-To: <b84a7f60-f0de-b9e5-254f-3c3c649a08e1@linaro.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 24 Mar 2023 12:00:58 +0100
Message-ID: <CAA8xKjUV8LQ5=ZTwoGo9+Xj1fMMyF1ffXL84U8r1vnfXiFrDGg@mail.gmail.com>
Subject: Re: [PATCH] scsi/lsi53c895a: restrict DMA engine to memory regions
 (CVE-2023-0330)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Karl Heubaum <karl.heubaum@oracle.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "alxndr@bu.edu" <alxndr@bu.edu>, 
 "zheyuma97@gmail.com" <zheyuma97@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Mar 17, 2023 at 10:59=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 17/3/23 19:18, Karl Heubaum wrote:
> > Did this CVE fix fall in the cracks during the QEMU 8.0 merge window?
>
> The patch isn't reviewed, and apparently almost no active contributor
> understand this device enough to be sure this security patch doesn't
> break normal use. Fuzzed bugs are rarely trivial.

I guess Alexander's new patchset [1] does not help fix this one?

[1] https://patchew.org/QEMU/20230313082417.827484-1-alxndr@bu.edu/20230313=
082417.827484-7-alxndr@bu.edu/


> >> On Jan 16, 2023, at 2:42 PM, Mauro Matteo Cascella <mcascell@redhat.co=
m> wrote:
> >>
> >> This prevents the well known DMA-MMIO reentrancy problem (upstream iss=
ue #556)
> >> leading to memory corruption bugs like stack overflow or use-after-fre=
e.
> >>
> >> Fixes: CVE-2023-0330
> >> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> >> Reported-by: Zheyu Ma <zheyuma97@gmail.com>
> >> ---
> >> hw/scsi/lsi53c895a.c               | 14 +++++++++----
> >> tests/qtest/fuzz-lsi53c895a-test.c | 32 ++++++++++++++++++++++++++++++
> >> 2 files changed, 42 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
> >> index af93557a9a..89c52594eb 100644
> >> --- a/hw/scsi/lsi53c895a.c
> >> +++ b/hw/scsi/lsi53c895a.c
> >> @@ -446,22 +446,28 @@ static void lsi_reselect(LSIState *s, lsi_reques=
t *p);
> >> static inline void lsi_mem_read(LSIState *s, dma_addr_t addr,
> >>                                 void *buf, dma_addr_t len)
> >> {
> >> +    const MemTxAttrs attrs =3D { .memory =3D true };
> >> +
> >>      if (s->dmode & LSI_DMODE_SIOM) {
> >> -        address_space_read(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFIE=
D,
> >> +        address_space_read(&s->pci_io_as, addr, attrs,
> >>                             buf, len);
> >>      } else {
> >> -        pci_dma_read(PCI_DEVICE(s), addr, buf, len);
> >> +        pci_dma_rw(PCI_DEVICE(s), addr, buf, len,
> >> +                      DMA_DIRECTION_TO_DEVICE, attrs);
> >>      }
> >> }
> >>
> >> static inline void lsi_mem_write(LSIState *s, dma_addr_t addr,
> >>                                  const void *buf, dma_addr_t len)
> >> {
> >> +    const MemTxAttrs attrs =3D { .memory =3D true };
> >> +
> >>      if (s->dmode & LSI_DMODE_DIOM) {
> >> -        address_space_write(&s->pci_io_as, addr, MEMTXATTRS_UNSPECIFI=
ED,
> >> +        address_space_write(&s->pci_io_as, addr, attrs,
> >>                              buf, len);
> >>      } else {
> >> -        pci_dma_write(PCI_DEVICE(s), addr, buf, len);
> >> +        pci_dma_rw(PCI_DEVICE(s), addr, (void *) buf, len,
> >> +                      DMA_DIRECTION_FROM_DEVICE, attrs);
> >>      }
> >> }
> >>
> >> diff --git a/tests/qtest/fuzz-lsi53c895a-test.c b/tests/qtest/fuzz-lsi=
53c895a-test.c
> >> index 392a7ae7ed..35c02e89f3 100644
> >> --- a/tests/qtest/fuzz-lsi53c895a-test.c
> >> +++ b/tests/qtest/fuzz-lsi53c895a-test.c
> >> @@ -8,6 +8,35 @@
> >> #include "qemu/osdep.h"
> >> #include "libqtest.h"
> >>
> >> +/*
> >> + * This used to trigger a DMA reentrancy issue
> >> + * leading to memory corruption bugs like stack
> >> + * overflow or use-after-free
> >> + */
> >> +static void test_lsi_dma_reentrancy(void)
> >> +{
> >> +    QTestState *s;
> >> +
> >> +    s =3D qtest_init("-M q35 -m 512M -nodefaults "
> >> +                   "-blockdev driver=3Dnull-co,node-name=3Dnull0 "
> >> +                   "-device lsi53c810 -device scsi-cd,drive=3Dnull0")=
;
> >> +
> >> +    qtest_outl(s, 0xcf8, 0x80000804); /* PCI Command Register */
> >> +    qtest_outw(s, 0xcfc, 0x7);        /* Enables accesses */
> >> +    qtest_outl(s, 0xcf8, 0x80000814); /* Memory Bar 1 */
> >> +    qtest_outl(s, 0xcfc, 0xff100000); /* Set MMIO Address*/
> >> +    qtest_outl(s, 0xcf8, 0x80000818); /* Memory Bar 2 */
> >> +    qtest_outl(s, 0xcfc, 0xff000000); /* Set RAM Address*/
> >> +    qtest_writel(s, 0xff000000, 0xc0000024);
> >> +    qtest_writel(s, 0xff000114, 0x00000080);
> >> +    qtest_writel(s, 0xff00012c, 0xff000000);
> >> +    qtest_writel(s, 0xff000004, 0xff000114);
> >> +    qtest_writel(s, 0xff000008, 0xff100014);
> >> +    qtest_writel(s, 0xff10002f, 0x000000ff);
> >> +
> >> +    qtest_quit(s);
> >> +}
> >> +
> >> /*
> >>   * This used to trigger a UAF in lsi_do_msgout()
> >>   * https://gitlab.com/qemu-project/qemu/-/issues/972
> >> @@ -120,5 +149,8 @@ int main(int argc, char **argv)
> >>      qtest_add_func("fuzz/lsi53c895a/lsi_do_msgout_cancel_req",
> >>                     test_lsi_do_msgout_cancel_req);
> >>
> >> +    qtest_add_func("fuzz/lsi53c895a/lsi_dma_reentrancy",
> >> +                   test_lsi_dma_reentrancy);
> >> +
> >>      return g_test_run();
> >> }
> >> --
> >> 2.39.0
> >>
> >>
> >
>


--
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


