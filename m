Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD01FCFEF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 16:46:52 +0200 (CEST)
Received: from localhost ([::1]:43332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlZL1-00018F-1i
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 10:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlZJ1-0007X0-Cw
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:44:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58832
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlZIz-0000tt-R9
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592405085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=CHFD1VruEB4oAyd3xuiq9rrj36/A1AN7Xnv/87JKlhc=;
 b=UHp/hAY0m7midaxYTe/yryMNSugbzdQCKF/BzUcIqOrYFxWIaFTH2f6ZoMduS3BSZbCW4K
 ZTGDkEFCrH6dqlWpuJOFrh08QAvBsK+XxB+KkanyFHBI5tfRPj2Stq6uZgyfYqCVlapM/A
 AUyvxBzyQ8Njk5K8iruhvtomvmmNli0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-3xvuVwcHMUegQ4zouztrXQ-1; Wed, 17 Jun 2020 10:44:39 -0400
X-MC-Unique: 3xvuVwcHMUegQ4zouztrXQ-1
Received: by mail-ed1-f70.google.com with SMTP id a21so978119edy.1
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 07:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CHFD1VruEB4oAyd3xuiq9rrj36/A1AN7Xnv/87JKlhc=;
 b=rk95UHovyNJzPbQ2u4aRpag1MyyM5DK7kudLnETdOroDKJcX3Zrt4Mq6YhEdBwpGt2
 KiWQUbXspVDiH4Hco2JMvkQNQ+VBYe84nXMbCNdiuvtCElMA1c8+ACHOX/Kbh1vBtzbF
 YyCx7pXijV3DBABElQZRxntbS+1Lu3i6E8UaLlXA1N/nptx05z4OxyGjLFoQl0URF7Iu
 un7n3rkE8R9f2wTw59KtCMnH0Rc4vCsmHfRGThd+0pKttJ8PUq15lpCY1hGmTsuww2xV
 qHm/bCn+vAdgZNMcrlC38s/V6Jyazej6l3t+5xnCp6hxMtVAOTGYZsXao9ewUM7mDr33
 XNhw==
X-Gm-Message-State: AOAM531FfaSmo/p6OKMMuxe8dqmliDyHmoTOI9f2kBBfjwsCF1NAyuse
 pH+oy+RH1BHEjFLaiFfXVIvzyW7s/NmxlqGnm38l1plAtVOewb9ohk7ubjyvVoHf1865Z0FvwaF
 Dkgs4ygClzhyNR+k=
X-Received: by 2002:a17:906:1d5b:: with SMTP id
 o27mr7737588ejh.344.1592405078117; 
 Wed, 17 Jun 2020 07:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3naQoX53WK1KIdEqQL6yOu5CB3LT896nG37FRgHopYwfHLWeK8Brcov7DVlOJlE6ByvNEBQ==
X-Received: by 2002:a17:906:1d5b:: with SMTP id
 o27mr7737577ejh.344.1592405077895; 
 Wed, 17 Jun 2020 07:44:37 -0700 (PDT)
Received: from [192.168.1.38] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id v5sm85346ejx.123.2020.06.17.07.44.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 07:44:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] .gitignore: Ignore generated srorage-daemon files for
 in-tree builds
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20200617134505.979607482CD@zero.eik.bme.hu>
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
Message-ID: <ca05a43b-c955-cccd-e157-5692e0a08ce7@redhat.com>
Date: Wed, 17 Jun 2020 16:44:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200617134505.979607482CD@zero.eik.bme.hu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 01:42:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/20 3:06 PM, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  .gitignore | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 0c5af83aa7..d9ef9f635a 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -46,6 +46,9 @@
>  !/qapi/qapi-visit-core.c
>  /qapi/qapi-visit.[ch]
>  /qapi/qapi-doc.texi
> +/storage-daemon/qapi/qapi-doc.texi
> +/storage-daemon/qapi/qapi-*.[ch]
> +/qemu-storage-daemon
>  /qemu-edid
>  /qemu-img
>  /qemu-nbd
> 

Thanks Zoltan, but Kevin already queued a similar patch
from Roman:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg711806.html


