Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D856530F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:08:31 +0200 (CEST)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8JwL-0005kx-Qw
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Jv1-0004tq-Ld
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:07:07 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Juz-0003bQ-UG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:07:07 -0400
Received: by mail-pg1-x52a.google.com with SMTP id r22so1744078pgr.2
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VAx7V1cDfFKHEz+XWTVqO+swOjmRxvROlG7HQ/X3zoQ=;
 b=QEUR0mK+hye+qQhK8HZQA2KDq/4sby4y0UD6Rny8WOl/tOg8jr9h6FX5rqQwgJ9NTU
 iZnU+/maT+KDfJxmkyIbVsaPciEBiE3qn5wXLq1HGWqgrcMnGMZs/JVZ2S3LkmnwGA1+
 8O1AXvd0rb5zYiebe89QBCFDkzidoC1q03SZb40kFzSv69qTbe3F2cAqrcgrRx+7KrWL
 YnzJOhkeAOB+DbNHcgyBK5uPasPvIsjb1+HL9JWnkEOYp20HNRtaAzLLaBKM9hrpj1sc
 jImLNq50ZV0qUoeHYozSxLi8ANUCB7Otse6DErkoKPI50LMZoNYBB1M2XHmV2O6kVhFC
 fr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VAx7V1cDfFKHEz+XWTVqO+swOjmRxvROlG7HQ/X3zoQ=;
 b=D7MKNR1VF1WWwrEMbnj/PmEtBs7OuXdfIXowDkcKNGcKombTnZkAppBS1x1pjUT0vu
 ru6j/KvB1o86yCfksYVYIK35GV7gdVNiRiNpS5zH4qObvigpBnYlbUpbjT3ThUkKIicr
 cXFJO6mZo9sTTl6oLcrFkFvEwBF5ZWs9b8iUNxGZvWF/ekJrk5+CIQUepowCl5fgEX6l
 +fl1e0Bj9e1EwMRUq5SMWyAmhZOlacd6HdarATGrSaMl1843Pd0eLdLwFRYJtt2kP6bk
 NOsDmuHm69zE7vAE4Mz341JLUoerGIjTsI8pwDYcrk94a4JSwj/USVT9qRzaHQgXxCuo
 mrIQ==
X-Gm-Message-State: AJIora9HuLUfVtR5dhbbl4mqK+GFiQVp/VdBMNF7oPwMg4e0uQf6Gt+m
 MEypL1z911TO/eMt17iKImUksw==
X-Google-Smtp-Source: AGRyM1vSDNgf6ho4c88ynvWHQyIWJfgFpRqOGQOaZCD/2+8IIAzwa/66zf/+s4lSP9b6HEkKeZFGoA==
X-Received: by 2002:a65:6a05:0:b0:3db:27cb:9123 with SMTP id
 m5-20020a656a05000000b003db27cb9123mr25119991pgu.497.1656932824201; 
 Mon, 04 Jul 2022 04:07:04 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a1709027e4300b0016bb24f5d19sm8622935pln.209.2022.07.04.04.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:07:03 -0700 (PDT)
Message-ID: <222ee898-e49e-fe90-64bc-5d8407398c36@linaro.org>
Date: Mon, 4 Jul 2022 16:36:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 0/8] Kraxel 20220704 patches
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Canokeys.org" <contact@canokeys.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>
References: <20220704075946.921883-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220704075946.921883-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 7/4/22 13:29, Gerd Hoffmann wrote:
> The following changes since commit d495e432c04a6394126c35cf96517749708b410f:
> 
>    Merge tag 'pull-aspeed-20220630' of https://github.com/legoater/qemu into staging (2022-06-30 22:04:12 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kraxel/qemu.git tags/kraxel-20220704-pull-request
> 
> for you to fetch changes up to 927b968d1bc7c0a25edad8161608223b1122a253:
> 
>    hw: canokey: Remove HS support as not compliant to the spec (2022-07-01 12:39:51 +0200)
> 
> ----------------------------------------------------------------
> usb: canokey fixes.
> ui: better tab labels, cocoa fix,
> docs: convert fw_cfg to rst.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> 
> Akihiko Odaki (1):
>    ui/cocoa: Fix clipboard text release
> 
> Hongren (Zenithal) Zheng (3):
>    hw/usb/canokey: Fix CCID ZLP
>    hw/usb/canokey: fix compatibility of qemu-xhci
>    docs/system/devices/usb/canokey: remove limitations on qemu-xhci
> 
> MkfsSion (1):
>    hw: canokey: Remove HS support as not compliant to the spec
> 
> Simon Sapin (2):
>    Rename docs/specs/fw_cfg.txt to .rst
>    Convert fw_cfg.rst to reStructuredText syntax
> 
> Wen, Jianxian (1):
>    ui/console: allow display device to be labeled with given id
> 
>   include/ui/console.h                  |   1 +
>   hw/usb/canokey.c                      |  31 +++-
>   ui/console.c                          |  41 ++++-
>   docs/specs/{fw_cfg.txt => fw_cfg.rst} | 211 ++++++++++++++------------
>   docs/specs/index.rst                  |   1 +
>   docs/system/devices/canokey.rst       |  10 --
>   ui/cocoa.m                            |   4 +-
>   7 files changed, 189 insertions(+), 110 deletions(-)
>   rename docs/specs/{fw_cfg.txt => fw_cfg.rst} (58%)
> 


