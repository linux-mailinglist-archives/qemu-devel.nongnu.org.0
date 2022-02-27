Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700434C5F64
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:16:40 +0100 (CET)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nORqJ-0004Bn-I7
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORoB-0002ee-AL
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:14:27 -0500
Received: from [2607:f8b0:4864:20::536] (port=44645
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nORo9-0001hr-JO
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:14:26 -0500
Received: by mail-pg1-x536.google.com with SMTP id c1so9815765pgk.11
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VC3N2OjoAQ40n1zOnBvflqhENnRzXb6AqHnScQcHkfQ=;
 b=SKkYpDsyOk9wzR3uiO4WPoLYu++LtSwv/WGLhAp4VfpPyzS21lU85JZUYOJOe4qKRS
 rK+TZY41pWvLgwXIbm6Jn9T8YCKjgbfan+RfmmvcWMNfm+aGNviGPXLqopkUb1RqBtEs
 hL5loBwwW63iCgPIiDdVCF5lvwMMujgd/s5NFAVc4iaOtfrs4j79gyrnDKe8gy4Lca2X
 JSLLtZh7BD4h3Bci3cmVNy2XyENRHHm59Mqb/HkMx9Nw99KwIm+lCrLoQWOMduGBuLoF
 7iT9aoEYJIHBZqiF8gd1+HE8QFWY4FqCylrKonHWUKVWyhJy+XUSpQjyR7dMzTm7QG1E
 N0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VC3N2OjoAQ40n1zOnBvflqhENnRzXb6AqHnScQcHkfQ=;
 b=okhFhNqmAPU/2DKsD1PGE7skkoutNmDioNhpoZBEWgXDgkaktrg6mSyjK1deIppcXG
 e7yIU/iLdxT1VFgtQbWRJvfQeUVX6gSxaPeOPVjjclr3AXNIjlucMbq91OS6IOdCIjG0
 Ebg6cITF0OKsHHol2B+58/A+8SzwcgRUd/ro3xdU/nrgyeG473j+j8Rh3Qogc/7mSdaP
 AcGba5hrwRsg7fiC+P4bvb2qvvPXTklXO97sC9nFjLI5t6iirGPNuFKWuyWVH/ZyM7r+
 0xH15MKnJJZxBOAeMAD58MNUR5UVVh14Ow7Tg6L9JcX1rkEbXWxmcKyrXe7Ex3o/1a0u
 B1/A==
X-Gm-Message-State: AOAM533LpQAEBSjgSayifC3FelkmFT8oBRgQyCAy+BG6Fd82e1KFsyuR
 Hq9HGh/s+VbGim4dbHZTeYGqr35JyXc=
X-Google-Smtp-Source: ABdhPJzF4Wl+W0lWgwWHRdxZylW7JlGtjAvSeYifVlNbdx/O7a2CWOvqVsYTNFk++ZTuIpk8AleB2g==
X-Received: by 2002:a05:6a00:1c9c:b0:4c0:3e77:22ea with SMTP id
 y28-20020a056a001c9c00b004c03e7722eamr18560855pfw.74.1646000063461; 
 Sun, 27 Feb 2022 14:14:23 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056a00190c00b004f39e28fb87sm11227403pfi.98.2022.02.27.14.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:14:23 -0800 (PST)
Message-ID: <cb19b6e2-46f2-7e81-3e3e-2bc06b9cd6bc@gmail.com>
Date: Sun, 27 Feb 2022 23:14:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 03/22] hw/input/pckbd: QOM'ify IRQ numbers
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
References: <20220222193446.156717-1-shentey@gmail.com>
 <20220222193446.156717-4-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220222193446.156717-4-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/2/22 20:34, Bernhard Beschow wrote:
> Exposing the IRQ numbers as a QOM properties not only allows them to be
> configurable but also to be printed by standard QOM mechanisms. This allows
> isabus_dev_print() to be retired eventually.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/input/pckbd.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)

Using uint8_t and "%u" format:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


