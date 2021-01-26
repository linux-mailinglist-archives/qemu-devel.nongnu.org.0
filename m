Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A9F303850
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 09:49:49 +0100 (CET)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4K2m-0006hB-IX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 03:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4K1J-000680-Qs
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 03:48:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l4K1H-00076t-1a
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 03:48:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611650892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kb0pjdc46JFibIyMzQlwVGCjYBIoFA6tGwASW0bXd5I=;
 b=edPY4M4uifLDFXNfM9P2Hli/gCl1ckpz8P6uD02Gzq0mP0LUfMkJisHuCnF5AOAeSoqGWV
 mJ9haA9d5Cw9+sNN4M5zFPJQMIqUlZTUAlfYQnJdXOBnUst4bILdvHAUw5ZPgxG8sgEtTC
 VBdRZ3BVJffaSTSindHk9tsOMZnc12c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-fqho6y60ORiZwKOdc247sA-1; Tue, 26 Jan 2021 03:48:10 -0500
X-MC-Unique: fqho6y60ORiZwKOdc247sA-1
Received: by mail-ej1-f71.google.com with SMTP id x22so4689738ejb.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 00:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kb0pjdc46JFibIyMzQlwVGCjYBIoFA6tGwASW0bXd5I=;
 b=pMHdENi5yahFrgS6Eok7E8sKCUfrY72CdnhWkAeJDxPHPpNSkoaALsaDBU32+dthXZ
 r+tTemJQEB2W0ufGw62aGg+kVEG9Y8ANcsMGbG/2KD8iMXKwAAlvmYM9SxWlA39THfu+
 ATVG3sHDn5xJzZlfosTv8hEN8kXqPBHCLPTuqv0TzBrx8WviGpWuIQIn5Z6iK4LUtvpH
 3O9Fd+jxhzIEA02LBrLxfW98Ir6otVw4F8l/SCJf36hmGFmdkMCNtOP9SX2w7csCux2O
 IUtPfwhE5b3PuUEu4Ar3ci4I8nAu1GdJeS7S0Lg8+vJgjLQdlIFIG9MhT5k0DPHxMsOs
 NKXw==
X-Gm-Message-State: AOAM533ncvmf5vQgErMug56ovJ0m2HQpv6yEyMRtZhtj+Ig/e7AA6vL1
 ces6GtM5kNtwFDtsQy2FCkOcFKfVcMnT2vuc6iLW1OwsI7PrVwa8liMYiQRB708O6Mcf4hbTxqm
 K0KY8lAQdNh6Bi7A=
X-Received: by 2002:a17:906:1c17:: with SMTP id
 k23mr2718221ejg.255.1611650889680; 
 Tue, 26 Jan 2021 00:48:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdClDhPGTDEg2/bx5qwMcMjSyUuJBEhrIq4r2yFui4el0oDXgVR34e9fjhgrfYUCtVktMcHg==
X-Received: by 2002:a17:906:1c17:: with SMTP id
 k23mr2718210ejg.255.1611650889513; 
 Tue, 26 Jan 2021 00:48:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f13sm9417781ejf.42.2021.01.26.00.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jan 2021 00:48:08 -0800 (PST)
Subject: Re: [PATCH v1] gitlab-ci.yml: Speed up CI by using "meson test
 --no-rebuild"
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210125090339.134019-1-thuth@redhat.com>
 <e8699ffe-3260-3033-cc13-ae9c3f86cbf1@redhat.com>
 <b6be5064-c3aa-8666-126d-e48e47392108@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <f1217da2-e255-f596-1229-dc95c2388c68@redhat.com>
Date: Tue, 26 Jan 2021 09:48:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b6be5064-c3aa-8666-126d-e48e47392108@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/21 08:03, Thomas Huth wrote:
>>
>> +  artifacts:
>> +    when: always
>> +    paths:
>> +      - build/meson-logs/
>> +    reports:
>> +      junit: build/meson-logs/testlog.junit.xml
> 
> Ok, I've tried that but it also worked not quite as expected:
> 
> https://gitlab.com/huth/qemu/-/pipelines/246463068/test_report
> 
> The "check-*" jobs now show up in the test report page, but even though 
> I've made some tests failing (e.g. the check-system-centos job), the 
> failing jobs are showing up with "Failed: 0" there.

Hmm, that's a limitation of either TAP or GitLab.  Of TAP, because it 
doesn't report tests when they start, so there is no test to attach the 
timeout to.  Of GitLab, because it reports the outcome of individual 
testcases but not the outcome of the testsuites.  Not sure how to fix it.

> Also the duration is always marked with 0.00ms.
Ok, let's wait for a new Meson release before doing that too.

Paolo


