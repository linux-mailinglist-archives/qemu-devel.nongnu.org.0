Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F9A38B6F8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:14:49 +0200 (CEST)
Received: from localhost ([::1]:35670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljo88-0002jH-8V
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljo6n-0001ov-G1
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljo6j-0002l3-P2
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621538000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fs22u+tpMAuignvokjOuJCUBTwIjOF/MTocIrk0608E=;
 b=PwrMUCcS5kenkmydDY1USIPtan3ocDx0zDXb5g+5g58aiI1DFtbyyJaJ1Aw87XdR6AEuli
 z4DAveP58z6Lz3f0Jlk1sDaZ4YcClfLdXSSY1eu5jD60kciTfddE+80bLf/b5Clap/hftC
 SkojO17a47bnhd2S3Ly2GkgpO2vL6gA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-cNtPD6_0Nky_zVxmueKkQw-1; Thu, 20 May 2021 15:13:18 -0400
X-MC-Unique: cNtPD6_0Nky_zVxmueKkQw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h18-20020a05640250d2b029038cc3938914so10031441edb.17
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 12:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fs22u+tpMAuignvokjOuJCUBTwIjOF/MTocIrk0608E=;
 b=XZxjbLgkCRhs6nzdU2hNSthEdyjpnXRtHNsmdpm8fJxvLrEHp9I1r/3icJ5V9ROecw
 j3juaeb8h3SVHvaFFdIilDKpwe/qR8I8i2snQhpxd4NRy2JxeHkE/QkA6JieF/fq0DyX
 eTM+8H0UiZs2JH1TnzLwjKtYihthUIbD01qeQCCWB3jnm9gvBh5VR2cVON9WpqVVe+H2
 E5oTNQYPnxaIoiw4DTVr0AGcPT/dfb3GH6YFjlElRmn5VVQin6ZC6Oeqhr+lCf9RUQ9b
 tjU8uhknh7CWqV1ZlpxUbx+pYgKoT1L3rLY5NArCV4WC6YnECLhAKiolz39re2UFACYG
 WhsQ==
X-Gm-Message-State: AOAM530huZJ6DCMdXQWn4aAwrRhQ3Dr6lmE3fU93Cj6YnpeDNAfHFPjY
 L0+VJRHAPkM5tcx77vSVSB4VazwV+zNJVVzRtfCkGDOMrAR9O8gRRT3C/ejODWoPkrAWYmBOIbW
 GhPfJGFVlQTr6VsY=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr6584441edu.286.1621537997491; 
 Thu, 20 May 2021 12:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHYnmRcg/X5rSJMOTnsbOvoWt686GEiTCwMlHevT0loVn9ZGDSTyQooD38kOXVt9sTYILclw==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr6584419edu.286.1621537997259; 
 Thu, 20 May 2021 12:13:17 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id p4sm1951960ejr.81.2021.05.20.12.13.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 12:13:16 -0700 (PDT)
Subject: Re: [RFC PATCH 17/25] hw/virtio: Use correct type sizes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210518183655.1711377-1-philmd@redhat.com>
 <20210518183655.1711377-18-philmd@redhat.com>
 <3be2267a-6874-ddb1-ad5b-817e367c0be9@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <570ca603-f019-319c-e3c5-ede608a439c2@redhat.com>
Date: Thu, 20 May 2021 21:13:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3be2267a-6874-ddb1-ad5b-817e367c0be9@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/21 6:27 PM, Richard Henderson wrote:
> On 5/18/21 1:36 PM, Philippe Mathieu-Daudé wrote:
>> -static inline int virtio_lduw_p(VirtIODevice *vdev, const void *ptr)
>> +static inline uint16_t virtio_lduw_p(VirtIODevice *vdev, const void
>> *ptr)
> 
> While this one looks obviously correct,
> 
>> -static inline int virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
>> +static inline uint32_t virtio_ldl_p(VirtIODevice *vdev, const void *ptr)
>>   {
>>       if (virtio_access_is_big_endian(vdev)) {
>>           return ldl_be_p(ptr);
> 
> this one isn't so obvious.
> 
> Are all of the users unsigned?

All except this one for which I'm not sure:

hw/block/virtio-blk.c:137:            int p =
virtio_ldl_p(VIRTIO_DEVICE(s), &req->out.type);
hw/block/virtio-blk.c-138-            bool is_read = !(p &
VIRTIO_BLK_T_OUT);

--

hw/block/virtio-blk.c:183:    bool is_write_zeroes =
(virtio_ldl_p(VIRTIO_DEVICE(s), &req->out.type) &
hw/block/virtio-blk.c-184-
~VIRTIO_BLK_T_BARRIER) == VIRTIO_BLK_T_WRITE_ZEROES;
hw/block/virtio-blk.c-185-

/* Barrier before this op. */
#define VIRTIO_BLK_T_BARRIER    0x80000000

>  If so, should we rename it ldul?

OK.


