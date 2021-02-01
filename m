Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD30B30A2BE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 08:36:19 +0100 (CET)
Received: from localhost ([::1]:44654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Tkw-0001t5-DU
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 02:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Tja-0001Lb-7z
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:34:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6TjY-0003PH-It
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 02:34:53 -0500
Received: by mail-wm1-x32f.google.com with SMTP id j18so11685012wmi.3
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 23:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IseZtNdXev38a2e4Na1AL62qAEPEwTQZCwjjMmi3pz0=;
 b=UqUL5F4z7hlaphECeHlEmgaZTB0fJexPuGQx25v0z5jyYp6dPNtOKT/CT3S7s4XgUy
 XoGzbOUXzguP+rsPM8Ye0kTsoSi74qW1vb681ynFWneTQjSZIbEeCEdjtnJoyNCaSC17
 5gMpGdzWpz/mhkKyygEvENK7Qjxu+Ch+/SamzHbHQlN1lXly9sucj3t+kIpyG0okSutB
 LoOnh4ecDfP7ggJzQKRgvgQMUalCI2IJ0bzjBzAfxABfq8F9dnd9zI4szjcIM4AlA8eh
 LiJldxSThME5cAp55OKoia+mh6PMJA3vht01lYtPPnydkR0JTLXI9Xjnq6mujiBJlF42
 pKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IseZtNdXev38a2e4Na1AL62qAEPEwTQZCwjjMmi3pz0=;
 b=ir4TIeU61cr5qWqJMtAh1ZHKKTDHMUvQVVMecuvI3vE3s9uvL8RvS70X7bWOJQCDwR
 5M5zQbQa3WXq3DA6foJQhozcG2Sadm/NRRgAFlGFk7Q0x1IxB1QIQHoRcbtXQWU9GWVi
 o5/21k6/oEOKh+lFbcnlrHwqs0i8ROqJi/9cpSCx4pHEutlcL/2pb/D14cUFriRkeSu3
 5d+/4uA4osnacEUF1R9RckKaRjAmq5bE+BlC2Purh2qM8SesI5AwwGd7N+EZWKVzfOgP
 jPieX24BG2poaZvpSjXPNhDojIr6UEh9x0jNJZScIa9EPTv8T/4mxSSZ6Owip/QXn0rz
 Y0Fg==
X-Gm-Message-State: AOAM533DwW+ABeM2GbnshoDLlPhHglqhRG9QTrBPlSb+Aq9QSky9JwGf
 J/qSRtiNZBkxTHTTp59LHWU=
X-Google-Smtp-Source: ABdhPJwnmEeE7Ub6xGccCozmPTU/zm+HQy7+WOVOOYI58a5sA9OcF4YT5Lu/n4sBts3GgUBzezTY3g==
X-Received: by 2002:a05:600c:2742:: with SMTP id 2mr513570wmw.7.1612164891087; 
 Sun, 31 Jan 2021 23:34:51 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id r25sm27556900wrr.64.2021.01.31.23.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 23:34:50 -0800 (PST)
Subject: Re: [PATCH 4/6] m68k: add missing BUSCR/PCR CR defines, and
 BUSCR/PCR/CAAR CR to m68k_move_to/from
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1612137712.git.balaton@eik.bme.hu>
 <19e5c0fa8baed6479ed0502fd3deb132d19457fb.1612137712.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <665acf5d-3887-6ca4-539e-8dab31f90265@amsat.org>
Date: Mon, 1 Feb 2021 08:34:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <19e5c0fa8baed6479ed0502fd3deb132d19457fb.1612137712.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 1:01 AM, BALATON Zoltan wrote:
> From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
> 
> The BUSCR/PCR CR defines were missing for 68060, and the move_to/from helper
> functions were also missing a decode for the 68060 M68K_CR_CAAR CR register.
> 
> Added missing defines, and respective decodes for all three CR registers to
> the helpers.
> 
> Although this patch defines them, the implementation is empty in this patch
> and these registers will result in a cpu abort - which is the default prior
> to this patch.
> 
> This patch aims to reach full coverage of all CR registers within the helpers.
> 
> Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  target/m68k/cpu.h    |  4 ++++
>  target/m68k/helper.c | 10 ++++++++++
>  2 files changed, 14 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

