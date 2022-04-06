Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152534F5A8F
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 12:29:40 +0200 (CEST)
Received: from localhost ([::1]:56916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc2uw-0002RQ-LD
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 06:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc2sB-0000jt-Fd
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:26:47 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:54321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nc2s9-0004Oc-3e
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 06:26:47 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3AF50F3AED54;
 Wed,  6 Apr 2022 12:26:41 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 6 Apr
 2022 12:26:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0049b0d9040-5fad-4126-b06f-b3d3e83f1d66,
 ACAFAA60954BC139C96B6B3855CBF7BDA7777862) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f7aaea2e-73fb-ef19-29a1-cf9d1d97175e@kaod.org>
Date: Wed, 6 Apr 2022 12:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/7] hw/registerfields: Add shared fields macros
Content-Language: en-US
To: Joe Komlodi <komlodi@google.com>, <qemu-devel@nongnu.org>
References: <20220331043248.2237838-1-komlodi@google.com>
 <20220331043248.2237838-2-komlodi@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220331043248.2237838-2-komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0a062cc7-3df1-482b-ae1f-80aa53edaee6
X-Ovh-Tracer-Id: 7701436841691810598
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepvhgvnhhtuhhrvgesghhoohhglhgvrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: andrew@aj.id.au, peter.maydell@linaro.org, joel@jms.id.au,
 venture@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/22 06:32, Joe Komlodi wrote:
> Occasionally a peripheral will have different operating modes, where the
> MMIO layout changes, but some of the register fields have the same offsets
> and behaviors.
> 
> To help support this, we add SHARED_FIELD_XX macros that create SHIFT,
> LENGTH, and MASK macros for the fields that are shared across registers,
> and accessors for these fields.
> 
> An example use may look as follows:
> There is a peripheral with registers REG_MODE1 and REG_MODE2 at
> different addreses, and both have a field FIELD1 initialized by
> SHARED_FIELD().
> 
> Depending on what mode the peripheral is operating in, the user could
> extract FIELD1 via
> SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE1, FIELD1)
> or
> SHARED_ARRAY_FIELD_EX32(s->regs, R_REG_MODE2, FIELD1)
> 
> Signed-off-by: Joe Komlodi <komlodi@google.com>
> Change-Id: Id3dc53e7d2f8741c95697cbae69a81bb699fa3cb

I would merge patch 1,3,7 but without the new mode definitions first
and in another header file because we don't need to expose the register
definitions outside the I2C model.

See hw/intc/pnv_xive*regs.h for an example.

Thanks,

C.

> ---
>   include/hw/registerfields.h | 70 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
> 
> diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
> index f2a3c9c41f..cf3bc3a6e3 100644
> --- a/include/hw/registerfields.h
> +++ b/include/hw/registerfields.h
> @@ -108,4 +108,74 @@
>   #define ARRAY_FIELD_DP64(regs, reg, field, val)                           \
>       (regs)[R_ ## reg] = FIELD_DP64((regs)[R_ ## reg], reg, field, val);
>   
> +
> +/*
> + * These macros can be used for defining and extracting fields that have the
> + * same bit position across multiple registers.
> + */
> +
> +/* Define shared SHIFT, LENGTH, and MASK constants */
> +#define SHARED_FIELD(name, shift, length)   \
> +    enum { name ## _ ## SHIFT = (shift)};   \
> +    enum { name ## _ ## LENGTH = (length)}; \
> +    enum { name ## _ ## MASK = MAKE_64BIT_MASK(shift, length)};
> +
> +/* Extract a shared field */
> +#define SHARED_FIELD_EX8(storage, field) \
> +    extract8((storage), field ## _SHIFT, field ## _LENGTH)
> +
> +#define SHARED_FIELD_EX16(storage, field) \
> +    extract16((storage), field ## _SHIFT, field ## _LENGTH)
> +
> +#define SHARED_FIELD_EX32(storage, field) \
> +    extract32((storage), field ## _SHIFT, field ## _LENGTH)
> +
> +#define SHARED_FIELD_EX64(storage, field) \
> +    extract64((storage), field ## _SHIFT, field ## _LENGTH)
> +
> +/* Extract a shared field from a register array */
> +#define SHARED_ARRAY_FIELD_EX32(regs, offset, field) \
> +    SHARED_FIELD_EX32((regs)[(offset)], field)
> +#define SHARED_ARRAY_FIELD_EX64(regs, offset, field) \
> +    SHARED_FIELD_EX64((regs)[(offset)], field)
> +
> +/* Deposit a shared field */
> +#define SHARED_FIELD_DP8(storage, field, val) ({                        \
> +    struct {                                                            \
> +        unsigned int v:field ## _LENGTH;                                \
> +    } _v = { .v = val };                                                \
> +    uint8_t _d;                                                         \
> +    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
> +    _d; })
> +
> +#define SHARED_FIELD_DP16(storage, field, val) ({                       \
> +    struct {                                                            \
> +        unsigned int v:field ## _LENGTH;                                \
> +    } _v = { .v = val };                                                \
> +    uint16_t _d;                                                        \
> +    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
> +    _d; })
> +
> +#define SHARED_FIELD_DP32(storage, field, val) ({                       \
> +    struct {                                                            \
> +        unsigned int v:field ## _LENGTH;                                \
> +    } _v = { .v = val };                                                \
> +    uint32_t _d;                                                        \
> +    _d = deposit32((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
> +    _d; })
> +
> +#define SHARED_FIELD_DP64(storage, field, val) ({                       \
> +    struct {                                                            \
> +        uint64_t v:field ## _LENGTH;                                    \
> +    } _v = { .v = val };                                                \
> +    uint64_t _d;                                                        \
> +    _d = deposit64((storage), field ## _SHIFT, field ## _LENGTH, _v.v); \
> +    _d; })
> +
> +/* Deposit a shared field to a register array */
> +#define SHARED_ARRAY_FIELD_DP32(regs, offset, field, val) \
> +    (regs)[(offset)] = SHARED_FIELD_DP32((regs)[(offset)], field, val);
> +#define SHARED_ARRAY_FIELD_DP64(regs, offset, field, val) \
> +    (regs)[(offset)] = SHARED_FIELD_DP64((regs)[(offset)], field, val);
> +
>   #endif


