Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D923B1223
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 05:24:43 +0200 (CEST)
Received: from localhost ([::1]:33432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvtVK-0008Qw-0I
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 23:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvtUB-0007l4-Bg
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 23:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvtU7-0001p2-1m
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 23:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624418605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vmg1kzxqnS0tm84/a01F8z2O+t4S03mSiWCMNKZ5zx4=;
 b=drtqOCbA6fnF+CwZJ5Jmg7FF+ujinQ36wB1bbSK5U0ktASkH1a+YYU/XNtgFhnSFSGTd4c
 GqT59aFKOXa1yy56wVEiuEOzVSnzHGRXVP4g2rKJ/lBl9wmxPjkEcpGT5UciPn9gKnKNJl
 9atuABLNyL1DPLrlrgiAXf6RvUD4UXk=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-QO6g_cdUM1KNKLHwquzuOA-1; Tue, 22 Jun 2021 23:23:22 -0400
X-MC-Unique: QO6g_cdUM1KNKLHwquzuOA-1
Received: by mail-pj1-f71.google.com with SMTP id
 j7-20020a17090aeb07b029016fad89686aso503325pjz.9
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 20:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Vmg1kzxqnS0tm84/a01F8z2O+t4S03mSiWCMNKZ5zx4=;
 b=AdOdGzBjT9Z6IqPPq9OvA3HQCLF+r5av+2L69cvV8ohm582FNVZB1Qucwj2Tbz8rZc
 d5jkmMnYZgCBffYwG01uDyF4Q8uLW30WWMReNMkHdsfEzh069hD5yAYqRXMwdJU2ZwxP
 ESWu9elBQICJBAflJ2bA4OAn9Rnjb9a+FurTsqaqZGHGidyjG06ey1LCJgyZDrJeohnx
 GqS6xXpk8VKterHlpegN5AYEYy8Ue1++lL90LStj0NKKfftJKGAwTJYiNQKsGiNvOKR5
 FGRRFaDWodWQyLXjUYMBxZIfLKdh0Rxxh0N6EUkLGEaQMA/h5w1wKg975zJ9n0rHj+Gj
 Ut+w==
X-Gm-Message-State: AOAM532KhHJ+xnRIAiUK6sqGH1nTAlrXFdaT+H8Cnytpe5HTGCNgwfkD
 WTkJSAsAFleMJilhgxJPhF0Ek51f+5/ymyQEKTqaUa4SLVT6YHxS8T2uo2D/Ifu+GCejz82R2Lf
 whsfw4YKrOyVNQ0EYf+/YLqhqmgehK2kRl0EFebc/AFDUeiDKibAHxbmtaPv6wQ9++6A=
X-Received: by 2002:a17:90a:9910:: with SMTP id
 b16mr7169787pjp.94.1624418600764; 
 Tue, 22 Jun 2021 20:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+0ijT0l5C3I70tIffoNFlwSvUMt2TT+ISDC5HfGR1zMFXWU5zElUDbFci04H9iBq9VbvvJg==
X-Received: by 2002:a17:90a:9910:: with SMTP id
 b16mr7169759pjp.94.1624418600513; 
 Tue, 22 Jun 2021 20:23:20 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i125sm635883pfc.7.2021.06.22.20.23.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 20:23:20 -0700 (PDT)
Subject: Re: [PATCH qemu] hw/net/vmxnet3: Remove g_assert_not_reached() when
 VMXNET3_REG_ICR is written
To: Qiang Liu <cyruscyliu@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-devel@nongnu.org
References: <162441284292.15618.4627728437912000813-0@git.sr.ht>
 <CAAKa2jm_4noz=rVc-vW6-4q-HsJtLoZXUZJfoHprjpLmYgb1EA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <baf2e00f-b8ed-920b-2bcb-f5aecbdd20e7@redhat.com>
Date: Wed, 23 Jun 2021 11:23:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAAKa2jm_4noz=rVc-vW6-4q-HsJtLoZXUZJfoHprjpLmYgb1EA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/6/23 上午10:26, Qiang Liu 写道:
> From: cyruscyliu <cyruscyliu@gmail.com>
>
> A malicious guest user can write VMXNET3_REG_ICR to crash QEMU. This
> patch remove the g_aasert_not_reached() there and make the access pass.
>
> Fixes: 786fd2b0f87 ("VMXNET3 device implementation")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/309
> Buglink: https://bugs.launchpad.net/qemu/+bug/1913923
>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>


Do we need to warn about the unimplemented register?

Thanks


> ---
>   hw/net/vmxnet3.c | 7 -------
>   1 file changed, 7 deletions(-)
>
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index eff299f629..a388918479 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1786,13 +1786,6 @@ vmxnet3_io_bar1_write(void *opaque,
>           vmxnet3_set_variable_mac(s, val, s->temp_mac);
>           break;
>
> -    /* Interrupt Cause Register */
> -    case VMXNET3_REG_ICR:
> -        VMW_CBPRN("Write BAR1 [VMXNET3_REG_ICR] = %" PRIx64 ", size %d",
> -                  val, size);
> -        g_assert_not_reached();
> -        break;
> -
>       /* Event Cause Register */
>       case VMXNET3_REG_ECR:
>           VMW_CBPRN("Write BAR1 [VMXNET3_REG_ECR] = %" PRIx64 ", size %d",
> --
> 2.30.2
>


