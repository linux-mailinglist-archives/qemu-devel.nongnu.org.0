Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B129F36DE8E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:42:44 +0200 (CEST)
Received: from localhost ([::1]:49780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lboCx-0000LM-ST
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbnfA-0002Df-EU
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:51 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lbnf3-0007BW-Ma
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:07:46 -0400
Received: by mail-wr1-x42e.google.com with SMTP id t18so6255769wry.1
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0n4HPsiMUurLCez+azn1wC921bP3LlfEDDN0BGdvAXQ=;
 b=YfP9PGzfoT+8GQ2EbgR5+0GcQiSHNTjtAAAsUMLcWnBrjk9nCdC9Ajp/p8GWbxXNcR
 b2jHbprRqZaLvWxJdIJ0Cdsd6YF6rvtthg/ebGn8/qq65OFoD0cx74/dbjj0mQFeVngP
 8uyN37aO87YSGO+uvsgNXYPRxq6QX8lwZ6LSQUPSDGIYGPa/9LAdrLefaaBmAXL4KReK
 8ayKJ9iPpE/rkK1KVoAyyLInSWIr1A7yFto3pDL+wQzpGTXGgOh3oR2ird6S/1CxiZnZ
 SDgRFyorU1BU46/LfViZiKBb9ot+FLKLwbaXpRHpStGiT6dAk90VcFZYwl/64FRMWrXK
 syRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0n4HPsiMUurLCez+azn1wC921bP3LlfEDDN0BGdvAXQ=;
 b=Ra3rJWF8WEtvY4sJmsqXyo1uQRZ+BsirSY9MAdzrZyrsbptT+1Cop+wyTlMc/oQAfk
 203jQ1eXOHXkneVFUQkL/uMOgKmowhWdwBDcNhdWUO79b7nL+g10ri3PMO4ZrlSLOtNU
 tHPV2n4wOrlhSV9Jci3Wr2MHS00ON/h2baslgGUCrzRh2RHhk25oBO1/LsMQLpcI8mVw
 ebwOQUAH9DPFC5Ai9ia6dx9n229LrT1t4c9OFzsexkhwKfDOVRD6V4PEeF4IWmdl24aX
 HtPBzCsyZ9PGEyk1bgN4WQ4iq2jbCk04RzDtUM1/hz3FwJjNDqQgkrWkK4KWRoFKpTIa
 xb9Q==
X-Gm-Message-State: AOAM5326PTbS1hYPwpqUwXbkxzddupDqiJK5R78FYRTRCAx3AI/QkTcX
 dPx/HCVZa8/nH9TyzG58q3fK8A==
X-Google-Smtp-Source: ABdhPJypcEEnb0eae7v3i15JuGdFBFsP+NCnlCyQW3SjsvRGoYcdCNC2bsr4YOuFXFCet1OFKOewqQ==
X-Received: by 2002:adf:e5c1:: with SMTP id a1mr26207648wrn.59.1619629659964; 
 Wed, 28 Apr 2021 10:07:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i14sm7046121wmq.1.2021.04.28.10.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:07:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A8C9B1FF7E;
 Wed, 28 Apr 2021 18:07:38 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if
 TCG is selected
Date: Wed, 28 Apr 2021 18:06:55 +0100
In-reply-to: <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com>
Message-ID: <874kfqs5gl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang?= =?utf-8?Q?=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 "Emilio G . Cota" <cota@braap.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Alex, Richard, do you mind reviewing this one please?

Isn't it already merged (with my r-b tag no less ;-)

  f77147cd4de8c726f89b2702f7a9d0c9711d8875
  Author:     Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
  AuthorDate: Fri Jan 22 21:44:31 2021 +0100
  Commit:     Paolo Bonzini <pbonzini@redhat.com>
  CommitDate: Mon Feb 8 14:43:55 2021 +0100

>
> On 4/15/21 6:33 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>=20
>> The previous attempt (commit f77147cd4de) doesn't work as
>> expected, as we still have CONFIG_TCG=3D1 when using:
>>=20
>>   configure --disable-system --disable-user
>>=20
>> Now than we have removed the use of CONFIG_TCG from target-dependent
>> files in tests/qtest/, we can remove the unconditional definition of
>> CONFIG_TCG in config_host.
>>=20
>> This avoid to build a bunch of unrequired objects when building with
>> --disable-tcg (in particular the softfloat tests):
>>=20
>> Before:
>>=20
>>   $ make
>>   [1/812] Generating trace-qom.h with a custom command
>>   ...
>>=20
>> After:
>>=20
>>   $ make
>>   [1/349] Generating trace-qom.h with a custom command
>>   ...
>>=20
>> A difference of 463 objects...
>>=20
>> Reported-by: Claudio Fontana <cfontana@suse.de>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> v3: Include Paolo's feedback:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html
>> therefore o not include Alex's R-b tag.
>>=20
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Emilio G. Cota <cota@braap.org>
>> ---
>>  meson.build | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/meson.build b/meson.build
>> index c6f4b0cf5e8..623cbe50685 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -262,7 +262,6 @@
>>                          language: ['c', 'cpp', 'objc'])
>>=20=20
>>    accelerators +=3D 'CONFIG_TCG'
>> -  config_host +=3D { 'CONFIG_TCG': 'y' }
>>  endif
>>=20=20
>>  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
>>=20


--=20
Alex Benn=C3=A9e

