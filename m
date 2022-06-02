Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7AD53B0EE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:22:02 +0200 (CEST)
Received: from localhost ([::1]:43698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZXF-0006C5-Ky
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:22:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZRD-00023E-Fl
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:15:47 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:43021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZRB-0006tr-Cp
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:15:47 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f2bb84f9edso4942247fac.10
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vewSSbETMJWOQ9WV8qtV7QxGQVf23zqkgbi1ckFc0fE=;
 b=jq1fD9fwsMXOzx02AW+9pvL9ARRvg8kO8xgv5ewYwGlqHgs5q8BP64qC+BdNx9RONG
 p7FhtNxuUGz8r/b8AaKiSajZqwFN0L59Jf2PdgjuuY2L53Ql4X2/fvFSntyKCuWcspR5
 pfeJEgFRyibz4w4DthWG3m0YbAFUuwrzafq1lwzejqkmeA5mpulIBSW608R7T1izDMkb
 zyDX7Os/iL54+wyOUr2eeHG8mc0VlH6TxUqTmGamIF9GYiF+4OTBz8sx7unCNvgGO7Ew
 HzQjDPCGxh+Z5e9ckaye+DasmszzPU8lzeKPvRv/FtKYPwMU7p6eZjTfaLMuLmYc7w8c
 fHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vewSSbETMJWOQ9WV8qtV7QxGQVf23zqkgbi1ckFc0fE=;
 b=rI/enNcwshLVOyjovf/idDOf7wDIEc1h1fovNAFwYjRO9iIK1P5GuM5uQiRUKQwkXB
 pVEwhU/Ypw/5oboD6P+Xr/0YSfYzt3jUMMYkqUCe4uX47nFA7QQqsvFSZ9ceiA7VvKuT
 uQRNsWijW0lw2jPWXgAaz5F2YFqFrgI8c4aoKJHAcMZj79S5P279JkBSMHmGrRvcBf+c
 W/IuP+F7QHBLZGxK1fBuJOB5DFl19PYiutFJUwbytBgePgN74pOagqOhHciBqa2gqVh7
 dJv7tYO6YOFumHosgBzA0f4VDmExgZetcYeU1Y/G4tm+oNK6sCRIqWhEzvF1+TqtTbVU
 GL0w==
X-Gm-Message-State: AOAM533fJ/603CeHszK4xogLasHVBHKPHWniXb/er2GKtjPm5uQVMZyw
 7hNMovSs9atogC5YfLGbUCpjekRGgERx4WwN/NY=
X-Google-Smtp-Source: ABdhPJyUDAv2m6s6lq5Zhe75Qt8J0BkbbE3L3SAjJ592oSFn+MFCuyuD0f2n6+dph5oJIDrm69g5PTFKCec4tvOK1a4=
X-Received: by 2002:a05:6870:2047:b0:e9:1b34:fbe with SMTP id
 l7-20020a056870204700b000e91b340fbemr18671579oad.64.1654132544069; Wed, 01
 Jun 2022 18:15:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220427230716.2158127-1-pcc@google.com>
 <282e67cb-53b8-c7b9-a496-eda44d8a5e2b@amsat.org>
In-Reply-To: <282e67cb-53b8-c7b9-a496-eda44d8a5e2b@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 11:15:18 +1000
Message-ID: <CAKmqyKP_OaR9CWzMWqvbuqbuXF6ex8kBFiiZtnxa4xAimh9Gpg@mail.gmail.com>
Subject: Re: [PATCH] loader: support loading large files (>=2GB)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Collingbourne <pcc@google.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jamie Iles <jamie@nuviainc.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Luc Michel <lmichel@kalray.eu>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 31, 2022 at 12:59 AM Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> Hi Peter,
>
> On 28/4/22 01:07, Peter Collingbourne wrote:
> > Currently the loader uses int as the return type for various APIs
> > that deal with file sizes, which leads to an error if the file
> > size is >=3D2GB, as it ends up being interpreted as a negative error
> > code. Furthermore, we do not tolerate short reads, which are possible
> > at least on Linux when attempting to read such large files in one
> > syscall.
> >
> > Fix the first problem by switching to 64-bit types for file sizes,
> > and fix the second by introducing a loop around the read syscall.
>
> Hmm maybe worth rebasing on this patch from Jamie which also
> fixes the format on 32-bit hosts:
> https://lore.kernel.org/qemu-devel/20211111141141.3295094-2-jamie@nuviain=
c.com/
>
> (Personally I prefer to read ssize_t while reviewing instead
> of int64_t).

I agree with ssize_t as well, I have applied the patch from Jamie
which had fallen through the cracks.

If you can rebase this on top of the RISC-V queue and re-send it I'll
apply the other changes

Alistair

>
> While here, please have a look at this other patch from Jamie:
> https://lore.kernel.org/qemu-devel/20211111141141.3295094-3-jamie@nuviain=
c.com/
>
> Also, Cc'ing the maintainer:
>
> $ ./scripts/get_maintainer.pl -f hw/core/generic-loader.c
> Alistair Francis <alistair@alistair23.me> (maintainer:Generic Loader)
>
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> >   hw/core/generic-loader.c |  2 +-
> >   hw/core/loader.c         | 44 ++++++++++++++++++++++++---------------=
-
> >   include/hw/loader.h      | 13 ++++++------
> >   3 files changed, 34 insertions(+), 25 deletions(-)
> >
> > diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> > index c666545aa0..0891fa73c3 100644
> > --- a/hw/core/generic-loader.c
> > +++ b/hw/core/generic-loader.c
> > @@ -67,7 +67,7 @@ static void generic_loader_realize(DeviceState *dev, =
Error **errp)
> >       GenericLoaderState *s =3D GENERIC_LOADER(dev);
> >       hwaddr entry;
> >       int big_endian;
> > -    int size =3D 0;
> > +    int64_t size =3D 0;
> >
> >       s->set_pc =3D false;
> >
> > diff --git a/hw/core/loader.c b/hw/core/loader.c
> > index ca2f2431fb..d07c79c400 100644
> > --- a/hw/core/loader.c
> > +++ b/hw/core/loader.c
> > @@ -115,17 +115,17 @@ ssize_t read_targphys(const char *name,
> >       return did;
> >   }
> >
> > -int load_image_targphys(const char *filename,
> > -                        hwaddr addr, uint64_t max_sz)
> > +int64_t load_image_targphys(const char *filename,
> > +                            hwaddr addr, uint64_t max_sz)
> >   {
> >       return load_image_targphys_as(filename, addr, max_sz, NULL);
> >   }
> >
> >   /* return the size or -1 if error */
> > -int load_image_targphys_as(const char *filename,
> > -                           hwaddr addr, uint64_t max_sz, AddressSpace =
*as)
> > +int64_t load_image_targphys_as(const char *filename,
> > +                               hwaddr addr, uint64_t max_sz, AddressSp=
ace *as)
> >   {
> > -    int size;
> > +    int64_t size;
> >
> >       size =3D get_image_size(filename);
> >       if (size < 0 || size > max_sz) {
> > @@ -139,9 +139,9 @@ int load_image_targphys_as(const char *filename,
> >       return size;
> >   }
> >
> > -int load_image_mr(const char *filename, MemoryRegion *mr)
> > +int64_t load_image_mr(const char *filename, MemoryRegion *mr)
> >   {
> > -    int size;
> > +    int64_t size;
> >
> >       if (!memory_access_is_direct(mr, false)) {
> >           /* Can only load an image into RAM or ROM */
> > @@ -963,7 +963,8 @@ int rom_add_file(const char *file, const char *fw_d=
ir,
> >   {
> >       MachineClass *mc =3D MACHINE_GET_CLASS(qdev_get_machine());
> >       Rom *rom;
> > -    int rc, fd =3D -1;
> > +    int fd =3D -1;
> > +    size_t bytes_read =3D 0;
> >       char devpath[100];
> >
> >       if (as && mr) {
> > @@ -1003,11 +1004,17 @@ int rom_add_file(const char *file, const char *=
fw_dir,
> >       rom->datasize =3D rom->romsize;
> >       rom->data     =3D g_malloc0(rom->datasize);
> >       lseek(fd, 0, SEEK_SET);
> > -    rc =3D read(fd, rom->data, rom->datasize);
> > -    if (rc !=3D rom->datasize) {
> > -        fprintf(stderr, "rom: file %-20s: read error: rc=3D%d (expecte=
d %zd)\n",
> > -                rom->name, rc, rom->datasize);
> > -        goto err;
> > +    while (bytes_read < rom->datasize) {
> > +        ssize_t rc =3D
> > +            read(fd, rom->data + bytes_read, rom->datasize - bytes_rea=
d);
> > +        if (rc <=3D 0) {
> > +            fprintf(stderr,
> > +                    "rom: file %-20s: read error: rc=3D%zd at position=
 %zd "
> > +                    "(expected size %zd)\n",
> > +                    rom->name, rc, bytes_read, rom->datasize);
> > +            goto err;
> > +        }
> > +        bytes_read +=3D rc;
> >       }
> >       close(fd);
> >       rom_insert(rom);
> > @@ -1671,7 +1678,7 @@ typedef struct {
> >       HexLine line;
> >       uint8_t *bin_buf;
> >       hwaddr *start_addr;
> > -    int total_size;
> > +    int64_t total_size;
> >       uint32_t next_address_to_write;
> >       uint32_t current_address;
> >       uint32_t current_rom_index;
> > @@ -1767,8 +1774,8 @@ static int handle_record_type(HexParser *parser)
> >   }
> >
> >   /* return size or -1 if error */
> > -static int parse_hex_blob(const char *filename, hwaddr *addr, uint8_t =
*hex_blob,
> > -                          size_t hex_blob_size, AddressSpace *as)
> > +static int64_t parse_hex_blob(const char *filename, hwaddr *addr, uint=
8_t *hex_blob,
> > +                              size_t hex_blob_size, AddressSpace *as)
> >   {
> >       bool in_process =3D false; /* avoid re-enter and
> >                                 * check whether record begin with ':' *=
/
> > @@ -1832,11 +1839,12 @@ out:
> >   }
> >
> >   /* return size or -1 if error */
> > -int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressS=
pace *as)
> > +int64_t load_targphys_hex_as(const char *filename, hwaddr *entry,
> > +                             AddressSpace *as)
> >   {
> >       gsize hex_blob_size;
> >       gchar *hex_blob;
> > -    int total_size =3D 0;
> > +    int64_t total_size =3D 0;
> >
> >       if (!g_file_get_contents(filename, &hex_blob, &hex_blob_size, NUL=
L)) {
> >           return -1;
> > diff --git a/include/hw/loader.h b/include/hw/loader.h
> > index 5572108ba5..7b09705940 100644
> > --- a/include/hw/loader.h
> > +++ b/include/hw/loader.h
> > @@ -40,8 +40,8 @@ ssize_t load_image_size(const char *filename, void *a=
ddr, size_t size);
> >    *
> >    * Returns the size of the loaded image on success, -1 otherwise.
> >    */
> > -int load_image_targphys_as(const char *filename,
> > -                           hwaddr addr, uint64_t max_sz, AddressSpace =
*as);
> > +int64_t load_image_targphys_as(const char *filename,
> > +                               hwaddr addr, uint64_t max_sz, AddressSp=
ace *as);
> >
> >   /**load_targphys_hex_as:
> >    * @filename: Path to the .hex file
> > @@ -53,14 +53,15 @@ int load_image_targphys_as(const char *filename,
> >    *
> >    * Returns the size of the loaded .hex file on success, -1 otherwise.
> >    */
> > -int load_targphys_hex_as(const char *filename, hwaddr *entry, AddressS=
pace *as);
> > +int64_t load_targphys_hex_as(const char *filename, hwaddr *entry,
> > +                             AddressSpace *as);
> >
> >   /** load_image_targphys:
> >    * Same as load_image_targphys_as(), but doesn't allow the caller to =
specify
> >    * an AddressSpace.
> >    */
> > -int load_image_targphys(const char *filename, hwaddr,
> > -                        uint64_t max_sz);
> > +int64_t load_image_targphys(const char *filename, hwaddr,
> > +                            uint64_t max_sz);
> >
> >   /**
> >    * load_image_mr: load an image into a memory region
> > @@ -73,7 +74,7 @@ int load_image_targphys(const char *filename, hwaddr,
> >    * If the file is larger than the memory region's size the call will =
fail.
> >    * Returns -1 on failure, or the size of the file.
> >    */
> > -int load_image_mr(const char *filename, MemoryRegion *mr);
> > +int64_t load_image_mr(const char *filename, MemoryRegion *mr);
> >
> >   /* This is the limit on the maximum uncompressed image size that
> >    * load_image_gzipped_buffer() and load_image_gzipped() will read. It=
 prevents
>
>

