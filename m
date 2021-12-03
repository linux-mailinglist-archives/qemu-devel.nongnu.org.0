Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5327467FA1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 23:02:55 +0100 (CET)
Received: from localhost ([::1]:58838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtGdo-0007Rj-RN
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 17:02:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtGby-0005yh-Ar
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 17:00:58 -0500
Received: from [2607:f8b0:4864:20::529] (port=46063
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mtGbv-0007mU-UB
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 17:00:58 -0500
Received: by mail-pg1-x529.google.com with SMTP id 133so4334195pgc.12
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 14:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qQils0M/PVvYl3geu4GQRWjqCL7xIc+Dr6vVPmytlw8=;
 b=Ucoa1q96Pzobxi1zI/jqT91QOrrYWzyDQ/ygeA7Bnm3iSZ3wYNoFwBdzGXSCcIy6h4
 k9Wprmpz1mNDKFVuF/siJhlhxMJMYU1wODBBNMr/eVkYTjOkBaXhNPPRtvWjWpMvmGKC
 HVXyDHaXBPGyiFqd45L+CKibrxBlIY++7l4MBJ3m5z3AscmgDjNYuZPub+mqLQ+YsWry
 zmxyJaiq9KD56PubaRzQpAQ9o69xU6FMoEeYpi4PXAJejuQcqu0meNXyHc5k25/ZbSD5
 /1PI+6vfzqwZ2WS3rpszYFUVfWllbiU37iQucT2FeSjyY+YL7DLjfp+9TlsKlANuboVq
 cUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qQils0M/PVvYl3geu4GQRWjqCL7xIc+Dr6vVPmytlw8=;
 b=bmrzeRquPrxfp7VT9H7IuEciS0UQ9EjGJuKpEv6A1rXg+YxZcgJYL2JKjVbCf5rbaY
 kCWjczpopoUoa2YaUFNGDEsGl8eXS5IYdJUVVjaVIPg0lkAt0BJihoeac2NjyTs+U+uZ
 j7NfSwxb5mTgaatzbKGR/ExHwQtMraKrw55RQByivhNQ+K4HFxB0dyjr6D2iiHtF6iRM
 JggmjHE0sMGzIK8NIdSvuSQee1rC1gb1w+0Z5JQQF0lK4f0CP4zeFRVf5WvwvSQOA3pE
 kgOW2MpYg0ejIJDbTOq2Oku66POK90ADBWN2qgS7hVoWcPxBIDx39pXEZZVUli/kSnuI
 esQA==
X-Gm-Message-State: AOAM532t8F79II+qwF6E54RedUmsSahFozHS/6ZXbz1h/3OiAJaXHtma
 15hoQkII9sC2qAp4WDdEU+WQHA==
X-Google-Smtp-Source: ABdhPJx6rZ1OA8HyK0CRuPS69xZXyhNQa1LDCrVklCUWFxTcHzf6xGFgNboVRbORfu6Xf9IhOVuasQ==
X-Received: by 2002:a65:6a0b:: with SMTP id m11mr6624268pgu.372.1638568853636; 
 Fri, 03 Dec 2021 14:00:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pj12sm6279871pjb.51.2021.12.03.14.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 14:00:53 -0800 (PST)
Subject: Re: QEMU 6.2.0 and rhbz#1999878
To: "Richard W.M. Jones" <rjones@redhat.com>, Eduardo Lima <elima@redhat.com>
References: <CAJzYwARYDA+E4wrszx-F1D_9+VAYB2dU=M-LtvzPJey02gu2qg@mail.gmail.com>
 <20211203193725.GB1127@redhat.com>
 <CAJzYwASbiKGe5n7Ggs3u+6b6-7KEyqLCHxFsv2YMh2xyU4Y1MQ@mail.gmail.com>
 <20211203210325.GG1127@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca5c4fb4-3e9e-03c7-b682-cd29a01e0f13@linaro.org>
Date: Fri, 3 Dec 2021 14:00:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211203210325.GG1127@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, sw@weilnetz.de,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 1:03 PM, Richard W.M. Jones wrote:
> On Fri, Dec 03, 2021 at 05:35:41PM -0300, Eduardo Lima wrote:
>>
>>
>> On Fri, Dec 3, 2021 at 4:37 PM Richard W.M. Jones <rjones@redhat.com> wrote:
>>
>>      On Fri, Dec 03, 2021 at 04:20:23PM -0300, Eduardo Lima wrote:
>>      > Hi Rich,
>>      >
>>      > Can you confirm if the patch you added for qemu in Fedora has still not
>>      been
>>      > merged upstream? I could not find it on the git source tree.
>>      >
>>      > +Patch2: 0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch
>>      > +From 1331e4eec016a295949009b4360c592401b089f7 Mon Sep 17 00:00:00 2001
>>      > +From: Richard Henderson <richard.henderson@linaro.org>
>>      > +Date: Sun, 12 Sep 2021 10:49:25 -0700
>>      > +Subject: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
>>
>>      https://bugzilla.redhat.com/show_bug.cgi?id=1999878
>>      https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01028.html
>>
>>      The patch I posted wasn't correct (or meant to be), it was just a
>>      workaround.  However I think you're right - I don't believe the
>>      original problem was ever fixed.
>>
>> Yes, I saw that your original patch had been replaced by this new
>> one I mentioned, so I thought it was the correct solution, but I
>> could not find this new one on the repository as well.
> 
> Oh I see, it was indeed replaced by Richard Henderson's patch:
> 
> https://src.fedoraproject.org/rpms/qemu/blob/rawhide/f/0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch
> 
>> At the moment I kept it as part of 6.2.0 build, which I am just about to push
>> to rawhide. It builds locally, and I am only waiting for the scratch-build to
>> finish.
> 
> Yes looks like we need to keep it, and get it upstream too.

Whoops.  That dropped through the cracks.
I'll queue that now-ish.


r~

