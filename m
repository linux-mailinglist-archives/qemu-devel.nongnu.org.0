Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F92F4E4285
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:09:34 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWg8b-0007H5-0Z
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:09:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWg5N-0004GB-HQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:06:13 -0400
Received: from [2607:f8b0:4864:20::429] (port=39499
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWg5L-0003uF-SQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:06:13 -0400
Received: by mail-pf1-x429.google.com with SMTP id u22so7004697pfg.6
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gyxchIEuxeGB9uxEXYG/8FI/5vLztW6lSdJB2yWPC2Q=;
 b=KUaTWg3ZYERGeyhhrhiGhFbn/Kng0fB9TPVnXxjiGA5WIGpudTzIjl6ohn3Cr3ZgFK
 Jo9ssUJckmTKT9/+s4xpFNL43OoAOyEgj04xd6BRVgCxwFfpKPDOClUbZMy2+WAYwSMt
 fsQKz4+AEj1Je3yjac6wc5JH2A1v38rt9Gj3RvUInjCobGZAZGP3kVLgqWjk8tUlkvWq
 mWU2bELu4Ad5B5WHmZDHeCfa7NzsCM9H7G4EkA4wYBRldTbEU8r8DqQsN5HSm1VeoaO5
 Wc8k90WeLNfV+PKBI8YlmU/p62Qb9elujut0zxWpt2URqeRXhVlYMChCemAaTFMPbTcR
 ZQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gyxchIEuxeGB9uxEXYG/8FI/5vLztW6lSdJB2yWPC2Q=;
 b=bevy4XTI9WhX8Zr43pfmk4LTtnHTHytXeVrk414DlAKoru331Q5qIbOsULRp8lIP/f
 8/JJgjIe+weF+CeC/lIhwQEkwZmdskCALdfCkp19PtCoIQiepSInXhFaP8ijQckYkoGg
 s/ea+RrHHc8RmfkrHr+xHl882BMBdGrh9TanfPE17rBJfR0Cg/aysViLCyMTIERPQQ45
 M69pWOjey4IX18SeHsLzySlYYszVMEWIcuNusTNHQKtO4PsgpgMB0lFKNtNgUdZMeHsn
 /wElKGRipiaTTq0DFbogZQHf7ccKuual8i/lYTTP13lslseRYzswopoJN+PVQCMzLip+
 cTFQ==
X-Gm-Message-State: AOAM530NQt7L1Vae/U8IkWGnbfqs6UjN8ic23Ev+xMpxRNT99mbKJ0oC
 R+iOTDzaUpjmvPCSlFLSoBzuEA==
X-Google-Smtp-Source: ABdhPJxm1U4oAxsVhDBFqP8irbCuPrAJvjKKYiq6qG0/uUJ1TjQv+BZDhtHlnSd1UxtkDe9DRcbt/A==
X-Received: by 2002:a63:656:0:b0:385:f723:5245 with SMTP id
 83-20020a630656000000b00385f7235245mr1664353pgg.496.1647961570500; 
 Tue, 22 Mar 2022 08:06:10 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a63ce4f000000b00341c40f913esm17650395pgi.87.2022.03.22.08.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 08:06:10 -0700 (PDT)
Message-ID: <56eb92f5-9512-233c-ead8-d56f144ed9bb@linaro.org>
Date: Tue, 22 Mar 2022 08:06:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/2] s390x/cpu_models: make "max" match the unmodified
 "qemu" CPU model under TCG
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220322112256.118417-1-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220322112256.118417-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 04:22, David Hildenbrand wrote:
> Let's simplify the "max" CPU model and just make it correspond to the
> "qemu" CPU model of the latest QEMU machine from now on. This gets rid of
> a warning we print when starting QEMU with "-cpu max".
> 
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> 
> David Hildenbrand (2):
>    s390x/cpu_models: drop "msa5" from the TCG "max" model
>    s390x/cpu_models: make "max" match the unmodified "qemu" CPU model
>      under TCG
> 
>   target/s390x/cpu_models.c   | 26 +++++++-------------------
>   target/s390x/gen-features.c | 13 ++++++-------
>   2 files changed, 13 insertions(+), 26 deletions(-)
> 

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

