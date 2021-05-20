Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9941638ABCB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:30:09 +0200 (CEST)
Received: from localhost ([::1]:42252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgsS-0007wq-2z
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljgpg-0005jV-1s
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:27:17 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljgpb-00068M-US
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:27:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i17so17244426wrq.11
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p67oOBLUZF/8PGnCGnpjkL6MCAxivHrFEfmO+lpBLPM=;
 b=NNrnmlz2/OKlCxu552CMMuRlT4lvEvencBD1PYnVDFfAGuJ4Ort7nBMYXSTYxQ4gd+
 1Owv6+8J7X6l6HCAUnEf83ZCTyGDz00whjYTzk0W0dZxU9ew1n2ZxDS+LBoHSo32Zj70
 GsyuYl+2dfgTFu9t0XyUZbVNIpnpnesaKD9oX5OUQ1KReEYxYVXLPIxnDcExuGaboijf
 qdFWz1DX7OxtVjoN4hXufLChpG1DoTWnQxI2Kc1JAbMvQaAbG1LRcPI2kNVBvURR3lw8
 1xR36kRvK4BF/qY/EksZ3IiiSS2aDLAtC8wjnbRiSwxUoWACicnJCJTRyJgs7+XP0w16
 Jkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p67oOBLUZF/8PGnCGnpjkL6MCAxivHrFEfmO+lpBLPM=;
 b=PzPABV/GUun7+UmAY6dNM1bHOaB7XBBevDMcyjf1AyvlFyF0wnf/FR+168xbh5gSQW
 OE/VuVf164SpJTPTynfLYpvIu8JUN4HR4iH94tn25FvtbkKESeJX3Tl7OqiM9Zsr9dVb
 T/Rbg+PTI7Gsq2s6CmPhL8bcK7xb0Rv8YzzaqGelNvy8Suk5dOEhZIP+9HXOkT9pd7eQ
 KS014b7Egr0L72SkW13MEXt8HW05tTAfLKrodYW8X3nsw5Id057tjzN4Lc/a7Hw+etDG
 ogUjQDMwfL3H06COb7nPu+S2cnsA8DQBZA/pJPgSOj6HW5DjC3HYqia+i72imkT6sdYY
 /fvw==
X-Gm-Message-State: AOAM532n/o0LkSrW4ghWxTeM5SMKawRIQCnfOB4QFoNtDpsqndBnVD08
 1AbOIWSLrCo+wv6ztTV7rGc=
X-Google-Smtp-Source: ABdhPJxars3ikztwnAnMPgYK4Z/cr0GxgTmYKXyQoJTqsb55JZY5HuBAF+YeZ6+JNVfntIaHcxaYxg==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr3777468wrn.337.1621510026371; 
 Thu, 20 May 2021 04:27:06 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n189sm2364192wme.9.2021.05.20.04.27.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 04:27:05 -0700 (PDT)
Subject: Re: [PATCH v3 4/6] gitlab-ci: Add ccache in $PATH and display
 statistics
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-5-f4bug@amsat.org>
 <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <20c001a0-60ed-df08-b67d-884022e74d04@amsat.org>
Date: Thu, 20 May 2021 13:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5a77ade3-1a6c-2389-4a1c-2c7c2266f298@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Kyle Evans <kevans@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Stefan/Daniel

On 5/20/21 10:02 AM, Thomas Huth wrote:
> On 19/05/2021 20.45, Philippe Mathieu-Daudé wrote:
>> If a runner has ccache installed, use it and display statistics
>> at the end of the build.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/.gitlab-ci.d/buildtest-template.yml
>> b/.gitlab-ci.d/buildtest-template.yml
>> index f284d7a0eec..a625c697d3b 100644
>> --- a/.gitlab-ci.d/buildtest-template.yml
>> +++ b/.gitlab-ci.d/buildtest-template.yml
>> @@ -6,13 +6,18 @@
>>         then
>>           JOBS=$(sysctl -n hw.ncpu)
>>           MAKE=gmake
>> +        PATH=/usr/local/libexec/ccache:$PATH
>>           ;
>>         else
>>           JOBS=$(expr $(nproc) + 1)
>>           MAKE=make
>> +        PATH=/usr/lib/ccache:/usr/lib64/ccache:$PATH
> 
> That does not make sense for the shared runners yet. We first need
> something to enable the caching there - see my series "Use ccache in the
> gitlab-CI" from April (which is currently stalled unfortunately).

TL;DR: I don't think we should restrict our templates to shared runners.

I don't think mainstream interest for shared runners use should limit
forks... This is a great improvement for contributors having to use
private/custom runner, see this example:

https://gitlab.com/philmd/qemu/-/jobs/1255197705
cache hit (direct)                  1529
cache hit (preprocessed)             736
cache miss                           855
cache hit rate                     72.60 %

Having been caught 2 times for testing as hard as crypto miner, I
can not rely on shared runners for my workflow.

Beside, the recent announcement:
https://about.gitlab.com/blog/2021/05/17/prevent-crypto-mining-abuse/
"starting May 17, 2021, GitLab will require new free users to provide a
valid credit or debit card number in order to use shared runners on
GitLab.com."

On this report only 17/142 countries are listed as having more than
50% of their population with a credit card:
https://www.theglobaleconomy.com/rankings/people_with_credit_cards/
and 60 with a debit card:
https://www.theglobaleconomy.com/rankings/people_with_debit_cards/

We have some contributors in countries with low percentage. I don't
think we should start a poll to verify, but I do think relying on
shared runners without proposing free alternative is discriminatory
to a part of our community.

I am very open to alternatives to improve the CI/testing situation.

Regards,

Phil.

