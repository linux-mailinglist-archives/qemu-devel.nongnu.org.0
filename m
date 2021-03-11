Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9504E336F49
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:53:27 +0100 (CET)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKI0U-0006bg-L7
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKHxf-00050v-JZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:50:31 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52228
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKHxd-0003AT-0s
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:50:31 -0500
Received: from host86-140-100-136.range86-140.btcentralplus.com
 ([86.140.100.136] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lKHxY-0001BA-3K; Thu, 11 Mar 2021 09:50:28 +0000
To: Laurent Vivier <laurent@vivier.eu>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20210310080908.11861-1-mark.cave-ayland@ilande.co.uk>
 <20210310080908.11861-7-mark.cave-ayland@ilande.co.uk>
 <78a760-65e9-3689-b0b7-cb80b7af81a@eik.bme.hu>
 <f58c7e62-5518-98cd-44eb-8eab5ab736d8@vivier.eu>
 <24d71ce3-b5b9-28fa-74c2-b22076bef287@vivier.eu>
 <762713e4-96a8-e989-fa76-2febad83afce@vivier.eu>
 <4d88313a-c067-163d-2d80-c60786bc9d85@ilande.co.uk>
 <6bf78d5d-d0d-807d-c35-5a5c40c4b977@eik.bme.hu>
 <65f60989-fa2e-1440-e32a-4aae16b1f137@ilande.co.uk>
 <34f75085-feed-ede5-e17c-df4553b630b4@vivier.eu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <a765fabf-e510-59b4-f068-fe47301dbd31@ilande.co.uk>
Date: Thu, 11 Mar 2021 09:50:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <34f75085-feed-ede5-e17c-df4553b630b4@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.140.100.136
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 6/7] mac_via: fix 60Hz VIA1 timer interval
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/03/2021 09:44, Laurent Vivier wrote:

>> Yes indeed, depending upon the documentation it is referred to as either the 60Hz or the 60.15Hz
>> timer. Certainly that's enough information for anyone familiar with Mac internals to understand
>> exactly what you are referring to. There are also plenty of examples of this elsewhere e.g. for
>> graphics cards the high level claim will be that it supports over 16 million colours whereas the
>> engineers know specifically that the exact number is 16777216.
>>
>> I'll write up a suitable comment with a #define and send through a v2, perhaps altering the comment
>> on the timer itself to read 60.15Hz as that's what the reference cited by Laurent also uses.
> 
> If you want more details, this is also in "Apple Guide to the Macintosh Family Hardware", 2nd
> edition, Chapter 12, "Displays", p. 401 (p.440 of the following PDF):
> 
> https://archive.org/details/apple-guide-macintosh-family-hardware

Ah yes, that's a better reference as I don't see online versions of "Macintosh Family 
Hardware Reference" anywhere. I'll post the v2 shortly.


ATB,

Mark.

