Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2463BDF10
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:38:01 +0200 (CEST)
Received: from localhost ([::1]:54810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0slT-0005ay-Ph
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0skK-0004XZ-0v; Tue, 06 Jul 2021 17:36:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0skI-000630-Fg; Tue, 06 Jul 2021 17:36:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t15so586426wry.11;
 Tue, 06 Jul 2021 14:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/xyQ+8xWq9WNDxU0P4YSxCX5JZV2CK7DEzY6bJuna8s=;
 b=igFpbRdXB4/EwVwKqsGN1dG/3i72dH9w2y/JYYv8SSo8DYBt9aZG5meU5sJAfJj2iG
 ZmX4G+yp/87YySNubjG2/WjjJPpAYzE78zMpdTeQzVmZjGgK3mbx4mIpaKGbekywxoht
 AzVm3/gW79fLIGZ5LHEwb78BngEUsXoR4oAJSt4lTniMD/ZVBlcHf7poK2j1URRxFDjg
 wUFCV1vtRkBJZvRT08vzNbkQ6eFHCsrUpp1OsbfVrGRzXXIhotrPjNOj2EH8EHAh9dlQ
 VbznE2KkGcX3edXTNg2IqSHE+qx+CmRLEuJQ3CLwx78f0h+CMk+LmvFc8x/+sNM919Nv
 CnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/xyQ+8xWq9WNDxU0P4YSxCX5JZV2CK7DEzY6bJuna8s=;
 b=dSAo9/9WxQckA2tkEg1qgBf+3tlGy5n2gpgoHgm7wfEjxf4ubpCJzar5rk7+ICOO7H
 osYsl/GXHucB3JYA1DENCL68tTPJRKa0yLe+7nS4r4aqB/ydvYNzeOkW7rmJ3gGHxC2N
 KyOEAH7t/w6M7sKrMKpK6Lcmt12HRg/T8KELpMj9i1J/aKQfx6E7lqWOTgnV8vxR47qp
 ltRUR8r+TpUoD2kwpPc0VeiaGJKBvKs1vZqoefsDblVSZdzJEunPT7CRIPYOMDXS409P
 GN5w0Fh63qQ/c5OaNlmCwDuItbTSDzf3B7cx0aksfZTo6Xlm7FEq5hCKREoBf4ZNlBCX
 BO6g==
X-Gm-Message-State: AOAM533BNhkJBM8/Wqh0MBeg+o4Kx+BmuOXOIXRm2fbIKoi1jtara3uq
 TjoQmnR7AmD3mbgPQ2G/KjShmaSi0ck=
X-Google-Smtp-Source: ABdhPJwDCeDzZvA+ekifp0ojInNGpnzEB7eGu19zbOq53BVfr40fOrTbWri8Pri6aTH6atIwmkMC4g==
X-Received: by 2002:a05:6000:12cf:: with SMTP id
 l15mr23911183wrx.24.1625607404129; 
 Tue, 06 Jul 2021 14:36:44 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r13sm7602921wrt.38.2021.07.06.14.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 14:36:43 -0700 (PDT)
Subject: Re: [trivial PATCH 1/1] hw/intc: Improve formatting of MEMTX_ERROR
 guest error message
To: Rebecca Cran <rebecca@nuviainc.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210706211432.31902-1-rebecca@nuviainc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8663abbf-8cee-e144-de6e-b5e80634935e@amsat.org>
Date: Tue, 6 Jul 2021 23:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706211432.31902-1-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 11:14 PM, Rebecca Cran wrote:
> Add a space in the message printed when gicr_read*/gicr_write* returns
> MEMTX_ERROR in arm_gicv3_redist.c.
> 
> Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_redist.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

