Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A846FDD5
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 10:34:19 +0100 (CET)
Received: from localhost ([::1]:40958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvcIF-0003at-0Z
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 04:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbRY-0005vH-At; Fri, 10 Dec 2021 03:39:55 -0500
Received: from [2a00:1450:4864:20::52d] (port=46737
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mvbRP-00020J-L1; Fri, 10 Dec 2021 03:39:52 -0500
Received: by mail-ed1-x52d.google.com with SMTP id y13so27178587edd.13;
 Fri, 10 Dec 2021 00:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PX868/obc1iMTg/1rPM091fNA3ap04wbamrdieOm43M=;
 b=TtIGAoYBQcR3mnvw9J/ZmMTe7iHEDg/L0clFlqHOSlVvqGdoa0BukvkWKx/2yGOC6w
 Fcqp3tMJe/x5TJvghX4RXRaJ0DdW9r3PQAH/xxZ+eXF5KoA18IllQriOZ3ERMp2spD9j
 vQWpHYoBVY+YhneR8211L9DvunO8dZOOqUTu7jxw5MbSDGht9JQcYxIWIe+kwNsAWjVE
 jvggS7Hyxqdmq0UAsvKYZmEm6YdJcF3wgAMX7LHjbQQjDRhjNk26ZApHVomasf3lHfcZ
 RkjkWt9TnwlvjLex24qnQJZr7ySj/dRKTK4N8+NxsLpmrAaTitPZ0dqh0Ik80OGcp+OF
 bOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PX868/obc1iMTg/1rPM091fNA3ap04wbamrdieOm43M=;
 b=EniLJzz5f/ICT29lMLc1akKz8cwjMzYeWeQwOTxdJKpmWpMWfSVxccz+GG5y3UwzMD
 sZ5mrNJbZ7QHZkQMm0dOEvhX0/cgd2BuqW2iNOkndsoDM3YqG+8/b7GXj9/LXqwadHUD
 EGCu6DSWqLy0hhwQkq6zeuJHz7YiQbrrPB95g48bb4nec/YJTfAzxj1tRfA18y/ghhJe
 /qe0eUAEYvddXuLTiW1mFez21xJlUc0UF5n05qKNnRQzYjWaT0FlZEKfXo0/vbjs+zbF
 sSmEr9lgb3EVNuwuj+EavykUvFjgzl7jKh8S9dGyLIvASM+m46Z/33TLAhAnNTIfzbtV
 J5+A==
X-Gm-Message-State: AOAM531PKPMurM6jtr1hy+BLvuNNyIC+GrCjkHCwVlfW5oiZp/qQ245a
 kOkCLQ0mV/yJaTvjBqFgvlkKjWpcs0Y=
X-Google-Smtp-Source: ABdhPJyeRG9rVTr/IDC1+ghm9Db63wB10uFoE5QM26/wDTFhwMoFb0YK73QjLG5NSbNyNkBgORp2rA==
X-Received: by 2002:a05:6402:154:: with SMTP id
 s20mr38349614edu.148.1639125575805; 
 Fri, 10 Dec 2021 00:39:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id sc7sm1085508ejc.50.2021.12.10.00.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 00:39:35 -0800 (PST)
Message-ID: <aa0b8d39-32ad-b3a0-afff-474de704211f@redhat.com>
Date: Fri, 10 Dec 2021 09:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] Move CONFIG_XFS handling to meson.build
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-4-thuth@redhat.com>
 <e02332c0-7c4e-18a2-5c33-b00e8045f6da@redhat.com>
 <7da70e19-537b-9ca5-125d-f9bcf2d3f6df@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <7da70e19-537b-9ca5-125d-f9bcf2d3f6df@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.317,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/21 08:53, Thomas Huth wrote:
> On 02/11/2021 12.34, Paolo Bonzini wrote:
>> On 28/10/21 20:59, Thomas Huth wrote:
>>> Checking for xfsctl() can be done more easily in meson.build. Also,
>>> this is not a "real" feature like the other features that we provide
>>> with the "--enable-xxx" and "--disable-xxx" switches for the
>>> configure script, since this does not influence lots of code (it's
>>> only about one call to xfsctl() in file-posix.c), so people don't
>>> gain much with the ability to disable this with "--disable-xfsctl".
>>> Let's rather treat this like the other cc.has_function() checks in
>>> meson.build, i.e. don't add a new option for this in meson_options.txt.
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>
>> I think we should just use ioctl and copy the relevant definitions 
>> from Linux:
>>
>> struct dioattr {
>>          u32           d_mem;          /* data buffer memory alignment */
>>          u32           d_miniosz;      /* min xfer size                */
>>          u32           d_maxiosz;      /* max xfer size                */
>> };
>>
>> #define XFS_IOC_DIOINFO        _IOR ('X', 30, struct dioattr)
> 
> I've now had a closer look at this idea, but it's getting messy: We'd 
> additionally also need the platform_test_xfs_fd() function that is 
> called from file-posix.c ...

platform_test_xfs_fd() is only used to decide whether to invoke 
XFS_IOC_DIOINFO; but failures of XFS_IOC_DIOINFO are ignored anyway, so 
we can get rid of is_xfs in BDRVRawState, too.

Paolo

