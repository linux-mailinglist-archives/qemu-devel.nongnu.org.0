Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C603E35F153
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:14:09 +0200 (CEST)
Received: from localhost ([::1]:52554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcXA-0004dX-UP
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWcVZ-00048w-6W
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:12:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWcVW-0003vn-4y
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:12:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618395144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCR5oJg/3xASiJ44WzvDvU/b8UGyLWRgUrfEhS7jAr8=;
 b=hpBtuJNBsn4dS5xFIn3XhPn1mxBfcEtIgNSa1ntoXkTT4NbzQM0231XgCJSGfgenk9tOhD
 6HH33r3gWieBv5+IOpR8epEW1Mj8Q9kBh/zj4lEKhP+NkfBcDQQCjR6n7mF2GdXQNbLwBi
 tw9ZcN0TljHqLdKHIyBdlMYWKqnUuqA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-MOvo2pSxMP6lpL9Yj6u_Lg-1; Wed, 14 Apr 2021 06:12:22 -0400
X-MC-Unique: MOvo2pSxMP6lpL9Yj6u_Lg-1
Received: by mail-wr1-f72.google.com with SMTP id
 o14-20020a5d474e0000b029010298882dadso844411wrs.2
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 03:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GCR5oJg/3xASiJ44WzvDvU/b8UGyLWRgUrfEhS7jAr8=;
 b=oDHiNxZGSJZGQ3jIaqM/uOctH/vjY58DKrvv1eueFtmdF+9NUnZfyWYiOqwrk9JSTC
 VVECNRL/cI+kVdlaUqzsZ8aAY3CjQfJiXy7Wf/ENz7p8gUFYzGlJ+KDuXdKrGqoJC9Pt
 2fIp33WIG1YVbNumuoUvOcdYnKje58QudcPr8x9stFEbLoLvJEQa/leNPGbE9X6UB67i
 6vznr5w/qr/UU9/lkkdpLDg8kcFtL0CmO40MdY9ZWr3ff55AErklHgvtHNL7B1uzWGgi
 4sP8f3ODCIdJhZc0NSq88WQbMgqvfukaS/X7U4avIUHmlPJcIzbUVj7Peza1TIShYJiX
 at8g==
X-Gm-Message-State: AOAM533T6vG8ChRECO4ilKHPHiyuywgaJ7XwU1Hr1UvZgtTkE0eDnWMZ
 nwUAMeSYYHAwh5Bwgsm8VqusXm7brDV+mrEWGTELufV5oJGPOwvOlKXpG2mAvnTKHQCUfrlR6xY
 n23pNHiDRjfpWBtk=
X-Received: by 2002:a7b:c189:: with SMTP id y9mr2210448wmi.126.1618395141659; 
 Wed, 14 Apr 2021 03:12:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjwNsQHYxNJMlPVuKleeRquvRA0CVdx9aignAQO6FPM1onp4oR4ElcFuGGBxGoCBhkLgUV7w==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr2210424wmi.126.1618395141456; 
 Wed, 14 Apr 2021 03:12:21 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id o125sm4977248wmo.24.2021.04.14.03.12.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 03:12:20 -0700 (PDT)
Subject: Re: [PATCH] vhost-vdpa: Make vhost_vdpa_get_device_id() static
To: Zenghui Yu <yuzenghui@huawei.com>, qemu-devel@nongnu.org, mst@redhat.com
References: <20210413133737.1574-1-yuzenghui@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3d44f706-8611-c2b5-93ba-363a17df4211@redhat.com>
Date: Wed, 14 Apr 2021 12:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413133737.1574-1-yuzenghui@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: wanghaibin.wang@huawei.com, jasowang@redhat.com, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 3:37 PM, Zenghui Yu wrote:
> As it's only used inside hw/virtio/vhost-vdpa.c.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  hw/virtio/vhost-vdpa.c         | 4 ++--
>  include/hw/virtio/vhost-vdpa.h | 2 --
>  2 files changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


