Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E442DDDA9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 05:13:24 +0100 (CET)
Received: from localhost ([::1]:44250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq78t-00072c-OL
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 23:13:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6zr-0000iH-5c
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 23:04:07 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:46457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6zc-0004p7-VN
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 23:04:01 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b73so900994edf.13
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 20:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uh7LRyYuxv7JmsvWquC2DCtoeSeAuaLjWpFH4xXcYBw=;
 b=jyWStUN7fu9qgvEZyIoHxdkLaUPd9n2pHcz3TC/IMN919xrVpTo294Es2fb3DvJhQS
 /TIoFQ3bddvmhaBu652RqEpWHvorvzZdX57dzMFyzpRA0D5nw12SnwUOgrhXl1LxLrOE
 4DkBhtmANzKCsDdSPYbI5JohuCuYVVFTFa7JtZlTm7Ov5KWNvBOio44dxBAXSQ4zxeE8
 oagw46SHOYE9SgyI4l0lkP1aK4P7UD7Aeah1Mn1Ofua51qz/r45vemqiSvYJNU1xt/J6
 8EYRTbtQ3K0WlBFXNij6BnVJuQmjmF8zM1U4bHK84+DZmPr+9cmxrwGx440ei3780Oxb
 cWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uh7LRyYuxv7JmsvWquC2DCtoeSeAuaLjWpFH4xXcYBw=;
 b=HXdWhL0us5RFasERUvEuc1KdAWOGtJkEWEgjSENxd9duI2j4Znmvwabj25OlFcng3O
 jCtuWRRReZHj+JViElq+h32Rb+grVi+ZPwOM7B/TD7RIJO/rFNvc9wDlb69rR6Igbymw
 pHSOgiC2tL4e9gMk3sXUQB/u6P1jV+lVKqXvPZkclgQ93HiW5U/fTl+mbEI/r/YB4OhY
 CoqRMJmLtfDf25eMAtuY7+i2vb/kp7w5SuM+xURybg/R0/q6ioRZeWgHn0Difdvo2LDv
 AkAM29EqQLnaKn1WciGVd5n7e4rmBFUeeBtOsxz+gz2uKyv2bHxntu1/Jx/3EvuZF2Xb
 awjg==
X-Gm-Message-State: AOAM530vjMKGiktdkdO0dOrhQA5bgefXMitm/SY+82DU1Vl6BA8Wdq+R
 wOLAHK9wcwm8SKBijj/hhaPx3AXRdbckYujqgYC7W4IzFC2DnCFD
X-Google-Smtp-Source: ABdhPJyTcm15yIw/ClXmTxXw2yqXBPOPrrQt47yZFTwuqnCdXEF8MvGPc99ZBkxK1HoAhJlWALKI1Yz/g6fPaRYtdTM=
X-Received: by 2002:a50:e68a:: with SMTP id z10mr2523364edm.28.1608264225732; 
 Thu, 17 Dec 2020 20:03:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1597129029.git.scw@google.com>
 <61323061160b6d21f43b266764eda813b5e021e2.1597129029.git.scw@google.com>
In-Reply-To: <61323061160b6d21f43b266764eda813b5e021e2.1597129029.git.scw@google.com>
From: Shu-Chun Weng <scw@google.com>
Date: Thu, 17 Dec 2020 20:03:33 -0800
Message-ID: <CAF3nBxiSr+PKk-upgas0b2-6gOBVPt7ThOwZ05zAnduWtSh77w@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] linux-user: Add support for SIOCETHTOOL ioctl
To: qemu-devel@nongnu.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000f046b605b6b53181"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=scw@google.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f046b605b6b53181
Content-Type: multipart/alternative; boundary="000000000000e1b8e105b6b53131"

--000000000000e1b8e105b6b53131
Content-Type: text/plain; charset="UTF-8"

Ping -- any comments on
https://patchew.org/QEMU/cover.1597129029.git.scw@google.com/61323061160b6d21f43b266764eda813b5e021e2.1597129029.git.scw@google.com/

On Tue, Aug 11, 2020 at 12:10 AM Shu-Chun Weng <scw@google.com> wrote:

