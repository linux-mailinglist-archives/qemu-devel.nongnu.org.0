Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9F43F7296
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 12:06:19 +0200 (CEST)
Received: from localhost ([::1]:43056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpnW-0003e4-FX
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 06:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIpmQ-0002un-9M
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:05:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIpmO-0000eu-BG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629885907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bm1hu83X5RCiFpNEz8NJmhwvlmO5yqpLJv2UmflFnTQ=;
 b=hGKuyBwxtXHvP+MzcWueZ37ALJ/ynorQRWJuIou/zcAvjtfqMlQ4R7q9HOuqiiMKSU1vew
 +5VGj/qP8hl+6l45BknGK45/FQH74YoMW1PhCLL9aq9Xyek8jCKk22EHWB+Ek9+cycrBLB
 0yw1LrZ0vkaj1MJDheIQZnWNCRsz7S0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-otS8-nUPMxGzOSXhGJsQfA-1; Wed, 25 Aug 2021 06:05:04 -0400
X-MC-Unique: otS8-nUPMxGzOSXhGJsQfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so2640568wmc.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:05:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bm1hu83X5RCiFpNEz8NJmhwvlmO5yqpLJv2UmflFnTQ=;
 b=DClbAgMSPgUKD0GxMe7122RUw2MR50SMpyVpFckrpjMrNzgWw8MQR+udnd6bWIDbZB
 PRN6eb9uV7RkZKAbH7dDZnr3JUhcFudzwik55wNh9fPC/NMJeOXGcWBDSehOuRF69uTn
 y+/iWzMi/lAaNg4XhxdMGd3ck61DysxEghBn6l5s5Flg4CRLNDZ5ZXkWNK6A/Z9SXh1i
 YhNPDZiZa8ibh4K6dhdTzvUcc5JY7cmSTSKxT8pWGBdexQ3dlOC/Q2NBHlBkY51y4tMt
 Y3Wfk130f0WB6fqP/UrPw/m2ltyW/ymfEaEjgCq4Lq2/s4qT8yzu0GAMdClNvAjODSWc
 B+DQ==
X-Gm-Message-State: AOAM531bGT6DttSuf6uamwWY4H98H8NL8W00IhjkralndBZJvWMOzoIo
 IipzieaBhw1afmlmpIAbFN/Sro79JkFTSerhOKr91JjwEYluBux5HzDRv3koajQdSD1RVy+K+JP
 KiVHUJElSyf9E4Q0=
X-Received: by 2002:a05:600c:1551:: with SMTP id
 f17mr8326817wmg.44.1629885902987; 
 Wed, 25 Aug 2021 03:05:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrkgNzFHhz+c3bRSRfBgPeSooX0PkGh7V4UdRxHl8SUwft51S5uIjsHoWe14sTaueKr+SLwA==
X-Received: by 2002:a05:600c:1551:: with SMTP id
 f17mr8326798wmg.44.1629885902778; 
 Wed, 25 Aug 2021 03:05:02 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id b13sm20782555wrf.86.2021.08.25.03.05.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 03:05:02 -0700 (PDT)
Subject: Re: [PATCH 0/5] optimize the downtime for vfio migration
To: "Longpeng(Mike)" <longpeng2@huawei.com>, alex.williamson@redhat.com,
 mst@redhat.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com
References: <20210825075620.2607-1-longpeng2@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b5dc6ce0-6134-f711-ce85-b69e287a220d@redhat.com>
Date: Wed, 25 Aug 2021 12:05:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825075620.2607-1-longpeng2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing David/Juan for migration big picture (just in case).

On 8/25/21 9:56 AM, Longpeng(Mike) wrote:
> In vfio migration resume phase, the cost would increase if the
> vfio device has more unmasked vectors. We try to optimize it in
> this series.
> 
> Patch 1 & 2 are simple code cleanups.
> Patch 3 defers to set irqs to vfio core.
> Patch 4 & 5 defer to commit the route to KVM core. 
> 
> The test VM has 128 vcpus and 8 VF (with 65 vectors enabled),
> we mesure the cost of the vfio_msix_enable for each one, and
> we can see the total cost can be significantly reduced.
> 
>         Origin         Apply Patch 3     Apply Patch 3/4/5   
> 1st     8              4                 2
> 2nd     15             11                2
> 3rd     22             18                2
> 4th     24             25                3
> 5th     36             33                2
> 6th     44             40                3
> 7th     51             47                3
> 8th     58             54                4
> Total   258ms          232ms             21ms
> 
> 
> Longpeng (Mike) (5):
>   vfio: use helper to simplfy the failure path in vfio_msi_enable
>   msix: simplfy the conditional in msix_set/unset_vector_notifiers
>   vfio: defer to enable msix in migration resume phase
>   kvm: irqchip: support defer to commit the route
>   vfio: defer to commit kvm route in migraiton resume phase

Overall makes sense and LGTM but migration/KVM are not my area :/


