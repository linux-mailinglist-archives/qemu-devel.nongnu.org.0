Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412C414385
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 10:17:25 +0200 (CEST)
Received: from localhost ([::1]:57786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSxRT-0006WS-GY
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 04:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSxPG-0004yv-KP
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 04:15:06 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:46283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSxPC-0003IK-N3
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 04:15:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D07B721C4C;
 Wed, 22 Sep 2021 08:14:58 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 22 Sep
 2021 10:14:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002fd55f96e-84cc-4582-b3d8-b98ae82d67b3,
 2BB727CE71B327F05EAAC08E3CEBB2C417F62D6E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <05a1dcc3-c480-cebc-222a-3172b2bfd510@kaod.org>
Date: Wed, 22 Sep 2021 10:14:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: ensuring a machine's buses have unique names
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
 <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
 <87mtoe4g40.fsf@dusky.pond.sub.org>
 <CAFEAcA_ExFiv3AurBAtTan10yuXRnsHMQS0yHa-vJpwB9u4HoA@mail.gmail.com>
 <878rzprt3b.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <878rzprt3b.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4091fc54-58ff-4d7d-a08c-c2a92c1d8bb3
X-Ovh-Tracer-Id: 16573809581238946784
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeijedgtdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 09:02, Markus Armbruster wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Wed, 15 Sept 2021 at 05:28, Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> Peter Maydell <peter.maydell@linaro.org> writes:
>>>> I'm not sure how best to sort this tangle out. We could:
>>>>   * make controller devices pass in NULL as bus name; this
>>>>     means that some bus names will change, which is an annoying
>>>>     breakage but for these minor bus types we can probably
>>>>     get away with it. This brings these buses into line with
>>>>     how we've been handling uniqueness for ide and scsi.
>>>
>>> To gauge the breakage, we need a list of the affected bus names.
>>
>> Looking through, there are a few single-use or special
>> purpose buses I'm going to ignore for now (eg vmbus, or
>> the s390 ones). The four big bus types where controllers
>> often specify a bus name and override the 'autogenerate
>> unique name' handling are pci, ssi, sd, and i2c. (pci mostly
>> gets away with it I expect by machines only having one pci
>> bus.) Of those, I've gone through i2c. These are all the
>> places where we create a specifically-named i2c bus (via
>> i2c_init_bus()), together with the affected boards:
>>
>>     hw/arm/pxa2xx.c
>>      - the PXA SoC code creates both the intended-for-use
>>        i2c buses (which get auto-names) and also several i2c
>>        buses intended for internal board-code use only which
>>        are all given the same name "dummy".
>>        Boards: connex, verdex, tosa, mainstone, akita, spitz,
>>        borzoi, terrier, z2
>>     hw/arm/stellaris.c
>>      - The i2c controller names its bus "i2c". There is only one i2c
>>        controller on these boards, so no name conflicts.
>>        Boards: lm3s811evb, lm3s6965evb
>>     hw/display/ati.c
>>      - The ATI VGA device has an on-board i2c controller which it
>>        connects the DDC that holds the EDID information. The bus is
>>        always named "ati-vga.ddc", so if you have multiple of this
>>        PCI device in the system the buses have the same names.
>>     hw/display/sm501.c
>>      - Same as ATI, but the bus name is "sm501.i2c"
>>     hw/i2c/aspeed_i2c.c
>>      - This I2C controller has either 14 or 16 (!) different i2c
>>        buses, and it assigns them names "aspeed.i2c.N" for N = 0,1,2,...
>>        The board code mostly seems to use these to wire up various
>>        on-board i2c devices.
>>        Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
>>        swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
>>        tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc
>>     hw/i2c/bitbang_i2c.c
>>      - the "GPIO to I2C bridge" device always names its bus "i2c".
>>        Used only on musicpal, which only creates one of these buses.
>>        Boards: musicpal
>>     hw/i2c/exynos4210_i2c.c
>>      - This i2c controller always names its bus "i2c". There are 9
>>        of these controllers on the board, so they all have clashing
>>        names.
>>        Boards: nuri, smdkc210
>>     hw/i2c/i2c_mux_pca954x.c
>>      - This is an i2c multiplexer. All the child buses are named
>>        "i2c-bus". The multiplexer is used by the aspeed and npcm7xx
>>        boards. (There's a programmable way to get at individual
>>        downstream i2c buses despite the name clash; none of the boards
>>        using this multiplexer actually connect any devices downstream of
>>        it yet.)
>>        Boards: palmetto-bmc, supermicrox11-bmc, ast2500-evb, romulus-bmc,
>>        swift-bmc, sonorapass-bmc, witherspoon-bmc, ast2600-evb,
>>        tacoma-bmc, g220a-bmc, quanta-q71l-bmc, rainier-bmc,
>>        npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
>>     hw/i2c/mpc_i2c.c
>>      - This controller always names its bus "i2c". There is only one
>>        of these controllers in the machine.
>>        Boards: ppce500, mpc8544ds
>>     hw/i2c/npcm7xx_smbus.c
>>      - This controller always names its bus "i2c-bus". There are multiple
>>        controllers on the boards. The name also clashes with the one used
>>        by the pca954x muxes on these boards (see above).
>>        Boards: npcm750-evb, quanta-gsj, quanta-gbs-bmc, kudo-bmc
>>     hw/i2c/pm_smbus.c
>>      - This is the PC SMBUS implementation (it is not a QOM device...)
>>        The bus is always called "i2c".
>>        Boards: haven't worked through; at least all the x86 PC-like
>>        boards, I guess
>>     hw/i2c/ppc4xx_i2c.c
>>      - This controller always names its bus "i2c". The taihu and
>>        ref405ep have only one controller, but sam460ex has two which
>>        will have non-unique names.
>>        Boards: taihu, ref405ep, sam460ex
>>     hw/i2c/versatile_i2c.c
>>      - This controller always names its bus "i2c". The MPS boards all
>>        have multiples of this controller with clashing names; the others
>>        have only one controller.
>>        Boards: mps2-an385, mps2-an386, mps2-an500, mps2-an511,
>>        mps2-an505, mps2-an521, mps3-an524, mps3-an547,
>>        realview-eb, realview-eb-mpcore, realview-pb-a8, realview-pbx-a9,
>>        versatileab, versatilepb, vexpress-a9, vexpress-a15
>>
>> In a lot of these cases I suspect the i2c controllers are
>> provided either to allow connection of various internal-to-the-board
>> devices, or simply so that guest OS bootup code that initializes
>> the i2c controller doesn't fall over. However since there's
>> nothing stopping users from creating i2c devices themselves
>> on the commandline, some people might be doing that.
> 
> What are the devices they could add?  Anything they could *reasonably*
> want to add?  Breaking "unreasonable" uses could be defendable.