> The ioctl numeric values are platform-independent and determined by
> the file include/uapi/linux/sockios.h in Linux kernel source code:
>
>   #define SIOCETHTOOL   0x8946
>
> These ioctls get (or set) various structures pointed by the field
> ifr_data in the structure ifreq depending on the first 4 bytes of the
> memory region.
>
> This change clones the ioctl framework into ethtool-specific dispatch
> logic in its own file. A number of definitions previously only visible
> in syscall.c are thus exported to syscall_defs.h to be used in the new
> files.
>
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> ---
> v1 -> v2:
>   Fix style problems.
>
>  linux-user/Makefile.objs      |   3 +-
>  linux-user/ethtool.c          | 840 ++++++++++++++++++++++++++++++++++
>  linux-user/ethtool.h          |  20 +
>  linux-user/ethtool_entries.h  | 107 +++++
>  linux-user/ioctls.h           |   2 +
>  linux-user/qemu.h             |   1 +
>  linux-user/syscall.c          |  36 +-
>  linux-user/syscall_defs.h     |  12 +
>  linux-user/syscall_types.h    | 280 ++++++++++++
>  tests/tcg/multiarch/ethtool.c | 423 +++++++++++++++++
>  10 files changed, 1712 insertions(+), 12 deletions(-)
>  create mode 100644 linux-user/ethtool.c
>  create mode 100644 linux-user/ethtool.h
>  create mode 100644 linux-user/ethtool_entries.h
>  create mode 100644 tests/tcg/multiarch/ethtool.c
>
> diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs
> index 1940910a73..971d43173a 100644
> --- a/linux-user/Makefile.objs
> +++ b/linux-user/Makefile.objs
> @@ -1,7 +1,8 @@
>  obj-y = main.o syscall.o strace.o mmap.o signal.o \
>         elfload.o linuxload.o uaccess.o uname.o \
>         safe-syscall.o $(TARGET_ABI_DIR)/signal.o \
> -        $(TARGET_ABI_DIR)/cpu_loop.o exit.o fd-trans.o
> +       $(TARGET_ABI_DIR)/cpu_loop.o exit.o fd-trans.o \
> +       ethtool.o
>
>  obj-$(TARGET_HAS_BFLT) += flatload.o
>  obj-$(TARGET_I386) += vm86.o
> diff --git a/linux-user/ethtool.c b/linux-user/ethtool.c
> new file mode 100644
> index 0000000000..fac97b9ba1
> --- /dev/null
> +++ b/linux-user/ethtool.c
> @@ -0,0 +1,840 @@
> +/*
> + *  Linux ioctl system call SIOCETHTOOL requests
> + *
> + *  Copyright (c) 2020 Shu-Chun Weng
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +#include "qemu/osdep.h"
> +#include <stdio.h>
> +#include <linux/ethtool.h>
> +#include <linux/if.h>
> +#include <linux/sockios.h>
> +#include <linux/unistd.h>
> +#include "ethtool.h"
> +#include "qemu.h"
> +#include "syscall_defs.h"
> +
> +/* Non-standard ethtool structure definitions. */
> +/*
> + * struct ethtool_rxnfc {
> + *     __u32 cmd;
> + *     __u32 flow_type;
> + *     __u64 data;
> + *     struct ethtool_rx_flow_spec fs;
> + *     union {
> + *         __u32 rule_cnt;
> + *         __u32 rss_context;
> + *     };
> + *     __u32 rule_locs[0];
> + * };
> + *
> + * Originally defined for ETHTOOL_{G,S}RXFH with only the cmd, flow_type
> and
> + * data members. For other commands, dedicated standard structure
> definitions
> + * are listed in syscall_types.h.
> + */
> +static void host_to_target_ethtool_rxnfc_get_set_rxfh(void *dst,
> +                                                      const void *src)
> +{
> +    static const argtype ethtool_rx_flow_spec_argtype[] = {
> +        MK_STRUCT(STRUCT_ethtool_rx_flow_spec), TYPE_NULL };
> +    struct ethtool_rxnfc *target = dst;
> +    const struct ethtool_rxnfc *host = src;
> +
> +    target->cmd = tswap32(host->cmd);
> +    target->flow_type = tswap32(host->flow_type);
> +    target->data = tswap64(host->data);
> +
> +    if (host->cmd == ETHTOOL_SRXFH) {
> +        /*
> +         * struct ethtool_rxnfc was originally defined for
> ETHTOOL_{G,S}RXFH
> +         * with only the cmd, flow_type and data members. Guest program
> might
> +         * still be using that definition.
> +         */
> +        return;
> +    }
> +    if (host->cmd != ETHTOOL_GRXFH) {
> +        fprintf(stderr, "host_to_target_ethtool_rxnfc_get_set_rxfh called
> with "
> +                "command 0x%x which is not ETHTOOL_SRXFH or
> ETHTOOL_GRXFH\n",
> +                host->cmd);
> +    }
> +    if ((host->flow_type & FLOW_RSS) == 0) {
> +        return;
> +    }
> +    /*
> +     * If `FLOW_RSS` was requested then guest program must be using the
> new
> +     * definition.
> +     */
> +    thunk_convert(&target->fs, &host->fs, ethtool_rx_flow_spec_argtype,
> +                  THUNK_TARGET);
> +    target->rule_cnt = tswap32(host->rule_cnt);
> +}
> +
> +static void target_to_host_ethtool_rxnfc_get_set_rxfh(void *dst,
> +                                                      const void *src)
> +{
> +    static const argtype ethtool_rx_flow_spec_argtype[] = {
> +        MK_STRUCT(STRUCT_ethtool_rx_flow_spec), TYPE_NULL };
> +    struct ethtool_rxnfc *host = dst;
> +    const struct ethtool_rxnfc *target = src;
> +
> +    host->cmd = tswap32(target->cmd);
> +    host->flow_type = tswap32(target->flow_type);
> +    host->data = tswap64(target->data);
> +
> +    if (host->cmd == ETHTOOL_SRXFH) {
> +        /*
> +         * struct ethtool_rxnfc was originally defined for
> ETHTOOL_{G,S}RXFH
> +         * with only the cmd, flow_type and data members. Guest program
> might
> +         * still be using that definition.
> +         */
> +        return;
> +    }
> +    if (host->cmd != ETHTOOL_GRXFH) {
> +        fprintf(stderr, "target_to_host_ethtool_rxnfc_get_set_rxfh called
> with "
> +                "command 0x%x which is not ETHTOOL_SRXFH or
> ETHTOOL_GRXFH\n",
> +                host->cmd);
> +    }
> +    if ((host->flow_type & FLOW_RSS) == 0) {
> +        return;
> +    }
> +    /*
> +     * If `FLOW_RSS` was requested then guest program must be using the
> new
> +     * definition.
> +     */
> +    thunk_convert(&host->fs, &target->fs, ethtool_rx_flow_spec_argtype,
> +                  THUNK_HOST);
> +    host->rule_cnt = tswap32(target->rule_cnt);
> +}
> +
> +static int target_ethtool_rxnfc_get_set_rxfh_size(const void *src)
> +{
> +    const struct ethtool_rxnfc *target = src;
> +    int cmd = tswap32(target->cmd);
> +    if (cmd == ETHTOOL_SRXFH ||
> +        (cmd == ETHTOOL_GRXFH &&
> +         (tswap32(target->flow_type) & FLOW_RSS) == 0)) {
> +        return 16;
> +    }
> +    return sizeof(struct ethtool_rxnfc);
> +}
> +
> +static int host_ethtool_rxnfc_get_set_rxfh_size(const void *src)
> +{
> +    const struct ethtool_rxnfc *host = src;
> +    if (host->cmd == ETHTOOL_SRXFH ||
> +        (host->cmd == ETHTOOL_GRXFH && (host->flow_type & FLOW_RSS) ==
> 0)) {
> +        return 16;
> +    }
> +    return sizeof(struct ethtool_rxnfc);
> +}
> +
> +const StructEntry struct_ethtool_rxnfc_get_set_rxfh_def = {
> +    .convert = {
> +        host_to_target_ethtool_rxnfc_get_set_rxfh,
> +        target_to_host_ethtool_rxnfc_get_set_rxfh },
> +    .thunk_size = {
> +        target_ethtool_rxnfc_get_set_rxfh_size,
> +        host_ethtool_rxnfc_get_set_rxfh_size },
> +    .size = { 16, 16 },
> +    .align = {
> +        __alignof__(struct ethtool_rxnfc),
> +        __alignof__(struct ethtool_rxnfc) },
> +};
> +
> +/*
> + * struct ethtool_sset_info {
> + *     __u32 cmd;
> + *     __u32 reserved;
> + *     __u64 sset_mask;
> + *     __u32 data[0];
> + * };
> + *
> + * `sset_mask` is a bitmask of string sets. `data` is the buffer for
> string set
> + * sizes, containing number of 1s in `sset_mask`'s binary representation
> number
> + * of 4-byte entries.
> + *
> + * Since all fields are fixed-width and number of 1s in `sset_mask` does
> not
> + * change between architectures, host-to-target and target-to-host are
> + * identical.
> + */
> +static void convert_ethtool_sset_info(void *dst, const void *src)
> +{
> +    int i, set_count;
> +    struct ethtool_sset_info *dst_sset_info = dst;
> +    const struct ethtool_sset_info *src_sset_info = src;
> +
> +    dst_sset_info->cmd = tswap32(src_sset_info->cmd);
> +    dst_sset_info->sset_mask = tswap64(src_sset_info->sset_mask);
> +
> +    set_count = ctpop64(src_sset_info->sset_mask);
> +    for (i = 0; i < set_count; ++i) {
> +        dst_sset_info->data[i] = tswap32(src_sset_info->data[i]);
> +    }
> +}
> +
> +static int ethtool_sset_info_size(const void *src)
> +{
> +    const struct ethtool_sset_info *src_sset_info = src;
> +    return sizeof(struct ethtool_sset_info) +
> +        ctpop64(src_sset_info->sset_mask) *
> sizeof(src_sset_info->data[0]);
> +}
> +
> +const StructEntry struct_ethtool_sset_info_def = {
> +    .convert = {
> +        convert_ethtool_sset_info, convert_ethtool_sset_info },
> +    .thunk_size = {
> +        ethtool_sset_info_size, ethtool_sset_info_size },
> +    .size = {
> +        sizeof(struct ethtool_sset_info),
> +        sizeof(struct ethtool_sset_info) },
> +    .align = {
> +        __alignof__(struct ethtool_sset_info),
> +        __alignof__(struct ethtool_sset_info) },
> +};
> +
> +/*
> + * struct ethtool_rxfh {
> + *     __u32 cmd;
> + *     __u32 rss_context;
> + *     __u32 indir_size;
> + *     __u32 key_size;
> + *     __u8  hfunc;
> + *     __u8  rsvd8[3];
> + *     __u32 rsvd32;
> + *     __u32 rss_config[0];
> + * };
> + *
> + * `rss_config`: indirection table of `indir_size` __u32 elements,
> followed by
> + * hash key of `key_size` bytes.
> + *
> + * `indir_size` could be ETH_RXFH_INDIR_NO_CHANGE when `cmd` is
> ETHTOOL_SRSSH
> + * and there would be no indircetion table in `rss_config`.
> + */
> +static void convert_ethtool_rxfh_header(void *dst, const void *src)
> +{
> +    struct ethtool_rxfh *dst_rxfh = dst;
> +    const struct ethtool_rxfh *src_rxfh = src;
> +
> +    dst_rxfh->cmd = tswap32(src_rxfh->cmd);
> +    dst_rxfh->rss_context = tswap32(src_rxfh->rss_context);
> +    dst_rxfh->indir_size = tswap32(src_rxfh->indir_size);
> +    dst_rxfh->key_size = tswap32(src_rxfh->key_size);
> +    dst_rxfh->hfunc = src_rxfh->hfunc;
> +    dst_rxfh->rsvd8[0] = src_rxfh->rsvd8[0];
> +    dst_rxfh->rsvd8[1] = src_rxfh->rsvd8[1];
> +    dst_rxfh->rsvd8[2] = src_rxfh->rsvd8[2];
> +    dst_rxfh->rsvd32 = tswap32(src_rxfh->rsvd32);
> +}
> +
> +static void convert_ethtool_rxfh_rss_config(
> +    void *dst, const void *src, uint32_t indir_size, uint32_t key_size) {
> +    uint32_t *dst_rss_config = (uint32_t *)dst;
> +    const uint32_t *src_rss_config = (const uint32_t *)src;
> +    int i;
> +    for (i = 0; i < indir_size; ++i) {
> +        dst_rss_config[i] = tswap32(src_rss_config[i]);
> +    }
> +    if (key_size > 0) {
> +        memcpy(dst_rss_config + indir_size,
> +               src_rss_config + indir_size,
> +               key_size);
> +    }
> +}
> +
> +static void host_to_target_ethtool_rxfh(void *dst, const void *src)
> +{
> +    struct ethtool_rxfh *target = dst;
> +    const struct ethtool_rxfh *host = src;
> +
> +    convert_ethtool_rxfh_header(dst, src);
> +
> +    const uint32_t indir_size =
> +        host->cmd == ETHTOOL_SRSSH &&
> +        host->indir_size == ETH_RXFH_INDIR_NO_CHANGE ?
> +        0 :
> +        host->indir_size;
> +    convert_ethtool_rxfh_rss_config(target->rss_config, host->rss_config,
> +                                    indir_size, host->key_size);
> +}
> +
> +static void target_to_host_ethtool_rxfh(void *dst, const void *src)
> +{
> +    struct ethtool_rxfh *host = dst;
> +    const struct ethtool_rxfh *target = src;
> +
> +    convert_ethtool_rxfh_header(dst, src);
> +
> +    const uint32_t indir_size =
> +        host->cmd == ETHTOOL_SRSSH &&
> +        host->indir_size == ETH_RXFH_INDIR_NO_CHANGE ?
> +        0 :
> +        host->indir_size;
> +    convert_ethtool_rxfh_rss_config(host->rss_config, target->rss_config,
> +                                    indir_size, host->key_size);
> +}
> +
> +static int target_ethtool_rxfh_size(const void *src)
> +{
> +    const struct ethtool_rxfh *target = src;
> +    if (tswap32(target->cmd) == ETHTOOL_SRSSH &&
> +        tswap32(target->indir_size) == ETH_RXFH_INDIR_NO_CHANGE) {
> +        return sizeof(struct ethtool_rxfh) + tswap32(target->key_size);
> +    }
> +    return sizeof(struct ethtool_rxfh) +
> +        tswap32(target->indir_size) * sizeof(target->rss_config[0]) +
> +        tswap32(target->key_size);
> +}
> +
> +static int host_ethtool_rxfh_size(const void *src)
> +{
> +    const struct ethtool_rxfh *host = src;
> +    if (host->cmd == ETHTOOL_SRSSH &&
> +        host->indir_size == ETH_RXFH_INDIR_NO_CHANGE) {
> +        return sizeof(struct ethtool_rxfh) + host->key_size;
> +    }
> +    return sizeof(struct ethtool_rxfh) +
> +        host->indir_size * sizeof(host->rss_config[0]) +
> +        host->key_size;
> +}
> +
> +const StructEntry struct_ethtool_rxfh_def = {
> +    .convert = {
> +        host_to_target_ethtool_rxfh, target_to_host_ethtool_rxfh },
> +    .thunk_size = {
> +        target_ethtool_rxfh_size, host_ethtool_rxfh_size },
> +    .size = {
> +        sizeof(struct ethtool_rxfh), sizeof(struct ethtool_rxfh) },
> +    .align = {
> +        __alignof__(struct ethtool_rxfh), __alignof__(struct
> ethtool_rxfh) },
> +};
> +
> +/*
> + * struct ethtool_link_settings {
> + *     __u32 cmd;
> + *     __u32 speed;
> + *     __u8  duplex;
> + *     __u8  port;
> + *     __u8  phy_address;
> + *     __u8  autoneg;
> + *     __u8  mdio_support;
> + *     __u8  eth_tp_mdix;
> + *     __u8  eth_tp_mdix_ctrl;
> + *     __s8  link_mode_masks_nwords;
> + *     __u8  transceiver;
> + *     __u8  reserved1[3];
> + *     __u32 reserved[7];
> + *     __u32 link_mode_masks[0];
> + * };
> + *
> + * layout of link_mode_masks fields:
> + * __u32 map_supported[link_mode_masks_nwords];
> + * __u32 map_advertising[link_mode_masks_nwords];
> + * __u32 map_lp_advertising[link_mode_masks_nwords];
> + *
> + * `link_mode_masks_nwords` can be negative when returning from kernel if
> the
> + * provided request size is not supported.
> + */
> +
> +static void host_to_target_ethtool_link_settings(void *dst, const void
> *src)
> +{
> +    int i;
> +    struct ethtool_link_settings *target = dst;
> +    const struct ethtool_link_settings *host = src;
> +
> +    target->cmd = tswap32(host->cmd);
> +    target->speed = tswap32(host->speed);
> +    target->duplex = host->duplex;
> +    target->port = host->port;
> +    target->phy_address = host->phy_address;
> +    target->autoneg = host->autoneg;
> +    target->mdio_support = host->mdio_support;
> +    target->eth_tp_mdix = host->eth_tp_mdix;
> +    target->eth_tp_mdix_ctrl = host->eth_tp_mdix_ctrl;
> +    target->link_mode_masks_nwords = host->link_mode_masks_nwords;
> +    target->transceiver = host->transceiver;
> +    for (i = 0; i < 3; ++i) {
> +        target->reserved1[i] = host->reserved1[i];
> +    }
> +    for (i = 0; i < 7; ++i) {
> +        target->reserved[i] = tswap32(host->reserved[i]);
> +    }
> +
> +    if (host->link_mode_masks_nwords > 0) {
> +        for (i = 0; i < host->link_mode_masks_nwords * 3; ++i) {
> +            target->link_mode_masks[i] =
> tswap32(host->link_mode_masks[i]);
> +        }
> +    }
> +}
> +
> +static void target_to_host_ethtool_link_settings(void *dst, const void
> *src)
> +{
> +    int i;
> +    struct ethtool_link_settings *host = dst;
> +    const struct ethtool_link_settings *target = src;
> +
> +    host->cmd = tswap32(target->cmd);
> +    host->speed = tswap32(target->speed);
> +    host->duplex = target->duplex;
> +    host->port = target->port;
> +    host->phy_address = target->phy_address;
> +    host->autoneg = target->autoneg;
> +    host->mdio_support = target->mdio_support;
> +    host->eth_tp_mdix = target->eth_tp_mdix;
> +    host->eth_tp_mdix_ctrl = target->eth_tp_mdix_ctrl;
> +    host->link_mode_masks_nwords = target->link_mode_masks_nwords;
> +    host->transceiver = target->transceiver;
> +    for (i = 0; i < 3; ++i) {
> +        host->reserved1[i] = target->reserved1[i];
> +    }
> +    for (i = 0; i < 7; ++i) {
> +        host->reserved[i] = tswap32(target->reserved[i]);
> +    }
> +
> +    if (host->link_mode_masks_nwords > 0) {
> +        for (i = 0; i < host->link_mode_masks_nwords * 3; ++i) {
> +            host->link_mode_masks[i] =
> tswap32(target->link_mode_masks[i]);
> +        }
> +    }
> +}
> +
> +static int target_ethtool_link_settings_size(const void *src)
> +{
> +    const struct ethtool_link_settings *target = src;
> +    if (target->link_mode_masks_nwords > 0) {
> +        return sizeof(struct ethtool_link_settings) +
> +            3 * target->link_mode_masks_nwords *
> +            sizeof(target->link_mode_masks[0]);
> +    } else {
> +        return sizeof(struct ethtool_link_settings);
> +    }
> +}
> +
> +static int host_ethtool_link_settings_size(const void *src)
> +{
> +    const struct ethtool_link_settings *host = src;
> +    if (host->link_mode_masks_nwords > 0) {
> +        return sizeof(struct ethtool_link_settings) +
> +            3 * host->link_mode_masks_nwords *
> +            sizeof(host->link_mode_masks[0]);
> +    } else {
> +        return sizeof(struct ethtool_link_settings);
> +    }
> +}
> +
> +const StructEntry struct_ethtool_link_settings_def = {
> +    .convert = {
> +        host_to_target_ethtool_link_settings,
> +        target_to_host_ethtool_link_settings
> +    },
> +    .thunk_size = {
> +        target_ethtool_link_settings_size,
> host_ethtool_link_settings_size },
> +    .size = {
> +        sizeof(struct ethtool_link_settings),
> +        sizeof(struct ethtool_link_settings) },
> +    .align = {
> +        __alignof__(struct ethtool_link_settings),
> +        __alignof__(struct ethtool_link_settings) },
> +};
> +
> +/*
> + * struct ethtool_per_queue_op {
> + *     __u32 cmd;
> + *     __u32 sub_command;
> + *     __u32 queue_mask[__KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32)];
> + *     char  data[];
> + * };
> + *
> + * `queue_mask` are a series of bitmasks of the queues. `data` is a
> complete
> + * command structure for each of the queues addressed.
> + *
> + * When `cmd` is `ETHTOOL_PERQUEUE` and `sub_command` is
> `ETHTOOL_GCOALESCE` or
> + * `ETHTOOL_SCOALESCE`, the command structure is `struct
> ethtool_coalesce`.
> + */
> +static void host_to_target_ethtool_per_queue_op(void *dst, const void
> *src)
> +{
> +    static const argtype ethtool_coalesce_argtype[] = {
> +        MK_STRUCT(STRUCT_ethtool_coalesce), TYPE_NULL };
> +    int i, queue_count;
> +    struct ethtool_per_queue_op *target = dst;
> +    const struct ethtool_per_queue_op *host = src;
> +
> +    target->cmd = tswap32(host->cmd);
> +    target->sub_command = tswap32(host->sub_command);
> +
> +    queue_count = 0;
> +    for (i = 0; i < __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32); ++i) {
> +        target->queue_mask[i] = tswap32(host->queue_mask[i]);
> +        queue_count += ctpop32(host->queue_mask[i]);
> +    }
> +
> +    if (host->cmd != ETHTOOL_PERQUEUE ||
> +        (host->sub_command != ETHTOOL_GCOALESCE &&
> +         host->sub_command != ETHTOOL_SCOALESCE)) {
> +        fprintf(stderr,
> +                "Unknown command 0x%x sub_command 0x%x for "
> +                "ethtool_per_queue_op, unable to convert the `data` field
> "
> +                "(host-to-target)\n",
> +                host->cmd, host->sub_command);
> +        return;
> +    }
> +
> +    for (i = 0; i < queue_count; ++i) {
> +        thunk_convert(target->data + i * sizeof(struct ethtool_coalesce),
> +                      host->data + i * sizeof(struct ethtool_coalesce),
> +                      ethtool_coalesce_argtype, THUNK_TARGET);
> +    }
> +}
> +
> +static void target_to_host_ethtool_per_queue_op(void *dst, const void
> *src)
> +{
> +    static const argtype ethtool_coalesce_argtype[] = {
> +        MK_STRUCT(STRUCT_ethtool_coalesce), TYPE_NULL };
> +    int i, queue_count;
> +    struct ethtool_per_queue_op *host = dst;
> +    const struct ethtool_per_queue_op *target = src;
> +
> +    host->cmd = tswap32(target->cmd);
> +    host->sub_command = tswap32(target->sub_command);
> +
> +    queue_count = 0;
> +    for (i = 0; i < __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32); ++i) {
> +        host->queue_mask[i] = tswap32(target->queue_mask[i]);
> +        queue_count += ctpop32(host->queue_mask[i]);
> +    }
> +
> +    if (host->cmd != ETHTOOL_PERQUEUE ||
> +        (host->sub_command != ETHTOOL_GCOALESCE &&
> +         host->sub_command != ETHTOOL_SCOALESCE)) {
> +        fprintf(stderr,
> +                "Unknown command 0x%x sub_command 0x%x for "
> +                "ethtool_per_queue_op, unable to convert the `data` field
> "
> +                "(target-to-host)\n",
> +                host->cmd, host->sub_command);
> +        return;
> +    }
> +
> +    for (i = 0; i < queue_count; ++i) {
> +        thunk_convert(host->data + i * sizeof(struct ethtool_coalesce),
> +                      target->data + i * sizeof(struct ethtool_coalesce),
> +                      ethtool_coalesce_argtype, THUNK_HOST);
> +    }
> +}
> +
> +static int target_ethtool_per_queue_op_size(const void *src)
> +{
> +    int i, queue_count;
> +    const struct ethtool_per_queue_op *target = src;
> +
> +    if (tswap32(target->cmd) != ETHTOOL_PERQUEUE ||
> +        (tswap32(target->sub_command) != ETHTOOL_GCOALESCE &&
> +         tswap32(target->sub_command) != ETHTOOL_SCOALESCE)) {
> +        fprintf(stderr,
> +                "Unknown command 0x%x sub_command 0x%x for "
> +                "ethtool_per_queue_op, unable to compute the size of the "
> +                "`data` field (target)\n",
> +                tswap32(target->cmd), tswap32(target->sub_command));
> +        return sizeof(struct ethtool_per_queue_op);
> +    }
> +
> +    queue_count = 0;
> +    for (i = 0; i < __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32); ++i) {
> +        queue_count += ctpop32(target->queue_mask[i]);
> +    }
> +    return sizeof(struct ethtool_per_queue_op) +
> +        queue_count * sizeof(struct ethtool_coalesce);
> +}
> +
> +static int host_ethtool_per_queue_op_size(const void *src)
> +{
> +    int i, queue_count;
> +    const struct ethtool_per_queue_op *host = src;
> +
> +    if (host->cmd != ETHTOOL_PERQUEUE ||
> +        (host->sub_command != ETHTOOL_GCOALESCE &&
> +         host->sub_command != ETHTOOL_SCOALESCE)) {
> +        fprintf(stderr,
> +                "Unknown command 0x%x sub_command 0x%x for "
> +                "ethtool_per_queue_op, unable to compute the size of the "
> +                "`data` field (host)\n",
> +                host->cmd, host->sub_command);
> +        return sizeof(struct ethtool_per_queue_op);
> +    }
> +
> +    queue_count = 0;
> +    for (i = 0; i < __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32); ++i) {
> +        queue_count += ctpop32(host->queue_mask[i]);
> +    }
> +    return sizeof(struct ethtool_per_queue_op) +
> +        queue_count * sizeof(struct ethtool_coalesce);
> +}
> +
> +const StructEntry struct_ethtool_per_queue_op_def = {
> +    .convert = {
> +        host_to_target_ethtool_per_queue_op,
> +        target_to_host_ethtool_per_queue_op
> +    },
> +    .thunk_size = {
> +        target_ethtool_per_queue_op_size, host_ethtool_per_queue_op_size
> },
> +    .size = {
> +        sizeof(struct ethtool_per_queue_op),
> +        sizeof(struct ethtool_per_queue_op) },
> +    .align = {
> +        __alignof__(struct ethtool_per_queue_op),
> +        __alignof__(struct ethtool_per_queue_op) },
> +};
> +
> +#define safe_dev_ethtool(fd, ...) \
> +    safe_syscall(__NR_ioctl, (fd), SIOCETHTOOL, __VA_ARGS__)
> +
> +typedef struct EthtoolEntry EthtoolEntry;
> +
> +typedef abi_long do_ethtool_fn(const EthtoolEntry *ee, uint8_t *buf_temp,
> +                               int fd, struct ifreq *host_ifreq);
> +
> +struct EthtoolEntry {
> +    uint32_t cmd;
> +    int access;
> +    do_ethtool_fn *do_ethtool;
> +    const argtype arg_type[3];
> +};
> +
> +#define ETHT_R 0x0001
> +#define ETHT_W 0x0002
> +#define ETHT_RW (ETHT_R | ETHT_W)
> +
> +static do_ethtool_fn do_ethtool_get_rxfh;
> +
> +static EthtoolEntry ethtool_entries[] = {
> +#define ETHTOOL(cmd, access, ...) \
> +    { cmd, access, 0, { __VA_ARGS__ } },
> +#define ETHTOOL_SPECIAL(cmd, access, dofn, ...) \
> +    { cmd, access, dofn, { __VA_ARGS__ } },
> +#include "ethtool_entries.h"
> +#undef ETHTOOL
> +#undef ETHTOOL_SPECIAL
> +    { 0, 0 },
> +};
> +
> +/*
> + * ETHTOOL_GRSSH has two modes of operations: querying the sizes of the
> indir
> + * and key as well as actually querying the indir and key. When either
> + * `indir_size` or `key_size` is zero, the size of the corresponding
> entry is
> + * retrieved and updated into the `ethtool_rxfh` struct. When either of
> them is
> + * non-zero, the actually indir or key is written to `rss_config`.
> + *
> + * This causes a problem for the generic framework which converts between
> host
> + * and target structures without the context. When the convertion
> function sees
> + * an `ethtool_rxfh` struct with non-zero `indir_size` or `key_size`, it
> has to
> + * assume that there are entries in `rss_config` and needs to convert
> them.
> + * Unfortunately, when converting the returned `ethtool_rxfh` struct from
> host
> + * to target after an ETHTOOL_GRSSH call with the first mode, the
> `indir_size`
> + * and `key_size` fields are populated but there is no actual data to be
> + * converted. More importantly, user programs would not have prepared
> enough
> + * memory for the convertion to take place safely.
> + *
> + * ETHTOOL_GRSSH thus needs a special implementation which is aware of
> the two
> + * modes of operations and converts the structure accordingly.
> + */
> +abi_long do_ethtool_get_rxfh(const EthtoolEntry *ee, uint8_t *buf_temp,
> +                             int fd, struct ifreq *host_ifreq)
> +{
> +    const argtype *arg_type = ee->arg_type;
> +    const abi_long ifreq_data = (abi_long)(unsigned
> long)host_ifreq->ifr_data;
> +    struct ethtool_rxfh *rxfh = (struct ethtool_rxfh *)buf_temp;
> +    uint32_t user_indir_size, user_key_size;
> +    abi_long ret;
> +    void *argptr;
> +
> +    assert(arg_type[0] == TYPE_PTR);
> +    assert(ee->access == IOC_RW);
> +    arg_type++;
> +
> +    /*
> +     * As of Linux kernel v5.8-rc4, ETHTOOL_GRSSH calls never read the
> +     * `rss_config` part. Converting only the "header" part suffices.
> +     */
> +    argptr = lock_user(VERIFY_READ, ifreq_data, sizeof(*rxfh), 1);
> +    if (!argptr) {
> +        return -TARGET_EFAULT;
> +    }
> +    convert_ethtool_rxfh_header(rxfh, argptr);
> +    unlock_user(argptr, ifreq_data, sizeof(*rxfh));
> +
> +    if (rxfh->cmd != ETHTOOL_GRSSH) {
> +        return -TARGET_EINVAL;
> +    }
> +    user_indir_size = rxfh->indir_size;
> +    user_key_size = rxfh->key_size;
> +
> +    host_ifreq->ifr_data = (void *)rxfh;
> +    ret = get_errno(safe_dev_ethtool(fd, host_ifreq));
> +
> +    /*
> +     * When a user program supplies `indir_size` or `key_size` but does
> not
> +     * match what the kernel has, the syscall returns EINVAL but the
> structure
> +     * is already updated. Mimicking it here.
> +     */
> +    argptr = lock_user(VERIFY_WRITE, ifreq_data, sizeof(*rxfh), 0);
> +    if (!argptr) {
> +        return -TARGET_EFAULT;
> +    }
> +    convert_ethtool_rxfh_header(argptr, rxfh);
> +    unlock_user(argptr, ifreq_data, 0);
> +
> +    if (is_error(ret)) {
> +        return ret;
> +    }
> +
> +    if (user_indir_size > 0 || user_key_size > 0) {
> +        const int rss_config_size =
> +            user_indir_size * sizeof(rxfh->rss_config[0]) + user_key_size;
> +        argptr = lock_user(VERIFY_WRITE, ifreq_data + sizeof(*rxfh),
> +                           rss_config_size, 0);
> +        if (!argptr) {
> +            return -TARGET_EFAULT;
> +        }
> +        convert_ethtool_rxfh_rss_config(argptr, rxfh->rss_config,
> +                                        user_indir_size, user_key_size);
> +        unlock_user(argptr, ifreq_data + sizeof(*rxfh), rss_config_size);
> +    }
> +    return ret;
> +}
> +
> +/*
> + * Calculates the size of the data type represented by `type_ptr` with
> + * `guest_addr` being the underlying memory. Since `type_ptr` may contain
> + * flexible arrays, we need access to the underlying memory to determine
> their
> + * sizes.
> + */
> +static int thunk_size(abi_long guest_addr, const argtype *type_ptr)
> +{
> +    /*
> +     * lock_user based on `thunk_type_size` then call
> `thunk_type_size_with_src`
> +     * on it.
> +     */
> +    void *src;
> +    int type_size = thunk_type_size(type_ptr, /*is_host=*/ 0);
> +    if (!thunk_type_has_flexible_array(type_ptr)) {
> +        return type_size;
> +    }
> +
> +    src = lock_user(VERIFY_READ, guest_addr, type_size, 0);
> +    type_size = thunk_type_size_with_src(src, type_ptr, /*is_host=*/ 0);
> +    unlock_user(src, guest_addr, 0);
> +
> +    return type_size;
> +}
> +
> +abi_long dev_ethtool(int fd, uint8_t *buf_temp)
> +{
> +    uint32_t *cmd;
> +    uint32_t host_cmd;
> +    const EthtoolEntry *ee;
> +    const argtype *arg_type;
> +    abi_long ret;
> +    int target_size;
> +    void *argptr;
> +
> +    /*
> +     * Make a copy of `host_ifreq` because we are going to reuse
> `buf_temp` and
> +     * overwrite it. Further, we will overwrite `host_ifreq.ifreq_data`,
> so
> +     * keep a copy in `ifreq_data`.
> +     */
> +    struct ifreq host_ifreq = *(struct ifreq *)(unsigned long)buf_temp;
> +    const abi_long ifreq_data = (abi_long)(unsigned
> long)host_ifreq.ifr_data;
> +
> +    cmd = (uint32_t *)lock_user(VERIFY_READ, ifreq_data,
> sizeof(uint32_t), 0);
> +    host_cmd = tswap32(*cmd);
> +    unlock_user(cmd, ifreq_data, 0);
> +
> +    ee = ethtool_entries;
> +    for (;;) {
> +        if (ee->cmd == 0) {
> +            qemu_log_mask(LOG_UNIMP, "Unsupported ethtool cmd=0x%04lx\n",
> +                          (long)host_cmd);
> +            return -TARGET_ENOSYS;
> +        }
> +        if (ee->cmd == host_cmd) {
> +            break;
> +        }
> +        ee++;
> +    }
> +    if (ee->do_ethtool) {
> +        return ee->do_ethtool(ee, buf_temp, fd, &host_ifreq);
> +    }
> +
> +    host_ifreq.ifr_data = buf_temp;
> +    /* Even for ETHT_R, cmd still needs to be copied. */
> +    *(uint32_t *)buf_temp = host_cmd;
> +
> +    arg_type = ee->arg_type;
> +    switch (arg_type[0]) {
> +    case TYPE_NULL:
> +        /* no argument other than cmd */
> +        ret = get_errno(safe_dev_ethtool(fd, &host_ifreq));
> +        break;
> +    case TYPE_PTR:
> +        arg_type++;
> +        target_size = thunk_size(ifreq_data, arg_type);
> +        switch (ee->access) {
> +        case ETHT_R:
> +            ret = get_errno(safe_dev_ethtool(fd, &host_ifreq));
> +            if (!is_error(ret)) {
> +                argptr = lock_user(VERIFY_WRITE, ifreq_data, target_size,
> 0);
> +                if (!argptr) {
> +                    return -TARGET_EFAULT;
> +                }
> +                thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
> +                unlock_user(argptr, ifreq_data, target_size);
> +            }
> +            break;
> +        case ETHT_W:
> +            argptr = lock_user(VERIFY_READ, ifreq_data, target_size, 1);
> +            if (!argptr) {
> +                return -TARGET_EFAULT;
> +            }
> +            thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
> +            unlock_user(argptr, ifreq_data, 0);
> +            ret = get_errno(safe_dev_ethtool(fd, &host_ifreq));
> +            break;
> +        default:
> +        case ETHT_RW:
> +            argptr = lock_user(VERIFY_READ, ifreq_data, target_size, 1);
> +            if (!argptr) {
> +                return -TARGET_EFAULT;
> +            }
> +            thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
> +            unlock_user(argptr, ifreq_data, 0);
> +            ret = get_errno(safe_dev_ethtool(fd, &host_ifreq));
> +            if (!is_error(ret)) {
> +                argptr = lock_user(VERIFY_WRITE, ifreq_data, target_size,
> 0);
> +                if (!argptr) {
> +                    return -TARGET_EFAULT;
> +                }
> +                thunk_convert(argptr, buf_temp, arg_type, THUNK_TARGET);
> +                unlock_user(argptr, ifreq_data, target_size);
> +            }
> +            break;
> +        }
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "Unsupported ethtool type: cmd=0x%04lx type=%d\n",
> +                      (long)host_cmd, arg_type[0]);
> +        ret = -TARGET_ENOSYS;
> +        break;
> +    }
> +    return ret;
> +}
> diff --git a/linux-user/ethtool.h b/linux-user/ethtool.h
> new file mode 100644
> index 0000000000..6942aef095
> --- /dev/null
> +++ b/linux-user/ethtool.h
> @@ -0,0 +1,20 @@
> +#ifndef ETHTOOL_H
> +#define ETHTOOL_H
> +
> +#include <linux/if.h>
> +#include "qemu.h"
> +
> +extern const StructEntry struct_ethtool_rxnfc_get_set_rxfh_def;
> +extern const StructEntry struct_ethtool_sset_info_def;
> +extern const StructEntry struct_ethtool_rxfh_def;
> +extern const StructEntry struct_ethtool_link_settings_def;
> +extern const StructEntry struct_ethtool_per_queue_op_def;
> +
> +/*
> + * Takes the file descriptor and the buffer for temporarily storing data
> read
> + * from / to be written to guest memory. `buf_temp` must now contain the
> host
> + * representation of `struct ifreq`.
> + */
> +abi_long dev_ethtool(int fd, uint8_t *buf_temp);
> +
> +#endif /* ETHTOOL_H */
> diff --git a/linux-user/ethtool_entries.h b/linux-user/ethtool_entries.h
> new file mode 100644
> index 0000000000..14f4e80a21
> --- /dev/null
> +++ b/linux-user/ethtool_entries.h
> @@ -0,0 +1,107 @@
> +  ETHTOOL(ETHTOOL_GSET, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_cmd)))
> +  ETHTOOL(ETHTOOL_SSET, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_cmd)))
> +  ETHTOOL(ETHTOOL_GDRVINFO, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_drvinfo)))
> +  ETHTOOL(ETHTOOL_GREGS, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_regs)))
> +  ETHTOOL(ETHTOOL_GWOL, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_wolinfo)))
> +  ETHTOOL(ETHTOOL_SWOL, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_wolinfo)))
> +  ETHTOOL(ETHTOOL_GMSGLVL, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_SMSGLVL, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GEEE, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_eee)))
> +  ETHTOOL(ETHTOOL_SEEE, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_eee)))
> +  ETHTOOL(ETHTOOL_NWAY_RST, 0, TYPE_NULL)
> +  ETHTOOL(ETHTOOL_GLINK, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GEEPROM, ETHT_RW,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_eeprom)))
> +  ETHTOOL(ETHTOOL_SEEPROM, ETHT_RW,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_eeprom)))
> +  ETHTOOL(ETHTOOL_GCOALESCE, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_coalesce)))
> +  ETHTOOL(ETHTOOL_SCOALESCE, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_coalesce)))
> +  ETHTOOL(ETHTOOL_GRINGPARAM, ETHT_R,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_ringparam)))
> +  ETHTOOL(ETHTOOL_SRINGPARAM, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_ringparam)))
> +  ETHTOOL(ETHTOOL_GPAUSEPARAM, ETHT_R,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_pauseparam)))
> +  ETHTOOL(ETHTOOL_SPAUSEPARAM, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_pauseparam)))
> +  ETHTOOL(ETHTOOL_TEST, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_test)))
> +  ETHTOOL(ETHTOOL_GSTRINGS, ETHT_RW,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_gstrings)))
> +  ETHTOOL(ETHTOOL_PHYS_ID, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GSTATS, ETHT_RW,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_stats)))
> +  ETHTOOL(ETHTOOL_GPERMADDR, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_perm_addr)))
> +  ETHTOOL(ETHTOOL_GFLAGS, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_SFLAGS, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GPFLAGS, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_SPFLAGS, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GRXFH, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_get_set_rxfh)))
> +  ETHTOOL(ETHTOOL_GRXRINGS, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_rss_context)))
> +  ETHTOOL(ETHTOOL_GRXCLSRLCNT, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_rule_cnt)))
> +  ETHTOOL(ETHTOOL_GRXCLSRULE, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_rss_context)))
> +  ETHTOOL(ETHTOOL_GRXCLSRLALL, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_rule_locs)))
> +  ETHTOOL(ETHTOOL_SRXFH, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_get_set_rxfh)))
> +  ETHTOOL(ETHTOOL_SRXCLSRLDEL, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_rss_context)))
> +  ETHTOOL(ETHTOOL_SRXCLSRLINS, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_rss_context)))
> +  ETHTOOL(ETHTOOL_FLASHDEV, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_flash)))
> +  ETHTOOL(ETHTOOL_RESET, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GSSET_INFO, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_sset_info)))
> +  ETHTOOL(ETHTOOL_GRXFHINDIR, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxfh_indir)))
> +  ETHTOOL(ETHTOOL_SRXFHINDIR, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxfh_indir)))
> +  ETHTOOL_SPECIAL(ETHTOOL_GRSSH, ETHT_RW, do_ethtool_get_rxfh,
> +                  MK_PTR(MK_STRUCT(STRUCT_ethtool_rxfh)))
> +  ETHTOOL(ETHTOOL_SRSSH, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_rxfh)))
> +  ETHTOOL(ETHTOOL_GFEATURES, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_gfeatures)))
> +  ETHTOOL(ETHTOOL_SFEATURES, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_sfeatures)))
> +  ETHTOOL(ETHTOOL_GTXCSUM, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GRXCSUM, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GSG, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GTSO, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GGSO, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GGRO, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_STXCSUM, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_SRXCSUM, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_SSG, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_STSO, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_SGSO, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_SGRO, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)))
> +  ETHTOOL(ETHTOOL_GCHANNELS, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_channels)))
> +  ETHTOOL(ETHTOOL_SCHANNELS, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_channels)))
> +  ETHTOOL(ETHTOOL_SET_DUMP, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_dump_no_data)))
> +  ETHTOOL(ETHTOOL_GET_DUMP_FLAG, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_dump_no_data)))
> +  ETHTOOL(ETHTOOL_GET_DUMP_DATA, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_dump)))
> +  ETHTOOL(ETHTOOL_GET_TS_INFO, ETHT_R,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_ts_info)))
> +  ETHTOOL(ETHTOOL_GMODULEINFO, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_modinfo)))
> +  ETHTOOL(ETHTOOL_GMODULEEEPROM, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_eeprom)))
> +  ETHTOOL(ETHTOOL_GTUNABLE, ETHT_RW,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_tunable)))
> +  ETHTOOL(ETHTOOL_STUNABLE, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_tunable)))
> +  ETHTOOL(ETHTOOL_GPHYSTATS, ETHT_RW,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_stats)))
> +  ETHTOOL(ETHTOOL_PERQUEUE, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_per_queue_op)))
> +  ETHTOOL(ETHTOOL_GLINKSETTINGS, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_link_settings)))
> +  ETHTOOL(ETHTOOL_SLINKSETTINGS, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_link_settings)))
> +  ETHTOOL(ETHTOOL_PHY_GTUNABLE, ETHT_RW,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_tunable)))
> +  ETHTOOL(ETHTOOL_PHY_STUNABLE, ETHT_W,
> +          MK_PTR(MK_STRUCT(STRUCT_ethtool_tunable)))
> +  ETHTOOL(ETHTOOL_GFECPARAM, ETHT_R,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_fecparam)))
> +  ETHTOOL(ETHTOOL_GFECPARAM, ETHT_W,
> MK_PTR(MK_STRUCT(STRUCT_ethtool_fecparam)))
> diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
> index 0713ae1311..fd6ac963ec 100644
> --- a/linux-user/ioctls.h
> +++ b/linux-user/ioctls.h
> @@ -238,6 +238,8 @@
>    IOCTL(SIOCSIFHWADDR, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
>    IOCTL(SIOCGIFTXQLEN, IOC_W | IOC_R,
> MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
>    IOCTL(SIOCSIFTXQLEN, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_ifreq)))
> +  IOCTL_SPECIAL(SIOCETHTOOL, IOC_W | IOC_R, do_ioctl_ethtool,
> +                MK_PTR(MK_STRUCT(STRUCT_ptr_ifreq)))
>    IOCTL(SIOCGIFMETRIC, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
>    IOCTL(SIOCSIFMETRIC, IOC_W, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
>    IOCTL(SIOCGIFMTU, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)))
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index 5c964389c1..43f00681f8 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -231,6 +231,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long
> arg1,
>                      abi_long arg2, abi_long arg3, abi_long arg4,
>                      abi_long arg5, abi_long arg6, abi_long arg7,
>                      abi_long arg8);
> +abi_long get_errno(abi_long ret);
>  extern __thread CPUState *thread_cpu;
>  void cpu_loop(CPUArchState *env);
>  const char *target_strerror(int err);
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index bfc4219104..41fea53716 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -127,6 +127,7 @@
>  #include "qapi/error.h"
>  #include "fd-trans.h"
>  #include "tcg/tcg.h"
> +#include "ethtool.h"
>
>  #ifndef CLONE_IO
>  #define CLONE_IO                0x80000000      /* Clone io context */
> @@ -676,7 +677,7 @@ static inline int target_to_host_errno(int err)
>      return err;
>  }
>
> -static inline abi_long get_errno(abi_long ret)
> +abi_long get_errno(abi_long ret)
>  {
>      if (ret == -1)
>          return -host_to_target_errno(errno);
> @@ -4732,16 +4733,6 @@ static abi_long do_ipc(CPUArchState *cpu_env,
>  #endif
>
>  /* kernel structure types definitions */
> -
> -#define STRUCT(name, ...) STRUCT_ ## name,
> -#define STRUCT_SPECIAL(name) STRUCT_ ## name,
> -enum {
> -#include "syscall_types.h"
> -STRUCT_MAX
> -};
> -#undef STRUCT
> -#undef STRUCT_SPECIAL
> -
>  #define STRUCT(name, ...) static const argtype struct_ ## name ## _def[]
> = {  __VA_ARGS__, TYPE_NULL };
>  #define STRUCT_SPECIAL(name)
>  #include "syscall_types.h"
> @@ -4839,6 +4830,29 @@ static abi_long do_ioctl_fs_ioc_fiemap(const
> IOCTLEntry *ie, uint8_t *buf_temp,
>  }
>  #endif
>
> +static abi_long do_ioctl_ethtool(const IOCTLEntry *ie, uint8_t *buf_temp,
> +                                int fd, int cmd, abi_long arg)
> +{
> +    const argtype *arg_type = ie->arg_type;
> +    int target_size;
> +    void *argptr;
> +
> +    assert(arg_type[0] == TYPE_PTR);
> +    assert(ie->access == IOC_RW);
> +
> +    arg_type++;
> +    target_size = thunk_type_size(arg_type, 0);
> +
> +    argptr = lock_user(VERIFY_READ, arg, target_size, 1);
> +    if (!argptr) {
> +        return -TARGET_EFAULT;
> +    }
> +    thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);
> +    unlock_user(argptr, arg, target_size);
> +
> +    return dev_ethtool(fd, buf_temp);
> +}
> +
>  static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>                                  int fd, int cmd, abi_long arg)
>  {
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 70df1a94fb..e25a8cbcc8 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -866,6 +866,8 @@ struct target_rtc_pll_info {
>  #define TARGET_SIOCGIFTXQLEN   0x8942          /* Get the tx queue
> length      */
>  #define TARGET_SIOCSIFTXQLEN   0x8943          /* Set the tx queue
> length      */
>
> +#define TARGET_SIOCETHTOOL     0x8946          /* Ethtool interface
>      */
> +
>  /* ARP cache control calls. */
>  #define TARGET_OLD_SIOCDARP    0x8950          /* old delete ARP table
> entry   */
>  #define TARGET_OLD_SIOCGARP    0x8951          /* old get ARP table
> entry      */
> @@ -2776,4 +2778,14 @@ struct target_statx {
>     /* 0x100 */
>  };
>
> +/* kernel structure types definitions */
> +#define STRUCT(name, ...) STRUCT_ ## name,
> +#define STRUCT_SPECIAL(name) STRUCT_ ## name,
> +enum {
> +#include "syscall_types.h"
> +STRUCT_MAX
> +};
> +#undef STRUCT
> +#undef STRUCT_SPECIAL
> +
>  #endif
> diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h
> index 3f1f033464..559924c752 100644
> --- a/linux-user/syscall_types.h
> +++ b/linux-user/syscall_types.h
> @@ -1,3 +1,4 @@
> +
>  STRUCT_SPECIAL(termios)
>
>  STRUCT(winsize,
> @@ -464,3 +465,282 @@ STRUCT(usbdevfs_disconnect_claim,
>          TYPE_INT, /* flags */
>          MK_ARRAY(TYPE_CHAR, USBDEVFS_MAXDRIVERNAME + 1)) /* driver */
>  #endif /* CONFIG_USBFS */
> +
> +/* ethtool ioctls */
> +STRUCT(ethtool_cmd,
> +       TYPE_INT,   /* cmd */
> +       TYPE_INT,   /* supported */
> +       TYPE_INT,   /* advertising */
> +       TYPE_SHORT, /* speed */
> +       TYPE_CHAR,  /* duplex */
> +       TYPE_CHAR,  /* port */
> +       TYPE_CHAR,  /* phy_address */
> +       TYPE_CHAR,  /* transceiver */
> +       TYPE_CHAR,  /* autoneg */
> +       TYPE_CHAR,  /* mdio_support */
> +       TYPE_INT,   /* maxtxpkt */
> +       TYPE_INT,   /* maxrxpkt */
> +       TYPE_SHORT, /* speed_hi */
> +       TYPE_CHAR,  /* eth_tp_mdix */
> +       TYPE_CHAR,  /* eth_tp_mdix_ctrl */
> +       TYPE_INT,   /* lp_advertising */
> +       MK_ARRAY(TYPE_INT, 2)) /* reserved */
> +
> +STRUCT(ethtool_drvinfo,
> +       TYPE_INT, /* cmd */
> +       MK_ARRAY(TYPE_CHAR, 32), /* driver */
> +       MK_ARRAY(TYPE_CHAR, 32), /* version */
> +       MK_ARRAY(TYPE_CHAR, 32), /* fw_version[ETHTOOL_FWVERS_LEN] */
> +       MK_ARRAY(TYPE_CHAR, 32), /* bus_info[ETHTOOL_BUSINFO_LEN] */
> +       MK_ARRAY(TYPE_CHAR, 32), /* erom_version[ETHTOOL_EROMVERS_LEN] */
> +       MK_ARRAY(TYPE_CHAR, 12), /* reserved2 */
> +       TYPE_INT, /* n_priv_flags */
> +       TYPE_INT, /* n_stats */
> +       TYPE_INT, /* testinfo_len */
> +       TYPE_INT, /* eedump_len */
> +       TYPE_INT) /* regdump_len */
> +
> +STRUCT(ethtool_regs,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* version */
> +       TYPE_INT, /* len */
> +       MK_FLEXIBLE_ARRAY(TYPE_CHAR, 2)) /* data[0]: len */
> +
> +STRUCT(ethtool_wolinfo,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* supported */
> +       TYPE_INT, /* wolopts */
> +       MK_ARRAY(TYPE_CHAR,  6)) /* sopass[SOPASS_MAX] */
> +
> +STRUCT(ethtool_value,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT) /* data */
> +
> +STRUCT(ethtool_eee,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* supported */
> +       TYPE_INT, /* advertised */
> +       TYPE_INT, /* lp_advertised */
> +       TYPE_INT, /* eee_active */
> +       TYPE_INT, /* eee_enabled */
> +       TYPE_INT, /* tx_lpi_enabled */
> +       TYPE_INT, /* tx_lpi_timer */
> +       MK_ARRAY(TYPE_INT, 2)) /* reserved */
> +
> +STRUCT(ethtool_eeprom,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* magic */
> +       TYPE_INT, /* offset */
> +       TYPE_INT, /* len */
> +       MK_FLEXIBLE_ARRAY(TYPE_CHAR, 3)) /* data[0]: len */
> +
> +STRUCT(ethtool_coalesce,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* rx_coalesce_usecs */
> +       TYPE_INT, /* rx_max_coalesced_frames */
> +       TYPE_INT, /* rx_coalesce_usecs_irq */
> +       TYPE_INT, /* rx_max_coalesced_frames_irq */
> +       TYPE_INT, /* tx_coalesce_usecs */
> +       TYPE_INT, /* tx_max_coalesced_frames */
> +       TYPE_INT, /* tx_coalesce_usecs_irq */
> +       TYPE_INT, /* tx_max_coalesced_frames_irq */
> +       TYPE_INT, /* stats_block_coalesce_usecs */
> +       TYPE_INT, /* use_adaptive_rx_coalesce */
> +       TYPE_INT, /* use_adaptive_tx_coalesce */
> +       TYPE_INT, /* pkt_rate_low */
> +       TYPE_INT, /* rx_coalesce_usecs_low */
> +       TYPE_INT, /* rx_max_coalesced_frames_low */
> +       TYPE_INT, /* tx_coalesce_usecs_low */
> +       TYPE_INT, /* tx_max_coalesced_frames_low */
> +       TYPE_INT, /* pkt_rate_high */
> +       TYPE_INT, /* rx_coalesce_usecs_high */
> +       TYPE_INT, /* rx_max_coalesced_frames_high */
> +       TYPE_INT, /* tx_coalesce_usecs_high */
> +       TYPE_INT, /* tx_max_coalesced_frames_high */
> +       TYPE_INT) /* rate_sample_interval */
> +
> +STRUCT(ethtool_ringparam,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* rx_max_pending */
> +       TYPE_INT, /* rx_mini_max_pending */
> +       TYPE_INT, /* rx_jumbo_max_pending */
> +       TYPE_INT, /* tx_max_pending */
> +       TYPE_INT, /* rx_pending */
> +       TYPE_INT, /* rx_mini_pending */
> +       TYPE_INT, /* rx_jumbo_pending */
> +       TYPE_INT) /* tx_pending */
> +
> +STRUCT(ethtool_pauseparam,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* autoneg */
> +       TYPE_INT, /* rx_pause */
> +       TYPE_INT) /* tx_pause */
> +
> +STRUCT(ethtool_test,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* flags */
> +       TYPE_INT, /* reserved */
> +       TYPE_INT, /* len */
> +       MK_FLEXIBLE_ARRAY(TYPE_LONGLONG, 3)) /* data[0]: len */
> +
> +STRUCT(ethtool_gstrings,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* string_set */
> +       TYPE_INT, /* len */
> +       MK_FLEXIBLE_ARRAY(MK_ARRAY(TYPE_CHAR, 32), 2))
> +       /* data[0]: len * ETH_GSTRING_LEN */
> +
> +STRUCT(ethtool_stats,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* n_stats */
> +       MK_FLEXIBLE_ARRAY(TYPE_LONGLONG, 1)) /* data[0]: n_stats */
> +
> +STRUCT(ethtool_perm_addr,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* size */
> +       MK_FLEXIBLE_ARRAY(TYPE_CHAR, 1)) /* data[0]: size */
> +
> +STRUCT(ethtool_flow_ext,
> +       MK_ARRAY(TYPE_CHAR, 2), /* padding */
> +       MK_ARRAY(TYPE_CHAR, 6), /* h_dest[ETH_ALEN] */
> +       MK_ARRAY(TYPE_CHAR, 2), /* __be16 vlan_etype */
> +       MK_ARRAY(TYPE_CHAR, 2), /* __be16 vlan_tci */
> +       MK_ARRAY(TYPE_CHAR, 8)) /* __be32 data[2] */
> +
> +/*
> + * Union ethtool_flow_union contains alternatives that are either struct
> that
> + * only uses __be* types or char/__u8, or "__u8 hdata[52]". We can treat
> it as
> + * byte array in all cases.
> + */
> +STRUCT(ethtool_rx_flow_spec,
> +       TYPE_INT,                           /* flow_type */
> +       MK_ARRAY(TYPE_CHAR, 52),            /* union ethtool_flow_union
> h_u */
> +       MK_STRUCT(STRUCT_ethtool_flow_ext), /* h_ext */
> +       MK_ARRAY(TYPE_CHAR, 52),            /* union ethtool_flow_union
> m_u */
> +       MK_STRUCT(STRUCT_ethtool_flow_ext), /* m_ext */
> +       TYPE_LONGLONG,                      /* ring_cookie */
> +       TYPE_INT)                           /* location */
> +
> +STRUCT(ethtool_rxnfc_rss_context,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* flow_type */
> +       TYPE_LONGLONG, /* data */
> +       MK_STRUCT(STRUCT_ethtool_rx_flow_spec), /* fs */
> +       TYPE_INT) /* rss_context */
> +
> +STRUCT(ethtool_rxnfc_rule_cnt,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* flow_type */
> +       TYPE_LONGLONG, /* data */
> +       MK_STRUCT(STRUCT_ethtool_rx_flow_spec), /* fs */
> +       TYPE_INT) /* rss_cnt */
> +
> +STRUCT(ethtool_rxnfc_rule_locs,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* flow_type */
> +       TYPE_LONGLONG, /* data */
> +       MK_STRUCT(STRUCT_ethtool_rx_flow_spec), /* fs */
> +       TYPE_INT, /* rss_cnt */
> +       MK_FLEXIBLE_ARRAY(TYPE_INT, 4)) /* rule_locs[0]: rss_cnt */
> +
> +/*
> + * For ETHTOOL_{G,S}RXFH, originally only the first three fields are
> defined,
> + * but with certain options, more fields are used.
> + */
> +STRUCT_SPECIAL(ethtool_rxnfc_get_set_rxfh)
> +
> +STRUCT(ethtool_flash,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* region */
> +       MK_ARRAY(TYPE_CHAR, 128)) /* data[ETHTOOL_FLASH_MAX_FILENAME] */
> +
> +STRUCT_SPECIAL(ethtool_sset_info)
> +
> +STRUCT(ethtool_rxfh_indir,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* size */
> +       MK_FLEXIBLE_ARRAY(TYPE_INT, 1)) /* ring_index[0]: size */
> +
> +STRUCT_SPECIAL(ethtool_rxfh)
> +
> +STRUCT(ethtool_get_features_block,
> +       TYPE_INT, /* available */
> +       TYPE_INT, /* requested */
> +       TYPE_INT, /* active */
> +       TYPE_INT) /* never_changed */
> +
> +STRUCT(ethtool_gfeatures,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* size */
> +       MK_FLEXIBLE_ARRAY(MK_STRUCT(STRUCT_ethtool_get_features_block), 1))
> +       /* features[0]: size */
> +
> +STRUCT(ethtool_set_features_block,
> +       TYPE_INT, /* valid */
> +       TYPE_INT) /* requested */
> +
> +STRUCT(ethtool_sfeatures,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* size */
> +       MK_FLEXIBLE_ARRAY(MK_STRUCT(STRUCT_ethtool_set_features_block), 1))
> +       /* features[0]: size */
> +
> +STRUCT(ethtool_channels,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* max_rx */
> +       TYPE_INT, /* max_tx */
> +       TYPE_INT, /* max_other */
> +       TYPE_INT, /* max_combined */
> +       TYPE_INT, /* rx_count */
> +       TYPE_INT, /* tx_count */
> +       TYPE_INT, /* other_count */
> +       TYPE_INT) /* combined_count */
> +
> +/*
> + * For ETHTOOL_SET_DUMP and ETHTOOL_GET_DUMP_FLAG, the flexible array
> `data` is
> + * not used.
> + */
> +STRUCT(ethtool_dump_no_data,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* version */
> +       TYPE_INT, /* flag */
> +       TYPE_INT) /* len */
> +
> +STRUCT(ethtool_dump,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* version */
> +       TYPE_INT, /* flag */
> +       TYPE_INT, /* len */
> +       MK_FLEXIBLE_ARRAY(TYPE_CHAR, 3)) /* data[0]: len */
> +
> +STRUCT(ethtool_ts_info,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* so_timestamping */
> +       TYPE_INT, /* phc_index */
> +       TYPE_INT, /* tx_types */
> +       MK_ARRAY(TYPE_INT, 3), /* tx_reserved */
> +       TYPE_INT, /* rx_filters */
> +       MK_ARRAY(TYPE_INT, 3)) /* rx_reserved */
> +
> +STRUCT(ethtool_modinfo,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* type */
> +       TYPE_INT, /* eeprom_len */
> +       MK_ARRAY(TYPE_INT, 8)) /* reserved */
> +
> +STRUCT(ethtool_tunable,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* id */
> +       TYPE_INT, /* type_id */
> +       TYPE_INT, /* len */
> +       MK_FLEXIBLE_ARRAY(TYPE_PTRVOID, 3)) /* data[0]: len */
> +
> +STRUCT_SPECIAL(ethtool_link_settings)
> +
> +STRUCT(ethtool_fecparam,
> +       TYPE_INT, /* cmd */
> +       TYPE_INT, /* active_fec */
> +       TYPE_INT, /* fec */
> +       TYPE_INT) /* reserved */
> +
> +STRUCT_SPECIAL(ethtool_per_queue_op)
> diff --git a/tests/tcg/multiarch/ethtool.c b/tests/tcg/multiarch/ethtool.c
> new file mode 100644
> index 0000000000..dcb10230e0
> --- /dev/null
> +++ b/tests/tcg/multiarch/ethtool.c
> @@ -0,0 +1,423 @@
> +#include <asm-generic/errno.h>
> +#include <assert.h>
> +#include <errno.h>
> +#include <inttypes.h>
> +#include <linux/ethtool.h>
> +#include <linux/if.h>
> +#include <linux/sockios.h>
> +#include <netinet/in.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/socket.h>
> +
> +const int number_of_entries_to_print = 10;
> +const uint32_t protected_memory_pattern[] = {
> +      0xdeadc0de, 0xb0bb1e, 0xfacade, 0xfeeb1e };
> +
> +static void fail_with(const char *action, const char *cmd_name, int cmd,
> +                      int err)
> +{
> +    if (errno == EOPNOTSUPP) {
> +        printf("Unsupported operation: %s; errno = %d: %s.\n"
> +               "TEST SKIPPED (%s = 0x%x).\n",
> +               action, err, strerror(err), cmd_name, cmd);
> +        return;
> +    }
> +    if (err) {
> +        fprintf(stderr,
> +                "Failed to %s (%s = 0x%x): errno = %d: %s\n",
> +                action, cmd_name, cmd, err, strerror(err));
> +    } else {
> +        fprintf(stderr,
> +                "Failed to %s (%s = 0x%x): no errno\n",
> +                action, cmd_name, cmd);
> +    }
> +    exit(err);
> +}
> +#define FAIL(action, cmd) fail_with(action, #cmd, cmd, errno)
> +
> +/*
> + * `calloc_protected` and `protected_memory_changed` can be used to
> verify that
> + * a system call does not write pass intended memory boundary.
> + *
> + * `ptr = calloc_protected(n)` will allocate extra memory after `n` bytes
> and
> + * populate it with a memory pattern. The first `n` bytes are still
> guaranteed
> + * to be zeroed out like `calloc(1, n)`. `protected_memory_changed(ptr,
> n)`
> + * takes the pointer and the original size `n` and checks that the memory
> + * pattern is intact.
> + */
> +uint8_t *calloc_protected(size_t struct_size)
> +{
> +    uint8_t *buf = (uint8_t *) calloc(
> +        1,
> +        struct_size + sizeof(protected_memory_pattern));
> +    memcpy(buf + struct_size, protected_memory_pattern,
> +           sizeof(protected_memory_pattern));
> +    return buf;
> +}
> +
> +bool protected_memory_changed(const uint8_t *ptr, size_t struct_size)
> +{
> +    return memcmp(ptr + struct_size, protected_memory_pattern,
> +                  sizeof(protected_memory_pattern)) != 0;
> +}
> +
> +void print_entries(const char *fmt, int len, uint32_t *entries)
> +{
> +    int i;
> +    for (i = 0; i < len && i < number_of_entries_to_print; ++i) {
> +        printf(fmt, entries[i]);
> +    }
> +    if (len > number_of_entries_to_print) {
> +        printf(" (%d more omitted)", len - number_of_entries_to_print);
> +    }
> +}
> +
> +void basic_test(int socketfd, struct ifreq ifr)
> +{
> +    struct ethtool_drvinfo drvinfo;
> +    drvinfo.cmd = ETHTOOL_GDRVINFO;
> +    ifr.ifr_data = (void *)&drvinfo;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get driver info", ETHTOOL_GDRVINFO);
> +        return;
> +    }
> +    printf("Driver: %s (version %s)\n", drvinfo.driver, drvinfo.version);
> +}
> +
> +/* Test flexible array. */
> +void test_get_stats(int socketfd, struct ifreq ifr, int n_stats)
> +{
> +    int i;
> +    struct ethtool_stats *stats = (struct ethtool_stats *)calloc(
> +        1, sizeof(*stats) + sizeof(stats->data[0]) * n_stats);
> +    stats->cmd = ETHTOOL_GSTATS;
> +    stats->n_stats = n_stats;
> +    ifr.ifr_data = (void *)stats;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get statastics", ETHTOOL_GSTATS);
> +        free(stats);
> +        return;
> +    }
> +    if (stats->n_stats != n_stats) {
> +        FAIL("get consistent number of statistics", ETHTOOL_GSTATS);
> +    }
> +    for (i = 0; i < stats->n_stats && i < number_of_entries_to_print;
> ++i) {
> +        printf("stats[%d] = %llu\n", i, (unsigned long
> long)stats->data[i]);
> +    }
> +    if (stats->n_stats > number_of_entries_to_print) {
> +        printf("(%d more omitted)\n",
> +               stats->n_stats - number_of_entries_to_print);
> +    }
> +    free(stats);
> +}
> +
> +/* Test flexible array with char array as elements. */
> +void test_get_strings(int socketfd, struct ifreq ifr, int n_stats)
> +{
> +    int i;
> +    struct ethtool_gstrings *gstrings =
> +        (struct ethtool_gstrings *)calloc(
> +            1, sizeof(*gstrings) + ETH_GSTRING_LEN * n_stats);
> +    gstrings->cmd = ETHTOOL_GSTRINGS;
> +    gstrings->string_set = ETH_SS_STATS;
> +    gstrings->len = n_stats;
> +    ifr.ifr_data = (void *)gstrings;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get string set", ETHTOOL_GSTRINGS);
> +        free(gstrings);
> +        return;
> +    }
> +    if (gstrings->len != n_stats) {
> +        FAIL("get consistent number of statistics", ETHTOOL_GSTRINGS);
> +    }
> +    for (i = 0; i < gstrings->len && i < number_of_entries_to_print; ++i)
> {
> +        printf("stat_names[%d] = %.*s\n",
> +               i, ETH_GSTRING_LEN, gstrings->data + i * ETH_GSTRING_LEN);
> +    }
> +    if (gstrings->len > number_of_entries_to_print) {
> +        printf("(%d more omitted)\n",
> +               gstrings->len - number_of_entries_to_print);
> +    }
> +    free(gstrings);
> +}
> +
> +/*
> + * Testing manual implementation of converting `struct
> ethtool_sset_info`, also
> + * info for subsequent tests.
> + */
> +int test_get_sset_info(int socketfd, struct ifreq ifr)
> +{
> +    const int n_sset = 2;
> +    int n_stats;
> +    struct ethtool_sset_info *sset_info =
> +        (struct ethtool_sset_info *)calloc(
> +            1, sizeof(*sset_info) + sizeof(sset_info->data[0]) * n_sset);
> +    sset_info->cmd = ETHTOOL_GSSET_INFO;
> +    sset_info->sset_mask = 1 << ETH_SS_TEST | 1 << ETH_SS_STATS;
> +    assert(__builtin_popcount(sset_info->sset_mask) == n_sset);
> +    ifr.ifr_data = (void *)sset_info;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        fail_with("get string set info", "ETHTOOL_GSSET_INFO",
> +                  ETHTOOL_GSSET_INFO, errno);
> +        free(sset_info);
> +        return 0;
> +    }
> +    if ((sset_info->sset_mask & (1 << ETH_SS_STATS)) == 0) {
> +        puts("No stats string set info, SKIPPING dependent tests");
> +        free(sset_info);
> +        return 0;
> +    }
> +    n_stats = (sset_info->sset_mask & (1 << ETH_SS_TEST)) ?
> +        sset_info->data[1] :
> +        sset_info->data[0];
> +    printf("n_stats = %d\n", n_stats);
> +    free(sset_info);
> +    return n_stats;
> +}
> +
> +/*
> + * Test manual implementation of converting `struct ethtool_rxnfc`,
> focusing on
> + * the case where only the first three fields are present. (The original
> struct
> + * definition.)
> + */
> +void test_get_rxfh(int socketfd, struct ifreq ifr)
> +{
> +    struct ethtool_rxnfc *rxnfc;
> +    const int rxnfc_first_three_field_size =
> +        sizeof(rxnfc->cmd) + sizeof(rxnfc->flow_type) +
> sizeof(rxnfc->data);
> +    rxnfc = (struct ethtool_rxnfc *)calloc_protected(
> +        rxnfc_first_three_field_size);
> +    rxnfc->cmd = ETHTOOL_GRXFH;
> +    rxnfc->flow_type = TCP_V4_FLOW;
> +    ifr.ifr_data = (void *)rxnfc;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get RX flow classification rules", ETHTOOL_GRXFH);
> +        free(rxnfc);
> +        return;
> +    }
> +    if (protected_memory_changed((const uint8_t *)rxnfc,
> +                                 rxnfc_first_three_field_size)) {
> +        FAIL("preserve memory after the first three fields",
> ETHTOOL_GRXFH);
> +    }
> +    printf("Flow hash bitmask (flow_type = TCP v4): 0x%llx\n",
> +           (unsigned long long)rxnfc->data);
> +    free(rxnfc);
> +}
> +
> +/* Test manual implementation of converting `struct
> ethtool_link_settings`. */
> +void test_get_link_settings(int socketfd, struct ifreq ifr)
> +{
> +    int link_mode_masks_nwords;
> +    struct ethtool_link_settings *link_settings_header =
> +        (struct ethtool_link_settings *) calloc_protected(
> +            sizeof(*link_settings_header));
> +    link_settings_header->cmd = ETHTOOL_GLINKSETTINGS;
> +    link_settings_header->link_mode_masks_nwords = 0;
> +    ifr.ifr_data = (void *)link_settings_header;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get link settings mask sizes", ETHTOOL_GLINKSETTINGS);
> +        free(link_settings_header);
> +        return;
> +    }
> +    if (protected_memory_changed((const uint8_t *)link_settings_header,
> +                                 sizeof(*link_settings_header))) {
> +        FAIL("preserve link_mode_masks", ETHTOOL_GLINKSETTINGS);
> +    }
> +    if (link_settings_header->link_mode_masks_nwords >= 0) {
> +        FAIL("complete handshake", ETHTOOL_GLINKSETTINGS);
> +    }
> +    link_mode_masks_nwords =
> -link_settings_header->link_mode_masks_nwords;
> +
> +    struct ethtool_link_settings *link_settings =
> +        (struct ethtool_link_settings *)calloc(
> +            1,
> +            sizeof(*link_settings) +
> +            sizeof(link_settings_header->link_mode_masks[0]) *
> +            link_mode_masks_nwords * 3);
> +    link_settings->cmd = ETHTOOL_GLINKSETTINGS;
> +    link_settings->link_mode_masks_nwords = link_mode_masks_nwords;
> +    ifr.ifr_data = (void *)link_settings;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get link settings", ETHTOOL_GLINKSETTINGS);
> +        free(link_settings_header);
> +        free(link_settings);
> +        return;
> +    }
> +    if (link_settings->link_mode_masks_nwords != link_mode_masks_nwords) {
> +        FAIL("have consistent number of mode masks",
> ETHTOOL_GLINKSETTINGS);
> +    }
> +
> +    printf("Link speed: %d MB\n", link_settings->speed);
> +    printf("Number of link mode masks: %d\n",
> +           link_settings->link_mode_masks_nwords);
> +    if (link_settings->link_mode_masks_nwords > 0) {
> +        printf("Supported bitmap:");
> +        print_entries(" 0x%08x",
> +                      link_settings->link_mode_masks_nwords,
> +                      link_settings->link_mode_masks);
> +        putchar('\n');
> +
> +        printf("Advertising bitmap:");
> +        print_entries(" 0x%08x",
> +                      link_settings->link_mode_masks_nwords,
> +                      link_settings->link_mode_masks +
> +                      link_settings->link_mode_masks_nwords);
> +        putchar('\n');
> +
> +        printf("Lp advertising bitmap:");
> +        print_entries(" 0x%08x",
> +                      link_settings->link_mode_masks_nwords,
> +                      link_settings->link_mode_masks +
> +                      2 * link_settings->link_mode_masks_nwords);
> +        putchar('\n');
> +    }
> +
> +    free(link_settings_header);
> +    free(link_settings);
> +}
> +
> +/* Test manual implementation of converting `struct
> ethtool_per_queue_op`. */
> +void test_perqueue(int socketfd, struct ifreq ifr)
> +{
> +    const int n_queue = 2;
> +    int i;
> +    struct ethtool_per_queue_op *per_queue_op =
> +        (struct ethtool_per_queue_op *)calloc(
> +            1,
> +            sizeof(*per_queue_op) + sizeof(struct ethtool_coalesce) *
> n_queue);
> +    per_queue_op->cmd = ETHTOOL_PERQUEUE;
> +    per_queue_op->sub_command = ETHTOOL_GCOALESCE;
> +    per_queue_op->queue_mask[0] = 0x3;
> +    ifr.ifr_data = (void *)per_queue_op;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get coalesce per queue", ETHTOOL_PERQUEUE);
> +        free(per_queue_op);
> +        return;
> +    }
> +    for (i = 0; i < n_queue; ++i) {
> +        struct ethtool_coalesce *coalesce = (struct ethtool_coalesce *)(
> +            per_queue_op->data + sizeof(*coalesce) * i);
> +        if (coalesce->cmd != ETHTOOL_GCOALESCE) {
> +            fprintf(stderr,
> +                    "ETHTOOL_PERQUEUE (%d) sub_command ETHTOOL_GCOALESCE
> (%d) "
> +                    "fails to set entry %d's cmd to ETHTOOL_GCOALESCE,
> got %d "
> +                    "instead\n",
> +                    ETHTOOL_PERQUEUE, ETHTOOL_GCOALESCE, i,
> +                    coalesce->cmd);
> +            exit(-1);
> +        }
> +        printf("rx_coalesce_usecs[%d] = %u\nrx_max_coalesced_frames[%d] =
> %u\n",
> +               i, coalesce->rx_coalesce_usecs,
> +               i, coalesce->rx_max_coalesced_frames);
> +    }
> +
> +    free(per_queue_op);
> +}
> +
> +/* Test manual implementation of ETHTOOL_GRSSH. */
> +void test_get_rssh(int socketfd, struct ifreq ifr)
> +{
> +    int i;
> +    struct ethtool_rxfh *rxfh_header =
> +        (struct ethtool_rxfh *)calloc_protected(sizeof(*rxfh_header));
> +    rxfh_header->cmd = ETHTOOL_GRSSH;
> +    ifr.ifr_data = (void *)rxfh_header;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get RX flow hash indir and hash key size", ETHTOOL_GRSSH);
> +        free(rxfh_header);
> +        return;
> +    }
> +    if (protected_memory_changed((const uint8_t *)rxfh_header,
> +                                 sizeof(*rxfh_header))) {
> +        FAIL("preserve rss_config", ETHTOOL_GRSSH);
> +    }
> +    printf("RX flow hash indir size = %d\nRX flow hash key size = %d\n",
> +           rxfh_header->indir_size, rxfh_header->key_size);
> +
> +    struct ethtool_rxfh *rxfh = (struct ethtool_rxfh *)calloc(
> +        1,
> +        sizeof(*rxfh) + 4 * rxfh_header->indir_size +
> rxfh_header->key_size);
> +    *rxfh = *rxfh_header;
> +    ifr.ifr_data = (void *)rxfh;
> +    if (ioctl(socketfd, SIOCETHTOOL, &ifr) == -1) {
> +        FAIL("get RX flow hash indir and hash key", ETHTOOL_GRSSH);
> +        free(rxfh_header);
> +        free(rxfh);
> +        return;
> +    }
> +
> +    if (rxfh->indir_size == 0) {
> +        printf("No RX flow hash indir\n");
> +    } else {
> +        printf("RX flow hash indir:");
> +        print_entries(" 0x%08x", rxfh->indir_size, rxfh->rss_config);
> +        putchar('\n');
> +    }
> +
> +    if (rxfh->key_size == 0) {
> +        printf("No RX flow hash key\n");
> +    } else {
> +        char *key = (char *)(rxfh->rss_config + rxfh->indir_size);
> +        printf("RX flow hash key:");
> +        for (i = 0;  i < rxfh->key_size; ++i) {
> +            if (i % 2 == 0) {
> +                putchar(' ');
> +            }
> +            printf("%02hhx", key[i]);
> +        }
> +        putchar('\n');
> +    }
> +    free(rxfh_header);
> +    free(rxfh);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int socketfd, n_stats, i;
> +    struct ifreq ifr;
> +
> +    socketfd = socket(AF_INET, SOCK_DGRAM, 0);
> +    if (socketfd == -1) {
> +        int err = errno;
> +        fprintf(stderr,
> +                "Failed to open socket: errno = %d: %s\n",
> +                err, strerror(err));
> +        return err;
> +    }
> +
> +    for (i = 1;; ++i) {
> +        ifr.ifr_ifindex = i;
> +        if (ioctl(socketfd, SIOCGIFNAME, &ifr) == -1) {
> +            puts("Could not find a non-loopback interface, SKIPPING");
> +            return 0;
> +        }
> +        if (strncmp(ifr.ifr_name, "lo", IFNAMSIZ) != 0) {
> +            break;
> +        }
> +    }
> +    printf("Interface index: %d\nInterface name: %.*s\n",
> +           ifr.ifr_ifindex, IFNAMSIZ, ifr.ifr_name);
> +
> +    basic_test(socketfd, ifr);
> +
> +    n_stats = test_get_sset_info(socketfd, ifr);
> +    if (n_stats > 0) {
> +        /* Testing lexible arrays. */
> +        test_get_stats(socketfd, ifr, n_stats);
> +        test_get_strings(socketfd, ifr, n_stats);
> +    }
> +
> +    /* Testing manual implementations of structure convertions. */
> +    test_get_rxfh(socketfd, ifr);
> +    test_get_link_settings(socketfd, ifr);
> +    test_perqueue(socketfd, ifr);
> +
> +    /* Testing manual implementations of operations. */
> +    test_get_rssh(socketfd, ifr);
> +
> +    return 0;
> +}
> --
> 2.28.0.220.ged08abb693-goog
>
>

