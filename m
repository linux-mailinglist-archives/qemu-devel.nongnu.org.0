Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 951783B492C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 21:14:42 +0200 (CEST)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwrHl-0006Fl-5D
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 15:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwrFT-0004pG-Ij
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 15:12:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwrFR-00040a-Ul
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 15:12:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624648337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqWglKKWxBsi/m1++i8Af91ZG0saqS8Nd2TZk0XbWO0=;
 b=b6xk//ZSu0xJdUv4ISWxzeNh5+PvQ8IJix7fUpWjb/IQY/b0bF0qP9N0Ptx76CBKRafcLu
 Qmtw93txVagd/D/cm8iSyOq2rbEBX0gCmfo9X/ydfTs35jkPgJKov2Ce/uB3QI3ufOD9HI
 3ni9YoL+OKih8kHjYPdEwYE0u9oGFfc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-uHTuDdz6OI2Gn7vBqDlxng-1; Fri, 25 Jun 2021 15:12:15 -0400
X-MC-Unique: uHTuDdz6OI2Gn7vBqDlxng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8501485ECC2;
 Fri, 25 Jun 2021 19:12:14 +0000 (UTC)
Received: from [10.10.118.71] (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5192369A;
 Fri, 25 Jun 2021 19:12:10 +0000 (UTC)
Subject: Re: [PATCH 08/11] python: add 'make check-venv' invocation
To: Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-9-jsnow@redhat.com>
 <CAKJDGDa5DfPO5nw=PFAGnN00iJ7vzqM6QZajFsM6otMqan8JKA@mail.gmail.com>
 <eb68be3e-7f12-2c44-aa5c-b4d98ed0702a@redhat.com>
 <CAKJDGDbwGN2dvLSfD202R92bYWjSTMSOX2LXV6PtkETHpsUZXQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <9b81a9ba-820c-37bd-b61f-fd3a2d056c65@redhat.com>
Date: Fri, 25 Jun 2021 15:12:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAKJDGDbwGN2dvLSfD202R92bYWjSTMSOX2LXV6PtkETHpsUZXQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 3:01 PM, Willian Rampazzo wrote:
> On Fri, Jun 25, 2021 at 3:38 PM John Snow <jsnow@redhat.com> wrote:
>>
>> On 6/25/21 2:36 PM, Willian Rampazzo wrote:
>>> Maybe, it may confuse people using `make check-venv` under `tests`.
>>> Anyway, I'm not opposed to it.
>>>
>>> Reviewed-by: Willian Rampazzo<willianr@redhat.com>
>>
>> I have to admit there's much about Python packaging that is confusing :)
>>
> 
> Oh, the comment was not so related to packaging, but to QEMU itself.
> 
>> Can you elaborate on your point for me, though?
> 
> Under the `tests` folder, `make check-venv` creates the Python venv
> for the tests. It does not run the tests. The `make check-venv` under
> the `pyhton` folder proposed here will actually run the tests in the
> venv. My comment was related to people already used to the behavior of
> `make` under the `tests` folder.
> 
> I don't think it is this patch fault and I think this makes more sense
> than what we currently have under the `tests` folder. Maybe it is just
> a matter of organizing the `tests` folder `make` command.
> 

OH, I see what you're saying. It's the ambiguity between:

1. make [the] 'check' venv
2. make check, [with the] venv

I chose one semantic and tests/ chose another. Valid concern.

I suppose if someone does get it mixed up it won't hurt too much though, 
they'll certainly notice pretty quickly that 'check-venv' runs tests.

Cleber, my #1 co-maintainer, do you have any preferences here?

--js


