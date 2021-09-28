Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9765A41AE27
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:51:33 +0200 (CEST)
Received: from localhost ([::1]:58016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBe0-0002UH-MG
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVBbs-0000wT-0s
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:49:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVBbq-0005b8-Fw
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632829757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zK2+q7g9zPrjJY1s3jXhUvbsFHxoeAxuC+Ey+7HUOb0=;
 b=PtTjl+qs0y1vxgEBMT+Yg1u9pf+mMMuXDAhslMWwhs2Wp8Er3HhgFaGU9s8EVD/H1mvIMO
 aec58MC8znUvJSF7CW+mQhz4OY2Il39Fn0d5Qw7GiSL51a3QhK51XSjUYh4IY76ny6C/lU
 +XHWrnrU7NQ99NFwuqyjPYxoBZeiKVE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-OjviACKJPOuJUpJz5UGvhQ-1; Tue, 28 Sep 2021 07:49:16 -0400
X-MC-Unique: OjviACKJPOuJUpJz5UGvhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u14-20020a7bcb0e0000b0290248831d46e4so902719wmj.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 04:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zK2+q7g9zPrjJY1s3jXhUvbsFHxoeAxuC+Ey+7HUOb0=;
 b=P+XIhMOF3ROgIfIJvT04+v5y3u6TcgZufebePyFuekXrMASzGzgD6Q0F5UdDHL5Q7L
 Lq/0gH0yLu7gFHu3wxAsjSj9uvaHItVoG3JcCTnnMx/chlquXxSDhsCZI1+TXn1IcKNp
 hrSdKfxqsv37fIrMMwf4AMMWsdjmaUxGWEhEvcm4Fm2NK1ZxS1gL26ZVNMSHV/GnX0u3
 QBbE7GCbQl1xgk/jwNGPfpvYvCKJQJDihBfRQ7vulVz80LzvLc3VsYG+wY9R4et6X0bf
 meuNPwidbiPkl7lMPi5KM9USv+AGQ7vcit0I2ZSxEIkCc6FgcsdVWFZU27J1P6qtMsU2
 36Hg==
X-Gm-Message-State: AOAM533SM1k9Y7RxJ5DvgFqqCcGOwNjUkCcfNa9cOd0OEtZPbr+2Euk8
 JiP3pc7scZuo+z+FNg8u/fGzW/vq3ft/8054AQoy0RrHdgslpMQ2im1kG3OfaKeSgtv009lT2tj
 Czv4BZ63wVWHcG70=
X-Received: by 2002:a05:600c:220e:: with SMTP id
 z14mr4162278wml.84.1632829755548; 
 Tue, 28 Sep 2021 04:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxnPoqfBWBpWs3VT1yVr4+9+Zk2IBlZGe0SRPJOUaXVAaWjW4wdbPric5i8FZP1lBNVktMMw==
X-Received: by 2002:a05:600c:220e:: with SMTP id
 z14mr4162268wml.84.1632829755383; 
 Tue, 28 Sep 2021 04:49:15 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id a3sm6822777wrn.16.2021.09.28.04.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 04:49:15 -0700 (PDT)
Message-ID: <b1c2925e-fddf-cb6b-5aba-2c84578b9f4f@redhat.com>
Date: Tue, 28 Sep 2021 13:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] qemu-options: Add missing "sockets=2" to CLI "-smp 2"
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210928093157.14620-1-wangyanan55@huawei.com>
 <20210928093157.14620-3-wangyanan55@huawei.com>
 <9728083c-059c-3990-f651-3fbdce86491c@redhat.com>
 <0508934a-f4d5-a7ed-310a-065aa823fb08@huawei.com>
 <YVL2JDoQ2XNvmo+H@redhat.com>
 <acac6e0a-c91f-af9b-fd11-2f078de79c91@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <acac6e0a-c91f-af9b-fd11-2f078de79c91@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-trivial@nongnu.org, wanghaibin.wang@huawei.com,
 Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 13:42, wangyanan (Y) wrote:
> 
> On 2021/9/28 19:01, Daniel P. Berrangé wrote:
>> On Tue, Sep 28, 2021 at 06:58:20PM +0800, wangyanan (Y) wrote:
>>> On 2021/9/28 18:46, Philippe Mathieu-Daudé wrote:
>>>> On 9/28/21 11:31, Yanan Wang wrote:
>>>>> There is one example of -smp CLI in qemu-options.hx currently
>>>>> using "-smp 2" and assuming that there will be 2 sockets.
>>>>> However now the actually calculation logic of missing sockets
>>>>> and cores is not immutable, we should use more explicit CLIs
>>>>> like "-smp 2,sockets=2" if we want multiple sockets.
>>>>>
>>>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>>>> ---
>>>>>    qemu-options.hx | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>>>> index dcd9595650..ff8917c5e1 100644
>>>>> --- a/qemu-options.hx
>>>>> +++ b/qemu-options.hx
>>>>> @@ -395,7 +395,7 @@ SRST
>>>>>            -m 2G \
>>>>>            -object memory-backend-ram,size=1G,id=m0 \
>>>>>            -object memory-backend-ram,size=1G,id=m1 \
>>>>> -        -smp 2 \
>>>>> +        -smp 2,sockets=2,maxcpus=2 \
>>>> Is the addition of "maxcpus=2" intentional?
>>> Yes, but it's not necessary IMO. I just wanted to keep consistency
>>> with other numa config examples in the Doc. Should I remove it ?
>> I think it makes sense to be explicit, because the numa config
>> works in terms of maxcpus when splitting cpus between nodes
> The statement of this numa config example actually assume that
> there will be 2 cpus totally. Although based on behavior of the
> smp parser we will get maxcpus=2, I also tend to keep it explicitly.
> 
> But I should update subject of this patch and the commit message.

Once updated:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


