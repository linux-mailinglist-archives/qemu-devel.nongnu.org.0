Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8532C6CBE25
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 13:53:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph7sd-0001vQ-Hu; Tue, 28 Mar 2023 07:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph7sb-0001vH-Kt
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:52:45 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph7sZ-0006sD-N5
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 07:52:45 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.3])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8CCB9295CB;
 Tue, 28 Mar 2023 11:52:39 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 28 Mar
 2023 13:52:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00224670eaf-1a75-460e-8e96-532abb90faeb,
 5D21C2AA46E1B9891D174392918792ED1A5C90BB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0b6bc13e-937f-0106-5849-bed7dba6b70a@kaod.org>
Date: Tue, 28 Mar 2023 13:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/3] qtest: Add a test case for TPM TIS I2C connected to
 Aspeed I2C controller
Content-Language: en-US
To: Stefan Berger <stefanb@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <marcandre.lureau@redhat.com>, <ninad@linux.ibm.com>, <joel@jms.id.au>,
 <andrew@aj.id.au>
References: <20230327202416.3617162-1-stefanb@linux.ibm.com>
 <20230327202416.3617162-4-stefanb@linux.ibm.com>
 <50f67d0d-18f8-dead-9716-cd94b24915a6@kaod.org>
 <f947d10a-4edd-1376-cea9-cdc5dae216f8@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f947d10a-4edd-1376-cea9-cdc5dae216f8@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7c4821ef-0dd2-430c-8905-cea82f11d2d8
X-Ovh-Tracer-Id: 15350237856566709030
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedggeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefveejuddttdevvedvjeevudfhtdeuveeggfffuefhhfdvjeegvefftdegteekieenucffohhmrghinhepnhhonhhgnhhurdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepshhtvghfrghnsgeslhhinhhugidrihgsmhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpmhgrrhgtrghnughrvgdrlhhurhgvrghusehrvgguhhgrthdrtghomhdpnhhinhgrugeslhhinhhugidrihgsmhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdgrnhgurhgvfiesrghjrdhiugdrrghupdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 3/28/23 13:31, Stefan Berger wrote:
> 
> 
> On 3/28/23 05:17, Cédric Le Goater wrote:
>>> +static void tpm_tis_i2c_test_basic(const void *data)
>>> +{
>>> +    uint8_t access;
>>> +    uint32_t v;
>>> +
>>> +    /*
>>> +     * All register accesses below must work without locality 0 being the
>>> +     * active locality. Therefore, ensure access is released.
>>> +     */
>>> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_ACCESS,
>>> +                       TPM_TIS_ACCESS_ACTIVE_LOCALITY);
>>> +    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
>>> +    g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
>>> +                                TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
>>> +
>>> +    /* read interrupt capability -- none are supported */
>>> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_CAPABILITY);
>>> +    g_assert_cmpint(v, ==, 0);
>>> +
>>> +    /* try to enable all interrupts */
>>> +    tpm_tis_i2c_writel(0, TPM_I2C_REG_INT_ENABLE, 0xffffffff);
>>> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_ENABLE);
>>> +    /* none could be enabled */
>>> +    g_assert_cmpint(v, ==, 0);
>>> +
>>> +    /* enable csum */
>>> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_DATA_CSUM_ENABLED);
>>> +    /* check csum enable register has bit 0 set */
>>> +    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
>>> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
>>> +    /* reading it as 32bit register returns same result */
>>> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
>>> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
>>> +
>>> +    /* disable csum */
>>> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, 0);
>>> +    /* check csum enable register has bit 0 clear */
>>> +    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
>>> +    g_assert_cmpint(v, ==, 0);
>>> +
>>> +    /* write to unsupported register '1' */
>>> +    tpm_tis_i2c_writel(0, 1, 0x12345678);
>>> +    v = tpm_tis_i2c_readl(0, 1);
>>> +    g_assert_cmpint(v, ==, 0xffffffff);
>>> +}
>>
>> I am seeing some errors :
> 
> 
> There's a small fix to apply to 3/3 of Ninad's patches. See my comment here:
> 
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2023-03/msg06464.html


That was it.

Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