--000000000000e1b8e105b6b53131
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping -- any comments on <a href=3D"https://patchew.org/QEM=
U/cover.1597129029.git.scw@google.com/61323061160b6d21f43b266764eda813b5e02=
1e2.1597129029.git.scw@google.com/">https://patchew.org/QEMU/cover.15971290=
29.git.scw@google.com/61323061160b6d21f43b266764eda813b5e021e2.1597129029.g=
it.scw@google.com/</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Aug 11, 2020 at 12:10 AM Shu-Chun Weng &lt;<a=
 href=3D"mailto:scw@google.com">scw@google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">The ioctl numeric values are =
platform-independent and determined by<br>
the file include/uapi/linux/sockios.h in Linux kernel source code:<br>
<br>
=C2=A0 #define SIOCETHTOOL=C2=A0 =C2=A00x8946<br>
<br>
These ioctls get (or set) various structures pointed by the field<br>
ifr_data in the structure ifreq depending on the first 4 bytes of the<br>
memory region.<br>
<br>
This change clones the ioctl framework into ethtool-specific dispatch<br>
logic in its own file. A number of definitions previously only visible<br>
in syscall.c are thus exported to syscall_defs.h to be used in the new<br>
files.<br>
<br>
Signed-off-by: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" target=
=3D"_blank">scw@google.com</a>&gt;<br>
---<br>
v1 -&gt; v2:<br>
=C2=A0 Fix style problems.<br>
<br>
=C2=A0linux-user/Makefile.objs=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
=C2=A0linux-user/ethtool.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 840 ++++++++=
++++++++++++++++++++++++++<br>
=C2=A0linux-user/ethtool.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +<b=
r>
=C2=A0linux-user/ethtool_entries.h=C2=A0 | 107 +++++<br>
=C2=A0linux-user/ioctls.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +<br>
=C2=A0linux-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 +-<=
br>
=C2=A0linux-user/syscall_defs.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 12 +<br>
=C2=A0linux-user/syscall_types.h=C2=A0 =C2=A0 | 280 ++++++++++++<br>
=C2=A0tests/tcg/multiarch/ethtool.c | 423 +++++++++++++++++<br>
=C2=A010 files changed, 1712 insertions(+), 12 deletions(-)<br>
=C2=A0create mode 100644 linux-user/ethtool.c<br>
=C2=A0create mode 100644 linux-user/ethtool.h<br>
=C2=A0create mode 100644 linux-user/ethtool_entries.h<br>
=C2=A0create mode 100644 tests/tcg/multiarch/ethtool.c<br>
<br>
diff --git a/linux-user/Makefile.objs b/linux-user/Makefile.objs<br>
index 1940910a73..971d43173a 100644<br>
--- a/linux-user/Makefile.objs<br>
+++ b/linux-user/Makefile.objs<br>
@@ -1,7 +1,8 @@<br>
=C2=A0obj-y =3D main.o syscall.o strace.o mmap.o signal.o \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 elfload.o linuxload.o uaccess.o uname.o \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 safe-syscall.o $(TARGET_ABI_DIR)/signal.o \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(TARGET_ABI_DIR)/cpu_loop.o exit.o fd-trans.o=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_ABI_DIR)/cpu_loop.o exit.o fd-trans.o =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ethtool.o<br>
<br>
=C2=A0obj-$(TARGET_HAS_BFLT) +=3D flatload.o<br>
=C2=A0obj-$(TARGET_I386) +=3D vm86.o<br>
diff --git a/linux-user/ethtool.c b/linux-user/ethtool.c<br>
new file mode 100644<br>
index 0000000000..fac97b9ba1<br>
--- /dev/null<br>
+++ b/linux-user/ethtool.c<br>
@@ -0,0 +1,840 @@<br>
+/*<br>
+ *=C2=A0 Linux ioctl system call SIOCETHTOOL requests<br>
+ *<br>
+ *=C2=A0 Copyright (c) 2020 Shu-Chun Weng<br>
+ *<br>
+ *=C2=A0 This program is free software; you can redistribute it and/or mod=
ify<br>
+ *=C2=A0 it under the terms of the GNU General Public License as published=
 by<br>
+ *=C2=A0 the Free Software Foundation; either version 2 of the License, or=
<br>
+ *=C2=A0 (at your option) any later version.<br>
+ *<br>
+ *=C2=A0 This program is distributed in the hope that it will be useful,<b=
r>
+ *=C2=A0 but WITHOUT ANY WARRANTY; without even the implied warranty of<br=
>
+ *=C2=A0 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See th=
e<br>
+ *=C2=A0 GNU General Public License for more details.<br>
+ *<br>
+ *=C2=A0 You should have received a copy of the GNU General Public License=
<br>
+ *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://www.gn=
u.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/li=
censes/</a>&gt;.<br>
+ */<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;linux/ethtool.h&gt;<br>
+#include &lt;linux/if.h&gt;<br>
+#include &lt;linux/sockios.h&gt;<br>
+#include &lt;linux/unistd.h&gt;<br>
+#include &quot;ethtool.h&quot;<br>
+#include &quot;qemu.h&quot;<br>
+#include &quot;syscall_defs.h&quot;<br>
+<br>
+/* Non-standard ethtool structure definitions. */<br>
+/*<br>
+ * struct ethtool_rxnfc {<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 cmd;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 flow_type;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u64 data;<br>
+ *=C2=A0 =C2=A0 =C2=A0struct ethtool_rx_flow_spec fs;<br>
+ *=C2=A0 =C2=A0 =C2=A0union {<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 rule_cnt;<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 rss_context;<br>
+ *=C2=A0 =C2=A0 =C2=A0};<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 rule_locs[0];<br>
+ * };<br>
+ *<br>
+ * Originally defined for ETHTOOL_{G,S}RXFH with only the cmd, flow_type a=
nd<br>
+ * data members. For other commands, dedicated standard structure definiti=
ons<br>
+ * are listed in syscall_types.h.<br>
+ */<br>
+static void host_to_target_ethtool_rxnfc_get_set_rxfh(void *dst,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 static const argtype ethtool_rx_flow_spec_argtype[] =3D {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_STRUCT(STRUCT_ethtool_rx_flow_spec), TYPE_N=
ULL };<br>
+=C2=A0 =C2=A0 struct ethtool_rxnfc *target =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_rxnfc *host =3D src;<br>
+<br>
+=C2=A0 =C2=A0 target-&gt;cmd =3D tswap32(host-&gt;cmd);<br>
+=C2=A0 =C2=A0 target-&gt;flow_type =3D tswap32(host-&gt;flow_type);<br>
+=C2=A0 =C2=A0 target-&gt;data =3D tswap64(host-&gt;data);<br>
+<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd =3D=3D ETHTOOL_SRXFH) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* struct ethtool_rxnfc was originally de=
fined for ETHTOOL_{G,S}RXFH<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* with only the cmd, flow_type and data =
members. Guest program might<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* still be using that definition.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd !=3D ETHTOOL_GRXFH) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;host_to_target_ethtool_r=
xnfc_get_set_rxfh called with &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;command 0x%x=
 which is not ETHTOOL_SRXFH or ETHTOOL_GRXFH\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;cmd);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if ((host-&gt;flow_type &amp; FLOW_RSS) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* If `FLOW_RSS` was requested then guest program must =
be using the new<br>
+=C2=A0 =C2=A0 =C2=A0* definition.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 thunk_convert(&amp;target-&gt;fs, &amp;host-&gt;fs, ethtool_=
rx_flow_spec_argtype,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 THUNK_TARGE=
T);<br>
+=C2=A0 =C2=A0 target-&gt;rule_cnt =3D tswap32(host-&gt;rule_cnt);<br>
+}<br>
+<br>
+static void target_to_host_ethtool_rxnfc_get_set_rxfh(void *dst,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 static const argtype ethtool_rx_flow_spec_argtype[] =3D {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_STRUCT(STRUCT_ethtool_rx_flow_spec), TYPE_N=
ULL };<br>
+=C2=A0 =C2=A0 struct ethtool_rxnfc *host =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_rxnfc *target =3D src;<br>
+<br>
+=C2=A0 =C2=A0 host-&gt;cmd =3D tswap32(target-&gt;cmd);<br>
+=C2=A0 =C2=A0 host-&gt;flow_type =3D tswap32(target-&gt;flow_type);<br>
+=C2=A0 =C2=A0 host-&gt;data =3D tswap64(target-&gt;data);<br>
+<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd =3D=3D ETHTOOL_SRXFH) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* struct ethtool_rxnfc was originally de=
fined for ETHTOOL_{G,S}RXFH<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* with only the cmd, flow_type and data =
members. Guest program might<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* still be using that definition.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd !=3D ETHTOOL_GRXFH) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;target_to_host_ethtool_r=
xnfc_get_set_rxfh called with &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;command 0x%x=
 which is not ETHTOOL_SRXFH or ETHTOOL_GRXFH\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;cmd);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if ((host-&gt;flow_type &amp; FLOW_RSS) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* If `FLOW_RSS` was requested then guest program must =
be using the new<br>
+=C2=A0 =C2=A0 =C2=A0* definition.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 thunk_convert(&amp;host-&gt;fs, &amp;target-&gt;fs, ethtool_=
rx_flow_spec_argtype,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 THUNK_HOST)=
;<br>
+=C2=A0 =C2=A0 host-&gt;rule_cnt =3D tswap32(target-&gt;rule_cnt);<br>
+}<br>
+<br>
+static int target_ethtool_rxnfc_get_set_rxfh_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 const struct ethtool_rxnfc *target =3D src;<br>
+=C2=A0 =C2=A0 int cmd =3D tswap32(target-&gt;cmd);<br>
+=C2=A0 =C2=A0 if (cmd =3D=3D ETHTOOL_SRXFH ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (cmd =3D=3D ETHTOOL_GRXFH &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tswap32(target-&gt;flow_type) &amp; FLO=
W_RSS) =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 16;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return sizeof(struct ethtool_rxnfc);<br>
+}<br>
+<br>
+static int host_ethtool_rxnfc_get_set_rxfh_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 const struct ethtool_rxnfc *host =3D src;<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd =3D=3D ETHTOOL_SRXFH ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (host-&gt;cmd =3D=3D ETHTOOL_GRXFH &amp;&amp; =
(host-&gt;flow_type &amp; FLOW_RSS) =3D=3D 0)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 16;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return sizeof(struct ethtool_rxnfc);<br>
+}<br>
+<br>
+const StructEntry struct_ethtool_rxnfc_get_set_rxfh_def =3D {<br>
+=C2=A0 =C2=A0 .convert =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_to_target_ethtool_rxnfc_get_set_rxfh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_to_host_ethtool_rxnfc_get_set_rxfh },<b=
r>
+=C2=A0 =C2=A0 .thunk_size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ethtool_rxnfc_get_set_rxfh_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_ethtool_rxnfc_get_set_rxfh_size },<br>
+=C2=A0 =C2=A0 .size =3D { 16, 16 },<br>
+=C2=A0 =C2=A0 .align =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_rxnfc),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_rxnfc) },<br>
+};<br>
+<br>
+/*<br>
+ * struct ethtool_sset_info {<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 cmd;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 reserved;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u64 sset_mask;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 data[0];<br>
+ * };<br>
+ *<br>
+ * `sset_mask` is a bitmask of string sets. `data` is the buffer for strin=
g set<br>
+ * sizes, containing number of 1s in `sset_mask`&#39;s binary representati=
on number<br>
+ * of 4-byte entries.<br>
+ *<br>
+ * Since all fields are fixed-width and number of 1s in `sset_mask` does n=
ot<br>
+ * change between architectures, host-to-target and target-to-host are<br>
+ * identical.<br>
+ */<br>
+static void convert_ethtool_sset_info(void *dst, const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 int i, set_count;<br>
+=C2=A0 =C2=A0 struct ethtool_sset_info *dst_sset_info =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_sset_info *src_sset_info =3D src;<br>
+<br>
+=C2=A0 =C2=A0 dst_sset_info-&gt;cmd =3D tswap32(src_sset_info-&gt;cmd);<br=
>
+=C2=A0 =C2=A0 dst_sset_info-&gt;sset_mask =3D tswap64(src_sset_info-&gt;ss=
et_mask);<br>
+<br>
+=C2=A0 =C2=A0 set_count =3D ctpop64(src_sset_info-&gt;sset_mask);<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; set_count; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_sset_info-&gt;data[i] =3D tswap32(src_sset=
_info-&gt;data[i]);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int ethtool_sset_info_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 const struct ethtool_sset_info *src_sset_info =3D src;<br>
+=C2=A0 =C2=A0 return sizeof(struct ethtool_sset_info) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctpop64(src_sset_info-&gt;sset_mask) * sizeof(=
src_sset_info-&gt;data[0]);<br>
+}<br>
+<br>
+const StructEntry struct_ethtool_sset_info_def =3D {<br>
+=C2=A0 =C2=A0 .convert =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 convert_ethtool_sset_info, convert_ethtool_sse=
t_info },<br>
+=C2=A0 =C2=A0 .thunk_size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ethtool_sset_info_size, ethtool_sset_info_size=
 },<br>
