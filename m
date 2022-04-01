Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA594EEB5D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:33:23 +0200 (CEST)
Received: from localhost ([::1]:40082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEao-0000ig-7g
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:33:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1naEZ1-0008BS-0q
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:31:31 -0400
Received: from [2a00:1450:4864:20::333] (port=54159
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1naEYz-0001kg-HL
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:31:30 -0400
Received: by mail-wm1-x333.google.com with SMTP id p189so1395843wmp.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AtF3YETvIejebq08jvdZJgLq1wEorQLSWiG/DBxcx0w=;
 b=lvSBD5FnoO3/DFbfU1B54a9yVwNsFrAa7f0s3ZG+TCyJ344a9d5c1WcryF3hoi8txN
 4yjNlDb7w0c6izAQE9Zf4EIcEzmFfZH5XWu8kQtcs2l0WNUZYGpklpp6OXHf1icu8K6O
 VvnJ/Sr5u++l+u+6wCcaRqb4K7Z5bOjtxx5FG4za7NmvwaZoVq70gUfSEmR8MGO/SGl9
 EpXGiXK8CyikeduqeuItmi2yUCkCtZHodzDf0LtBKZ649hIo45rTy0TDxA7KRk1Pmb1g
 Mqsvmf+2WjjopuCEk2hQmbb5ExN3XDgbs57gGSi9fsK1cmyvsoXPFQq7ylYJXJgVi0lk
 GwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AtF3YETvIejebq08jvdZJgLq1wEorQLSWiG/DBxcx0w=;
 b=kLbUnGY8zC0WKo3vHGemWOaZQ9eqsXZZDqVQRsf7Qa2BkiEhYqQOS8wUusBEIOuA8R
 8TN8U3rC2LYqEPC5rqhALwlmbWAesCiApbLgUqcBvv6XVTdgFvMA0YIPJEYXJnUE2XED
 mW3JUeFoBg66s4OctDnnflJc9Yp14THN71vV45MWWxlyeyNGrpaW2aAkFg981Wn3umN2
 70Dt07sVIN36TRxmzcbmVkxuBqTviZo2k0YGNkjMio4JUsZSlRxA858yCm9lGMwuUFF2
 2BUauz947pOzc6h4bTrHLMHamLKeBHdtBLCy07VuYtvf8zxQzTuKqqbDUifxjWWmDlbH
 j1rw==
X-Gm-Message-State: AOAM5332Agp/8BrUD7Jon8FQDOc6zl1DT6I9gSVA8zZJ3wmQZ2fiNEf/
 C1TCOGEt/mFsq/uOIWofmz4=
X-Google-Smtp-Source: ABdhPJz231mIsHjyF+Rm5DCafXuvtzQqBfu1srLoTzpYysDtuBNwdosKHoSL03eAMdoxbi8npbmplg==
X-Received: by 2002:a7b:c0ca:0:b0:38c:b9a9:a64d with SMTP id
 s10-20020a7bc0ca000000b0038cb9a9a64dmr8317929wmh.195.1648809087912; 
 Fri, 01 Apr 2022 03:31:27 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 v1-20020adff681000000b00205f21617d5sm1748659wrp.105.2022.04.01.03.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 03:31:27 -0700 (PDT)
Message-ID: <a20683a3-3534-7318-c52d-6bf03a7e9ef6@gmail.com>
Date: Fri, 1 Apr 2022 12:31:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] virtio-net: use g_memdup2() instead of unsafe g_memdup()
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Eugenio_P=c3=a9rez?=
 <eperezma@redhat.com>
References: <20220331182935.538101-1-eperezma@redhat.com>
 <CACGkMEvEKGxccu5_tFeVqthZrr_KfwVy2MFVw4rZhJbG90Z4QA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CACGkMEvEKGxccu5_tFeVqthZrr_KfwVy2MFVw4rZhJbG90Z4QA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 04:31, Jason Wang wrote:
> On Fri, Apr 1, 2022 at 2:29 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>>
>> Fixing that literal checkpatch.pl because it will complain when we modify the file

See https://www.mail-archive.com/qemu-devel@nongnu.org/msg834178.html

>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> 
> Acked-by: Jason Wang <jasowang@redhat.com>
> 
>> ---
>>   hw/net/virtio-net.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 1067e72b39..e4748a7e6c 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -1443,7 +1443,8 @@ static void virtio_net_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
>>           }
>>
>>           iov_cnt = elem->out_num;
>> -        iov2 = iov = g_memdup(elem->out_sg, sizeof(struct iovec) * elem->out_num);
>> +        iov2 = iov = g_memdup2(elem->out_sg,
>> +                               sizeof(struct iovec) * elem->out_num);
>>           s = iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
>>           iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
>>           if (s != sizeof(ctrl)) {
>> --
>> 2.27.0
>>
> 

