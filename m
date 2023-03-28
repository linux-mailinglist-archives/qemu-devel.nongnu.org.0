Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B236CBA57
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 11:19:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph5SZ-0007sm-56; Tue, 28 Mar 2023 05:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph5SX-0007r6-HO
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:17:41 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ph5SU-0004SA-LR
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:17:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.22])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D71CC1FF92;
 Tue, 28 Mar 2023 09:17:26 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 28 Mar
 2023 11:17:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0019f0523cc-d600-443b-b865-53c5b68eb0c6,
 5D21C2AA46E1B9891D174392918792ED1A5C90BB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <50f67d0d-18f8-dead-9716-cd94b24915a6@kaod.org>
Date: Tue, 28 Mar 2023 11:17:25 +0200
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230327202416.3617162-4-stefanb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7f545809-97b0-41d9-b41f-af5cccfbab79
X-Ovh-Tracer-Id: 12728861398134721318
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedguddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeuuddtteelgeejhfeikeegffekhfelvefgfeejveffjeeiveegfeehgfdtgfeitdenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehsthgvfhgrnhgssehlihhnuhigrdhisghmrdgtohhmpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhmrghrtggrnhgurhgvrdhluhhrvggruhesrhgvughhrghtrdgtohhmpdhnihhnrggusehlihhnuhigrdhisghmrdgtohhmpdhjohgvlhesjhhmshdrihgurdgruhdprghnughrvgifsegrjhdrihgurdgruhdpoffvtefjohhsthepmhhoheegkedpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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

> +static void tpm_tis_i2c_test_basic(const void *data)
> +{
> +    uint8_t access;
> +    uint32_t v;
> +
> +    /*
> +     * All register accesses below must work without locality 0 being the
> +     * active locality. Therefore, ensure access is released.
> +     */
> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_ACCESS,
> +                       TPM_TIS_ACCESS_ACTIVE_LOCALITY);
> +    access = tpm_tis_i2c_readb(0, TPM_I2C_REG_ACCESS);
> +    g_assert_cmpint(access, ==, TPM_TIS_ACCESS_TPM_REG_VALID_STS |
> +                                TPM_TIS_ACCESS_TPM_ESTABLISHMENT);
> +
> +    /* read interrupt capability -- none are supported */
> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_CAPABILITY);
> +    g_assert_cmpint(v, ==, 0);
> +
> +    /* try to enable all interrupts */
> +    tpm_tis_i2c_writel(0, TPM_I2C_REG_INT_ENABLE, 0xffffffff);
> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_INT_ENABLE);
> +    /* none could be enabled */
> +    g_assert_cmpint(v, ==, 0);
> +
> +    /* enable csum */
> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, TPM_DATA_CSUM_ENABLED);
> +    /* check csum enable register has bit 0 set */
> +    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
> +    /* reading it as 32bit register returns same result */
> +    v = tpm_tis_i2c_readl(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
> +    g_assert_cmpint(v, ==, TPM_DATA_CSUM_ENABLED);
> +
> +    /* disable csum */
> +    tpm_tis_i2c_writeb(0, TPM_I2C_REG_DATA_CSUM_ENABLE, 0);
> +    /* check csum enable register has bit 0 clear */
> +    v = tpm_tis_i2c_readb(0, TPM_I2C_REG_DATA_CSUM_ENABLE);
> +    g_assert_cmpint(v, ==, 0);
> +
> +    /* write to unsupported register '1' */
> +    tpm_tis_i2c_writel(0, 1, 0x12345678);
> +    v = tpm_tis_i2c_readl(0, 1);
> +    g_assert_cmpint(v, ==, 0xffffffff);
> +}

I am seeing some errors :

$ QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm  tests/qtest/tpm-tis-i2c-test
# random seed: R02S68cdeb5a9a7b97eed594a7792b6aa7ff
# starting QEMU: exec arm-softmmu/qemu-system-arm -qtest unix:/tmp/qtest-1981218.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1981218.qmp,id=char0 -mon chardev=char0,mode=control -display none -machine rainier-bmc -accel tcg -chardev socket,id=chr,path=/tmp/qemu-tpm-tis-i2c-test.DFGN21/sock -tpmdev emulator,id=tpm0,chardev=chr -device tpm-tis-i2c,tpmdev=tpm0,bus=aspeed.i2c.bus.10,address=0x2e -accel qtest
# GLib-DEBUG: setenv()/putenv() are not thread-safe and should not be used after threads are created
qemu-system-arm: warning: Aspeed iBT has no chardev backend
1..6
# Start of arm tests
# Start of tpm-tis-i2c tests
**
ERROR:../tests/qtest/tpm-tis-i2c-test.c:130:tpm_tis_i2c_test_basic: assertion failed (v == 0): (1 == 0)
Bail out! ERROR:../tests/qtest/tpm-tis-i2c-test.c:130:tpm_tis_i2c_test_basic: assertion failed (v == 0): (1 == 0)
Unexpected error in qio_channel_socket_writev() at ../io/channel-socket.c:621:
qemu-system-arm: tests/qtest/tpm-tis-i2c-test:tpm-emulator: Could not cleanly shutdown the TPM: Interrupted system call
Unable to write to socket: Bad file descriptor
Aborted (core dumped)


