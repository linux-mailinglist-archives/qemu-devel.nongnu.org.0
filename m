Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D251348938
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:38:22 +0100 (CET)
Received: from localhost ([::1]:58930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJdN-0001Dw-Ms
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:38:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jie.deng@intel.com>)
 id 1lPJJ9-0003K0-AI
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:17:29 -0400
Received: from mga17.intel.com ([192.55.52.151]:31592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jie.deng@intel.com>)
 id 1lPJJ4-0006WG-VW
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:17:26 -0400
IronPort-SDR: w4TchgQ7RV5u6HAW1ilsd40RMp8XwfzENCEXpqjQuSMo8IvbZgDaBzT8MYtf4kxNkuEdO5j3Rb
 w6ahF8PW5wsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="170840379"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="170840379"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 23:17:16 -0700
IronPort-SDR: JrINvuk45KPSMsjb972oS73eYm/2W3+Am0UfBdC55dEqPU96TQVuSIvz6bG5Q66NeI9rB/ZuBf
 y9hz6RLoZbwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="374935393"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 23:17:14 -0700
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
To: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <f2f80985-b452-23e0-1892-2c8eaba4e691@intel.com>
Date: Thu, 25 Mar 2021 14:17:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=192.55.52.151; envelope-from=jie.deng@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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


On 2021/3/24 15:33, Viresh Kumar wrote:
> +static int vi2c_parse(VuI2c *i2c)
> +{
> +    uint16_t client_addr[MAX_I2C_VDEV];
> +    int32_t n_adapter = 0, n_client;
> +    int64_t addr, bus;
> +    const char *cp, *t;
> +
> +    while (device_list) {
> +        /* Read <bus>:<client_addr>[:<client_addr>] entries one by one */
> +        cp = strsep(&device_list, ",");
> +
> +        if (!cp || *cp =='\0') {
> +            break;
> +        }
> +
> +        if (n_adapter == MAX_I2C_ADAPTER) {
> +            g_printerr("too many adapter (%d), only support %d \n", n_adapter,
> +                       MAX_I2C_ADAPTER);
> +            goto out;
> +        }
> +
> +        if (qemu_strtol(cp, &t, 10, &bus) || bus < 0) {
> +            g_printerr("Invalid bus number %s\n", cp);
> +            goto out;
> +        }
> +
> +        cp = t;
> +        n_client = 0;
> +
> +        /* Parse clients <client_addr>[:<client_addr>] entries one by one */
> +        while (cp != NULL && *cp !='\0') {
> +            if (*cp == ':')
> +                cp++;
> +
> +            if (n_client == MAX_I2C_VDEV) {
> +                g_printerr("too many devices (%d), only support %d \n",
> +                           n_client, MAX_I2C_VDEV);
> +                goto out;
> +            }
> +
> +            if (qemu_strtol(cp, &t, 16, &addr) || addr < 0 || addr > MAX_I2C_VDEV) {
> +                g_printerr("Invalid address %s : %lx\n", cp, addr);
> +                goto out;
> +            }
> +
> +            client_addr[n_client++] = addr;
> +            cp = t;
> +            if (verbose) {
> +                g_print("i2c adapter %ld:0x%lx\n", bus, addr);
> +            }
> +        }
> +
> +        i2c->adapter[n_adapter] = vi2c_create_adapter(bus, client_addr, n_client);
> +        if (!i2c->adapter[n_adapter])
> +            goto out;
> +        n_adapter++;
> +    }
> +
> +    if (!n_adapter) {
> +        g_printerr("Failed to add any adapters\n");
> +        return -1;
> +    }
> +
> +    i2c->adapter_num = n_adapter;


i2c->adapter_num is set here, but used in vi2c_remove_adapters.
when you goto out from while {...}, i2c->adapter_num is always 0,
May be a bug ?


> +
> +    if (!vi2c_map_adapters(i2c)) {
> +        return 0;
> +    }
> +
> +out:
> +    vi2c_remove_adapters(i2c);
> +    return -1;
> +}
> +
>

