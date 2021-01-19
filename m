Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA12FC3F3
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:44:03 +0100 (CET)
Received: from localhost ([::1]:52670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1zjG-0001zn-A8
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1zh5-0000xN-1h
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:41:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l1zh1-00008i-Qc
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:41:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611096101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtoZQ9Tq9ejqtxOefMY1rQDQbJTpoQ1ywO5wNJlvxOQ=;
 b=GW55p88qHjy9wWWnUjAbuQZPKjb/Q9OhjZNa8GTZFbrqAkGaqGDrh9vqrGhbyiebnVK1q+
 rZ5iCY5Iia20TSCChboOUQXQOZ30abU3x+WD7+fkaYSfunIRZRXhpzCqshLNFJTyIj4REa
 vTBczciiV02anyQR59BCfJELc6ElLB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-sWOktUnGMwicV8VEAANP6w-1; Tue, 19 Jan 2021 17:41:38 -0500
X-MC-Unique: sWOktUnGMwicV8VEAANP6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADB2A800D55;
 Tue, 19 Jan 2021 22:41:37 +0000 (UTC)
Received: from [10.10.120.151] (ovpn-120-151.rdu2.redhat.com [10.10.120.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 021F660C0F;
 Tue, 19 Jan 2021 22:41:33 +0000 (UTC)
Subject: Re: [PATCH] RFC: sphinx: adopt kernel readthedoc theme
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20201105160335.1222062-1-marcandre.lureau@redhat.com>
 <CAMxuvayPZ7FR4JCpuNk_9P8NTSo_G=F6c2cWK+gDvv676ibLxQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <aae8f4c6-de24-4df2-6285-00203721a64a@redhat.com>
Date: Tue, 19 Jan 2021 17:41:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvayPZ7FR4JCpuNk_9P8NTSo_G=F6c2cWK+gDvv676ibLxQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "P. Berrange,
 Daniel" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 5:56 AM, Marc-André Lureau wrote:
> Hi,
> 
> On Thu, Nov 5, 2020 at 8:03 PM <marcandre.lureau@redhat.com> wrote:
>>
>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> The default "alabaster" sphinx theme has a couple shortcomings:
>> - the navbar moves along the page
>> - the search bar is not always at the same place
>> - it lacks some contrast and colours
>>
>> The "rtd" theme from readthedocs.org is a popular third party theme used
>> notably by the kernel, with a custom style sheet. I like it better,
>> perhaps others do too. It also has features that may come handy, such as
>> "Edit on Gitlab".
>>
>> Tweak the nav header background to match qemu.org style, use the
>> QEMU logo, and favicon.
>>
>> The html_theme_options['description'] workaround doesn't seem necessary.
>>
>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>   docs/conf.py                           |  36 +++----
>>   docs/devel/conf.py                     |   4 -
>>   docs/interop/conf.py                   |   4 -
>>   docs/specs/conf.py                     |   5 -
>>   docs/sphinx-static/theme_overrides.css | 137 +++++++++++++++++++++++++
>>   docs/system/conf.py                    |   4 -
>>   docs/tools/conf.py                     |   5 -
>>   docs/user/conf.py                      |   4 -
>>   8 files changed, 155 insertions(+), 44 deletions(-)
>>   create mode 100644 docs/sphinx-static/theme_overrides.css
>>
> 
> Am I the only one finding the default sphinx theme inferior to rtd ?
> 
> thanks
> 
> 

Probably not, but do you have some screenshots or examples of before/after?

--js


