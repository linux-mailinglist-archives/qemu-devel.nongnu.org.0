Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C12440F80F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 14:40:25 +0200 (CEST)
Received: from localhost ([::1]:48874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRDA4-0007SJ-HF
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 08:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRD7z-0005wa-75
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:38:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mRD7v-0005HV-2X
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 08:38:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id q26so14938577wrc.7
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yP2ksUtdY9yo/Ky7o+0GePhbKbP+WSor9Jb4xFDea90=;
 b=j+rlRd0gxxAJ4V6xrUqcgagzWk/UuJte5h0eMZpGGL6mh51m78A5ql8JZkasytGzPI
 fK4kHZ7xvVUw+ZfAbFwYJWNT4qQFBC7OzL+UznM7z72vFGkHM0fEdIIopfkO7DTrh7CD
 b5lghaG4fFY+n6tFSLXEqaJx8CHhQE37fs7Dff/fPE9eAcnFYr/uPJJ1C0xNng/+oCcN
 fQhnewwerLhJt2qKjWqzLH9cVDmqQjWlua5skQCIBPacsyHMWOWPyPQvU2K6arnUHThE
 yamR/Aur5OXVj7hDPmqtCTMAyRsAckXvWWHddInSNniBS43XGzaxNVYKDSKYEax5aOja
 z1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yP2ksUtdY9yo/Ky7o+0GePhbKbP+WSor9Jb4xFDea90=;
 b=rz3M7fuiR4hjMsLwVd20Vn3tYZMfdRHVt3vxKoQOYFQR/5IzUnCDlPTv0Dx8oNVM9D
 uXTVwEjVIoVVVxt9vEqj83CgTUDHqSry0MhjvKtepZXNiIK+lDK6XYghwNGNIr5RMPHJ
 B0ZzSaNTOkafGZD6eJQRj5f7518LKU3l+3bngmJyrzxsXmpGBvUoPAfVlSRpHXtPzsrz
 v+9GcIA4EnJiiuebn0yn4N1biSdvXRWUZSUeDQdAfj7lQAWFQlB/UXOMVEUvbAM+j0TW
 SoBK+I9kXFXWPv+JU8U5JKUmXC1ovxy/Q9ptrxH4UQUSSuYjJZ0OmfuBcZm8fCVU1gW6
 8c6g==
X-Gm-Message-State: AOAM530faG+9ALKB4Bs04/1UtOwqbHMWOAhCtxif1mfojzDwLNVTufSb
 At6QhvOGrb0unel4JuThKWpStGdH36E=
X-Google-Smtp-Source: ABdhPJyYqmj1VmrfG7P8sMiTHBRMsLQgty07o47JB0sVj6iDnH/x0siM91V01Ywl6MAuvMY4IydQYw==
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr11386014wre.385.1631882277479; 
 Fri, 17 Sep 2021 05:37:57 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id j23sm7143815wmo.14.2021.09.17.05.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 05:37:56 -0700 (PDT)
Subject: Re: [PATCH] travis.yml: Remove the "Release tarball" job
To: Thomas Huth <thuth@redhat.com>
References: <20210917094826.466047-1-thuth@redhat.com>
 <CAAdtpL7DkZyE7z-M2trjnXj0mpry95Y-T7-WahgxWg-jfg9gCg@mail.gmail.com>
 <9a941135-a659-bf8e-6b4f-bc7e297060c0@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3cbe10a2-5003-8214-f20f-601a49d513f2@amsat.org>
Date: Fri, 17 Sep 2021 14:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9a941135-a659-bf8e-6b4f-bc7e297060c0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.488,
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
 Michael Roth <michael.roth@amd.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/21 1:42 PM, Thomas Huth wrote:
> On 17/09/2021 13.25, Philippe Mathieu-Daudé wrote:
>> Le ven. 17 sept. 2021 11:48, Thomas Huth <thuth@redhat.com
>> <mailto:thuth@redhat.com>> a écrit :
>>
>>     This is a leftover from the days when we were using Travis
>> excessively,
>>     but since x86 jobs are not really usable there anymore, this job has
>>     likely never been used since many months. Let's simply remove it now.
>>
>>     Signed-off-by: Thomas Huth <thuth@redhat.com
>> <mailto:thuth@redhat.com>>
>>     ---
>>       .travis.yml | 23 -----------------------
>>       1 file changed, 23 deletions(-)
>>
>> Do we have the equivalent job on GitLab?
> 
> I'm not aware of any. But since this job was only running on v* tags
> anyway, it likely does not make much sense to translate it 1:1 to a
> gitlab job. But maybe Michael could suggest something similar if it's
> helpful for making sure the release tarballs do no regress?

This is why we added this job in the first place... Peter tagged a
released then Michael got issues when generating the archive.

