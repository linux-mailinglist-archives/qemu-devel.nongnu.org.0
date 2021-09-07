Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CB402B04
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:47:45 +0200 (CEST)
Received: from localhost ([::1]:42456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNcO0-00037M-4p
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:47:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcLI-00015b-OI
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:44:56 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcLG-0005Iq-6g
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:44:56 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so1603648wmq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 07:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SeZzdo2kmbZtElEbgJIw4zzbrC9GzHvP+7qKkPzGnBA=;
 b=OH4DrfyuwQrZcKSpIos/uaSkg4loV5zuDr73YdPVdWHourL6CitqMnvtIa+qTIqz60
 dM2IYNTWefesuz2w9v3B4/ddBrloM7YhAF46XD6JDsbRgIRDBo2EQqfuPrX8kAXiD7ta
 hD4Ser19KuNUW1/FIYqQobJBSmG6RVHYd2+7OLo27rDAqAvgrNzNZgsFcUAdL9+6x8ob
 A0XYHOHps00ODjtjwQrCUZ97psVJJ0P4Lgj2oSo3vGPpPqGPEbADtufCuIzE/AYW5YmB
 VdHFvFeHdaP7pMOUEdtkOqO1u7IroQF4XUMR1/olRoAUGMIsQAJZT9pa6qK3lTFcw725
 HWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SeZzdo2kmbZtElEbgJIw4zzbrC9GzHvP+7qKkPzGnBA=;
 b=WBBp+ZQNwDTy0scDF3V0BTQPtnFNRbd5tE8F+PHzleQDIPIUJ8RC7RqjVKh2VTvOIV
 CcBgYEImV9Zo5RD0C7aNspzmZkxmRdHepUNByUY0bM9IeAhSV843MGw/5HsuEESol6Uf
 1wY6XUpZEpv5cz2+AGd3NTNv5aRFFqMYZlm/wB1eS8JT8E/VFI8dmxuwjiNq3BT6CMI+
 pYmYGp5jsvNKiWZOejfaBZWjpmbidl1+nnGRY1/HkyGcxs6I2ddiWDIeG+UNw3fUfil0
 i0s/F4Y/ht/fivVMdCJoxq5UZEix+P6QD20/MeVAz4oMnr1pJCvgwPNnQfaTKMxKzfBU
 TDvA==
X-Gm-Message-State: AOAM5331gL6tGacZCng1hbj6/7AZV16rBU0c3l3wSy1D/QzDRT8IhEN3
 dChzUpTVtDWb9pJQ/poLhHsnxsFnqdlI/E27h9vOtQ==
X-Google-Smtp-Source: ABdhPJwCCZEhEdwyr2r2+A5C+9gZNTznuTXGzXfuf7YpqCB2lQYK+E7pxUptYox9G8FXoP6sV6qdbKFR2jRJGypHlCY=
X-Received: by 2002:a05:600c:4f46:: with SMTP id
 m6mr4372668wmq.133.1631025891755; 
 Tue, 07 Sep 2021 07:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210823174924.201669-1-tong.ho@xilinx.com>
 <20210823174924.201669-2-tong.ho@xilinx.com>
In-Reply-To: <20210823174924.201669-2-tong.ho@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 15:44:02 +0100
Message-ID: <CAFEAcA8_A7cET97sG+zK7ydQdzT2sgGhSdWonCVPwVfKWCCM1w@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] hw/nvram: Introduce Xilinx eFuse QOM
To: Tong Ho <tong.ho@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Aug 2021 at 18:49, Tong Ho <tong.ho@xilinx.com> wrote:
>
> This introduces the QOM for Xilinx eFuse, an one-time
> field-programmable storage bit array.
>
> The actual mmio interface to the array varies by device
> families and will be provided in different change-sets.
>
> Co-authored-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Co-authored-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

--- /dev/null
+++ b/hw/nvram/xlnx-efuse-crc.c
@@ -0,0 +1,118 @@
+/*
+ * Xilinx eFuse/bbram CRC calculator

+ */
+#include "hw/nvram/xlnx-efuse.h"

.c files must always include "qemu/osdep.h" as their first #include.

> +#ifndef XLNX_EFUSE_ERR_DEBUG
> +#define XLNX_EFUSE_ERR_DEBUG 0
> +#endif

This define doesn't seem to be used; you could just drop it.

> +#define XLNX_EFUSE(obj) \
> +     OBJECT_CHECK(XLNXEFuse, (obj), TYPE_XLNX_EFUSE)

