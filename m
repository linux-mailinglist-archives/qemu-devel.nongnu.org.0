Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917904CBEF7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 14:37:39 +0100 (CET)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPleE-0006hB-8D
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 08:37:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPlZd-0004cm-D8
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 08:32:57 -0500
Received: from [2a00:1450:4864:20::330] (port=44688
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPlZb-0000dE-1M
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 08:32:52 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so3236235wmb.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 05:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=XtM/Ho8jUU2kZsk/45wske756RpiV+gVedc3QpopH6E=;
 b=IV0l720T83SZWIv2lIf0AJRoxB40p0kZFtfTPErMmpuwFGYdInOvXGXJxV6X8eu5hC
 LRsCVHWrXdJw1+n/DoEhIH7PqU+vXHco4wIe2gomju7XR66bMtU+ssUwHFVzoiI6Fi4O
 8+WBTvDtGIQJKkVcPKODtWYCFVY0TlSFLIMwhxeePJK5THHjNtoXxtnNpGxGKONVYLlY
 pSwQZaaXvSFfbwaGeoWHluBnPyGjS7yPQLNtzW2BNdZSSCqj9+CGB03+5Wk0AGCtk0MD
 RAV51uInBrXXdI92BlO6zIlzOmUoEIv8XdMLGfio97IaetLKQyp5+ZEJUi8VXoXLSqpj
 xTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XtM/Ho8jUU2kZsk/45wske756RpiV+gVedc3QpopH6E=;
 b=Py8aG+IwniU9D2gjmAsRH+al3Px3JZN4yVUfImbRIUERO3r7rpllIgSh0AYVKLESB6
 F0Ywn1EBgR7DaNdbHA0fz/oDVzmPzv5Q7ydTWBnEuPWazIgdFocJRRglb/PlY2ttbSq1
 UWqrp6czlmnRHKoh3op06YFG8zJZm7Z96ccAegC2xzt6Yx5NZw+Wn8J+PYjz8B4JBcSF
 eZdWUg1FrEIeZxZBP/IW5jnhLvudPe83zz2qlHi5zJ/aDK0Tlyzj6rZdhpIZOrGMxJWX
 QaTGq8XNU2YPcH1QXh+ymECrs7RCrGSmZgeN02fvg7ejHMjwIoItsOf1qIjyiIgHZ6Gr
 jhlQ==
X-Gm-Message-State: AOAM531bNBysKh7qUVx/19AQIZpYWSWB0nYTzvpzUinoHzWemyZzYkuy
 cYli3XfwPr5gQ+VYq+5f+k0=
X-Google-Smtp-Source: ABdhPJzyzFsUQ/wseBQbbOICDYwSljYpJ5crX30Or2pHKb0toDA3E3LVhJtMwdajqLNO5ulNINmK6g==
X-Received: by 2002:a05:600c:4fd0:b0:382:716a:c5fc with SMTP id
 o16-20020a05600c4fd000b00382716ac5fcmr3794764wmq.81.1646314366245; 
 Thu, 03 Mar 2022 05:32:46 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 f10-20020a05600c154a00b0037bbbc15ca7sm18125980wmg.36.2022.03.03.05.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 05:32:45 -0800 (PST)
Message-ID: <3f8f7c74-3f9c-c0b5-e009-c962fce08eba@gmail.com>
Date: Thu, 3 Mar 2022 14:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 11/14] softmmu/memory: add
 memory_region_try_add_subregion function
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-12-damien.hedde@greensocs.com>
 <bd6f884e-a150-88d8-4b8c-9ec76171b275@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <bd6f884e-a150-88d8-4b8c-9ec76171b275@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:12, Damien Hedde wrote:
> Hi Philippe,
> 
> I suppose it is ok if I change your mail in the reviewed by ?

No, the email is fine (git tools should take care of using the
correct email via the .mailmap entry, see commit 90f285fd83).

> Thanks,
> Damien
> 
> On 2/23/22 10:07, Damien Hedde wrote:
>> It allows adding a subregion to a memory region with error handling.
>> Like memory_region_add_subregion_overlap(), it handles priority as
>> well. Apart from the error handling, the behavior is the same. It
>> can be used to do the simple memory_region_add_subregion() (with no
>> overlap) by setting the priority parameter to 0.
>>
>> This commit is a preparation to further use of this function in the
>> context of qapi command which needs error handling support.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   include/exec/memory.h | 22 ++++++++++++++++++++++
>>   softmmu/memory.c      | 23 +++++++++++++++--------
>>   2 files changed, 37 insertions(+), 8 deletions(-)

