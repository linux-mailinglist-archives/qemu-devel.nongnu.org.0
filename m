Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374DC1D9F72
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 20:27:52 +0200 (CEST)
Received: from localhost ([::1]:34288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb6xz-00080R-9T
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 14:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1jb6to-0001XC-R9; Tue, 19 May 2020 14:23:32 -0400
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:36010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1jb6ti-0000EY-4p; Tue, 19 May 2020 14:23:30 -0400
Received: from mxbackcorp1g.mail.yandex.net (mxbackcorp1g.mail.yandex.net
 [IPv6:2a02:6b8:0:1402::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 338902E14EB;
 Tue, 19 May 2020 21:23:20 +0300 (MSK)
Received: from iva8-88b7aa9dc799.qloud-c.yandex.net
 (iva8-88b7aa9dc799.qloud-c.yandex.net [2a02:6b8:c0c:77a0:0:640:88b7:aa9d])
 by mxbackcorp1g.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 m6twgKsUU1-NI2O0mgk; Tue, 19 May 2020 21:23:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1589912600; bh=c8FyiuTBQ0hzc23Fy8rQY359g7JUsDNgIXcOJU6DuHA=;
 h=In-Reply-To:Message-ID:Subject:To:From:References:Date:Cc;
 b=rslfUEa46N5/i8ZzbIcgtyx4I2EgxfsrwEfUvne/+jKP1H99pAZA+iP8FjxXNM6G6
 S8ejPoPqjchH8S3OLyHbl7u4GozrDlhxKt+nUpCVhAYwy14HqltA5SZVnOg0RNicnQ
 4qkgTTF4adTHm7rLtKmGrtuWHBCTxRGkkWXrek0g=
Authentication-Results: mxbackcorp1g.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1426::1:2])
 by iva8-88b7aa9dc799.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FrWHexu8Kf-NIXuD0bi; Tue, 19 May 2020 21:23:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 19 May 2020 21:23:17 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3] block: make BlockConf.*_size properties 32-bit
Message-ID: <20200519182317.GB742108@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
References: <20200429091813.1469510-1-rvkagan@yandex-team.ru>
 <20200519140826.GM7652@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519140826.GM7652@linux.fritz.box>
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 14:23:20
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 19, 2020 at 04:08:26PM +0200, Kevin Wolf wrote:
> Am 29.04.2020 um 11:18 hat Roman Kagan geschrieben:
> > Devices (virtio-blk, scsi, etc.) and the block layer are happy to use
> > 32-bit for logical_block_size, physical_block_size, and min_io_size.
> > However, the properties in BlockConf are defined as uint16_t limiting
> > the values to 32768.
> > 
> > This appears unnecessary tight, and we've seen bigger block sizes handy
> > at times.
> > 
> > Make them 32 bit instead and lift the limitation up to 2 MiB which
> > appears to be good enough for everybody, and matches the qcow2 cluster
> > size limit.
> > 
> > As the values can now be fairly big and awkward to type, make the
> > property setter accept common size suffixes (k, m).
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > Reviewed-by: Eric Blake <eblake@redhat.com>
> > ---
> > v2 -> v3:
> > - mention qcow2 cluster size limit in the log and comment [Eric]
> > 
> > v1 -> v2:
> > - cap the property at 2 MiB [Eric]
> > - accept size suffixes
> > 
> >  include/hw/block/block.h     |  8 ++++----
> >  include/hw/qdev-properties.h |  2 +-
> >  hw/core/qdev-properties.c    | 34 ++++++++++++++++++++++++----------
> >  3 files changed, 29 insertions(+), 15 deletions(-)
> > 
> > diff --git a/include/hw/block/block.h b/include/hw/block/block.h
> > index d7246f3862..9dd6bba56a 100644
> > --- a/include/hw/block/block.h
> > +++ b/include/hw/block/block.h
> > @@ -18,9 +18,9 @@
> >  
> >  typedef struct BlockConf {
> >      BlockBackend *blk;
> > -    uint16_t physical_block_size;
> > -    uint16_t logical_block_size;
> > -    uint16_t min_io_size;
> > +    uint32_t physical_block_size;
> > +    uint32_t logical_block_size;
> > +    uint32_t min_io_size;
> >      uint32_t opt_io_size;
> >      int32_t bootindex;
> >      uint32_t discard_granularity;
> > @@ -51,7 +51,7 @@ static inline unsigned int get_physical_block_exp(BlockConf *conf)
> >                            _conf.logical_block_size),                    \
> >      DEFINE_PROP_BLOCKSIZE("physical_block_size", _state,                \
> >                            _conf.physical_block_size),                   \
> > -    DEFINE_PROP_UINT16("min_io_size", _state, _conf.min_io_size, 0),    \
> > +    DEFINE_PROP_UINT32("min_io_size", _state, _conf.min_io_size, 0),    \
> 
> This one doesn't go through set_blocksize(), so does the 2 MB
> limitation actually not apply to min_io_size?
> 
> Let's go back to the line that Philippe already quoted:
> 
>     virtio_stw_p(vdev, &blkcfg.min_io_size, conf->min_io_size / blk_size);
> 
> This means that we'll get silent 16 bit truncation of the size specified
> by the user. This is the new bug. In addition, like before, we also
> silently round down to the next multiple of the logical block size.
> 
> Of course, opt_io_size already has the same problems. I wonder whether
> both should be converted to DEFINE_PROP_BLOCKSIZE.

DEFINE_PROP_BLOCKSIZE, in addition to capping the value at 2 MB, also
requires it to be a power of two.  I'm not sure it's safe to assume
min_io_size and opt_io_size are ok with this.