+=C2=A0 =C2=A0 .size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct ethtool_sset_info),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct ethtool_sset_info) },<br>
+=C2=A0 =C2=A0 .align =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_sset_info),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_sset_info) },<br>
+};<br>
+<br>
+/*<br>
+ * struct ethtool_rxfh {<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 cmd;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 rss_context;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 indir_size;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 key_size;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 hfunc;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 rsvd8[3];<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 rsvd32;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 rss_config[0];<br>
+ * };<br>
+ *<br>
+ * `rss_config`: indirection table of `indir_size` __u32 elements, followe=
d by<br>
+ * hash key of `key_size` bytes.<br>
+ *<br>
+ * `indir_size` could be ETH_RXFH_INDIR_NO_CHANGE when `cmd` is ETHTOOL_SR=
SSH<br>
+ * and there would be no indircetion table in `rss_config`.<br>
+ */<br>
+static void convert_ethtool_rxfh_header(void *dst, const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 struct ethtool_rxfh *dst_rxfh =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_rxfh *src_rxfh =3D src;<br>
+<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;cmd =3D tswap32(src_rxfh-&gt;cmd);<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;rss_context =3D tswap32(src_rxfh-&gt;rss_contex=
t);<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;indir_size =3D tswap32(src_rxfh-&gt;indir_size)=
;<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;key_size =3D tswap32(src_rxfh-&gt;key_size);<br=
>
+=C2=A0 =C2=A0 dst_rxfh-&gt;hfunc =3D src_rxfh-&gt;hfunc;<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;rsvd8[0] =3D src_rxfh-&gt;rsvd8[0];<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;rsvd8[1] =3D src_rxfh-&gt;rsvd8[1];<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;rsvd8[2] =3D src_rxfh-&gt;rsvd8[2];<br>
+=C2=A0 =C2=A0 dst_rxfh-&gt;rsvd32 =3D tswap32(src_rxfh-&gt;rsvd32);<br>
+}<br>
+<br>
+static void convert_ethtool_rxfh_rss_config(<br>
+=C2=A0 =C2=A0 void *dst, const void *src, uint32_t indir_size, uint32_t ke=
y_size) {<br>
+=C2=A0 =C2=A0 uint32_t *dst_rss_config =3D (uint32_t *)dst;<br>
+=C2=A0 =C2=A0 const uint32_t *src_rss_config =3D (const uint32_t *)src;<br=
>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; indir_size; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dst_rss_config[i] =3D tswap32(src_rss_config[i=
]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (key_size &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(dst_rss_config + indir_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src_rss_config + in=
dir_size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0key_size);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void host_to_target_ethtool_rxfh(void *dst, const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 struct ethtool_rxfh *target =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_rxfh *host =3D src;<br>
+<br>
+=C2=A0 =C2=A0 convert_ethtool_rxfh_header(dst, src);<br>
+<br>
+=C2=A0 =C2=A0 const uint32_t indir_size =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;cmd =3D=3D ETHTOOL_SRSSH &amp;&amp;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;indir_size =3D=3D ETH_RXFH_INDIR_NO_C=
HANGE ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;indir_size;<br>
+=C2=A0 =C2=A0 convert_ethtool_rxfh_rss_config(target-&gt;rss_config, host-=
&gt;rss_config,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indir_size, host-&gt;k=
ey_size);<br>
+}<br>
+<br>
+static void target_to_host_ethtool_rxfh(void *dst, const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 struct ethtool_rxfh *host =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_rxfh *target =3D src;<br>
+<br>
+=C2=A0 =C2=A0 convert_ethtool_rxfh_header(dst, src);<br>
+<br>
+=C2=A0 =C2=A0 const uint32_t indir_size =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;cmd =3D=3D ETHTOOL_SRSSH &amp;&amp;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;indir_size =3D=3D ETH_RXFH_INDIR_NO_C=
HANGE ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0 :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;indir_size;<br>
+=C2=A0 =C2=A0 convert_ethtool_rxfh_rss_config(host-&gt;rss_config, target-=
&gt;rss_config,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 indir_size, host-&gt;k=
ey_size);<br>
+}<br>
+<br>
+static int target_ethtool_rxfh_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 const struct ethtool_rxfh *target =3D src;<br>
+=C2=A0 =C2=A0 if (tswap32(target-&gt;cmd) =3D=3D ETHTOOL_SRSSH &amp;&amp;<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tswap32(target-&gt;indir_size) =3D=3D ETH_RXFH=
_INDIR_NO_CHANGE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_rxfh) + tswap32(t=
arget-&gt;key_size);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return sizeof(struct ethtool_rxfh) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tswap32(target-&gt;indir_size) * sizeof(target=
-&gt;rss_config[0]) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 tswap32(target-&gt;key_size);<br>
+}<br>
+<br>
+static int host_ethtool_rxfh_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 const struct ethtool_rxfh *host =3D src;<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd =3D=3D ETHTOOL_SRSSH &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;indir_size =3D=3D ETH_RXFH_INDIR_NO_C=
HANGE) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_rxfh) + host-&gt;=
key_size;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return sizeof(struct ethtool_rxfh) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;indir_size * sizeof(host-&gt;rss_conf=
ig[0]) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;key_size;<br>
+}<br>
+<br>
+const StructEntry struct_ethtool_rxfh_def =3D {<br>
+=C2=A0 =C2=A0 .convert =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_to_target_ethtool_rxfh, target_to_host_et=
htool_rxfh },<br>
+=C2=A0 =C2=A0 .thunk_size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ethtool_rxfh_size, host_ethtool_rxfh_si=
ze },<br>
+=C2=A0 =C2=A0 .size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct ethtool_rxfh), sizeof(struct eth=
tool_rxfh) },<br>
+=C2=A0 =C2=A0 .align =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_rxfh), __alignof__(=
struct ethtool_rxfh) },<br>
+};<br>
+<br>
+/*<br>
+ * struct ethtool_link_settings {<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 cmd;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 speed;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 duplex;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 port;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 phy_address;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 autoneg;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 mdio_support;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 eth_tp_mdix;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 eth_tp_mdix_ctrl;<br>
+ *=C2=A0 =C2=A0 =C2=A0__s8=C2=A0 link_mode_masks_nwords;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 transceiver;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u8=C2=A0 reserved1[3];<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 reserved[7];<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 link_mode_masks[0];<br>
+ * };<br>
+ *<br>
+ * layout of link_mode_masks fields:<br>
+ * __u32 map_supported[link_mode_masks_nwords];<br>
+ * __u32 map_advertising[link_mode_masks_nwords];<br>
+ * __u32 map_lp_advertising[link_mode_masks_nwords];<br>
+ *<br>
+ * `link_mode_masks_nwords` can be negative when returning from kernel if =
the<br>
+ * provided request size is not supported.<br>
+ */<br>
+<br>
+static void host_to_target_ethtool_link_settings(void *dst, const void *sr=
c)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct ethtool_link_settings *target =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_link_settings *host =3D src;<br>
+<br>
+=C2=A0 =C2=A0 target-&gt;cmd =3D tswap32(host-&gt;cmd);<br>
+=C2=A0 =C2=A0 target-&gt;speed =3D tswap32(host-&gt;speed);<br>
+=C2=A0 =C2=A0 target-&gt;duplex =3D host-&gt;duplex;<br>
+=C2=A0 =C2=A0 target-&gt;port =3D host-&gt;port;<br>
+=C2=A0 =C2=A0 target-&gt;phy_address =3D host-&gt;phy_address;<br>
+=C2=A0 =C2=A0 target-&gt;autoneg =3D host-&gt;autoneg;<br>
+=C2=A0 =C2=A0 target-&gt;mdio_support =3D host-&gt;mdio_support;<br>
+=C2=A0 =C2=A0 target-&gt;eth_tp_mdix =3D host-&gt;eth_tp_mdix;<br>
+=C2=A0 =C2=A0 target-&gt;eth_tp_mdix_ctrl =3D host-&gt;eth_tp_mdix_ctrl;<b=
r>
+=C2=A0 =C2=A0 target-&gt;link_mode_masks_nwords =3D host-&gt;link_mode_mas=
ks_nwords;<br>
+=C2=A0 =C2=A0 target-&gt;transceiver =3D host-&gt;transceiver;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target-&gt;reserved1[i] =3D host-&gt;reserved1=
[i];<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 7; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target-&gt;reserved[i] =3D tswap32(host-&gt;re=
served[i]);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (host-&gt;link_mode_masks_nwords &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; host-&gt;link_mode_masks_=
nwords * 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target-&gt;link_mode_masks[i] =
=3D tswap32(host-&gt;link_mode_masks[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void target_to_host_ethtool_link_settings(void *dst, const void *sr=
c)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct ethtool_link_settings *host =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_link_settings *target =3D src;<br>
+<br>
+=C2=A0 =C2=A0 host-&gt;cmd =3D tswap32(target-&gt;cmd);<br>
+=C2=A0 =C2=A0 host-&gt;speed =3D tswap32(target-&gt;speed);<br>
+=C2=A0 =C2=A0 host-&gt;duplex =3D target-&gt;duplex;<br>
+=C2=A0 =C2=A0 host-&gt;port =3D target-&gt;port;<br>
+=C2=A0 =C2=A0 host-&gt;phy_address =3D target-&gt;phy_address;<br>
+=C2=A0 =C2=A0 host-&gt;autoneg =3D target-&gt;autoneg;<br>
+=C2=A0 =C2=A0 host-&gt;mdio_support =3D target-&gt;mdio_support;<br>
+=C2=A0 =C2=A0 host-&gt;eth_tp_mdix =3D target-&gt;eth_tp_mdix;<br>
+=C2=A0 =C2=A0 host-&gt;eth_tp_mdix_ctrl =3D target-&gt;eth_tp_mdix_ctrl;<b=
r>
+=C2=A0 =C2=A0 host-&gt;link_mode_masks_nwords =3D target-&gt;link_mode_mas=
ks_nwords;<br>
+=C2=A0 =C2=A0 host-&gt;transceiver =3D target-&gt;transceiver;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;reserved1[i] =3D target-&gt;reserved1=
[i];<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 7; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;reserved[i] =3D tswap32(target-&gt;re=
served[i]);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (host-&gt;link_mode_masks_nwords &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; host-&gt;link_mode_masks_=
nwords * 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;link_mode_masks[i] =3D =
tswap32(target-&gt;link_mode_masks[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int target_ethtool_link_settings_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 const struct ethtool_link_settings *target =3D src;<br>
+=C2=A0 =C2=A0 if (target-&gt;link_mode_masks_nwords &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_link_settings) +<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 * target-&gt;link_mode_masks_n=
words *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(target-&gt;link_mode_mask=
s[0]);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_link_settings);<b=
r>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int host_ethtool_link_settings_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 const struct ethtool_link_settings *host =3D src;<br>
+=C2=A0 =C2=A0 if (host-&gt;link_mode_masks_nwords &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_link_settings) +<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 * host-&gt;link_mode_masks_nwo=
rds *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(host-&gt;link_mode_masks[=
0]);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_link_settings);<b=
r>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+const StructEntry struct_ethtool_link_settings_def =3D {<br>
+=C2=A0 =C2=A0 .convert =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_to_target_ethtool_link_settings,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_to_host_ethtool_link_settings<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .thunk_size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ethtool_link_settings_size, host_ethtoo=
l_link_settings_size },<br>
+=C2=A0 =C2=A0 .size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct ethtool_link_settings),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct ethtool_link_settings) },<br>
+=C2=A0 =C2=A0 .align =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_link_settings),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_link_settings) },<b=
r>
+};<br>
+<br>
+/*<br>
+ * struct ethtool_per_queue_op {<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 cmd;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 sub_command;<br>
+ *=C2=A0 =C2=A0 =C2=A0__u32 queue_mask[__KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE=
, 32)];<br>
+ *=C2=A0 =C2=A0 =C2=A0char=C2=A0 data[];<br>
+ * };<br>
+ *<br>
+ * `queue_mask` are a series of bitmasks of the queues. `data` is a comple=
te<br>
+ * command structure for each of the queues addressed.<br>
+ *<br>
+ * When `cmd` is `ETHTOOL_PERQUEUE` and `sub_command` is `ETHTOOL_GCOALESC=
E` or<br>
+ * `ETHTOOL_SCOALESCE`, the command structure is `struct ethtool_coalesce`=
.<br>
+ */<br>
+static void host_to_target_ethtool_per_queue_op(void *dst, const void *src=
)<br>
+{<br>
+=C2=A0 =C2=A0 static const argtype ethtool_coalesce_argtype[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_STRUCT(STRUCT_ethtool_coalesce), TYPE_NULL =
};<br>
+=C2=A0 =C2=A0 int i, queue_count;<br>
+=C2=A0 =C2=A0 struct ethtool_per_queue_op *target =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_per_queue_op *host =3D src;<br>
+<br>
+=C2=A0 =C2=A0 target-&gt;cmd =3D tswap32(host-&gt;cmd);<br>
+=C2=A0 =C2=A0 target-&gt;sub_command =3D tswap32(host-&gt;sub_command);<br=
>
+<br>
+=C2=A0 =C2=A0 queue_count =3D 0;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32=
); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target-&gt;queue_mask[i] =3D tswap32(host-&gt;=
queue_mask[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_count +=3D ctpop32(host-&gt;queue_mask[i=
]);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd !=3D ETHTOOL_PERQUEUE ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (host-&gt;sub_command !=3D ETHTOOL_GCOALESCE &=
amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;sub_command !=3D ETHTOOL_SCOALE=
SCE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unknown comm=
and 0x%x sub_command 0x%x for &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ethtool_per_=
queue_op, unable to convert the `data` field &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(host-to-tar=
get)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;cmd, host=
-&gt;sub_command);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; queue_count; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_convert(target-&gt;data + i * sizeof(str=
uct ethtool_coalesce),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 host-&gt;data + i * sizeof(struct ethtool_coalesce),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ethtool_coalesce_argtype, THUNK_TARGET);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void target_to_host_ethtool_per_queue_op(void *dst, const void *src=
)<br>
+{<br>
+=C2=A0 =C2=A0 static const argtype ethtool_coalesce_argtype[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_STRUCT(STRUCT_ethtool_coalesce), TYPE_NULL =
};<br>
+=C2=A0 =C2=A0 int i, queue_count;<br>
+=C2=A0 =C2=A0 struct ethtool_per_queue_op *host =3D dst;<br>
+=C2=A0 =C2=A0 const struct ethtool_per_queue_op *target =3D src;<br>
+<br>
+=C2=A0 =C2=A0 host-&gt;cmd =3D tswap32(target-&gt;cmd);<br>
+=C2=A0 =C2=A0 host-&gt;sub_command =3D tswap32(target-&gt;sub_command);<br=
>
+<br>
+=C2=A0 =C2=A0 queue_count =3D 0;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32=
); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;queue_mask[i] =3D tswap32(target-&gt;=
queue_mask[i]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_count +=3D ctpop32(host-&gt;queue_mask[i=
]);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd !=3D ETHTOOL_PERQUEUE ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (host-&gt;sub_command !=3D ETHTOOL_GCOALESCE &=
amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;sub_command !=3D ETHTOOL_SCOALE=
SCE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unknown comm=
and 0x%x sub_command 0x%x for &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ethtool_per_=
queue_op, unable to convert the `data` field &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(target-to-h=
ost)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;cmd, host=
-&gt;sub_command);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; queue_count; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_convert(host-&gt;data + i * sizeof(struc=
t ethtool_coalesce),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 target-&gt;data + i * sizeof(struct ethtool_coalesce),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ethtool_coalesce_argtype, THUNK_HOST);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static int target_ethtool_per_queue_op_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 int i, queue_count;<br>
+=C2=A0 =C2=A0 const struct ethtool_per_queue_op *target =3D src;<br>
+<br>
+=C2=A0 =C2=A0 if (tswap32(target-&gt;cmd) !=3D ETHTOOL_PERQUEUE ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (tswap32(target-&gt;sub_command) !=3D ETHTOOL_=
GCOALESCE &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tswap32(target-&gt;sub_command) !=3D ETH=
TOOL_SCOALESCE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unknown comm=
and 0x%x sub_command 0x%x for &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ethtool_per_=
queue_op, unable to compute the size of the &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;`data` field=
 (target)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tswap32(target-&gt=
;cmd), tswap32(target-&gt;sub_command));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_per_queue_op);<br=
>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 queue_count =3D 0;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32=
); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_count +=3D ctpop32(target-&gt;queue_mask=
[i]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return sizeof(struct ethtool_per_queue_op) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_count * sizeof(struct ethtool_coalesce);=
<br>
+}<br>
+<br>
+static int host_ethtool_per_queue_op_size(const void *src)<br>
+{<br>
+=C2=A0 =C2=A0 int i, queue_count;<br>
+=C2=A0 =C2=A0 const struct ethtool_per_queue_op *host =3D src;<br>
+<br>
+=C2=A0 =C2=A0 if (host-&gt;cmd !=3D ETHTOOL_PERQUEUE ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (host-&gt;sub_command !=3D ETHTOOL_GCOALESCE &=
amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0host-&gt;sub_command !=3D ETHTOOL_SCOALE=
SCE)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unknown comm=
and 0x%x sub_command 0x%x for &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ethtool_per_=
queue_op, unable to compute the size of the &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;`data` field=
 (host)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host-&gt;cmd, host=
-&gt;sub_command);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return sizeof(struct ethtool_per_queue_op);<br=
>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 queue_count =3D 0;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; __KERNEL_DIV_ROUND_UP(MAX_NUM_QUEUE, 32=
); ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_count +=3D ctpop32(host-&gt;queue_mask[i=
]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return sizeof(struct ethtool_per_queue_op) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_count * sizeof(struct ethtool_coalesce);=
<br>
+}<br>
+<br>
+const StructEntry struct_ethtool_per_queue_op_def =3D {<br>
+=C2=A0 =C2=A0 .convert =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_to_target_ethtool_per_queue_op,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_to_host_ethtool_per_queue_op<br>
+=C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 .thunk_size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_ethtool_per_queue_op_size, host_ethtool=
_per_queue_op_size },<br>
+=C2=A0 =C2=A0 .size =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct ethtool_per_queue_op),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(struct ethtool_per_queue_op) },<br>
+=C2=A0 =C2=A0 .align =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_per_queue_op),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 __alignof__(struct ethtool_per_queue_op) },<br=
>
+};<br>
+<br>
+#define safe_dev_ethtool(fd, ...) \<br>
+=C2=A0 =C2=A0 safe_syscall(__NR_ioctl, (fd), SIOCETHTOOL, __VA_ARGS__)<br>
+<br>
+typedef struct EthtoolEntry EthtoolEntry;<br>
+<br>
+typedef abi_long do_ethtool_fn(const EthtoolEntry *ee, uint8_t *buf_temp,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, struct ifreq *host_ifreq);<br=
>
+<br>
+struct EthtoolEntry {<br>
+=C2=A0 =C2=A0 uint32_t cmd;<br>
+=C2=A0 =C2=A0 int access;<br>
+=C2=A0 =C2=A0 do_ethtool_fn *do_ethtool;<br>
+=C2=A0 =C2=A0 const argtype arg_type[3];<br>
+};<br>
+<br>
+#define ETHT_R 0x0001<br>
+#define ETHT_W 0x0002<br>
+#define ETHT_RW (ETHT_R | ETHT_W)<br>
+<br>
+static do_ethtool_fn do_ethtool_get_rxfh;<br>
+<br>
+static EthtoolEntry ethtool_entries[] =3D {<br>
+#define ETHTOOL(cmd, access, ...) \<br>
+=C2=A0 =C2=A0 { cmd, access, 0, { __VA_ARGS__ } },<br>
+#define ETHTOOL_SPECIAL(cmd, access, dofn, ...) \<br>
+=C2=A0 =C2=A0 { cmd, access, dofn, { __VA_ARGS__ } },<br>
+#include &quot;ethtool_entries.h&quot;<br>
+#undef ETHTOOL<br>
+#undef ETHTOOL_SPECIAL<br>
+=C2=A0 =C2=A0 { 0, 0 },<br>
+};<br>
+<br>
+/*<br>
+ * ETHTOOL_GRSSH has two modes of operations: querying the sizes of the in=
dir<br>
+ * and key as well as actually querying the indir and key. When either<br>
+ * `indir_size` or `key_size` is zero, the size of the corresponding entry=
 is<br>
+ * retrieved and updated into the `ethtool_rxfh` struct. When either of th=
em is<br>
+ * non-zero, the actually indir or key is written to `rss_config`.<br>
+ *<br>
+ * This causes a problem for the generic framework which converts between =
host<br>
+ * and target structures without the context. When the convertion function=
 sees<br>
+ * an `ethtool_rxfh` struct with non-zero `indir_size` or `key_size`, it h=
as to<br>
+ * assume that there are entries in `rss_config` and needs to convert them=
.<br>
+ * Unfortunately, when converting the returned `ethtool_rxfh` struct from =
host<br>
+ * to target after an ETHTOOL_GRSSH call with the first mode, the `indir_s=
ize`<br>
+ * and `key_size` fields are populated but there is no actual data to be<b=
r>
+ * converted. More importantly, user programs would not have prepared enou=
gh<br>
+ * memory for the convertion to take place safely.<br>
+ *<br>
+ * ETHTOOL_GRSSH thus needs a special implementation which is aware of the=
 two<br>
+ * modes of operations and converts the structure accordingly.<br>
+ */<br>
+abi_long do_ethtool_get_rxfh(const EthtoolEntry *ee, uint8_t *buf_temp,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, struct ifreq *host_ifreq)<br>
+{<br>
+=C2=A0 =C2=A0 const argtype *arg_type =3D ee-&gt;arg_type;<br>
+=C2=A0 =C2=A0 const abi_long ifreq_data =3D (abi_long)(unsigned long)host_=
ifreq-&gt;ifr_data;<br>
+=C2=A0 =C2=A0 struct ethtool_rxfh *rxfh =3D (struct ethtool_rxfh *)buf_tem=
p;<br>
+=C2=A0 =C2=A0 uint32_t user_indir_size, user_key_size;<br>
+=C2=A0 =C2=A0 abi_long ret;<br>
+=C2=A0 =C2=A0 void *argptr;<br>
+<br>
+=C2=A0 =C2=A0 assert(arg_type[0] =3D=3D TYPE_PTR);<br>
+=C2=A0 =C2=A0 assert(ee-&gt;access =3D=3D IOC_RW);<br>
+=C2=A0 =C2=A0 arg_type++;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* As of Linux kernel v5.8-rc4, ETHTOOL_GRSSH calls nev=
er read the<br>
+=C2=A0 =C2=A0 =C2=A0* `rss_config` part. Converting only the &quot;header&=
quot; part suffices.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 argptr =3D lock_user(VERIFY_READ, ifreq_data, sizeof(*rxfh),=
 1);<br>
+=C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 convert_ethtool_rxfh_header(rxfh, argptr);<br>
+=C2=A0 =C2=A0 unlock_user(argptr, ifreq_data, sizeof(*rxfh));<br>
+<br>
+=C2=A0 =C2=A0 if (rxfh-&gt;cmd !=3D ETHTOOL_GRSSH) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EINVAL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 user_indir_size =3D rxfh-&gt;indir_size;<br>
+=C2=A0 =C2=A0 user_key_size =3D rxfh-&gt;key_size;<br>
+<br>
+=C2=A0 =C2=A0 host_ifreq-&gt;ifr_data =3D (void *)rxfh;<br>
+=C2=A0 =C2=A0 ret =3D get_errno(safe_dev_ethtool(fd, host_ifreq));<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* When a user program supplies `indir_size` or `key_si=
ze` but does not<br>
+=C2=A0 =C2=A0 =C2=A0* match what the kernel has, the syscall returns EINVA=
L but the structure<br>
+=C2=A0 =C2=A0 =C2=A0* is already updated. Mimicking it here.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 argptr =3D lock_user(VERIFY_WRITE, ifreq_data, sizeof(*rxfh)=
, 0);<br>
+=C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 convert_ethtool_rxfh_header(argptr, rxfh);<br>
+=C2=A0 =C2=A0 unlock_user(argptr, ifreq_data, 0);<br>
+<br>
+=C2=A0 =C2=A0 if (is_error(ret)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (user_indir_size &gt; 0 || user_key_size &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 const int rss_config_size =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_indir_size * sizeof(rxfh-&g=
t;rss_config[0]) + user_key_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 argptr =3D lock_user(VERIFY_WRITE, ifreq_data =
+ sizeof(*rxfh),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rss_config_size, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 convert_ethtool_rxfh_rss_config(argptr, rxfh-&=
gt;rss_config,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 user_ind=
ir_size, user_key_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(argptr, ifreq_data + sizeof(*rxfh)=
, rss_config_size);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+/*<br>
+ * Calculates the size of the data type represented by `type_ptr` with<br>
+ * `guest_addr` being the underlying memory. Since `type_ptr` may contain<=
br>
+ * flexible arrays, we need access to the underlying memory to determine t=
heir<br>
+ * sizes.<br>
+ */<br>
+static int thunk_size(abi_long guest_addr, const argtype *type_ptr)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* lock_user based on `thunk_type_size` then call `thun=
k_type_size_with_src`<br>
+=C2=A0 =C2=A0 =C2=A0* on it.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 void *src;<br>
+=C2=A0 =C2=A0 int type_size =3D thunk_type_size(type_ptr, /*is_host=3D*/ 0=
);<br>
+=C2=A0 =C2=A0 if (!thunk_type_has_flexible_array(type_ptr)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return type_size;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 src =3D lock_user(VERIFY_READ, guest_addr, type_size, 0);<br=
>
+=C2=A0 =C2=A0 type_size =3D thunk_type_size_with_src(src, type_ptr, /*is_h=
ost=3D*/ 0);<br>
+=C2=A0 =C2=A0 unlock_user(src, guest_addr, 0);<br>
+<br>
+=C2=A0 =C2=A0 return type_size;<br>
+}<br>
+<br>
+abi_long dev_ethtool(int fd, uint8_t *buf_temp)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t *cmd;<br>
+=C2=A0 =C2=A0 uint32_t host_cmd;<br>
+=C2=A0 =C2=A0 const EthtoolEntry *ee;<br>
+=C2=A0 =C2=A0 const argtype *arg_type;<br>
+=C2=A0 =C2=A0 abi_long ret;<br>
+=C2=A0 =C2=A0 int target_size;<br>
+=C2=A0 =C2=A0 void *argptr;<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Make a copy of `host_ifreq` because we are going to =
reuse `buf_temp` and<br>
+=C2=A0 =C2=A0 =C2=A0* overwrite it. Further, we will overwrite `host_ifreq=
.ifreq_data`, so<br>
+=C2=A0 =C2=A0 =C2=A0* keep a copy in `ifreq_data`.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 struct ifreq host_ifreq =3D *(struct ifreq *)(unsigned long)=
buf_temp;<br>
+=C2=A0 =C2=A0 const abi_long ifreq_data =3D (abi_long)(unsigned long)host_=
ifreq.ifr_data;<br>
+<br>
+=C2=A0 =C2=A0 cmd =3D (uint32_t *)lock_user(VERIFY_READ, ifreq_data, sizeo=
f(uint32_t), 0);<br>
+=C2=A0 =C2=A0 host_cmd =3D tswap32(*cmd);<br>
+=C2=A0 =C2=A0 unlock_user(cmd, ifreq_data, 0);<br>
+<br>
+=C2=A0 =C2=A0 ee =3D ethtool_entries;<br>
+=C2=A0 =C2=A0 for (;;) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;cmd =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP, &quot;U=
nsupported ethtool cmd=3D0x%04lx\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (long)host_cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_ENOSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;cmd =3D=3D host_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee++;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (ee-&gt;do_ethtool) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ee-&gt;do_ethtool(ee, buf_temp, fd, &am=
p;host_ifreq);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 host_ifreq.ifr_data =3D buf_temp;<br>
+=C2=A0 =C2=A0 /* Even for ETHT_R, cmd still needs to be copied. */<br>
+=C2=A0 =C2=A0 *(uint32_t *)buf_temp =3D host_cmd;<br>
+<br>
+=C2=A0 =C2=A0 arg_type =3D ee-&gt;arg_type;<br>
+=C2=A0 =C2=A0 switch (arg_type[0]) {<br>
+=C2=A0 =C2=A0 case TYPE_NULL:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* no argument other than cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_errno(safe_dev_ethtool(fd, &amp;ho=
st_ifreq));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 case TYPE_PTR:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 arg_type++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_size =3D thunk_size(ifreq_data, arg_typ=
e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (ee-&gt;access) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case ETHT_R:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_errno(safe_dev_ethto=
ol(fd, &amp;host_ifreq));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_error(ret)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argptr =3D lock_us=
er(VERIFY_WRITE, ifreq_data, target_size, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn -TARGET_EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_convert(argp=
tr, buf_temp, arg_type, THUNK_TARGET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(argptr=
, ifreq_data, target_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case ETHT_W:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argptr =3D lock_user(VERIFY_READ=
, ifreq_data, target_size, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFA=
ULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_convert(buf_temp, argptr, =
arg_type, THUNK_HOST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(argptr, ifreq_data, =
0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_errno(safe_dev_ethto=
ol(fd, &amp;host_ifreq));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case ETHT_RW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argptr =3D lock_user(VERIFY_READ=
, ifreq_data, target_size, 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFA=
ULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_convert(buf_temp, argptr, =
arg_type, THUNK_HOST);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(argptr, ifreq_data, =
0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_errno(safe_dev_ethto=
ol(fd, &amp;host_ifreq));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_error(ret)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argptr =3D lock_us=
er(VERIFY_WRITE, ifreq_data, target_size, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retu=
rn -TARGET_EFAULT;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 thunk_convert(argp=
tr, buf_temp, arg_type, THUNK_TARGET);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unlock_user(argptr=
, ifreq_data, target_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_UNIMP,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Unsupported ethtool type: cmd=3D0x%04lx type=3D%d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (long)host_cmd, arg_type[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -TARGET_ENOSYS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
diff --git a/linux-user/ethtool.h b/linux-user/ethtool.h<br>
new file mode 100644<br>
index 0000000000..6942aef095<br>
--- /dev/null<br>
+++ b/linux-user/ethtool.h<br>
@@ -0,0 +1,20 @@<br>
+#ifndef ETHTOOL_H<br>
+#define ETHTOOL_H<br>
+<br>
+#include &lt;linux/if.h&gt;<br>
+#include &quot;qemu.h&quot;<br>
+<br>
+extern const StructEntry struct_ethtool_rxnfc_get_set_rxfh_def;<br>
+extern const StructEntry struct_ethtool_sset_info_def;<br>
+extern const StructEntry struct_ethtool_rxfh_def;<br>
+extern const StructEntry struct_ethtool_link_settings_def;<br>
+extern const StructEntry struct_ethtool_per_queue_op_def;<br>
+<br>
+/*<br>
+ * Takes the file descriptor and the buffer for temporarily storing data r=
ead<br>
+ * from / to be written to guest memory. `buf_temp` must now contain the h=
ost<br>
+ * representation of `struct ifreq`.<br>
+ */<br>
+abi_long dev_ethtool(int fd, uint8_t *buf_temp);<br>
+<br>
+#endif /* ETHTOOL_H */<br>
diff --git a/linux-user/ethtool_entries.h b/linux-user/ethtool_entries.h<br=
>
new file mode 100644<br>
index 0000000000..14f4e80a21<br>
--- /dev/null<br>
+++ b/linux-user/ethtool_entries.h<br>
@@ -0,0 +1,107 @@<br>
+=C2=A0 ETHTOOL(ETHTOOL_GSET, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_cmd))=
)<br>
+=C2=A0 ETHTOOL(ETHTOOL_SSET, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_cmd))=
)<br>
+=C2=A0 ETHTOOL(ETHTOOL_GDRVINFO, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_d=
rvinfo)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GREGS, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_reg=
s)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GWOL, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_wolin=
fo)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SWOL, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_wolin=
fo)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GMSGLVL, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SMSGLVL, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GEEE, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_eee))=
)<br>
+=C2=A0 ETHTOOL(ETHTOOL_SEEE, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_eee))=
)<br>
+=C2=A0 ETHTOOL(ETHTOOL_NWAY_RST, 0, TYPE_NULL)<br>
+=C2=A0 ETHTOOL(ETHTOOL_GLINK, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_valu=
e)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GEEPROM, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_e=
eprom)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SEEPROM, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_e=
eprom)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GCOALESCE, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
coalesce)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SCOALESCE, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
coalesce)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRINGPARAM, ETHT_R,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_ringpar=
am)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SRINGPARAM, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_ringpar=
am)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GPAUSEPARAM, ETHT_R,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_pausepa=
ram)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SPAUSEPARAM, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_pausepa=
ram)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_TEST, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_test=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GSTRINGS, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
gstrings)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_PHYS_ID, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GSTATS, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_st=
ats)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GPERMADDR, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_perm_ad=
dr)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GFLAGS, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_val=
ue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SFLAGS, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_val=
ue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GPFLAGS, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SPFLAGS, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRXFH, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_g=
et_set_rxfh)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRXRINGS, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_r=
ss_context)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRXCLSRLCNT, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_r=
ule_cnt)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRXCLSRULE, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_r=
ss_context)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRXCLSRLALL, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_r=
ule_locs)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SRXFH, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_g=
et_set_rxfh)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SRXCLSRLDEL, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_r=
ss_context)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SRXCLSRLINS, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxnfc_r=
ss_context)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_FLASHDEV, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_f=
lash)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_RESET, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_val=
ue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GSSET_INFO, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_sset_in=
fo)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRXFHINDIR, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxfh_in=
dir)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SRXFHINDIR, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxfh_in=
dir)))<br>
+=C2=A0 ETHTOOL_SPECIAL(ETHTOOL_GRSSH, ETHT_RW, do_ethtool_get_rxfh,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_S=
TRUCT(STRUCT_ethtool_rxfh)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SRSSH, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_rxfh)))=
<br>
+=C2=A0 ETHTOOL(ETHTOOL_GFEATURES, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_gfeatur=
es)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SFEATURES, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_sfeatur=
es)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GTXCSUM, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GRXCSUM, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GSG, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)=
))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GTSO, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GGSO, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GGRO, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_value=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_STXCSUM, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SRXCSUM, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_va=
lue)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SSG, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value)=
))<br>
+=C2=A0 ETHTOOL(ETHTOOL_STSO, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SGSO, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SGRO, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_value=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GCHANNELS, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
channels)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SCHANNELS, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
channels)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SET_DUMP, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_dump_no=
_data)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GET_DUMP_FLAG, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_dump_no=
_data)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GET_DUMP_DATA, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_dump)))=
<br>
+=C2=A0 ETHTOOL(ETHTOOL_GET_TS_INFO, ETHT_R,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_ts_info=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GMODULEINFO, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_modinfo=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GMODULEEEPROM, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_eeprom)=
))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GTUNABLE, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
tunable)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_STUNABLE, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_t=
unable)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GPHYSTATS, ETHT_RW, MK_PTR(MK_STRUCT(STRUCT_ethtool=
_stats)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_PERQUEUE, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_per_que=
ue_op)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GLINKSETTINGS, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_link_se=
ttings)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_SLINKSETTINGS, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_link_se=
ttings)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_PHY_GTUNABLE, ETHT_RW,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_tunable=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_PHY_STUNABLE, ETHT_W,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(STRUCT_ethtool_tunable=
)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GFECPARAM, ETHT_R, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
fecparam)))<br>
+=C2=A0 ETHTOOL(ETHTOOL_GFECPARAM, ETHT_W, MK_PTR(MK_STRUCT(STRUCT_ethtool_=
fecparam)))<br>
diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h<br>
index 0713ae1311..fd6ac963ec 100644<br>
--- a/linux-user/ioctls.h<br>
+++ b/linux-user/ioctls.h<br>
@@ -238,6 +238,8 @@<br>
=C2=A0 =C2=A0IOCTL(SIOCSIFHWADDR, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_i=
freq)))<br>
=C2=A0 =C2=A0IOCTL(SIOCGIFTXQLEN, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_so=
ckaddr_ifreq)))<br>
=C2=A0 =C2=A0IOCTL(SIOCSIFTXQLEN, IOC_W, MK_PTR(MK_STRUCT(STRUCT_sockaddr_i=
freq)))<br>
+=C2=A0 IOCTL_SPECIAL(SIOCETHTOOL, IOC_W | IOC_R, do_ioctl_ethtool,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MK_PTR(MK_STRUCT(S=
TRUCT_ptr_ifreq)))<br>
=C2=A0 =C2=A0IOCTL(SIOCGIFMETRIC, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_in=
t_ifreq)))<br>
=C2=A0 =C2=A0IOCTL(SIOCSIFMETRIC, IOC_W, MK_PTR(MK_STRUCT(STRUCT_int_ifreq)=
))<br>
=C2=A0 =C2=A0IOCTL(SIOCGIFMTU, IOC_W | IOC_R, MK_PTR(MK_STRUCT(STRUCT_int_i=
freq)))<br>
diff --git a/linux-user/qemu.h b/linux-user/qemu.h<br>
index 5c964389c1..43f00681f8 100644<br>
--- a/linux-user/qemu.h<br>
+++ b/linux-user/qemu.h<br>
@@ -231,6 +231,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long ar=
g1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg2, abi_long arg3, abi_long arg4,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg5, abi_long arg6, abi_long arg7,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg8);<br>
+abi_long get_errno(abi_long ret);<br>
=C2=A0extern __thread CPUState *thread_cpu;<br>
=C2=A0void cpu_loop(CPUArchState *env);<br>
=C2=A0const char *target_strerror(int err);<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index bfc4219104..41fea53716 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -127,6 +127,7 @@<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;fd-trans.h&quot;<br>
=C2=A0#include &quot;tcg/tcg.h&quot;<br>
+#include &quot;ethtool.h&quot;<br>
<br>
=C2=A0#ifndef CLONE_IO<br>
=C2=A0#define CLONE_IO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x80000000=C2=A0 =C2=A0 =C2=A0 /* Clone io context */<br>
@@ -676,7 +677,7 @@ static inline int target_to_host_errno(int err)<br>
=C2=A0 =C2=A0 =C2=A0return err;<br>
=C2=A0}<br>
<br>
-static inline abi_long get_errno(abi_long ret)<br>
+abi_long get_errno(abi_long ret)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D -1)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -host_to_target_errno(errno);<br>
@@ -4732,16 +4733,6 @@ static abi_long do_ipc(CPUArchState *cpu_env,<br>
=C2=A0#endif<br>
<br>
=C2=A0/* kernel structure types definitions */<br>
-<br>
-#define STRUCT(name, ...) STRUCT_ ## name,<br>
-#define STRUCT_SPECIAL(name) STRUCT_ ## name,<br>
-enum {<br>
-#include &quot;syscall_types.h&quot;<br>
-STRUCT_MAX<br>
-};<br>
-#undef STRUCT<br>
-#undef STRUCT_SPECIAL<br>
-<br>
=C2=A0#define STRUCT(name, ...) static const argtype struct_ ## name ## _de=
f[] =3D {=C2=A0 __VA_ARGS__, TYPE_NULL };<br>
=C2=A0#define STRUCT_SPECIAL(name)<br>
=C2=A0#include &quot;syscall_types.h&quot;<br>
@@ -4839,6 +4830,29 @@ static abi_long do_ioctl_fs_ioc_fiemap(const IOCTLEn=
try *ie, uint8_t *buf_temp,<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
+static abi_long do_ioctl_ethtool(const IOCTLEntry *ie, uint8_t *buf_temp,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd, int cmd, abi_long arg)<br>
+{<br>
+=C2=A0 =C2=A0 const argtype *arg_type =3D ie-&gt;arg_type;<br>
+=C2=A0 =C2=A0 int target_size;<br>
+=C2=A0 =C2=A0 void *argptr;<br>
+<br>
+=C2=A0 =C2=A0 assert(arg_type[0] =3D=3D TYPE_PTR);<br>
+=C2=A0 =C2=A0 assert(ie-&gt;access =3D=3D IOC_RW);<br>
+<br>
+=C2=A0 =C2=A0 arg_type++;<br>
+=C2=A0 =C2=A0 target_size =3D thunk_type_size(arg_type, 0);<br>
+<br>
+=C2=A0 =C2=A0 argptr =3D lock_user(VERIFY_READ, arg, target_size, 1);<br>
+=C2=A0 =C2=A0 if (!argptr) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 thunk_convert(buf_temp, argptr, arg_type, THUNK_HOST);<br>
+=C2=A0 =C2=A0 unlock_user(argptr, arg, target_size);<br>
+<br>
+=C2=A0 =C2=A0 return dev_ethtool(fd, buf_temp);<br>
+}<br>
+<br>
=C2=A0static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_te=
mp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fd, int cmd, abi_long arg)=
<br>
=C2=A0{<br>
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h<br>
index 70df1a94fb..e25a8cbcc8 100644<br>
--- a/linux-user/syscall_defs.h<br>
+++ b/linux-user/syscall_defs.h<br>
@@ -866,6 +866,8 @@ struct target_rtc_pll_info {<br>
=C2=A0#define TARGET_SIOCGIFTXQLEN=C2=A0 =C2=A00x8942=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Get the tx queue length=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0#define TARGET_SIOCSIFTXQLEN=C2=A0 =C2=A00x8943=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Set the tx queue length=C2=A0 =C2=A0 =C2=A0 */<br>
<br>
+#define TARGET_SIOCETHTOOL=C2=A0 =C2=A0 =C2=A00x8946=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Ethtool interface=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
*/<br>
+<br>
=C2=A0/* ARP cache control calls. */<br>
=C2=A0#define TARGET_OLD_SIOCDARP=C2=A0 =C2=A0 0x8950=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* old delete ARP table entry=C2=A0 =C2=A0*/<br>
=C2=A0#define TARGET_OLD_SIOCGARP=C2=A0 =C2=A0 0x8951=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* old get ARP table entry=C2=A0 =C2=A0 =C2=A0 */<br>
@@ -2776,4 +2778,14 @@ struct target_statx {<br>
=C2=A0 =C2=A0 /* 0x100 */<br>
=C2=A0};<br>
<br>
+/* kernel structure types definitions */<br>
+#define STRUCT(name, ...) STRUCT_ ## name,<br>
+#define STRUCT_SPECIAL(name) STRUCT_ ## name,<br>
+enum {<br>
+#include &quot;syscall_types.h&quot;<br>
+STRUCT_MAX<br>
+};<br>
+#undef STRUCT<br>
+#undef STRUCT_SPECIAL<br>
+<br>
=C2=A0#endif<br>
diff --git a/linux-user/syscall_types.h b/linux-user/syscall_types.h<br>
index 3f1f033464..559924c752 100644<br>
--- a/linux-user/syscall_types.h<br>
+++ b/linux-user/syscall_types.h<br>
@@ -1,3 +1,4 @@<br>
+<br>
=C2=A0STRUCT_SPECIAL(termios)<br>
<br>
=C2=A0STRUCT(winsize,<br>
@@ -464,3 +465,282 @@ STRUCT(usbdevfs_disconnect_claim,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* flags */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, USBDEVFS_MAXDRIVERNAM=
E + 1)) /* driver */<br>
=C2=A0#endif /* CONFIG_USBFS */<br>
+<br>
+/* ethtool ioctls */<br>
+STRUCT(ethtool_cmd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT,=C2=A0 =C2=A0/* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT,=C2=A0 =C2=A0/* supported */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT,=C2=A0 =C2=A0/* advertising */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_SHORT, /* speed */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* duplex */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* port */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* phy_address */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* transceiver */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* autoneg */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* mdio_support */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT,=C2=A0 =C2=A0/* maxtxpkt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT,=C2=A0 =C2=A0/* maxrxpkt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_SHORT, /* speed_hi */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* eth_tp_mdix */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_CHAR,=C2=A0 /* eth_tp_mdix_ctrl */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT,=C2=A0 =C2=A0/* lp_advertising */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_INT, 2)) /* reserved */<br>
+<br>
+STRUCT(ethtool_drvinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 32), /* driver */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 32), /* version */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 32), /* fw_version[ETHTOOL_=
FWVERS_LEN] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 32), /* bus_info[ETHTOOL_BU=
SINFO_LEN] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 32), /* erom_version[ETHTOO=
L_EROMVERS_LEN] */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 12), /* reserved2 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* n_priv_flags */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* n_stats */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* testinfo_len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* eedump_len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* regdump_len */<br>
+<br>
+STRUCT(ethtool_regs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* version */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_CHAR, 2)) /* data[0]: le=
n */<br>
+<br>
+STRUCT(ethtool_wolinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* supported */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* wolopts */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR,=C2=A0 6)) /* sopass[SOPASS_=
MAX] */<br>
+<br>
+STRUCT(ethtool_value,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* data */<br>
+<br>
+STRUCT(ethtool_eee,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* supported */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* advertised */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* lp_advertised */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* eee_active */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* eee_enabled */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_lpi_enabled */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_lpi_timer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_INT, 2)) /* reserved */<br>
+<br>
+STRUCT(ethtool_eeprom,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* magic */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* offset */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_CHAR, 3)) /* data[0]: le=
n */<br>
+<br>
+STRUCT(ethtool_coalesce,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_coalesce_usecs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_max_coalesced_frames */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_coalesce_usecs_irq */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_max_coalesced_frames_irq */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_coalesce_usecs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_max_coalesced_frames */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_coalesce_usecs_irq */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_max_coalesced_frames_irq */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* stats_block_coalesce_usecs */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* use_adaptive_rx_coalesce */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* use_adaptive_tx_coalesce */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* pkt_rate_low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_coalesce_usecs_low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_max_coalesced_frames_low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_coalesce_usecs_low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_max_coalesced_frames_low */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* pkt_rate_high */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_coalesce_usecs_high */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_max_coalesced_frames_high */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_coalesce_usecs_high */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_max_coalesced_frames_high */<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* rate_sample_interval */<br>
+<br>
+STRUCT(ethtool_ringparam,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_max_pending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_mini_max_pending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_jumbo_max_pending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_max_pending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_pending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_mini_pending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_jumbo_pending */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* tx_pending */<br>
+<br>
+STRUCT(ethtool_pauseparam,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* autoneg */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_pause */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* tx_pause */<br>
+<br>
+STRUCT(ethtool_test,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* flags */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* reserved */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_LONGLONG, 3)) /* data[0]=
: len */<br>
+<br>
+STRUCT(ethtool_gstrings,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* string_set */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(MK_ARRAY(TYPE_CHAR, 32), 2))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* data[0]: len * ETH_GSTRING_LEN */<br>
+<br>
+STRUCT(ethtool_stats,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* n_stats */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_LONGLONG, 1)) /* data[0]=
: n_stats */<br>
+<br>
+STRUCT(ethtool_perm_addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* size */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_CHAR, 1)) /* data[0]: si=
ze */<br>
+<br>
+STRUCT(ethtool_flow_ext,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 2), /* padding */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 6), /* h_dest[ETH_ALEN] */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 2), /* __be16 vlan_etype */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 2), /* __be16 vlan_tci */<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 8)) /* __be32 data[2] */<br=
>
+<br>
+/*<br>
+ * Union ethtool_flow_union contains alternatives that are either struct t=
hat<br>
+ * only uses __be* types or char/__u8, or &quot;__u8 hdata[52]&quot;. We c=
an treat it as<br>
+ * byte array in all cases.<br>
+ */<br>
+STRUCT(ethtool_rx_flow_spec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* flow_type */<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 52),=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* union ethtool_flow_union h_u */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_STRUCT(STRUCT_ethtool_flow_ext), /* h_ext */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 52),=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* union ethtool_flow_union m_u */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_STRUCT(STRUCT_ethtool_flow_ext), /* m_ext */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_LONGLONG,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ring_cookie */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* location */<b=
r>
+<br>
+STRUCT(ethtool_rxnfc_rss_context,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* flow_type */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_LONGLONG, /* data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_STRUCT(STRUCT_ethtool_rx_flow_spec), /* fs *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* rss_context */<br>
+<br>
+STRUCT(ethtool_rxnfc_rule_cnt,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* flow_type */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_LONGLONG, /* data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_STRUCT(STRUCT_ethtool_rx_flow_spec), /* fs *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* rss_cnt */<br>
+<br>
+STRUCT(ethtool_rxnfc_rule_locs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* flow_type */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_LONGLONG, /* data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_STRUCT(STRUCT_ethtool_rx_flow_spec), /* fs *=
/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rss_cnt */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_INT, 4)) /* rule_locs[0]=
: rss_cnt */<br>
+<br>
+/*<br>
+ * For ETHTOOL_{G,S}RXFH, originally only the first three fields are defin=
ed,<br>
+ * but with certain options, more fields are used.<br>
+ */<br>
+STRUCT_SPECIAL(ethtool_rxnfc_get_set_rxfh)<br>
+<br>
+STRUCT(ethtool_flash,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* region */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_CHAR, 128)) /* data[ETHTOOL_FLASH=
_MAX_FILENAME] */<br>
+<br>
+STRUCT_SPECIAL(ethtool_sset_info)<br>
+<br>
+STRUCT(ethtool_rxfh_indir,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* size */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_INT, 1)) /* ring_index[0=
]: size */<br>
+<br>
+STRUCT_SPECIAL(ethtool_rxfh)<br>
+<br>
+STRUCT(ethtool_get_features_block,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* available */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* requested */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* active */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* never_changed */<br>
+<br>
+STRUCT(ethtool_gfeatures,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* size */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(MK_STRUCT(STRUCT_ethtool_get_=
features_block), 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* features[0]: size */<br>
+<br>
+STRUCT(ethtool_set_features_block,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* valid */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* requested */<br>
+<br>
+STRUCT(ethtool_sfeatures,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* size */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(MK_STRUCT(STRUCT_ethtool_set_=
features_block), 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* features[0]: size */<br>
+<br>
+STRUCT(ethtool_channels,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* max_rx */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* max_tx */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* max_other */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* max_combined */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_count */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_count */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* other_count */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* combined_count */<br>
+<br>
+/*<br>
+ * For ETHTOOL_SET_DUMP and ETHTOOL_GET_DUMP_FLAG, the flexible array `dat=
a` is<br>
+ * not used.<br>
+ */<br>
+STRUCT(ethtool_dump_no_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* version */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* flag */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* len */<br>
+<br>
+STRUCT(ethtool_dump,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* version */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* flag */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_CHAR, 3)) /* data[0]: le=
n */<br>
+<br>
+STRUCT(ethtool_ts_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* so_timestamping */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* phc_index */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* tx_types */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_INT, 3), /* tx_reserved */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* rx_filters */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_INT, 3)) /* rx_reserved */<br>
+<br>
+STRUCT(ethtool_modinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* type */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* eeprom_len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_ARRAY(TYPE_INT, 8)) /* reserved */<br>
+<br>
+STRUCT(ethtool_tunable,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* id */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* type_id */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* len */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0MK_FLEXIBLE_ARRAY(TYPE_PTRVOID, 3)) /* data[0]:=
 len */<br>
+<br>
+STRUCT_SPECIAL(ethtool_link_settings)<br>
+<br>
+STRUCT(ethtool_fecparam,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* cmd */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* active_fec */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT, /* fec */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_INT) /* reserved */<br>
+<br>
+STRUCT_SPECIAL(ethtool_per_queue_op)<br>
diff --git a/tests/tcg/multiarch/ethtool.c b/tests/tcg/multiarch/ethtool.c<=
br>
new file mode 100644<br>
index 0000000000..dcb10230e0<br>
--- /dev/null<br>
+++ b/tests/tcg/multiarch/ethtool.c<br>
@@ -0,0 +1,423 @@<br>
+#include &lt;asm-generic/errno.h&gt;<br>
+#include &lt;assert.h&gt;<br>
+#include &lt;errno.h&gt;<br>
+#include &lt;inttypes.h&gt;<br>
+#include &lt;linux/ethtool.h&gt;<br>
+#include &lt;linux/if.h&gt;<br>
+#include &lt;linux/sockios.h&gt;<br>
+#include &lt;netinet/in.h&gt;<br>
+#include &lt;stdbool.h&gt;<br>
+#include &lt;stdio.h&gt;<br>
+#include &lt;stdlib.h&gt;<br>
+#include &lt;string.h&gt;<br>
+#include &lt;sys/ioctl.h&gt;<br>
+#include &lt;sys/socket.h&gt;<br>
+<br>
+const int number_of_entries_to_print =3D 10;<br>
+const uint32_t protected_memory_pattern[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 0xdeadc0de, 0xb0bb1e, 0xfacade, 0xfeeb1e };<br>
+<br>
+static void fail_with(const char *action, const char *cmd_name, int cmd,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int err)<br>
+{<br>
+=C2=A0 =C2=A0 if (errno =3D=3D EOPNOTSUPP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Unsupported operation: %s; errno =
=3D %d: %s.\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;TEST SKIPPED =
(%s =3D 0x%x).\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0action, err, strerr=
or(err), cmd_name, cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to %s=
 (%s =3D 0x%x): errno =3D %d: %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action, cmd_name, =
cmd, err, strerror(err));<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to %s=
 (%s =3D 0x%x): no errno\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 action, cmd_name, =
cmd);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 exit(err);<br>
+}<br>
+#define FAIL(action, cmd) fail_with(action, #cmd, cmd, errno)<br>
+<br>
+/*<br>
+ * `calloc_protected` and `protected_memory_changed` can be used to verify=
 that<br>
+ * a system call does not write pass intended memory boundary.<br>
+ *<br>
+ * `ptr =3D calloc_protected(n)` will allocate extra memory after `n` byte=
s and<br>
+ * populate it with a memory pattern. The first `n` bytes are still guaran=
teed<br>
+ * to be zeroed out like `calloc(1, n)`. `protected_memory_changed(ptr, n)=
`<br>
+ * takes the pointer and the original size `n` and checks that the memory<=
br>
+ * pattern is intact.<br>
+ */<br>
+uint8_t *calloc_protected(size_t struct_size)<br>
+{<br>
+=C2=A0 =C2=A0 uint8_t *buf =3D (uint8_t *) calloc(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct_size + sizeof(protected_memory_pattern)=
);<br>
+=C2=A0 =C2=A0 memcpy(buf + struct_size, protected_memory_pattern,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(protected_memory_pattern))=
;<br>
+=C2=A0 =C2=A0 return buf;<br>
+}<br>
+<br>
+bool protected_memory_changed(const uint8_t *ptr, size_t struct_size)<br>
+{<br>
+=C2=A0 =C2=A0 return memcmp(ptr + struct_size, protected_memory_pattern,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(prot=
ected_memory_pattern)) !=3D 0;<br>
+}<br>
+<br>
+void print_entries(const char *fmt, int len, uint32_t *entries)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; len &amp;&amp; i &lt; number_of_entries=
_to_print; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(fmt, entries[i]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (len &gt; number_of_entries_to_print) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot; (%d more omitted)&quot;, len - n=
umber_of_entries_to_print);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+void basic_test(int socketfd, struct ifreq ifr)<br>
+{<br>
+=C2=A0 =C2=A0 struct ethtool_drvinfo drvinfo;<br>
+=C2=A0 =C2=A0 drvinfo.cmd =3D ETHTOOL_GDRVINFO;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)&amp;drvinfo;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get driver info&quot;, ETHTOOL_GDRV=
INFO);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 printf(&quot;Driver: %s (version %s)\n&quot;, drvinfo.driver=
, drvinfo.version);<br>
+}<br>
+<br>
+/* Test flexible array. */<br>
+void test_get_stats(int socketfd, struct ifreq ifr, int n_stats)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct ethtool_stats *stats =3D (struct ethtool_stats *)call=
oc(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1, sizeof(*stats) + sizeof(stats-&gt;data[0]) =
* n_stats);<br>
+=C2=A0 =C2=A0 stats-&gt;cmd =3D ETHTOOL_GSTATS;<br>
+=C2=A0 =C2=A0 stats-&gt;n_stats =3D n_stats;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)stats;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get statastics&quot;, ETHTOOL_GSTAT=
S);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(stats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (stats-&gt;n_stats !=3D n_stats) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get consistent number of statistics=
&quot;, ETHTOOL_GSTATS);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; stats-&gt;n_stats &amp;&amp; i &lt; num=
ber_of_entries_to_print; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;stats[%d] =3D %llu\n&quot;, i, (u=
nsigned long long)stats-&gt;data[i]);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (stats-&gt;n_stats &gt; number_of_entries_to_print) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;(%d more omitted)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats-&gt;n_stats -=
 number_of_entries_to_print);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 free(stats);<br>
