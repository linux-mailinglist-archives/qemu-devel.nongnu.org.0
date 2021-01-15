Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227832F7523
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:23:16 +0100 (CET)
Received: from localhost ([::1]:47272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LK7-0000g1-4c
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LIW-0004VL-Tg
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:21:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LIV-0003ul-Gt
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610702494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iy8FmWFQOgn2y1p899VQeHe7zr/hq1O6xs/p/O1P7z8=;
 b=Deiv09G/e5h3l5f1N8ziu6Nlr9njpuz2x77XkYZY9IC37iovX7mDjBoTb9nnnyIziqfrVx
 IkZ6ijgvy3x9qlMURzT5cFIbeX9N3N2griGKmkJspZ/4DVNMpUMtYxlAcQeDZLQ9gnf/mi
 vKTH3A0P6PV9Lkwo/+tkjOJ5b+LcarM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-MPSlY_0pMYCEKFUl7fClZw-1; Fri, 15 Jan 2021 04:21:30 -0500
X-MC-Unique: MPSlY_0pMYCEKFUl7fClZw-1
Received: by mail-ed1-f69.google.com with SMTP id l33so3584458ede.1
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 01:21:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iy8FmWFQOgn2y1p899VQeHe7zr/hq1O6xs/p/O1P7z8=;
 b=oUXfLYo7zZVZ9r0ktRGHfUFyqF1iUCmx5s9h2adqDZvccjXLAppx2CjKeVEp5iS+R3
 5WlFRed9oGVUiPZe/REdLXnCfNlRvZK5PmvNu30KqNqIGnw15YvYvljP5NaG1P+2hXnn
 pF1q1fmopPt6avZQM+MxAIq2Lg2aWeGjV5MEQh+lhBCKK4srk+eCBj4GVIOVO+DyC8S+
 kWabNv4eUPMBkPSp7lWnpGTNjLJPZDQEAITYSRVzQH5Q+gEct5fnXSPj3JWKa0pl3okr
 e+D7sC3/6MBzKEOhrbTEoxmGrOzJJb6oSTilgiTeWGcdhe+AkLn7zdyHJRL5HN3qk/EH
 RRsg==
X-Gm-Message-State: AOAM532307ns0uRuyxcvL4EXAIIKyeLBrEEoDB7FiowsoJLFR0dV6Y5+
 xYiofeeaPhqYa8nMvTyNpNCKkjw7X5TH9OoZeYao4ZrtQeunI8eRXIYP2cnN98d/fBCZjRAlvz9
 pP3XPerWogtkxDnU=
X-Received: by 2002:a17:906:77c5:: with SMTP id
 m5mr7938700ejn.424.1610702489767; 
 Fri, 15 Jan 2021 01:21:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmXkt2XFc0FUFA6PXdrv5k5+N8YeXX43dcHNkUdQyM2dp/BzaG2Nnzd96G6WtRoS09Wm9VIw==
X-Received: by 2002:a17:906:77c5:: with SMTP id
 m5mr7938692ejn.424.1610702489642; 
 Fri, 15 Jan 2021 01:21:29 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id e1sm3351229edk.51.2021.01.15.01.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:21:29 -0800 (PST)
Subject: Re: [PATCH v2 2/7] audio: Add spaces around operator/delete redundant
 spaces
To: Zhang Han <zhanghan64@huawei.com>, kraxel@redhat.com
References: <20210115012431.79533-1-zhanghan64@huawei.com>
 <20210115012431.79533-3-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22e89cf6-937c-617f-8616-14568caf8312@redhat.com>
Date: Fri, 15 Jan 2021 10:21:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115012431.79533-3-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, hunongda@huawei.com, alex.chen@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 2:24 AM, Zhang Han wrote:
> Fix problems about spaces:
> -operator needs spaces around it, add them.
> -somespaces are redundant, remove them.
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  audio/audio_template.h | 2 +-
>  audio/coreaudio.c      | 2 +-
>  audio/dsoundaudio.c    | 2 +-
>  audio/jackaudio.c      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


