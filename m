Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9054B2A29
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:24:15 +0100 (CET)
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYiV-0000sm-2W
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:24:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nIYZK-0007Bp-Qq
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:14:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nIYZH-0006sk-2c
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 11:14:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644596082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kJMDvkH5B5kDYUnBh8kc1Shi1cjgNIU+DVh4qAU57TI=;
 b=M1j5fInqAVdgHm09o0aFCKslOGTrDbqnFRJAe4ojYMOmYi9D5uQj6rwHSypG5bCNAjrbsQ
 wjcCoPA8NJ3LOGrfxDrG5rohEbtXoMoDdbpqmRb1YBwV0VavVOJprKO6F+bvI4LXxmKNaS
 xIQ/O+/3dJl0lZ4dszNj+IY437Vtaq0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-La4M3U5HPtCG0zWNS5rddw-1; Fri, 11 Feb 2022 11:14:41 -0500
X-MC-Unique: La4M3U5HPtCG0zWNS5rddw-1
Received: by mail-ed1-f71.google.com with SMTP id
 x6-20020a05640226c600b0040fe1993eebso4897408edd.6
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 08:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kJMDvkH5B5kDYUnBh8kc1Shi1cjgNIU+DVh4qAU57TI=;
 b=J9Lv4mu2V1d+hJfYhiOEefWPdHzrPoJGzYR7VJZQPp+fOhzXN6g3OX3pNyf5Ori0Nl
 i5xPwufQH3pAr0gYOrE2Pun/KoULwdDN4U6d+cNrtyvNY63yQHr5kW4q0ocM8hyG4c/c
 NFsQGpsqR4ULj+LzjVEgD2GXTwGTRaDpBFFmFiwWIhSAP+OJiyC4shUMfxTztknroz9s
 6WgiB8pp2X+sBAdu3hz+0x5UflkoyxjXOX5p00/QTttyr++HL9cCv9Ugk0WZtnJi6pkX
 mDICBDC0SxDwdTfBuMHZFbhISWoKpUr4OzJwZqgwUONs9iIPuE7qUizI82RSM33ucALK
 sgyw==
X-Gm-Message-State: AOAM530l9mR3RS2v0FvF1Qw1FGfgFhpCIo25Snas/hwxA4JAbRz7S8UB
 JV6OjSnoOdQ547lQnMWoBU/uQtjAYP8r87Da5Z5pXpyuBiNLmOG7hAxCF+9+RcrnmtworCuVjAv
 N/AKbpHTI7qFSp10=
X-Received: by 2002:a17:907:2d08:: with SMTP id
 gs8mr2076953ejc.106.1644596079923; 
 Fri, 11 Feb 2022 08:14:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGoiqLWIcaj+DPkpptCytz+9ynPnSsGg4g5z4kgfiXeXMmCpb47rJa8WEUGh36oF6M7WzN+g==
X-Received: by 2002:a17:907:2d08:: with SMTP id
 gs8mr2076937ejc.106.1644596079689; 
 Fri, 11 Feb 2022 08:14:39 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id q4sm8037266ejb.109.2022.02.11.08.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 08:14:39 -0800 (PST)
Message-ID: <66487f51-1fdd-3a49-bc6f-b89ab3d2e54c@redhat.com>
Date: Fri, 11 Feb 2022 17:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/8] tests/qemu-iotests/testrunner: Allow parallel test
 invocations
To: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220209101530.3442837-1-thuth@redhat.com>
 <20220209101530.3442837-2-thuth@redhat.com> <YgYsbRc9XNYjUH2L@redhat.com>
 <362412d7-4676-1733-fef6-825fda8e34a0@redhat.com>
 <YgaIISPltMU4GWsG@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <YgaIISPltMU4GWsG@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.02.22 17:00, Kevin Wolf wrote:
> Am 11.02.2022 um 14:53 hat Thomas Huth geschrieben:
>> On 11/02/2022 10.29, Kevin Wolf wrote:
>>> Am 09.02.2022 um 11:15 hat Thomas Huth geschrieben:
>>>> If multiple tests run in parallel, they must use unique file
>>>> names for the test output.
>>>>
>>>> Suggested-by: Hanna Reitz <hreitz@redhat.com>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    tests/qemu-iotests/testrunner.py | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
>>>> index 0eace147b8..9d20f51bb1 100644
>>>> --- a/tests/qemu-iotests/testrunner.py
>>>> +++ b/tests/qemu-iotests/testrunner.py
>>>> @@ -259,7 +259,7 @@ def do_run_test(self, test: str, mp: bool) -> TestResult:
>>>>            """
>>>>            f_test = Path(test)
>>>> -        f_bad = Path(f_test.name + '.out.bad')
>>>> +        f_bad = Path(f'{os.getpid()}-{f_test.name}.out.bad')
>>>>            f_notrun = Path(f_test.name + '.notrun')
>>>>            f_casenotrun = Path(f_test.name + '.casenotrun')
>>>>            f_reference = Path(self.find_reference(test))
>>> Hmm... It does make sense, but nobody ever cleans those files up.
>>> Currently, the next run of the test will just overwrite the existing
>>> file or delete it when the test succeeds. So after running the test
>>> suite, you have .out.bad files for every failed test, but not for those
>>> that succeeded.
>>>
>>> After this change, won't the test directory accumulate tons of .out.bad
>>> files over time?
>> True ... but we certainly want to keep the file for failed tests for further
>> analysis instead of immediately deleting them ... maybe it would be enough
>> to encode the image format (qcow2, qed, vmdk, ...) into the output name,
>> instead of using the PID, so that "make check SPEED=thorough" works as
>> expected here?
> It depends on what the supported use case for test suites running in
> parallel is. If it's just for testing multiple formats at the same time,
> then this would work, yes.
>
> I could think of more test runs that you might want to do in parallel,
> like different protocols, different image format options, maybe even
> different host file system. I'm not sure if all (or any) of these are
> relevant, though.
>
> Supporting only things that "make check" uses might be a good
> compromise.

Personally and originally, I wrote that diff to allow me to actually run 
the very same test many times in parallel.  If an error occurs only very 
rarely, then I like running like 24 loops of the same test with exactly 
the same configuration (just different TEST_DIRs, of course) in parallel.

The fact that the .out.bad files tend to accumulate is why I haven’t 
sent it upstream so far.  Personally, I like Vladimir’s idea to put them 
into TEST_DIR, but probably just because this works so well for my usual 
case where TEST_DIR is on tmpfs and I thus don’t have to clean it up.

Hanna


