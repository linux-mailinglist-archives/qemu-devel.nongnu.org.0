Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F03124C975
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 10:28:23 +0200 (CEST)
Received: from localhost ([::1]:44808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdsQh-0000U7-52
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 04:28:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57563)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdsGd-0001oZ-Tc
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:18:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hds5m-00049h-Nf
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:06:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51404)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hds5g-0003zI-L3
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 04:06:43 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so2055272wma.1
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 01:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jCzA0nC6mmp8cPZAQXRevYLZy6uzv5Hh3scRQ58zViw=;
 b=JTXwOmTLGe4ZfE19FSuhLxLZWyaHZQgxUd10LuVP3CTdfpKxpZEAE4wppbILgof+0o
 OTes3GJw3yqOLjUpT/4CzqbZ8+a5+TKSavxMNiEJoY70O4v21qNez/Ui9UDm71+N1VWt
 73kKn+vsCEYkbqVVYuAy1w3AWBQclKEdL2vLLI7nqsa71g23NhiHPPLB4FWG6JNLqMDV
 HSGRdV0AelVAxPXCclapWXxnSoX+xh2M9jaIOl1WFTwJ8rDRLJ1iS1RQVM8R8DX1y3Ai
 X9FSGH7WjwiNkA+JCaL8hBi10CIiCG8CPZvOmC9rD4JmGLis5yDDzqSM8ED9kZreS573
 RPxA==
X-Gm-Message-State: APjAAAVYC9wpBP3JucKJFN7Oh6ZESxdj5IX31dz8+rZNR6UuyP+RU7no
 UgTkmZJSvbBM2pXnkLmt6ii2kQ==
X-Google-Smtp-Source: APXvYqxpTvHEZnTx0H3RqawRRzHye7oZqPqECXeLC0l5HfzENIA5vF5U9Sb6bjNkWZ1PNR+iB2I5ZQ==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr1648140wmi.156.1561017989422; 
 Thu, 20 Jun 2019 01:06:29 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id h90sm38598020wrh.15.2019.06.20.01.06.28
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 01:06:28 -0700 (PDT)
To: Lidong Chen <lidong.chen@oracle.com>, qemu-devel@nongnu.org
References: <cover.1560806687.git.lidong.chen@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2c9caa60-61c0-3611-8a37-c3168bd8d1a6@redhat.com>
Date: Thu, 20 Jun 2019 10:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1560806687.git.lidong.chen@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [Qemu-devel PATCH v3 0/2] fix incorrect assertions
 in sd and main-loop
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, liq3ea@gmail.com,
 f4bug@amsat.org, armbru@redhat.com, darren.kenny@oracle.com,
 liran.alon@oracle.com, marcandre.lureau@gmail.com, amarkovic@wavecomp.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/19 9:14 PM, Lidong Chen wrote:
> This v3 added Philippe's Reviewed-by in patch2 (main-loop.c) 

Thanks.

> I also included Philippe's previous comment about patch1 (sd.c)
> in this cover: 
> 
> --------
> Not sure via which tree this patch is going (trivial?).
> To the maintainer, please consider adding when applying:
> 
> "This access can not happen. Fix to silent static analyzer warnings."

What I asked you is to add this in the patch1 description.
If you were not to respin, then I'd ask the maintainer who takes this
series to amend this comment to the patch.

> 
> As confirmed by Lidong in v1 here:
> https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg01337.html
> 
> Thanks,
> 
> Phil.
> -------
> 
> Lidong Chen (2):
>   sd: Fix out-of-bounds assertions
>   util/main-loop: Fix incorrect assertion
> 
>  hw/sd/sd.c       | 4 ++--
>  util/main-loop.c | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 