+}<br>
+<br>
+/* Test flexible array with char array as elements. */<br>
+void test_get_strings(int socketfd, struct ifreq ifr, int n_stats)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct ethtool_gstrings *gstrings =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct ethtool_gstrings *)calloc(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1, sizeof(*gstrings) + ETH_GSTRI=
NG_LEN * n_stats);<br>
+=C2=A0 =C2=A0 gstrings-&gt;cmd =3D ETHTOOL_GSTRINGS;<br>
+=C2=A0 =C2=A0 gstrings-&gt;string_set =3D ETH_SS_STATS;<br>
+=C2=A0 =C2=A0 gstrings-&gt;len =3D n_stats;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)gstrings;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get string set&quot;, ETHTOOL_GSTRI=
NGS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(gstrings);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (gstrings-&gt;len !=3D n_stats) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get consistent number of statistics=
&quot;, ETHTOOL_GSTRINGS);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; gstrings-&gt;len &amp;&amp; i &lt; numb=
er_of_entries_to_print; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;stat_names[%d] =3D %.*s\n&quot;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, ETH_GSTRING_LEN,=
 gstrings-&gt;data + i * ETH_GSTRING_LEN);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (gstrings-&gt;len &gt; number_of_entries_to_print) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;(%d more omitted)\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gstrings-&gt;len - =
