Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FF03775D2
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 09:50:57 +0200 (CEST)
Received: from localhost ([::1]:47898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfeDH-0006ZA-Ui
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 03:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfeBo-0005fS-Mp
 for qemu-devel@nongnu.org; Sun, 09 May 2021 03:49:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lfeBl-0000nb-Nh
 for qemu-devel@nongnu.org; Sun, 09 May 2021 03:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620546560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RqhovYHfD0QFWo7kAdOSHgjRICRWeS/tTIpUn6CTEJg=;
 b=jBCkVY0wlewvSpIoqLOzqLTI/bYXPISvgveogTwTo5tbHKvESc7s5A85/RShAC63LVKYhu
 6pdHA9iXdX+31K3VHngxcotr27lXt8uWro24hIfAYPPxS/wJ4bLkNn8LITPCI7qa8UsP5G
 yP0Jhqjr8sRvdpX5ejHI7RGe8Z3hiPw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-ygF-k5hkPcuv3F0Vr5DILA-1; Sun, 09 May 2021 03:49:18 -0400
X-MC-Unique: ygF-k5hkPcuv3F0Vr5DILA-1
Received: by mail-wr1-f69.google.com with SMTP id
 x10-20020adfc18a0000b029010d83c83f2aso5836299wre.8
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 00:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RqhovYHfD0QFWo7kAdOSHgjRICRWeS/tTIpUn6CTEJg=;
 b=lACQeYq2HjmKDHhQsHAvj2fw4CfVMtY+QhNDg45Mpj6+zH9dHpoc109sSZL+A2vqRY
 QUSJSicKfF2Rv1+HGea/XRxIsWShnX8BS6Kxzec4uAq0BW8bumS5gwDL8Lzrcq6x7ppj
 u+HitpwsfqwvSSJHktNC6AVzm84Khubv2/58jdiaBsapexfbvEsUf8O8F57h/wQi2ocW
 NhsKxQ0h+KwFu01e59nedmFhJmTnhqEhgXFwAPyW6UnPEKvh20z5SYU1u/bDlaIYrRcJ
 Z16KTdXLNxOrxLX37H5HQ14VdkjTmDNn3+ls4PSMrWdtfONdsvoLYBJOi9e5/pZ/2mmQ
 zr2A==
X-Gm-Message-State: AOAM532mR9kyUQdJ3D871N7TJ1LMdLzQcXDeOgF1kGvwplyDQqTNIbNq
 jXDQnad8X23btsd+wg5WfvfWILfxvfKZdttqKinvDQ+fJ0hhL2yoo8YMFoB8jVBLsLxFsNl+C5I
 RCm4hN/IkbCG144s=
X-Received: by 2002:a1c:804a:: with SMTP id b71mr20014739wmd.82.1620546557402; 
 Sun, 09 May 2021 00:49:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNxPiR5xKWxs7L7xegw4bF6vshO9sbmrnKbtc1jwBbpPVxPd2bGx4pG8cOdBTS8qqtcOReDA==
X-Received: by 2002:a1c:804a:: with SMTP id b71mr20014730wmd.82.1620546557254; 
 Sun, 09 May 2021 00:49:17 -0700 (PDT)
Received: from [192.168.43.238] (26.red-95-127-155.staticip.rima-tde.net.
 [95.127.155.26])
 by smtp.gmail.com with ESMTPSA id c187sm10389488wmf.23.2021.05.09.00.49.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 May 2021 00:49:16 -0700 (PDT)
Subject: Re: [PATCH trivial] vnc: spelling fix (enable->enabled)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <20210508092558.351102-1-mjt@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6d83efa3-12ea-8f27-fc2a-81c033570ebd@redhat.com>
Date: Sun, 9 May 2021 09:49:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508092558.351102-1-mjt@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/8/21 11:25 AM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> diff --git a/ui/vnc.c b/ui/vnc.c
> index 456db47d71..2bea46b2b3 100644
> --- a/ui/vnc.c
> +++ b/ui/vnc.c
> @@ -598,3 +598,3 @@ bool vnc_display_reload_certs(const char *id, Error **errp)
>      if (!vd->tlscreds) {
> -        error_setg(errp, "vnc tls is not enable");
> +        error_setg(errp, "vnc tls is not enabled");
>          return false;

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


