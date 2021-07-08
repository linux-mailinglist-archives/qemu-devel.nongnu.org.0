Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FFD3C1570
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:48:12 +0200 (CEST)
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VJz-0007U7-2A
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1VJ3-0006oE-9D
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:47:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m1VJ1-0006Sw-EO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:47:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625755630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jOTaMNLjsPBm1n9SAvPQa9elntJ+tUTrRYOu51HGyo=;
 b=Fc5mD1kPh2e5tjB+YWp2/tTD3kvWtLjdREhqi8fYRUpNk7R4m2elGfb93ILADQg4iD1eM5
 sJrVbTd2CMd8YuTNBsGmdiLmPIVzA6BToR9kyJWO/6IOD5qTOqhtIpCFu1xlMKmumRrv0/
 XRJ8DmGKlnzUH5F7tTna/o08ImFoJls=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-7gVaeGhoNTSeUcs8Iy-UKw-1; Thu, 08 Jul 2021 10:47:06 -0400
X-MC-Unique: 7gVaeGhoNTSeUcs8Iy-UKw-1
Received: by mail-qk1-f198.google.com with SMTP id
 b6-20020a05620a1186b02903b429a7ee4bso4086258qkk.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 07:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+jOTaMNLjsPBm1n9SAvPQa9elntJ+tUTrRYOu51HGyo=;
 b=KYOsNb7VWw67A8M/Tv7Dc8A64PkOQQS2mqIItCEw8GJuUG56RNvec0TQD1L3pojTIB
 wW6mdMn2bseZB55tNSngQFDq0bjUjtIuzuHmLC0Zu6habOSe6v2qHOc88ewt4JvleT1s
 su6Tb77SRS1+8jZxSc+g/oaEXv1T2d3v/2izqJSuWDKGwE/o5+aQtv4OSRdTuUMcrURy
 dlKgz59meAEx7RPhFWE4rjXqIOCWBCgvU+T7YZbXKyCtYysR5ykjnCLS3yeD3BgYRQUI
 oY86NU4/hKXvoSM8mAX7rhowrTTp/gUahR+k4YS1uJ+YJsgidCz7TdaiWDFV/bGaOD1R
 ooSA==
X-Gm-Message-State: AOAM532YdYh0Apffh6YBBbijVAGb50Kq0ruJzYJTK0Cc1qnpza/BoDxy
 l76QB1xBIC9JBMryjkuj6p/cpy1+gDnErHDXCUigFWXN4X+T6GKWiFU8vTdXQrlRID0C0gfMzjW
 DwwBcjnbDa1v+3p0=
X-Received: by 2002:a37:b42:: with SMTP id 63mr32690600qkl.325.1625755625681; 
 Thu, 08 Jul 2021 07:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySp34U253X+T6Obl8VO6XVos3klMsRwykRWSQuceDpFvT9xUk6b23QTg1HimxczmwAeEyHIg==
X-Received: by 2002:a37:b42:: with SMTP id 63mr32690573qkl.325.1625755625455; 
 Thu, 08 Jul 2021 07:47:05 -0700 (PDT)
Received: from p50.localhost.localdomain
 ([2601:18d:8a00:ab70:b677:d979:630:695c])
 by smtp.gmail.com with ESMTPSA id s19sm1050649qkg.134.2021.07.08.07.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 07:47:04 -0700 (PDT)
Subject: Re: [PATCH 2/3] Acceptance Tests: move definition of distro checksums
 to the framework
To: Auger Eric <eric.auger@redhat.com>, qemu-devel@nongnu.org
References: <20210414221457.1653745-1-crosa@redhat.com>
 <20210414221457.1653745-3-crosa@redhat.com>
 <c8ec5d7f-3ae7-49da-e10e-717789694793@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <0383a140-5007-1257-5911-8eb94c1cb7aa@redhat.com>
Date: Thu, 8 Jul 2021 10:47:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c8ec5d7f-3ae7-49da-e10e-717789694793@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 4/22/21 3:56 AM, Auger Eric wrote:
> Hi Cleber,
>
> On 4/15/21 12:14 AM, Cleber Rosa wrote:
>> Instead of having, by default, the checksum in the tests, and the
>> definition of tests in the framework, let's keep them together.
>>
>> A central definition for distributions is available, and it should
>> allow other known distros to be added more easily.
>>
>> No behavior change is expected here, and tests can still define
>> a distro_checksum value if for some reason they want to override
>> the known distribution information.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>   tests/acceptance/avocado_qemu/__init__.py | 34 +++++++++++++++++++++--
>>   tests/acceptance/boot_linux.py            |  8 ------
>>   2 files changed, 32 insertions(+), 10 deletions(-)
>>
>> diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
>> index aae1e5bbc9..97093614d9 100644
>> --- a/tests/acceptance/avocado_qemu/__init__.py
>> +++ b/tests/acceptance/avocado_qemu/__init__.py
>> @@ -299,6 +299,30 @@ def ssh_command(self, command):
>>           return stdout_lines, stderr_lines
>>   
>>   
>> +#: A collection of known distros and their respective image checksum
>> +KNOWN_DISTROS = {
>> +    'fedora': {
>> +        '31': {
>> +            'x86_64':
>> +            {'checksum': 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0'},
>> +            'aarch64':
>> +            {'checksum': '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'},
>> +            'ppc64':
>> +            {'checksum': '7c3528b85a3df4b2306e892199a9e1e43f991c506f2cc390dc4efa2026ad2f58'},
>> +            's390x':
>> +            {'checksum': '4caaab5a434fd4d1079149a072fdc7891e354f834d355069ca982fdcaf5a122d'},
>> +            }
>> +        }
>> +    }
> assuming we may put other data like kernel params and maybe pxeboot URL,
> this may grow rapidly, Maybe we should put that in a different file?


Hi Eric,


Sorry for the monstrous delay here.  You and I are thinking alike, but 
I'm planning to handle this on the Avocado side.  I'm writing a 
BluePrint[1] for what would be a revision of the Avocado asset API.  In 
that new proposal, data files (some builtin, some external) would be 
used to contain information about known assets.


So, for now, I think it's better to keep this AS IS.  Let me know if 
this works for you.


Thanks,

- Cleber.


[1] - https://github.com/avocado-framework/avocado/issues/4458



