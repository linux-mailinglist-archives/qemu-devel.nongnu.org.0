Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C853E2E7B
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 18:43:38 +0200 (CEST)
Received: from localhost ([::1]:44044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC2wb-0001SH-J5
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 12:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC2vq-0000lt-7E
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 12:42:50 -0400
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:35640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC2vo-0006yo-Lk
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 12:42:49 -0400
Received: by mail-lj1-x230.google.com with SMTP id x9so10769021ljj.2
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gcOFKcAmGuAuWOdPjlXYvMDeJkZUKX2NfQDFtCpzD38=;
 b=rjcOh1YKSc+AHv10ASqqwkIGyMyfrmXLDPbxmOj3Ell6QmJQ3o9QZfbiDNmyenrCfu
 tjKhMXbWkzHfGc1Hx6kUfI/pT2SEQLtEgAZqWaxLapQ0bNwLL+38jtOjvyKiPsAScXYV
 y6amvPXlUts839oSL9VERQGMZqAH5mRLTglyowXOnDGePsu6EpoWJ8Aa98aqrcEOZhQs
 iOSdbWZqJotaE2WeMZ6tcwrou1eNIxYszmYhNlHkoqW+DOKC7CZxgPYasAGdWFRtUuJs
 YiOYtZyA8VQWVONSOGnOgqaWkSYTBWJ83RjDpuKSIGa0U9qvBWxJlkP7b45QIgadkn05
 sU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gcOFKcAmGuAuWOdPjlXYvMDeJkZUKX2NfQDFtCpzD38=;
 b=nVuHlJdM0fhSgVnyvXDOK8aDJTYg6FvMLJw7foPUnSIwhMHNP+pXdbAH//PmJXuK8O
 7NYW2xj2L1i+9O9oScP8AVuRSbgt0ZKXkctZSxFzUh/ZATyxwEzENPoU2D1SVzdncILU
 CKB/UDpxfSSofsrRJ6Gw+7fDbRhJ1emT8OWyxB61SuBz42lQ1w+Pydu9jg+L1Le21tf8
 gRpc8eZQfeYzyo6frfMezkBqQ4uK1EhGnjCY1uMFqSmkxZn2D0kbwyM1aYFYD6OOd8S9
 rzNayz/hkxvaOL/6pFFcpqzoothtwBR8CJWjdJzv3Vzrqi7+tkTUryqx2/PK6JIIA67F
 egWw==
X-Gm-Message-State: AOAM530cueuq1Tr3rzq306rldeDYqYOUvbEUMZTkvGxVn4yveizWx9vx
 cs0uJPBqPV4CcCnw7K3a/Eg=
X-Google-Smtp-Source: ABdhPJytE0KvIqQ5JWIrZCv3Nb0cuYrW89zGT5xmFEC6DjNB45gK8V3cJ32DITY50LUit5GYvfoHZQ==
X-Received: by 2002:a05:651c:211d:: with SMTP id
 a29mr7174469ljq.78.1628268167145; 
 Fri, 06 Aug 2021 09:42:47 -0700 (PDT)
Received: from [10.101.1.184] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id v19sm880177lfg.134.2021.08.06.09.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 09:42:46 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] docs/devel: create "Developing QEMU" subsection
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210806155132.1955881-1-jsnow@redhat.com>
 <20210806155132.1955881-3-jsnow@redhat.com>
 <6a221103-09f6-7a5d-5739-143818b67514@amsat.org>
Message-ID: <3a93e2ec-9583-ffa3-11fd-1f145d3083d1@amsat.org>
Date: Fri, 6 Aug 2021 18:42:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6a221103-09f6-7a5d-5739-143818b67514@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lj1-x230.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 6:40 PM, Philippe Mathieu-Daudé wrote:
> On 8/6/21 5:51 PM, John Snow wrote:
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  docs/devel/index.rst               |  6 +-----
>>  docs/devel/section-development.rst | 12 ++++++++++++
>>  2 files changed, 13 insertions(+), 5 deletions(-)
>>  create mode 100644 docs/devel/section-development.rst
>>
>> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
>> index 008d489d751..57016edd841 100644
>> --- a/docs/devel/index.rst
>> +++ b/docs/devel/index.rst
>> @@ -10,9 +10,7 @@ modifying QEMU's source code.
>>     :includehidden:
>>  
>>     section-community-governance
>> -   build-system
>> -   style
>> -   kconfig
>> +   section-development
>>     testing
>>     fuzzing
>>     control-flow-integrity
>> @@ -20,11 +18,9 @@ modifying QEMU's source code.
>>     memory
>>     migration
>>     atomics
>> -   stable-process
>>     ci
>>     qtest
>>     decodetree
>> -   secure-coding-practices
>>     tcg
>>     tcg-icount
>>     tracing
>> diff --git a/docs/devel/section-development.rst b/docs/devel/section-development.rst
>> new file mode 100644
>> index 00000000000..bba4fea30cb
>> --- /dev/null
>> +++ b/docs/devel/section-development.rst
>> @@ -0,0 +1,12 @@
>> +Developing QEMU
>> +===============
>> +
>> +.. toctree::
>> +   :maxdepth: 2
>> +   :includehidden:
>> +
> 
> Could we order from generic to specific?

Oh this is alphetically sorted, nevermind.

