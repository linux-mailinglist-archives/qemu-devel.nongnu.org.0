Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FFD34A84B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 14:42:16 +0100 (CET)
Received: from localhost ([::1]:50310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPmj9-0002Ik-Ap
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 09:42:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPmhb-0001AS-0F
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lPmhX-000859-01
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 09:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616766030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7kuY0Ydpct/aQizOLQbQdk7Z9dXUXbh641QMiRBHjrk=;
 b=LStSVfWM4qe7ojtC/eAET8DZAMIsRVoXkVmYYV0Co8XRuKTma9564JGBfos5bmHrGhgTKW
 6N8CLas3Ev+42Vph4+fTzoyXP6hLYgLs7xo0dHdZHPcq5BDYYD74AaZPw8StDb8QNyZCLn
 3eb08sPo9wZv56vK9xT8O1eioCAHpJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-EYpEMNTIP6SjNJpEb-j3PA-1; Fri, 26 Mar 2021 09:40:28 -0400
X-MC-Unique: EYpEMNTIP6SjNJpEb-j3PA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5342107B7C3;
 Fri, 26 Mar 2021 13:40:26 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-113-48.ams2.redhat.com
 [10.36.113.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D43E5C737;
 Fri, 26 Mar 2021 13:40:24 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] qemu-iotests: quality of life improvements
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210323181928.311862-1-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <898ae07f-6054-d933-632a-814e1f65e1e1@redhat.com>
Date: Fri, 26 Mar 2021 14:40:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323181928.311862-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.03.21 19:19, Paolo Bonzini wrote:
> This series adds a few usability improvements to qemu-iotests, in
> particular:
> 
> - arguments can be passed to Python unittests scripts, for example
>    to run only a subset of the test cases (patches 1-2)
> 
> - it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
>    and specify arbitrary arguments to be passed to a single test script.
>    This allows to take advantage of the previous feature and ease debugging
>    of Python tests.
> 
> Paolo
> 
> v1->v2: patches 1-2 are a rewrite of v1's patch 1
>          moved print_env change to patch 4
>          do not use argparse.REMAINDER

I’m afraid the changes to iotests.py don’t pass the scrutiny of iotest 
297, so I’m going to have to remove the series again. :/


=== pylint ===
************* Module iotests
iotests.py:1288:0: R0205: Class 'ReproducibleStreamWrapper' inherits 
from object, can be safely removed from bases in python3 
(useless-object-inheritance)
iotests.py:1303:4: W1113: Keyword argument before variable positional 
arguments list in the definition of __init__ function 
(keyword-arg-before-vararg)
=== mypy ===
iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)

iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)

iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)

iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)

iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)

iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)

iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)

iotests.py:1303: error: Function is missing a type annotation for one or 
more arguments
iotests.py:1304: error: Missing type parameters for generic type "Type"
iotests.py:1311: error: Function is missing a return type annotation
Found 3 errors in 1 file (checked 1 source file)


