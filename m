Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD76B8B2E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 07:23:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pby3W-0007JG-S5; Tue, 14 Mar 2023 02:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pby3V-0007J6-Bk
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:22:41 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pby3T-0007o8-Dn
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 02:22:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id p4so7072130wre.11
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 23:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678774957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00uQYOsidjD0CPAYsiK2rWil5R/oQs5nSJAxponlgTA=;
 b=cFmTmKFSfTtvs+d5ZkvGea5xMDHa/ALk1kmuc0n/6Gn1PJj1pCQ8mDZhsa/p0PxFol
 C1R5Oy/JLNikBbKCT/Zeqhfj4Gh5G7s7jDKjEeYnotEwnzNWAJfrftnFxQFhLrdG/+2f
 4qZC/3VokyFGs5j+UPJ69sKMO3pMTJHe+GW502m7TMaEvTPk6Siae3s8LL//h5lR4Rxz
 DbKWlVAvSCfDaimteEuETDBNc38fd9H+GZ5GgFoIVNfECE4ZeVN1wxfxPmQyoSJWY5Y1
 o9OH7fE2sAs1HBQQw7X12g6N8RkbY7pioDXcz/2bNnHJNzyoEeF9WeSpjasfNYfPdrSo
 en9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678774957;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=00uQYOsidjD0CPAYsiK2rWil5R/oQs5nSJAxponlgTA=;
 b=KMulMA0G3wyc4Emup/xzMxDHvldhiZ/GLP2oSGlR7UoxCPLLIMGLpKFy/SrYKD0Yjf
 FE3iKd4wGPH3MatELcNt8+xRri3NwhZIBl6RLfk3KHA4Zz0wPKYGSweGI2HYWlDmTpgf
 1vdKknEUsIITSvzHZWGEOdACLNAX3SxGje+KPP13go6s6l0vt0fOGEjFtU/PcLU+B7L7
 j6Df7f8ukx8R6BJkqI9OEykoRGQL2txnG/WZ4u2zsX/8jeECXfOjNm/ri8wf/b8pBGLh
 bSDE1cg3tUvvH3W2IGLiTRgtyqeybUnCODeEktOSzi+xibIUvZWXvmMvUThSiC+rg8cI
 N02A==
X-Gm-Message-State: AO0yUKVIjEMmn1fXF1jfae217H365lUfFHf+EuvILASt20MfhGKRQpMj
 1sv6Uh0Lci3tDl3Y8DanAwituw==
X-Google-Smtp-Source: AK7set//mf30nJ/z3BT2W3nv82wuEj5l7/wwAQu9QQmFmIfZd2KAuJVNKxMFlSKbZNCNOVpzvgTa9Q==
X-Received: by 2002:a5d:5650:0:b0:2ce:98fc:f289 with SMTP id
 j16-20020a5d5650000000b002ce98fcf289mr7085528wrw.49.1678774957700; 
 Mon, 13 Mar 2023 23:22:37 -0700 (PDT)
Received: from [192.168.150.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 f3-20020a0560001b0300b002c559626a50sm1239393wrz.13.2023.03.13.23.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 23:22:37 -0700 (PDT)
Message-ID: <3e7a9151-2f41-0ac5-2b47-f264574be73f@linaro.org>
Date: Tue, 14 Mar 2023 07:22:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/6] hw/cxl: QMP based poison injection support
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>
Cc: linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Ira Weiny <ira.weiny@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Michael Roth <michael.roth@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Mike Maslenkin <mike.maslenkin@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230303150908.27889-1-Jonathan.Cameron@huawei.com>
 <20230303150908.27889-5-Jonathan.Cameron@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303150908.27889-5-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 3/3/23 16:09, Jonathan Cameron wrote:
> Inject poison using qmp command cxl-inject-poison to add an entry to the
> poison list.
> 
> For now, the poison is not returned CXL.mem reads,

What do you mean?

> but only via the
> mailbox command Get Poison List.
> 
> See CXL rev 3.0, sec 8.2.9.8.4.1 Get Poison list (Opcode 4300h)
> 
> Kernel patches to use this interface here:
> https://lore.kernel.org/linux-cxl/cover.1665606782.git.alison.schofield@intel.com/
> 
> To inject poison using qmp (telnet to the qmp port)
> { "execute": "qmp_capabilities" }
> 
> { "execute": "cxl-inject-poison",
>      "arguments": {
>           "path": "/machine/peripheral/cxl-pmem0",
>           "start": 2048,
>           "length": 256
>      }
> }
> 
> Adjusted to select a device on your machine.
> 
> Note that the poison list supported is kept short enough to avoid the
> complexity of state machine that is needed to handle the MORE flag.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> ---
> v4:
>   - Widen the mask on Poison source (lower bits of the address)
>     to allow for Vendor Defined. Change will make it easier to potentially
>     add a means to inject such poison in the future. Today it has no
>     impact.
> ---
>   hw/cxl/cxl-mailbox-utils.c  | 90 +++++++++++++++++++++++++++++++++++++
>   hw/mem/cxl_type3.c          | 56 +++++++++++++++++++++++
>   hw/mem/cxl_type3_stubs.c    |  6 +++
>   include/hw/cxl/cxl_device.h | 20 +++++++++
>   qapi/cxl.json               | 18 ++++++++
>   5 files changed, 190 insertions(+)


