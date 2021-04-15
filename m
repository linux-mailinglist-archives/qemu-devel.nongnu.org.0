Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F17360A50
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:15:00 +0200 (CEST)
Received: from localhost ([::1]:59846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1pj-0000KK-FW
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:14:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1oX-0007sF-29
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:13:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX1oU-0007Kr-5n
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618492420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dMRAiPiwfxXNK8P2J9yuAvkLtXoYXGNDdYmIil7v27c=;
 b=dZmBmt3yJR9ymSQRn+CFguVMYtvHEDPm6hW7h8A2LxeY1GASP/x+bKNUNUL5dAranydNtK
 jC5p34s37zxzFgbWga3ggWI0G4TX5+c1hXjjRzMzROWxHW1457YhtI/3T53zFcAUhzsgku
 UdeTAKF7CW3SwggP4Lv1MThEPS9zEbk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-DUkbVmIoNd2ocCiZ2gJI5g-1; Thu, 15 Apr 2021 09:13:37 -0400
X-MC-Unique: DUkbVmIoNd2ocCiZ2gJI5g-1
Received: by mail-wm1-f71.google.com with SMTP id
 j3-20020a1c55030000b029012e7c06101aso1251277wmb.5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 06:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dMRAiPiwfxXNK8P2J9yuAvkLtXoYXGNDdYmIil7v27c=;
 b=SzUwLCfIqO9qxFyMfuamJR9t4CTke+n02VkHFIiBOgx8ClvJSAmxIUwKixKiOYRREL
 Nn9Yo7R2CCe5r/sBQvTP+gfLhtZyZ8fRzn8D07lk4+F5kT/F6tyYYok/YgQr0JWk3ma/
 99cFST+99YUBeYWo/5C2A6gTwQWN4U0QLHRT2CY6FRs0lDtcApudfGAdBZYVS53UL+Vj
 y+tB8xQOMk7f52ujSWl1iRsHRvBbzHaApcyKRB71fjvubcNrhCCeB8Ir0iO7ZonGqDN2
 K35Mz9RggU1XzDVEvinBH8L9oOwKQVRt7KdeMKzSVBf8+31xt35MLWZFFYW+OheH34kY
 F0sQ==
X-Gm-Message-State: AOAM530CbpSAWWOpJ/xoxIHSw0nvoXsME/j/cLtNCqLBpexb8Z+fL0ue
 DtQjZfZp04qVe3aT7/AFKiF0H5/cM8fitOZ1C0nM3h1PiDm/37jkxdnAPO5RIFLG/A2n5HTuypp
 fvX242+6Nbgho2sI=
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr3504694wrw.387.1618492416032; 
 Thu, 15 Apr 2021 06:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrtVxbMhWzGZYydW2/maMvvuJzG4cm0dtUWZwei8fJ88L8mqoJR1fltsJHm6rI1knTx3qAgw==
X-Received: by 2002:a5d:66cd:: with SMTP id k13mr3504667wrw.387.1618492415869; 
 Thu, 15 Apr 2021 06:13:35 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id t19sm2684809wmq.14.2021.04.15.06.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 06:13:35 -0700 (PDT)
Subject: Re: [PATCH v2] hw/block/nvme: align with existing style
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org
References: <CGME20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e@epcas5p3.samsung.com>
 <20210415120048.5484-1-anaidu.gollu@samsung.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a1ce0889-c80c-2d59-e65a-3eed8bfdd3e9@redhat.com>
Date: Thu, 15 Apr 2021 15:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415120048.5484-1-anaidu.gollu@samsung.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, mreitz@redhat.com, kbusch@kernel.org,
 stefanha@redhat.com, its@irrelevant.dk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 2:00 PM, Gollu Appalanaidu wrote:
> Make uniform hexadecimal numbers format.
> 
> Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> ---
> -v2: Address review comments (Klaus)
> use lower case hexa format for the code and in comments 
> use the same format as used in Spec. ("FFFFFFFFh")

^ This comment is relevant to the commit message.

Also it would be nice if the subsystem could describe somewhere
what is its style. Not sure where... The file header is probably
the simplest place.

Something like:

"While QEMU coding style prefers lowercase hexadecimal in constants,
the NVMe subsystem use the format from the NVMe specifications in
the comments: no '0x' prefix, uppercase, 'h' hexadecimal suffix."

>  hw/block/nvme-ns.c   |  2 +-
>  hw/block/nvme.c      | 40 ++++++++++++++++++++--------------------
>  include/block/nvme.h | 10 +++++-----
>  3 files changed, 26 insertions(+), 26 deletions(-)


