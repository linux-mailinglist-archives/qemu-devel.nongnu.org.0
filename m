Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2B44DB66
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 19:01:22 +0100 (CET)
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlEO1-0003BA-B7
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 13:01:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlEMa-0002EQ-3g
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlEMX-0003O2-Lj
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:59:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636653587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLv6fTUZW9KrZCpnVOyUzEiVxXEdaVOK193lltA3yQo=;
 b=LBDGwZC3UNJhLUncYOLuf1HxcXX/lt45r/NAOvlsTnqMI1aEqxe1oB/625c540FtLke7Wi
 SZHiDTqcg0eeg16Xw99kU/gm9idoNj+v69yTmPfhmUnanSfsoaofUmBog58aNeSMdqh+ET
 E4A9qaSZFihrOkL3Xa78f8+XHQiBFSQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-vnp_PfSiP5-DSRIc_xT_Qw-1; Thu, 11 Nov 2021 12:59:46 -0500
X-MC-Unique: vnp_PfSiP5-DSRIc_xT_Qw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so2126186wmr.3
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:59:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MLv6fTUZW9KrZCpnVOyUzEiVxXEdaVOK193lltA3yQo=;
 b=p56jhYltNFhN4mwwFKc0D+GImLYqVlKQilTsWF/iLM+voKzaAc8ajSnyazRgVy7ZpO
 QMDJbwjo4rEjSphHphuy7mdomlvhvmrGZXBztHy6JTTdo8jAKv4bEH6s2kIYYXpfFTO9
 ap5LbJPz+Q6emZ6OfoLv2/k8d1iwVJpvzXzF2blDmDVVggVVcHELmaqV2KvmCGcoeQSx
 oLfxPkiZhkwuUS/9dB1oO4W1QkSnv7n8DcvWJ1Qi0WfB8NH6YMIVcRcywpXphitssJQ7
 gvr2As0vapJt6ECQ1SZGE/MbrYG6tv6rzzottOPjuN2FtKTkQ8FWHqCGW0EUsZbE83Y1
 Yl4w==
X-Gm-Message-State: AOAM532d3c0Rp3kRoiXqIcwYlYuKMuha2sm9u4pLQsQ80TGq/UgCSiyU
 JVgF8xx54unPKSnjkHGuqCt8+DfHFUi2+Oo8WSTU3DrSaQT2uBeNayZrnvolWSvTQt+P+zpsIwH
 VBtfIL3BtHCfHgKI=
X-Received: by 2002:a1c:f614:: with SMTP id w20mr27062021wmc.71.1636653585542; 
 Thu, 11 Nov 2021 09:59:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXbPppwm3+LWfbtCSN/YSjn6yexKgEzfdH5koocqKqAqI6xPDIF+EhtOt9GpYtBcz5eytqYw==
X-Received: by 2002:a1c:f614:: with SMTP id w20mr27061988wmc.71.1636653585323; 
 Thu, 11 Nov 2021 09:59:45 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id x13sm3758263wrr.47.2021.11.11.09.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 09:59:44 -0800 (PST)
Message-ID: <681e58cf-af57-3c5d-423d-49f32c86dfcf@redhat.com>
Date: Thu, 11 Nov 2021 18:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 05/10] vhost-backend: avoid overflow on memslots_limit
To: Roman Kagan <rvkagan@yandex-team.ru>, qemu-devel@nongnu.org
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-6-rvkagan@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211111153354.18807-6-rvkagan@yandex-team.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 16:33, Roman Kagan wrote:
> Fix the (hypothetical) potential problem when the value parsed out of
> the vhost module parameter in sysfs overflows the return value from
> vhost_kernel_memslots_limit.
> 
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> ---
>  hw/virtio/vhost-backend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index b65f8f7e97..44f7dbb243 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -58,7 +58,7 @@ static int vhost_kernel_memslots_limit(struct vhost_dev *dev)
>      if (g_file_get_contents("/sys/module/vhost/parameters/max_mem_regions",
>                              &s, NULL, NULL)) {
>          uint64_t val = g_ascii_strtoull(s, NULL, 10);

Would using qemu_strtou64() simplify this?

> -        if (!((val == G_MAXUINT64 || !val) && errno)) {
> +        if (val < INT_MAX && val > 0) {
>              g_free(s);
>              return val;
>          }
> 


