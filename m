Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BB62AA409
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Nov 2020 09:59:23 +0100 (CET)
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbK4A-0006Xq-Qq
	for lists+qemu-devel@lfdr.de; Sat, 07 Nov 2020 03:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbK3F-0005w4-CZ
 for qemu-devel@nongnu.org; Sat, 07 Nov 2020 03:58:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kbK3B-0005zp-Gd
 for qemu-devel@nongnu.org; Sat, 07 Nov 2020 03:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604739500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCm0ch1DP6A8O77btm1KDWkp3ygTnleSatKen82wdaI=;
 b=HGuzsrPczK5inMIVxr9zcddcG6pQ3BqrzdfcFUe78i4EQr4Og4vV3JDM9zen2IkirJHCAK
 qFbNvx7Cx9TKR5cMNjh5M5egzfmDyh2cR17tYua3l0ZjuVBCsqc8IV1194ygA5QcejBaCP
 vPu1nfvpr9ONur8vlInZA1f/ojoY4/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-Yez3K0UPOHyOE65WzGU6vQ-1; Sat, 07 Nov 2020 03:58:17 -0500
X-MC-Unique: Yez3K0UPOHyOE65WzGU6vQ-1
Received: by mail-wr1-f71.google.com with SMTP id w6so1504917wrk.1
 for <qemu-devel@nongnu.org>; Sat, 07 Nov 2020 00:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aCm0ch1DP6A8O77btm1KDWkp3ygTnleSatKen82wdaI=;
 b=dIewhPp5diTHnOWhYqpFdiJl+hBfC4Wdzg0fgmH/Dk6Vvj8XqeSIlYre33mFujQsF+
 PmfFrZT9+MOz6ounbneBTiWufKXGaYEP7IFRx9EXScTvPq2HUmvhNcyWRPEMDAZxqz1J
 eJV6Lpkg6PtcfSXqJPPjqdjfdWxsKedVC7w7+uOPKNaVGhB3Ikm8qGTINHHDgJBW6cer
 PWuHJw0SwC+ckQqAco6AU98K5nFEtYGqKF+uPu6XbZ4kv7zpHbaqKp51eAhE8v6FGfV/
 alOiXzLxZqw/ro/Z/kZz+bXZNbypVFdW2mf4SupNgL4enD3zu8mSpzo2/WWy/mYMmKEH
 S59w==
X-Gm-Message-State: AOAM533ICOif+wXSoXOsKKIAZE5pn8Vk83Adouvp6A6vBrLj/csJUnWr
 tdzf5YwiF72TUhiUidnSIWvNUZLadhf9RL2fu5NzCHFe/ILAmgLIRJ5+cCiEoBbWs//Y/xGWxjl
 0I4GvKVZ93tY1CIk=
X-Received: by 2002:adf:b190:: with SMTP id q16mr7195033wra.288.1604739496512; 
 Sat, 07 Nov 2020 00:58:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoH9EAwEDv/nlYKRxTudQ4kSJp+5Lrxy81pFO4rVfkwTEniVL9UFt9xTwJimlxRiwqKq6LnA==
X-Received: by 2002:adf:b190:: with SMTP id q16mr7195013wra.288.1604739496254; 
 Sat, 07 Nov 2020 00:58:16 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id m126sm5719682wmm.0.2020.11.07.00.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Nov 2020 00:58:15 -0800 (PST)
Subject: Re: [PATCH] hw/core/qdev-properties-system: allow bus addresses > 0x1f
To: Geoffrey McRae <geoff@hostfission.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <20201106234510.2101-1-geoff@hostfission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ae70570e-dd35-ffc4-c073-f2b8674ba8e5@redhat.com>
Date: Sat, 7 Nov 2020 09:58:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201106234510.2101-1-geoff@hostfission.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/07 03:12:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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

Hi Geoffrey,

Cc'ing the QOM maintainers.

On 11/7/20 12:45 AM, Geoffrey McRae wrote:
> The commit bccb20c49df1bd683248a366021973901c11982f introduced an error
> in the checking logic that validates the bus addresses for PCI device
> addresses preventing usage of devices via vfio-pci that sit at a bus
> address of 0x20 or higher. This patch resolves this by reverting the
> checking logic to the original maximum value of 0xff
> 
> Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
> ---
>  hw/core/qdev-properties-system.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index b81a4e8d14..e62644bc69 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -882,7 +882,7 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>      bus = val;
>  
>      p = (char *)e + 1;
> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
> +    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xff || e == p) {

The fix has already been suggested last month ...:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg750122.html

... then reworked:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg750121.html

You could help to get it merged by reviewing it ;)

Thanks,

Phil.

>          goto inval;
>      }
>      if (*e == ':') {
> 


