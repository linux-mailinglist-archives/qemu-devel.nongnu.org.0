Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4AF5B4035
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 21:51:50 +0200 (CEST)
Received: from localhost ([::1]:51292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWk2U-0007zS-5I
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 15:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWjz8-00063j-Jz; Fri, 09 Sep 2022 15:48:19 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:36139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oWjz6-0002cc-Bs; Fri, 09 Sep 2022 15:48:18 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 973EF5C015C;
 Fri,  9 Sep 2022 15:48:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 09 Sep 2022 15:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1662752893; x=1662839293; bh=ql9e7AhZpN
 W6/s0Xsygu/p0H4degbpe4/pV5baPDv/8=; b=a73Q/aq9QcA0siZUxlLZZnzTPw
 ixkEEELZ3zU/kBo//olbF4jCuhJV+N+3KBsMg49/FVXRNr3HRsnt1i0yn946QV5Z
 /fYj02skl34zK4xGYqoOD+UGNW8r1O7YGcjPU3HdtCMK+NKnAp+HwuZXSFTguhip
 pfAhbnbtPwOROdyL3ka0mLucqkntJ+fBwx9BHlmaXjLHRL/UFfNEfGO0ykTkeeMm
 qalpXa4s4+9vjNbHWwoIx0QD1LRJw0tmeph6M4RvoyGfVtTDlKvusf6kZ/EBwzPF
 /ZtLs8wj2J/FRDQMPMH3O1hylh7J28Ai2JxxuEX4afuc2U1gNpPEgG3AST5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662752893; x=1662839293; bh=ql9e7AhZpNW6/s0Xsygu/p0H4deg
 bpe4/pV5baPDv/8=; b=mucTWEPhRbzR1xKPTF0v/Xz2NRjhwS2qizCmrKZb+6mR
 bvA/CNDzVuIonABx8zqi56+Ubo/0gtj3KG9LWmHuqV/8Bx16fjEh1MwrpUtzeRGA
 pHrWtTkcwi5WR4WoyQA2/zqAueqVlLRK0aKirE0rHrqgvvwPW87kuGg8FOOkpWxq
 pWbdZtrtwcl8XmCoZ6OXTzitGSWhUZC/x9mhP/wTimShsV1YmmuaJ6CmelIirXOf
 fsWgpYTaRaRYAgL42zEKZOauvC9cgq7QRSlEHwDUfqYipOcCG1BlSZfCVvtcjEt4
 THy9D60HX+iU2nO6hnM06SqWUJiHtVZMmm8ao2flcg==
X-ME-Sender: <xms:fZgbY6QK-nXz04EFKF6q7KD5ENTKW989GjKEVGdW3h4gDauBsfBDuQ>
 <xme:fZgbY_z7KzACqHuLfdlYr9PP8klDMp6Z01_I5WTPtFGS76uYTlEQOV8Zlsl0gcQ7L
 MGtvUHzb3bMAVq2EfY>
X-ME-Received: <xmr:fZgbY30Kz9Iehras7FcihoQxWWTC_xK5HPjTF1rhjEjibQOYm4Vlqb2s6A2Q7f_0wtHHV-Z7dNdf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedthedgudeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:fZgbY2Axsxue5fdieIRqpOruT-ck1tDYKWoM5612BUvcNTyHlOBL4g>
 <xmx:fZgbYzgKbMq1S22THkSksPBwnp3zkpqP0ZNXi7OZmGjh5hafkpwpJg>
 <xmx:fZgbYypGtb2A-AfbGpxpJxki3AaklsOfSxyYQWTHmSW3nO0MnVmRvg>
 <xmx:fZgbY-VgT-YXr4i12rvcpG-5SMHOEAl6a-4-MKa7m-jfIijkox69VA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Sep 2022 15:48:12 -0400 (EDT)
Date: Fri, 9 Sep 2022 12:48:10 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz,
 iwona.winiarska@intel.com, tmaimon77@gmail.com,
 quic_jaehyoo@quicinc.com, Hao Wu <wuhaotsh@google.com>
Subject: Re: [RFC PATCH 3/3] hw/peci: add support for EndPointConfig reads
Message-ID: <YxuYehCwKw/CmWhN@pdel-fedora-MJ0HJWH9>
References: <20220906220552.1243998-1-titusr@google.com>
 <20220906220552.1243998-4-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906220552.1243998-4-titusr@google.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=peter@pjd.dev;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Tue, Sep 06, 2022 at 10:05:52PM +0000, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  hw/peci/peci-client.c  | 63 ++++++++++++++++++++++++++++++++++++++++++
>  hw/peci/peci-core.c    | 44 +++++++++++++++++++++++++++--
>  include/hw/peci/peci.h | 23 +++++++++++++++
>  3 files changed, 128 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/peci/peci-client.c b/hw/peci/peci-client.c
> index 2aa797b5f6..8d93333248 100644
> --- a/hw/peci/peci-client.c
> +++ b/hw/peci/peci-client.c
> @@ -23,6 +23,64 @@
>  
>  #define PECI_CLIENT_DEFAULT_TEMP 30
>  
> +/* TODO: move this out into a config */
> +static const PECIEndPtConfig spr_config[] = {
> +    {
> +        .hdr.msg_type = LOCAL_PCI_CFG,
> +        .hdr.addr_type = 0x4,
> +        .hdr.bus = 31,
> +        .hdr.dev = 0,
> +        .hdr.func = 2,
> +        .hdr.reg = 0xD4,
> +        .data = BIT(31)
> +    },
> +    {
> +        .hdr.msg_type = LOCAL_PCI_CFG,
> +        .hdr.addr_type = 0x4,
> +        .hdr.bus = 31,
> +        .hdr.dev = 0,
> +        .hdr.func = 2,
> +        .hdr.reg = 0xD0,
> +        .data = BIT(31) | BIT(30)
> +    },
> +    {
> +        .hdr.msg_type = LOCAL_PCI_CFG,
> +        .hdr.addr_type = 0x4,
> +        .hdr.bus = 31,
> +        .hdr.dev = 30,
> +        .hdr.func = 6,
> +        .hdr.reg = 0x84,
> +        .data = 0x03FFFFFF
> +    },
> +    {
> +        .hdr.msg_type = LOCAL_PCI_CFG,
> +        .hdr.addr_type = 0x4,
> +        .hdr.bus = 31,
> +        .hdr.dev = 30,
> +        .hdr.func = 6,
> +        .hdr.reg = 0x80,
> +        .data = 0xFFFFFFFF
> +    },
> +    {
> +        .hdr.msg_type = LOCAL_PCI_CFG,
> +        .hdr.addr_type = 0x4,
> +        .hdr.bus = 31,
> +        .hdr.dev = 30,
> +        .hdr.func = 6,
> +        .hdr.reg = 0x84,
> +        .data = 0x03FFFFFF
> +    },
> +    {
> +        .hdr.msg_type = LOCAL_PCI_CFG,
> +        .hdr.addr_type = 0x4,
> +        .hdr.bus = 31,
> +        .hdr.dev = 30,
> +        .hdr.func = 6,
> +        .hdr.reg = 0x80,
> +        .data = 0xFFFFFFFF
> +    },
> +};
> +
>  static void peci_client_update_temps(PECIClientDevice *client)
>  {
>      uint8_t temp_cpu = 0;
> @@ -115,7 +173,12 @@ PECIClientDevice *peci_add_client(PECIBus *bus,
>          break;
>  
>      case FAM6_ICELAKE_X:
> +        client->revision = 0x40;
> +        break;
> +
>      case FAM6_SAPPHIRE_RAPIDS_X:
> +        client->endpt_conf = spr_config;
> +        client->num_entries = sizeof(spr_config) / sizeof(spr_config[0]);
>          client->revision = 0x40;
>          client->ucode = 0x8c0004a0;
>          break;
> diff --git a/hw/peci/peci-core.c b/hw/peci/peci-core.c
> index 8210bfa198..a961ae51f3 100644
> --- a/hw/peci/peci-core.c
> +++ b/hw/peci/peci-core.c
> @@ -22,6 +22,47 @@
>  #define PECI_FCS_OK         0
>  #define PECI_FCS_ERR        1
>  
> +static PECIEndPtHeader peci_fmt_end_pt_header(PECICmd *pcmd)
> +{
> +    uint32_t val = pcmd->rx[7] | (pcmd->rx[8] << 8) | (pcmd->rx[9] << 16) |
> +                  (pcmd->rx[10] << 24);
> +
> +    PECIEndPtHeader header = {
> +        .msg_type = pcmd->rx[1],
> +        .addr_type = pcmd->rx[5],
> +        .bus = (val >> 20) & 0xFF,
> +        .dev = (val >> 15) & 0x1F,
> +        .func = (val >> 12) & 0x7,
> +        .reg = val & 0xFFF,
> +    };
> +
> +    return header;
> +}
> +
> +static void peci_rd_endpt_cfg(PECIClientDevice *client, PECICmd *pcmd)
> +{
> +    PECIPkgCfg *resp = (PECIPkgCfg *)pcmd->tx;
> +    PECIEndPtHeader req = peci_fmt_end_pt_header(pcmd);
> +    PECIEndPtConfig const *c;
> +
> +    if (client->endpt_conf) {
> +        for (size_t i = 0; i < client->num_entries; i++) {
> +            c = &client->endpt_conf[i];
> +
> +            if (!memcmp(&req, &c->hdr, sizeof(PECIEndPtHeader))) {
> +                    resp->data = c->data;
> +                    resp->cc = PECI_DEV_CC_SUCCESS;
> +                    return;
> +            }
> +        }
> +    }
> +
> +    qemu_log_mask(LOG_UNIMP,
> +                  "%s: msg_type: 0x%x bus: %u, dev: %u, func: %u, reg: 0x%x\n",
> +                  __func__, req.msg_type, req.bus, req.dev, req.func, req.reg);
> +
> +}
> +
>  static void peci_rd_pkg_cfg(PECIClientDevice *client, PECICmd *pcmd)
>  {
>      PECIPkgCfg *resp = (PECIPkgCfg *)pcmd->tx;
> @@ -153,8 +194,7 @@ int peci_handle_cmd(PECIBus *bus, PECICmd *pcmd)
>          break;
>  
>      case PECI_CMD_RD_END_PT_CFG:
> -        qemu_log_mask(LOG_UNIMP, "%s: unimplemented CMD_RD_END_PT_CFG\n",
> -                      __func__);
> +        peci_rd_endpt_cfg(client, pcmd);
>          break;
>  
>      default:
> diff --git a/include/hw/peci/peci.h b/include/hw/peci/peci.h
> index 1a0abe65cd..4fb2fc236e 100644
> --- a/include/hw/peci/peci.h
> +++ b/include/hw/peci/peci.h
> @@ -112,6 +112,26 @@ typedef struct PECITempTarget {
>      uint8_t tjmax;
>  } PECITempTarget;
>  
> +typedef enum PECIEndPtType {
> +    LOCAL_PCI_CFG = 3,
> +    PCI_CFG,
> +    MMIO_BDF,
> +} PECIEndPtType;
> +
> +typedef struct __attribute__ ((__packed__)) {
> +    PECIEndPtType msg_type;
> +    uint8_t addr_type;
> +    uint8_t bus;
> +    uint8_t dev;
> +    uint8_t func;
> +    uint16_t reg;
> +} PECIEndPtHeader;
> +
> +typedef struct {
> +    PECIEndPtHeader hdr;
> +    uint32_t data;
> +} PECIEndPtConfig;

I noticed the summary is "hw/peci: add support for EndPointConfig reads"
but type definitions here use "EndPt", maybe they should be
"PECIEndPoint*"? I don't think extending to Point is too long.

> +
>  #define PECI_BASE_ADDR              0x30
>  #define PECI_BUFFER_SIZE            0x100
>  #define PECI_NUM_CPUS_MAX           56
> @@ -140,6 +160,9 @@ typedef struct PECIClientDevice {
>      uint8_t dimm_temp_max;
>      uint8_t dimm_temp[PECI_NUM_DIMMS_MAX];
>  
> +    /* EndPtConfig info */
> +    PECIEndPtConfig const *endpt_conf;
> +    size_t num_entries;
>  } PECIClientDevice;
>  
>  #define TYPE_PECI_CLIENT "peci-client"
> -- 
> 2.37.2.789.g6183377224-goog
> 

