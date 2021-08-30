Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB733FBE09
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 23:20:06 +0200 (CEST)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKohE-0004aM-3B
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 17:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKod4-00014S-8Q
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:15:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mKod2-0003PD-JI
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 17:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630358140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RfAH3p+mofFKW+xcTdEOEkaD0EYIqRkv/KYubng9Et4=;
 b=gHDCKd+4ztyXsyxaDSuADkl1vDkqMeMk7btxnWSWkFsxKbRYQNSd0/s3mXPad3bZz9Lqlk
 VZYUtJkQXlqkm/2Ei+MOdU9sso1cqpNFhkkBmhZB4J7Lfc6Xip7oLf0YmkfduDTtKwjnfa
 BEvVUr7pmTgLVHGfnQBJ4q40wgQjpE0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-ijjNsQEgMra65oGTZ1C3iw-1; Mon, 30 Aug 2021 17:15:38 -0400
X-MC-Unique: ijjNsQEgMra65oGTZ1C3iw-1
Received: by mail-wm1-f70.google.com with SMTP id
 n16-20020a1c7210000000b002ea2ed60dc6so373236wmc.0
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 14:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RfAH3p+mofFKW+xcTdEOEkaD0EYIqRkv/KYubng9Et4=;
 b=jQSPUjblui1OYrnQLGA7oDix6cDWdlAilrIxqfkBs2+vqb5FG+V4KsIMePHPG2ZwcG
 J5JxVYLPFzRkpwF9G0k+kOnt9Q63YBbyrYrEwnYpgRnhcP223T+LN+rWiEulqTqAYdMe
 XJ73mIF7LRHwQalXTLE/X9diqPVIKzD5CG4kwEGl8vNAB+ByE2TLoAzycPlTv69DKtXD
 s2ZUp/71xindWVDJhuUSkBNeX3+N3g8DCBK41xbFH7BC4RkXSEin3vkyq8y9n2JwRHmg
 HXfIClCGbKMELdJEbjqyGbEnaZdh1hAxj7001tf9/cCalHiA/WTHmgO8nPwSHgYOD0b+
 tgow==
X-Gm-Message-State: AOAM530SRT59Cv+OIiGcP4TIQVe2A4vFFwrIHm3e48dpLIz5b8cNeAh0
 7Zathb3Gg/Lp/5vNJ2PLiZf8D9P/xGa0+J6W8F7G5JykbJL7TV6SigL7pNmJoe9xs2eYOnRTf1Z
 OzOHrgsyd/luwmrg=
X-Received: by 2002:a1c:f709:: with SMTP id v9mr927071wmh.124.1630358137067;
 Mon, 30 Aug 2021 14:15:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAgwWhxKhELIpPL0zdOxqpKHPRQWWqH+yRQ6/kUFJ4kEf/QfIZTcshcfLm1L+PXZABx6L7rQ==
X-Received: by 2002:a1c:f709:: with SMTP id v9mr927057wmh.124.1630358136895;
 Mon, 30 Aug 2021 14:15:36 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id c14sm16274482wrr.58.2021.08.30.14.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 14:15:36 -0700 (PDT)
Subject: Re: [PULL 5/6] docs: split the CI docs into two files
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210825110018.100913-1-thuth@redhat.com>
 <20210825110018.100913-6-thuth@redhat.com>
 <224f739e-96c6-0e14-e53d-d64a8ade64ca@redhat.com>
 <f09c711a-3d74-ca4f-05e4-0d6ebf380e5e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4da56a6a-a3b6-f17b-a9a7-c81fe5b903d2@redhat.com>
Date: Mon, 30 Aug 2021 23:15:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f09c711a-3d74-ca4f-05e4-0d6ebf380e5e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.932, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 6:02 PM, Thomas Huth wrote:
> On 30/08/2021 15.33, Philippe Mathieu-Daudé wrote:
>> Hi Thomas,
>>
>> On 8/25/21 1:00 PM, Thomas Huth wrote:
>>> From: Daniel P. Berrangé <berrange@redhat.com>
>>>
>>> This splits the CI docs into one file talking about job setup and usage
>>> and another file describing provisioning of custom runners.
>>>
>>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>> Message-Id: <20210812180403.4129067-2-berrange@redhat.com>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   docs/devel/ci-jobs.rst    |  40 ++++++++++
>>>   docs/devel/ci-runners.rst | 117 ++++++++++++++++++++++++++++
>>>   docs/devel/ci.rst         | 159 +-------------------------------------
>>>   3 files changed, 159 insertions(+), 157 deletions(-)
>>>   create mode 100644 docs/devel/ci-jobs.rst
>>>   create mode 100644 docs/devel/ci-runners.rst
>>
>> You took this one but not the following "docs: add definitions of
>> terms for CI/testing", is there something missing there?
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg830839.html
> 
> I took the patch from Daniel's series here:
> 
>  https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg02102.html
> 
> The second patch there did not apply anymore.

Willian can you respin it please?

> Sorry for missing Willian's patch, I can put it in my next PR if nobody
> beats me to it.

No worry, thanks!


