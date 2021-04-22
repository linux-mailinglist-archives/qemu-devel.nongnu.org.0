Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35191368292
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 16:40:20 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZaV9-0001xK-1T
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 10:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZaU0-0001Wr-I1
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZaTy-0006tw-MS
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 10:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619102346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RJTbDtwlf71D7eCU2lIw1X2uccqT5ExpbqT11UGSy8=;
 b=Bx+FXV7aNR9XplCCg6XNV5A+oGJHtLJUGYjbXrJHvlcnygZKZrkVmr1XYjLYfgwzrzV5yu
 V/UL18/QE05Te8Uz9xfhAAH/zwD7Hb1X7bMG0kY4eyREVmp3dw/yp0nvLsUzcwlRMuibFC
 k4zaklBI47ab5MVxqGjnCOSfjyXWvz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-sXNaxK0DOHS_rNCug1XboQ-1; Thu, 22 Apr 2021 10:38:53 -0400
X-MC-Unique: sXNaxK0DOHS_rNCug1XboQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75D5918D0EE8;
 Thu, 22 Apr 2021 14:38:52 +0000 (UTC)
Received: from [10.10.118.152] (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9C5860613;
 Thu, 22 Apr 2021 14:38:51 +0000 (UTC)
Subject: Re: [PATCH v3 0/8] qapi: static typing conversion, pt4
To: Markus Armbruster <armbru@redhat.com>
References: <20210421192233.3542904-1-jsnow@redhat.com>
 <87k0ouyc3j.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <7d8e4485-95e3-1408-2670-e16d5193a690@redhat.com>
Date: Thu, 22 Apr 2021 10:38:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87k0ouyc3j.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 4:09 AM, Markus Armbruster wrote:
> John Snow <jsnow@redhat.com> writes:
> 
>> Hi, this series adds static type hints to the QAPI module.
>> This is part four, and focuses on error.py.
>>
>> Part 4: https://gitlab.com/jsnow/qemu/-/tree/python-qapi-cleanup-pt4
>> CI: https://gitlab.com/jsnow/qemu/-/pipelines/290152364
>>
>> Requirements:
>> - Python 3.6+
>> - mypy >= 0.770
>> - pylint >= 2.6.0 (2.7.0+ when using Python 3.9+)
>>
>> Every commit should pass with:
>>   - `isort -c qapi/`
>>   - `flake8 qapi/`
>>   - `pylint --rcfile=qapi/pylintrc qapi/`
>>   - `mypy --config-file=qapi/mypy.ini qapi/`
> 
> I doubt PATCH 1 is worth the trouble without an actual concrete
> location-less error.  However, arguing about it some more would also not
> worth the trouble, so:
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> and queued.  Thanks!
> 

FWIW, I use it a few times in Part 5a:

- Once in main.py, to wrap an OSError (You'll see why)
- Again in qapidoc to create a "QAPIDocError" class, but this is only 
used in PoC code to demonstrate that QAPISchemaParser is fully typed.

I am finding it handy, though it may be true we wind up not needing it, 
based on reviews in part 5.

Thanks for queueing it up!

--js

(Why does tbird spellcheck not think 'queueing' is a word?)


