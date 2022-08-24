Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5859F273
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 06:14:19 +0200 (CEST)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQhmU-0003EA-D2
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 00:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhkD-0001a1-0q
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:11:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQhkA-0001lQ-02
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 00:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661314313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u3cNTTZIDeUGN25DUDww+wSqFIcI0qq60n5dDrhukcE=;
 b=Xcim4oclDAuBKadui5pvODyQPzLZTkIzPCRIGu5H/T3IezBs5GF6DlybgYyIX6ZIA/bMH3
 90bqplS4U7YbkfnXTK5YAQ4gXNkDM1BzIVypkWKf/rJ8iyi6o2wbwhPDTyKySPfGamLksf
 3HBNn5c8umnU2bT0Wt2S0khk0nBhLss=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-74cZiZE0MxK72xfxj7XrJQ-1; Wed, 24 Aug 2022 00:11:51 -0400
X-MC-Unique: 74cZiZE0MxK72xfxj7XrJQ-1
Received: by mail-pl1-f199.google.com with SMTP id
 u14-20020a17090341ce00b00172f000e493so4393326ple.8
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 21:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=u3cNTTZIDeUGN25DUDww+wSqFIcI0qq60n5dDrhukcE=;
 b=AXI42EypyRqfg0dTZcmI9liVYXvrdtDWrX1RyQ2cWEZdvIYKtu3xPLenDIrg0TKI2w
 wEM+L/9pQ85LTXEBcOfYl1UkPsJqfhOZNyjMX+A8pyB02vX/ops/uEEnroJMi+EeweRt
 84t/QZsOG8CnzcGnOzKYF0HrJihWUfisM/ZLFcIkWrBYwzN2oC8t5wh0uVLpCIkQJ5qT
 pdJ0ngp1pLlOi0TcUfCTU4zd4aJpiy8MWnM95/1KYrt2iRfQu3px1+LMKCu/fbRuTztq
 pD0f1hfM2LrRbioW0ordr0pVft0hBRiGRLht/ywqEcT9O7BBPm+9+noVGRL3cL77hhDp
 DHqg==
X-Gm-Message-State: ACgBeo00bV5Slfz7I6rAruh/f0Xa8n+KvZgDO/2cRfSclPjqt1KV4uQy
 h/osGNkaxKNNz8KHidnEnIqxsu/Xvfi1YhsdqTE+ToIGJEH+VL7qxRSjO2iegm5VthRvNHQXZZi
 +fYdNpNl21gWtPQY=
X-Received: by 2002:a17:90a:4042:b0:1fa:a752:9e1c with SMTP id
 k2-20020a17090a404200b001faa7529e1cmr6351890pjg.117.1661314310156; 
 Tue, 23 Aug 2022 21:11:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR53AFLbT9XO88JdLhLWVBoJk6Yp3je4cM/B4YvnJ+mgxuXcV7bj1YMJckCeYs3nXhq38hsw2w==
X-Received: by 2002:a17:90a:4042:b0:1fa:a752:9e1c with SMTP id
 k2-20020a17090a404200b001faa7529e1cmr6351871pjg.117.1661314309881; 
 Tue, 23 Aug 2022 21:11:49 -0700 (PDT)
Received: from [10.72.13.242] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a170902b78800b0016cf3f124e5sm11309867pls.131.2022.08.23.21.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 21:11:49 -0700 (PDT)
Message-ID: <9fe519dc-a309-95ea-8541-81054d727cfd@redhat.com>
Date: Wed, 24 Aug 2022 12:11:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 00/24] Support VIRTIO_F_RING_RESET for virtio-net,
 vhost-user, vhost-kernel in virtio pci-modern
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Host Kernel Patch:
>      https://github.com/middaywords/linux/commit/19a91e0d7167b2031e46078c6215c213b89cb2c3


Btw, this patch could be posted right now. Then it would be more easier 
for people to try you series.

Thanks


