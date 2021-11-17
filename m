Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99493454912
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:45:36 +0100 (CET)
Received: from localhost ([::1]:51646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMBr-0008My-OO
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:45:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnMAW-0007gi-40
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:44:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnMAS-0000JQ-Bz
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637160246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FT9oiPnbhJHTNI13Qz4HBR6YUgfP+HBUgdAHEXGS6NM=;
 b=Yz6rL/8DarSdh3uEqBkQvfvn8dmI0fQ9cGiUxR7mg/OxPKeNTa3sU9d5uy/IPIBMqsxsAC
 bQFpAd8mGWr+8l7kIZe7VRqlSYZvVQvu6l879R8H8pE3iOcyY5Ni6k6Yy5V30UKsasAdeu
 qOQ8ePjJ4Bv/+MLeK918RbwEWYRavsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-puJgkb1HMASKfaiIR1ganA-1; Wed, 17 Nov 2021 09:44:02 -0500
X-MC-Unique: puJgkb1HMASKfaiIR1ganA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D43419251A2;
 Wed, 17 Nov 2021 14:44:01 +0000 (UTC)
Received: from [10.39.195.37] (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F293860BF1;
 Wed, 17 Nov 2021 14:43:57 +0000 (UTC)
Message-ID: <cd1b4dcd-01c3-33e0-6525-cbcbcc24a165@redhat.com>
Date: Wed, 17 Nov 2021 15:43:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 3/3] docs: rSTify the "SubmitAPatch" wiki
To: Kashyap Chamarthy <kchamart@redhat.com>
References: <20211110144902.388183-1-kchamart@redhat.com>
 <20211110144902.388183-4-kchamart@redhat.com>
 <e0229a36-b8bd-3822-9994-46279bfa138c@redhat.com> <YZTYo3H6TZheGbrj@paraplu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YZTYo3H6TZheGbrj@paraplu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2021 11.25, Kashyap Chamarthy wrote:
...
>>> +QEMU follows the usual standard for git commit messages: the first line
>>> +(which becomes the email subject line) is "subsystem: single line
>>> +summary of change". Whether the "single line summary of change" starts
>>> +with a capital is a matter of taste, but we prefer that the summary does
>>> +not end in ".".
>>
>> That ".". looks a little bit weird in the output ... maybe we should replace
>> it with "does not end with a dot." ?
> 
> Re-looking the output, yes it does look odd.  And yes, your amendment
> is good.

I haven't updated that one while picking up the patch - so we might want to 
fix it with an additional patch on top.

>>> +The body of the commit message is a good place to document why your
>>> +change is important. Don't include comments like "This is a suggestion
>>> +for fixing this bug" (they can go below the "---" line in the email so
>>
>> That --- gets translated into a — character ... I'll replace the "---" with
>> ``---`` to fix it.
> 
> Ah, when I locally ran `rst2html5 submitting-a-patch.rst
> submitting-a-patch.html` it retained the "---", but when I built QEMU
> (`configure --target-list=x86_64-softmmu --enable-docs`), Sphinx does
> turn it into an em-dash (—), and missed to notice it.
> 
> Thanks for the careful review and submitting the PR.  I'm assuming I
> don't need to respin a v4.

Right, patches have been merged now.

Something I just noticed afterwards, after looking at the pages online: 
https://www.qemu.org/docs/master/devel/submitting-a-pull-request.html uses 
"Submit" in the heading, while 
https://www.qemu.org/docs/master/devel/submitting-a-patch.html uses 
"Submitting" ... looks a little bit inconsequent ... should we change it to 
use one form only? The Wiki used "submit", not "submitting", so maybe use 
that one?

  Thomas


