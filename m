Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17893314C0C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 10:48:37 +0100 (CET)
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9PdL-0007gu-SV
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 04:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Paq-00068o-VM; Tue, 09 Feb 2021 04:46:00 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:45870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9Pao-0001ze-18; Tue, 09 Feb 2021 04:46:00 -0500
Received: by mail-yb1-xb31.google.com with SMTP id l8so5179163ybe.12;
 Tue, 09 Feb 2021 01:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kmOIi7ulZn7g+M/nVIVk3YR7qHyx5Pn7hhNCUTV4deU=;
 b=cyDI4keM9ozT5tT/5Y9bIkC0d5291wCDdMgooUxRXHP7Aryf4409xXEgdPtXdVzmWz
 BsagaRuSZOPSfIhj+zMJU5tkpYQj74rgqjQliCuYBf3+g3SrRp1DHDN+YuDQw77ODRuV
 9Toe467DFShSgNm0ASwk9Q3Cp3i/hiV/miSzTM8RzemQx1A5rrrPtV11atKSNbJzwU2X
 5qmZjlwU55WqgaoV60WCUAJyhhd4uE9gHdFvffTrR3vcJKEXWpAaOLow4WSUwNgduL9t
 FqDxqzlAPcBmpqvCuFE2M/zSYQVKGUguwCNiUJKCmek07RIpaFrN5WQ0g+DkDf67Bo+W
 CZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kmOIi7ulZn7g+M/nVIVk3YR7qHyx5Pn7hhNCUTV4deU=;
 b=h/UjUZm8oeTGHzLfatc0yx2lGQCdBuY9wFakXH/KctFVOkkHLvhVKRdTIye9RyURin
 2tD1zEkJI83XozsGBj2qTvUXQ0i/nprgct0/Z8PofQdJFwZiWm7mjHJW6Ja02KfdRFDy
 HMdSAKt2kSt07BDnaFHAG2DltityDx/eXgVvN9aI7cq4nbIUPo+f8z+0FvWmfDUdmu/O
 barwaBEt/F5ZaUW0VH07TEl1R6IE6/oKUYJS4+KaZG7uC+fOfKS22G/3ENQtaWxFMXsG
 6ZLLdL/EQ0bvGLG6f0GHRstLmDQL8mQH/ONSYQa1T+vJt1CDBgIDet5rK53YEYO4tMmx
 QxPg==
X-Gm-Message-State: AOAM531mAlj/wqIGpTjHN8lDxg8S6c4UZoN/mQAzpviy2H+/sMAOWo/i
 xO8jCyOvJaOXNk5uqephJq8bQDnG824WxowplV0=
X-Google-Smtp-Source: ABdhPJwbwa/h+avcN4G0XRFOGSdI87qvwdwgif8dju1ulBB5IlW0rixldM35VA7Vmn8h5CUvgyQGbPr51lXNpe2YpYM=
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr29365437ybm.517.1612863956796; 
 Tue, 09 Feb 2021 01:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20210208193450.2689517-1-f4bug@amsat.org>
 <CAEUhbmUECh5oZueWZPNWc-ZAkF6XExhrT28R0wfCWDx1Vpeo+g@mail.gmail.com>
 <d806c94d-8d52-5401-93eb-c8698728ee52@amsat.org>
 <CAEUhbmV=azYzfDvM8m-WiKQzio3Z0TGsctRmQEzPp7tDHbx4eA@mail.gmail.com>
In-Reply-To: <CAEUhbmV=azYzfDvM8m-WiKQzio3Z0TGsctRmQEzPp7tDHbx4eA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 9 Feb 2021 17:45:45 +0800
Message-ID: <CAEUhbmVJ1-2yBCZ+g1xfoSatTOtbpGNdmo=PW_cjqKsPDETHEQ@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: Do not modify BlockSizeRegister if
 transaction in progress
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb31.google.com
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@163.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Prasad J Pandit <ppandit@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Oops, hitting "send" by mistake ...

