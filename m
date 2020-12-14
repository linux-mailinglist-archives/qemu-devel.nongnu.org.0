Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81042D9549
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:34:42 +0100 (CET)
Received: from localhost ([::1]:57174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kokFd-000497-D4
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:34:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kokEP-0003ZL-Ft
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 04:33:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kokEI-0002iI-0w
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 04:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607938396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eB3TamOJXa/GIbhenyNW3jQ0F9R81NoaFQsA7alF0Ko=;
 b=MFnMVkoaPuB7TR/2zG0SLIiIoYKgsccZEgycpr1DT1Z5NbbDnY05BvdtfTzQ7RGX/P1szE
 MnrbysYrN8fPRTgi9r8JvX70kwvAYYpUDixA6DdfccbWipJPMj288r+Q3a1twE+wIWCv7Q
 UNchgV8x+D4CIXhRMcKZTapXmBzp1/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-pHhCc6g1NBy4LHu4e9QTMQ-1; Mon, 14 Dec 2020 04:33:13 -0500
X-MC-Unique: pHhCc6g1NBy4LHu4e9QTMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41959800D53;
 Mon, 14 Dec 2020 09:33:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53F905B4A4;
 Mon, 14 Dec 2020 09:33:10 +0000 (UTC)
Subject: Re: [RFC PATCH] .cirrus.yml: bump timeout period for MacOS builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 luoyonggang@gmail.com, "Daniel P. Berrange" <berrange@redhat.com>
References: <20201118140739.18377-1-alex.bennee@linaro.org>
 <44c6c5c4-2152-b31f-9610-1a8e7f72037e@redhat.com>
 <CAAdtpL6E1wbT_qrzARjR8M2b1s=jpVuT0y5iTA5wxh+559DQQA@mail.gmail.com>
 <CAE2XoE938Ut+5NAB+4qgWMK4O4rGz8ORwWMsUC90J9NwF0Fs2A@mail.gmail.com>
 <87h7oovivo.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <caaa48db-95b4-0765-2b96-e7f7298457fb@redhat.com>
Date: Mon, 14 Dec 2020 10:33:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87h7oovivo.fsf@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/12/2020 10.24, Alex Bennée wrote:
> 
> 罗勇刚(Yonggang Luo) <luoyonggang@gmail.com> writes:
> 
>> On Mon, Dec 14, 2020 at 2:36 AM Philippe Mathieu-Daudé <f4bug@amsat.org>
>> wrote:
>>>
>>> On Wed, Nov 18, 2020 at 4:11 PM Thomas Huth <thuth@redhat.com> wrote:
>>>> On 18/11/2020 15.07, Alex Bennée wrote:
>>>>> These seem to trigger timeouts with some regularity.
>>>>>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> ---
>>>>>  .cirrus.yml | 2 ++
>>>>>  1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/.cirrus.yml b/.cirrus.yml
>>>>> index f0209b7a3e..08db7c419f 100644
>>>>> --- a/.cirrus.yml
>>>>> +++ b/.cirrus.yml
>>>>> @@ -18,6 +18,7 @@ freebsd_12_task:
>>>>>      - gmake -j$(sysctl -n hw.ncpu) check V=1
>>>>>
>>>>>  macos_task:
>>>>> +  timeout_in: 90m
>>>>>    osx_instance:
>>>>>      image: catalina-base
>>>>>    install_script:
>>>>> @@ -32,6 +33,7 @@ macos_task:
>>>>>      - gmake check V=1
>>>>>
>>>>>  macos_xcode_task:
>>>>> +  timeout_in: 90m
>>>>>    osx_instance:
>>>>>      # this is an alias for the latest Xcode
>>>>>      image: catalina-xcode
>>>>>
>>>>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>
>>>> ... we could maybe also split the --target-list between the two jobs if
>> they
>>>> take too long...
>>>
>>> Maybe it's time, 90min reached:
>>> https://cirrus-ci.com/task/5774549872541696
>>>
>> Even two hour doesn't working, don't know why
> 
> It seems to have jumped up quite considerably over a short period which
> makes me think the underlying cause is something is getting stuck on
> MacOS. Unfortunately it's hard to debug with just the logs because
> whatever is taking the time might not be the last thing in the logs.
> 
> Having a time-per-test metric would be useful here.

Didn't Daniel post such a patch some weeks ago?

 Thomas


