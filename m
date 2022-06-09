Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4436754552D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 21:56:07 +0200 (CEST)
Received: from localhost ([::1]:47468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzOGE-0007NZ-9y
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 15:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOCT-0005Yy-Kw
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 15:52:14 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:33324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOCQ-0002So-Ct
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 15:52:13 -0400
Received: by mail-pg1-x529.google.com with SMTP id r71so22820583pgr.0
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 12:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Kt4xiy85THqY9nNeKScrFbUnEKnqrcJ7Xztq5iLpiq8=;
 b=EjIEuOLdAfb3sdhk8CuLOQgJX3N/UdD758m4zZUuGaZTppiJolTh18H+l5j9Mv9sKp
 x8G8pnQdrxzPZEzq24l+2Dc5SyNUSPG8ghJsJI/x4YHnYUNxwFFQ2nmXCV+qX5VbPly9
 blOZdc1/60sl2ZAASk63HCE09Akp7mDoPl0Bs5zN8WdafRIiy3JpahIXhcLwJSR62sPh
 iht+Kz1REZIEqHwn7BwN+CZezzYSA8oJB+k23m6pkc4uvnw6Eclv6bBP5/I00CLy6+Ja
 liq/4qagu1O1AmGzlVJLUysHiWbSf49sI4XoR+As1vo7q39Nse9jAhBUczGqVxhiitw5
 70vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Kt4xiy85THqY9nNeKScrFbUnEKnqrcJ7Xztq5iLpiq8=;
 b=SDhQ0ipAXe/6rr/7T/2vq2EwtUgspFHi+OUxpLHi7OSyN6QgRGo/J0MOapglLC4O34
 X4qBoUD7YtQudsHJKRPsdFr5c0/119A0Lo+y/l5HPQzm7tDbNd3wyCZAIqC/dbFq9MtN
 GA/KjFbZwu6Odo3vJ7ooLskB0h87A5/86bKOCIhPGkbiyeXKxODRYXHeak8TWxW0dZkO
 hkUfBL2ny59twQMMxkiYGFwZSKQq7mdVUutvJnnr5UAfLrdqH/y7QKwL8I+QsMdXO8fI
 +NmWOjiz/T9J2tw/sv4T4fEoVhrP/yQTIsqp+1KYnQaoiC5l+2hKerTihtODi9LpLypW
 xWsA==
X-Gm-Message-State: AOAM5314mxbPJIjakro3S+fhMd2WN+27CYNUeS9JWiORQb30ayV0sNCQ
 kL+errmY22xpqKFEdsCWeg485ofYvEP2rA==
X-Google-Smtp-Source: ABdhPJyre+VDBVjTtt5htP9hF3VIKyTKYieTvDMSp8v0eRDIRFk/of6ShUjskOj3wxooZHQM1rz27w==
X-Received: by 2002:a63:1a09:0:b0:3fd:ac2b:3876 with SMTP id
 a9-20020a631a09000000b003fdac2b3876mr20606468pga.457.1654804329016; 
 Thu, 09 Jun 2022 12:52:09 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a170903124100b00167942e0ee9sm6315355plh.61.2022.06.09.12.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 12:52:08 -0700 (PDT)
Message-ID: <c8af2481-e9df-dd98-f6da-d82d508fa435@linaro.org>
Date: Thu, 9 Jun 2022 12:52:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/3] xen queue 2022-06-09
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org
References: <20220609140202.45227-1-anthony.perard@citrix.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220609140202.45227-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

On 6/9/22 07:01, Anthony PERARD via wrote:
> The following changes since commit 05911658cb46d907fb38cbc0b48d2b652237dc28:
> 
>    Merge tag 'vfio-updates-20220608.0' of https://gitlab.com/alex.williamson/qemu into staging (2022-06-08 13:38:54 -0700)
> 
> are available in the Git repository at:
> 
>    https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20220609
> 
> for you to fetch changes up to 6a8a8b62bdc8e3d7c5fc0f82ef4583707183b12f:
> 
>    include/hw/ide: Unexport pci_piix3_xen_ide_unplug() (2022-06-09 14:47:42 +0100)
> 
> ----------------------------------------------------------------
> Xen patches
> 
> - PIIX3-IDE Xen cleanup

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Bernhard Beschow (3):
>        hw/ide/piix: Remove redundant "piix3-ide-xen" device class
>        hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
>        include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
> 
>   hw/i386/pc_piix.c          |  3 +--
>   hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++++++++++-
>   hw/ide/piix.c              | 42 ----------------------------------------
>   include/hw/ide.h           |  3 ---
>   4 files changed, 48 insertions(+), 48 deletions(-)
> 


