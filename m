Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C136A38F31B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:38:59 +0200 (CEST)
Received: from localhost ([::1]:48450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFTc-0007d4-Bn
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llFSN-00069V-3D
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:37:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llFSK-0004z2-V7
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:37:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621881456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DHcWoeGgDpzNrdwSBiT0BMPMQznU5uxIj3OcZkqtOAY=;
 b=FoaT84KoQItMlrqvSMFc/yQQ2nHo1Jwf4w0rwIVsHByzk7i+4/ZSW+0B1dX9d66zatoLwW
 AU0j/u4S9VciZ3BVyTQ1yn0FwVBFJPFWWyoQZjcHEdWGbu3SPfmWzfQKuZYOo7VAYTzZXz
 4iqtBSoOdXoXUKlSsth9rx43rwbWQ4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-vC4FDImtNJiuyY2dQcectg-1; Mon, 24 May 2021 14:37:34 -0400
X-MC-Unique: vC4FDImtNJiuyY2dQcectg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AF33800D62;
 Mon, 24 May 2021 18:37:32 +0000 (UTC)
Received: from [10.10.116.202] (ovpn-116-202.rdu2.redhat.com [10.10.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34CED60CED;
 Mon, 24 May 2021 18:37:26 +0000 (UTC)
Subject: Re: [PATCH v2 3/3] qapi: deprecate drive-backup
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210505135803.67896-1-vsementsov@virtuozzo.com>
 <20210505135803.67896-4-vsementsov@virtuozzo.com>
 <YJO9owtr4N+1Ta7k@paraplu.home>
 <d3207955-794e-2859-14c2-80fa6767a13d@redhat.com>
 <5cbaa5bb-65cf-82cd-7f8e-8227a5f50b6d@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <05a5cce6-6ef3-60f1-76a9-93c183fc7273@redhat.com>
Date: Mon, 24 May 2021 14:37:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5cbaa5bb-65cf-82cd-7f8e-8227a5f50b6d@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: pkrempa@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, yur@virtuozzo.com, nshirokovskiy@virtuozzo.com,
 den@openvz.org, dim@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 10:06 AM, Vladimir Sementsov-Ogievskiy wrote:
> 15.05.2021 01:38, John Snow wrote:
>> On 5/6/21 5:57 AM, Kashyap Chamarthy wrote:
>>> TODO: We also need to deprecate drive-backup transaction action..
>>> But union members in QAPI doesn't support 'deprecated' feature. I tried
>>> to dig a bit, but failed :/ Markus, could you please help with it? At
>>> least by advice?
>>
>> Oho, I see.
>>
>> OK, I'm not Markus, but I've been getting into lots of trouble in the 
>> QAPI generator lately, so let me see if I can help get you started...
>>
>> https://gitlab.com/jsnow/qemu/-/commits/hack-deprecate-union-branches/
>>
>> Here's a quick hack that might expose that feature. I suppose we can 
>> discuss this with Markus and turn these into real patches if that's 
>> the direction we wanna head.
>>
> 
> Hi! Markus is silent.. Maybe, you'll send patches ? )
> 
> 

He just went on PTO for 2 weeks :')

It's going to have to wait, I'm afraid ...


