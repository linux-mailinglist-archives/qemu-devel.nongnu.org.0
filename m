Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E57B3AFEA2
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:01:31 +0200 (CEST)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvbLd-00013M-4g
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvbK9-0000HQ-3I
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvbK5-0005en-TP
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 03:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624348792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mScDcTZJFhVilcUgXI2x+NDjx8CioQ5MWNqw6ECNRLk=;
 b=ho7vUd3aYlEWRNx5BJOpg2/ZkzLcwHutsmT513IztLSBwPO78TSNtfYlHGZ4Lf041imCLy
 Lxfi9YTFmgHYudJySiRIajT5oc/2jA64yjLh1lsy7tQqUOCq0ziusr7a3eGQyX/7cA2kv5
 MF4zZRW+wBLJq/qTChuqdQooNaXnWcI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-zrA59FFPM_yG1j6ObXggXA-1; Tue, 22 Jun 2021 03:59:51 -0400
X-MC-Unique: zrA59FFPM_yG1j6ObXggXA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a05600c5103b02901aeb7a4ac06so419464wms.5
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 00:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mScDcTZJFhVilcUgXI2x+NDjx8CioQ5MWNqw6ECNRLk=;
 b=tG/poTrq2FGMf8AtVarwD3Q7aueGvcjUy+5LM2LE6T1LzYM3zGGoiLXXuR9WuEJZyc
 FLc/2M0ngXn5DR4ewXZXpMOFIgAuwfwD37htN78b9I2kF48XLE3j6x012zfU8QKPSuYG
 uDOfiCSN5BHkSPe1IbKb/B9WhmesHtX/+VTQxCUbubtFhW67rgt9y1wlKtyPmsGuMz42
 Q022pDshMZEhfwnYWKLgUMWI1Iox3kd/C+kwTzE0OKuyjGQiM6Ig0SFJcS0wI2oM/ONZ
 gmvwsupFMlNEjnhZrY6p44QD7oOvQA3FXf3iDDecxUHhgdn3RFzJumBtfEkoOwCsFD9m
 Gmyw==
X-Gm-Message-State: AOAM532B/QroaHOLeOYqtmLtClPrYD90q82qohe66wN5fTnHj4iIudHj
 ddkq0eyX1pkurOa9UEbs4cSPho+aGPXk7r8YNGzzrxGUpTlFw3t99NzQIsWvEjh1fcLZJ9fN7Rb
 Fv6LHDOvUlJ2uraM=
X-Received: by 2002:a7b:c097:: with SMTP id r23mr2788126wmh.63.1624348790296; 
 Tue, 22 Jun 2021 00:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8pAbVm31Nyo+gA485FlknLVXxUv/4Cdsd4FAxyVUL7SIDRwcD7pdqk/hfb5CoMLUkxyU9Fw==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr2788108wmh.63.1624348790108; 
 Tue, 22 Jun 2021 00:59:50 -0700 (PDT)
Received: from thuth.remote.csb (pd9575f2f.dip0.t-ipconnect.de. [217.87.95.47])
 by smtp.gmail.com with ESMTPSA id u12sm21238526wrr.40.2021.06.22.00.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 00:59:49 -0700 (PDT)
Subject: Re: [RFC 0/3] qtest: pick tests that require KVM at runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210616152455.1270264-1-imammedo@redhat.com>
 <f136b5a1-504b-c602-2e70-12b5b0d976b6@redhat.com>
 <75263d99-5da8-bdc5-e977-13c83a31b532@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <bb1b17d4-6da5-aebf-329a-905dd566ec6b@redhat.com>
Date: Tue, 22 Jun 2021 09:59:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <75263d99-5da8-bdc5-e977-13c83a31b532@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: lvivier@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/06/2021 09.26, Philippe Mathieu-Daudé wrote:
> On 6/22/21 9:20 AM, Thomas Huth wrote:
>> On 16/06/2021 17.24, Igor Mammedov wrote:
>>>
>>> Sometimes it's necessary to execute a test that depends on KVM,
>>> however qtest is not aware if tested QEMU binary supports KVM
>>> on the host it the test is executed.
>>>
>>> For an example:
>>>    test q35 machine with intel_iommu
>>>    This test will run only is KVM is available and fail
>>>    to start QEMU if it fallsback to TCG, thus failing whole test.
>>>    So if test is executed in VM where nested KVM is not enabled
>>>    or on other than x86 host, it will break 'make check-qtest'
>>>
>>> Series adds a lightweight qtest_has_kvm() check, which abuses
>>> build system and should help to avoid running KVM only tests
>>> on hosts that do not support it.
>>
>> You also might want to update the check in tests/qtest/migration-test.c
>> while you're at it.
>>
>>> PS:
>>> there is an alternative 'query-accels' QMP command proposal
>>> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-3-philmd@redhat.com/
>>>
>>> which I think is more robust compared to qtest_has_kvm() and
>>> could be extended to take into account machine type.
>>
>> Could you please get in touch with Philippe directly and discuss which
>> way to go? We certainly don't need two approaches in the end...
> 
> I'm certainly fine if Igor wants to restart this effort :)
> 
> Maybe doing as Claudio suggested, start have qtest_has_accel()
> tests accel with Igor's shortpath first, then fallback to
> 'query-accels' QMP command?

Yeah, that's maybe a good idea ...
But I'm currently wondering whether we need query-accels at all? For 
detecting kvm, we already have "query-kvm" ... and we don't have tests for 
any other accelerators yet (hax, hvf, etc.) ... so it's likely just about 
having a way to detect whether TCG is compiled into the binary? Is there 
already another command that could be used to check for the availability of TCG?

  Thomas


