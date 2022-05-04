Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15BC51AD57
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 20:53:16 +0200 (CEST)
Received: from localhost ([::1]:50092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmK7g-0000Zo-11
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 14:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmK5p-0006qh-L3; Wed, 04 May 2022 14:51:21 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nmK5o-0004fd-4b; Wed, 04 May 2022 14:51:21 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 m6-20020a05683023a600b0060612720715so1470484ots.10; 
 Wed, 04 May 2022 11:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FDif42PMql6HMbPLfBoB8BuC7eY4P8qJSvm22ndkbcY=;
 b=FsQtrMcSkwFQwF1pv8HwKX48q56Si34kHkZ1gV87zwVRYJJ45kFCUtkGK3Bwylk5P9
 5YZmoPUpKqj7fXX30wUsccnGKwyWhr9BQtGlk7rgO8pADoZ2RBSfvmbRpuudwWu6aFOy
 sGRuAg6oEPMKLIwe6M0pieaVoe3UtbuL2sW2ePzQvFZ/BSG5OuUy654djJCnAuIhFbab
 TAZVlPtyaho0tidhOxXZY/h3xbY07MiaFLyyeHrpsL3WvRs0Vps8/VKNkean6FmcKJ0w
 E+0S84or8aGAJvtKjCfR0vdOnwZj7dx2xcTaOlVReU0pPoccOyLK0Ms2ohl8GJ1Wuve5
 Luew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FDif42PMql6HMbPLfBoB8BuC7eY4P8qJSvm22ndkbcY=;
 b=0BnS3iMCqVp0ah8bky/Kx8n+Wy3u3O/wRy2Bkou8bDY2nugjh+0/CbUSFhaFwBPkMZ
 wmZCZpZCrf0WvHuN/muDtvp3A+Lp6HUoZCVeqk27gWrdc/8oiu5ufUjzAHYzPlPueS3O
 ndVk4HwRvB0sM+06NdQXrcIApHg1OfZBH/aAS7CYAbiyXZHrIc6LVWyvT79PmCnIWa0H
 cHneYDzy08hn/k4ZkDXvfTWgim+mbnmjT4tflhpK5z24Qn1N2/z8KlLHlbYKVwRz/sI+
 /r7/poZx5Hp3+WGTNViTJcz01uF9F3UqrqY2a5uxAI/mHJWHAaEG6UuG4XyHraavVbP9
 jMDA==
X-Gm-Message-State: AOAM532C4snL+KJtiz8BZ2tysb4JXVqvdwtyRxQCiJrewbPVqD5e1tul
 MjtLi5McAGLHEJqMUDqAe1fCIqmBzIw=
X-Google-Smtp-Source: ABdhPJxaPcWIZWq530/Qyu9wAhwXAyDJRafFNR/B1V5RpByVG8/6rak/ezwTBpqvvm7iz2rFM/lsfg==
X-Received: by 2002:a05:6830:1e18:b0:605:f631:1bed with SMTP id
 s24-20020a0568301e1800b00605f6311bedmr7844244otr.137.1651690278599; 
 Wed, 04 May 2022 11:51:18 -0700 (PDT)
Received: from [192.168.10.102] (201-1-57-208.dsl.telesp.net.br.
 [201.1.57.208]) by smtp.gmail.com with ESMTPSA id
 a22-20020a056870b21600b000edf5a12baasm511849oam.46.2022.05.04.11.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 11:51:18 -0700 (PDT)
Message-ID: <8e8f9a5b-65ca-d1ba-ab96-8f883d74937b@gmail.com>
Date: Wed, 4 May 2022 15:51:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH for-7.1 v2 0/1] use dc->vmsd with spapr devices vmstate
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org
References: <20220409120940.263369-1-danielhb413@gmail.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220409120940.263369-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ping

On 4/9/22 09:09, Daniel Henrique Barboza wrote:
> Hi,
> 
> This v2 contains only the last patch from v1, patch 4, given that all
> other patches are breaking backward migration due to how
> qdev_set_legacy_instance_id() works when vmstate_register() is passing
> an id to the vmsds.
> 
> Changes from v1:
> - patches 1-3: removed
> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05615.html
> 
> Daniel Henrique Barboza (1):
>    hw/ppc: use qdev to register spapr_nvdimm vmsd
> 
>   hw/ppc/spapr_nvdimm.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 

