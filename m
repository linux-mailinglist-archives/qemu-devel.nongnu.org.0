Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E32742FD
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 15:26:49 +0200 (CEST)
Received: from localhost ([::1]:59610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKiJk-0002Gw-Ud
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 09:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kKiCw-0003t0-7y
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 09:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kKiCo-0006vE-0W
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 09:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600780777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=h5vbYrTtOG63BO9SZsI4jJaPrOWeXvbw07/1RgE6nqY=;
 b=QQLcyieC6Hh9AKlhO58Wo9S7KpeI+YZBTYB34cJrR49R+ezfej5AWqVxujV5886hIIeZep
 gsvpjTmSezDa2p0uY27cA6D1KRSFFeVkC2uLt2/QP+YMK+mmffxqy9QYCqhBLwKBv1GG6A
 LfXgZn+6kdQikL1wl/XoBVUY5qH3SLk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-Qc-ckOgxPkyyAwmnBKHy5w-1; Tue, 22 Sep 2020 09:19:35 -0400
X-MC-Unique: Qc-ckOgxPkyyAwmnBKHy5w-1
Received: by mail-wr1-f69.google.com with SMTP id w7so7443451wrp.2
 for <qemu-devel@nongnu.org>; Tue, 22 Sep 2020 06:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=h5vbYrTtOG63BO9SZsI4jJaPrOWeXvbw07/1RgE6nqY=;
 b=JtvdrrhnShfSpXCibmnKQzb0O52Jpad8Q530PxYRNU6FTFV1IxJ/dmhg2+vG3rK/ql
 aGPYco0KWngRSANsp0RdK1SYhbgkT7nTLZS4dt3XxJMZi5smdJ2C+JtH45IPWyGTMB2J
 ApCkhjjDrAY6C93V3VOzqhBTmpzUMp9EEtfPH2jWVgbb+vrkSIuGLVXH4U1RtkleUzp0
 pO12nEmnUNqJEJY8gSyY5UJbO/5TcUmeQbUW8mXGitilk8F3ZMibBzX5JzE3dF/XmEVF
 vdktzbPi2pxTzyQMroUX5XV6uSVEya8gf7pzljeRi63my06tMJBPsso/AwYbPEzQXii4
 GbMw==
X-Gm-Message-State: AOAM5311Zf/zj6kz0OmA959l7FdnCXjSbHYU6UO/GVyvYrn8Grn6Hux0
 RZmLWubjK0fNzXNOPfufE4Ejie03T6CZaoDusVZ7+SD2bzkNx7NIP26nSjam6TKIz0uakk1NmTC
 5wXqeaYq6Vt7Xtoc=
X-Received: by 2002:a7b:cd88:: with SMTP id y8mr1034558wmj.24.1600780773910;
 Tue, 22 Sep 2020 06:19:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYA5lNIM+ekSAA44KPgdz3GbAUGCMwWHVyRmnEIlswsoiPYOaNKwYTAbFnrLos4QUqF7+ehA==
X-Received: by 2002:a7b:cd88:: with SMTP id y8mr1034542wmj.24.1600780773729;
 Tue, 22 Sep 2020 06:19:33 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u2sm4592785wre.7.2020.09.22.06.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 06:19:32 -0700 (PDT)
Subject: Re: [PATCH 1/1] block: drop moderated sheepdog mailing list from
 MAINTAINERS file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200922090147.1993705-1-berrange@redhat.com>
 <20200922090147.1993705-2-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <8045dcba-5613-91ab-89dc-e987b30b5c03@redhat.com>
Date: Tue, 22 Sep 2020 15:19:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200922090147.1993705-2-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 00:31:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Liu Yuan <namei.unix@gmail.com>, sheepdog@lists.wpkg.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/20 11:01 AM, Daniel P. Berrangé wrote:
> The sheepdog mailing list is setup to stop and queue messages from
> non-subscribers, pending moderator approval. Unfortunately it seems
> that the moderation queue is not actively dealt with. Even when messages
> are approved, the sender is never added to the whitelist, so every
> future mail from the same sender continues to get stopped for moderation.
> 
> MAINTAINERS entries should be responsive and not uneccessarily block

Typo "unnecessarily".

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> mails from QEMU contributors, so drop the sheepdog mailing list.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3d17cad19a..8e8a4fb0a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2852,7 +2852,6 @@ F: block/rbd.c
>  Sheepdog
>  M: Liu Yuan <namei.unix@gmail.com>
>  L: qemu-block@nongnu.org
> -L: sheepdog@lists.wpkg.org
>  S: Odd Fixes
>  F: block/sheepdog.c
>  
> 


