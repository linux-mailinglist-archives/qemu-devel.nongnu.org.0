Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFED39A26F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:44:55 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loneY-0001O5-Hh
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lond5-0008DA-Dg
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:43:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lond2-00049t-5w
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622727798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IukVIaHJsvV0qNOgzXsrP52JR+4uxdgzWrlBqYDKnSQ=;
 b=POlSEC2JkfSGALv3yrUO5TmJf9ZyxTFJ8yZcHQ5VFoWDo9zjOhu+EPklruMtiQ/9rl7zYY
 eZf8OZIF5vWcSnWPTNY8QSTBJsJyDtFev+HL1cybdQCs9pfZSe0GXxsKZvqfNhUFcrvgaU
 ywAxaQ3Frf4MMgBkeTeAQGLtdJeIOz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-cvqkjDw6NPqjrjRkpOqHJw-1; Thu, 03 Jun 2021 09:43:10 -0400
X-MC-Unique: cvqkjDw6NPqjrjRkpOqHJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 863B51020C37;
 Thu,  3 Jun 2021 13:43:06 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 339D92B1CD;
 Thu,  3 Jun 2021 13:42:59 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] GitLab: Add "Bug" issue reporting template
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20210521173818.255817-1-jsnow@redhat.com>
 <20210521173818.255817-2-jsnow@redhat.com>
 <YLdN4OcxSD0fJOvD@stefanha-x1.localdomain>
 <e6cda390-d1ac-723c-47a4-135abb7717a5@redhat.com>
 <YLiWL2LB3+sbrpJm@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <bf374dbe-da80-6354-d316-e401e6680377@redhat.com>
Date: Thu, 3 Jun 2021 09:42:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLiWL2LB3+sbrpJm@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.603, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 4:43 AM, Stefan Hajnoczi wrote:
> On Wed, Jun 02, 2021 at 12:09:47PM -0400, John Snow wrote:
>> On 6/2/21 5:22 AM, Stefan Hajnoczi wrote:
>>> On Fri, May 21, 2021 at 01:38:17PM -0400, John Snow wrote:
>>>> +## Host environment
>>>> + - Operating system: (Windows 10 21H1, Fedora 34, etc.)
>>>> + - OS/kernel version: (For POSIX hosts, use `uname -a`)
>>>> + - Architecture: (x86, ARM, s390x, etc.)
>>>> + - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
>>>
>>> Is this necessary since we ask for the command-line below?
>>>
>>
>> Not strictly, IF the entire form is filled out. I had noticed some bugs in
>> gitlab where reporters seem to be aware of what kind of QEMU they are
>> running, but are unable to procure the command line invocation. (it is being
>> launched through docker, virsh, etc.) *
>>
>> It's redundant, but I am operating on the belief that the CLI may not always
>> be available. I don't expect people to not file a bug because they can't
>> find it.
>>
>> I think of it as a prompt to get a more detailed report on the first try. Is
>> it worth keeping?
>>
>> *(Aside: maybe a wiki "how to report a bug" page could have a small section
>> on identifying the command line arguments when QEMU is being launched via
>> vmm/boxes/virsh/docker and so on.)
> 
> It didn't occur to me that the fields were optional :).
> 
> For me personally, long bug reporting templates reduce the chance that I
> will report a bug.
> 
> Stefan
> 

Yeah, it's a delicate balance. I want to imply they're mandatory. I 
don't want to call them optional, because then people may not feel 
compulsed to spend the effort to fill them out. I want them to feel a 
little compulsed. :)

On the other hand, sometimes these fields just won't apply, or there are 
reasons you can't fill them all out. A lot of reporters do not know how 
to build QEMU from source, or repeat a libvirt problem using 'raw' QEMU. 
Sometimes it's OK to file a less-than-perfect report. As you say, I 
don't want the barrier of entry to be too high.

Adding more instructions like "Hey, this field is optional if you have a 
CLI for us" just makes the template even longer and perhaps more 
intimidating, so I tried to keep it brief. Not my specialty ...

There's kind of a weird balance of implying things going on here. I 
suspect we will just have to try one approach and then change it as we 
observe how it gets used.

Don't think I'll solve it from the privacy of my own mind :)

Thanks for looking.
--js


