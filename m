Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5099F3CFAE6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:42:01 +0200 (CEST)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5q0W-0006Rp-CT
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5pyg-0004gA-KN
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5pyd-00040A-Gt
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626788402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+9llFDAPCFi1ljbaBlFyKGTyYvkcXk8wFlk7L+Ewnc=;
 b=NLu0v0g/k10200vV4RQyadxTSBA3XKpUkSTH14QUTfKq2F7VQDwLlJT8UAdatt3bbBDqYu
 IQrsGHg7RcbUmb+PbSSPTIAQNJr6EZINcT6AK1+4rSjUmlAqM/bIgDogTpsKmAqbH22kiZ
 cyjTCrM6x6e958YwIHPQVXkSJ/q3K7w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-12-GiG6NNPmc1pmFza-rdw-1; Tue, 20 Jul 2021 09:40:01 -0400
X-MC-Unique: 12-GiG6NNPmc1pmFza-rdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 7-20020a05600c22c7b0290227b752f429so2234178wmg.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 06:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E+9llFDAPCFi1ljbaBlFyKGTyYvkcXk8wFlk7L+Ewnc=;
 b=psP61z1qQBtupHv2YksRGiQCe1lOUeLHUR/WsW0B3ltrRPj1nxj8Iw+obXuR7XUxHB
 leTq//5lWY0G9eEI9/GxVyI/eY2U1CAoPiVA5Thy6UPRt+kt/xC5IgpayiQ3S3pfFpOb
 BTGaBuLtM+6c1IsgU7OYP3Zv99xTTwL16h99upMVM2Yho4flrjrcKn3RAZK2pVcCEneq
 dEca50OZ1pajJSRTwXztL5U2E6R3IIGLENd5tKfu9XD/1wrrsHUQ+fk0oaOR/WgOg4RK
 xOzHfn/XRIy5AR48RokIq1YWLPYgtwixet8M66QkQTp0oTzZdra5a5DoDthdMBAqkFr6
 XSmA==
X-Gm-Message-State: AOAM531ZdbM7HULYK8YUXijPKmhGyKU9/gwCvF/n/EYSLsMQH1IMLqb6
 WI+n7uH5NcJzF3FaSINoRckLDI7oHwE03F9LxF5Te/AqVRSDxIJuL4grumjur5TILmb8Z4Wfdlc
 i4lVhAn2DO2LKtvo=
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr31797036wmb.162.1626788400013; 
 Tue, 20 Jul 2021 06:40:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweVYtx6c0dkrSEeceIDG9wkBhSWUFdcbze0Zfw2L0YQ+O1A9+wswOePu/rAQwkU8rIinVDOg==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr31797012wmb.162.1626788399887; 
 Tue, 20 Jul 2021 06:39:59 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id m4sm24036627wrs.14.2021.07.20.06.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 06:39:59 -0700 (PDT)
Subject: Re: [PATCH v5 4/5] hw/nvme: fix mmio read
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210719224647.68559-1-its@irrelevant.dk>
 <20210719224647.68559-5-its@irrelevant.dk>
 <ccc55fb4-2488-83e1-589c-53b3f31b6719@redhat.com>
 <CAFEAcA-yM3H43KBc4je-PhyXKgSpr4Vu=56P3T22tTLY90OUqg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <275fe4b9-8cce-f160-0b4b-9b5853f9d4e2@redhat.com>
Date: Tue, 20 Jul 2021 15:39:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yM3H43KBc4je-PhyXKgSpr4Vu=56P3T22tTLY90OUqg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 3:33 PM, Peter Maydell wrote:
> On Tue, 20 Jul 2021 at 13:58, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> On 7/20/21 12:46 AM, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> The new PMR test unearthed a long-standing issue with MMIO reads on
>>> big-endian hosts.
>>>
>>> Fix this by unconditionally storing all controller registers in little
>>> endian.
> 
>> My brain overflowed at this point, too many changes to track :/
>>
>> Would it make sense to split it? (per big function body maybe?)
> 
> I did review of (a previous version of) the patch by:
>  (1) check that after the patch is applied there aren't any
>      direct accesses to n->bar.anything which don't go via a
>      ld*/st* (ie it didn't miss anything)

OK

>  (2) check that the accesses which use ldq/stq are consistently
>      doing so for those fields and that they are uint64_t

OK

>  (3) read through the patch and check all the changes are ok
>      (either using inline calls to the accessors, or fishing
>      the value out at the start of the function)

OK, perfect then :)

> It is a big patch, but I'm not sure splitting it apart helps much.

Since it is reviewed, not needed.

Thanks a lot!

Phil.


