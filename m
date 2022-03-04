Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43724CDDB5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:05:48 +0100 (CET)
Received: from localhost ([::1]:45362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEBP-0006ct-UQ
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:05:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1nQDuH-0008Hw-VY; Fri, 04 Mar 2022 14:48:06 -0500
Received: from ssl.serverraum.org ([176.9.125.105]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1nQDuF-0005v1-Cr; Fri, 04 Mar 2022 14:48:04 -0500
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5571A22175;
 Fri,  4 Mar 2022 20:47:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1646423279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fJUd/HtX9HoEJ+sZKQW3Av+u/TAh+6J9tjYoDk5n9vI=;
 b=PVDSdnQzOkORcQRDbSIqOuY4FO2NnTrUdZxSsG8HcnVCxote4DxOjqS9UdWKHrqPtpwEEh
 MhEliB/1njUZHir0L23/d1luLep4SGZUolz1so9uSsbHZikTTetJoe4+m3K6eWVfVAff5/
 qZjmaPIzZRl10gYVKMCKgeiynxLix5A=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Fri, 04 Mar 2022 20:47:58 +0100
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH] hw/block: m25p80: Add support for w25q01jvq
In-Reply-To: <9b9b0251-2698-61b9-b4b1-5e5e54fea5a1@gmail.com>
References: <20220304180920.1780992-1-patrick@stwcx.xyz>
 <9b9b0251-2698-61b9-b4b1-5e5e54fea5a1@gmail.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <7827c791b7f91f4eb216b33473dd6103@walle.cc>
X-Sender: michael@walle.cc
Received-SPF: pass client-ip=176.9.125.105; envelope-from=michael@walle.cc;
 helo=ssl.serverraum.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Potin Lai <potin.lai@quantatw.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 2022-03-04 20:30, schrieb Philippe Mathieu-Daudé:
> On 4/3/22 19:09, Patrick Williams wrote:
>> The w25q01jvq is a 128MB part.  Support is being added to the 
>> kernel[1]
>> and the two have been tested together.
>> 
>> 1. 
>> https://lore.kernel.org/lkml/20220222092222.23108-1-potin.lai@quantatw.com/
>> 
>> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
>> Cc: Potin Lai <potin.lai@quantatw.com>
>> ---
>>   hw/block/m25p80.c | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index c6bf3c6bfa..7d3d8b12e0 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -340,6 +340,7 @@ static const FlashPartInfo known_devices[] = {
>>       { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) 
>> },
>>       { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) 
>> },
>>       { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) 
>> },
>> +    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) 
>> },
>>   };
>>     typedef enum {
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

FWIW, the linux spi nor subsystem will rely more and more on the SFDP
for newer flashes. I had a quick look at qemu's source and command
RDSFDP (0x5a) isn't emulated. Might be worth implementing ;)

-michael

