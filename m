Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9B30A11
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 10:17:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWcjd-0005GC-4O
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 04:17:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWcgr-0003dU-Pe
	for qemu-devel@nongnu.org; Fri, 31 May 2019 04:15:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWcgq-0006MY-Pf
	for qemu-devel@nongnu.org; Fri, 31 May 2019 04:15:05 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34414)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hWcgq-0006LJ-HH
	for qemu-devel@nongnu.org; Fri, 31 May 2019 04:15:04 -0400
Received: by mail-wm1-x344.google.com with SMTP id e19so7132175wme.1
	for <qemu-devel@nongnu.org>; Fri, 31 May 2019 01:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=yqiRe5OgaB/dmM0M59VMBOOk9ZeiW/PQd52uRaMYFjc=;
	b=d2XDU7mphXAOY5t/VNoSLNy6MbV6V+A5h4IdOqt43bv1LIGuE/fCdnsdLiu5OwGpsc
	q1Mr59Hc12u49Umig8REpz+zChzs3lt7/9WASPTnkzmWPVP+MnwK81RonfID5DLLmkta
	O/1UVOoZBHvb5sa9q63TAuWYIiPwhS7+Mlv4aIzbccyceoyDNlu1hbZzmIIUsWmb0Nrq
	xWUcKh6cH6joPU2BwrXtwTWe1ARjVDWUdO55qvBWxYyDm0rqIs0Uwa7XlBgTT4sPvL+X
	bCc9gUWphHfx7SjfTqYebJftD/kchUQC7ApnMayPYKYS2AD+neKBJJ9+N0iJouhkC0YQ
	9XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=yqiRe5OgaB/dmM0M59VMBOOk9ZeiW/PQd52uRaMYFjc=;
	b=HQEKfpNODOGdUo9kgi4T7ahg4H+LWxX7VhzrcqFWmA1uiKwPOanNJh80EyWX5xSvsO
	08mOSA/6H2PycHQC9PI7HdNnM5ScGmpJwZ2oQqtSM8WAXvSBZ9dcMxp1oWvvcrHRP1sj
	IshwjYk+qtyvxuo7rRqzDIogdHhI5BWiYt+iH9MXIWNqoU3trOco7vvAPz/SqqGsnGj7
	jJggVISKWdMKf4cEMTsu3L9ecM3x+sbjUtUWkXwh/Bz1gQ4eJUxj9bmjSNOp21vzEVkz
	AosBW8HqfBw+7I1y9kjmorCRLwqHddoofwPOld5hFlghlQ7HM1X2eVdRRhzVy/y4xhd2
	i6Sw==
X-Gm-Message-State: APjAAAUxZSAwvSsdg8q6Gw64OZjVzjAtO4NqNP3fazoJbgx+A/dSsoBW
	qz66aH1WepTG/JVJ3S5LB18COQ==
X-Google-Smtp-Source: APXvYqywEwzOMpG4Ik/D4OzH+32fh7r3BHFQBxNL62Qx+J7X4FTC5LI+/B5z9HKQSbxmVB9I2pRFqQ==
X-Received: by 2002:a1c:228b:: with SMTP id i133mr4856652wmi.140.1559290502684;
	Fri, 31 May 2019 01:15:02 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	h12sm4225202wre.14.2019.05.31.01.15.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 31 May 2019 01:15:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3D3271FF87;
	Fri, 31 May 2019 09:15:01 +0100 (BST)
References: <20190530101603.22254-1-alex.bennee@linaro.org>
	<20190530101603.22254-21-alex.bennee@linaro.org>
	<6c2efee2-31bb-68f2-12d0-684ca5959ad4@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
In-reply-to: <6c2efee2-31bb-68f2-12d0-684ca5959ad4@redhat.com>
Date: Fri, 31 May 2019 09:15:01 +0100
Message-ID: <87y32n3ure.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v1 20/26] tests/vm: add DEBUG=1 to help text
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi  Alex,
>
> On 5/30/19 12:15 PM, Alex Benn=C3=A9e wrote:
>> From: Gerd Hoffmann <kraxel@redhat.com>
>>
>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Tested-by: Thomas Huth <thuth@redhat.com>
>> Message-Id: <20190520124716.30472-9-kraxel@redhat.com>
>> [AJB: fix minor conflict]
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  tests/vm/Makefile.include | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
>> index e329129bd65..628eecade78 100644
>> --- a/tests/vm/Makefile.include
>> +++ b/tests/vm/Makefile.include
>> @@ -25,6 +25,8 @@ vm-test:
>>  	@echo "  vm-boot-ssh-<guest>             - Boot guest and login via ss=
h"
>>  	@echo
>>  	@echo "Special variables:"
>> +	@echo "    DEBUG=3D1                       - be verbose, also start in=
teractive"
>> +	@echo "	                                   shell on build failures"
>
> Patch 12 of this series (tests/vm: Add missing variables on help)
> already added this, it now appears 2 times:
>
> Special variables:
>     DEBUG=3D1                       - be verbose, also start interactive
>                                            shell on build failures
>     DEBUG=3D1                      - Enable verbose output on host and
> interactive debugging
>
> This one is more precise although...

Oops merge failure - will fix that.

>
>>  	@echo "    BUILD_TARGET=3Dfoo		 - Override the build target"
>>  	@echo "    TARGET_LIST=3Da,b,c    	 - Override target list in builds"
>>  	@echo '    EXTRA_CONFIGURE_OPTS=3D"..."'
>>


--
Alex Benn=C3=A9e

