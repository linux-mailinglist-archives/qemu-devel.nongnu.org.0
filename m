Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85C3B299F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 09:44:46 +0200 (CEST)
Received: from localhost ([::1]:39972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwK2X-0000UP-AX
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 03:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK0y-0006uv-9v
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:43:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lwK0w-0002Ys-FD
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 03:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624520585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7sPThbQ0+nPD0kwk/krXdGTpnNcdOiuJugIOoSsIK0=;
 b=b3U4mpdgiHmcNbbuki5n3V8wBw1ekUUIxJ+tzs++R4BqWlnAP024bIq6D+n2ZFFCQQYXVW
 g4qwoplc4uiekg8rUfb5CvD6D+rKfk+QRTJDKqZ7POutY0jS5tILwLgKP+BNPqd0k6Yiv2
 Ut4vMhXEpbQb4XRcdRgEShEwCR8i1wE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-Opn7-K_wPEq_EadWTIh2zg-1; Thu, 24 Jun 2021 03:43:04 -0400
X-MC-Unique: Opn7-K_wPEq_EadWTIh2zg-1
Received: by mail-pl1-f198.google.com with SMTP id
 g16-20020a1709028690b029011e9e164a59so1903357plo.23
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 00:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D7sPThbQ0+nPD0kwk/krXdGTpnNcdOiuJugIOoSsIK0=;
 b=uBQTGWf00pj6fC8bmZPeWex2TG6gowbHV7Zz6QiNP9Q3s132X6Qqdhj+sV9AdCkcgj
 wnX0G/hVvR3g/70L0C0x754xicZIQyZCav6+yR/QpCHV4CxxBMJRu1PehHzLLGC4GLTS
 8T84qux9IlrE0OwxYJ6M3V6pXs3nlb3lNFvj6SNKW549OtAF3foEGQNfJ0YwJLPvhbgt
 uSezVWNmgNF+JWyzglVKy9PocaUWaYRUIE/b+Q/H3KMKTHhMScTo/YJWb4THLPqjq0tc
 f/YbLQW32aekr8Sn80RlpKen8kb+/9QhAJ3CBxqkjwh44sk3gYb1lca2pKORDUh6ihKx
 yPYQ==
X-Gm-Message-State: AOAM531yyh2n2jR+e18Qg6jc/TmNRevRwutoS+qNPiC20l4RC2OOaoEe
 biA1iiEFN9j0ZKUk5aMW3wlxTw0ibDqDkijv1zL9GiqnCfaTWumo2l39kGeQPE1kmqSM1keaOi0
 35Xg+jgzZxQ0est8=
X-Received: by 2002:aa7:8186:0:b029:2f7:f70a:b7be with SMTP id
 g6-20020aa781860000b02902f7f70ab7bemr3870395pfi.64.1624520583159; 
 Thu, 24 Jun 2021 00:43:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtUNoeY2vvZcwXzE810k0mxJrIQsZ86TszShCPvsc8fMcSJyPn8rJa5rXzL1MzFqbnVtb6Aw==
X-Received: by 2002:aa7:8186:0:b029:2f7:f70a:b7be with SMTP id
 g6-20020aa781860000b02902f7f70ab7bemr3870383pfi.64.1624520582992; 
 Thu, 24 Jun 2021 00:43:02 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n5sm1499144pgf.35.2021.06.24.00.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 00:43:02 -0700 (PDT)
Subject: Re: [PATCH 01/18] vhost_net: remove the meaningless assignment in
 vhost_net_start_one()
To: Eli Cohen <elic@nvidia.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-2-jasowang@redhat.com>
 <20210621114506.GA143139@mtl-vdi-166.wap.labs.mlnx>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <af0cd5eb-3006-5857-c3ad-4454b43066a9@redhat.com>
Date: Thu, 24 Jun 2021 15:42:58 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621114506.GA143139@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/6/21 ÏÂÎç7:45, Eli Cohen Ð´µÀ:
> On Mon, Jun 21, 2021 at 12:16:33PM +0800, Jason Wang wrote:
>> The nvqs and vqs has been initialized during vhost_net_init() and is
> I suggest "nvqs and vqs have been initialized during vhost_net_init() and
> are not..."
> Other than that
> Reviewed-by: Eli Cohen <elic@nvidia.com>


Will fix.

Thanks


>
>> not expected to change during the life cycle of vhost_net
>> structure. So this patch removes the meaningless assignment.
>>
>> Signed-off-by: Jason Wang <jasowang@redhat.com>
>> ---
>>   hw/net/vhost_net.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 44c1ed92dc..6bd4184f96 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -238,9 +238,6 @@ static int vhost_net_start_one(struct vhost_net *net,
>>       struct vhost_vring_file file = { };
>>       int r;
>>   
>> -    net->dev.nvqs = 2;
>> -    net->dev.vqs = net->vqs;
>> -
>>       r = vhost_dev_enable_notifiers(&net->dev, dev);
>>       if (r < 0) {
>>           goto fail_notifiers;
>> -- 
>> 2.25.1
>>


