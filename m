Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E047CDA6
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 08:44:51 +0100 (CET)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzwIs-0005pj-De
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 02:44:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzvdy-0000JJ-7u
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 02:02:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzvdv-00013z-Ek
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 02:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640156549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PDobYfVNxMsBPmkLSKLPeVqdyoZ/dxu3pYl+WZBl+zs=;
 b=FJurIqjTIwSSRhP8y9qfcdyaWLoyOV3KnzVwmiTEiipUmVn8PxNjiTJ/0cMIifGlDpciWh
 bGlsf7OoZ4XHm6EMYB76rOayq9/097A07Ikj+Sy9QfSTFrXkl0eLhelIhoFQqolcwt7u+b
 pX0Z/wKE/c2VD7/bVzQ/BCEFQAZcqjs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-uQ6vnwBcOGu4Q1DXVSwZhQ-1; Wed, 22 Dec 2021 02:02:28 -0500
X-MC-Unique: uQ6vnwBcOGu4Q1DXVSwZhQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 u10-20020a05600c19ca00b00345b2959e5aso382445wmq.9
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 23:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=PDobYfVNxMsBPmkLSKLPeVqdyoZ/dxu3pYl+WZBl+zs=;
 b=KXoK6Z1GR5r80Hg5SFHcazknFPIf0d2jXRpOK4R/PnY+KyXKkOnpj2wa6/e6BGBR7T
 /UCRbbMkg4Q7w/FmiBp5qL7RKMwxfHu2Ki3eASwQmzuFDHfu/EEPBmfy/+uEac2nNabl
 1xsESB7z3B38grmPOFee5Q7ztjYTOgEBg9KHmIBD43XC8efvI36W01ODYPC/rLOVdWvh
 zHrNyUsiPsR9lFhCb0+VhZ/BHU2LMAjZeA4yIskJhY4s2nr+9CWFmK0ca32+IJWabqxh
 MXfcuT19/Uqe+XW41097PAYRjyAqh2/Kb/tA5Mg864+ZBcT2KaPyeP2X8zDGtvu90jUm
 nYow==
X-Gm-Message-State: AOAM531Yf6woV8Fmgq8J9J2nwOsJkxAQcl1+MCDPdrpInhYU4DqVJY8W
 0SqgwFPRuFQGGTnomVt6NLumWrAfumeDxnJtB9MHluM/7+8JTgkVygMQL9DDl2d9W/BJAYvA5f1
 Et4X12RvBme8yzUo=
X-Received: by 2002:adf:d841:: with SMTP id k1mr1152331wrl.396.1640156547439; 
 Tue, 21 Dec 2021 23:02:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOtPLhMLJtj/3eSf4IxfRXaHPRhLJf+vMpP/VrWQpuzG4fVGSvQJiEbOkJqwTg0u9Nwcfhtw==
X-Received: by 2002:adf:d841:: with SMTP id k1mr1152318wrl.396.1640156547268; 
 Tue, 21 Dec 2021 23:02:27 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id g1sm1074016wri.103.2021.12.21.23.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 23:02:26 -0800 (PST)
Message-ID: <eaffecac-7e2b-8dc9-5136-a6903cbe2541@redhat.com>
Date: Wed, 22 Dec 2021 08:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20211220102759.311224-1-thuth@redhat.com>
 <a752f53a-f563-4d54-affa-40925f39b62f@linaro.org>
 <72a60ec5-156b-d73e-9150-91c79eb92fc7@redhat.com>
 <656b10c3-4edc-96bd-48b6-3302ddd7cb7c@redhat.com>
 <fe3c4739-48f0-bb42-77a0-3677ccb22391@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int()
 instead of g_test_rand_int()
In-Reply-To: <fe3c4739-48f0-bb42-77a0-3677ccb22391@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.694, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/12/2021 20.32, Richard Henderson wrote:
> On 12/21/21 2:32 AM, Thomas Huth wrote:
>> Using g_file_open_tmp is certainly better ... but the tests are currently 
>> written in a way where they require the file name of the temporary file - 
>> so switching to g_file_open_tmp() (which only provides a file handle) 
>> certainly would need some rewrite here...
> 
> Incorrect.  g_file_open_tmp returns the open file handle, but also returns 
> the filename in *name_used.

D'oh - not sure how I missed that yesterday :-/

> I should think you can close the file handle straight away and use the 
> filename.

Ok, then let's continue with that approach.

  Thomas


