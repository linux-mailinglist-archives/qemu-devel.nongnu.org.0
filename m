Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A7025F17C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 03:30:16 +0200 (CEST)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kF5z5-000835-F0
	for lists+qemu-devel@lfdr.de; Sun, 06 Sep 2020 21:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kF5yM-0007Y4-Kk; Sun, 06 Sep 2020 21:29:30 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:39046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kF5yK-0004fb-Ef; Sun, 06 Sep 2020 21:29:30 -0400
Received: by mail-ej1-x641.google.com with SMTP id p9so16025499ejf.6;
 Sun, 06 Sep 2020 18:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BvtoGOlvLBRcnu/q+h67/LlbzISIENb2TbAPWjfWCf8=;
 b=VzGOCsRNl7sHVoDtdF/8zCNPEWQOYhXit20Gbm2QqJLsSE2sZHDxw0w5kKIEcCzYzy
 R3CLcHKLfoN4oj+sFCVg+QaCvOviurVQX1pDO0GPindcm9c9P5WZ8ddsWHaY0R6m1hu7
 omXiFOv9mwPQrJ2cxEyzBaYZDq842oDFsfVy3s9OUnAHtc21rPfHQIfdi72i9K9BUjFN
 R9XPO1zwp9wbNKFb89DpkxyOXbDdecaBiPzHo7hCMeKvhVa3i1rbOFfhKfFUv+P0MU5Z
 Qw6b79YeHFMPsF4+UlzW7CgGf4y+z3VRLhTb2pWSvOtVAGu1gdUeQb5lUC8KAFmX194V
 suew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BvtoGOlvLBRcnu/q+h67/LlbzISIENb2TbAPWjfWCf8=;
 b=HgPIxB98aY4ie5uHTzvUX4kR8rirX3RYEdnG8uXVvbK9ZatqVBfPAgmtNwTwlzL/8H
 fFj+pUry7OVNuE1UmsEux+vj+ypK/2j2D73oTA4WaiiFokOj+K+NrS+7SDfSB4cn0uqS
 j62oAwgYg1XnEpQ9fLVKPC+PUYUfsyf4c0HsCiGp4djk/DTGl313b4UvD1BuvhOPLQCa
 qo0DXFkIs0mltvYVBPDgsSuelSlljQjJGc4H97mE6lk2a2dJvDq4KmoJl6Pn9RFkxvuq
 +fXKYYkLACdVNq+wXobGI25LSkECzt5B13WjFH/Y9IaN5bxQmmPBCNgOaXbdDL8H3RVS
 QN5g==
X-Gm-Message-State: AOAM531veyMD4LmEvpQoM0KWKeHpFNlF+qqubSPU6w1vRkXyCgirPZGI
 OEIucyGncqsbZFazczVtcz0IYy9e5XhYkohPMBk=
X-Google-Smtp-Source: ABdhPJwXIzMjRUemk7Ty/aLYFUI1BSqT8vnem95dGGv1DycwcuSeCJbUwLnFmeTTwZBHoCumc7crXW00GKpgiJl0XUM=
X-Received: by 2002:a17:906:8258:: with SMTP id
 f24mr4974901ejx.551.1599442166088; 
 Sun, 06 Sep 2020 18:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200904020907.241550-1-tom.ty89@gmail.com>
 <20200904020907.241550-2-tom.ty89@gmail.com>
 <CAGnHSEnF--OJ9biTx_ZxgqizVtr+0rBL8o-b9wY9+XNsnLPV=A@mail.gmail.com>
 <CAGnHSE=qnj8a8qaS6eiFdevp6ya0GjqXHuDgAV12B0tEAajddg@mail.gmail.com>
 <f5f5a6e2f4cc75c84e1364ab1276ee22aa5e3748.camel@redhat.com>
 <CAGnHSEkdTBBdT-Dm1Ztazq-ZxkLU5zq=3kYa_uiqna2uzm0Gkg@mail.gmail.com>
 <46216704388f0c33c18e3a1d54505ab5e71c8cb2.camel@redhat.com>
 <MN2PR04MB59515F55488E14F1859D7C42E12B0@MN2PR04MB5951.namprd04.prod.outlook.com>
In-Reply-To: <MN2PR04MB59515F55488E14F1859D7C42E12B0@MN2PR04MB5951.namprd04.prod.outlook.com>
From: Tom Yan <tom.ty89@gmail.com>
Date: Mon, 7 Sep 2020 09:29:14 +0800
Message-ID: <CAGnHSEkAXtGQeKP+kfhrZ9=dn3DJikWL3Ga74UWK+Qau23wX7w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] file-posix: add sg_get_max_segments that actually
 works with sg
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=tom.ty89@gmail.com; helo=mail-ej1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: "fam@euphon.net" <fam@euphon.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 "anielhb@linux.vnet.ibm.com" <anielhb@linux.vnet.ibm.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Your patch only fixed it for sg devices. S_ISBLK() will never be true
when sg_get_max_segments() is only called in raw_refresh_limits() when
bs->sg is true.

