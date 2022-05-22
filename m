Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D8F530667
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 00:06:42 +0200 (CEST)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nstij-0003KR-GO
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 18:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsth6-0002Mu-7W; Sun, 22 May 2022 18:05:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nsth4-0002PW-Ot; Sun, 22 May 2022 18:04:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so15842228pjp.3; 
 Sun, 22 May 2022 15:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dh2yD+FyfbZ1/WHe4AyfuaVRMsw+Tx8hX0HWTNR7jno=;
 b=SlpmPSzxO8lf6hM/pc80Dw1yzsssyreXeUkG8QyCZmGM+Qspc8CpcESh95eVkNjt24
 8k7YvJYTqLiSSgmfEBxZDRZJ616bmaF6PuYbJTfEMhW5cSJWWW8c7BN3dscOEclA+j6Q
 QNiJ2a1di4+TAVF6WMhurqpYldpclh9WkvGdTrdEoWF20KOm+a74FMwdpo9u0GEKm21+
 5v+rTCe64wWGD7hYnUTHqIA9dRZ4I5I82+hHUOiacWmblM3bs8alvVgsTXg2LAIegxwM
 nZhxM8IP5XKSB0JLNDc7lOdiYqFaSy80w/bmUSpbtX49UaTq/AttKx/miTpdL8+cGVEV
 ctQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dh2yD+FyfbZ1/WHe4AyfuaVRMsw+Tx8hX0HWTNR7jno=;
 b=OesfC0rcJRSM9elikUBuMn2t23b9g8H5qsREGkZtjkGJBqWKAm/38T7ZALZusaNNop
 Q2EOtOW4ouaWvrH5oPWK3Pxi/jJRnSWs3TOnCCf8WrC78e2o8rdMnHLqFdL74K1edRY8
 +O9AFn3HUJSsqMnfJ/LQcedSX0AKqO4mYgn/D6y6focdXSFrxeCLZRA+gFfQAYgrYMPj
 Jf4ydQs1Ph1o19RgF9olvwC6quqTeyaVvqtF+idkpywc/hbVfZAL9Tw7mNdxW+E0lS5s
 jCtnyk5Nh66TXzNtsPI/uWLwYONnxAA3b1VRP4D46GJUL0i41/0QSAvD/79wCPMBgdgJ
 ZlTg==
X-Gm-Message-State: AOAM531kAKvG5pVTvJc6Gp/stZiA4An2OkGH+5alrK3aP0QNdQM93amQ
 Vjr7JquPdSFVR+lkaHpLRVY=
X-Google-Smtp-Source: ABdhPJzoprL9ClvVGTHVpuAISaKExpGPZ8oA9tYBWHomz/5m7hHGP+VpmTps1eBg/b3P3sXHDYFWQg==
X-Received: by 2002:a17:90a:eac5:b0:1df:7da8:4b19 with SMTP id
 ev5-20020a17090aeac500b001df7da84b19mr23623923pjb.2.1653257097111; 
 Sun, 22 May 2022 15:04:57 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a170902d4c200b0016168e90f2csm3548822plg.208.2022.05.22.15.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 May 2022 15:04:56 -0700 (PDT)
Message-ID: <c0577983-17b6-0698-db99-017fde8f84c0@amsat.org>
Date: Mon, 23 May 2022 00:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/6] QOM'ify PIIX southbridge creation
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20220522212431.14598-1-shentey@gmail.com>
In-Reply-To: <20220522212431.14598-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 22/5/22 23:24, Bernhard Beschow wrote:

> Bernhard Beschow (6):
>    include/hw/southbridge/piix: Aggregate all PIIX soughbridge type names
>    hw/isa/piix{3,4}: Move pci_map_irq_fn's near pci_set_irq_fn's
>    hw/isa/piix{3,4}: QOM'ify PCI device creation and wiring
>    hw/isa/piix{3,4}: Factor out ISABus retrieval from create() functions
>    hw/isa/piix4: QOM'ify PIIX4 PM creation
>    hw/isa/piix{3,4}: Inline and remove create() functions

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

