Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567C51DA2F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:11:22 +0200 (CEST)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmyfx-0007mS-Ga
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nmycW-0004MR-Eb; Fri, 06 May 2022 10:07:48 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nmycS-0000TE-9E; Fri, 06 May 2022 10:07:48 -0400
Received: from fraeml744-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Kvsl36dWtz682DK;
 Fri,  6 May 2022 22:04:47 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml744-chm.china.huawei.com (10.206.15.225) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 6 May 2022 16:07:33 +0200
Received: from localhost (10.202.226.42) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 6 May
 2022 15:07:32 +0100
Date: Fri, 6 May 2022 15:07:31 +0100
To: Klaus Jensen <its@irrelevant.dk>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>
CC: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, "Arun
 Kumar Kashinath Agasar" <arun.kka@samsung.com>, Corey Minyard
 <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>, Klaus Jensen
 <k.jensen@samsung.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>, Matt Johnston
 <matt@codeconstruct.com.au>, Jeremy Kerr <jk@ozlabs.org>
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Message-ID: <20220506150731.00000693@Huawei.com>
In-Reply-To: <20220331165737.1073520-1-its@irrelevant.dk>
References: <20220331165737.1073520-1-its@irrelevant.dk>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhreml748-chm.china.huawei.com (10.201.108.198) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Thu, 31 Mar 2022 18:57:33 +0200
Klaus Jensen <its@irrelevant.dk> wrote:

> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi all,
> 
> This RFC series adds I2C "slave mode" support for the Aspeed I2C
> controller as well as the necessary infrastructure in the i2c core to
> support this.
> 
> Background
> ~~~~~~~~~~
> We are working on an emulated NVM Express Management Interface[1] for
> testing and validation purposes. NVMe-MI is based on the MCTP
> protocol[2] which may use a variety of underlying transports. The one we
> are interested in is I2C[3].
> 
> The first general trickery here is that all MCTP transactions are based
> on the SMBus Block Write bus protocol[4]. This means that the slave must
> be able to master the bus to communicate. As you know, hw/i2c/core.c
> currently does not support this use case.
> 
> The second issue is how to interact with these mastering devices. Jeremy
> and Matt (CC'ed) have been working on an MCTP stack for the Linux Kernel
> (already upstream) and an I2C binding driver[5] is currently under
> review. This binding driver relies on I2C slave mode support in the I2C
> controller.

Hi Klaus,

Just thought I'd mention I'm also interested in MCTP over I2C emulation
for a couple of projects:

1) DMTF SPDM - mostly as a second transport for the kernel stack alongside
   PCI DOE.
2) CXL FM-API - adding support for the Fabric Manager interfaces
   on emulated CXL switches which is also typically carried over
   MCTP.

I was thinking of emulating a MCTP over PCI VDM but this has saved me
going to the effort of doing that for now at least :)

I have hacked a really really basic MCTP device together using this
series and it all seems to be working with the kernel stack (subject to a
few kernel driver bugs that I'll report / send fixes for next week).
I'm cheating all over the place so far, (lots of hard coded values) but
would be interested in a more flexible solution that might perhaps
share infrastructure with your NVMe-MI work.

Thanks,

Jonathan


> 
> This series
> ~~~~~~~~~~~
> Patch 1 adds support for multiple masters in the i2c core, allowing
> slaves to master the bus and safely issue i2c_send/recv(). Patch 2 adds
> an asynchronous send i2c_send_async(I2CBus *, uint8) on the bus that
> must be paired with an explicit ack using i2c_ack(I2CBus *).
> 
> Patch 3 adds the slave mode functionality to the emulated Aspeed I2C
> controller. The implementation is probably buggy since I had to rely on
> the implementation of the kernel driver to reverse engineer the behavior
> of the controller slave mode (I do not have access to a spec sheet for
> the Aspeed, but maybe someone can help me out with that?).
> 
> Finally, patch 4 adds an example device using this new API. The device
> is a simple "echo" device that upon being sent a set of bytes uses the
> first byte as the address of the slave to echo to.
> 
> With this combined I am able to boot up Linux on an emulated Aspeed 2600
> evaluation board and have the i2c echo device write into a Linux slave
> EEPROM. Assuming the echo device is on address 0x42:
> 
>   # echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device
>   i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64
>   # i2cset -y 15 0x42 0x64 0x00 0xaa i
>   # hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom
>   0000000 ffaa ffff ffff ffff ffff ffff ffff ffff
>   0000010 ffff ffff ffff ffff ffff ffff ffff ffff
>   *
>   0000100
> 
>   [1]: https://nvmexpress.org/developers/nvme-mi-specification/
>   [2]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0236_1.3.1.pdf
>   [3]: https://www.dmtf.org/sites/default/files/standards/documents/DSP0237_1.2.0.pdf
>   [4]: http://www.smbus.org/specs/SMBus_3_1_20180319.pdf
>   [5]: https://lore.kernel.org/linux-i2c/20220218055106.1944485-1-matt@codeconstruct.com.au/
> 
> Klaus Jensen (4):
>   hw/i2c: support multiple masters
>   hw/i2c: add async send
>   hw/i2c: add slave mode for aspeed_i2c
>   hw/misc: add a toy i2c echo device
> 
>  hw/i2c/aspeed_i2c.c         |  95 +++++++++++++++++++++---
>  hw/i2c/core.c               |  57 +++++++++++++-
>  hw/i2c/trace-events         |   2 +-
>  hw/misc/i2c-echo.c          | 144 ++++++++++++++++++++++++++++++++++++
>  hw/misc/meson.build         |   2 +
>  include/hw/i2c/aspeed_i2c.h |   8 ++
>  include/hw/i2c/i2c.h        |  19 +++++
>  7 files changed, 316 insertions(+), 11 deletions(-)
>  create mode 100644 hw/misc/i2c-echo.c
> 