A reasonable dev scenario is to add extra I2C devices on the command
line to test a new DT and kernel.

C.

> 
> The only spot where we set ->bus_type = TYPE_I2C_BUS is
> i2c_slave_class_init().  Therefore, only the concrete subtypes of
> TYPE_I2C_SLAVE can go on an i2c bus, which makes sense.  These are:
> 
>      TYPE_ADM1272            "adm1272"
>      TYPE_AER915             "aer915"
>      TYPE_AT24C_EE           "at24c-eeprom"
>      TYPE_DS1338             "ds1338"
>                              "emc1413"
>                              "emc1414"
>      TYPE_I2CDDC             "i2c-ddc"
>      TYPE_LM8323             "lm8323"
>      TYPE_M41T80             "m41t80"
>      TYPE_MAX34451           "max34451"
>      TYPE_MAX7310            "max7310"
>      TYPE_PCA9546            "pca9546"
>      TYPE_PCA9548            "pca9548"
>      TYPE_PCA9552            "pca9552"
>      TYPE_PXA2XX_I2C_SLAVE   "pxa2xx-i2c-slave"
>      TYPE_SII9022            "sii9022"
>      TYPE_SMBUS_DEVICE       "smbus-device"
>      TYPE_SMBUS_EEPROM       "smbus-eeprom"
>      TYPE_SMBUS_IPMI         "smbus-ipmi"
>      TYPE_SSD0303            "ssd0303"
>      TYPE_TMP105             "tmp105"
>                              "tmp421"
>                              "tmp422"
>                              "tmp423"
>      TYPE_TOSA_DAC           "tosa_dac"
>      TYPE_TWL92230           "twl92230"
>      TYPE_WM8750             "wm8750"
> 
> Grep hits in:
> 
>      hw/arm/aspeed.c
>      hw/arm/musicpal.c
>      hw/arm/npcm7xx_boards.c
>      hw/arm/nseries.c
>      hw/arm/pxa2xx.c
>      hw/arm/realview.c
>      hw/arm/spitz.c
>      hw/arm/stellaris.c
>      hw/arm/tosa.c
>      hw/arm/versatilepb.c
>      hw/arm/vexpress.c
>      hw/arm/z2.c
>      hw/audio/marvell_88w8618.c
>      hw/audio/wm8750.c
>      hw/display/ati.c
>      hw/display/i2c-ddc.c
>      hw/display/sii9022.c
>      hw/display/sm501.c
>      hw/display/ssd0303.c
>      hw/display/xlnx_dp.c
>      hw/gpio/max7310.c
>      hw/i2c/i2c_mux_pca954x.c
>      hw/i2c/pmbus_device.c
>      hw/i2c/smbus_eeprom.c
>      hw/i2c/smbus_slave.c
>      hw/input/lm832x.c
>      hw/ipmi/smbus_ipmi.c
>      hw/misc/pca9552.c
>      hw/nvram/eeprom_at24c.c
>      hw/ppc/e500.c
>      hw/ppc/sam460ex.c
>      hw/rtc/ds1338.c
>      hw/rtc/m41t80.c
>      hw/rtc/twl92230.c
>      hw/sensor/adm1272.c
>      hw/sensor/emc141x.c
>      hw/sensor/max34451.c
>      hw/sensor/tmp105.c
>      hw/sensor/tmp421.c
>      include/hw/audio/wm8750.h
>      include/hw/display/i2c-ddc.h
>      include/hw/i2c/i2c_mux_pca954x.h
>      include/hw/i2c/smbus_slave.h
>      include/hw/input/lm832x.h
>      include/hw/misc/pca9552.h
>      include/hw/sensor/tmp105.h
>      tests/qtest/adm1272-test.c
>      tests/qtest/ds1338-test.c
>      tests/qtest/emc141x-test.c
>      tests/qtest/max34451-test.c
>      tests/qtest/pca9552-test.c
>      tests/qtest/tmp105-test.c
> 
>>
>> In some of these cases (eg the i2c bus on the ATI VGA driver)
>> I suspect the desired behaviour is "unique bus name based on
>> a standard template, eg 'ati-vga.ddc.0/1/...'. It sounds like
>> we can't do that, though.
> 
> We could add yet another case to qbus_init(): if name is non-null, and
> bus->parent has a flag set, we use
> 
>      "%s.%d", name, bus->parent->num_child_bus.
> 
> "Could" doesn not imply "should".
> 
>>                            (Also they probably don't want to
>> permit users to command-line plug i2c devices into it...)
> 
> Then they should massage the bus so it doesn't accept additional
> devices.  Didn't you post a patch related to this recently?
> 
> 


