Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BE344B72
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 17:34:52 +0100 (CET)
Received: from localhost ([::1]:34390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lONVz-00046s-6Z
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 12:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lONSg-0002az-OV
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lONSb-0007yj-11
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 12:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616430679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6FcfFOgX5ksRe11K+Um69DA5KsdZso8viChSMXLV0Es=;
 b=DyMFqZ2SmmlxoCDIoKTINpXj7IvOFKkj5+uZDKhVNLVpazEX0QGj2t8V7sHp65d1Qx+B3T
 ooz4FwYGPmx+tZTinRBjByHPNlnPtYuZH0fAAvSznHsaqDAC2jA9LxeQydKuyP04W4KmPf
 V2L+BdqccDahPBeOSymUJHlhp6SMyXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-8vqJ6gfaPQKIH2N77enFDQ-1; Mon, 22 Mar 2021 12:31:15 -0400
X-MC-Unique: 8vqJ6gfaPQKIH2N77enFDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FBB3180FCA8;
 Mon, 22 Mar 2021 16:31:14 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-79.ams2.redhat.com [10.36.112.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 18C58104C3C9;
 Mon, 22 Mar 2021 16:31:04 +0000 (UTC)
Subject: Re: [RFC PATCH] gitlab: default to not building the documentation
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210322144140.13505-1-alex.bennee@linaro.org>
 <e4946ac6-8580-c8fc-ae1b-f1907f00bdce@redhat.com> <87r1k7jgw3.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2ebf6d27-8296-6047-224c-d058913e6474@redhat.com>
Date: Mon, 22 Mar 2021 17:31:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87r1k7jgw3.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/03/2021 17.24, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 22/03/2021 15.41, Alex Bennée wrote:
>>> In d0f26e68a0 ("gitlab: force enable docs build in Fedora, Ubuntu,
>>> Debian") we made sure we can build the documents on more than one
>>> system. However we don't want to build documents all the time as it's
>>> a waste of cycles (and energy). So lets reduce the total amount of
>>> documentation we build while still keeping some coverage.
>>> Fixes: a8a3abe0b3 ("gitlab: move docs and tools build across from
>>> Travis")
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    .gitlab-ci.yml | 12 ++++++------
>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 9ffbaa7ffb..7714c7cac8 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -23,9 +23,9 @@ include:
>>>        - cd build
>>>        - if test -n "$TARGETS";
>>>          then
>>> -        ../configure --enable-werror $CONFIGURE_ARGS --target-list="$TARGETS" ;
>>> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS --target-list="$TARGETS" ;
>>>          else
>>> -        ../configure --enable-werror $CONFIGURE_ARGS ;
>>> +        ../configure --enable-werror --disable-docs $CONFIGURE_ARGS ;
>>>          fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
>>>        - if test -n "$LD_JOBS";
>>>          then
>>> @@ -119,7 +119,7 @@ build-system-ubuntu:
>>>        job: amd64-ubuntu2004-container
>>>      variables:
>>>        IMAGE: ubuntu2004
>>> -    CONFIGURE_ARGS: --enable-fdt=system --enable-slirp=system
>>> +    CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
>>
>> I think it might be better to add it to the Fedora job - it will
>> likely have a newer version of Sphinx and gets updated more often.
> 
> It's already in build-system-fedora, just the ubuntu one was squashed
> when I moved tools and docs across.

Ah, right, it got enabled in commit d0f26e68a05 there already.

Ok, then I think this patch is fine:

Reviewed-by: Thomas Huth <thuth@redhat.com>