On Tue, Feb 9, 2021 at 5:42 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Philippe,
>
> On Tue, Feb 9, 2021 at 5:38 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> >
> > On 2/9/21 9:28 AM, Bin Meng wrote:
> > > Hi Philippe,
> > >
> > > On Tue, Feb 9, 2021 at 3:34 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> > >>
> > >> Per the "SD Host Controller Simplified Specification Version 2.00"
> > >> spec. 'Table 2-4 : Block Size Register':
> > >>
> > >>   Transfer Block Size [...] can be accessed only if no
> > >>   transaction is executing (i.e., after a transaction has stopped).
> > >>   Read operations during transfers may return an invalid value,
> > >>   and write operations shall be ignored.
> > >>
> > >> Transactions will update 'data_count', so do not modify 'blksize'
> > >> and 'blkcnt' when 'data_count' is used. This fixes:
> > >>
> > >> $ cat << EOF | qemu-system-x86_64 -qtest stdio -monitor none \
> > >>                -nographic -serial none -M pc-q35-5.0 \
> > >>                -device sdhci-pci,sd-spec-version=3D3 \
> > >>                -device sd-card,drive=3Dmydrive \
> > >>                -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Dr=
aw,id=3Dmydrive
> > >>   outl 0xcf8 0x80001810
> > >>   outl 0xcfc 0xe1068000
> > >>   outl 0xcf8 0x80001814
> > >
> > > Is this command needed?
> >
> > My guess is this makes the northbridge somehow map the device PCI space=
.
> >
> > Probably not needed in machines where SDHCI is MMIO mapped.
>
> I think this is not needed. Writing only the CFG_ADDR

I think this is not needed. Writing only the CFG_ADDR without wring
CFG_DATA does not take any effect.

