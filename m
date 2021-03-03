Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16CB32B678
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:14:02 +0100 (CET)
Received: from localhost ([::1]:40428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOW1-0005MZ-Sk
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:14:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOQW-0007UG-Sk
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:08:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHOQV-00077U-96
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:08:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614766098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=STMYUMTbw/S9vSMTycS0V6O+UDES9Xhg4Mvz3QviyMU=;
 b=gH9fz0sI95dnx/XtVfxFVC4kcT8QKe/SuG3zu9IxSoVgd7hv37ssYWWQHlAXzotMqZkVac
 +jYau5zD/E+kmRf+o3mzskl4g0tek5YZIVNUh73bGTUkaUpQpfz/70FJs1Coml8GVqHqv8
 4RFihhN+WAv8QKX/QwKooTjScEhZG04=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-hD7N7O-GNZSh6nTe5jNQjg-1; Wed, 03 Mar 2021 05:08:17 -0500
X-MC-Unique: hD7N7O-GNZSh6nTe5jNQjg-1
Received: by mail-wr1-f71.google.com with SMTP id m9so6698796wrx.6
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 02:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=STMYUMTbw/S9vSMTycS0V6O+UDES9Xhg4Mvz3QviyMU=;
 b=mcg17f3BuXH1Ym0LxBW5npizJ9j3anmVhaurU2qCjwbRRuBF9OvjxRedeDL45Q63c7
 TImavyK1h65//XChkqVTY4PNrcnsO/wDrROW+sv4AEyIJ8g7Wd0ZwcFdJIFL+fdtcYKn
 jcHlq68nleeU8K6U2JMkcfKGEVo9mMkQICY0PMnJXDEj3+PDWubD0UAkEpgki8RTYRzS
 P5+KLTPBzZhCVDSRLZYXVGgp46VPJZ67o1oGoH7TNqY8aSGHI27py6gByd494etVeH13
 Mc26VBtBmU10YXLy5uHXgroo8Zd8KGvyTmA3HcKFekX3inSvmdZ/XsCGj3x8b+DwQo0f
 jPfA==
X-Gm-Message-State: AOAM533PQVwKrmxDy8hb7eyQiMZiKTgoBuxjPmxK18Jiko8PiHgt5t5A
 418vmsMRiGXMoTnEvVUXg0oDCLIzolrAkdCR82sSA53mE1GyLYg1NU6iZ2OwaT1f4nSODzzWNOJ
 rdoifrJ1UA2ab4Ictdf1ZzlvpLIY/tm5JfN+tE9VUPGlxAv9eRtURdaA1BePWsuPh
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr8131307wmk.70.1614766095467; 
 Wed, 03 Mar 2021 02:08:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxr7BmPE4QbWWd7/BMQOr2y5BMwz7QsP8x8L+6avZz/+vZbvGAeIjYis9c0PuS88WlxYPl94g==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr8131284wmk.70.1614766095233; 
 Wed, 03 Mar 2021 02:08:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u2sm8835649wrp.12.2021.03.03.02.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 02:08:14 -0800 (PST)
Subject: Re: [PATCH] multi-process: Initialize variables declared with g_auto*
To: Zenghui Yu <yuzenghui@huawei.com>, elena.ufimtseva@oracle.com,
 jag.raman@oracle.com, john.g.johnson@oracle.com
References: <20210303070639.1430-1-yuzenghui@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <40a15851-30cf-033f-aa26-b5d56a696769@redhat.com>
Date: Wed, 3 Mar 2021 11:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303070639.1430-1-yuzenghui@huawei.com>
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
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: wanghaibin.wang@huawei.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/3/21 8:06 AM, Zenghui Yu wrote:
> Quote docs/devel/style.rst (section "Automatic memory deallocation"):
> 
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
> 
> Initialize @name properly to get rid of the compilation error:
> 
> ../hw/remote/proxy.c: In function 'pci_proxy_dev_realize':
> /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: 'name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
> ../hw/remote/proxy.c:350:30: note: 'name' was declared here
>              g_autofree char *name;
>                               ^~~~
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  hw/remote/memory.c | 3 +--
>  hw/remote/proxy.c  | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 32085b1e05..f5f735c15a 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -43,9 +43,8 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
>      remote_sysmem_reset();
>  
>      for (region = 0; region < msg->num_fds; region++) {

Could you move the suffix iteration out of the loop?

       for (region = 0; region < msg->num_fds; region++, suffix++) {

> -        g_autofree char *name;
> +        g_autofree char *name = g_strdup_printf("remote-mem-%u", suffix++);
>          subregion = g_new(MemoryRegion, 1);
> -        name = g_strdup_printf("remote-mem-%u", suffix++);
>          memory_region_init_ram_from_fd(subregion, NULL,
>                                         name, sysmem_info->sizes[region],
>                                         true, msg->fds[region],


