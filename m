Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925E36CAFA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 20:17:09 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbSGi-0006Gl-4h
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 14:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbSDQ-0005Ao-Bz
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lbSDN-0007mj-8F
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 14:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619547220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n84zfeLqJ+S6phVfIT972w82aFH6HO7t/I0k1b4MgJk=;
 b=VfXDv2kB45jWJIijzK9rHg4PTGWyqRNiJ+VhLv5Gp3haZYnsIX84dxWmbfKaT15y/QkaA3
 ova8g/RG4Lyud3wSVVqCmNoUAaXVK4IzKYnbe7BGpgoDdxNyc9KWFgXnn/BL9XOnt/atJs
 Sb4cYlzPppfK2kggkErVN7D4F/Q6qOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-Gy61vOaIPNOO8xQLw52UVw-1; Tue, 27 Apr 2021 14:13:36 -0400
X-MC-Unique: Gy61vOaIPNOO8xQLw52UVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C5C78027E2;
 Tue, 27 Apr 2021 18:13:35 +0000 (UTC)
Received: from [10.10.112.236] (ovpn-112-236.rdu2.redhat.com [10.10.112.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B64210016F8;
 Tue, 27 Apr 2021 18:13:34 +0000 (UTC)
Subject: Re: [PATCH] floppy: remove unused function fdctrl_format_sector
To: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
References: <20210108230137.8860-1-alxndr@bu.edu>
 <e5115c26-2017-831b-f341-206050266739@redhat.com>
 <453fb830-673e-d2eb-47b6-41c8ed7bad42@reactos.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <e2f6a706-7f2e-65b2-5c0d-4c717b0b3baf@redhat.com>
Date: Tue, 27 Apr 2021 14:13:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <453fb830-673e-d2eb-47b6-41c8ed7bad42@reactos.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:Floppy" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/21 3:53 AM, Hervé Poussineau wrote:
> Le 12/03/2021 à 07:45, John Snow a écrit :
>> On 1/8/21 6:01 PM, Alexander Bulekov wrote:
>>> fdctrl_format_sector was added in
>>> baca51faff ("updated floppy driver: formatting code, disk geometry 
>>> auto detect (Jocelyn Mayer)")
>>>
>>> The single callsite is guarded by a check:
>>> fdctrl->data_state & FD_STATE_FORMAT
>>>
>>> However, the only place where the FD_STATE_FORMAT flag is set (in
>>> fdctrl_handle_format_track) is closely followed by the same flag being
>>> unset, with no possibility to call fdctrl_format_sector in between.
>>>
>>
>> Hm, was this code *ever* used? It's hard to tell when we go back into 
>> the old SVN history.
>>
>> Does this mean that fdctrl_handle_format_track is also basically an 
>> incomplete stub method?
>>
>> I'm in favor of deleting bitrotted code, but I wonder if we should 
>> take a bigger bite.
>>
>> --js
> 
> The fdctrl_format_sector has been added in SVN revision 671 
> (baca51faff03df59386c95d9478ede18b5be5ec8), along with 
> FD_STATE_FORMAT/FD_FORMAT_CMD.
> As with current code, the only place where the FD_STATE_FORMAT flag was 
> set (in fdctrl_handle_format_track) is closely followed by the same flag 
> being unset, with no possibility to call fdctrl_format_sector in between.
> 
> I can however see the following comment:
>             /* Bochs BIOS is buggy and don't send format informations
>              * for each sector. So, pretend all's done right now...
>              */
>             fdctrl->data_state &= ~FD_STATE_FORMAT;
> 
> which was changed in SVN revision 2295 
> (b92090309e5ff7154e4c131438ee2d540e233955) to:
>             /* TODO: implement format using DMA expected by the Bochs BIOS
>              * and Linux fdformat (read 3 bytes per sector via DMA and fill
>              * the sector with the specified fill byte
>              */
> 
> This probably means that code may have worked without DMA (to be 
> confirmed), but was disabled since its introduction due to a problem 
> with Bochs BIOS.
> Later, fdformat was also tested and not working.
> 
> Since then, lots of work has also been done in DMA handling. I 
> especially think at bb8f32c0318cb6c6e13e09ec0f35e21eff246413, which 
> fixed a similar problem with floppy drives on IBM 40p machine.
> What happens when this flag unsetting is removed? Does fdformat now works?
> 
> I think that we should either fix the code, or remove more code 
> (everything related to fdctrl_format_sector, FD_STATE_FORMAT, 
> FD_FORMAT_CMD, maybe even fdctrl_handle_format_track).
> 
> Regards,
> 
> Hervé
> 

Alex, do you want to respin this following Hervé's suggestion for 
additional deletions?

I doubt anyone has the time or interest to actually FIX this code, so we 
may as well remove misleading code.

--js


