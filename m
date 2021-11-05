Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E1446194
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 10:50:15 +0100 (CET)
Received: from localhost ([::1]:57590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mivrS-00061c-HV
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 05:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mivqJ-0005BI-TN; Fri, 05 Nov 2021 05:49:04 -0400
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:34520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mivqI-0003kg-99; Fri, 05 Nov 2021 05:49:03 -0400
Received: by mail-qk1-x72b.google.com with SMTP id bq14so8244430qkb.1;
 Fri, 05 Nov 2021 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=t0iqV0YKuCZDyf/Zv1Ep2XmTznLaVVG3Zw/10myUui4=;
 b=Z5fPf8xJsnBT+T66lsEvewmw2Z/R29J//pZYlyMQQgSE93Yz6wrSA69lLaYf0U3g9n
 yF47F30knpehV7K4PmvPfUjwr6nVIGV1YFNhZXfNfaS8o9WmGTIG7uTMZRqyzo8d2U6Q
 DsV3y+QN1LZiK7vafE/NrON8fwjOkAdQETMf2qDK4QHZu3clZJHKnZifGoiKd7+NN/e8
 6HdVTzzm0AUJ/CCLhpuFCMxciIT3eKf56W9jeylzI7DRAI9XSce6sh9FREuKlknbW+vX
 LZWR15uPPebbG68O+BEtxTiXqh+SyMCDQfUl86BrtLZ2wHqpVnoNXqLHuH2IwgHIu3sk
 j7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=t0iqV0YKuCZDyf/Zv1Ep2XmTznLaVVG3Zw/10myUui4=;
 b=svEZfPzQIeQmBAYFaeq0iI1FmU87/hjWKhIHgfXUElB5YBh73PBqSlT47EURjkyPXU
 T3qNuaC0UpEWz4VeUwufC/IRwfrA0CTCSAfLubyGW4X8TVmm7joi2R14rsTksmfP8pR5
 lFsYxPSDq+xy6JgZkycVB8tK1f/AfbPAtKs4mZ+E4BLoebTTL2VnBewcHHy5SGpLqGy/
 4sR/emN7/ijZwq/yPpJ+dZtJJ1QboEfrGz07iJl4pQBqsqi9M6ph3Bdy2hrAY+UAYYsV
 i5jSP4ATFZEDmNMQFM/gZ0yj+GajKCkBNtnkkApe2UtSrJDOUHw8O17W3GwE8wtE+cHC
 MN4g==
X-Gm-Message-State: AOAM532S+eVgotLVJ7TH2ItiU+e3KVZoPu5RWVvPh3KFCO248tOO9jJf
 TGQjMA7Z015+OGORnYPg9sfzrpKu7Oo=
X-Google-Smtp-Source: ABdhPJy+KxvAKrwRHynWZy4xNPyRxtWEtVs/UnKitgg1k5HEtndWf3NT6E4h5syhTJetjK7ulcbF0A==
X-Received: by 2002:ae9:edc5:: with SMTP id
 c188mr13642582qkg.391.1636105739185; 
 Fri, 05 Nov 2021 02:48:59 -0700 (PDT)
Received: from [192.168.10.222] (201-42-211-153.dsl.telesp.net.br.
 [201.42.211.153])
 by smtp.gmail.com with ESMTPSA id u19sm5683952qtw.14.2021.11.05.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 02:48:58 -0700 (PDT)
Message-ID: <8e05f98a-6a46-f728-5035-fab10f5a209a@gmail.com>
Date: Fri, 5 Nov 2021 06:48:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] target/ppc, hw/ppc: Change maintainers
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org, clg@kaod.org
References: <20211105034640.53754-1-david@gibson.dropbear.id.au>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20211105034640.53754-1-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.093,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/5/21 00:46, David Gibson wrote:
> As our day jobs and interests have moved onto other things, Greg and I have
> been struggling to keep on top of maintainership of target/ppc and
> associated pieces like the pseries and powernv machine types, with their
> platform specific devices.
> 
> We've therefore discussed and plan to transfer maintainership to Cédric Le
> Goater (primary) and Daniel Henrique Barboza (backup).  Cédric and Daniel
> have been actively contributing to the area for some time, and they're
> supported in this by their current employer, IBM, who has an obvious
> interest in the platform.

Thank you and Greg and Red Hat for all the years of service supporting
qemu-ppc in the community. IBM will shoulder this responsibility now.

> 
> Greg and I do plan to stay around in some capacity for at least the next
> 6 months, providing reviews and advice to assist the new maintainers into
> the role.

I hope both of you stay around way longer than that :)



Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>   MAINTAINERS | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 797be5b366..066c4fb2b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -262,8 +262,10 @@ F: hw/openrisc/
>   F: tests/tcg/openrisc/
>   
>   PowerPC TCG CPUs
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
> +M: Cédric Le Goater <clg@kaod.org>
> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: target/ppc/
> @@ -382,8 +384,10 @@ F: target/mips/kvm*
>   F: target/mips/sysemu/
>   
>   PPC KVM CPUs
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
> +M: Cédric Le Goater <clg@kaod.org>
> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>   S: Maintained
>   F: target/ppc/kvm.c
>   
> @@ -1321,8 +1325,10 @@ F: include/hw/rtc/m48t59.h
>   F: tests/acceptance/ppc_prep_40p.py
>   
>   sPAPR
> -M: David Gibson <david@gibson.dropbear.id.au>
> -M: Greg Kurz <groug@kaod.org>
> +M: Cédric Le Goater <clg@kaod.org>
> +M: Daniel Henrique Barboza <danielhb413@gmail.com>
> +R: David Gibson <david@gibson.dropbear.id.au>
> +R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
>   S: Maintained
>   F: hw/*/spapr*
> @@ -1382,6 +1388,8 @@ F: include/hw/pci-host/mv64361.h
>   
>   Virtual Open Firmware (VOF)
>   M: Alexey Kardashevskiy <aik@ozlabs.ru>
> +R: Cédric Le Goater <clg@kaod.org>
> +R: Daniel Henrique Barboza <danielhb413@gmail.com>
>   R: David Gibson <david@gibson.dropbear.id.au>
>   R: Greg Kurz <groug@kaod.org>
>   L: qemu-ppc@nongnu.org
> 

