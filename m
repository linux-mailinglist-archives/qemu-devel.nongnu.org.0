Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60ED4A9D02
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 17:36:53 +0100 (CET)
Received: from localhost ([::1]:39744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG1Zs-0004ou-I3
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 11:36:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG1Ed-0006MB-K0
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:14:55 -0500
Received: from [2607:f8b0:4864:20::102f] (port=40901
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG1Eb-0004ZG-N4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 11:14:55 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 p22-20020a17090adf9600b001b8783b2647so329139pjv.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 08:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A48n56ShTg8Ha2bVHWvOkDcZnHJ273vrE5RWm3PS//w=;
 b=M2jvuCTjrSC0Sj9N7OWup5ZcEOSiHqH0gtw8lQd1I4BeSsmZ+2DpqyGVP/K/alqE5q
 4VdJf0/2gLyCTbkifwq1k44KYE5ABOAwCIjrpAUU/XW381/1Eu5ZqGCdtmObFRpIN08X
 GoDl75vV2USq7N6Fn9gUa3QMfIttaOAkqltTejPVYA75lhDXL7B2wv7xxMJszBraZURe
 plXlHb/I5yYeqWAytYj3y7MGpyD8IEpPzxe/ETFYiuCoL0YM+c83ZV8eZ1EnmUdq8A0e
 Bu3QqLUQtJ9OsOu+1ZHcUUor0ewFOkNN58mU+ZxiqxvgpssOCdWueGKBMBmEdtu38mzr
 cyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A48n56ShTg8Ha2bVHWvOkDcZnHJ273vrE5RWm3PS//w=;
 b=N2z9UvULqXMf4FgHouFNyp7sA7z3RqFSBY2eN2wK5DRuFblkjvh80K9DR2gY9cmMqq
 Lao9dAu2JjRHgSlnIW/CQAB4hWBhkhMuTca5DJqGOo1RWKjUtQprj7gGBYQ36FAFNjl+
 O2CqVqi4vGCjCUg0DnZTLD1a7CJXy8NmpNlEgizGbSpu2INW4PfYrQztLtLFxP4KGg9f
 TS+rFCmt+lMpc4pKnxxNxXSWkkWrUudXrI7/L4UzF7Cqz71CYDTOP2Hy0zAZCrx+6Qa4
 6FjTOAmWa/ESY8wfnQpZQ9dF4J4BBlZ4V9bLAPJ5KoJFOVePOyhzsohoNSEQFaUmy0Cd
 +T9w==
X-Gm-Message-State: AOAM533tZfu8zgpF5UBhEA5TpBpl0T0smYVEFBgrbQ60CbU4KjL2rq89
 8mhxoWiGkS55P2Yptt4AMkU=
X-Google-Smtp-Source: ABdhPJx6TEIPd3otlsSoGGEARiyX/jvyf6ZQcKdiv1sLlJ4YfbiU9InjZghxnp0JaHIiXgg0/Dr5SQ==
X-Received: by 2002:a17:90b:4b4a:: with SMTP id
 mi10mr3830853pjb.103.1643991292413; 
 Fri, 04 Feb 2022 08:14:52 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d20sm3246089pfv.74.2022.02.04.08.14.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 08:14:52 -0800 (PST)
Message-ID: <cda5c6b8-1f8c-bc43-f7ea-f4db4180c640@amsat.org>
Date: Fri, 4 Feb 2022 17:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 3/4] qom: Remove user-creatable objects from user emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-4-f4bug@amsat.org>
 <ef2f4459-9c30-c9c1-73cb-02d439ec3a92@redhat.com>
In-Reply-To: <ef2f4459-9c30-c9c1-73cb-02d439ec3a92@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 16:56, Thomas Huth wrote:
> On 04/02/2022 16.29, Philippe Mathieu-Daudé wrote:
>> user-mode don't use user-creatable objects. Restrict it to
>> sysemu / tools.
>>
>> Add a stub to avoid a link failure with the global callback:
>>
>>    /usr/bin/ld: libqom.fa(qom_object.c.o): in function 
>> `object_initialize_child_with_propsv':
>>    ../qom/object.c:578: undefined reference to `user_creatable_complete'
>>    /usr/bin/ld: libqom.fa(qom_object.c.o): in function 
>> `object_new_with_propv':
>>    ../qom/object.c:801: undefined reference to `user_creatable_complete'
>>    collect2: error: ld returned 1 exit status
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   qom/meson.build           | 7 ++++++-
>>   qom/user_creatable-stub.c | 8 ++++++++
>>   tests/unit/meson.build    | 2 +-
>>   3 files changed, 15 insertions(+), 2 deletions(-)
>>   create mode 100644 qom/user_creatable-stub.c
>>
>> diff --git a/qom/meson.build b/qom/meson.build
>> index 062a3789d8..afc60cc19d 100644
>> --- a/qom/meson.build
>> +++ b/qom/meson.build
>> @@ -2,9 +2,14 @@ qom_ss.add(genh)
>>   qom_ss.add(files(
>>     'container.c',
>>     'object.c',
>> -  'object_interfaces.c',
>>     'qom-qobject.c',
>>   ))
>> +if have_system or have_tools
>> +  qom_ss.add(files('object_interfaces.c'))
>> +else
>> +  qom_ss.add(files('user_creatable-stub.c'))
>> +endif
> 
> Could you please name the new file object_interfaces_stub.c, so that it 
> is clear that they belong together?

Sure!

