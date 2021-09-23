Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F7541604C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:54:37 +0200 (CEST)
Received: from localhost ([::1]:58860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTPBL-00083p-PB
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTPAD-0007M3-W4
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:53:26 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTPAC-000166-A9
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:53:25 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MIdW9-1mfpMl0JC1-00EfxS; Thu, 23 Sep 2021 15:53:22 +0200
Subject: Re: [PATCH v5 14/20] mac-nubus-bridge: rename MacNubusState to
 MacNubusBridge
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210923091308.13832-1-mark.cave-ayland@ilande.co.uk>
 <20210923091308.13832-15-mark.cave-ayland@ilande.co.uk>
 <db1b7f79-1442-a6fb-e1f6-c956f2dd9cb3@vivier.eu>
 <63b200b3-1690-cec2-d54b-7366073c64f3@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d571c96a-a00d-ae89-f92f-9db2d4b5d068@vivier.eu>
Date: Thu, 23 Sep 2021 15:53:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <63b200b3-1690-cec2-d54b-7366073c64f3@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ILYjm6uBY2nO0BkJ/5kQ+XOOWG/JR7XYg2YULl6yDuUY6Q3Raxv
 diAIlH2JKhKk+MPuoDST0R39xLQEm7b820xVc3zRlMApxGqFc7ow5kjLxo5QSYrVFq8fvFM
 sf5Trup7PeBhdbq9LSTztFuHIz9KYpNXEvt8l5WX9dhEbWa3mmS8Q63yGimbNafjIG713vw
 rDKtDtaj+FN3GhqWBrd7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A5geK972PVQ=:uXnUkIl1/qAkR0l/Wl34Mz
 dAfuex/7ut1J5gK4VLCAKmu5AZM1ZVqmLU5hr6ZbLtxTGvBv49bsl7eVmBmcWo+PjHCUKm3u7
 GFBZNAEIxymbYBEFA1UVG8rpzuabICyqAKYSSq4v7c6tmQ3OEVJWCaH1cM6iZv2CMmcX/NEvf
 Uv/1PfSJ/557YyLDkZ0nF2NW/ackh34fhJ3qYuZZIH2E9Q+PkQcD4i37FWFt3XiYotBnzQheu
 fMesH1/Fe1bwxSnAh0ho9cSU6RBY6dBbJWftVLVnd3YNOVSTDvTBi3xsAMutYzuQd0ZDl9oeM
 iU8Zs8Qo4eH9XJ+KgW20KHh8bQrW0JibKm/DWsgyq5jSSOR9X4ZnexBcWe3R+d46aU5rdCg6B
 FEDZyOoFZmi6TpcDleHNrYJvrMs1hdLhH3t28yukgFLXZoQsuLlTCQ3dJ95mkfsiGFhuojV/b
 Fw7cocO5xA5MEfshXftBvlTS82nukw5OJryWty9VKWw2u/afflcoH3SOvi7ErssvxQmF5x9iS
 Z3HWqVEy1AjYE5zVts0l8aVHxZSe5OwSC39vXlHDf2LEkXx08jxpe0/8v6i0t+T01F9yGG1X0
 F2W/9KCdBHYPccyCGFQ58LrcP95f/XPmPU5XnKiWwE9wf6RsDxOn2zaiaXUWf0ZKmZp1JvE4w
 JzbwR6ie2EfKCAJXYoQkbtjpZd0hYCHxfFt6TVC5r6IHZlfBjxrJGABXO4p0GknKC66RN0kQT
 VcjLIU+9X9hq5EsOi3Trtxs+MBeZ17N3166KdA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/09/2021 à 14:50, Mark Cave-Ayland a écrit :
> On 23/09/2021 11:35, Laurent Vivier wrote:
> 
>> Le 23/09/2021 à 11:13, Mark Cave-Ayland a écrit :
>>> This better reflects that the mac-nubus-bridge device is derived from the
>>> nubus-bridge device, and that the structure represents the state of the bridge
>>> device and not the Nubus itself. Also update the comment in the file header to
>>> reflect that mac-nubus-bridge is specific to the Macintosh.
>>>
>>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>   hw/nubus/mac-nubus-bridge.c         | 8 +++++---
>>>   include/hw/nubus/mac-nubus-bridge.h | 4 ++--
>>>   2 files changed, 7 insertions(+), 5 deletions(-)
>>>
>>
>>
>> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
>>
>> (it could be merged with previous one)
> 
> I like to try and keep renames on a per-device basis if possible, even if it's just to help rebasing
> during development.

Ok. No problem.

> Other than that, is there anything else outstanding you think would require a v6 series?

Except if you want to address comments from Philippe, I can collect this series and send a PR.

Thanks,
Laurent

