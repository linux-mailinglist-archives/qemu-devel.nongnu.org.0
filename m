Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234A437A9C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 18:09:05 +0200 (CEST)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdx6N-00030e-QX
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 12:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdwzP-00057s-Pn
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:01:51 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdwzM-0007yb-37
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 12:01:51 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so3382207pjb.5
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 09:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=T41wgI3+Z6l4WVNM2jlZRcmcuzSS9a+E6e2wlnloUic=;
 b=ko1XqJ2wRD29jA52fIQmKuBJX3/9ZzhmlRUDV3E+zda2wJGTnKEOe3Vf+Ah+lB3pCo
 6MA/dYLZgdq+5vMdVAADFZ+oUt/OLDJ9e9gYldj17+1/vvchK67QiQmjNMJRYulHHTzm
 8kTokD41YIKyvY63NxAQeu0JLJtLMh/MFL+R2xJhwA6CMPSjJW2MYcijhEYGXvI+Q1+2
 vwrLSHueGrm73Zdt1A5JGzOLfo4nRz78njTZLnEh7MSQaTC79/jzqKu/rI5ULuP1E7M/
 7nfqbzsB64OHQcZqRtBJakITwHDXHLK5CahPfAsFu6o22nXiJMEHG+m0GCcf2VWtB5k5
 Gveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T41wgI3+Z6l4WVNM2jlZRcmcuzSS9a+E6e2wlnloUic=;
 b=iik+TezZQtuxGobUaZg7cGxlhnThDdOsIjUfl1kNhgbrf3wzGEx/tgqjbFYd1/bwMb
 sfvaOYPB+xiZ+Bw6QHDez3n4t1M/yyEYKHlp7EFuOClvL1kXP6AX+Ms1xd7k4CyllSMM
 XxXo7th4fOgpOuA9b+HDwqHdRWGAkq/7lqmnbHzOZWeM9HuplPNAQ5+AqNCH6hCEqlJ9
 qAmIAltPMNtsoffyIUAB3aRorvN1uT7/PsvaMS2MNc94gOBi1Wbf6xI3eQaz7CiLqk6h
 BpNXl3UdDhQTYCCss0ZkEsZpejB0N+YPf2kCgqvuBeyHVfze7D+vT6JgKyxvgc/8olG7
 FNRg==
X-Gm-Message-State: AOAM5326tqqjuDIAMZ/yv8P9x1AlNYB9HsG4+IGm38gmyKgAEDqByrzz
 EN9ZjNQJEAEl+a18WvpvFFM1avfRrMo=
X-Google-Smtp-Source: ABdhPJw6wkUMcSODtvi/zR9HD11y9TlAgLewSgqxZZgWBUxhvSFizCRn2QltUmjT/S/EHsCYRh4XLw==
X-Received: by 2002:a17:90b:1e49:: with SMTP id
 pi9mr15673478pjb.144.1634918506451; 
 Fri, 22 Oct 2021 09:01:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l1sm9099863pgt.39.2021.10.22.09.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Oct 2021 09:01:45 -0700 (PDT)
Subject: Re: [PULL 0/9] Q800 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211022071705.471954-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5575bfdc-c833-78c6-9dcd-ab97c15311e2@linaro.org>
Date: Fri, 22 Oct 2021 09:01:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022071705.471954-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.742,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/22/21 12:16 AM, Laurent Vivier wrote:
> The following changes since commit 50352cce138ef3b30c1cda28a4df68fff5da3202:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration.next-pull-request' into staging (2021-10-19 07:41:04 -0700)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu-m68k.git tags/q800-pull-request
> 
> for you to fetch changes up to a56c12fb760a57c1419df4a34e930160f1d8d428:
> 
>    q800: drop 8-bit graphic_depth check for Apple 21 inch display (2021-10-20 16:25:04 +0200)
> 
> ----------------------------------------------------------------
> Pull request Q800 20211022
> 
> GLUE updates for A/UX mode
> 
> ----------------------------------------------------------------
> 
> Mark Cave-Ayland (9):
>    mac_via: update comment for VIA1B_vMystery bit
>    q800: move VIA1 IRQ from level 1 to level 6
>    q800: use GLUE IRQ numbers instead of IRQ level for GLUE IRQs
>    mac_via: add GPIO for A/UX mode
>    q800: wire up auxmode GPIO to GLUE
>    q800: route SONIC on-board Ethernet IRQ via nubus IRQ 9 in classic
>      mode
>    q800: wire up remaining IRQs in classic mode
>    q800: add NMI handler
>    q800: drop 8-bit graphic_depth check for Apple 21 inch display
> 
>   include/hw/misc/mac_via.h |   1 +
>   hw/m68k/q800.c            | 169 ++++++++++++++++++++++++++++++++++++--
>   hw/misc/mac_via.c         |  23 ++++++
>   hw/misc/trace-events      |   1 +
>   4 files changed, 189 insertions(+), 5 deletions(-)

Applied, thanks.

r~


