Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B756A5E6F43
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 00:03:04 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obUHf-0001CM-OP
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 18:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUEC-0006e9-CZ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:59:28 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obUEA-0004Rr-QJ
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:59:28 -0400
Received: by mail-pf1-x433.google.com with SMTP id b75so10590694pfb.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 14:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=V5SOIQGijA5cunScfvdV6Bx7kW/guRl1U8s2ItT4FaI=;
 b=XYbUsiBYr4FueyDmuajld8F6sd5FJ8lH28bJDjTpVQrdi6OH6ZvQ2+VNc9c90Eyk46
 hlMK9pLRci9LVm7f6D+z01dYjcnxOku0gSfI0iPsD/8AJltrji1FsSQQ/ys6lTXFdpU+
 CJWg6yoelS7oiIOLohKpLAKKi62Z+01kV9vzepMIDE3p48TLdu8LFjNqTFZOsqzz2WL6
 OgoDPiS/CmkDRBfVJ2ZNg7A9GByGZhlWrKZSPyyApi3TNTnYqqdAkwFHmSEpo888dny0
 FO0aHycWg22jpnaroH4gSDA7TM3OkRqLydAC+2cRSK222klwb7sicmF1DiHjChoOnJDy
 G16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=V5SOIQGijA5cunScfvdV6Bx7kW/guRl1U8s2ItT4FaI=;
 b=VmWHU0Df6k7Anw3wFqqOat6ZMWcwqnUoOQuV/qIC6qoU1UAmgyszUBA233UhMRIBAr
 pQsSZ+x9dMcolORAMIBGTyjqZopaywDpvMjtGFQAsSMx3A2pbooAAq5BIDg7ABENSAZc
 SEwZWcUetBnhyHn4POGfF3T13tiU+O9IUNEp62I4T90dRKdSuKIJrKZqaxwzs8uTETgj
 0pRqL3C6g5hKEmTXn6n9m40YcaukD1s3upF3HcyYFYe93l4guGa3JRcTVvnOja0sS6tq
 AXyvAG/3YwqSx2T9Nz962lSb2Pxfnk1EwxtQOYmX6rUw/oS5JP0CnEN1UvDAo/++76BF
 wRYg==
X-Gm-Message-State: ACrzQf3te//cKaJCM16mawaG51qi8VbMmrPdeWFwkRknrJcw+uiqKcPw
 lxXPKnqk0+EAouUcQgfxwlI=
X-Google-Smtp-Source: AMsMyM7ZM7uDvCj96ShjuOpVyh5EHZcPn7MmxH7sg5UpjF5HVcHRQ0ByQARWjWu4hYrZER80LvaEXQ==
X-Received: by 2002:a05:6a00:1693:b0:554:e3e1:f357 with SMTP id
 k19-20020a056a00169300b00554e3e1f357mr5606929pfc.55.1663883965536; 
 Thu, 22 Sep 2022 14:59:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a17090ad20100b00203c0a1d56bsm249010pju.35.2022.09.22.14.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:59:25 -0700 (PDT)
Message-ID: <4986b3c1-b524-197c-b836-e89edc69ada8@amsat.org>
Date: Thu, 22 Sep 2022 23:59:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v4 02/22] hw/virtio: gracefully handle unset vhost_dev vdev
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-3-alex.bennee@linaro.org>
In-Reply-To: <20220802095010.3330793-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/8/22 11:49, Alex Bennée wrote:
> I've noticed asserts firing because we query the status of vdev after
> a vhost connection is closed down. Rather than faulting on the NULL
> indirect just quietly reply false.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220726192150.2435175-8-alex.bennee@linaro.org>
> ---
>   hw/virtio/vhost.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

