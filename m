Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C484AB19B
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 20:18:35 +0100 (CET)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGn3S-0002RS-Fm
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 14:18:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nGn0L-0000d9-Ot
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 14:15:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nGn0F-00033N-3Z
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 14:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644174911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zv0bAlmcpx7dUll1uNNjlHFQbPNjnnVtaVcYairRIKo=;
 b=Zqp31Erwb5uxByE28ZNkINA9NdYrt1V5jyWq6iwHTRFBDPdIcHni8fkYBB97zSt9l5NIIl
 sISzRqIH1l0FEMmjvwBYT5reoSUaQg5aeWtcnlHWuwnP4vSbFS4haJM+Ac0UFUaIH/ShZe
 ra7BIKCmsUxFyczZ2klorcGJJpv40Ck=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-zz3b8idgOJeNuLbEZu3okA-1; Sun, 06 Feb 2022 14:15:10 -0500
X-MC-Unique: zz3b8idgOJeNuLbEZu3okA-1
Received: by mail-qt1-f199.google.com with SMTP id
 g13-20020ac8774d000000b002cf75f5b13aso9472679qtu.11
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 11:15:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=zv0bAlmcpx7dUll1uNNjlHFQbPNjnnVtaVcYairRIKo=;
 b=6Nf/ZioM45PQuFwQUbCVaxVt5z9VLON1YLEI5f/86pNltOJbBplItJDqlIXuAoapyN
 4MpjoRgkm8ZE+fNK7x7492lFrJ+4cHQ34tg+qp4n5GGqFAqnYJk/aHmYSPmuXCJ4x/kB
 a2d5CDLutQI7CMQR6XVodHvuWHXnwj0ZwpOMz1q58hCX8ADv9ENG5LPUuBwPfmGpQwVK
 hh6MawZ5mIceMau4EPeSltw8W1ce33VYadyrfZ1JDXsIjXieM0h4EnTGh9/uKGuXMCUY
 JYjLH7SLVN94ZI9Zr7Rh8uBc01sx4kF4dP2g7xKrvmqDMIUc8kdLuQfWLd+re98L0cNu
 +fLg==
X-Gm-Message-State: AOAM531TInIS1GrmcV3oY5OBfwwM0eUY+fitdOHak9gb8CAf7yWiGw6Y
 kHqO1JwYgB438FxaxVR7V8b985R/GD0ZfYGBLX/oMKWSPTORBM7kfGHuBg2yxxKAkDtKg16Bl+w
 TW6La1X8pXZhN+Q4OheCNrs4SLT/5pw9OUi6YhqndLpkSbWuzQtLCErpwrntpf4nw
X-Received: by 2002:a05:620a:16cb:: with SMTP id
 a11mr4741176qkn.614.1644174909867; 
 Sun, 06 Feb 2022 11:15:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQ4J0xCtXIhGj0WU/o3jAR4F38OoIMrSUvUxHhPKZw5HEnPgZrYz1NDHqCiDtDHBRWSN3xhg==
X-Received: by 2002:a05:620a:16cb:: with SMTP id
 a11mr4741150qkn.614.1644174909604; 
 Sun, 06 Feb 2022 11:15:09 -0800 (PST)
Received: from [10.0.0.97] ([24.225.241.171])
 by smtp.gmail.com with ESMTPSA id bl1sm4285685qkb.16.2022.02.06.11.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 11:15:09 -0800 (PST)
Message-ID: <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
Date: Sun, 6 Feb 2022 14:19:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
From: Jon Maloy <jmaloy@redhat.com>
To: qemu-devel@nongnu.org, f4bug@amsat.org
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
 <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
In-Reply-To: <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jmaloy@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trying again with correct email address.
///jon

On 2/6/22 14:15, Jon Maloy wrote:
>
>
> On 1/27/22 15:14, Jon Maloy wrote:
>>
>> On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
>>> Trivial fix for CVE-2021-3507.
>>>
>>> Philippe Mathieu-Daudé (2):
>>>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>>>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
>>>
>>>   hw/block/fdc.c         |  8 ++++++++
>>>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>>>   2 files changed, 28 insertions(+)
>>>
>> Series
>> Acked-by: Jon Maloy <jmaloy@redhat.com>
>
> Philippe,
> I hear from other sources that you earlier have qualified this one as 
> "incomplete".
> I am of course aware that this one, just like my own patch, is just a 
> mitigation and not a complete correction of the erroneous calculation.
> Or did you have anything else in mind?
>
> Regards
> ///jon
>


