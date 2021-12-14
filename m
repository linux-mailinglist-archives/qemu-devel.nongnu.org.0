Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5B47405D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 11:22:53 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx4xQ-0000Qe-O3
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 05:22:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx4uN-0005yv-Cw
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:19:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mx4uJ-0001cd-7j
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 05:19:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639477175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLMgKK/JrOY9uRL8qCHVae/idATtrVSrEl4IRbrqANY=;
 b=EXQHJJCWC+lq+FZzBxeHhBDdl61bH7BpkZojKjHLhe5nwdvkLaFmB1r5zF5U9wJfmx+AaD
 1sWIe3s1vMyvhDS+dol6Ws3GnMipjyVDYEOeIBeU/t8qRkOH84EagBDdVnL9jS2rNfKWA9
 7qpgxisypBgyHBhAdTwaecCuQ3EdrNU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261--gl0QyswMfmw4XRS8_KO7g-1; Tue, 14 Dec 2021 05:19:32 -0500
X-MC-Unique: -gl0QyswMfmw4XRS8_KO7g-1
Received: by mail-wm1-f72.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso11103125wmc.2
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 02:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MLMgKK/JrOY9uRL8qCHVae/idATtrVSrEl4IRbrqANY=;
 b=5/ZUs0KX6LMtJeNmzTROckGgDhAz+/86ArLbvzwpXcwQDn7rfl3XhmuAKRqycdwGb8
 oOvpm2I2LzJ5cew+kk4Nem4BMcshRsl/57RLcyirrx7TH+wfH/zpOsXwM67MKhI8KSt/
 GB54PFw3GZZjPTMv3q7ER1iYIurhJRZ1lkqhtm5JavDIaZT+1zoXwbRtdARHjsJzlvSm
 PnmunQoXV9Bl1A5OwMs8dOX5mXH5Zy7P2fJx6G5x0+9hai1U7MFk2kpQazVaqYrB3I2H
 fUs54XjPuFz9bEdndNYD2DD35DQiEaVPwCf3fYngvlbO5/EoLFbClQ2avbLi+BfDlqZS
 L45g==
X-Gm-Message-State: AOAM532rA1I0oYiz7eDEaenUAUCNyrd3pJpEDQ/qLclSlzNSEjoOLXCt
 Eita0PTe/p1MsinXFg9BMzk7G+qEbBxV/YkzrJLUx2bCXZd1pZdPYCgOSttvhEXipziCggdlcAJ
 dUU9ixUw10R/pSJw=
X-Received: by 2002:a05:6000:110a:: with SMTP id
 z10mr5035717wrw.396.1639477170714; 
 Tue, 14 Dec 2021 02:19:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzx7pjs2Hk1IRewPz1kXOxPrCKqnDLlC5EPSN9nSwrBF5pTle66K4CNIVHByJyXsLusM2OH3Q==
X-Received: by 2002:a05:6000:110a:: with SMTP id
 z10mr5035692wrw.396.1639477170540; 
 Tue, 14 Dec 2021 02:19:30 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id p10sm9546424wrr.24.2021.12.14.02.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 02:19:30 -0800 (PST)
Message-ID: <075c152d-13a4-7f33-deb8-23db30059fcd@redhat.com>
Date: Tue, 14 Dec 2021 11:19:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2] MAINTAINERS: Change my email address
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211214075424.6920-1-zhanghailiang@xfusion.com>
 <fc7b5d91-98f6-b146-4a67-5e6800bccadc@redhat.com>
 <YbhiU8ARoS5LcORY@redhat.com> <b147182688034454a7179cae9f6481ce@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <b147182688034454a7179cae9f6481ce@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Wencongyang \(HongMeng\)" <wencongyang2@huawei.com>,
 Hailiang Zhang <zhanghailiang@xfusion.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 11:15, Gonglei (Arei) wrote:
>> -----Original Message-----
>> From: Daniel P. Berrangé [mailto:berrange@redhat.com]
>> Sent: Tuesday, December 14, 2021 5:22 PM
>> To: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Cc: Hailiang Zhang <zhanghailiang@xfusion.com>;
>> qemu-devel@nongnu.org; Gonglei (Arei) <arei.gonglei@huawei.com>;
>> Wencongyang (HongMeng) <wencongyang2@huawei.com>;
>> dgilbert@redhat.com; quintela@redhat.com
>> Subject: Re: [PATCH v2] MAINTAINERS: Change my email address
>>
>> On Tue, Dec 14, 2021 at 10:04:03AM +0100, Philippe Mathieu-Daudé
>> wrote:
>>> On 12/14/21 08:54, Hailiang Zhang wrote:
>>>> The zhang.zhanghailiang@huawei.com email address has been
>> stopped.
>>>> Change it to my new email address.
>>>>
>>>> Signed-off-by: Hailiang Zhang <zhanghailiang@xfusion.com>
>>>> ---
>>>> hi Juan & Dave,
>>>>
>>>> Firstly, thank you for your working on maintaining the COLO
>> framework.
>>>> I didn't have much time on it in the past days.
>>>>
>>>> I may have some time in the next days since my job has changed.
>>>>
>>>> Because of my old email being stopped, i can not use it to send this
>> patch.
>>>> Please help me to merge this patch.
>>>
>>> Can we have an Ack-by from someone working at Huawei?
>>
>> Why do we need that ? Subsystems are not owned by companies.
>>
>> If someone moves company and wants to carry on in their existing role as
>> maintainer that is fine and doesn't need approva from their old company
>> IMHO.
>>
> 
> Agreed. I'm just confirming HaiLiang's identity. 
> 
> Acked-by: Gonglei <arei.gonglei@huawei.com>

Thank you!


