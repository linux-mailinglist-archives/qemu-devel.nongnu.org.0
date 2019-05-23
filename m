Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013127939
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 11:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60504 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTk3y-0007S4-4h
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 05:31:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTk2R-000752-DG
	for qemu-devel@nongnu.org; Thu, 23 May 2019 05:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTk2Q-0005nd-4U
	for qemu-devel@nongnu.org; Thu, 23 May 2019 05:29:27 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hTk2P-0005jN-ET
	for qemu-devel@nongnu.org; Thu, 23 May 2019 05:29:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id j187so5009944wmj.1
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 02:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cd2Tqu1K8ZBcZpPPVYcjLx8XCLZjsoiUkNI6k5j8kv0=;
	b=nbTAM7XQOLb5eYgUGwM+1lLCpjCU5tgg6SVJQWLqtMxQUH2nrEDlv4Do9YFP+vcbRs
	aFIPvCtBF8lDFyEfv9n+e9GrfYEc/nCHlkBQBk2lshT6D/Rox49IcCY5mMcxdUzl41K4
	Oc8ioQsWYAnOj34Vpi9kMxP2QFkeGO+YpjsqaEhipJ5jFpFgOGisvZ9eMu3vLeiOeZfO
	0QZwO0JKU/EnJwNQP8h50f9nGq5JWp809D4aRIjQggeQHsoXiItKiUL9SBiV5FA6V01W
	CZSjftByV0g+xZNlIFDfE1YcCTEC/VlAll2qPXeYfDP7myCLXmsoYSHA1jY9XNtRvNJx
	9m+Q==
X-Gm-Message-State: APjAAAUk2YMcTMqkLyNKbPCs14Uh4N9ZEbcoCKuy00hRQMbDQf5Q3vVm
	U1VGwhnCjBre1TBFZaC2qTFG5A==
X-Google-Smtp-Source: APXvYqyUsWPDD3C5IAGcAeGA+n8cS039aNJJSqClYNwTpN5OBNWLKq3RJFvG9iNbyumL156wcyrSPA==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr10932424wmk.56.1558603764243; 
	Thu, 23 May 2019 02:29:24 -0700 (PDT)
Received: from [192.168.1.38] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	a128sm10054948wmc.13.2019.05.23.02.29.23
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 02:29:23 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190312234541.2887-1-philmd@redhat.com>
	<20190312234541.2887-3-philmd@redhat.com>
	<20190522205234.GY10764@habkost.net>
	<1204725743.24201394.1558559144548.JavaMail.zimbra@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1088d160-20c1-00ed-b494-fede1a3a8410@redhat.com>
Date: Thu, 23 May 2019 11:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1204725743.24201394.1558559144548.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test: add a test
 for the Raspberry Pi 2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/22/19 11:05 PM, Cleber Rosa wrote:
> ----- Original Message -----
>> From: "Eduardo Habkost" <ehabkost@redhat.com>
>> On Wed, Mar 13, 2019 at 12:45:41AM +0100, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
>>> board and verify the serial is working.
>>>
>>> If ARM is a target being built, "make check-acceptance" will
>>> automatically include this test by the use of the "arch:arm" tags.
>>>
>>> Alternatively, this test can be run using:
>>>
>>>     $ avocado run -t arch:arm tests/acceptance
>>>     $ avocado run -t machine:raspi2 tests/acceptance
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> We're getting timeouts on travis-ci:
>> https://travis-ci.org/ehabkost/qemu/jobs/535468057#L3289
>>
>> I don't know yet if the guest is hanging, or if we just need to
>> increase the timeout.  I could reproduce the timeout locally,
>> too.

That's odd, I can't reproduce (this test is quicker than the following
test_arm_emcraft_sf2 which start u-boot then timeouts and start the kernel).

My guess is network issues, since this test use a different mirror:
archive.raspberrypi.org

Gerd already raised this problem (timeout reached while fetching
artifacts) to Cleber.
Cleber, can we add test_setup() methods that use different timeouts?

Regards,

Phil.

> It may be related to:
> 
>  https://bugs.launchpad.net/qemu/+bug/1829779
> 
> And this is a proof that we urgently need to have a better
> way of presenting/storing test artifacts.  The brief output
> is nice when everything goes well, but makes the test results
> close to useless once a failure happens.
> 
> Philippe showed us how GitLab allows CI jobs to preserve
> artifacts, so maybe the solution is to move the loads there.
> 
> - Cleber.
> 

