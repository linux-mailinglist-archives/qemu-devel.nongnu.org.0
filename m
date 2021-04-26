Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39236B482
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:08:10 +0200 (CEST)
Received: from localhost ([::1]:37724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1uD-0001oN-Oi
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb1sT-0001NI-EX
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb1sR-0005qH-Af
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619445978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vxaX7w5P9mVOxpVbfKSgieoj/iDSR4kJWx0mVNfzgWs=;
 b=Tv1XHwBVkqgCfsqoTTZRpZrnMrBNF9WBdJzZknPGX2Y8TVDr0HMZSKbYvnCmeq8019wvnq
 2C4yGcmBQa7Pk9W97FmV7GGGoMpYgIpajV06ZL1CUK5Eptu3iBI1IaWVL8dbSimuQ9ZbiN
 /+rm/6TtqvqjeJUeD6CS+mkE9iUYLVw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-TeZWN-jtOqy3menQdIRVuA-1; Mon, 26 Apr 2021 10:06:15 -0400
X-MC-Unique: TeZWN-jtOqy3menQdIRVuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 a12-20020a5d6cac0000b0290109c3c8d66fso3118000wra.15
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 07:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vxaX7w5P9mVOxpVbfKSgieoj/iDSR4kJWx0mVNfzgWs=;
 b=K4Og3rGy4aVXazv5k3gZvJeBJ5BeFhXBTIyazuaLix5fH/UH0dDlNDkudqb9rK1fDB
 0aPxwVnMzfi0sfGWiN95pVlX3QLk9Jr7CBp+0BfuhrLIxaFY7KRlzJyA7PLkDTZT5eOj
 z0cZGl3x53MfsIBRYdvYW3Ff6yOAiXVEpzEEIkpdIA1Ecfmi+ot26icTuAUW5lvo3mVe
 CeUp85lE71DtMSSkpwFQrDK4HCsAbSVao15+sSwPdzItNm8mLDWaUSDg7g04aA+jY/Ar
 aZDFszE/YVj7GSAReATWjU9VTOjVIgIq13x75OcGJKxSTfGr6oxxroiqXmC11MXvazBb
 3fpQ==
X-Gm-Message-State: AOAM531sSCzv1FV9MX8hCYh4KJUS53Ekgi8XPyhkCtwrwUXC6UY3R+l8
 x4MnEThoXSOdYXk9spjpu86UqEE9JwGabZ+aOIoPLYUn2+KmCH/c+7UeW7BubAESmusjyWexZqW
 Vm1CahPIRkvgXqx4=
X-Received: by 2002:a1c:720d:: with SMTP id n13mr20328494wmc.89.1619445974602; 
 Mon, 26 Apr 2021 07:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkzzoqhrK1PJuOCUmnmfmq+1jU0YO/URoqWzvOWgkA+QHeV7JcaFNo6EWwY+2yWIe3t5ydfQ==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr20328472wmc.89.1619445974427; 
 Mon, 26 Apr 2021 07:06:14 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q19sm20482226wmc.44.2021.04.26.07.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 07:06:13 -0700 (PDT)
Subject: Re: [PATCH] cutils: Fix memleak in get_relocated_path()
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
References: <20210426223042.119554-1-zhenzhong.duan@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0cf13eb3-e28b-31d4-82d1-d99636cbcaf9@redhat.com>
Date: Mon, 26 Apr 2021 16:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210426223042.119554-1-zhenzhong.duan@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
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
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/27/21 12:30 AM, Zhenzhong Duan wrote:
> Valgrind complains definitely loss in get_relocated_path(), because
> GString is leaked in get_relocated_path() when returning with gchar *.
> Use g_string_free(, false) to free GString while preserving gchar *.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> ---
>  util/cutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index ee908486da..f58c2157d2 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
>          assert(G_IS_DIR_SEPARATOR(dir[-1]));
>          g_string_append(result, dir - 1);
>      }
> -    return result->str;
> +    return g_string_free(result, FALSE);
>  }
> 

Thanks for your patch, but Stefano sent the same fix 2 weeks ago:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg798279.html

It should be merged once the development tree opens again (we are
now 'freezed' before the v6.0.0 release).

You might want to send your Review-by or Tested-by tag to Stefano's
patch.

Regards,

Phil.


