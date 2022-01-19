Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5399493F46
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:46:45 +0100 (CET)
Received: from localhost ([::1]:36364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAF2i-0004vI-IR
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:46:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEc1-0002nP-NC
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:19:10 -0500
Received: from [2a00:1450:4864:20::32c] (port=35720
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEby-0000BZ-S2
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:19:08 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso15807593wmj.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZyWOcSysPnnEyh9t5axXjxUHzBx01aFrnz+/BBPRe7A=;
 b=Hu+nvlCVMu1gt1uVU8DOQYbXrFIukDcQADM981igVgmayiXfL32//rKVhY0sSJE/Y3
 vCGO2QVlSUA7NlyMErc2bBxYogXtsqdm/7g0J/ZlDSbgcOQFIrA9h1u1p7Idd8VgnPsl
 U8hhZ24uOhwKGxxao290PXmJdfvlJ2OGvkou5VfIIA+9CSkV5EY8xLt2/qjMrJvxpxdr
 s/+WInWz3H/LiG5OJK8RD7oH646849lbGALLtCThFA+NQnVXsXtw0g+UUjPBco6XTEw4
 zSXXElzRpLKOm/cTkUSkoNMCbkU+WDrRUkqyb/Dex4ci6SYAwuKXH9AW1Q+GzByy9lIr
 sMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZyWOcSysPnnEyh9t5axXjxUHzBx01aFrnz+/BBPRe7A=;
 b=WhlDVev/zVn1d4AfqARXl4tHKO3hftYFjbr72FNH+lQ7SOcHa/OHr0HKQKcuIUYtPd
 xRf41B8WnI0HNz0b5VR/WD2A2Segy5GVG3penYCI5OHM4+bGJkvGHc2iNqaJ+X53WiHu
 AzuKOxvmqfQyWMZEgJtO8BaYXNYqu0ABpeLi5stdHTxwhrPYXiQyYzdO3ZEnaOHvgSDZ
 JSXL4uyrkt13hmO8dHEpXq+BvZSRu7nU9XkJ587ABjwv8samnqyiA0LD85MpAGCVOTk+
 rFHE7detiiNd51MtJbKY1YLMxgcAa5LdfqhpHdU1JckTG8cPwSGanZTQHblh/XOSVcYA
 Pikw==
X-Gm-Message-State: AOAM530Dum4x7prTlR0O7gnuw67Fii0RFNFk2sQM8MhrQl8sncldUAXv
 70zxpZlN7q38N5zKcrQ2RKuAPC+FLoI=
X-Google-Smtp-Source: ABdhPJzDrBcFWks1fD0MrIZ0zhwhanpGen8E+c7aqo6Ds8vk3KteSQMZmp0hE6DXLZnVqCoWhbFqpw==
X-Received: by 2002:a1c:a786:: with SMTP id q128mr4469015wme.176.1642612745519; 
 Wed, 19 Jan 2022 09:19:05 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h9sm186489wmq.8.2022.01.19.09.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jan 2022 09:19:04 -0800 (PST)
Message-ID: <508bf698-a7ca-da73-9d9f-6ffe702f9819@amsat.org>
Date: Wed, 19 Jan 2022 18:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/2] tests: Refresh lcitool submodule
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220110124638.610145-1-f4bug@amsat.org>
In-Reply-To: <20220110124638.610145-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

ping?

(the testing/next queue this patch was depending on is now merged).

On 1/10/22 13:46, Philippe Mathieu-Daudé wrote:
> Refresh lcitool to latest.
> 
> Based on Alex's testing/next
> Based-on: <20220105135009.1584676-1-alex.bennee@linaro.org>
> 
> Philippe Mathieu-Daudé (2):
>   MAINTAINERS: Cover lcitool submodule with build test / automation
>   tests: Refresh lcitool submodule
> 
>  MAINTAINERS                                   | 1 +
>  tests/docker/dockerfiles/alpine.docker        | 3 ++-
>  tests/docker/dockerfiles/centos8.docker       | 3 +--
>  tests/docker/dockerfiles/fedora.docker        | 3 +--
>  tests/docker/dockerfiles/opensuse-leap.docker | 2 +-
>  tests/docker/dockerfiles/ubuntu1804.docker    | 2 +-
>  tests/docker/dockerfiles/ubuntu2004.docker    | 2 +-
>  tests/lcitool/libvirt-ci                      | 2 +-
>  8 files changed, 9 insertions(+), 9 deletions(-)
> 

