Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A36D28681A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 21:13:01 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQEs0-0000iq-GH
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 15:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQEnl-0004Aq-NR
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 15:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQEnj-0005CE-LR
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 15:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602097714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vwmw/lWjME6i14BmmG0pUwrjtaiOPUgVNszRJnnOGNc=;
 b=NtVdBTck0s6DcHboA+2Xabw4dIGa8UqVOwsc1BllAKp6kEu9UF6DMBXeLCmj8kS9+Et7/o
 jxT5EITaDLmlCNFFn0WNTArUrOTxh8tS4ML2Iv4EXmqSuEBz1kcunownYFXj7JDQNH/p1p
 wv/WLFDRQpUX9vn4FikjNY6DI/njJOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-UvkmISbeMj2wCYnak_XSEw-1; Wed, 07 Oct 2020 15:08:31 -0400
X-MC-Unique: UvkmISbeMj2wCYnak_XSEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDDA41007283;
 Wed,  7 Oct 2020 19:08:30 +0000 (UTC)
Received: from [10.10.120.38] (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3C435D9DD;
 Wed,  7 Oct 2020 19:08:29 +0000 (UTC)
Subject: Re: [PATCH 20/20] python: add mypy config
To: Kevin Wolf <kwolf@redhat.com>
References: <20201006235817.3280413-1-jsnow@redhat.com>
 <20201006235817.3280413-21-jsnow@redhat.com>
 <20201007113512.GM7212@linux.fritz.box>
From: John Snow <jsnow@redhat.com>
Message-ID: <3bf02c13-c376-16f8-160a-c70e3abe835d@redhat.com>
Date: Wed, 7 Oct 2020 15:08:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007113512.GM7212@linux.fritz.box>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/20 7:35 AM, Kevin Wolf wrote:
> Am 07.10.2020 um 01:58 hat John Snow geschrieben:
>> Formalize the options used for checking the python library. You can run
>> mypy from the directory that mypy.ini is in by typing `mypy qemu/`.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/mypy.ini | 4 ++++
>>   1 file changed, 4 insertions(+)
>>   create mode 100644 python/mypy.ini
>>
>> diff --git a/python/mypy.ini b/python/mypy.ini
>> new file mode 100644
>> index 00000000000..7a70eca47c6
>> --- /dev/null
>> +++ b/python/mypy.ini
>> @@ -0,0 +1,4 @@
>> +[mypy]
>> +strict = True
> 
> $ mypy --strict qemu
> mypy.ini: [mypy]: Strict mode is not supported in configuration files: specify individual flags instead (see 'mypy -h' for the list of flags enabled in strict mode)
> Success: no issues found in 6 source files
> $ mypy --version
> mypy 0.740
> 
> Did this change in newer mypy versions? I guess it's time that I get the
> new laptop which will involve installing a newer Fedora release. :-)
> 
>> +python_version = 3.6
>> +warn_unused_configs = True
>> \ No newline at end of file
> 
> Kevin
> 

0.770 lets you use strict in the config file. Fairly modern. I intend to 
use this version in the CI venv that I am cooking up to check these, so 
no need to hurry and update your fedora.

'pip3 install --user mypy>=0.770' should work out just fine until then.

Maybe I should drop back down to >=0.730, but I liked being able to 
force the stricter options in the conf file directly. I also liked the 
idea that if new strict options got added in the future, we'd acquire 
them automatically.

I felt like anything we disabled should be a conscious and explicit 
choice, instead of the opposite.

--js


