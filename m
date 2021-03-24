Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B334712E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 06:44:19 +0100 (CET)
Received: from localhost ([::1]:37552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOwJW-0004T3-5d
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 01:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwIG-000406-Fx
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 01:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOwI9-0008Cd-Bv
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 01:42:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616564571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kbIjuOTOdAWPfoWZH0QRIUpX9MDWmFgFCdxo35KmMOo=;
 b=XE6JL8z1kUBB41DTAFSxuuDz9en6Ke66QWammY4CbZZuoZDnsGyN5aJwhMuW2xGQfZ7JDG
 A2FpO8YPMtLVd/W9kv17b+bHd8k89IfmDWmTRN5vEe61QbI0cyHIButtR1cL+eHN9o+98U
 fn+SgNhPZI0j6e0sXQfq31GcHQdFQiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-xGB1baeUMmqd4JC2WYbwvg-1; Wed, 24 Mar 2021 01:42:49 -0400
X-MC-Unique: xGB1baeUMmqd4JC2WYbwvg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 900A4612A6;
 Wed, 24 Mar 2021 05:42:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D836A6087C;
 Wed, 24 Mar 2021 05:42:46 +0000 (UTC)
Subject: Re: [PATCH] tests/migration: fix parameter of auto-converge migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, huangy81@chinatelecom.cn, 
 berrange@redhat.com
References: <0195d34a317ce3cc417b3efd275e30cad35a7618.1616513998.git.huangy81@chinatelecom.cn>
 <YFpEId2vw9ceC1Ly@work-vm>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <58fd7151-f026-ca82-9818-8156083398db@redhat.com>
Date: Wed, 24 Mar 2021 06:42:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFpEId2vw9ceC1Ly@work-vm>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 20.40, Dr. David Alan Gilbert wrote:
> * huangy81@chinatelecom.cn (huangy81@chinatelecom.cn) wrote:
>> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
>>
>> when execute the following test command:
>> $ ./guestperf-batch.py --auto-converge \
>>      --auto-converge-step {percent} ...
>> test aborts and error message be throwed as the following:
>> "Parameter 'x-cpu-throttle-increment' is unexpected"
>>
>> The reason is that 'x-cpu-throttle-increment' has been
>> deprecated and 'cpu-throttle-increment' was introduced
>> Since v2.7. Use the new parameter instead.
>>
>> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Please cc thuth@redhat.com and berrange@redhat.com on fixes to this
> file.

This not really my turf, since it's not directly related to the qtests.

But I wonder why tests/migration/ is not listed in the "Migration" sections 
in the MAINTAINERS file ... care to send a patch?

  Thomas