>
> >
> > >
> > >>   outl 0xcf8 0x80001804
> > >>   outw 0xcfc 0x7
> > >>   outl 0xcf8 0x8000fa20
> > >
> > > and this one?
> >
> > Ditto.
> >
> > >
> > >>   write 0xe106802c 0x1 0x0f
> > >>   write 0xe1068004 0xc 0x2801d10101fffffbff28a384
> > >
> > > Are these fuzzy data?
> >
> > Yes, I didn't try to understand what this does, as often
> > non-sense operations. But this is what would craft a malicious
> > attacker.
> >
> > >
> > >>   write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9=
d8e7f60514233241505f
> > >>   write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80=
d000254c80d000255a80d000256880d0002576
> > >>   write 0xe1068003 0x1 0xfe
> > >>   EOF
> > >>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>   =3D=3D2686219=3D=3DERROR: AddressSanitizer: heap-buffer-overflow o=
n address 0x61500003bb00 at pc 0x55ab469f456c bp 0x7ffee71be330 sp 0x7ffee7=
1bdae0
> > >>   WRITE of size 4 at 0x61500003bb00 thread T0
> > >>       #0 0x55ab469f456b in __asan_memcpy (qemu-system-i386+0x1cea56b=
)
> > >>       #1 0x55ab483dc396 in stl_he_p include/qemu/bswap.h:353:5
> > >>       #2 0x55ab483af5e4 in stn_he_p include/qemu/bswap.h:546:1
> > >>       #3 0x55ab483aeb4b in flatview_read_continue softmmu/physmem.c:=
2839:13
> > >>       #4 0x55ab483b0705 in flatview_read softmmu/physmem.c:2877:12
> > >>       #5 0x55ab483b028e in address_space_read_full softmmu/physmem.c=
:2890:18
> > >>       #6 0x55ab483b1294 in address_space_rw softmmu/physmem.c:2918:1=
6
> > >>       #7 0x55ab479374a2 in dma_memory_rw_relaxed include/sysemu/dma.=
h:88:12
> > >>       #8 0x55ab47936f50 in dma_memory_rw include/sysemu/dma.h:127:12
> > >>       #9 0x55ab4793665f in dma_memory_read include/sysemu/dma.h:145:=
12
> > >>       #10 0x55ab4792f176 in sdhci_sdma_transfer_multi_blocks hw/sd/s=
dhci.c:639:13
> > >>       #11 0x55ab4793dc9d in sdhci_write hw/sd/sdhci.c:1129:17
> > >>       #12 0x55ab483f8db8 in memory_region_write_accessor softmmu/mem=
ory.c:491:5
> > >>       #13 0x55ab483f868a in access_with_adjusted_size softmmu/memory=
.c:552:18
> > >>       #14 0x55ab483f6da5 in memory_region_dispatch_write softmmu/mem=
ory.c:1501:16
> > >>       #15 0x55ab483c3b11 in flatview_write_continue softmmu/physmem.=
c:2774:23
> > >>       #16 0x55ab483b0eb6 in flatview_write softmmu/physmem.c:2814:14
> > >>       #17 0x55ab483b0a3e in address_space_write softmmu/physmem.c:29=
06:18
> > >>       #18 0x55ab48465c56 in qtest_process_command softmmu/qtest.c:65=
4:9
> > >>
> > >>   0x61500003bb00 is located 0 bytes to the right of 512-byte region =
[0x61500003b900,0x61500003bb00)
> > >>   allocated by thread T0 here:
> > >>       #0 0x55ab469f58a7 in calloc (qemu-system-i386+0x1ceb8a7)
> > >>       #1 0x7f21d678f9b0 in g_malloc0 (/lib64/libglib-2.0.so.0+0x589b=
0)
> > >>       #2 0x55ab479530ed in sdhci_pci_realize hw/sd/sdhci-pci.c:36:5
> > >>       #3 0x55ab476f102a in pci_qdev_realize hw/pci/pci.c:2108:9
> > >>       #4 0x55ab48baaad2 in device_set_realized hw/core/qdev.c:761:13
> > >>
> > >>   SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-system-i386+=
0x1cea56b) in __asan_memcpy
> > >>   Shadow bytes around the buggy address:
> > >>     0x0c2a7ffff710: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > >>     0x0c2a7ffff720: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >>     0x0c2a7ffff730: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >>     0x0c2a7ffff740: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >>     0x0c2a7ffff750: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >>   =3D>0x0c2a7ffff760:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa f=
a
> > >>     0x0c2a7ffff770: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> > >>     0x0c2a7ffff780: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> > >>     0x0c2a7ffff790: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> > >>     0x0c2a7ffff7a0: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> > >>     0x0c2a7ffff7b0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> > >>   Shadow byte legend (one shadow byte represents 8 application bytes=
):
> > >>     Addressable:           00
> > >>     Heap left redzone:       fa
> > >>     Freed heap region:       fd
> > >>   =3D=3D2686219=3D=3DABORTING
> > >>
> > >> Fixes: CVE-2020-17380
> > >> Fixes: CVE-2020-25085
> > >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > >> ---
> > >> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> > >> Cc: Alexander Bulekov <alxndr@bu.edu>
> > >> Cc: Alistair Francis <alistair.francis@wdc.com>
> > >> Cc: Prasad J Pandit <ppandit@redhat.com>
> > >> Cc: Bandan Das <bsd@redhat.com>
> > >>
> > >> RFC because missing Reported-by tags, launchpad/bugzilla links and
> > >> qtest reproducer. Sending for review meanwhile.
> > >> ---
> > >>  hw/sd/sdhci.c | 6 ++++++
> > >>  1 file changed, 6 insertions(+)
> > >>
> > >> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > >> index 8ffa53999d8..7ac7d9af9e4 100644
> > >> --- a/hw/sd/sdhci.c
> > >> +++ b/hw/sd/sdhci.c
> > >> @@ -1133,6 +1133,12 @@ sdhci_write(void *opaque, hwaddr offset, uint=
64_t val, unsigned size)
> > >>          }
> > >>          break;
> > >>      case SDHC_BLKSIZE:
> > >> +        if (s->data_count) {
> > >> +            qemu_log_mask(LOG_GUEST_ERROR,
> > >> +                          "%s: Can not update blksize when"
> > >> +                          " transaction is executing\n", __func__);
> > >> +            break;
> > >> +        }
> > >>          if (!TRANSFERRING_DATA(s->prnsts)) {
> > >
> > > I am not sure I get the whole picture here.
> >
> > The problem is out of bound access on fifo_buffer.
> >
> > > Isn't write to s->blksize and s->blkcnt already protected in this if
> > > () statement?

I tried to follow the CVE link from
https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2020-25085 which
gave me:
https://bugs.launchpad.net/qemu/+bug/1892960

The above page says this CVE is already fixed, so I am lost.

> >
> > I tried this code but it didn't work:
> >
> > -- >8 --
> > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > index 8ffa53999d8..182641ae98a 100644
> > --- a/hw/sd/sdhci.c
> > +++ b/hw/sd/sdhci.c
> > @@ -584,6 +584,11 @@ static void
> > sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
> >      uint32_t boundary_chk =3D 1 << (((s->blksize & ~BLOCK_SIZE_MASK) >=
>
> > 12) + 12);
> >      uint32_t boundary_count =3D boundary_chk - (s->sdmasysad % boundar=
y_chk);
> >
> > +    if (TRANSFERRING_DATA(s->prnsts)) {
> > +        qemu_log_mask(LOG_GUEST_ERROR,
> > +                      "%s: Transfer already in progress", __func__);
> > +        return;
> > +    }
> >      if (!(s->trnmod & SDHC_TRNS_BLK_CNT_EN) || !s->blkcnt) {
> >          qemu_log_mask(LOG_UNIMP, "infinite transfer is not supported\n=
");
> >          return;
> > ---
> >
> > Do you think we need both?
> >
> > Maybe we miss to set a bit in s->prnsts somewhere...

Probably, but I need to take a further look.

Regards,
Bin

