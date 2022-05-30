Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC45537C00
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:29:47 +0200 (CEST)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfSs-00049w-Ns
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfKq-0003bs-Bo; Mon, 30 May 2022 09:21:28 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:33381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfKo-0002gz-Eb; Mon, 30 May 2022 09:21:27 -0400
Received: by mail-pf1-x429.google.com with SMTP id 202so10613771pfu.0;
 Mon, 30 May 2022 06:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1F0uftzI5Q6LjBGSRzse993wSF+4FV1A0f7dXUsc6dA=;
 b=ShOoUc1jH0YJ887llkMIp4r9G1OQvZuKunf0d5J3ssj2GQG/U4lf6aVa5p4ASdHMH3
 kMEIp+qfwQErdBazMQvTDqE6WRJmGdki+olpjhpeQc2uSyZ92rVFRTCxpMlWq6ZATZzo
 gHmnhJpIrW73tLyg0/dFVn4ygQpi2XN1e6ImKsSQPfDELRLvJjxEOxlZLHgUgvJSVNU4
 kvDtu9iljGmE5MIRzPo54dVtHoJpHUqZJD9BK2/9twwA/h80NQaC0i1sHDEhMLkpDbql
 odYVrnyc604PVVdJS+J1Ja1R2/xttV1060PcRUc28lFV86vH/70JJMrgMEdTr8dY3fdM
 F31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1F0uftzI5Q6LjBGSRzse993wSF+4FV1A0f7dXUsc6dA=;
 b=z/OTj+Ii8GY4LXKvuMKqQDviNVuzjDxkXXzifbET7iXw84u7l2QJfNrlxPrzE1XK5O
 4oLnUdGatSIQjefXNriNBf0eHV0cNnWbjwlKPjj4yWZtqtEE7E3GdL7Slq2zCnmO1T4u
 36I1rUdYTDTgKpyPiIVcpkZEwWlol2h2xDHrgx1+F618ThbuCKOHCBSVyfXmX25AyM6X
 tSbS0yomzBbXS2z1VtK3dDyC8RslpqtQS0/VGvQLs6c04K/Q0y2aytCCqRk21Q1e68B5
 PMN8BDff5A8kiZ1s561ahZW7kvLVjuIyoLj1SGEe6NO6eNsCYM7mPLYoykZ2TW5FBymB
 6N9A==
X-Gm-Message-State: AOAM532AwZSuLpE4l+27HC4DuLiNMP+m8/DsAErmcBk0RA+/23Vq1lEU
 NfwY8FfMnxmt4RuOnndXJvE=
X-Google-Smtp-Source: ABdhPJzD14XGB55/LWH/814vK4zGjVOozs3YEEt8P1fchX5CeSvAYxeGEaHIki53bJ0Uxse4XUBVfA==
X-Received: by 2002:a62:be14:0:b0:505:a43b:cf6e with SMTP id
 l20-20020a62be14000000b00505a43bcf6emr57067489pff.33.1653916884057; 
 Mon, 30 May 2022 06:21:24 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a056a001a9200b00518285976cdsm8844811pfv.9.2022.05.30.06.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:21:23 -0700 (PDT)
Message-ID: <5220940a-8b7a-6f09-6270-a138f7281c6d@amsat.org>
Date: Mon, 30 May 2022 15:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org,
 anthony.perard@citrix.com, paul@xen.org, xen-devel@lists.xenproject.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 "open list:IDE" <qemu-block@nongnu.org>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-4-shentey@gmail.com>
In-Reply-To: <20220513180957.90514-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
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

On 13/5/22 20:09, Bernhard Beschow wrote:
> This function was declared in a generic and public header, implemented
> in a device-specific source file but only used in xen_platform. Given its
> 'aux' parameter, this function is more xen-specific than piix-specific.
> Also, the hardcoded magic constants seem to be generic and related to
> PCIIDEState and IDEBus rather than piix.
> 
> Therefore, move this function to xen_platform, unexport it, and drop the
> "piix3" in the function name as well.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
>   hw/ide/piix.c              | 46 ------------------------------------
>   include/hw/ide.h           |  3 ---
>   3 files changed, 47 insertions(+), 50 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

