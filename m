Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CA544F29
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 16:33:25 +0200 (CEST)
Received: from localhost ([::1]:35552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzJDw-0004Mq-7z
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 10:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzITX-0000AZ-Dw
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:45:39 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzITV-00051k-Nm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 09:45:27 -0400
Received: by mail-pl1-x631.google.com with SMTP id n18so20290920plg.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 06:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Dmy6VGbd84uL1cUmUx98X4hLtCdBm4VaI+t1HDVIxxI=;
 b=JWHOl7Ri6cGlreBrF5RtV/cs1v4YRzE5ic+lnfopduk4OlZfhY1o1+YH0WaX7kc6+N
 2aeO3A5lvpAZWWWSskdTLunLfR9zH2kG4mu7CVcINUNMQB+OoXWXNk0DCuBJlQSqi3ub
 AnJl0RcZaNquvjsqrUeUBTWNguxBxjVxGw3FCnY5OZT5Zv8fxlsMqm+ZXmcBPnUBDTiF
 qxoW+6xfB1YfcGjSYd5SZ0rL8Pe14o5appjhEaUBBKijRDlItmOdrgIKrwHjNsidGnJb
 cMBTHbXPwSbqFNA7McNMzh9PUo1o7ylodrtLfk5L+FrwQXZUmrb+X2DgWeB3deu7WAbW
 HLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dmy6VGbd84uL1cUmUx98X4hLtCdBm4VaI+t1HDVIxxI=;
 b=ePrdd9/2qqWu1227wcBWum+hdFKoNA15VihSJSfaDVteuJ8ySzxFMwngOQ9OIOEXup
 lPYc9UaiCFEHO/vdH3SzKw3Op4XIK1lbSM2JKlZCNT+byYmRqLVP+cHdlLIy1IR7sPw/
 rrZ1PjAHGHO+AswnXQzDgJZwRf/Y1vTRXmichImRUV9zsDlCknEbl0i4EjVTxZCN7Yx+
 14NR7wImhWrd0/9Zlvd54QyUhD7/xBb7DSQ/9+rxcEt8a9XUCjNq9iSlgU87GHg8y1SJ
 p4oe3fnyuJixrdBxUGwpsOE+Fm85TZ7coUWC1xl6ipUtHo04x2LX+9CQsGaLbmEAatAw
 WvDQ==
X-Gm-Message-State: AOAM5321ZgWTljX9MZr/yQPEXMfWj5eWC+v0qvOT2kfHxRJFuXsLGS0z
 lAIO0FVH4dHR3fAuJr1rNsNS+A==
X-Google-Smtp-Source: ABdhPJxHXhSF0x7dKwCvtUgop5YGJKWEWhSla295Jwv0rYnDF/ksrqo5LUQC/Fmi0p5MlxCa9Hfahw==
X-Received: by 2002:a17:903:1c8:b0:167:67ff:323d with SMTP id
 e8-20020a17090301c800b0016767ff323dmr25707668plh.22.1654782324293; 
 Thu, 09 Jun 2022 06:45:24 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 cg8-20020a056a00290800b0050dc7628178sm16824520pfb.82.2022.06.09.06.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 06:45:23 -0700 (PDT)
Message-ID: <38e3c54d-ef67-b0bd-9336-7a34c8a1a99f@linaro.org>
Date: Thu, 9 Jun 2022 06:45:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/1] VFIO updates 2022-06-08
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Cc: eric.auger@redhat.com
References: <165471611818.206382.17518111383201260657.stgit@omen>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <165471611818.206382.17518111383201260657.stgit@omen>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/8/22 12:23, Alex Williamson wrote:
> The following changes since commit 9b1f58854959c5a9bdb347e3e04c252ab7fc9ef5:
> 
>    Merge tag 'pull-la-20220606' of https://gitlab.com/rth7680/qemu into staging (2022-06-06 16:16:01 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/alex.williamson/qemu.git tags/vfio-updates-20220608.0
> 
> for you to fetch changes up to ec6600be0dc16982181c7ad80d94c143c0807dd2:
> 
>    vfio/common: remove spurious warning on vfio_listener_region_del (2022-06-08 08:44:19 -0600)
> 
> ----------------------------------------------------------------
> VFIO updates 2022-06-08
> 
>   * Fix spurious alignment warnings for TPM on unmap too (Eric Auger)

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Eric Auger (1):
>        vfio/common: remove spurious warning on vfio_listener_region_del
> 
>   hw/vfio/common.c     | 10 +++++++++-
>   hw/vfio/trace-events |  2 +-
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> 


