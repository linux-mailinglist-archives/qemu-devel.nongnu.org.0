Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAF4EEA53
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:23:17 +0200 (CEST)
Received: from localhost ([::1]:41358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDUy-00087Z-1n
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:23:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1naD7C-0004s7-VX; Fri, 01 Apr 2022 04:58:42 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1naD7A-0003qS-MT; Fri, 01 Apr 2022 04:58:42 -0400
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 7A2C12077F;
 Fri,  1 Apr 2022 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648803505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lYER0mKcsZl/nwlTOQjuBl3x+ykQtFUDbzwMzQFFPfM=;
 b=YYxoeTmPgWX7cdLkMHNwsSPJ46WL+Bx0wwsiZ2GzxF9xV+w1QeLf3lVjAKgHkNDnL14W90
 0vWTY753iXboweQOCm93u64xK9GYm+mGxtByvQk8p39x9kfKd6qRK/Ec152iT5qo7K1DA+
 1ToIV7JLDjkmzZEQjdCPdgSJuAe3YBo=
Message-ID: <f3c78b1a-bc5c-928c-8986-ad447470b78f@greensocs.com>
Date: Fri, 1 Apr 2022 10:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/4] hw/i2c: i2c slave mode support
Content-Language: en-US-large
To: Klaus Jensen <its@irrelevant.dk>, Corey Minyard <minyard@acm.org>
References: <20220331165737.1073520-1-its@irrelevant.dk>
 <20220331203205.GB29333@minyard.net> <Ykabr0wQe9VLISu2@apples>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <Ykabr0wQe9VLISu2@apples>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Arun Kumar Kashinath Agasar <arun.kka@samsung.com>,
 Corey Minyard <cminyard@mvista.com>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 Jeremy Kerr <jk@ozlabs.org>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Matt Johnston <matt@codeconstruct.com.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 4/1/22 08:29, Klaus Jensen wrote:
> On Mar 31 15:32, Corey Minyard wrote:
>> On Thu, Mar 31, 2022 at 06:57:33PM +0200, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Hi all,
>>>
>>> This RFC series adds I2C "slave mode" support for the Aspeed I2C
>>> controller as well as the necessary infrastructure in the i2c core to
>>> support this.
>>
>> I've been wondering when this would happen :).  I had put some thought
>> into how this would work, but hadn't come up with anything good.
>>
>> The big disadvantage of this is you are adding an interface that is
>> incompatible with the current masters and slaves.  So you are using the
>> same I2C bus, but slaves written this way cannot talk to existing
>> masters, and masters written this way cannot talk to existing slave.
>> You could adapt the masters to be able to work either way, and I suppose
>> some slaves that could do it could have both an async send and a normal
>> send.
> 
> Would it make sense to introduce a QOM Interface to differentiate
> between the slave/master types?
> 

Probably.

I expect a normal slave-only I2C device will be compatible with any 
master (having or having not this feature) in real life ?

It would be great if the compatibility between "a I2C slave requiring 
the slave-mode from the bus" and the bus could be checked during the 
device plug.

--
Damien

