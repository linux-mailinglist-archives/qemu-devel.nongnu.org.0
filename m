Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782F859E5E0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 17:21:20 +0200 (CEST)
Received: from localhost ([::1]:34034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQViR-0001J0-7j
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 11:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQVh1-0008He-SE
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:19:52 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:38618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQVh0-0007vw-7t
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 11:19:51 -0400
Received: by mail-pg1-x533.google.com with SMTP id r22so12555629pgm.5
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 08:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Xuqngbei0MkLpt4fmKzvUi17Onp43uX4CNRVpZIUpJU=;
 b=RrQInnKawUU1hXvdp09kWPAOghUa3TCZS9RHTVNOAb1mYVu7sSy1QbRu9JXTbOdKDM
 dP0uu6I2wVCp7yxXTf2Kcjm2NZupKLxrEGyDYKVqlZqenULA37iOaQakXrh70upyJjp7
 76LPcHiHUzOiZ8Y6f5Vsvn6gqJq3ak3fKC9KRvaVleUB4SbaMgtBRN0rHdmuLNJ4oupy
 1hz7h6KA+tZSpuIN7sOVE6M556/3xIJvKL0kClCBlr1NUuZdZcs29Ecqb9JGvrf/c9xV
 nj1AxuciKCfLu8QA8rHS7pM263fUfne2UoOm8GAp4Jq4wEFBRodcX0SMbO2/rudyq1M9
 c23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Xuqngbei0MkLpt4fmKzvUi17Onp43uX4CNRVpZIUpJU=;
 b=ATb1twjpeJOe+2JPHW50PyR3s4utTpVn6yZ2NkK6WRgxE9csfBFfR4aaSCvGQYchxT
 njxrfYXrqMbZT6EVuu5EPS02Up29IdRsdQTExh9lY+u48QbY4cBYhhnoiVaacVtXo/DJ
 aqfKSWqHKDHdnUYx+8vNqi3TGFt6OdHy/gd+v4MTLwYqjlI2sMewddczgPGJTUcaNDCs
 6ldBXa1FGjI6GpaSikC6ai2sk9m/Q8gsZCsrtvTF3tftOucHi4azV/s/K3CohT4mXAef
 pcAy1ItCWXVceczMIKsK7U0iynd3y9U0iWMJqML67HLkm0yKGvs75jPVg5dQl/eZc+u4
 6sTA==
X-Gm-Message-State: ACgBeo3P3E3iWSSffncbiECrPBAsk27SpXBkxadQ8EG0Y9dRm/fGRmB9
 liKpOJf/CQfx6JhdrObyYp7GRg==
X-Google-Smtp-Source: AA6agR7iw4upG54PShULulIkjgnt7dX9lTcbEhy78YWGxZqtHW+mily63g5deuNv0H0AGclXGgT0+Q==
X-Received: by 2002:aa7:88c8:0:b0:536:926:700f with SMTP id
 k8-20020aa788c8000000b005360926700fmr21763421pff.72.1661267988076; 
 Tue, 23 Aug 2022 08:19:48 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 i62-20020a626d41000000b0052d27ccea39sm11360002pfc.19.2022.08.23.08.19.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 08:19:47 -0700 (PDT)
Message-ID: <4692433b-9592-4de6-bbd5-00d001ff82ad@linaro.org>
Date: Tue, 23 Aug 2022 08:19:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/14] accel/tcg: Suppress auto-invalidate in
 probe_access_internal
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, eduardo@habkost.net
References: <20220822235803.1729290-1-richard.henderson@linaro.org>
 <20220822235803.1729290-4-richard.henderson@linaro.org>
 <104a0560-e1ca-1aca-1ed5-07a00ee74240@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <104a0560-e1ca-1aca-1ed5-07a00ee74240@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/22 02:19, David Hildenbrand wrote:
> 1) s390_probe_access() documents to "With nonfault=1, return the PGM_
> exception that would have been injected into the guest; return 0 if no
> exception was detected."
> 
> But in case of CONFIG_USER_ONLY, we return the flags returned by
> s390_probe_access(), not a PGM__* value. Maybe it doesn't matter,
> because we'll simply inject a SIGSEGV in any case ...

I would have said it would matter for MVPG, except that is incorrectly *not* marked as a 
privileged instruction.  There should be no CONFIG_USER_ONLY case to answer there.

> 2) s390_probe_access() documents that for "CONFIG_USER_ONLY, the
> faulting address is stored to env->__excp_addr.".
> 
> However, that's only set in s390_cpu_record_sigsegv(). With nonfault=1
> that will never actually trigger, right?

Correct.

> I assume db9aab5783a2 ("target/s390x: Use probe_access_flags in
> s390_probe_access") might have introduced both. We had a flag conversion
> to PGM_ in there and stored env->__excp_addr:

Indeed, that commit is faulty in that it breaks the contract of s390_probe_access.
It's a shame, though, that we need to carry the extra code for the purpose, and that the 
generic interfaces are not sufficient.


r~

