Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673653B46B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:37:53 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwfOy-0002Om-Hd
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwfKL-0008VD-CU
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 03:33:05 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:48001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwfKI-0005Dr-Rf
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 03:33:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7A216106A4743;
 Thu,  2 Jun 2022 09:32:58 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 2 Jun 2022
 09:32:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R00521001f71-8192-4378-a80b-540b0dba8576,
 123C0E545D135716686AEE7B3F9DB382F3F098BA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fc01e3f2-1533-0ff7-6294-b3f7cf3cb351@kaod.org>
Date: Thu, 2 Jun 2022 09:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 4/6] hw/i2c: add asynchronous send
Content-Language: en-US
To: <cminyard@mvista.com>, Klaus Jensen <its@irrelevant.dk>
CC: <qemu-devel@nongnu.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 <qemu-arm@nongnu.org>, Peter Delevoryas <pdel@fb.com>, Peter Maydell
 <peter.maydell@linaro.org>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Damien Hedde <damien.hedde@greensocs.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Arun Kumar Kashinath Agasar
 <arun.kka@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-5-its@irrelevant.dk>
 <20220601220521.GS2554462@minyard.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220601220521.GS2554462@minyard.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f88d5af1-1c1a-4cfb-89f0-e2cdf3c6a38a
X-Ovh-Tracer-Id: 7469782933398522811
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrledugdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehkrdhjvghnshgvnhesshgrmhhsuhhnghdrtghomhdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/2/22 00:05, Corey Minyard wrote:
> On Wed, Jun 01, 2022 at 11:08:29PM +0200, Klaus Jensen wrote:
>> From: Klaus Jensen <k.jensen@samsung.com>
>>
>> Add an asynchronous version of i2c_send() that requires the slave to
>> explicitly acknowledge on the bus with i2c_ack().
>>
>> The current master must use the new i2c_start_send_async() to indicate
>> that it wants to do an asynchronous transfer. This allows the i2c core
>> to check if the target slave supports this or not. This approach relies
>> on adding a new enum i2c_event member, which is why a bunch of other
>> devices needs changes in their event handling switches.
> 
> This would be easier to read if you split out the default return of -1
> in all the devices to a separate patch.

yes and please drop ibm-cffps.c and ir35221.c which are not in mainline.
I will address them myself.

Thanks,

C.


