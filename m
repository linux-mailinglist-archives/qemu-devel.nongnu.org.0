Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BDA649AD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 17:33:00 +0200 (CEST)
Received: from localhost ([::1]:34700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlEaZ-0003m0-8z
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 11:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40251)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hlEWM-000224-II
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 11:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hlEWH-0008Ud-DQ
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 11:28:36 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38431)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hlEWF-0008Rh-Hz
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 11:28:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id g17so2936872wrr.5
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=N+axIsmspJNWrf3vQ3lnMUakwvsR7XUOTzVQYy84HVs=;
 b=uMuYxyB8NqMwv0hE6vqwixkRjJmVay9V5ZrYhAxNqjSewN9OwLwk7w8K7AEEG9qiA+
 Zo1sjs+roe1BM9cdRyQd/FtH0h1tHVnzj5KJ7QkDUHzSzVSTEZCHMzYQsYgJDF45p7rF
 C3i5iCQlPrU7q+xZi9q4W+zeDmBOuHjIf/jvr4YW76aYhg+mJ6Jul/778gbjnHaOn9yn
 7lN+x77NUQh2NeeTFS78BBPGkJ0uaK5ghM9q4RHUlT3wcGAuTZkYqCUHP/HDx7vcNX04
 WkupNTs6BmorO0uKGVQn4aTVWcFVNPLlGAAOg8kfFEHQME32Irf07R8IyurmM/EsXF/f
 AgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=N+axIsmspJNWrf3vQ3lnMUakwvsR7XUOTzVQYy84HVs=;
 b=PSLJuNF1Yh2YKdgBS6hMeOqoQKaxEFPMfn8GAdKYbV1hXSri6RdE1gNIDd+pusd9Z6
 q3DIPSp899f0qmXsVY7CAYN3DfKesEkbjsX096qNty8REtqLuVWfyUOleqrdWrZoVp5Z
 kQTguVLsTLiT5sGSp7+JoL553oyVCQNz0qPDpGhz3NT8RMPtJsgcHytvYwmPOm8IrOtl
 TBN1Dzam9KJtxK2eyW/zS3ND3spI5aivWkUAuDMfx+8cqhstRw+ZZrg4s9296KaURiN9
 BTn/I6MA8EmV+y8qii+HFF95nc9usWBshQVb3Ir72pXx19KKBdn61BfP+UdGQa5uyB8g
 WUIQ==
X-Gm-Message-State: APjAAAUlFDZ8+dDRL9Am+cC3akxtd6AeamUs/CO8l3on50q4PqVQC0ey
 n94CLLPRLBAdo4+dUVialz+pYA==
X-Google-Smtp-Source: APXvYqxdZh0JEHbyX4/dcm9DOamXb9yWD4ZtHp8EWX/SpAX3ZCsuP1VFTAOmp7cau0b1QNgljKdJ+w==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr32310176wrl.134.1562772508710; 
 Wed, 10 Jul 2019 08:28:28 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id x24sm2656648wmh.5.2019.07.10.08.28.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:28:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97B621FF87;
 Wed, 10 Jul 2019 16:28:27 +0100 (BST)
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-5-alex.bennee@linaro.org>
 <aec9314d-c1e9-2521-6170-d8ce6be97a97@linaro.org>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
In-reply-to: <aec9314d-c1e9-2521-6170-d8ce6be97a97@linaro.org>
Date: Wed, 10 Jul 2019 16:28:27 +0100
Message-ID: <87k1cpewo4.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v1 4/5] gdbstub: add some notes to the
 header comment
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
Cc: qemu-arm@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 7/5/19 6:04 PM, Alex Benn=C3=A9e wrote:
>> Add a link to the remote protocol spec and an SPDX tag.
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  gdbstub.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 8618e34311..ea3349d1aa 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -1,6 +1,10 @@
>>  /*
>>   * gdb server stub
>>   *
>> + * This implements a subset of the remote protocol as described in:
>> + *
>> + *   https://sourceware.org/gdb/onlinedocs/gdb/Remote-Protocol.html
>> + *
>
> Ack.
>
>>   * Copyright (c) 2003-2005 Fabrice Bellard
>>   *
>>   * This library is free software; you can redistribute it and/or
>> @@ -15,6 +19,8 @@
>>   *
>>   * You should have received a copy of the GNU Lesser General Public
>>   * License along with this library; if not, see <http://www.gnu.org/lic=
enses/>.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>
> Nack.  The text is for the LGPL.

Fixed in my PR.

--
Alex Benn=C3=A9e

