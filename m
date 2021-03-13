Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19D4339E6E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:07:44 +0100 (CET)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL4vf-0004zv-PJ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL4uM-0003vH-Nc
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:06:22 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:39142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL4uK-0004R5-SU
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:06:22 -0500
Received: by mail-ot1-f52.google.com with SMTP id x28so4931258otr.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QPC0oMTcmAg0FWxQRfVCkhe5QaYBzPEMMlsqCKoOPmw=;
 b=s+/PiEMAx1S8gosPIQOuwF15aVjPQJjljIQjJiCQgmTVpBsWW+8WAzfQLNqVy3FzmT
 Qsrue2GP6bEXms8PIlhCNcKhIAXs/Wfeym30lYSRtYakp8irPcS95lmNkhGb5Yv3i05a
 Dadt7ubQRwN75Ipwqw9ITAMZCYtQFt6SYs+hUX3KHOwehKIe0Zs79Ad86WVfI9FT282V
 bya+6qj/RHM2RhbpW2q5MBrFY576I4FzezDVeTc5jgUw/OHv6kBohAzH8Qrz3LlU4doR
 u7q6LXUI7Nd18JKZbDZpD5Q01AzxLDkHBfZbyfvl9RLZ28nS0hmHve9YRheBygaIrzOA
 ltig==
X-Gm-Message-State: AOAM533skQtIIQUu2lkWG9VA1p8VIKC12YFzqblSL3BIm+xgmpgINn5J
 W8BnGkyXBIGbMUuISksb9vFzTbZiLY+ahRO4Lbs=
X-Google-Smtp-Source: ABdhPJw2qhMqTGArtKS0jHgi4yZXtRGO+h+YDfFzxyqzVaLhzdK8ipnZ8Yd3A3kEdc3kJOAMi/Gc5JSD64WTnuvKSvk=
X-Received: by 2002:a05:6830:15cb:: with SMTP id
 j11mr7057133otr.126.1615644378560; 
 Sat, 13 Mar 2021 06:06:18 -0800 (PST)
MIME-Version: 1.0
References: <1535031462-15030-1-git-send-email-ivanovrkasha@gmail.com>
 <CAFgFBfA=DmL318WTO7Lw_UNDiOME016tsXNCB2_qfQJFD5QWpw@mail.gmail.com>
In-Reply-To: <CAFgFBfA=DmL318WTO7Lw_UNDiOME016tsXNCB2_qfQJFD5QWpw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 13 Mar 2021 15:06:07 +0100
Message-ID: <CAAdtpL7XP=PzivtcTU9F9=+gesr-wOG+gFAw-puUQt-1essqsg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH V2] block: increased maximum size of vvfat
 devices
To: =?UTF-8?B?0LDRgNC60LDQtNC40Lkg0LjQstCw0L3QvtCy?= <ivanovrkasha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.52;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 11, 2018 at 7:22 PM =D0=B0=D1=80=D0=BA=D0=B0=D0=B4=D0=B8=D0=B9 =
=D0=B8=D0=B2=D0=B0=D0=BD=D0=BE=D0=B2 <ivanovrkasha@gmail.com> wrote:
>
> Ping?

I'm afraid your patch has fallen through the cracks... Can you rebase
and repost?

