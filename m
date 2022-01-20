Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4709495643
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 23:14:00 +0100 (CET)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAfgt-0004FT-6e
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 17:13:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZRQ-0005MX-SM
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:33:38 -0500
Received: from [2607:f8b0:4864:20::62a] (port=34593
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZRO-0007TG-4f
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:33:36 -0500
Received: by mail-pl1-x62a.google.com with SMTP id a7so5491999plh.1;
 Thu, 20 Jan 2022 07:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xVrUwaC5Da3NG7h7XaQHwYsDVPn1g1q3CH8quCRG2YY=;
 b=I/LytIrvlPy7VQvbfihfwiBTvio3QFgREy9Hu0EwkBf553ccAGw4MXu3EGqkeA3D7Z
 iL5J4lt9tjKJ8RaPgAE9gzjGPSV0tl4kYTX7K0KHbCLCsznxVgJqAxjaJ4Ek32ljL3+m
 yIQCeO3DpizYBt5Y9fW0Hwx3vFiiP92Bb1tfi1IuIC08917NOl5ZmTS6AOyL+9/tIeNj
 b2DpzJD/3JCUY3eFx4vWLk+WzykrwNfp6pyV/6uPYHo6rgKptpjdXfN4dpBtchVMsosT
 x15Arl2S1UR0g34af+DlPxZMyvNunvT6MBCaycYqwSsqpQr3shjX/P5dK+Bq5HN7kYkn
 J76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xVrUwaC5Da3NG7h7XaQHwYsDVPn1g1q3CH8quCRG2YY=;
 b=Zaubv68ZtQYKsWBzHJfIIbi6AFNTWHmuMA+g+aKdqUc2af0yEHzDfk7t7Ha6ogTwGy
 jz7T2us3bVBiiNJMOihK5h2psyqNPtKYhDy7y5b7Y8SAu1keH0hCd5gH3qd1VGVArZ/B
 5N41hgsWFn/7toAc/oVul84DEHsscBiZzy5TdASHvOmBR1ow/JPBSUn8q7pE4wa9h6gD
 tUUpQZwwv2mXOWj9xQtzE+EFRIgm7wdp2CrbSurpyagbAnfeQHyKUZlBUXXaMQXjW+34
 Xg8XBhcmkejAqFtjCKK/Rgn702V3rdyTaz1NHWRdBlwdDnric9SDUj9H5Dg6PeliBNY1
 QfJA==
X-Gm-Message-State: AOAM531lktuOqdu5zNuby/WSbUzmlFXHqqFy8LUkO3q9OlJ5cAqKw9YS
 R6KYSC9wAiIYYz7nfXuW02c=
X-Google-Smtp-Source: ABdhPJxW49IKjFPRnYxNaYP3d8WIBU9xlmtbJ3mIMahh0Nqzk8N0MQ/0dvFzLGmYGMjsqW/n9+358A==
X-Received: by 2002:a17:902:70c3:b0:149:a78f:54ea with SMTP id
 l3-20020a17090270c300b00149a78f54eamr37967091plt.114.1642692810874; 
 Thu, 20 Jan 2022 07:33:30 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m17sm3905160pfk.62.2022.01.20.07.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:33:30 -0800 (PST)
Message-ID: <90924276-9e15-64d3-450e-1a23e770e24d@amsat.org>
Date: Thu, 20 Jan 2022 16:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/6] drop libxml2 checks since libxml is not actually
 used (for parallels)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220120110545.263404-1-f4bug@amsat.org>
 <20220120110545.263404-5-f4bug@amsat.org>
 <b00aee2c-2085-1849-f7d6-cb6d9d7926f6@redhat.com>
In-Reply-To: <b00aee2c-2085-1849-f7d6-cb6d9d7926f6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 20/1/22 14:37, Thomas Huth wrote:
> On 20/01/2022 12.05, Philippe Mathieu-Daudé wrote:
>> From: Michael Tokarev <mjt@tls.msk.ru>
>>
>> For a long time, we assumed that libxml2 is neecessary for parallels

Also "necessary",

>> block format support (block/parallels*). However, this format actually
>> does not use libxml [*]. Since this is the only user of libxml2 in
>> while qemu tree, we can drop all libxml2 checks and dependencies too.

and eventually "QEMU".

> s/while/whole/
> 
>> It is even more: --enable-parallels configure option was the only
>> option which was silently ignored when it's (fake) dependency
>> (libxml2) isn't installed.
>>
>> Drop all mentions of libxml2.
>>
>> [*] Actually the basis for libxml use were merged in commit 25bfd5a75
>>      but the implementation was never merged:
>>      
>> https://lore.kernel.org/qemu-devel/70227bbd-a517-70e9-714f-e6e0ec431be9@openvz.org/ 
>>
> 
> Commit ed279a06c53784 also add a hunk to scripts/checkpatch.pl ... you 
> might want to remove that now, too.

Good catch!


