Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C66332C91
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:51:49 +0100 (CET)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJfaG-0007Wq-B2
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:51:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lJel8-000376-A7; Tue, 09 Mar 2021 10:58:58 -0500
Received: from mailex.trusted-objects.com ([149.202.244.204]:34559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lJel6-0003Pt-Hm; Tue, 09 Mar 2021 10:58:58 -0500
Received: from [192.170.0.219] (88.127.245.42) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2176.2; Tue, 9 Mar
 2021 16:58:41 +0100
Subject: Re: Malfunctionning qemu-system-arm ?
To: Liviu Ionescu <ilg@livius.net>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
 <FBA649E1-4EFB-4409-894E-C1A5AB086BF1@livius.net>
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Message-ID: <943374ff-fc7f-b0bc-0b53-0e7487cdf810@trusted-objects.com>
Date: Tue, 9 Mar 2021 16:58:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <FBA649E1-4EFB-4409-894E-C1A5AB086BF1@livius.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
Received-SPF: none client-ip=149.202.244.204;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Liviu,

Thanks for the responses, I'll have a check on this.

The issue not testing with the HAL is that as most people use it, qemu 
on these platforms is a bit useless for emulation.

On the other hand, it would be more on ST to invest on making those 
emulations running ...

Best regards,

Vincent.

Le 09/03/2021 à 15:37, Liviu Ionescu a écrit :
>
>> On 15 Feb 2021, at 17:09, vincent Dupaquis <v.dupaquis@trusted-objects.com> wrote:
>>
>> ... stuck on the starting HAL_init() call.
> HAL requires, amongst other things, the clock registers, since it sets the PLLs for the desired frequencies.
>
> xPack QEMU Arm [1] implements these registers, and is able to properly run the HAL init code.
>
>
> Regards,
>
> Liviu
>
> [1] - https://xpack.github.io/qemu-arm/
>
-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert Gautier de la 
Lauzière 13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>

