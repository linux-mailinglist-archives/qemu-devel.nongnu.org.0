Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F38390769
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:20:48 +0200 (CEST)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llajX-0002SG-Sv
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llahM-0007fD-Ii
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:18:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1llahG-0000pI-GU
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621963105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fa0SNHLPfxriW7XpANZSJ4mGYxIsz7GAEsgFjO/dce8=;
 b=Xv4bdWKzgu+1NTF4fMmPzf/fvcEwaQaJBByDYnuhkzbmrSXatJA9hN2AYewuapM9NTOEmL
 jSF8kpTrCyDZmhjYdIRO8BZ+AQKc36mKZR3tE5EF+1nxvr6YE/5eT+8RPRNe0kTWrpqMh8
 uCFKm+maeRj9IsTVBP8Cw7E3IUTLQDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-_Wf14Y7BOOCZKYJfAXHUqA-1; Tue, 25 May 2021 13:18:22 -0400
X-MC-Unique: _Wf14Y7BOOCZKYJfAXHUqA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24B38180FD67;
 Tue, 25 May 2021 17:18:21 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 44CA85C1C2;
 Tue, 25 May 2021 17:18:11 +0000 (UTC)
Subject: Re: [PATCH v6 13/25] python: add excluded dirs to flake8 config
To: Cleber Rosa <crosa@redhat.com>
References: <20210512231241.2816122-1-jsnow@redhat.com>
 <20210512231241.2816122-14-jsnow@redhat.com>
 <YK0cw6y26fA5bnf3@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <bcb89aac-157e-5305-4ce8-54ef3da77bad@redhat.com>
Date: Tue, 25 May 2021 13:18:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YK0cw6y26fA5bnf3@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 11:50 AM, Cleber Rosa wrote:
> On Wed, May 12, 2021 at 07:12:29PM -0400, John Snow wrote:
>> Instruct flake8 to avoid certain well-known directories created by
>> python tooling that it ought not check.
>>
>> Note that at-present, nothing actually creates a ".venv" directory; but
>> it is in such widespread usage as a de-facto location for a developer's
>> virtual environment that it should be excluded anyway. A forthcoming
>> commit canonizes this with a "make venv" command.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/setup.cfg | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/python/setup.cfg b/python/setup.cfg
>> index 9ecb2902006..f21a1c42fc0 100644
>> --- a/python/setup.cfg
>> +++ b/python/setup.cfg
>> @@ -21,6 +21,8 @@ packages = find_namespace:
>>   
>>   [flake8]
>>   extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
>> +exclude = __pycache__,
>> +          .venv,
>>
> 
> Given that the default set of exclusions (version control system
> files) are not expected here, it LGTM to reset it with these.
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

Yep. Admittedly, I just excluded things that caused me trouble in 
practice. I could narrow the flake8 invocation to specify *only* the 
qemu/ folder, but in the event we added Python tests or other scripts I 
actually felt like leaving it "open" would be fine.

(This way, flake8 runs like how I expect it to by just running "flake8" 
with no arguments, which I saw as nice.)

The goal was something like: the less specific I make the flake8 
invocation, the better, even though I expect the linter to be run only 
by "make check" eventually, as a courtesy to mid-advanced users, keeping 
those canonical invocations simple felt good.

Thanks!

--js


