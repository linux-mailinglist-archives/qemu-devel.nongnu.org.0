Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9973D9F39
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:09:59 +0200 (CEST)
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9178-0007jR-AU
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m915h-00067M-2s
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:08:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m915f-0006CB-Gp
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUM/eQKNTgDIh7wZ+iGb5P8wKyb/ANpqMM1Glo+mkw8=;
 b=YCCo7Qs5ppisgV37E4uyMOvkn5vdtNuuqH2vnw2JnAc+YwX2WlB4XNx277LIhHkMx2bTg/
 aNK95kJI+Dxqre8vhDsHa2F+SFANwEC9+O92gznlMZGSWIBYCq/F0M6kJsUivbZkDcZwwO
 Io8NpTxvfzaZvvLUqwUdqnxdtzBynNA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-T5XgR5e0OeK2OuOHh0KgHw-1; Thu, 29 Jul 2021 04:08:22 -0400
X-MC-Unique: T5XgR5e0OeK2OuOHh0KgHw-1
Received: by mail-wm1-f69.google.com with SMTP id
 g187-20020a1c20c40000b02902458d430db6so614513wmg.9
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MUM/eQKNTgDIh7wZ+iGb5P8wKyb/ANpqMM1Glo+mkw8=;
 b=OuMIwQl7oWxRaGULUxYxzou5LHvWP/uheuzvOvGxVsMfxws+1sFnQhVKHCYInlsqIT
 Bs5vPWx0cLYX2d/G9PQaPhAx12QosT3sODajsULK3gyzpFeJ4u/fwfGrDCKpP+rCYJWW
 irNFiRu6Qb319CseVS6hEiJgnDAM7NUwkrheHsJ8DV3E7Q+perFwpo4MP/uL6HGf9337
 QfzNPwnPItYqFtZxVGB1mGA+kI4J+xXpjedY0cwvV1UVL11EnaLi+Ozwc7nJ9SZ7YCyM
 bID1HcS8cPPAnjDi37BUHvM/sFKYBeyXKsGQanS3dKFjJSZQGSE7sdvx2La3URcc3xsK
 F/ng==
X-Gm-Message-State: AOAM532873ay5jNPq/mbh3uoheSHsTadqWO4w3AUh9tUaRY9jhyJ1N9B
 mjCcKAhaVVCsCPKJRQwnjOnFgyXZ8PwSaek7GnQxONkHn9lfYwYNckLaLmbVKruT7o+3P/Le2bv
 JbI3nT8OxkyHpPmQ=
X-Received: by 2002:adf:f351:: with SMTP id e17mr3455914wrp.360.1627546101691; 
 Thu, 29 Jul 2021 01:08:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKuywWz0nwx7cyzIMdSHZJkQWbhtsqtldxsMBvZSkM8DBM8qAmfRtxxsHxZGCzijEyCy7MuQ==
X-Received: by 2002:adf:f351:: with SMTP id e17mr3455902wrp.360.1627546101550; 
 Thu, 29 Jul 2021 01:08:21 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id j140sm2453785wmj.37.2021.07.29.01.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:08:21 -0700 (PDT)
Subject: Re: aarch64 efi boot failures with qemu 6.0+
To: Guenter Roeck <linux@roeck-us.net>, Ard Biesheuvel <ardb@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210724185234.GA2265457@roeck-us.net>
 <20210725181334-mutt-send-email-mst@kernel.org>
 <14aff6ab-0b96-fe22-bc35-18d2e8528a5b@roeck-us.net>
 <2a4076fd-2225-b3a8-7a1e-3bc090046673@redhat.com>
 <CAMj1kXGBpyqB3Upt76ynry-cmowRGCcyMpWzHV2xiyS+txytdQ@mail.gmail.com>
 <20210727004401-mutt-send-email-mst@kernel.org>
 <f526c655-3d25-bf66-8f96-cef55c9f6fa3@roeck-us.net>
 <20210727045315-mutt-send-email-mst@kernel.org>
 <20210727123603.6119c34c@redhat.com>
 <20210728090555-mutt-send-email-mst@kernel.org>
 <CAMj1kXFi43BiaG3pheqDLp_uqFpiS327mMaoc-NOt3HuoS5xsw@mail.gmail.com>
 <80674caa-817a-8be0-2122-fe543ec08a50@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5de773d1-48c8-1e56-493d-7c94cca78ee7@redhat.com>
Date: Thu, 29 Jul 2021 10:08:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <80674caa-817a-8be0-2122-fe543ec08a50@roeck-us.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Igor Mammedov <imammedo@redhat.com>,
 Ard Biesheuvel <ardb+tianocore@kernel.org>, Jiahui Cen <cenjiahui@huawei.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/28/21 4:03 PM, Guenter Roeck wrote:
> On 7/28/21 6:25 AM, Ard Biesheuvel wrote:
>> On Wed, 28 Jul 2021 at 15:11, Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Tue, Jul 27, 2021 at 12:36:03PM +0200, Igor Mammedov wrote:

>>> As others noted the original commit was kind of vague:
>>>
>>> 1. it said "Using _DSM #5 method to inform guest os not to ignore the
>>> PCI configuration
>>> that firmware has done at boot time could handle the differences."
>>> which is not what the spec says and not what the patch did -
>>> guest os does not ignore configuration even without this,
>>> it is just allowed to change it.
>>>
>>>
>>> 2. is says could result but does not report whether that happened in the
>>> field.
>>>
>>>
>>> Given this causes a regression I'm inclined to just revert for now.
>>> We can figure it out for the next release.
>>>
>>
>> For a revert of commit 0cf8882fd06ba0aeb1e90fa6f23fce85504d7e14, feel
>> free to include
>>
>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
>>
> 
> and:
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
>> and please also involve me if any future debates on this subject flare
>> up again.

Thanks all, this thread has been very instructive.

Michael, if describing the issue in the revert is too complex, could you
include a link to this thread in the revert description?
(Message-Id: <20210724185234.GA2265457@roeck-us.net> or
https://www.mail-archive.com/qemu-devel@nongnu.org/msg826392.html)


