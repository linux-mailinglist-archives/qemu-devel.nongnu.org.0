Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F1D4CB78E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 08:18:21 +0100 (CET)
Received: from localhost ([::1]:41050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPfjA-00069S-A9
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 02:18:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPfhw-0005Tb-TY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nPfhv-00040r-8v
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 02:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646291822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0H0L3SjGmJfaTMXO+ul6CF6OQfLAf5NRrsiHYU3r9CA=;
 b=SUZPiyLmUcecysivm4P6B8AC2ZmY2/mEi0bIEbCmQR0+o4ulT1J5ffGQQLWrhk4jFutzGZ
 ClLWA3E0/NTN+8azP3ZjhgoIf+jykwpyVwzNPqeiW35kkzyhuqHzM7RzfjXOuTlMkYkTpV
 Z2Na7uSBWXyVyXeacyoHIjOOtNb2r70=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-fwosYridO8iUnUQCSKF14g-1; Thu, 03 Mar 2022 02:17:01 -0500
X-MC-Unique: fwosYridO8iUnUQCSKF14g-1
Received: by mail-pj1-f72.google.com with SMTP id
 m3-20020a17090a3f8300b001bd33af55f2so2584788pjc.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 23:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0H0L3SjGmJfaTMXO+ul6CF6OQfLAf5NRrsiHYU3r9CA=;
 b=zNLyCAdJZpkZIMMaZqwZSKHHMJrWBb2YOnmk8tOjSnXrcIsUVArb/9AbZPO2Tkfyci
 El4ZBiUkpg/Foc7lc2cnvuAUd+tEI7OA+jtP4gMb8HGL5KerqBxEooZ2d46LCUn7nn2P
 Fr0rNJtdDyv94JWT9SYjd8HlKRSXf+jhmmesf3Vz14RtMBtmr9d3ps1rEJ1gJJv19APt
 yA3Ci6oOlCuc45uIt9sbYKqTjByHbQFaTfuZmhbIzuZtBUiRcv1Zj4u3D3Cc/GTf7mjK
 tUa+tghaoz3eltg9v3pQgg8pIV8x5GJ+x/SkW0FingM5YOLwo81KdGEKvOA7Bqaw9TyW
 OqJQ==
X-Gm-Message-State: AOAM531LeYF8ezZdzAyMb9yUiCPT7XlbiuwdhF25SyvUjS+inqU1Ombz
 /Ed1iN5AeY9xclpOEacirtRafCtk5ejHt9kuz9cJzXSL9OEkMAOMwrbmxeRAE6ctKBQ/3pKCA1n
 L52QTrhfrBpSDBMc=
X-Received: by 2002:a17:90a:348f:b0:1be:d738:9736 with SMTP id
 p15-20020a17090a348f00b001bed7389736mr3879536pjb.65.1646291820168; 
 Wed, 02 Mar 2022 23:17:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwExVb68VLibKFtVtm0ABMSPom1oZ1FYvaBLMbZvGIGdrSLVsm5Ud9yT3aUIhANHq1AQ9KEGw==
X-Received: by 2002:a17:90a:348f:b0:1be:d738:9736 with SMTP id
 p15-20020a17090a348f00b001bed7389736mr3879501pjb.65.1646291819894; 
 Wed, 02 Mar 2022 23:16:59 -0800 (PST)
Received: from [10.72.13.250] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 j20-20020a056a00235400b004e192221ec2sm1431601pfj.14.2022.03.02.23.16.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 23:16:59 -0800 (PST)
Message-ID: <57cede59-97ba-10b0-01e0-c94b9907a903@redhat.com>
Date: Thu, 3 Mar 2022 15:16:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 08/14] util: Add iova_tree_alloc
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-9-eperezma@redhat.com>
 <7829cc8d-66d0-cedd-eca5-f899cd5ecd07@redhat.com>
 <CAJaqyWdNWqpdBQ-iTWLu7fH0prHPo8Uc1LXkEKvQ4X6cp7_TOA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <CAJaqyWdNWqpdBQ-iTWLu7fH0prHPo8Uc1LXkEKvQ4X6cp7_TOA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/3/1 下午6:06, Eugenio Perez Martin 写道:
>>> +
>>> +    /*
>>> +     * Find a valid hole for the mapping
>>> +     *
>>> +     * Assuming low iova_begin, so no need to do a binary search to
>>> +     * locate the first node.
>>> +     *
>>> +     * TODO: Replace all this with g_tree_node_first/next/last when available
>>> +     * (from glib since 2.68). To do it with g_tree_foreach complicates the
>>> +     * code a lot.
>>> +     *
>> One more question
>>
>> The current code looks work but still a little bit complicated to be
>> reviewed. Looking at the missing helpers above, if the add and remove
>> are seldom. I wonder if we can simply do
>>
>> g_tree_foreach() during each add/del to build a sorted list then we can
>> emulate g_tree_node_first/next/last easily?
>>
> This sounds a lot like the method in v1 [1]:).


Oh, right. I missed that and it takes time to recover the memory.


>
> But it didn't use the O(N) foreach, since we can locate the new node's
> previous element looking for the upper bound of iova-1, maintaining
> the insertion's complexity O(log(N)). The function g_tree_upper_bound
> is added in Glib version 2.68, so the proposed version will be deleted
> sooner or later.
>
> Also the deletion keeps being O(log(N)) since deleting a node in QLIST is O(1).


Yes, so I think we can leave the log as is and do optimization on top.

Thanks


>


