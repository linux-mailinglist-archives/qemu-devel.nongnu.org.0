Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592EC344E6E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 19:24:31 +0100 (CET)
Received: from localhost ([::1]:56378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOPE5-0006pF-Lw
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 14:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOP69-0000yD-8a
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOP61-0002G2-PM
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 14:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616436967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYYiZL/rDYG/Avfapau3M5M+DigB+pHODXAPiiPdfQA=;
 b=L/Ihs3bL4pD9IK3ybkgJdozD3NPQS3/iFafhxvELv3dHnijQ3GWC2k6Z9lkcD56mAWmhDO
 7EbuX7kHdTHA95uu9PlG7TR3xYGkvq3qxkkn69oCo9oO09U6i3S06e97aI8sWYvNk0EH0u
 oVTfdPmg7rjx6LPFV3akDPQdMksFirQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-dN8L0BWXM2CT8yu0h-ICPw-1; Mon, 22 Mar 2021 14:16:05 -0400
X-MC-Unique: dN8L0BWXM2CT8yu0h-ICPw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B32C87A826;
 Mon, 22 Mar 2021 18:16:03 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A53C1837F;
 Mon, 22 Mar 2021 18:15:57 +0000 (UTC)
Subject: Re: [PATCH] docs: simplify each section title
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210322155040.4009256-1-marcandre.lureau@redhat.com>
 <CAFEAcA95saRMvwkst1tr5wpihtKOK3GX-KSgUNe+J2T8aAcbSw@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <2671f94e-b0a2-61e7-d4e9-f5163df3e442@redhat.com>
Date: Mon, 22 Mar 2021 14:15:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95saRMvwkst1tr5wpihtKOK3GX-KSgUNe+J2T8aAcbSw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/21 12:36 PM, Peter Maydell wrote:
> On Mon, 22 Mar 2021 at 16:03, <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> Now that we merged into one doc, it makes the nav looks nicer.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   docs/devel/index.rst   | 4 ++--
>>   docs/interop/index.rst | 4 ++--
>>   docs/specs/index.rst   | 4 ++--
>>   docs/system/index.rst  | 4 ++--
>>   docs/tools/index.rst   | 4 ++--
>>   docs/user/index.rst    | 4 ++--
>>   6 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
>> index 7c424ea6d7..09d21d3514 100644
>> --- a/docs/devel/index.rst
>> +++ b/docs/devel/index.rst
>> @@ -1,8 +1,8 @@
>>   .. This is the top level page for the 'devel' manual.
>>
>>
>> -QEMU Developer's Guide
>> -======================
>> +Developers
>> +==========
> 
> I think this should be "Developer's Guide" or "Developer Information"
> or something. Just "Developers" doesn't really read right to me:
> it is not "documentation of developers" in the way that the "Tools"
> section is "documentation of tools", etc.
> 
> thanks
> -- PMM
> 

Changing it to a verb - "Development" - might fit the intent, by analogy 
with "System Emulation Management and Interoperability", "System 
Emulation", and "User Mode Emulation".

Keeping it as a noun with "Developer Information" or "Information for 
Developers" also reads fine to me.

--js


