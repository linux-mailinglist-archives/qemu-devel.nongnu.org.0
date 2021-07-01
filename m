Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDEA3B91B0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 14:38:49 +0200 (CEST)
Received: from localhost ([::1]:55878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyvxx-0004At-0q
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 08:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyvvu-0002Ow-0T
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyvvr-0002j0-Sw
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 08:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625142999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyYl7HT1Fyb0vVatrKdGxHtTO/GEx7DbvtQXBmD59ho=;
 b=ah4WsoY9x438eN5wttrcHrTGK1lIEXrRTCr3MuqR4zcEg9H39t8vvdgBRmL5tp8+rgIFVZ
 6Nytnio9Hn+/YKf/pAZgieISMc2OHKfn4CYzJgMXYAgNL5DEHBG+U9Lfz0FIR8YMJplZDb
 riuwxIISsHIvNOmNdawYjeuZO1nIiz0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-EssX8SJXNnKRoaSH1LYkpQ-1; Thu, 01 Jul 2021 08:36:38 -0400
X-MC-Unique: EssX8SJXNnKRoaSH1LYkpQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 b3-20020a05600018a3b029011a84f85e1cso2513179wri.10
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 05:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QyYl7HT1Fyb0vVatrKdGxHtTO/GEx7DbvtQXBmD59ho=;
 b=ILPpi4e63C8zz9VU9Ixd2P8Un5pSTYjXKkD6JVwChfvZJ+kj7rNrE2xd01yKh2T/fN
 hGIkjkfAjnzzBlq9UKWXRE8uuAhlsU/CZcBgmHSehBxui44q4a/gwwQpdp3kBoaA9ZI9
 7OVj14KrPWvEg9rYrKlfOkZfymfB+M0YmlxqNPdZ4L/yEZXwAnoDHGkua1ozFI3T7N8P
 4Rm4wTzzCohtPrkdEZcSlBECjxO3cU1Uts+u7oZdvRmcLR2sUFcUHbcEH4FLO5S30dt+
 J2yTAReouKRNG6WXKDpchun987BgHvzGFViSNLNstNshEGfWaulJ3H95MytnVO/agrm7
 g2aQ==
X-Gm-Message-State: AOAM533JKxDEVfNFgVq7Ve40kXOm1nvOx0l3HN6BV1+/ffe14mYPdcmY
 JSec3UVXwIcUi7N52uizUlV6fYHUUmQuw4Kz94z9/fxsznR+OZJN2+v6MH5IWW2Ibu7ZQrLdXoJ
 NfpsNNfjkVM3+bCw=
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr46074033wry.15.1625142997048; 
 Thu, 01 Jul 2021 05:36:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC1XU+w3x7N0tZW1VXRnnfjQWpP7KkvgNQRoc2vMx17Qups6l59Dmyf1WdrivBVQfyuoNA+Q==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr46074008wry.15.1625142996820; 
 Thu, 01 Jul 2021 05:36:36 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id f2sm6183815wrq.69.2021.07.01.05.36.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 05:36:36 -0700 (PDT)
Subject: Re: [RFC v6 09/13] target/s390x: make helper.c sysemu-only
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-10-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a3eb7e42-020a-ed1c-ccd9-07cdd4b5382a@redhat.com>
Date: Thu, 1 Jul 2021 14:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-10-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: cfontana@suse.com, Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> Now that we have moved cpu-dump functionality out of helper.c,
> we can make the module sysemu-only.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/s390x/helper.c    | 9 +--------
>   target/s390x/meson.build | 2 +-
>   2 files changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index c72e990f4d..a4d4665f67 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -1,5 +1,5 @@
>   /*
> - *  S/390 helpers
> + *  S/390 helpers - systemu only

s/systemu/sysemu/

With that typo fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


