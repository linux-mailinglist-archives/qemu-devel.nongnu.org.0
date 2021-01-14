Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C192F55A9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 01:48:36 +0100 (CET)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzqoV-0002uC-An
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 19:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzqnQ-0002R3-VQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:47:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kzqnO-0006ej-Go
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 19:47:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610585244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UYV7FsCo+oy/L/9kA9xHzl+sxOxF35Ot9TGfBirSE3U=;
 b=UOaraZelTwwGUhPle3tIfz+v4+86FIKk/I5uJwYp/XNinxrz1/cemH7UGVvyXgff/8dtTr
 3qVcI9BW8yG0QOb5ft45SoqIJUYLy909+J6ZUYNIMmo3KoBFuE0p88GOpV1BFc/KIsX6os
 GTiH/z3luSri86uhTMh2plUf99ZPepc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-b8pbyDvZPm2VLlmjqGfVig-1; Wed, 13 Jan 2021 19:47:22 -0500
X-MC-Unique: b8pbyDvZPm2VLlmjqGfVig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98149107ACFC;
 Thu, 14 Jan 2021 00:47:21 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE78960C17;
 Thu, 14 Jan 2021 00:47:17 +0000 (UTC)
Subject: Re: [PATCH v2 07/12] qapi/schema: make QAPISourceInfo mandatory
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
 <20201217015927.197287-8-jsnow@redhat.com>
 <87ft34x1bv.fsf@dusky.pond.sub.org>
 <fe49fccd-dce1-44ee-71c5-f696f69f5361@redhat.com>
 <20210114002944.GI4161@habkost.net>
From: John Snow <jsnow@redhat.com>
Message-ID: <a04a9b76-7df3-c9ad-38d4-170942a5064c@redhat.com>
Date: Wed, 13 Jan 2021 19:47:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114002944.GI4161@habkost.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 7:29 PM, Eduardo Habkost wrote:
> On Wed, Jan 13, 2021 at 06:04:29PM -0500, John Snow wrote:
>> On 1/13/21 11:12 AM, Markus Armbruster wrote:
>>> John Snow <jsnow@redhat.com> writes:

...

>>
>> I think we need to, yes; or we probably really, really want to. Making the
>> info parameter optional really adds a lot of unidiomatic type-checking
>> confetti when we go to use info, and in many more contexts than just this
>> sorta-built-in-enum; it will creep badly.
> 
> Which methods would require unidiomatic type-checking because of
> None/Optional?
> 

Virtually everything that accepts a QAPISourceInfo has to do something 
like this:

def foo(info: Optional[QAPISourceInfo]):
     if info is None:
         raise Exception("Something very bad has happened!")
     ...
     ...


Since the great majority of cases *will* have an info, and we take 
careful pains to make sure this info is preserved, it's less invasive to 
just assert that info isn't Optional.

This is especially true for the QAPISchemaMember initializer, which 
several other classes inherit -- if this is allowed to be 
Optional[QAPISourceInfo], any and all users of a QAPISchemaMember or any 
derived classes will have to check -- on every access -- to see if 
'member.info' is set or not.

Since we expect it to be set 100% of the time for all user-defined code, 
it's a lot less "if member.info is not None" checks everywhere.

Adding a special "built-in" source info object to make this claim helps 
avoid making confusing type signatures for the visitors; i.e.

def visit_thing(info: Optional[QAPISourceInfo]): ...

is misleading, because we actually expect thing to *always* have a 
SourceInfo. To make the documentation be a little more ... statistically 
truthful, it's easier to bend the rules in the other direction and just 
fill in the scant few cases where we don't have a QAPISourceInfo.

--js


