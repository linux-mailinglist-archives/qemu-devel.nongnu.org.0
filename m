Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8584665B45B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 16:45:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCMym-0000Gp-Dc; Mon, 02 Jan 2023 10:44:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1pCMyj-0000GE-IT; Mon, 02 Jan 2023 10:43:58 -0500
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1pCMyh-0002WZ-KT; Mon, 02 Jan 2023 10:43:57 -0500
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 4F285B8B;
 Mon,  2 Jan 2023 16:43:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1672674229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/RyaLo26HWtDAR6Lhlt3kMPepSJ1u3Gy2Fn8V7yFzGQ=;
 b=eqxRnBo3sA7sgPYJd2SoALrw9r7Cn7nGacL3NCLGbIM5W7lnn28jtrDa3AWf05QNj0SSs8
 /cpH82zBD5EEHfkH+PQaQwHnejnMn4L1O3x59AxkUwbvjtbSq/5Ur6rV26CJ8Xu7y8a45a
 zfF3tkhe4RT6/tREuKWJzgjCypINCXY1v8DjSQsnuSJbtN1dWTz3ORiWn6Y/m7n1P5YCwd
 hOcVc+vKH/mr66U4si6h+NERKqjyqkCBe68r1W+2JtSFl3YeVMYDjTLYQ5SRioqnQzAxIa
 hoLu0jiwf6cPi/cPYspn2/by0rqIT60Y1aOArZE2iXOjsOwrD7ymV0pUcn2K1A==
MIME-Version: 1.0
Date: Mon, 02 Jan 2023 16:43:49 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Ben Dooks <ben@fluff.org>,
 Guenter Roeck <linux@roeck-us.net>, Alistair Francis
 <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] m25p80: Add the is25wp256 SFPD table
In-Reply-To: <c1f5c868-0006-bb28-af88-eddc5543068e@kaod.org>
References: <20221221122213.1458540-1-linux@roeck-us.net>
 <2236d0ee-4fc6-5e2c-95b4-f97639e0955b@kaod.org>
 <20221225121850.4bjnskmlhsot54cf@hetzy.fluff.org>
 <b00bb842-a9e6-fa5c-94d9-876c241be600@linaro.org>
 <c1f5c868-0006-bb28-af88-eddc5543068e@kaod.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <3044e0c174268312d0323d8f9ad43c68@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:c0c:9d57::1;
 envelope-from=michael@walle.cc; helo=mail.3ffe.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Am 2023-01-02 14:53, schrieb Cédric Le Goater:
> On 12/27/22 07:31, Tudor Ambarus wrote:
>> 
>> 
>> On 25.12.2022 14:18, Ben Dooks wrote:
>>> On Wed, Dec 21, 2022 at 06:36:02PM +0100, Cédric Le Goater wrote:
>>>> On 12/21/22 13:22, Guenter Roeck wrote:
>>>>> Generated from hardware using the following command and then 
>>>>> padding
>>>>> with 0xff to fill out a power-of-2:
>>>>>     xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
>>>>> 
>>>>> Cc: Michael Walle <michael@walle.cc>
>>>>> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>> 
>>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> 
>>> If SFDP is a standard, couldn't we have an function to generate it 
>>> from
>>> the flash parameters?
>>> 
>> 
>> No, it's not practical as you have to specify all the flash parameters
>> at flash declaration.
> 
> Indeed and the definition of flash models in QEMU is far to cover all 
> the SFDP
> features. The known_devices array of m25p80 would be huge ! However, we 
> could
> generate some of the SFDP tables if no raw data is provided. It could 
> be useful
> for testing drivers.

I don't think adding (incomplete) SFDP tables makes sense for any real
devices. E.g. sometimes our linux driver will look at specific bits in
SFDP to figure out what particular flash device is attached. For example
when there are different flashes with the same jedec id.

But since the last released kernel, we support a generic SFDP driver, 
which
is used when there is no matching driver for the flash's jedec id.
Theoretically, you can build your own flash device (with a unique id) 
and
generate the sfdp tables for that one.

-michael

