Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 009CC577925
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 03:10:11 +0200 (CEST)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDFH0-0003fZ-5u
	for lists+qemu-devel@lfdr.de; Sun, 17 Jul 2022 21:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1oDFFB-0002GV-R7
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 21:08:18 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:48983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>) id 1oDFFA-0002fK-1i
 for qemu-devel@nongnu.org; Sun, 17 Jul 2022 21:08:17 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5CA5A32005BC;
 Sun, 17 Jul 2022 21:08:12 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Sun, 17 Jul 2022 21:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1658106491; x=1658192891; bh=muJS0vXEFw
 PCrXV0Gf10t3jpio8xNR8lwAaa7lvPYXM=; b=Ms3NTVoX1YwoLY17aMbrRGfhlA
 Jxy2VnJQKcwC/dAOn5r3QGuNy/aeAPc3nB5I6oZv7RKEhVUjMy0pzrSPJqToE0l4
 C5FRjEihqNsUaxIQzd5sRb5TLGZ+DNfJtLDFh+NcaiHisj14IDVrnU86sA5/rIT5
 Hbvc88c8USzl9CGie7Z+Cju8aD3DAo4qhpPjtkaN3SOrVfa5I+uBPPPel2m91LHU
 kxIpTj/7LoNawQ/s02Z167GzNIvL6aXd/OQq2gyOo3Yo2GaChXMI3IPgJtcJms+L
 tcVVu3wLZmxY6HgOm4PAkOL45gT0t19cbn4lbdBHc8AdponUYt6750voa/NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1658106491; x=1658192891; bh=muJS0vXEFwPCrXV0Gf10t3jpio8x
 NR8lwAaa7lvPYXM=; b=R/H4pjV6gKWxWBGDfPR6ovuopnSiT1fIcXqxJ7vj3CWZ
 7zRV8W0DO2Tc6X7Ax3p4ifAYWCXFVeHJzq4p4gwV6+utgEfG1YdHFSclpTvuNcN1
 f+fyWs5QkklLLZ5OwRtoZGbTVW3VaCg7YSXBJO1ny8cPcvCRlwQPRERcLaUh+f/k
 o2j9rdXC+B7hMDSXW94LTR64mX/EqwWmZehBt2ynNCva1aSiGyUKykXgS4JppeID
 C6V5NiPVD5GUUzmPzSy1lWrZRVq/LfQHQQRjPXbrlqUJkHmVxRxJUXRO0t6lUls/
 MUZCvD7T3rTthUHfNh2Nm7XEREq9gaCbP7YtQt8ebw==
X-ME-Sender: <xms:e7LUYqgPkBJ6BEAZEh0YoVkJo5dXZJn8pnOxn2DhekegKYGQe5V_dQ>
 <xme:e7LUYrC2PbwMCYhhJ-mjhTJkM_tsE7gV71kyco0StOXTztvuCivixNPjOb7Vemu1M
 U-DDk3-g6GYD-Dc2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekjedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
 feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:e7LUYiFBCZrZ5Z_cIdaUDB4Gv0ozBU_JVUklc_zVL9IGxdO3Sd8jmg>
 <xmx:e7LUYjTNw9OnibhG_DIjFkP7PJLRw_BokBVltnxUYtNwATid7x8HaQ>
 <xmx:e7LUYnzb7pQt1jxyhA5yxEvX-ZhKPbBUhJ9KRBux4vQlx1XX3bwZdw>
 <xmx:e7LUYosPoL_8y0NeE0UcQTXwAlE0KbIYQx_B9hcMCh5urNmkB5zU1g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8C071170007E; Sun, 17 Jul 2022 21:08:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <fb2f74b4-67c9-4b0a-89a8-0704e7d446bb@www.fastmail.com>
In-Reply-To: <YszVIJrPXFmMMZ/A@pdel-mbp.dhcp.thefacebook.com>
References: <20220707071731.34047-1-peter@pjd.dev>
 <20220707071731.34047-2-peter@pjd.dev>
 <fa52743a-5730-3b3f-f07f-99931bb66b01@kaod.org> <YscdtXYL5sJRSm6Z@pdel-mbp>
 <YscuKtVuZojYtqXo@pdel-mbp.dhcp.thefacebook.com>
 <23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com>
 <YszVIJrPXFmMMZ/A@pdel-mbp.dhcp.thefacebook.com>
Date: Mon, 18 Jul 2022 10:37:50 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Peter Delevoryas" <peter@pjd.dev>
Cc: "Cameron Esfahani via" <qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Content-Type: text/plain
Received-SPF: pass client-ip=64.147.123.21; envelope-from=andrew@aj.id.au;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

I think we've sorted this out, but replying to finalise the conversation

On Tue, 12 Jul 2022, at 11:27, Peter Delevoryas wrote:
> On Mon, Jul 11, 2022 at 10:56:08PM +0930, Andrew Jeffery wrote:
>>  
>>  /*
>> @@ -607,7 +608,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>>          data &= props->output;
>>          data = update_value_control_source(set, set->data_value, data);
>>          set->data_read = data;
>> -        aspeed_gpio_update(s, set, data);
>> +        aspeed_gpio_update(s, set, data, set->direction);
>>          return;
>>      case gpio_reg_direction:
>>          /*
>> @@ -683,7 +684,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>>                        HWADDR_PRIx"\n", __func__, offset);
>>          return;
>>      }
>> -    aspeed_gpio_update(s, set, set->data_value);
>> +    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
>
> Looks great overall, but why is the mode_mask UINT32_MAX here? Shouldn't it be
> set->direction? We only want to let the guest OS write to output pins, right?
> Or is that not how the register works?

The set->direction case is handled in the top hunk which handles the 
data register write. Note that it performs an early return.

The bottom hunk deals with making the value register consistent when 
we've updated any register that isn't the data register.

Andrew