number_of_entries_to_print);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 free(gstrings);<br>
+}<br>
+<br>
+/*<br>
+ * Testing manual implementation of converting `struct ethtool_sset_info`,=
 also<br>
+ * info for subsequent tests.<br>
+ */<br>
+int test_get_sset_info(int socketfd, struct ifreq ifr)<br>
+{<br>
+=C2=A0 =C2=A0 const int n_sset =3D 2;<br>
+=C2=A0 =C2=A0 int n_stats;<br>
+=C2=A0 =C2=A0 struct ethtool_sset_info *sset_info =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct ethtool_sset_info *)calloc(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1, sizeof(*sset_info) + sizeof(s=
set_info-&gt;data[0]) * n_sset);<br>
+=C2=A0 =C2=A0 sset_info-&gt;cmd =3D ETHTOOL_GSSET_INFO;<br>
+=C2=A0 =C2=A0 sset_info-&gt;sset_mask =3D 1 &lt;&lt; ETH_SS_TEST | 1 &lt;&=
lt; ETH_SS_STATS;<br>
+=C2=A0 =C2=A0 assert(__builtin_popcount(sset_info-&gt;sset_mask) =3D=3D n_=
sset);<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)sset_info;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fail_with(&quot;get string set info&quot;, &qu=
ot;ETHTOOL_GSSET_INFO&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ETHTOOL_GSS=
ET_INFO, errno);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(sset_info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if ((sset_info-&gt;sset_mask &amp; (1 &lt;&lt; ETH_SS_STATS)=
) =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 puts(&quot;No stats string set info, SKIPPING =
dependent tests&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(sset_info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 n_stats =3D (sset_info-&gt;sset_mask &amp; (1 &lt;&lt; ETH_S=
S_TEST)) ?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sset_info-&gt;data[1] :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sset_info-&gt;data[0];<br>
+=C2=A0 =C2=A0 printf(&quot;n_stats =3D %d\n&quot;, n_stats);<br>
+=C2=A0 =C2=A0 free(sset_info);<br>
+=C2=A0 =C2=A0 return n_stats;<br>
+}<br>
+<br>
+/*<br>
+ * Test manual implementation of converting `struct ethtool_rxnfc`, focusi=
ng on<br>
+ * the case where only the first three fields are present. (The original s=
truct<br>
+ * definition.)<br>
+ */<br>
+void test_get_rxfh(int socketfd, struct ifreq ifr)<br>
+{<br>
+=C2=A0 =C2=A0 struct ethtool_rxnfc *rxnfc;<br>
+=C2=A0 =C2=A0 const int rxnfc_first_three_field_size =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(rxnfc-&gt;cmd) + sizeof(rxnfc-&gt;flow_=
type) + sizeof(rxnfc-&gt;data);<br>
+=C2=A0 =C2=A0 rxnfc =3D (struct ethtool_rxnfc *)calloc_protected(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rxnfc_first_three_field_size);<br>
+=C2=A0 =C2=A0 rxnfc-&gt;cmd =3D ETHTOOL_GRXFH;<br>
+=C2=A0 =C2=A0 rxnfc-&gt;flow_type =3D TCP_V4_FLOW;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)rxnfc;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get RX flow classification rules&qu=
ot;, ETHTOOL_GRXFH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(rxnfc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (protected_memory_changed((const uint8_t *)rxnfc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rxnfc_first_three_field_size))=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;preserve memory after the first thr=
ee fields&quot;, ETHTOOL_GRXFH);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 printf(&quot;Flow hash bitmask (flow_type =3D TCP v4): 0x%ll=
x\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned long long)rxnfc-&gt;dat=
a);<br>
+=C2=A0 =C2=A0 free(rxnfc);<br>
+}<br>
+<br>
+/* Test manual implementation of converting `struct ethtool_link_settings`=
. */<br>
+void test_get_link_settings(int socketfd, struct ifreq ifr)<br>
+{<br>
+=C2=A0 =C2=A0 int link_mode_masks_nwords;<br>
+=C2=A0 =C2=A0 struct ethtool_link_settings *link_settings_header =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct ethtool_link_settings *) calloc_protec=
ted(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*link_settings_header));<=
br>
+=C2=A0 =C2=A0 link_settings_header-&gt;cmd =3D ETHTOOL_GLINKSETTINGS;<br>
+=C2=A0 =C2=A0 link_settings_header-&gt;link_mode_masks_nwords =3D 0;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)link_settings_header;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get link settings mask sizes&quot;,=
 ETHTOOL_GLINKSETTINGS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(link_settings_header);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (protected_memory_changed((const uint8_t *)link_settings_=
header,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*link_settings_header))=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;preserve link_mode_masks&quot;, ETH=
TOOL_GLINKSETTINGS);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (link_settings_header-&gt;link_mode_masks_nwords &gt;=3D =
0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;complete handshake&quot;, ETHTOOL_G=
LINKSETTINGS);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 link_mode_masks_nwords =3D -link_settings_header-&gt;link_mo=
de_masks_nwords;<br>
+<br>
+=C2=A0 =C2=A0 struct ethtool_link_settings *link_settings =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct ethtool_link_settings *)calloc(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*link_settings) +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(link_settings_header-&gt;=
link_mode_masks[0]) *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_mode_masks_nwords * 3);<br>
+=C2=A0 =C2=A0 link_settings-&gt;cmd =3D ETHTOOL_GLINKSETTINGS;<br>
+=C2=A0 =C2=A0 link_settings-&gt;link_mode_masks_nwords =3D link_mode_masks=
_nwords;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)link_settings;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get link settings&quot;, ETHTOOL_GL=
INKSETTINGS);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(link_settings_header);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(link_settings);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (link_settings-&gt;link_mode_masks_nwords !=3D link_mode_=
masks_nwords) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;have consistent number of mode mask=
s&quot;, ETHTOOL_GLINKSETTINGS);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 printf(&quot;Link speed: %d MB\n&quot;, link_settings-&gt;sp=
eed);<br>
+=C2=A0 =C2=A0 printf(&quot;Number of link mode masks: %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_settings-&gt;link_mode_masks=
_nwords);<br>
+=C2=A0 =C2=A0 if (link_settings-&gt;link_mode_masks_nwords &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Supported bitmap:&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entries(&quot; 0x%08x&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 link_settings-&gt;link_mode_masks_nwords,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 link_settings-&gt;link_mode_masks);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 putchar(&#39;\n&#39;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Advertising bitmap:&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entries(&quot; 0x%08x&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 link_settings-&gt;link_mode_masks_nwords,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 link_settings-&gt;link_mode_masks +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 link_settings-&gt;link_mode_masks_nwords);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 putchar(&#39;\n&#39;);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Lp advertising bitmap:&quot;);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entries(&quot; 0x%08x&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 link_settings-&gt;link_mode_masks_nwords,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 link_settings-&gt;link_mode_masks +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2 * link_settings-&gt;link_mode_masks_nwords);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 putchar(&#39;\n&#39;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free(link_settings_header);<br>
+=C2=A0 =C2=A0 free(link_settings);<br>
+}<br>
+<br>
+/* Test manual implementation of converting `struct ethtool_per_queue_op`.=
 */<br>
+void test_perqueue(int socketfd, struct ifreq ifr)<br>
+{<br>
+=C2=A0 =C2=A0 const int n_queue =3D 2;<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct ethtool_per_queue_op *per_queue_op =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct ethtool_per_queue_op *)calloc(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*per_queue_op) + sizeof(s=
truct ethtool_coalesce) * n_queue);<br>
+=C2=A0 =C2=A0 per_queue_op-&gt;cmd =3D ETHTOOL_PERQUEUE;<br>
+=C2=A0 =C2=A0 per_queue_op-&gt;sub_command =3D ETHTOOL_GCOALESCE;<br>
+=C2=A0 =C2=A0 per_queue_op-&gt;queue_mask[0] =3D 0x3;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)per_queue_op;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get coalesce per queue&quot;, ETHTO=
OL_PERQUEUE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(per_queue_op);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; n_queue; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ethtool_coalesce *coalesce =3D (struct =
ethtool_coalesce *)(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 per_queue_op-&gt;data + sizeof(*=
coalesce) * i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (coalesce-&gt;cmd !=3D ETHTOOL_GCOALESCE) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;ETHTOOL_PERQUEUE (%d) sub_command ETHTOOL_GCOALESCE (%d) &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;fails to set entry %d&#39;s cmd to ETHTOOL_GCOALESCE, got %d &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;instead\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ETHT=
OOL_PERQUEUE, ETHTOOL_GCOALESCE, i,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 coal=
esce-&gt;cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;rx_coalesce_usecs[%d] =3D %u\nrx_=
max_coalesced_frames[%d] =3D %u\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, coalesce-&gt;rx_=
coalesce_usecs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, coalesce-&gt;rx_=
max_coalesced_frames);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 free(per_queue_op);<br>
+}<br>
+<br>
+/* Test manual implementation of ETHTOOL_GRSSH. */<br>
+void test_get_rssh(int socketfd, struct ifreq ifr)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct ethtool_rxfh *rxfh_header =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (struct ethtool_rxfh *)calloc_protected(sizeof=
(*rxfh_header));<br>
+=C2=A0 =C2=A0 rxfh_header-&gt;cmd =3D ETHTOOL_GRSSH;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)rxfh_header;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get RX flow hash indir and hash key=
 size&quot;, ETHTOOL_GRSSH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(rxfh_header);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (protected_memory_changed((const uint8_t *)rxfh_header,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*rxfh_header))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;preserve rss_config&quot;, ETHTOOL_=