With that said, it's not like we cannot ditch the bs->sg check in
raw_refresh_limits() and switch to S_ISBLK()/S_ISCHR(). (Although not
strictly necessary, I would also do S_ISCHR() for
SG_GET_SG_TABLESIZE.)

I don't know if it's a better approach though. Seems repetitive to me
(and bs->sg is not only used/checked in
file-posix/raw_refresh_limits):
https://github.com/qemu/qemu/blob/v5.1.0/block/file-posix.c#L3390
https://github.com/qemu/qemu/blob/v5.1.0/block/file-posix.c#L3504

On Mon, 7 Sep 2020 at 03:50, Dmitry Fomichev <Dmitry.Fomichev@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Qemu-block <qemu-block-
> > bounces+dmitry.fomichev=wdc.com@nongnu.org> On Behalf Of Maxim
> > Levitsky
> > Sent: Sunday, September 6, 2020 1:06 PM
> > To: Tom Yan <tom.ty89@gmail.com>; eblake@redhat.com;
> > pbonzini@redhat.com; fam@euphon.net; anielhb@linux.vnet.ibm.com;
> > kwolf@redhat.com; mreitz@redhat.com
> > Cc: qemu-devel@nongnu.org; qemu-block@nongnu.org
> > Subject: Re: [PATCH v4 2/2] file-posix: add sg_get_max_segments that
> > actually works with sg
> >
> > On Sun, 2020-09-06 at 23:26 +0800, Tom Yan wrote:
> > > I don't disagree with your proposal, but the thing is, do we even need
> > > another field/limit for case 1? For example, do we *really* need to
> > > clamp sizes[2] (NBD_INFO_BLOCK_SIZE) in nbd/server.c and
> > > max_io_sectors (SCSIBlockLimits) in hw/scsi/scsi-disk.c to to any kind
> > > of "dynamic" limit?
> >
> > It depends on if we have other block drivers that have IO segment/max
> > transfer sizes,
> > that we need to enforce, other than the SG_IO case.
> >
> > Knowing that the commit that added these limits to file-posix, which I was
> > fixing is relatively
> > new, I guess there are other cases for these limits.
> >
> > I'll check this tomorrow.
> >
> > >
> > > Either way I can add another field (`max_pwrite`, maybe?) to
> > > BlockLimits, as an infrastructure/hint, but what should be switched to
> > > it, and what value should each block driver set it to, is probably
> > > beyond what I can take.
> >
> > Implementation wise, I think I can do this, but I'll wait few days for the
> > feedback on my proposal.
> >
> > Thanks for finding this bug!
>
> There was also https://lore.kernel.org/qemu-devel/20200811225122.17342-2-dmitry.fomichev@wdc.com/
> posted three weeks ago, but, seemingly, it was ignored... sorry if this
> bug is already being fixed in a different way, but I think the fix presented
> in that patch is worth considering.
>
> Very best,
> Dmitry
>
> >
> > Best regards,
> >       Maxim Levitsky
> >
> > >
> > > IMHO my patches should be merged first (they are really just fixing a
> > > regression and some bugs). If anyone finds it necessary and is capable
> > > and willing to fix the insufficiency of BlockLimits, they can do it
> > > afterwards with another patch series as an improvement. I can add a
> > > patch to remove the clamping in nbd/server.c as a perhaps-temporary
> > > measure to address the original issue, if desired.
> > >
> > > On Sun, 6 Sep 2020 at 20:53, Maxim Levitsky <mlevitsk@redhat.com>
> > wrote:
> > > > On Sun, 2020-09-06 at 19:04 +0800, Tom Yan wrote:
> > > > > Maybe you want to add some condition for this:
> > > > > https://github.com/qemu/qemu/blob/v5.1.0/nbd/server.c#L659
> > > > > Or not clamp it at all.
> > > > >
> > > > > On Sun, 6 Sep 2020 at 18:58, Tom Yan <tom.ty89@gmail.com> wrote:
> > > > > > In commit 867eccfed84f96b54f4a432c510a02c2ce03b430, Levitsky
> > appears
> > > > > > to have assumed that the only "SCSI Passthrough" is `-device
> > > > > > scsi-generic`, while the fact is there's also `-device scsi-block`
> > > > > > (passthrough without the sg driver). Unlike `-device scsi-hd`, getting
> > > > > > max_sectors is necessary to it (more precisely, hw_max_sectors
> > might
> > > > > > what matters, but BLKSECTGET reports max_sectors, so).
> > > > > >
> > > > > > I'm unsure about how qemu-nbd works, but the commit clearly
> > wasn't the
> > > > > > right approach to fix the original issue it addresses. (It should for
> > > > > > example ignore the max_transfer if it will never matter in to it, or
> > > > > > overrides it in certain cases; when I glimpsed over
> > > > > > https://bugzilla.redhat.com/show_bug.cgi?id=1647104, I don't see
> > how
> > > > > > it could be file-posix problem when it is reporting the right thing,
> > > > > > regardless of whether "removing" the code helps.)
> > > > > >
> > > > > > I don't think we want to "mark" `-device scsi-block` as sg either. It
> > > > > > will probably bring even more unexpected problems, because they
> > are
> > > > > > literally different sets of things behind the scene / in the kernel.
> > > >
> > > > Yes, I did overlook the fact that scsi-block is kind of hybrid passthough
> > device,
> > > > doing SG_IO for some things and regular IO for others.
> > > >
> > > > I don't think that my approach was wrong way to fix the problem, but as
> > you found
> > > > out, abusing 'bs->sg' hack (which I would be very happy to remove
> > completely)
> > > > wasn't a good idea.
> > > > I actualy was aware of scsi-block and that it does SG_IO but it
> > > > was forgotten some where on the way.
> > > >
> > > > So in summary what the problem is and what I think is the right solution:
> > > >
> > > >
> > > > Each qemu block driver exposes block limits and assumes that they are
> > the same
> > > > for two IO interfaces the block driver can expose:
> > > >
> > > > 1. Regular qemu blk_pread/pwrite alike functions
> > > > 2. blk_ioctl (tiny wrapper against SG_IO), supported by posix-raw on
> > > >    host block devices/sg char devices, and by iscsi
> > > >
> > > > The problem is that these two interfaces can have different block limits.
> > > >
> > > > I don't know about iscsi, but for files, doing regular IO is always unlimited,
> > > > since it passes through the kernel block layer and segemented there on
> > > > demand which is faster that doing it in userspace, while SG_IO is passed
> > as is
> > > > to the underlying SCSI device and lacks this segmentation.
> > > >
> > > > Regardless of how NBD uses these limits, I think that these limits should
> > be correctly
> > > > exposed by the block drivers, and therefore I propose is that each qemu
> > block driver
> > > > would expose a pair of block limits.
> > > > One for the regular block IO, and other for SG_IO.
> > > >
> > > > Then block driver clients (like scsi devices that you mention, nbd, etc)
> > > > can choose which limit to use, depending on which IO api they use.
> > > > The scsi-generic, and scsi-block can use the SG_IO limits,
> > > > while the rest  can use the normal (unlimited for file I/O) limits, including
> > the NBD.
> > > >
> > > > Best regards,
> > > >         Maxim Levitsky
> > > >
> > > > > > On Fri, 4 Sep 2020 at 10:09, Tom Yan <tom.ty89@gmail.com> wrote:
> > > > > > > sg devices have different major/minor than their corresponding
> > > > > > > block devices. Using sysfs to get max segments never really worked
> > > > > > > for them.
> > > > > > >
> > > > > > > Fortunately the sg driver provides an ioctl to get sg_tablesize,
> > > > > > > which is apparently equivalent to max segments.
> > > > > > >
> > > > > > > Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> > > > > > > ---
> > > > > > >  block/file-posix.c | 17 ++++++++++++++++-
> > > > > > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > > > > > index 411a23cf99..9e37594145 100644
> > > > > > > --- a/block/file-posix.c
> > > > > > > +++ b/block/file-posix.c
> > > > > > > @@ -1178,6 +1178,21 @@ static int
> > sg_get_max_transfer_length(int fd)
> > > > > > >  #endif
> > > > > > >  }
> > > > > > >
> > > > > > > +static int sg_get_max_segments(int fd)
> > > > > > > +{
> > > > > > > +#ifdef SG_GET_SG_TABLESIZE
> > > > > > > +    long max_segments = 0;
> > > > > > > +
> > > > > > > +    if (ioctl(fd, SG_GET_SG_TABLESIZE, &max_segments) == 0) {
> > > > > > > +        return max_segments;
> > > > > > > +    } else {
> > > > > > > +        return -errno;
> > > > > > > +    }
> > > > > > > +#else
> > > > > > > +    return -ENOSYS;
> > > > > > > +#endif
> > > > > > > +}
> > > > > > > +
> > > > > > >  static int get_max_transfer_length(int fd)
> > > > > > >  {
> > > > > > >  #if defined(BLKSECTGET) && defined(BLKSSZGET)
> > > > > > > @@ -1268,7 +1283,7 @@ static void
> > hdev_refresh_limits(BlockDriverState *bs, Error **errp)
> > > > > > >          bs->bl.max_transfer = pow2floor(ret);
> > > > > > >      }
> > > > > > >
> > > > > > > -    ret = get_max_segments(s->fd);
> > > > > > > +    ret = bs->sg ? sg_get_max_segments(s->fd) :
> > get_max_segments(s->fd);
> > > > > > >      if (ret > 0) {
> > > > > > >          bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
> > > > > > >                                             ret * qemu_real_host_page_size);
> > > > > > > --
> > > > > > > 2.28.0
> > > > > > >
> >
> >
>