> +/*
> + * This is very inefficient, but good enough for now!
> + * Also the payload will always fit, so no need to handle the MORE flag and
> + * make this stateful. We may want to allow longer poison lists to aid
> + * testing that kernel functionality.
> + */
> +static CXLRetCode cmd_media_get_poison_list(struct cxl_cmd *cmd,
> +                                            CXLDeviceState *cxl_dstate,
> +                                            uint16_t *len)
> +{
> +    struct get_poison_list_pl {
> +        uint64_t pa;
> +        uint64_t length;
> +    } QEMU_PACKED;
> +
> +    struct get_poison_list_out_pl {
> +        uint8_t flags;
> +        uint8_t rsvd1;
> +        uint64_t overflow_timestamp;
> +        uint16_t count;
> +        uint8_t rsvd2[0x14];
> +        struct {
> +            uint64_t addr;
> +            uint32_t length;
> +            uint32_t resv;
> +        } QEMU_PACKED records[];
> +    } QEMU_PACKED;
> +
> +    struct get_poison_list_pl *in = (void *)cmd->payload;
> +    struct get_poison_list_out_pl *out = (void *)cmd->payload;
> +    CXLType3Dev *ct3d = container_of(cxl_dstate, CXLType3Dev, cxl_dstate);
> +    uint16_t record_count = 0, i = 0;
> +    uint64_t query_start, query_length;
> +    CXLPoisonList *poison_list = &ct3d->poison_list;
> +    CXLPoison *ent;
> +    uint16_t out_pl_len;
> +
> +    query_start = ldq_le_p(&in->pa);
> +    /* 64 byte alignemnt required */
> +    if (query_start & 0x3f) {
> +        return CXL_MBOX_INVALID_INPUT;
> +    }
> +    query_length = ldq_le_p(&in->length) * 64;
> +
> +    QLIST_FOREACH(ent, poison_list, node) {
> +        /* Check for no overlap */
> +        if (ent->start >= query_start + query_length ||
> +            ent->start + ent->length <= query_start) {
> +            continue;
> +        }
> +        record_count++;
> +    }
> +    out_pl_len = sizeof(*out) + record_count * sizeof(out->records[0]);
> +    assert(out_pl_len <= CXL_MAILBOX_MAX_PAYLOAD_SIZE);
> +
> +    memset(out, 0, out_pl_len);
> +    QLIST_FOREACH(ent, poison_list, node) {
> +        uint64_t start, stop;
> +
> +        /* Check for no overlap */
> +        if (ent->start >= query_start + query_length ||
> +            ent->start + ent->length <= query_start) {
> +            continue;
> +        }
> +
> +        /* Deal with overlap */
> +        start = MAX(ent->start & 0xffffffffffffffc0, query_start);
> +        stop = MIN((ent->start & 0xffffffffffffffc0) + ent->length,

~63ull or ROUND_DOWN(, 64ull) could be easier to read.

> +                   query_start + query_length);
> +        stq_le_p(&out->records[i].addr, start | (ent->type & 0x7));
> +        stl_le_p(&out->records[i].length, (stop - start) / 64);
> +        i++;
> +    }
> +    if (ct3d->poison_list_overflowed) {
> +        out->flags = (1 << 1);
> +        stq_le_p(&out->overflow_timestamp, ct3d->poison_list_overflow_ts);
> +    }
> +    stw_le_p(&out->count, record_count);
> +    *len = out_pl_len;
> +    return CXL_MBOX_SUCCESS;
> +}
> +


> diff --git a/qapi/cxl.json b/qapi/cxl.json
> index 4be7d46041..9ebd680dfe 100644
> --- a/qapi/cxl.json
> +++ b/qapi/cxl.json
> @@ -5,6 +5,24 @@
>   # = CXL devices
>   ##
>   
> +##
> +# @cxl-inject-poison:
> +#
> +# Poison records indicate that a CXL memory device knows that a particular
> +# memory region may be corrupted. This may be because of locally detected
> +# errors (e.g. ECC failure) or poisoned writes received from other components
> +# in the system. This injection mechanism enables testing of the OS handling
> +# of poison records which may be queried via the CXL mailbox.
> +#
> +# @path: CXL type 3 device canonical QOM path
> +# @start: Start address - must be 64 byte aligned.
> +# @length: Length of poison to inject - must be a multiple of 64 bytes.
> +#
> +# Since: 8.0

8.1 per the cover.

> +##
> +{ 'command': 'cxl-inject-poison',
> +  'data': { 'path': 'str', 'start': 'uint64', 'length': 'uint64' }}
> +


