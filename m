Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE54644D100
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 05:42:40 +0100 (CET)
Received: from localhost ([::1]:57142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml1v5-00059k-AW
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 23:42:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml1tn-0004MV-0d
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 23:41:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ml1tj-0001iF-Bc
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 23:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636605674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uk7mDfidkM98s/y/d6e/iF76RgWhwjLz/jw+cAeRORk=;
 b=cXqfxTxR+b9g+M+d1g0aELgBSWXfi2ymqtey9zKWjNC26Qgf0R7M0T6I3CDCnziPkXAKGA
 oloWRBetqk49LBecN8mSMP+2CAUJ+5iCylx/xUnfDr+/jmgynf8eJDW/0h/cVBEK9EHqSk
 bW5E84pmkBbOAB640Gwc5u7FRJCcI1c=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-cIceSNEYO9yKEFz90FTtpQ-1; Wed, 10 Nov 2021 23:41:13 -0500
X-MC-Unique: cIceSNEYO9yKEFz90FTtpQ-1
Received: by mail-pg1-f198.google.com with SMTP id
 k22-20020a635a56000000b002df9863aa74so1182217pgm.19
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 20:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Uk7mDfidkM98s/y/d6e/iF76RgWhwjLz/jw+cAeRORk=;
 b=XdlVY4CXKX+T/FTc15VczZ1b/x4VrHvitUewqT2csAIa26ELRti61XB+ud4a+b36N0
 GQNOe0WoVAOlXZo4ve8JWViOl0bRTYqiLkW8m2UDUifGzlFpdxXJ+czyXQiGcQFccDh4
 H7BedM9KMYkpYbes4WTIlQJJUEnQtEYtldR3VJ0vcrianreN/T+USOKKmyAArbV7Twsk
 O5OYotbc2Kfm71oIVlEaxir6Kh1aNiVWH+Emutmq58bv/YIl8Xg7d9Mk5DeYmdExTKOc
 11Mzhaf0Bfk7GukKOGoz8gN7i8nmLisYz2XqYMJcuX9pnUtdfhJtq4lB5BhQs/WEk4QU
 VGfA==
X-Gm-Message-State: AOAM531JYjfeKkeEu2oDIPm0Miiu2gGv3pDItG5j9EV81vE/W1tGeiHT
 S4Tf9GzeQ+s3wXjQuWVMMENLAroRiitfucWfK5Tv4w6hODd/fVdwA4mdvcB03uFaoxk7Bn2BrRh
 Vr9YNUdAO+YVxJq1KezmL2Kxmb7u0cnB69pOQFPj+AIsSZILS7P5P++b8l6ETutwcUO8=
X-Received: by 2002:a17:90a:e40f:: with SMTP id
 hv15mr5047306pjb.5.1636605671953; 
 Wed, 10 Nov 2021 20:41:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw67pFcxKTnDIqEx8SfqfwkgWY1j8VdW4QwJlPqomUSzvdf0eTh3a787hRpxMnDg/UOE1rcJw==
X-Received: by 2002:a17:90a:e40f:: with SMTP id
 hv15mr5047245pjb.5.1636605671464; 
 Wed, 10 Nov 2021 20:41:11 -0800 (PST)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id w7sm917534pgo.56.2021.11.10.20.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 20:41:10 -0800 (PST)
Subject: Re: [PATCH v10 00/10]vhost-vdpa: add support for configure interrupt
To: Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>
References: <20211104164827.21911-1-lulu@redhat.com>
 <YYkBkGdlpeer18e9@stefanha-x1.localdomain>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <00d446c0-b5a0-9477-4e63-fc4b768a6f92@redhat.com>
Date: Thu, 11 Nov 2021 12:41:02 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YYkBkGdlpeer18e9@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.678, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 arei.gonglei@huawei.com, kraxel@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/11/8 下午6:53, Stefan Hajnoczi 写道:
> On Fri, Nov 05, 2021 at 12:48:17AM +0800, Cindy Lu wrote:
>> these patches add the support for configure interrupt
>>
>> These codes are all tested in vp-vdpa (support configure interrupt)
>> vdpa_sim (not support configure interrupt), virtio tap device
>>
>> test in virtio-pci bus and virtio-mmio bus
> Hi,
> vhost-user has a configuration space change notification but it uses a
> slave channel message (VHOST_USER_SLAVE_CONFIG_CHANGE_MSG) instead of an
> eventfd. Ideally the vhost kernel ioctl and vhost-user interfaces would
> follow the same design.
>
> I'm concerned "common" vhost code is going to end up with lots of
> callbacks that are not available uniformly across vhost kernel, vdpa,
> and vhost-user. That makes it hard to understand and debug vhost, plus
> differences make it harder to to correctly extend these interfaces in
> the future.
>
> Is the decision to a new eventfd-based interface instead of
> vhost_chr_read/write() deliberate?


I think this is a good question. Here're some reasons for using eventfd 
from the kernel perspective:

1) the eventfd is used for relaying interrupts for vqs, so we choose to 
use that for the config interrupt
2) make it possible to be used for irq bypassing (posted interrupt)

 From Qemu's perspective, as shown in this series, it looks more easier 
to be integrated with the both vhost and transport layer (e.g vector 
masking etc).

Thanks


>
> If yes, do you think VHOST_USER_SLAVE_CONFIG_CHANGE_MSG was a design
> mistake in vhost-user that needs to be fixed?
>
> Stefan