GRSSH);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 printf(&quot;RX flow hash indir size =3D %d\nRX flow hash ke=
y size =3D %d\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rxfh_header-&gt;indir_size, rxfh_=
header-&gt;key_size);<br>
+<br>
+=C2=A0 =C2=A0 struct ethtool_rxfh *rxfh =3D (struct ethtool_rxfh *)calloc(=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(*rxfh) + 4 * rxfh_header-&gt;indir_size=
 + rxfh_header-&gt;key_size);<br>
+=C2=A0 =C2=A0 *rxfh =3D *rxfh_header;<br>
+=C2=A0 =C2=A0 ifr.ifr_data =3D (void *)rxfh;<br>
+=C2=A0 =C2=A0 if (ioctl(socketfd, SIOCETHTOOL, &amp;ifr) =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 FAIL(&quot;get RX flow hash indir and hash key=
&quot;, ETHTOOL_GRSSH);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(rxfh_header);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 free(rxfh);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (rxfh-&gt;indir_size =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;No RX flow hash indir\n&quot;);<b=
r>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;RX flow hash indir:&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 print_entries(&quot; 0x%08x&quot;, rxfh-&gt;in=
dir_size, rxfh-&gt;rss_config);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 putchar(&#39;\n&#39;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (rxfh-&gt;key_size =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;No RX flow hash key\n&quot;);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 char *key =3D (char *)(rxfh-&gt;rss_config + r=
xfh-&gt;indir_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;RX flow hash key:&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0;=C2=A0 i &lt; rxfh-&gt;key_size; =
++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (i % 2 =3D=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 putchar(&#39; &#39=
;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;%02hhx&quot;, key[i=
]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 putchar(&#39;\n&#39;);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 free(rxfh_header);<br>
+=C2=A0 =C2=A0 free(rxfh);<br>
+}<br>
+<br>
+int main(int argc, char **argv)<br>
+{<br>
+=C2=A0 =C2=A0 int socketfd, n_stats, i;<br>
+=C2=A0 =C2=A0 struct ifreq ifr;<br>
+<br>
+=C2=A0 =C2=A0 socketfd =3D socket(AF_INET, SOCK_DGRAM, 0);<br>
+=C2=A0 =C2=A0 if (socketfd =3D=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int err =3D errno;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Failed to op=
en socket: errno =3D %d: %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err, strerror(err)=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 1;; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ifr.ifr_ifindex =3D i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ioctl(socketfd, SIOCGIFNAME, &amp;ifr) =3D=
=3D -1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 puts(&quot;Could not find a non-=
loopback interface, SKIPPING&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncmp(ifr.ifr_name, &quot;lo&quot;, IFNA=
MSIZ) !=3D 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 printf(&quot;Interface index: %d\nInterface name: %.*s\n&quo=
t;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ifr.ifr_ifindex, IFNAMSIZ, ifr.if=
r_name);<br>
+<br>
+=C2=A0 =C2=A0 basic_test(socketfd, ifr);<br>
+<br>
+=C2=A0 =C2=A0 n_stats =3D test_get_sset_info(socketfd, ifr);<br>
+=C2=A0 =C2=A0 if (n_stats &gt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Testing lexible arrays. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_get_stats(socketfd, ifr, n_stats);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 test_get_strings(socketfd, ifr, n_stats);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Testing manual implementations of structure convertions. =
*/<br>
+=C2=A0 =C2=A0 test_get_rxfh(socketfd, ifr);<br>
+=C2=A0 =C2=A0 test_get_link_settings(socketfd, ifr);<br>
+=C2=A0 =C2=A0 test_perqueue(socketfd, ifr);<br>
+<br>
+=C2=A0 =C2=A0 /* Testing manual implementations of operations. */<br>
+=C2=A0 =C2=A0 test_get_rssh(socketfd, ifr);<br>
+<br>
+=C2=A0 =C2=A0 return 0;<br>
+}<br>
-- <br>
2.28.0.220.ged08abb693-goog<br>
<br>
</blockquote></div>

--000000000000e1b8e105b6b53131--

--000000000000f046b605b6b53181
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPkgYJKoZIhvcNAQcCoIIPgzCCD38CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggzsMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBMswggOzoAMCAQICEAHy0XLDpZOCM1Wo/zUt
MzMwDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yMDA5MDgy
MzU2MDBaFw0yMTAzMDcyMzU2MDBaMB8xHTAbBgkqhkiG9w0BCQEWDnNjd0Bnb29nbGUuY29tMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4K9xeUFzU1L6hntxALFgW0aoyikZjIgW4pd8
nWcrCSYXChFhwyifutcbbhIG6D0eyvZG/1sRjH9l+qnGEiYbgFYD6XeANyo/T9+zjeJXvaoYpSzw
6mV1aRDyNvUNeCqwud+goNpXsnt3r4zpowSzJdzYGpUYIaM/z+/gA+Mxir+1/SDMgkYaklCjBIOv
r27gND8qfYGRnw0MWYVS/KFRUReGbrAEt+2Sos4rJp0E1gQeJwz4xN8jTxpLlOtjEr77kVac2av/
uN9FuHOjhRTlQkXYh1mKW+U6SX8xX1vCxrKtZy2q7sfNuQoHS/dEIeVWgdPvF92J3WgeAEVLS0l6
lwIDAQABo4IBzDCCAcgwGQYDVR0RBBIwEIEOc2N3QGdvb2dsZS5jb20wDgYDVR0PAQH/BAQDAgWg
MB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjAdBgNVHQ4EFgQUOjPQqHnozC7J67Eo0jG0
Scoq+EwwTAYDVR0gBEUwQzBBBgkrBgEEAaAyASgwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cu
Z2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADCBmgYIKwYBBQUHAQEEgY0wgYow
PgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2NhL2dzYXRsYXNyM3NtaW1l
Y2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9n
c2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgwFoAUfMwKaNei6x4schvRzV2Vb4378mMw
RgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9jYS9nc2F0bGFzcjNz
bWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEBAGl/OCpv+gNa2mmNvwCHtnIPN9VOMir/
nWtLJO2quRG5sYvR+716VG+AviULPlSwcbBaBDYUsq5USyjbs0T2kMgzQ2EUWKIQhmCHK5GVGuwo
CQ5rOcJw2IT5O75oFFDJ6QEBboCvT04P0k7dzurR37JkbD124ZvWXSpfxI4WY88rVEyq75zAJWhB
fj6NEprNrkDFdegzTt/ptu3CS432kneuiLZXOyBWmhZkcdOHipuYjQ1nmuDk9ziWVtGUTl3XqE5B
UoUMJm713ykBBikjH02oVRiJNqGk+emm2TLaroGhvyFsGFqqfub8CPbQyxd3e0Ch6LjZCosQjxT9
LNTa43AxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIzIFNNSU1FIENBIDIwMjACEAHy0XLDpZOC
M1Wo/zUtMzMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIIV/UHOv00wi7wz4tMy/
y7mIW0B6rRt4PhNsK2iS7suQMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIwMTIxODA0MDM0NlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsG
CWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAbmLM4A/W1ES2Oaw7VcoMB7vHEeP7DNl1JUzDW
t5XsS17DqRoPVIXPQxK8L9tiU78Vfdmf1gXLL6yCFmGE6N041qpaYo8cBkliZlQWAVRoEHZeJvhw
BUVAilUGb78RQBi6n1A6+y1pU+G81MdxnWz5NRU7GAzG1YfY82LoRnVmuCXqbfaGp8S+4i1X9/Fr
uhErBRClj9iDCwrq8ZvzLeDauzcl1MMPDF8bou0OVorOZ97960LvcylYlbfCVhNfKO/BIf7CriLs
Ss/y0TMwWPtpLCsOT0iYuvBN/FHlLkwlkAsFz+9xQ1oAazTRzRlYEJyLla4P+VqHrMl4xJ5UKOwx
--000000000000f046b605b6b53181--

