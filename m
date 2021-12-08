Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2EA46DBB5
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 19:59:39 +0100 (CET)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv2AE-0005Mg-GY
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 13:59:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mv28z-0003FD-Fi; Wed, 08 Dec 2021 13:58:21 -0500
Received: from [2607:f8b0:4864:20::92b] (port=35578
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mv28w-0002UB-AT; Wed, 08 Dec 2021 13:58:21 -0500
Received: by mail-ua1-x92b.google.com with SMTP id l24so6515647uak.2;
 Wed, 08 Dec 2021 10:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+08lO6DlPXqk5uhFWGq2GpwlnNhERAXm50i1UBhAC4Y=;
 b=jLo+boM0oEJpEoDJnn1G3oDrVvEDFIE2JTvP4dkf/wnTP268mM+QD9VrPtYq4Njtau
 qzVAMopvMx4kCFFNt21xkZi+mtt0DYJe0o92otp/GSMJXcpBSQWQknfRpFTcsRE7jL5U
 vl9nU8LQ6v7guLxlnYh2cedkfrlu11TrH1B/COHYY41YbE63is6VYv/pm04s5Odk4PWy
 BibUH+VhE0MiRj+6htSskTCcd6qxlIsFVLbYhH4leNErpuFABMjbnWG5/tsyKRir+KW0
 P1062Ipo7IqG1r094uFtsZGUcHrJI+VASNIGS+UnQ4IKm1XMOpOxMk1BBmoF2hueXSLa
 t0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+08lO6DlPXqk5uhFWGq2GpwlnNhERAXm50i1UBhAC4Y=;
 b=MlkpQZezBppUBWClWICNlMFMTVQu2Oq/K33iopmVTpm0ifqYCeGbvqhJphzzT+fIIM
 QbR13wxf50GlyYqVezTw5NOPf8Di9k8EYBLIJZuf4A2spNRc3FhY5vfmYSPdFnObeCxk
 K/AUb+RctcE0Mun9qbKx9SLOwPAMOsPVbuOPyemAhOKqeeBchUchNJnwBazVEHBHFwzf
 /n9rMKcS/MzevRld2Th0qM8Mq+j3lQJNNgJZIWxoWaLDMT7I20ZbQfewdu461TIIvXXE
 7KH7uGkc5ytqb7/GU8JXcg1r/21z4rl4Umr5nhqJLOBqJfnL9rjWMwasq5HdtvhAD3gF
 o+Cw==
X-Gm-Message-State: AOAM530MTbJK+xBvKGvq7CTlpEDPl46XDfdhetZEAX/K61SxJm+Y0r3x
 57qfzex+VwwW56W8jezYr+s=
X-Google-Smtp-Source: ABdhPJyPgtpAByQYWEP58kP0x2/7qbRy/mQmgL+PwBRTxLqYTXcYuiAArPQO7mioSl7ZHcpe9NgmTg==
X-Received: by 2002:a67:b643:: with SMTP id e3mr639971vsm.33.1638989895609;
 Wed, 08 Dec 2021 10:58:15 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id w2sm2286421vsw.29.2021.12.08.10.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 10:58:15 -0800 (PST)
Message-ID: <1a4750c3-f39a-ba08-44f4-0dd2e5b22b68@gmail.com>
Date: Wed, 8 Dec 2021 15:58:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] Link new ppc-spapr-hcalls.rst file to pseries.rst.
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1638982480.git.lagarcia@br.ibm.com>
 <7d3c8bad1ca76eb13d6ce2b16dd9a821edcdb27b.1638982486.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <7d3c8bad1ca76eb13d6ce2b16dd9a821edcdb27b.1638982486.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.44,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, groug@kaod.org,
 david@gibson.dropbear.id.au, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/8/21 13:59, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   docs/system/ppc/pseries.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
> index e46f09d4c8..56f5942e13 100644
> --- a/docs/system/ppc/pseries.rst
> +++ b/docs/system/ppc/pseries.rst
> @@ -113,12 +113,12 @@ can  also be found in QEMU documentation:
>   .. toctree::
>      :maxdepth: 1
>   
> +   ../../specs/ppc-spapr-hcalls.rst
>      ../../specs/ppc-spapr-numa.rst
>      ../../specs/ppc-spapr-xive.rst
>   
>   Other documentation available in QEMU docs directory:
>   
> -* Hypervisor calls (a.k.a. hcalls) (``docs/specs/ppc-spapr-hcalls.txt``).
>   * Hot plug (``/docs/specs/ppc-spapr-hotplug.txt``).
>   * Hypervisor calls needed by the Ultravisor
>     (``/docs/specs/ppc-spapr-uv-hcalls.txt``).
> 

