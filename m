Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1686131C529
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 02:51:07 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBpW3-00010o-Tk
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 20:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpUl-0000Xa-49
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lBpUh-0006la-Ld
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 20:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613440177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6icFfvOeU1uVCX/qH6fFgNt+uJ12GUdhKTH/L4P/40=;
 b=BJyRwGQIJu4IaZxR+rXs5/sNLiQCqeTRY8v9zainPx6UIMvOGr9FmTBVm7tp414yPv6Ja3
 EwZGbnOdeiiOMIdV/eal9KPxxbZZzJlifMnZNwSQesPWqlhNbOuexhuUFWSv5FuBPyvoTv
 hTObaLm0b+hKHpJG9fKsHNwC72qIv+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-3NFSbetRMlW_hhQ4fGzodg-1; Mon, 15 Feb 2021 20:49:34 -0500
X-MC-Unique: 3NFSbetRMlW_hhQ4fGzodg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43BF8107ACC7;
 Tue, 16 Feb 2021 01:49:33 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0269919D6C;
 Tue, 16 Feb 2021 01:49:31 +0000 (UTC)
Subject: Re: [PATCH v9 0/6] Rework iotests/check
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
 <20210126125301.GE4385@merkur.fritz.box>
 <2628b158-cc41-908e-550f-ec4fe726a31f@virtuozzo.com>
 <20210126150750.GH4385@merkur.fritz.box>
 <5bb6d3fd-2a2c-91a4-f12a-5e195627a7fb@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <af46aebd-a6b4-cc64-1d6e-d08e78c6b0ae@redhat.com>
Date: Mon, 15 Feb 2021 20:49:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5bb6d3fd-2a2c-91a4-f12a-5e195627a7fb@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
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
Cc: den@openvz.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/26/21 10:15 AM, Vladimir Sementsov-Ogievskiy wrote:
>>
> 
> OK, thanks for handling it!
> 
> When will we move to python 3.7?

"I don't know, but it seems like a very long time."

The nominal EOL for Python 3.6 is this December; see 
https://www.python.org/dev/peps/pep-0494/

Debian 10 ships 3.7.
Fedora has appropriate packages going back to F29 and possibly earlier.
OpenSuSE tumbleweed offers 3.8 and 3.9.
Ubuntu 18.04 LTS offers 3.7 and 3.8 packages.
Ubuntu 20.04 LTS offers 3.7 and 3.8 packages.

OpenSUSE 15.2 ... ships with Python 3.6, and I don't see an option to 
install anything more modern. This distribution is supported (both by us 
and by SuSE) until 2021-12-31.

As of 2020-12-29, OpenSuSE 15.3 appears to be set to ship Python 3.6:
"python3-3.6.12-3.70.1.x86_64.rpm". It is set to ship 2021-07-07, and 
does not have an estimated EOL date yet.

SLES 15 ... I'm not sure and can't seem to find that information 
quickly. https://www.suse.com/releasenotes/x86_64/SUSE-SLES/15-SP1/ 
which was published at the end of 2020, suggests that Python 3 
support(?) is new(?) to some extent. 
https://packagehub.suse.com/packages/python3/ suggests that SLES 15.2 is 
Python 3.6-based.

I can't tell if they offer the optional addition of Python 3.7 on either 
SLES or OpenSuSE. Would love to know.

As for RHEL/CentOS, I think it's in the same shape right now. It's 
3.6-based, but I don't know if there's an optional 3.7+ package or not.

--js


Note: our configure script doesn't try several canonical sources of 
Python interpreters, we just try to use "python3". In the case of 
multiple python installations, we'd have to try python3.7, python3.8, 
python3.9, etc.


