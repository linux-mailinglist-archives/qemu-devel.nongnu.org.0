Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D29653CA8
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 08:50:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GK6-0005QG-TQ; Thu, 22 Dec 2022 02:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GK4-0005Q6-OP
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:49:00 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8GK3-0002Ek-1B
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 02:49:00 -0500
Received: by mail-wr1-x436.google.com with SMTP id o5so808476wrm.1
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 23:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M7+CXK3MoAlcwAzTLlavqbpBD5LrhXnTZXG93apj7GU=;
 b=B0S4Wv7LFqM9aVUWYmpstCTBe8r6HYAT5H0fNNv5y2Br6HokZO06Mtd5I/7aUYFJbC
 HgcXdnRirAtp3qvoxLMC+MN8zq8K8sn+TuCErHpSJr0aROat+fUoMC64AGGptOaG2zz2
 piS3Xbh14vLKfhmvnAAv0cpCF8hLMPMzrR6W5yjMc7c0NZkxB3KJXY1U1ZyOVFWMSm4V
 8YnCrEDL90kmRvaaeWWxvZWif2W6oY49bnJGLGUcT/VXaEP5D41Hni71TGE5mY6BgiTM
 GLN0mMGhX16eQWg+OywSlRF4X+mEEaiDLY+R3JzA4bqyYYEkmTqqOUmHh9p0Dopty0CU
 2Qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M7+CXK3MoAlcwAzTLlavqbpBD5LrhXnTZXG93apj7GU=;
 b=jyDCn3QuymHdXTWKeKthhKIwhh8Trf54Ws6T0y/gD4V8o225/ubIVDeg8eK/CdGlR9
 GBSVv21KCAfRpPTnluhjV1OgeqZkLFaPkMRJzIcmczGmJX4IdDA+gCKR9FxAF2yERQsX
 FjivkXHwtW2c/qlYz/aBAXUaAuci+vI54kBF0iwBJsuuFtHz3T4vSgQfY6JrYKDj5BdL
 uVgPkKQ0qJP/P3Q9DJ/yN9MybXBLlMc6sQF37tXEoV+EDyjNC/kXjk4JbAc/xL7zMdHW
 3zGoNtC7s6/7ECJXPmnpyQ9o8wPytImr7HC3ZtBmchYvwk5eJlttVQTHbFWjhNFzV5AW
 rmuQ==
X-Gm-Message-State: AFqh2kreKmcCQh+zYsYgswZJv2+FJCUHWWJdsIk5510o0/dZyR3K939d
 LEmYxjQ0ecQp+Z0hwXLR456dxQ==
X-Google-Smtp-Source: AMrXdXvj7NQQqIPPNWY+k+wZlgNkevQdNmQsD5/eOBweD6pGSLFcimrIZey0JCBVW1JDoDOUk/vRwQ==
X-Received: by 2002:adf:efcc:0:b0:242:3ec:629a with SMTP id
 i12-20020adfefcc000000b0024203ec629amr2644373wrp.69.1671695336790; 
 Wed, 21 Dec 2022 23:48:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bx33-20020a5d5b21000000b002420a2cdc96sm17365911wrb.70.2022.12.21.23.48.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 23:48:56 -0800 (PST)
Message-ID: <2f2cdcff-2433-4d41-ead4-62f0438bc45f@linaro.org>
Date: Thu, 22 Dec 2022 08:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH-for-8.0 v2 6/6] hw/virtio: Extract QMP related code
 virtio-qmp.c
Content-Language: en-US
To: Jonah Palmer <jonah.palmer@oracle.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>
References: <20221213111707.34921-1-philmd@linaro.org>
 <20221213111707.34921-7-philmd@linaro.org>
 <5698a91c-a181-a8a9-f19b-32ebe5ecb46d@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <5698a91c-a181-a8a9-f19b-32ebe5ecb46d@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/12/22 14:31, Jonah Palmer wrote:
> 
> On 12/13/22 06:17, Philippe Mathieu-Daudé wrote:
>> The monitor decoders are the only functions using the CONFIG_xxx
>> definitions declared in the target specific CONFIG_DEVICES header.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
>> ---
>>   hw/virtio/meson.build  |   2 +-
>>   hw/virtio/virtio-qmp.c | 659 +++++++++++++++++++++++++++++++++++++++++
>>   hw/virtio/virtio-qmp.h |  20 ++
>>   hw/virtio/virtio.c     | 635 +--------------------------------------
>>   4 files changed, 682 insertions(+), 634 deletions(-)
>>   create mode 100644 hw/virtio/virtio-qmp.c
>>   create mode 100644 hw/virtio/virtio-qmp.h

> I haven't tried this myself, but is there a reason why we're not also including
> the 'qmp_decode_vring_desc_flags' function here?

Because we use VirtQueue as an opaque forward-declared structure.

The structure is declared in hw/virtio/virtio.c, which is where
the internal fields are accessed.

If I move qmp_x_query_virtio_queue_status() and
qmp_x_query_virtio_queue_element(), which calls
qmp_decode_vring_desc_flags(), I get:

../hw/virtio/virtio-qmp.c:874:35: error: subscript of pointer to 
incomplete type 'VirtQueue' (aka 'struct VirtQueue')
     status->queue_index = vdev->vq[queue].queue_index;
                           ~~~~~~~~^
include/hw/virtio/virtio.h:39:8: note: forward declaration of 'struct 
VirtQueue'
struct VirtQueue;
        ^

Now you are right the QOM-generic functions (qmp_x_query_virtio,
qmp_x_query_virtio_status and qmp_x_query_virtio_vhost_queue_status)
can be moved.

Thanks for your review,

Phil.

