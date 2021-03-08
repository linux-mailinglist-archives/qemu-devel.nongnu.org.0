Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F7330CCE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:56:34 +0100 (CET)
Received: from localhost ([::1]:59114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEUz-0002qn-KM
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJETr-0002MK-GT
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:55:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lJETo-0002pU-Lz
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:55:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615204519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lZ+pXI5XU5u+fTs/8XMNhnxHaz70Z1FdZe5X9dRA8HI=;
 b=cRp0lgP73B50fAYGXLB4jjzOdY75Ra1Ug4lcH26MwSJdpkwcC04tbMLYwQ6vwVSm5atJCN
 qVrD9Z111V+DCtWTle51xBspjfvFMRJSAnneIbeNqpR4cTBEznMfzU/7Nztyf6PhwzLCo+
 53iNCv/Go6X0s9RJWd3mZdE93sS3QD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-sYunsqWUNViPrBHGZ47_Dw-1; Mon, 08 Mar 2021 06:55:15 -0500
X-MC-Unique: sYunsqWUNViPrBHGZ47_Dw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBAC11018F64;
 Mon,  8 Mar 2021 11:55:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-198.ams2.redhat.com [10.36.113.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC2160854;
 Mon,  8 Mar 2021 11:55:11 +0000 (UTC)
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
 <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <376579a6-091d-b923-4aca-b69ca942bada@redhat.com>
Date: Mon, 8 Mar 2021 12:55:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/03/2021 12.16, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> +Markus/Paolo/Laurent/Richard
> 
> On 3/8/21 11:24 AM, Peter Maydell wrote:
>> On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com> wrote:
>>>
>>> On 07/03/2021 16.56, Warner Losh wrote:
>>>> The FreeBSD project has a number of enhancements to bsd-user. Add myself
>>>> as maintainer and Kyle Evans as a reviewer. Also add our github repo.
>>>>
>>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>>> Signed-off-by: Kyle Evans <kevans@freebsd.org>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    MAINTAINERS | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 26c9454823..ec0e935038 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -2896,9 +2896,12 @@ F: thunk.c
>>>>    F: accel/tcg/user-exec*.c
>>>>
>>>>    BSD user
>>>> -S: Orphan
>>>> +M: Warner Losh <imp@bsdimp.com>
>>>> +R: Kyle Evans <kevans@freebsd.org>
>>>> +S: Maintained
>>>>    F: bsd-user/
>>>>    F: default-configs/targets/*-bsd-user.mak
>>>> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
>>>
>>> BSD is not really my home turf, but since nobody else picked this up and I
>>> plan to send a pull request for a bunch of patches anyway this week, I can
>>> also put it into my queue.
>>
>> Fine with me. (The v1 was in my to-review queue, but I'm currently
>> running somewhat behind on processing patches.)
> 
> This is a patch for mainstream QEMU, I'm having hard time
> understanding the point of it. This is some official way
> to say that BSD-user is not maintained in mainstream but
> has to be used in the referred fork which is way different
> that mainstream...
> 
> I'd rather wait for more mainstream contributions from Warner
> and Kyle, or blow the current orphan/dead code and import
> bsd-user-rebase-3.1 adding the maintainer entries along, but
> certainly not mark this dead code as maintained.
> 
> Please convince me why I'm wrong, because I'd prefer NAck this
> patch...

The idea has been discussed here:

https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01399.html

So this is not about declaring that bsd-user is maintained in a different 
repository, but about giving Warner et al. a chance to finally upstream 
their work.

  Thomas


