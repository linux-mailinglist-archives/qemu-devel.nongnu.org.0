Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A890352592
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 04:57:02 +0200 (CEST)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lS9zZ-00035x-2U
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 22:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jie.deng@intel.com>)
 id 1lS9yJ-00029C-Pl
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 22:55:45 -0400
Received: from mga14.intel.com ([192.55.52.115]:33669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jie.deng@intel.com>)
 id 1lS9y5-0002PX-5O
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 22:55:37 -0400
IronPort-SDR: TkGBzIhAU30QsNUJtvuEIypRN8epqzDZwD4YBkJq1KPVfXoTX1q3b4v+fUcQNAwLjYoU4EUiOp
 UNCUH2hqeRHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="191856375"
X-IronPort-AV: E=Sophos;i="5.81,298,1610438400"; d="scan'208";a="191856375"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 19:55:19 -0700
IronPort-SDR: 8ztB4sjTmBUJcnb8FGCLFe/Q5lxUhza/kciQcLxfLOtKuWbb1HsFaPw8/zzORh5JXkerjY2ebj
 UQL1mjaOnJ2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,298,1610438400"; d="scan'208";a="412985938"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by fmsmga008.fm.intel.com with ESMTP; 01 Apr 2021 19:55:17 -0700
Subject: Re: [PATCH V2 4/6] tools/vhost-user-i2c: Add backend driver
To: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org
References: <cover.1617278395.git.viresh.kumar@linaro.org>
 <e0adcd9552cee4de0ee844f6b3c87fb2b2f2357c.1617278395.git.viresh.kumar@linaro.org>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <dd1373df-0e25-fcca-fb7e-669e3fa72739@intel.com>
Date: Fri, 2 Apr 2021 10:55:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e0adcd9552cee4de0ee844f6b3c87fb2b2f2357c.1617278395.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.115; envelope-from=jie.deng@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Bill Mills <bill.mills@linaro.org>, Arnd Bergmann <arnd.bergmann@linaro.com>,
 Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/4/1 20:12, Viresh Kumar wrote:
> +
> +/* vhost-user-i2c definitions */
> +
> +#define MAX_I2C_VDEV                    (1 << 7)
> +#define MAX_I2C_ADAPTER                 16

Generally speaking, 16 is big enough for most cases. But comparing with 
static configuration,
I think it is better if we can check how many adapters in the host when 
doing initialization and
use that number as "MAX_I2C_ADAPTER".


> +
> +static VI2cAdapter *vi2c_create_adapter(int32_t bus, uint16_t client_addr[],
> +                                        int32_t n_client)
> +{
> +    VI2cAdapter *adapter;
> +    char path[20];
> +    uint64_t funcs;
> +    int32_t fd, i;
> +
> +    if (bus < 0) {
> +        return NULL;
> +    }
> +
> +    adapter = g_malloc0(sizeof(*adapter));
> +    if (!adapter) {
> +        g_printerr("failed to alloc adapter");
> +        return NULL;
> +    }
> +
> +    snprintf(path, sizeof(path), "/dev/i2c-%d", bus);
> +    path[sizeof(path) - 1] = '\0';
> +
> +    fd = open(path, O_RDWR);
> +    if (fd < 0) {
> +        g_printerr("virtio_i2c: failed to open %s\n", path);
> +        goto fail;
> +    }
> +
> +    adapter->fd = fd;
> +    adapter->bus = bus;
> +
> +    if (ioctl(fd, I2C_FUNCS, &funcs) < 0) {
> +        g_printerr("virtio_i2c: failed to get functionality %s: %d\n", path,
> +                   errno);
> +        goto close_fd;
> +    }
> +
> +    if (funcs & I2C_FUNC_I2C) {
> +        adapter->smbus = false;
> +    } else if (funcs & I2C_FUNC_SMBUS_WORD_DATA) {


Only I2C_FUNC_SMBUS_WORD_DATA is checked here. But in addition to it, 
the smbus_xfer
seems support I2C_FUNC_SMBUS_BYTE, I2C_FUNC_SMBUS_BYTE_DATA. So if an 
adapter only
support the latter two, it will never go to smbus_xfer.



> +        adapter->smbus = true;
> +    } else {
> +        g_printerr("virtio_i2c: invalid functionality %lx\n", funcs);
> +        goto close_fd;
> +    }
> +
>
>

