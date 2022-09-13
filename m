Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B19FE5B7A94
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 21:10:04 +0200 (CEST)
Received: from localhost ([::1]:50040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYBIH-0005Jv-JR
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 15:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oYAg8-0007AW-1b; Tue, 13 Sep 2022 14:30:39 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oYAg6-0000ce-5z; Tue, 13 Sep 2022 14:30:35 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id D665632008FC;
 Tue, 13 Sep 2022 14:30:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 13 Sep 2022 14:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1663093828; x=1663180228; bh=qLHN8MihX5
 Jj/bNGG7izCzwZLREy/gUiB45NxOaF1Y0=; b=pvNuWdyX+949tH8KyKtjUWlAKA
 4iuQQof8//+OLJEwmm3kR/uIMESESaKCIhFnATGm+N1Myd7Q8fIll+0oIpXVGWHX
 CEq+Y5tNE3ea5P4aZaimsNTfBEw3mG6QyNMgJXjCgrYBdtyYjBAc04SyoTtBGUlc
 afHZ26aVwrgxlECstLZpBCKJQaGvzTjWcYnIViuVH/XOv3ys+jaTUydxs8yPNR9D
 afNSz5B/F3McbtWiwRAaTU/Qo36pPFGreXe536hFNDOLf9IMQvaLmty/fwGjllUt
 KXZG8fb/tBm+aKRZeZXT/YN8//aQ5bQU5lJZxJuG13CU9FeShWEKlsLshPdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663093828; x=1663180228; bh=qLHN8MihX5Jj/bNGG7izCzwZLREy
 /gUiB45NxOaF1Y0=; b=O3eRlCBoGDiHBw13E8jeSKCpPPUY3UZWvhL3wKCkNwfq
 lSWzkuCjOP0Bi9KjSwHxHCJehSruwWDHTcC1F7Y0UDsoxcZJIQ8cXLLWlizXfBha
 QhYdUmy9YIWImEj9fF12TMVOiaBEoCcwB+QKYoS7J3WbiYhjBKPU022jSW3G4ABw
 HLaZVp3GOUN1fHlWszZIfnqSfkQoiEN36mYJnGaV5a40P2vmSWYNxir0/JLywdDK
 lfCysGsDiIvU8PnMKKWW1Z5bOVLBR4yhYqZ31WhFSCW4KZHGfeWk1d+M93xslKmY
 5SL1KqToji4B8ixzqX6AwBXqXNIEYgdey1g9+UARqg==
X-ME-Sender: <xms:RMwgY_zXhVkHQ2vPixYzYPn1EUCVYMx0-_IQotwJ8G0NtH3Dd9tEwA>
 <xme:RMwgY3R6T0pkNhleEft2-iVtheWQgW6lht_JHpLE0ag_cdlwqQuRfj5rERxDoRYEq
 xag2pzp7grvFxMcotk>
X-ME-Received: <xmr:RMwgY5WzK34eH7LC31zv2ugrh5VikyBN316K8X_uz39YdIYlXdwk95j6sWElTTaZwqGa6BJQ7ICe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedugedguddvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeduteeihfffleeuveekgedugfeffeehtdeguefffffhleehgfduueejjeek
 feeukeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:RMwgY5jAMgS8q7aCVcCWhYYzOcNE_e7lLVD8p8mZznndAkFwsFVPAA>
 <xmx:RMwgYxBVCPtZxTXaQeK7ERqVyWmHeTQITk9VZysmvOPD8gTdBkiOsw>
 <xmx:RMwgYyI0nyophXvN2Nih11v2OrUZgi8eYKdaAQUcJp8cmpLhONtUpA>
 <xmx:RMwgYz00SdAqr9_uDTNXnU9qnu6fUx48m25NpyEMYq0m7JsOwNLVlg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Sep 2022 14:30:27 -0400 (EDT)
Date: Tue, 13 Sep 2022 11:30:25 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, patrick@stwcx.xyz,
 iwona.winiarska@intel.com, tmaimon77@gmail.com,
 quic_jaehyoo@quicinc.com, Hao Wu <wuhaotsh@google.com>
Subject: Re: [RFC PATCH v2 3/3] hw/peci: add support for EndPointConfig reads
Message-ID: <YyDMQTCp3+/yvq78@pdel-fedora-MJ0HJWH9>
References: <20220913182149.1468366-1-titusr@google.com>
 <20220913182149.1468366-4-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913182149.1468366-4-titusr@google.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On Tue, Sep 13, 2022 at 06:21:49PM +0000, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Delevoryas <peter@pj.dev>

> ---
>  hw/peci/peci-client.c  | 63 ++++++++++++++++++++++++++++++++++++++++++
>  hw/peci/peci-core.c    | 44 +++++++++++++++++++++++++++--
>  include/hw/peci/peci.h | 23 +++++++++++++++
>  3 files changed, 128 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/peci/peci-client.c b/hw/peci/peci-client.c
> index 2aa797b5f6..e54735bb53 100644
> --- a/hw/peci/peci-client.c
> +++ b/hw/peci/peci-client.c
> @@ -23,6 +23,64 @@
>  
>  #define PECI_CLIENT_DEFAULT_TEMP 30
>  
> +/* TODO: move this out into a config */
> +static const PECIEndPointConfig spr_config[] = {
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
> +        client->endpoint_conf = spr_config;
> +        client->num_entries = sizeof(spr_config) / sizeof(spr_config[0]);
>          client->revision = 0x40;
>          client->ucode = 0x8c0004a0;
>          break;
> diff --git a/hw/peci/peci-core.c b/hw/peci/peci-core.c
> index 8210bfa198..0650a03e2d 100644
> --- a/hw/peci/peci-core.c
> +++ b/hw/peci/peci-core.c
> @@ -22,6 +22,47 @@
>  #define PECI_FCS_OK         0
>  #define PECI_FCS_ERR        1
>  
> +static PECIEndPointHeader peci_fmt_end_pt_header(PECICmd *pcmd)
> +{
> +    uint32_t val = pcmd->rx[7] | (pcmd->rx[8] << 8) | (pcmd->rx[9] << 16) |
> +                  (pcmd->rx[10] << 24);
> +
> +    PECIEndPointHeader header = {
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
> +static void peci_rd_endpoint_cfg(PECIClientDevice *client, PECICmd *pcmd)
> +{
> +    PECIPkgCfg *resp = (PECIPkgCfg *)pcmd->tx;
> +    PECIEndPointHeader req = peci_fmt_end_pt_header(pcmd);
> +    PECIEndPointConfig const *c;
> +
> +    if (client->endpoint_conf) {
> +        for (size_t i = 0; i < client->num_entries; i++) {
> +            c = &client->endpoint_conf[i];
> +
> +            if (!memcmp(&req, &c->hdr, sizeof(PECIEndPointHeader))) {
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
> +        peci_rd_endpoint_cfg(client, pcmd);
>          break;
>  
>      default:
> diff --git a/include/hw/peci/peci.h b/include/hw/peci/peci.h
> index 1a0abe65cd..3dcfe82245 100644
> --- a/include/hw/peci/peci.h
> +++ b/include/hw/peci/peci.h
> @@ -112,6 +112,26 @@ typedef struct PECITempTarget {
>      uint8_t tjmax;
>  } PECITempTarget;
>  
> +typedef enum PECIEndPointType {
> +    LOCAL_PCI_CFG = 3,
> +    PCI_CFG,
> +    MMIO_BDF,
> +} PECIEndPointType;
> +
> +typedef struct __attribute__ ((__packed__)) {
> +    PECIEndPointType msg_type;
> +    uint8_t addr_type;
> +    uint8_t bus;
> +    uint8_t dev;
> +    uint8_t func;
> +    uint16_t reg;
> +} PECIEndPointHeader;
> +
> +typedef struct {
> +    PECIEndPointHeader hdr;
> +    uint32_t data;
> +} PECIEndPointConfig;
> +
>  #define PECI_BASE_ADDR              0x30
>  #define PECI_BUFFER_SIZE            0x100
>  #define PECI_NUM_CPUS_MAX           56
> @@ -140,6 +160,9 @@ typedef struct PECIClientDevice {
>      uint8_t dimm_temp_max;
>      uint8_t dimm_temp[PECI_NUM_DIMMS_MAX];
>  
> +    /* EndPtConfig info */
> +    PECIEndPointConfig const *endpoint_conf;
> +    size_t num_entries;
>  } PECIClientDevice;
>  
>  #define TYPE_PECI_CLIENT "peci-client"
> -- 
> 2.37.3.968.ga6b4b080e4-goog
> 

