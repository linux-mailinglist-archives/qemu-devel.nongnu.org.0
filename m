Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB0258C5A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 12:07:38 +0200 (CEST)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD3CT-0003Wi-HV
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 06:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD3BT-0002HZ-D6
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kD3BR-0005Ur-8f
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 06:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598954791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pq9bQc4Vkahl5uBCiHelrgfhZi/PKPQt7HGJuS14tvI=;
 b=BPvvLVgK4YsFaDPVI2/lgcKBTetPhz1OVzcJES+q766+WUMLZPMhM6ze1FotH9CMpSgAkJ
 tKhQnJlgbaUNY9v8kev4qMvPdEFmNkc2p9gVCHb/7PFGdONXJfNM1H9dXNt02u430W15FS
 hsEui31pUAHlK3yxiVEDCveDQIvW2so=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-bHRo6jRRP9WMKrrrtYI3EQ-1; Tue, 01 Sep 2020 06:05:44 -0400
X-MC-Unique: bHRo6jRRP9WMKrrrtYI3EQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C657864081;
 Tue,  1 Sep 2020 10:05:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-188.ams2.redhat.com [10.36.112.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16CAF5D9CD;
 Tue,  1 Sep 2020 10:05:40 +0000 (UTC)
Subject: Re: [PATCH] docs/system/target-avr: Improve the AVR docs and add to
 MAINTAINERS
To: Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 qemu-devel@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200812155304.18016-1-huth@tuxfamily.org>
 <f3f8e218-a78e-5a98-5b06-c588170f105a@vivier.eu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f07c67af-26d7-526c-d87c-821f217ab633@redhat.com>
Date: Tue, 1 Sep 2020 12:05:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f3f8e218-a78e-5a98-5b06-c588170f105a@vivier.eu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 23:17:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.13, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-trivial@nongnu.org, Sarah Harris <S.E.Harris@kent.ac.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/09/2020 11.15, Laurent Vivier wrote:
> Le 12/08/2020 à 17:53, Thomas Huth a écrit :
>> The examples look nicer when using "::" code blocks.
>> Also mention that "-d in_asm" only outputs instructions that have not
>> been translated by the JIT layer yet.
>> And while we're at it, also add the AVR doc file to the MAINTAINERS file.
>>
>> Signed-off-by: Thomas Huth <huth@tuxfamily.org>
>> ---
>>  MAINTAINERS                |  1 +
>>  docs/system/target-avr.rst | 47 +++++++++++++++++++++++---------------
>>  2 files changed, 30 insertions(+), 18 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 0886eb3d2b..5b21962bc6 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -171,6 +171,7 @@ AVR TCG CPUs
>>  M: Michael Rolnik <mrolnik@gmail.com>
>>  R: Sarah Harris <S.E.Harris@kent.ac.uk>
>>  S: Maintained
>> +F: docs/system/target-avr.rst
>>  F: gdb-xml/avr-cpu.xml
>>  F: target/avr/
>>  F: tests/acceptance/machine_avr6.py
>> diff --git a/docs/system/target-avr.rst b/docs/system/target-avr.rst
>> index dc99afc895..1410031f5e 100644
>> --- a/docs/system/target-avr.rst
>> +++ b/docs/system/target-avr.rst
>> @@ -17,21 +17,32 @@ https://github.com/seharris/qemu-avr-tests/blob/master/free-rtos/Demo/AVR_ATMega
>>  Following are examples of possible usages, assuming demo.elf is compiled for
>>  AVR cpu
>>  
>> - - Continuous non interrupted execution:
>> -   ``qemu-system-avr -machine mega2560 -bios demo.elf``
>> -
>> - - Continuous non interrupted execution with serial output into telnet window:
>> -   ``qemu-system-avr -machine mega2560 -bios demo.elf -serial
>> -   tcp::5678,server,nowait -nographic``
>> -   and then in another shell
>> -   ``telnet localhost 5678``
>> -
>> - - Debugging wit GDB debugger:
>> -   ``qemu-system-avr -machine mega2560 -bios demo.elf -s -S``
>> -   and then in another shell
>> -   ``avr-gdb demo.elf``
>> -   and then within GDB shell
>> -   ``target remote :1234``
>> -
>> - - Print out executed instructions:
>> -   ``qemu-system-avr -machine mega2560 -bios demo.elf -d in_asm``
>> +- Continuous non interrupted execution::
>> +
>> +   qemu-system-avr -machine mega2560 -bios demo.elf
>> +
>> +- Continuous non interrupted execution with serial output into telnet window::
>> +
>> +   qemu-system-avr -M mega2560 -bios demo.elf -nographic \
>> +                   -serial tcp::5678,server,nowait 
>> +
>> +  and then in another shell::
>> +
>> +   telnet localhost 5678
>> +
>> +- Debugging wit GDB debugger::
>> +
>> +   qemu-system-avr -machine mega2560 -bios demo.elf -s -S
>> +
>> +  and then in another shell::
>> +
>> +   avr-gdb demo.elf
>> +
>> +  and then within GDB shell::
>> +
>> +   target remote :1234
>> +
>> +- Print out executed instructions (that have not been translated by the JIT
>> +  compiler yet)::
>> +
>> +   qemu-system-avr -machine mega2560 -bios demo.elf -d in_asm
>>
> 
> Applied to my trivial-patches branch.
> (I have removed the trailing whitespace)

Great, thanks! I saw the mail from patchew, but never got around to send
a v2 with the space removed...

 Thomas