> In either case, I
> think virtio_blk_device_realize() must check that both values are
> plausible; even if we use a block size property, it still needs to
> verify that they are a multiple of the block size.
> 
> The same thing is true of hw/scsi/scsi-disk.c.
> 
> All other devices with DEFINE_BLOCK_PROPERTIES accept a value, but
> silently ignore it, so nothing changes for them (though it's also not
> the perfect state).
> 
> >      DEFINE_PROP_UINT32("opt_io_size", _state, _conf.opt_io_size, 0),    \
> >      DEFINE_PROP_UINT32("discard_granularity", _state,                   \
> >                         _conf.discard_granularity, -1),                  \
> > diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
> > index f161604fb6..f9e0f8c041 100644
> > --- a/include/hw/qdev-properties.h
> > +++ b/include/hw/qdev-properties.h
> > @@ -197,7 +197,7 @@ extern const PropertyInfo qdev_prop_pcie_link_width;
> >  #define DEFINE_PROP_BIOS_CHS_TRANS(_n, _s, _f, _d) \
> >      DEFINE_PROP_SIGNED(_n, _s, _f, _d, qdev_prop_bios_chs_trans, int)
> >  #define DEFINE_PROP_BLOCKSIZE(_n, _s, _f) \
> > -    DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint16_t)
> > +    DEFINE_PROP_UNSIGNED(_n, _s, _f, 0, qdev_prop_blocksize, uint32_t)
> 
> The 2 MB limit means that we won't get 16 bit truncation for anything
> that is stored in sectors (512 * 64k = 32M).
> 
> As far as I can see, all devices can deal with this change then.
> 
> >  #define DEFINE_PROP_PCI_HOST_DEVADDR(_n, _s, _f) \
> >      DEFINE_PROP(_n, _s, _f, qdev_prop_pci_host_devaddr, PCIHostDeviceAddress)
> >  #define DEFINE_PROP_OFF_AUTO_PCIBAR(_n, _s, _f, _d) \
> > diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> > index 2047114fca..e673f3c43f 100644
> > --- a/hw/core/qdev-properties.c
> > +++ b/hw/core/qdev-properties.c
> > @@ -14,6 +14,7 @@
> >  #include "qapi/visitor.h"
> >  #include "chardev/char.h"
> >  #include "qemu/uuid.h"
> > +#include "qemu/units.h"
> >  
> >  void qdev_prop_set_after_realize(DeviceState *dev, const char *name,
> >                                    Error **errp)
> > @@ -729,30 +730,42 @@ const PropertyInfo qdev_prop_pci_devfn = {
> >  
> >  /* --- blocksize --- */
> >  
> > +/* lower limit is sector size */
> > +#define MIN_BLOCK_SIZE          512
> > +#define MIN_BLOCK_SIZE_STR      "512 B"
> > +/*
> > + * upper limit is arbitrary, 2 MiB looks sufficient for all sensible uses, and
> > + * matches qcow2 cluster size limit
> > + */
> > +#define MAX_BLOCK_SIZE          (2 * MiB)
> > +#define MAX_BLOCK_SIZE_STR      "2 MiB"
> > +
> >  static void set_blocksize(Object *obj, Visitor *v, const char *name,
> >                            void *opaque, Error **errp)
> >  {
> >      DeviceState *dev = DEVICE(obj);
> >      Property *prop = opaque;
> > -    uint16_t value, *ptr = qdev_get_prop_ptr(dev, prop);
> > +    uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
> > +    uint64_t value;
> >      Error *local_err = NULL;
> > -    const int64_t min = 512;
> > -    const int64_t max = 32768;
> >  
> >      if (dev->realized) {
> >          qdev_prop_set_after_realize(dev, name, errp);
> >          return;
> >      }
> >  
> > -    visit_type_uint16(v, name, &value, &local_err);
> > +    visit_type_size(v, name, &value, &local_err);
> >      if (local_err) {
> >          error_propagate(errp, local_err);
> >          return;
> >      }
> >      /* value of 0 means "unset" */
> > -    if (value && (value < min || value > max)) {
> > -        error_setg(errp, QERR_PROPERTY_VALUE_OUT_OF_RANGE,
> > -                   dev->id ? : "", name, (int64_t)value, min, max);
> > +    if (value && (value < MIN_BLOCK_SIZE || value > MAX_BLOCK_SIZE)) {
> > +        error_setg(errp,
> > +                   "Property %s.%s doesn't take value %" PRIu64
> > +                   " (minimum: " MIN_BLOCK_SIZE_STR
> > +                   ", maximum: " MAX_BLOCK_SIZE_STR ")",
> > +                   dev->id ? : "", name, value);
> >          return;
> >      }
> >  
> > @@ -768,9 +781,10 @@ static void set_blocksize(Object *obj, Visitor *v, const char *name,
> >  }
> >  
> >  const PropertyInfo qdev_prop_blocksize = {
> > -    .name  = "uint16",
> > -    .description = "A power of two between 512 and 32768",
> > -    .get   = get_uint16,
> > +    .name  = "size",
> > +    .description = "A power of two between " MIN_BLOCK_SIZE_STR
> > +                   " and " MAX_BLOCK_SIZE_STR,
> > +    .get   = get_uint32,
> >      .set   = set_blocksize,
> >      .set_default_value = set_default_value_uint,
> >  };
> 
> This part looks good to me, too.
> 
> So I think we just need some additional checks for min_io_size (and
> potentially opt_io_size while you're at it). Maybe that could be a
> separate patch before this one.

I must admit I didn't consider it as a practical issue; if it is, I'm
thinking of adding all those consistency checks to blkconf_blocksizes
(and nuking the open-coded ones from the respective realize functions).
I'll cook something up in the next iteration.

Thanks,
Roman.

