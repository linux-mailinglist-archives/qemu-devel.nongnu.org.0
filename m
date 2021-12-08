Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACCA46DBB4
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 19:59:24 +0100 (CET)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mv29z-0004gC-Tx
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 13:59:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mv28e-0002d0-T5; Wed, 08 Dec 2021 13:58:00 -0500
Received: from [2607:f8b0:4864:20::931] (port=41514
 helo=mail-ua1-x931.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mv28d-0002Ri-48; Wed, 08 Dec 2021 13:58:00 -0500
Received: by mail-ua1-x931.google.com with SMTP id p37so6437600uae.8;
 Wed, 08 Dec 2021 10:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3VRCUtbL9KFnLKfMFkuc9JO1IpBOaEKDNmJe11hVo5U=;
 b=iWly6lbh1HWbiNHEy9rvVPVG4EhQwyXvJQNTT1tM6IAFdP56zKL+HbP3Y4kx7FGoYl
 I68tV/WCnCMSQB4gnirI/d7dDpfjp1649rl747bQ8Pmb6t8PtPHUacYg7W0auvSy0R7Q
 tSjG2yYs8RkeFi2LdDwDE8P8Hwq/mRmW0x1bigQUq4d/GjE2g6/2Z7e0C4+6x81pq8gO
 zwthcRDYBruKNBfT0ZXzutEp1mVKGCPpsfPBPCGbi9s6FUV+jZMRjStq+o9t+7FhsNWF
 HJbGtU6SdTIP3KUE3ti2jJhTZYNs0CCqPLofRp9e0FJlhjCPQeSAk4oU+5UUKBuH8euj
 lr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3VRCUtbL9KFnLKfMFkuc9JO1IpBOaEKDNmJe11hVo5U=;
 b=Sb2icmvAnGr0A0ihaux79rfpAcHHN7l9VTIDLAVF+z3fDZ65o5Q8H8WWRZQuXiyK+H
 BnVlG5NWVPY9mJDDRapxIe60EBm+Z11gWSyU/nt3eUNXVus0q3HzEZHcjC+zu/uzSyqe
 p6icJvaHmCoC+M4vBIVLpPu09BdVT+i6hVXOx4wC6m8R2sDlaNDHWPc5yvV323q8TYu9
 hmVhWG3Biij3EhFnoJRdpiMWWW7JdSyI+DDz/uLyZSbHXaeO2nqebio9gACQbDI3uqRr
 X65yWEP94Hm2d7Go16kFo9Mh+Nh93SQdbS5F7FbSl7kw2V5ERsfEVap51ED8bVYRbozT
 9jvQ==
X-Gm-Message-State: AOAM532YZUzawudKtziwBf5PwzeA1qrA3PAB4bKS+4upYOoVk8dg507H
 0CiUK635Ips5jISsvlBqyi8=
X-Google-Smtp-Source: ABdhPJzR+QJ9DESIzu6bEqmvbUiN6pX3UFfGFnB4RYEvv0AvMOP03J1rXbZY6f9shMi+eKfjBajnXQ==
X-Received: by 2002:a67:e007:: with SMTP id c7mr649720vsl.64.1638989877062;
 Wed, 08 Dec 2021 10:57:57 -0800 (PST)
Received: from [192.168.10.222] ([177.103.2.88])
 by smtp.gmail.com with ESMTPSA id a4sm2269628vkm.46.2021.12.08.10.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 10:57:56 -0800 (PST)
Message-ID: <60c3ed6a-9ea1-695e-b287-00e5cd95f3cd@gmail.com>
Date: Wed, 8 Dec 2021 15:57:53 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] docs: Rename ppc-spapr-hcalls.txt to
 ppc-spapr-hcalls.rst.
Content-Language: en-US
To: lagarcia@linux.ibm.com, qemu-ppc@nongnu.org
References: <cover.1638982480.git.lagarcia@br.ibm.com>
 <7f13e40e05ddb411697b0777b0e37757f76905e9.1638982486.git.lagarcia@br.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <7f13e40e05ddb411697b0777b0e37757f76905e9.1638982486.git.lagarcia@br.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::931
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x931.google.com
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


>   docs/specs/{ppc-spapr-hcalls.txt => ppc-spapr-hcalls.rst} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename docs/specs/{ppc-spapr-hcalls.txt => ppc-spapr-hcalls.rst} (100%)
> 
> diff --git a/docs/specs/ppc-spapr-hcalls.txt b/docs/specs/ppc-spapr-hcalls.rst
> similarity index 100%
> rename from docs/specs/ppc-spapr-hcalls.txt
> rename to docs/specs/ppc-spapr-hcalls.rst
> 