>
> Thu, 23 Aug. 2018 at 16:37, Arkasha <ivanovrkasha@gmail.com>:
>
> > This fixes the problem of the impossibility to create
> > FAT16 disks larger than 504 mb:
> > The change CHS made it possible to obtain a larger disk.
> > Also, auto-detection of disk parameters was added depending
> > on the volume of the connected files:
> > The size of all folders and files on the created disk is calculated
> > and the size of the FAT table is added.
> > This size allows to choose the future size of the FAT drive
> > from the standard limitations.
> >
> > Signed-off-by: Arkasha <ivanovrkasha@gmail.com>
> > ---
> >  block/vvfat.c | 96
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 86 insertions(+), 10 deletions(-)
> >
> > diff --git a/block/vvfat.c b/block/vvfat.c
> > index fc41841..4409233 100644
> > --- a/block/vvfat.c
> > +++ b/block/vvfat.c
> > @@ -77,6 +77,47 @@ static void checkpoint(void);
> >  #define DIR_KANJI_FAKE 0x05
> >  #define DIR_FREE 0x00
> >
> > +static bool check_size(uint32_t offset_to_bootsector, int cyls, int he=
ads,
> > +                      int secs, uint8_t sectors_per_cluster, int fat_t=
ype,
> > +                      long int sum, long int size_disk)
> > +{
> > +    uint32_t sector_count =3D cyls * heads * secs - offset_to_bootsect=
or;
> > +    int i =3D 1 + sectors_per_cluster * 0x200 * 8 / fat_type;
> > +    uint16_t sectors_per_fat =3D (sector_count + i) / i;
> > +    /*size + FAT1 and FAT2 table size*/
> > +    if ((sum + sectors_per_fat * 512 * 2) < size_disk) {
> > +        return true;
> > +    }
> > +    return false;
> > +}
> > +
> > +static long int find_size(const char *dirname, unsigned int cluster)
> > +{
> > +    long int sum =3D 0;
> > +    DIR *dir =3D opendir(dirname);
> > +    struct dirent *entry;
> > +    while ((entry =3D readdir(dir))) {
> > +        unsigned int length =3D strlen(dirname) + 2 + strlen(entry->d_=
name);
> > +        char *buffer;
> > +        struct stat st;
> > +        buffer =3D g_malloc(length);
> > +        snprintf(buffer, length, "%s/%s", dirname, entry->d_name);
> > +        if (stat(buffer, &st) < 0) {
> > +            g_free(buffer);
> > +            continue;
> > +        }
> > +        if (strcmp(entry->d_name, ".") && strcmp(entry->d_name, "..")
> > +                                            && S_ISDIR(st.st_mode)) {
> > +            sum +=3D find_size(buffer, cluster);
> > +        }
> > +        g_free(buffer);
> > +        sum +=3D (st.st_size + cluster - 1) / (cluster) * (cluster);
> > +    }
> > +    closedir(dir);
> > +    return sum;
> > +}
> > +
> > +
> >  /* dynamic array functions */
> >  typedef struct array_t {
> >      char* pointer;
> > @@ -948,8 +988,6 @@ static int init_directories(BDRVVVFATState* s,
> >      /* Now build FAT, and write back information into directory */
> >      init_fat(s);
> >
> > -    /* TODO: if there are more entries, bootsector has to be adjusted!=
 */
> > -    s->root_entries =3D 0x02 * 0x10 * s->sectors_per_cluster;
> >      s->cluster_count=3Dsector2cluster(s, s->sector_count);
> >
> >      mapping =3D array_get_next(&(s->mapping));
> > @@ -1154,12 +1192,12 @@ static int vvfat_open(BlockDriverState *bs, QDi=
ct
> > *options, int flags,
> >  {
> >      BDRVVVFATState *s =3D bs->opaque;
> >      int cyls, heads, secs;
> > +    long int size_disk;
> >      bool floppy;
> >      const char *dirname, *label;
> >      QemuOpts *opts;
> >      Error *local_err =3D NULL;
> >      int ret;
> > -
> >  #ifdef DEBUG
> >      vvv =3D s;
> >  #endif
> > @@ -1181,6 +1219,29 @@ static int vvfat_open(BlockDriverState *bs, QDic=
t
> > *options, int flags,
> >
> >      s->fat_type =3D qemu_opt_get_number(opts, "fat-type", 0);
> >      floppy =3D qemu_opt_get_bool(opts, "floppy", false);
> > +    unsigned int cluster;
> > +    long int sum =3D 0;
> > +    if (floppy) {
> > +        if (!s->fat_type) {
> > +            s->sectors_per_cluster =3D 2;
> > +        } else {
> > +            s->sectors_per_cluster =3D 1;
> > +        }
> > +    } else if (s->fat_type =3D=3D 12) {
> > +        s->offset_to_bootsector =3D 0x3f;
> > +        s->sectors_per_cluster =3D 0x10;
> > +    } else {
> > +        s->offset_to_bootsector =3D 0x3f;
> > +        /* LATER TODO: if FAT32, adjust */
> > +        s->sectors_per_cluster =3D 0x80;
> > +    }
> > +
> > +    cluster =3D s->sectors_per_cluster * 0x200;
> > +    sum +=3D find_size(dirname, cluster);
> > +    /* TODO: if there are more entries, bootsector has to be adjusted!=
 */
> > +    s->root_entries =3D 0x02 * 0x10 * s->sectors_per_cluster;
> > +    /*File size + boot sector size + root directory size*/
> > +    sum +=3D 512 + s->root_entries * 32;
> >
> >      memset(s->volume_label, ' ', sizeof(s->volume_label));
> >      label =3D qemu_opt_get(opts, "label");
> > @@ -1201,24 +1262,41 @@ static int vvfat_open(BlockDriverState *bs, QDi=
ct
> > *options, int flags,
> >          if (!s->fat_type) {
> >              s->fat_type =3D 12;
> >              secs =3D 36;
> > -            s->sectors_per_cluster =3D 2;
> >          } else {
> >              secs =3D s->fat_type =3D=3D 12 ? 18 : 36;
> > -            s->sectors_per_cluster =3D 1;
> >          }
> >          cyls =3D 80;
> >          heads =3D 2;
> >      } else {
> > -        /* 32MB or 504MB disk*/
> >          if (!s->fat_type) {
> >              s->fat_type =3D 16;
> >          }
> > -        s->offset_to_bootsector =3D 0x3f;
> > +        size_disk =3D 528482304;
> >          cyls =3D s->fat_type =3D=3D 12 ? 64 : 1024;
> >          heads =3D 16;
> >          secs =3D 63;
> > -    }
> > +        if (!check_size(s->offset_to_bootsector, cyls, heads,
> > +                               secs, s->sectors_per_cluster,
> > +                               s->fat_type, sum, size_disk)) {
> > +            if (s->fat_type > 12) {
> > +                size_disk =3D 4294950912;
> > +                cyls =3D 8322;
> > +                heads =3D 16;
> > +                secs =3D 63;
> >
> > +            } else {
> > +                fprintf(stderr, "Requires Fat16 or Fat32\n");
> > +                return -2;
> > +            }
> > +            if (!check_size(s->offset_to_bootsector, cyls, heads,
> > +                                   secs, s->sectors_per_cluster,
> > +                                   s->fat_type, sum, size_disk)) {
> > +                fprintf(stderr, "Folder is larger than %f GB\n",
> > +                                (float)size_disk / 1073741824);
> > +                return -2;
> > +            }
> > +        }
> > +    }
> >      switch (s->fat_type) {
> >      case 32:
> >          warn_report("FAT32 has not been tested. You are welcome to do
> > so!");
> > @@ -1235,8 +1313,6 @@ static int vvfat_open(BlockDriverState *bs, QDict
> > *options, int flags,
> >
> >      s->bs =3D bs;
> >
> > -    /* LATER TODO: if FAT32, adjust */
> > -    s->sectors_per_cluster=3D0x10;
> >
> >      s->current_cluster=3D0xffffffff;
> >
> > --
> > 2.7.4
> >
> >

