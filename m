Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B777239F0EB
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 10:28:15 +0200 (CEST)
Received: from localhost ([::1]:44824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqX5q-0005tt-PN
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 04:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqX4b-0004Ve-R1
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:26:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqX4a-0006Nr-6g
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 04:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623140815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ynxCAyXC/DIPVtXsx4hI43RJAis9jzz0MNUWv+7fDtA=;
 b=Yc6jnvhAYykdDFtNJhcW96ZxnNY5DVX9FGzFgM2+ZTlaaoTF3iCGGLYZ2REZMlT26E9mVN
 v+tmR00zFJRX/dUSiwpcce78vkwuQrNv1GEcr1vLzG1ksCl+OQMiUeyfQezm3tD/QVwTHF
 LGnf7+sUw/fhOXddiIc/vsJBMJmtntI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-tGh1bp3KONyTRtFIpBVczg-1; Tue, 08 Jun 2021 04:26:52 -0400
X-MC-Unique: tGh1bp3KONyTRtFIpBVczg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n21-20020a7bcbd50000b02901a2ee0826aeso885124wmi.7
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 01:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ynxCAyXC/DIPVtXsx4hI43RJAis9jzz0MNUWv+7fDtA=;
 b=oEkNCnrx197q4h8AuI0lCXOmPcQzHfFlPLLanu0BCLbTrBLGLt/QVipBX2Lf5/mz5C
 xmby/OrebGRQVeQdcbwp+3jv5APF78X4/+9HTtBBmDoz5QlH657AwppS/+KgxWNMX2nf
 yeVkF9Zubm0pd9vlNan0U18S8eJ0GiyRgKBzsZG/2f1eWQXx/cnlk+D3RuBsz8WOdSh0
 mFgW5aLbkYtnuuc1SN8vaC1GEM7x1AkWGpJhttLHnoTJSteaID5mO2quk6pmP+3pl+jc
 juy+fS7dZQDKYDm8uVwKKLcP6otRdyQVeGJBofLdj4ZaICnWic/7IKTOjz947P6/ADvn
 P9Mw==
X-Gm-Message-State: AOAM531jvLmes9s93mdrxsrV7U+umzrSCGomIeKGUMJZOKxehRYnVIS/
 TgkRZ/KiDazRoZZ6sqCN4sqesjWgKjlEuzJJJVcGdGrQwfA82G+emhUHD7t5zeB5JW8Z+5PVC0Q
 BYcI46t1MKBeoxBc=
X-Received: by 2002:a05:6000:154e:: with SMTP id
 14mr14536257wry.305.1623140811280; 
 Tue, 08 Jun 2021 01:26:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxIOt3eSqL9+jD5lsgP3gBN8bghdmIAtGM+U1l2kE2l5S2+tz7MVFO1p+8ePoUoXmEYmUklA==
X-Received: by 2002:a05:6000:154e:: with SMTP id
 14mr14536243wry.305.1623140811159; 
 Tue, 08 Jun 2021 01:26:51 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l10sm18739792wrm.2.2021.06.08.01.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 01:26:50 -0700 (PDT)
Subject: Re: [PATCH v16 08/99] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-9-alex.bennee@linaro.org>
 <115f0f77-96e9-7eb1-c22f-d7dd0114d8a8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6765a53a-e69a-c3bd-8059-bc530314eaa7@redhat.com>
Date: Tue, 8 Jun 2021 10:26:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <115f0f77-96e9-7eb1-c22f-d7dd0114d8a8@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 11:11 PM, Richard Henderson wrote:
> On 6/4/21 8:51 AM, Alex Bennée wrote:
>>       if (g_str_equal(qtest_get_arch(), "ppc64") &&
>>           (access("/sys/module/kvm_hv", F_OK) ||
>> -         access("/dev/kvm", R_OK | W_OK))) {
>> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>>           g_test_message("Skipping test: kvm_hv not available");
>>           return g_test_run();
>>       }
>> @@ -1398,7 +1398,7 @@ int main(int argc, char **argv)
>>        */
>>       if (g_str_equal(qtest_get_arch(), "s390x")) {
>>   #if defined(HOST_S390X)
>> -        if (access("/dev/kvm", R_OK | W_OK)) {
>> +        if (access("/dev/kvm", R_OK | W_OK) ||
>> !qtest_has_accel("kvm")) {
>>               g_test_message("Skipping test: kvm not available");
> 
> I would have sorted the kvm test first.

access() is a simple syscall from the qtest, while qtest_has_accel()
spawn a whole QEMU process to exec the QMP request.

> For s390x, we has the HOST test, but ppc doesn't.  So we're doing the
> access() on any host, e.g. x86_64, where kvm cannot true for this test.

Hmm I suppose the issue you described predate this patch?