> 
> You've already pointed out the lack of nack support.
> 
> I think this is ok outside of that.
> 
> -corey
> 
>>
>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>> ---
>>   hw/arm/pxa2xx.c            |  2 ++
>>   hw/display/sii9022.c       |  2 ++
>>   hw/display/ssd0303.c       |  2 ++
>>   hw/i2c/core.c              | 36 +++++++++++++++++++++++++++++++++++-
>>   hw/i2c/smbus_slave.c       |  4 ++++
>>   hw/i2c/trace-events        |  2 ++
>>   hw/misc/ibm-cffps.c        |  2 ++
>>   hw/misc/ir35221.c          |  2 ++
>>   hw/nvram/eeprom_at24c.c    |  2 ++
>>   hw/sensor/lsm303dlhc_mag.c |  2 ++
>>   include/hw/i2c/i2c.h       | 16 ++++++++++++++++
>>   11 files changed, 71 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
>> index f4f687df68ef..93dda83d7aa9 100644
>> --- a/hw/arm/pxa2xx.c
>> +++ b/hw/arm/pxa2xx.c
>> @@ -1305,6 +1305,8 @@ static int pxa2xx_i2c_event(I2CSlave *i2c, enum i2c_event event)
>>       case I2C_NACK:
>>           s->status |= 1 << 1;				/* set ACKNAK */
>>           break;
>> +    default:
>> +        return -1;
>>       }
>>       pxa2xx_i2c_update(s);
>>   
>> diff --git a/hw/display/sii9022.c b/hw/display/sii9022.c
>> index b591a5878901..664fd4046d82 100644
>> --- a/hw/display/sii9022.c
>> +++ b/hw/display/sii9022.c
>> @@ -76,6 +76,8 @@ static int sii9022_event(I2CSlave *i2c, enum i2c_event event)
>>           break;
>>       case I2C_NACK:
>>           break;
>> +    default:
>> +        return -1;
>>       }
>>   
>>       return 0;
>> diff --git a/hw/display/ssd0303.c b/hw/display/ssd0303.c
>> index aeae22da9c29..d67b0ad7b529 100644
>> --- a/hw/display/ssd0303.c
>> +++ b/hw/display/ssd0303.c
>> @@ -196,6 +196,8 @@ static int ssd0303_event(I2CSlave *i2c, enum i2c_event event)
>>       case I2C_NACK:
>>           /* Nothing to do.  */
>>           break;
>> +    default:
>> +        return -1;
>>       }
>>   
>>       return 0;
>> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
>> index 145dce60782a..d4ba8146bffb 100644
>> --- a/hw/i2c/core.c
>> +++ b/hw/i2c/core.c
>> @@ -161,7 +161,8 @@ static int i2c_do_start_transfer(I2CBus *bus, uint8_t address,
>>              start condition.  */
>>   
>>           if (sc->event) {
>> -            trace_i2c_event("start", s->address);
>> +            trace_i2c_event(event == I2C_START_SEND ? "start" : "start_async",
>> +                            s->address);
>>               rv = sc->event(s, event);
>>               if (rv && !bus->broadcast) {
>>                   if (bus_scanned) {
>> @@ -212,6 +213,11 @@ int i2c_start_send(I2CBus *bus, uint8_t address)
>>       return i2c_do_start_transfer(bus, address, I2C_START_SEND);
>>   }
>>   
>> +int i2c_start_send_async(I2CBus *bus, uint8_t address)
>> +{
>> +    return i2c_do_start_transfer(bus, address, I2C_START_SEND_ASYNC);
>> +}
>> +
>>   void i2c_end_transfer(I2CBus *bus)
>>   {
>>       I2CSlaveClass *sc;
>> @@ -261,6 +267,23 @@ int i2c_send(I2CBus *bus, uint8_t data)
>>       return ret ? -1 : 0;
>>   }
>>   
>> +int i2c_send_async(I2CBus *bus, uint8_t data)
>> +{
>> +    I2CNode *node = QLIST_FIRST(&bus->current_devs);
>> +    I2CSlave *slave = node->elt;
>> +    I2CSlaveClass *sc = I2C_SLAVE_GET_CLASS(slave);
>> +
>> +    if (!sc->send_async) {
>> +        return -1;
>> +    }
>> +
>> +    trace_i2c_send_async(slave->address, data);
>> +
>> +    sc->send_async(slave, data);
>> +
>> +    return 0;
>> +}
>> +
>>   uint8_t i2c_recv(I2CBus *bus)
>>   {
>>       uint8_t data = 0xff;
>> @@ -297,6 +320,17 @@ void i2c_nack(I2CBus *bus)
>>       }
>>   }
>>   
>> +void i2c_ack(I2CBus *bus)
>> +{
>> +    if (!bus->bh) {
>> +        return;
>> +    }
>> +
>> +    trace_i2c_ack();
>> +
>> +    qemu_bh_schedule(bus->bh);
>> +}
>> +
>>   static int i2c_slave_post_load(void *opaque, int version_id)
>>   {
>>       I2CSlave *dev = opaque;
>> diff --git a/hw/i2c/smbus_slave.c b/hw/i2c/smbus_slave.c
>> index 5d10e27664db..feb3ec633350 100644
>> --- a/hw/i2c/smbus_slave.c
>> +++ b/hw/i2c/smbus_slave.c
>> @@ -143,6 +143,10 @@ static int smbus_i2c_event(I2CSlave *s, enum i2c_event event)
>>               dev->mode = SMBUS_CONFUSED;
>>               break;
>>           }
>> +        break;
>> +
>> +    default:
>> +        return -1;
>>       }
>>   
>>       return 0;
>> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
>> index 209275ed2dc8..af181d43ee64 100644
>> --- a/hw/i2c/trace-events
>> +++ b/hw/i2c/trace-events
>> @@ -4,7 +4,9 @@
>>   
>>   i2c_event(const char *event, uint8_t address) "%s(addr:0x%02x)"
>>   i2c_send(uint8_t address, uint8_t data) "send(addr:0x%02x) data:0x%02x"
>> +i2c_send_async(uint8_t address, uint8_t data) "send_async(addr:0x%02x) data:0x%02x"
>>   i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
>> +i2c_ack(void) ""
>>   
>>   # aspeed_i2c.c
>>   
>> diff --git a/hw/misc/ibm-cffps.c b/hw/misc/ibm-cffps.c
>> index 042155bb7838..d69a727fd5f9 100644
>> --- a/hw/misc/ibm-cffps.c
>> +++ b/hw/misc/ibm-cffps.c
>> @@ -152,6 +152,8 @@ static int ibm_cffps_event(I2CSlave *i2c, enum i2c_event event)
>>       case I2C_FINISH:
>>            s->pointer = 0xFF;
>>           break;
>> +    default:
>> +        return -1;
>>       }
>>   
>>       s->len = 0;
>> diff --git a/hw/misc/ir35221.c b/hw/misc/ir35221.c
>> index 5e01d3655059..c46b9ee1c3bf 100644
>> --- a/hw/misc/ir35221.c
>> +++ b/hw/misc/ir35221.c
>> @@ -117,6 +117,8 @@ static int ir35221_event(I2CSlave *i2c, enum i2c_event event)
>>       case I2C_FINISH:
>>            s->pointer = 0xFF;
>>           break;
>> +    default:
>> +        return -1;
>>       }
>>   
>>       s->len = 0;
>> diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
>> index 01a3093600fa..d695f6ae894a 100644
>> --- a/hw/nvram/eeprom_at24c.c
>> +++ b/hw/nvram/eeprom_at24c.c
>> @@ -75,6 +75,8 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
>>           break;
>>       case I2C_NACK:
>>           break;
>> +    default:
>> +        return -1;
>>       }
>>       return 0;
>>   }
>> diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
>> index 4c98ddbf207c..bb8d48b2fdb0 100644
>> --- a/hw/sensor/lsm303dlhc_mag.c
>> +++ b/hw/sensor/lsm303dlhc_mag.c
>> @@ -427,6 +427,8 @@ static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
>>           break;
>>       case I2C_NACK:
>>           break;
>> +    default:
>> +        return -1;
>>       }
>>   
>>       s->len = 0;
>> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
>> index be8bb8b78a60..9b9581d23097 100644
>> --- a/include/hw/i2c/i2c.h
>> +++ b/include/hw/i2c/i2c.h
>> @@ -12,6 +12,7 @@
>>   enum i2c_event {
>>       I2C_START_RECV,
>>       I2C_START_SEND,
>> +    I2C_START_SEND_ASYNC,
>>       I2C_FINISH,
>>       I2C_NACK /* Masker NACKed a receive byte.  */
>>   };
>> @@ -28,6 +29,9 @@ struct I2CSlaveClass {
>>       /* Master to slave. Returns non-zero for a NAK, 0 for success. */
>>       int (*send)(I2CSlave *s, uint8_t data);
>>   
>> +    /* Master to slave (asynchronous). Receiving slave must call i2c_ack(). */
>> +    void (*send_async)(I2CSlave *s, uint8_t data);
>> +
>>       /*
>>        * Slave to master.  This cannot fail, the device should always
>>        * return something here.
>> @@ -127,11 +131,23 @@ int i2c_start_recv(I2CBus *bus, uint8_t address);
>>    */
>>   int i2c_start_send(I2CBus *bus, uint8_t address);
>>   
>> +/**
>> + * i2c_start_send_async: start an asynchronous 'send' transfer on an I2C bus.
>> + *
>> + * @bus: #I2CBus to be used
>> + * @address: address of the slave
>> + *
>> + * Return: 0 on success, -1 on error
>> + */
>> +int i2c_start_send_async(I2CBus *bus, uint8_t address);
>> +
>>   void i2c_end_transfer(I2CBus *bus);
>>   void i2c_nack(I2CBus *bus);
>> +void i2c_ack(I2CBus *bus);
>>   void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
>>   void i2c_bus_release(I2CBus *bus);
>>   int i2c_send(I2CBus *bus, uint8_t data);
>> +int i2c_send_async(I2CBus *bus, uint8_t data);
>>   uint8_t i2c_recv(I2CBus *bus);
>>   bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
>>                     I2CNodeList *current_devs);
>> -- 
>> 2.36.1
>>


