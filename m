Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBF834883D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 06:11:14 +0100 (CET)
Received: from localhost ([::1]:35470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPIH2-0006yi-VD
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 01:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jie.deng@intel.com>)
 id 1lPIFf-00067e-AP
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:09:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:50058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jie.deng@intel.com>)
 id 1lPIFc-0002Sx-T8
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 01:09:46 -0400
IronPort-SDR: 9gbW/26zcDJmjZWb8/GnMYC8KFm/ZBjcWA5Jfwb4nVOBtnbWL4FOuDgPr4cHBx6l4SD1SBKNT9
 L9RtPgcW6syg==
X-IronPort-AV: E=McAfee;i="6000,8403,9933"; a="252207589"
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="252207589"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 22:09:36 -0700
IronPort-SDR: RJjDuwFLj7h/56yl0w52w+qnJ6tBtzKfblcYN9BV6cOsCvubVUSQmZAG4vjgdk0PjbGI/+Q87t
 LYZFlxksIxcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,276,1610438400"; d="scan'208";a="374917420"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by orsmga003.jf.intel.com with ESMTP; 24 Mar 2021 22:09:34 -0700
Subject: Re: [PATCH 3/5] tools/vhost-user-i2c: Add backend driver
To: Viresh Kumar <viresh.kumar@linaro.org>, qemu-devel@nongnu.org
References: <cover.1616570702.git.viresh.kumar@linaro.org>
 <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <290a8771-7273-a898-a826-c97df6eefb1b@intel.com>
Date: Thu, 25 Mar 2021 13:09:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c269da55e0b3ff984bf538e3001efc4732c6dea7.1616570702.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=134.134.136.31; envelope-from=jie.deng@intel.com;
 helo=mga06.intel.com
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
> +
> +/* Definitions from virtio-i2c specifications */
> +#define VHOST_USER_I2C_MAX_QUEUES       1
> +
> +/* Status */
> +#define VIRTIO_I2C_MSG_OK               0
> +#define VIRTIO_I2C_MSG_ERR              1
> +
> +/* The bit 0 of the @virtio_i2c_out_hdr.@flags, used to group the requests */
> +#define VIRTIO_I2C_FLAGS_FAIL_NEXT      0x00000001
> +
> +/**
> + * struct virtio_i2c_out_hdr - the virtio I2C message OUT header
> + * @addr: the controlled device's address
> + * @padding: used to pad to full dword
> + * @flags: used for feature extensibility
> + */
> +struct virtio_i2c_out_hdr {
> +    uint16_t addr;
> +    uint16_t padding;
> +    uint32_t flags;
> +} __attribute__((packed));


__le16,  __le32 ?


> +
> +/**
> + * struct virtio_i2c_in_hdr - the virtio I2C message IN header
> + * @status: the processing result from the backend
> + */
> +struct virtio_i2c_in_hdr {
> +    uint8_t status;
> +} __attribute__((packed));
> +


I understand these definitions can be removed once the frontend driver 
is merged by the Linux ?


> +/* vhost-user-i2c definitions */
> +
> +#ifndef container_of
> +#define container_of(ptr, type, member) ({                      \
> +        const typeof(((type *) 0)->member) *__mptr = (ptr);     \
> +        (type *) ((char *) __mptr - offsetof(type, member));})
> +#endif


This seems to be a general interface.  I see there is a definition in 
qemu/compiler.h.

Can we reuse it ?