This is a bit of an old-style way to write this. These days we
recommend using the OBJECT_DECLARE_TYPE macro in your .h file
(which will provide the cast macro/function and also some typedefs
that you're currently manually providing).

> +static void efuse_sync_bdrv(XLNXEFuse *s, unsigned int bit)
> +{
> +    const int bswap_adj = (const_le32(0x1234) != 0x1234 ? 3 : 0);

Don't do ad-hoc figuring out of the host endianness like this.
I would suggest using cpu_to_le32() on the relevant word
in fuse32[] and then writing that to the backing store.

> +    unsigned int efuse_byte;
> +
> +    if (!s->blk || s->blk_ro) {
> +        return;  /* Silient on read-only backend to avoid message flood */

"silent"

> +    }
> +
> +    efuse_byte = bit / 8;
> +
> +    if (blk_pwrite(s->blk, efuse_byte,
> +                   ((uint8_t *) s->fuse32) + (efuse_byte ^ bswap_adj),
> +                   1, 0) < 0) {
> +        error_report("%s: write error in byte %" PRIu32 ".",
> +                      __func__, efuse_byte);
> +    }
> +}

> +static void efuse_realize(DeviceState *dev, Error **errp)
> +{
> +    XLNXEFuse *s = XLNX_EFUSE(dev);
> +    BlockBackend *blk;
> +    DriveInfo *dinfo;
> +    unsigned int nr_bytes;
> +    const char *prefix = object_get_canonical_path(OBJECT(dev));
> +
> +    if (s->drv_index < 0) {
> +        /* Set legacy compatibility */
> +        s->drv_index = s->efuse_size <= 2048 ? 3 : 1;
> +    }
> +
> +    dinfo = drive_get_by_index(IF_PFLASH, s->drv_index);
> +    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;

Don't get block backends like this in device models, please.
Instead, the device should have a property "drive" (use
DEFINE_PROP_DRIVE() to declare this), and the board should find
the drive and attach it to the device. In fact looking lower down
in the file I see you have a 'drive' property, so you should
just be using it (and getting rid of the drive-index property).

> +
> +    nr_bytes = ROUND_UP((s->efuse_nr * s->efuse_size) / 8, 4);
> +    s->fuse32 = g_malloc0(nr_bytes);
> +    if (blk) {
> +        qdev_prop_set_drive(dev, "drive", blk);
> +
> +        s->blk_ro = !blk_supports_write_perm(s->blk);
> +        if (s->blk_ro) {
> +            warn_report("%s: update not saved: backstore is read-only",
> +                        object_get_canonical_path(OBJECT(s)));
> +        }
> +        blk_set_perm(s->blk,
> +                     (BLK_PERM_CONSISTENT_READ
> +                      | (s->blk_ro ? 0 : BLK_PERM_WRITE)), BLK_PERM_ALL,
> +                     &error_abort);

&error_abort isn't really appropriate in a device model, unless
you know the function call really can't fail. Better to pass
the error back up to the caller. (Watch out that you need to free
the s->fuse32 you just allocated if you return early.)

> +
> +        if (blk_pread(s->blk, 0, (void *) s->fuse32, nr_bytes) < 0) {
> +            error_setg(&error_abort, "%s: Unable to read-out contents."
> +                         "backing file too small? Expecting %" PRIu32" bytes",
> +                          prefix,
> +                          (unsigned int) (nr_bytes));

You should pass this to the caller, not use error_abort.


> +        }
> +        if (const_le32(0x1234) != 0x1234) {

Again, no ad-hoc endianness testing, please.

> +            /* Convert from little-endian backstore for each 32-bit row */
> +            unsigned int nr_u32;
> +
> +            for (nr_u32 = 0; nr_u32 < (nr_bytes / 4); nr_u32++) {
> +                s->fuse32[nr_u32] = le32_to_cpu(s->fuse32[nr_u32]);
> +            }
> +        }
> +    }
> +
> +    /* Sort readonly-list for bsearch lookup */
> +    efuse_ro_bits_sort(s);
> +}



> +static const VMStateDescription vmstate_efuse = {
> +    .name = TYPE_XLNX_EFUSE,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,

You don't need to specify the minimum_version_id_old here.

> +    .fields = (VMStateField[]) {
> +        VMSTATE_END_OF_LIST(),

If the device genuinely has no internal state (and it looks
like in this case that is true), you don't need to write out
an empty vmstate. Instead put a comment in the class init function
like:

 /*
  * This device has no internal state (it is all kept in the
  * block device) so it does not need a vmstate.
  */




> +#ifndef XLNX_EFUSE_H
> +#define XLNX_EFUSE_H
> +
> +#include "qemu/osdep.h"

Headers should never include osdep.h.

> +#include "sysemu/block-backend.h"
> +#include "hw/qdev-core.h"
> +
> +#define TYPE_XLNX_EFUSE "xlnx,efuse"
> +
> +typedef struct XLNXEFuseLkSpec {
> +    uint16_t row;
> +    uint16_t lk_bit;
> +} XLNXEFuseLkSpec;

What's this struct for? Nothing in this patch or in these files uses it.

> +typedef struct XLNXEFuse {
> +    DeviceState parent_obj;
> +    BlockBackend *blk;
> +    bool blk_ro;
> +    uint32_t *fuse32;
> +
> +    DeviceState *dev;
> +
> +    bool init_tbits;
> +    int drv_index;
> +
> +    uint8_t efuse_nr;
> +    uint32_t efuse_size;
> +
> +    uint32_t *ro_bits;
> +    uint32_t ro_bits_cnt;
> +} XLNXEFuse;
> +
> +uint32_t xlnx_efuse_calc_crc(const uint32_t *data, unsigned u32_cnt,
> +                             unsigned zpads);

Where you're providing function prototypes in a header to be used
by other parts of QEMU, can you provide some brief doc-comment format
comments that describe what the API of those functions is, please ?

> +
> +bool xlnx_efuse_get_bit(XLNXEFuse *s, unsigned int bit);
> +bool xlnx_efuse_set_bit(XLNXEFuse *s, unsigned int bit);
> +bool xlnx_efuse_k256_check(XLNXEFuse *s, uint32_t crc, unsigned start);
> +uint32_t xlnx_efuse_tbits_check(XLNXEFuse *s);
> +
> +/* Return whole row containing the given bit address */
> +static inline uint32_t xlnx_efuse_get_row(XLNXEFuse *s, unsigned int bit)
> +{
> +    if (!(s->fuse32)) {
> +        return 0;
> +    } else {
> +        unsigned int row_idx = bit / 32;
> +
> +        assert(row_idx < (s->efuse_size * s->efuse_nr / 32));
> +        return s->fuse32[row_idx];
> +    }
> +}
> +
> +#endif

thanks
-- PMM

