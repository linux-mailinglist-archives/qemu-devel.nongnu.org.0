Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFDE4D263C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 04:40:14 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRnBN-0006iU-G2
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 22:40:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRnA8-0005yj-NP
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nRnA5-0000Uv-AA
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 22:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646797131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ODc3FvhZAosS2Q9f9lguzl+ofP+AnKzcUi0ij8uSBzM=;
 b=MeQ+gl3qjdfvtaCouKaOiLwmVtmNEqq2MT/jWWEN/PgN+I6gDp+O9iBBdxa0U7GpBpgvCG
 C49UMO/VXej2V5LYlKSsqDCjwNWgf0DRqlXSPofcu0wDjdvxGf5lxckPTbBDw4D8Tb+H0J
 Oq/Y2YhyDtpLfGZz0rRV2TkeVe5BqOY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-KosB5KUfN0q-vaPOrMRcSg-1; Tue, 08 Mar 2022 22:38:48 -0500
X-MC-Unique: KosB5KUfN0q-vaPOrMRcSg-1
Received: by mail-pl1-f197.google.com with SMTP id
 c12-20020a170902848c00b0015025f53e9cso475655plo.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 19:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ODc3FvhZAosS2Q9f9lguzl+ofP+AnKzcUi0ij8uSBzM=;
 b=DsZWV9uX9tGWMO44+/0+tC/7/c8Q4gJtJ9quW8hBOLFsPQOX+B47Fz9sQpVY1e2Xaq
 +g7Rlx8tzxWmW+LgdNMnjq14AYZVRGHmjcqwgOxqknjAHB0VKaC8Di3Av+rNcpu0XZUS
 Gsm83wwDkNnDKPfsW/3OD8RB9tDA5HGfyxvaRwdcPVaVhrRsMlW6k+QNuqxE55BHQEtr
 Fn1wToJLLPDxpSnWGPK159XAUOMAvF9CpigHC0Ys1wXMJMYtwwLIFeWpgomWUgnTiSmb
 O46OvBvoLabA2YkI260ybu9z+XBRWvMuNwBvKh6EkmGkRugshhg1EuK3h1LyYqIE9pwX
 uM8Q==
X-Gm-Message-State: AOAM531sVK2bpQ7k+TXiahNYwv7TKMUyqI7yAucQ+Lf4mgRwPB3cTAcP
 b3wZJfKBSgo/HO/CcPqxHsqaxSXMALVA4213v6SMefbSAjNBt5is4UMRImpiGCs7FOcDB+I3GOW
 bAlWgME+5IBr1YT0=
X-Received: by 2002:a17:902:7d81:b0:14f:e18b:2b9e with SMTP id
 a1-20020a1709027d8100b0014fe18b2b9emr20657997plm.160.1646797127604; 
 Tue, 08 Mar 2022 19:38:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytpQxpDYX4liC3oStD1o7SXpi885MfR487ys49o0EV5Fgo3XVsQZXcDvNFiGwB1DEXKXQpSg==
X-Received: by 2002:a17:902:7d81:b0:14f:e18b:2b9e with SMTP id
 a1-20020a1709027d8100b0014fe18b2b9emr20657957plm.160.1646797127285; 
 Tue, 08 Mar 2022 19:38:47 -0800 (PST)
Received: from [10.72.13.251] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 v22-20020a17090ad59600b001b7deb42251sm4455930pju.15.2022.03.08.19.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 19:38:46 -0800 (PST)
Message-ID: <56b837a6-c67d-5ffc-bd70-ba51d996a6c2@redhat.com>
Date: Wed, 9 Mar 2022 11:38:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Eugenio Perez Martin <eperezma@redhat.com>
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
 <20220308054623-mutt-send-email-mst@kernel.org>
 <CAJaqyWcuitG+01pjO__tYERN9910fL_JGiHG88xU=fTG3KmpJw@mail.gmail.com>
 <20220308071253-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308071253-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/8 下午8:16, Michael S. Tsirkin 写道:
> On Tue, Mar 08, 2022 at 12:37:33PM +0100, Eugenio Perez Martin wrote:
>> On Tue, Mar 8, 2022 at 11:48 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>>> On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
>>>>> Not by itself but I'm not sure we can guarantee guest will not
>>>>> attempt to use the IOVA addresses we are reserving down
>>>>> the road.
>>>> The IOVA is allocated via the listeners and stored in the iova tree
>>>> per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qemu
>>>> virtio core see GPA to HVA mapping. And we do a reverse lookup to find
>>>> the HVA->IOVA we allocated previously.  So we have double check here:
>>>>
>>>> 1) Qemu memory core to make sure the GPA that guest uses is valid
>>>> 2) the IOVA tree that guarantees there will be no HVA beyond what
>>>> guest can see is used
>>>>
>>>> So technically, there's no way for the guest to use the IOVA address
>>>> allocated for the shadow virtqueue.
>>>>
>>>> Thanks
>>> I mean, IOVA is programmed in the host hardware to translate to HPA, right?
>>>
>> Yes, that's right if the device uses physical maps. Also to note, SVQ
>> vring is allocated in multiples of host huge pages to avoid garbage or
>> unintended access from the device.
>>
>> If a vdpa device uses physical addresses, kernel vdpa will pin qemu
>> memory first and then will send IOVA to HPA translation to hardware.
>> But this IOVA space is not controlled by the guest, but by SVQ. If a
>> guest's virtqueue buffer cannot be translated first to GPA, it will
>> not be forwarded.
>>
>> Thanks!
> Right. So if guests send a buffer where buffer address overlaps the
> range we used for the SVQ, then I think at the moment guest won't work.


There's no way for a guest to do this, it can only use GPA but the Qemu 
won't let vDPA to use GPA as IOVA. Dedicated IOVA ranges were allocated 
for those GPA ranges so SVQ won't use IOVA that is overlapped with what 
Guest use.

Thanks


>


