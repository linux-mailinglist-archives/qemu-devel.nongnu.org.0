Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E79686148
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 09:09:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN8AD-00054y-Ma; Wed, 01 Feb 2023 03:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8AC-00052L-4l
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:08:16 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pN8AA-0003vj-C7
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 03:08:15 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so16431216wrb.11
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 00:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XLlFUHrB4dqS6ExW87vO+DxepZQxoiFn7C/Z7E/edp4=;
 b=J5lsL/WvlJtpwlCkxaBIktDEmFrZq9do3LodWXecQIlaSN808M3PUJdPiaBlVjjEfL
 mxHMkeTCQm4kjvhJbIgJHNjua+Vongih/8x+9hB2vYXgA3xloASuVblM7sxGSRht/cUI
 7ni5SibR3vBuLiyowBC55G/fcqCcBaPRqsuJNE7BKVFMRj2jqkCTt9/aY9WDUn3o7Tsk
 YF5AOhzcXH9EVGMR53rq5US5f268bcqn5JQ/YiH4cGmD5co84T28Hl161CAGeNvn9Qlr
 Oc883oIWTm3Q8ZpdOW6FHtZvgsYNtqYBDpgHpFo22uCXCog+UvdpCC3OuP5RZlR0N5GS
 jnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XLlFUHrB4dqS6ExW87vO+DxepZQxoiFn7C/Z7E/edp4=;
 b=fPxvBQVQbvwBoiyGRQbDl6nXBNbDMnHtH/ckqlsTjd6OQmO/wku4kmGBNEEKwm+FyU
 dgT1CABl+6TAXaiaJTHmnZUtVbFW4ZaKKaQF51rbPwGRLN1JDN2zY+twjy/OCLzE4Zob
 aEjc+lXtcSfYlBeK2Zbo7iwLOos3IJOlKnQP1r/k8g6h1K+yo/ZnDHIRakehWYu4hCgl
 cjnKq7krBNsgUiPPH9e0t9V/vuvadg32jCTlxLAB3X6RF+fkSP7ev1TWmtliVmFUKTnE
 V1cJW51g2QE9W6eHQXUMgHKmN2f1O7QDkbH3hwrg3wbw5+kxXdrZnhDCJyE/ayglCF3T
 tPSQ==
X-Gm-Message-State: AO0yUKXiZMI7A8MYwhHrC0lzx1fvvTfQLggUXK7oZe+iWToy7Sua93HK
 PDOgwSuMTtwhICClT00DNZo=
X-Google-Smtp-Source: AK7set8LPP76RGbDt/11bG6XWEjesbfQuJXYL/6cDcAr8FSy4JhHXJC9/IJSIGblrRI1R1oIYFvIMQ==
X-Received: by 2002:adf:f54a:0:b0:2bf:e7f0:b273 with SMTP id
 j10-20020adff54a000000b002bfe7f0b273mr1521846wrp.18.1675238892660; 
 Wed, 01 Feb 2023 00:08:12 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4c8e000000b002bfc2d0eff0sm16515779wrs.47.2023.02.01.00.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 00:08:12 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <6153d2e4-c00b-f966-f2f8-7eb34270dfd1@xen.org>
Date: Wed, 1 Feb 2023 08:08:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [QEMU][PATCH v5 05/10] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-6-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-6-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 31/01/2023 22:51, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   include/hw/xen/xen_common.h | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


