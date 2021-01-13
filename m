Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8772F4ECF
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:32:45 +0100 (CET)
Received: from localhost ([::1]:56850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzi8a-0005zH-5M
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzi2Q-0000zL-Ba
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kzi2N-0005dX-Ig
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610551577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AKs+rEqabcmX1aVBmASgSG2NBLEsblz2RmlXkcV2KYI=;
 b=T1xyuc5xRdHDYUt2RMJ9wFDGyt7WsQulxOyMZ5AwlgVh31lFW5FHPEtSPEte00cbP3XiCx
 tl6XqUwga4Ig/opLchA2BB4OdADG40mypiGhvdCcVj9Gumb4ti4QKFdzRlXKzNCg6Dp5/T
 1k3zHt0DnV3Fad4zaZkAs0QcpOc86Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-7lITO17OMAaBZ99mtzRIrg-1; Wed, 13 Jan 2021 10:26:15 -0500
X-MC-Unique: 7lITO17OMAaBZ99mtzRIrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A0E9806661;
 Wed, 13 Jan 2021 15:26:14 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-103.ams2.redhat.com
 [10.36.113.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAA310016FB;
 Wed, 13 Jan 2021 15:26:13 +0000 (UTC)
Subject: Re: [PATCH 0/7] iotests/129: Fix it
To: Kevin Wolf <kwolf@redhat.com>
References: <20210113140616.150283-1-mreitz@redhat.com>
 <20210113143816.GB5928@merkur.fritz.box>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <72a1b15b-88c8-34f5-9e81-3aadcde333ca@redhat.com>
Date: Wed, 13 Jan 2021 16:26:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113143816.GB5928@merkur.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.01.21 15:38, Kevin Wolf wrote:
> Am 13.01.2021 um 15:06 hat Max Reitz geschrieben:
>> - pylint and mypy complain.
>>    (Running mypy with the options given in 297.)
>>    [Patch 4 removes one pylint complaint; patch 7 the rest.]
> 
> Should we add it to 297 then to make sure we won't regress?

Sounds like a good precedent to set indeed.

> At some point, I guess we'll want to cover all Python tests, but I
> assume it was too much to change in the same series as for the
> iotests.py cleanup.
Originally, I hadn’t intended to write patch 7 at all; I just wanted to 
see what pylint/mypy said to my changes in this series, but then they 
made me aware of pre-existing litter.  I thought adding patch 7 would be 
the right thing to do, so I did.

(That’s to say so far I had no intentions of cleaning up all Python 
tests.  It’s just coincidence that I did so for 129.)

Max


