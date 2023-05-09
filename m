Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C36FC6F7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 14:44:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwMgM-0000az-MG; Tue, 09 May 2023 08:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwMgK-0000aO-BL
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:43:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pwMgI-0006eR-GW
 for qemu-devel@nongnu.org; Tue, 09 May 2023 08:43:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683636181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIxDtlfMpEooVwBFht+kv0kZoTHf6yz+viLM0CQ/XiM=;
 b=gMP2D9OG+Zjz4G1CZgKEwlzfXsIEE/AtgKEfIswiECDUH7TnHKtwRERh03V4OPwbuN/zp/
 T1VUNny0hEmG4rS1ng9wWZm42eaf54t/YqKynOBTKzTyG+l5NxbIic5mCFJ4KUG5ZG3fxj
 R5yKBvoSBhQfx2XL01ly93Mi4xUnOcw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-mLoJTbuCOJOtr8BnzFpJKQ-1; Tue, 09 May 2023 08:43:00 -0400
X-MC-Unique: mLoJTbuCOJOtr8BnzFpJKQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-506beab6a73so6690587a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 05:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683636179; x=1686228179;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oIxDtlfMpEooVwBFht+kv0kZoTHf6yz+viLM0CQ/XiM=;
 b=N4wJYyfvFeAk5RqYKGyczrq9zYHoFoVtB3Z/GSf+R6X1wBXPLSSd8hrSsTEEMyoaEH
 s/L3FHBk4cpFDJcmNxg24v1Yxiqa1/luvB7a4SGxShPHs0kn0naTIl2VZOEkB/mEXWe1
 7J4+/R1zWIRXQ5mCTbbfUisDghTpzkQASd6bOtu1qF47CeU66OgS3BRsWSVYnWBA2wzL
 Q+489YjQkye2OOqOiLKKUAoqy9PGI5OmxLcIImNneabI32TJBSS3ANXONTNBNBHI0YvB
 nk1cAzPS+izQWj0Tcqs/XUMq80kDncKPfHsgW2XnfUKz/k8kg8XoHxW3kUpzF3SVgcQs
 Cz8Q==
X-Gm-Message-State: AC+VfDx9+2J6HbVVsTYCVynfv8DE9ViOIVCg4uqROrNSZ+iA48uP0Aw9
 zF1lDuw3p7JJSg6VIYtxLMdju26H4B4VadcMnrE1jR9HjCiOoTHFquzU0jR3KYhBk8nCfEghV8Q
 dgjO/Z7GhMRA3fHc=
X-Received: by 2002:a05:6402:14d3:b0:508:4120:202a with SMTP id
 f19-20020a05640214d300b005084120202amr11950933edx.10.1683636178883; 
 Tue, 09 May 2023 05:42:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75h+G6wk16FyJbyNudBjakqgdbuRakWlWgAoDnQZkCqt7COqyBrasuFYv5hPvDlZ+X2bJxjA==
X-Received: by 2002:a05:6402:14d3:b0:508:4120:202a with SMTP id
 f19-20020a05640214d300b005084120202amr11950919edx.10.1683636178498; 
 Tue, 09 May 2023 05:42:58 -0700 (PDT)
Received: from ?IPV6:2003:cf:d738:7fbf:bf54:7947:8c4:60ed?
 (p200300cfd7387fbfbf54794708c460ed.dip0.t-ipconnect.de.
 [2003:cf:d738:7fbf:bf54:7947:8c4:60ed])
 by smtp.gmail.com with ESMTPSA id
 d4-20020aa7c1c4000000b00504a356b149sm718292edp.25.2023.05.09.05.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 05:42:58 -0700 (PDT)
Message-ID: <6fc90413-8f2b-f8e9-763d-83c87a605218@redhat.com>
Date: Tue, 9 May 2023 14:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 06/11] test-cutils: Add more coverage to qemu_strtosz
Content-Language: en-US
From: Hanna Czenczek <hreitz@redhat.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20230508200343.791450-1-eblake@redhat.com>
 <20230508200343.791450-7-eblake@redhat.com>
 <a9216c0d-86df-410d-d32e-6d6fd65acc30@redhat.com>
In-Reply-To: <a9216c0d-86df-410d-d32e-6d6fd65acc30@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.421, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 09.05.23 14:31, Hanna Czenczek wrote:
> On 08.05.23 22:03, Eric Blake wrote:
>> Add some more strings that the user might send our way.  In
>> particular, some of these additions include FIXME comments showing
>> where our parser doesn't quite behave the way we want.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>   tests/unit/test-cutils.c | 226 +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 215 insertions(+), 11 deletions(-)
>
> I wonder: The plan is to have "1.5e+1k" be parsed as "1.5e" + endptr 
> == "+1k"; but "0x1p1" is not parsed at all (could be "0x1" + "p1"). Is 
> that fully intentional?
>
> (Similarly, "1.1.k" is also not parsed at all, but the problem there 
> is not just two decimal points, but also that "1.1" would be an 
> invalid size in itself, so it really shouldn’t be parsed at all.)
>
> I don’t think it matters to users, really, but I still wonder.
>
>> diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
>> index afae2ee5331..9fa6fb042e8 100644
>> --- a/tests/unit/test-cutils.c
>> +++ b/tests/unit/test-cutils.c
>
> [...]
>
>> @@ -2875,6 +3056,20 @@ static void test_qemu_strtosz_trailing(void)
>>       err = qemu_strtosz(str, NULL, &res);
>>       g_assert_cmpint(err, ==, -EINVAL);
>>       g_assert_cmphex(res, ==, 0xbaadf00d);
>> +
>> +    /* FIXME overflow in fraction is buggy */
>> +    str = "1.5E999";
>> +    endptr = NULL;
>> +    res = 0xbaadf00d;
>> +    err = qemu_strtosz(str, &endptr, &res);
>> +    g_assert_cmpint(err, ==, 0);
>> +    g_assert_cmpuint(res, ==, EiB /* FIXME EiB * 1.5 */);

So…  I have no idea what happens here but this always fails with 
“assertion failed (res == EiB): (1 == 1152921504606846976)”.  But when I 
replace the EiB by 1, it suddenly fails with “assertion failed (res == 
1): (1152921504606846976 == 1)” instead.  Replacing the EiB by anything 
but 1 also tells me that res is 1.

Now, here’s the kicker.  I put an `fprintf(stderr, "res == %" PRIu64 
"\n", res);` before this g_assert_cmpuint() (changed to (res, ==, 1))…  
And it passes.

Sometimes I really want to change professions.

(Of note is that changing the g_assert() below into a g_assert_true() 
also has g_assert_cmpuint(res, ==, 1) pass.)

>> +    g_assert(endptr == str + 9 /* FIXME + 4 */);
>
> This is “correct” (i.e. it’s the value we’ll get right now, which is 
> the wrong one), but gcc complains that the array index is out of 
> bounds (well...), which breaks the build.

Oh, it also isn’t correct, I think it needs to be str + 8.  As a bonus, 
the compiler doesn’t complain then (for some reason…?  it still seems 
out of bounds).

(Otherwise, to get around the complaint, I used 
g_assert_cmphex((uintptr_t)endptr, ==, (uintptr_t)str + 8).  Which is 
another thing, patch 1 explained to me that we shouldn’t use g_assert() :))

Hanna


