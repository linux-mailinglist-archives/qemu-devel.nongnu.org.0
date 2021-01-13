Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBA92F5536
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:31:26 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzpbp-0006ti-9q
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzpa7-00069t-07
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzpa2-0003qB-Qx
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610580573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fif37q7xRFd66DR0whtSibS93whJ6zeQDCaP5SPREV4=;
 b=G5PZjsduNlEpcubt2NNbbaHYq7gD512/yOTh5THHoD+FyBdLIG7dD8nU+y7kn54GPhkdCn
 QT1hvhf3OcH9hcKPFX2WusJ9ElF0z7wD3ULeOpdNAy8DHJGyFXugmuktwfdXj2wCY7rYka
 3C6hOB7E2HoOP9PpzEaf65cSt0kSeXc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-5atE0lvzPh2TsZ86soBd0A-1; Wed, 13 Jan 2021 18:29:32 -0500
X-MC-Unique: 5atE0lvzPh2TsZ86soBd0A-1
Received: by mail-wr1-f71.google.com with SMTP id u29so1704295wru.6
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fif37q7xRFd66DR0whtSibS93whJ6zeQDCaP5SPREV4=;
 b=Gks36GmD1+BCqP+imCz2HszuvJmQl9iMtZP92J3frjrTUckUBA96HJ1qbOpRg4SHs0
 65pux+d7s9cvFg3wqcP7o6YVyj+frpWzMyt5ZyfSDH0aIOtssHqgtl7dZHsSqF83tgTD
 gBejp6qCEFI4rIxKJu9tn98mu6UQ+fwERJPbwg9KpV3BJQ7/tnVCr6xDI9EoBq3zsYjY
 11MrmCRcxeYZfP7+kp7itCJbs/sNvWMrPL5tV225vS2fiEyQchE4GqUsGKXOGvUrF217
 ZQZVmGISCl0d/Jnb8SN7NXsfeh4lffh8I4RV3kTLELgCUmgr1f/7azvIkcDBL710VqZE
 vNWQ==
X-Gm-Message-State: AOAM530JripICFznBYiGWEC+wURBdfO6pesI/GImft1FTvCr1OrJ5Tjb
 vJRdpFnTNBzLbOwurLODlrJBon2eyaP0oj9YDTJNGtByvQnIeBDynKU+/JihnrlkRQSm+biQFH3
 LNa4RtJrFZlDsqcSFDiQhY1bOwzwDcVqrU2hgjejLqaJSQhu1ENElpTqudN0iE4P2
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr4975162wrp.30.1610580570913; 
 Wed, 13 Jan 2021 15:29:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUvWFbqC92jAmHWuoiiPuN8eBx7wubl8iV1+Q1XOE4XaNT7FvsD0u9fZGL934En4TbZRlcFQ==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr4975145wrp.30.1610580570665; 
 Wed, 13 Jan 2021 15:29:30 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z6sm5958234wrw.58.2021.01.13.15.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 15:29:29 -0800 (PST)
Subject: Re: [PATCH 0/2] MAINTAINERS cleanups
To: John Snow <jsnow@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201030153416.429791-1-jsnow@redhat.com>
 <2e2482ad-0d71-d34c-320a-b95117559a53@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6fb0c5c9-f248-036f-f9f0-6c1f85ab5484@redhat.com>
Date: Thu, 14 Jan 2021 00:29:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <2e2482ad-0d71-d34c-320a-b95117559a53@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 1/13/21 11:08 PM, John Snow wrote:
> On 10/30/20 11:34 AM, John Snow wrote:
>>
>>
>> John Snow (2):
>>    MAINTAINERS: Remove Ben Warren
>>    MAINTAINERS: Make status spellings consistent
>>
>>   MAINTAINERS | 13 ++++++-------
>>   1 file changed, 6 insertions(+), 7 deletions(-)
>>
> 
> A little late for 5.2 now, but ... ping?


