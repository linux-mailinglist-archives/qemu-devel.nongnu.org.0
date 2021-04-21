Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4E36706B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 18:45:05 +0200 (CEST)
Received: from localhost ([::1]:38448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZFyK-0005L4-De
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 12:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZFqv-0001Hl-Vy
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:37:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lZFqr-00087D-9W
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 12:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619023040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2t/W4Pg+tjtAQ7cArpdV9Uj4j6Uk3lRtcHhSRDvUQA=;
 b=BWPLvB1maq2pu/Jug0S7iIvSUVFunY7iS5LFfqsGx38Wedki/ceJI4WeB2FsbzLdEleILQ
 ZNYgH/pfqslhWpLFXG0CXjvXQpDy3xVaJGzNO39iiWNz9lJj+pLT0pEm6bIqXDDlzDk7D1
 bxm6/MGZDE+LeaA11L4AmVkGlcAmwB8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-VrFZe45FMhOsqIJiM1snnw-1; Wed, 21 Apr 2021 12:37:19 -0400
X-MC-Unique: VrFZe45FMhOsqIJiM1snnw-1
Received: by mail-ej1-f69.google.com with SMTP id
 lf6-20020a1709071746b029037cee5e31c4so6103379ejc.13
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 09:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2t/W4Pg+tjtAQ7cArpdV9Uj4j6Uk3lRtcHhSRDvUQA=;
 b=o44XdA18YIYG5MYINJ9YzJ8+1p6SA/U8x6RFZSxRcWeu6xeHgI5IkIgXEUaN7SpGJD
 zUol4VHWApvOuHIswkVnYdaBiU6KJ6a+mgrFNXSOXvNPIOLsdR48Fir7xQOrTBddXfWJ
 +OhirC+4quHVN+0hESqJCSubX8L2WHMI6xN3xH3Skj3LGmAwyJAOvwx1nPb6NRzXBiRJ
 SnKvcx67DzSIy/bpYEPSHHHmsvwfmVR3sJs6FHGB0QGNfADbNWYIPZginJmupvXzHruh
 X+qNuQjNKACc3MuO/GbdcLj/xkTRnzILruNJ/9RR+MGHpS7DvO1DCHmKlv4Uig1EqTZN
 50tA==
X-Gm-Message-State: AOAM533sPQUrmxHyZNaSAh8BB5sQ+aORNNSVpxGDultYDVV839ilmKQu
 uVaTfcs3r+1F3VbeUjsvNcO4wf+wqvEfRKjClLvKmifJrQDqjqDGkdmPS8Xu+aP1ZNMY78EWM+H
 9v0xXJ9fLOvnNRKhMBsve2bj7comV5S2ZYQFU83qVv0rIv3t0/S/Br8AgIDiP2QyF
X-Received: by 2002:a17:906:b2d8:: with SMTP id
 cf24mr33789938ejb.305.1619023036532; 
 Wed, 21 Apr 2021 09:37:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaBHqJKFmcD5EMyrruAoV3oFO8k5sy7hz+tdFFJqK6F2aL+F2SW/vbIyJNzEhTeYZbNAgppw==
X-Received: by 2002:a17:906:b2d8:: with SMTP id
 cf24mr33789906ejb.305.1619023036181; 
 Wed, 21 Apr 2021 09:37:16 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id l1sm3867102edt.59.2021.04.21.09.37.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 09:37:15 -0700 (PDT)
Subject: Re: [PATCH] pc-bios/s390-ccw/bootmap: Silence compiler warning from
 Clang
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210421163331.358178-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <41029be3-5876-f766-b1f1-5e1684a46710@redhat.com>
Date: Wed, 21 Apr 2021 18:37:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210421163331.358178-1-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/21 6:33 PM, Thomas Huth wrote:
> When compiling the s390-ccw bios with Clang, the compiler complains:
> 
>  pc-bios/s390-ccw/bootmap.c:302:9: warning: logical not is only applied
>   to the left hand side of this comparison [-Wlogical-not-parentheses]
>     if (!mbr->dev_type == DEV_TYPE_ECKD) {
>         ^              ~~
> 
> The code works (more or less by accident), since dev_type can only be
> 0 or 1, but it's better of course to use the intended != operator here
> instead.
> 
> Fixes: 5dc739f343 ("Allow booting in case the first virtio-blk disk is bad")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/bootmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


