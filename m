Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4434350E1C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 06:34:09 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRp20-0001JL-RM
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 00:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRp0g-0000sz-Ok
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 00:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRp0b-0003Ss-7c
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 00:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617251559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHtmFmrBjz0RoQ+eda2TEgI7y59lV6egpiqQbXjdNDM=;
 b=bEZ+mGCYzfsIiK9by6u8tSO8lo29HYUJ/AX2O4Al3FnRfX3PvQGa0w5bRUuFKkCrd58+Mn
 UuJKjzlM5d8qOTSP4qa0xdG0Y70c3OLNmXvSqQH3am5dolpXqWHAMKuqwathfCGQot1jRt
 K7ATNdDslRv6VeU0SN3wIcVU3mDFkh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-DmYqyeJqOUCngZ8r1nuD9A-1; Thu, 01 Apr 2021 00:32:38 -0400
X-MC-Unique: DmYqyeJqOUCngZ8r1nuD9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34E8A80986C;
 Thu,  1 Apr 2021 04:32:37 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15881B2402;
 Thu,  1 Apr 2021 04:32:18 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci.yml: Use unrecoverable address sanitizer
To: Alexander Bulekov <alxndr@bu.edu>
References: <20210331160546.3071575-1-thuth@redhat.com>
 <20210331163634.oh7gznylvyxtwzz3@mozz.bu.edu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3f066915-75d3-421c-880b-4e9f9a069e28@redhat.com>
Date: Thu, 1 Apr 2021 06:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210331163634.oh7gznylvyxtwzz3@mozz.bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/2021 18.36, Alexander Bulekov wrote:
> On 210331 1805, Thomas Huth wrote:
>> Make sure that errors don't go unnoticed by using the unrecoverable
>> sanitizer switch here, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
> 
> I thought sanitizer recovery is disabled by default for ASan. I've only
> seen it enabled by default for UBSan. The docs seem to hint at this as
> well [1]. Was there something specific in the CI logs that went
> unnoticed?

Oh, you're right. I just wanted to turn this on pro-actively, but also the 
GCC man page says: "... error recovery is turned on by default, except 
-fsanitize=address ...".

So never mind, this patch is not required.

Thanks,
  Thomas


