Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23702B432E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:54:54 +0100 (CET)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ked5y-0006dt-0b
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ked3D-0005GO-Cx
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:52:03 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:56034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ked3B-0000J0-Jp
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:52:02 -0500
Received: by mail-wm1-x341.google.com with SMTP id c9so23447326wml.5
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wE4Z2uEU5zkP059wesIVpV5pqjvxIAvibtXumDX0rcU=;
 b=pZv5nIDkvIaVfz884AbaFixDJfJccrja3ZJQBFmO98B+uYb/hOrFO428izxE/4YCcn
 18IOieBUdmEG3z0cXMh0th0V5Zf2Zs5m0Lz1INxI5BUPu5VkQ6c1kn4oZGytfn88qsE5
 77DCaLgc6JskzKtzqC8B6gXJTzaBFWpFxTXesXRRR/oKsLEQB4KSuzRNwJyATEiDOV8Z
 YuZoDeXMACQcEH34NdQxy5Uhizw8ATteUqXXn1z5BtMgfeUN4El0ZBRzfW27yLO/jMG5
 mjbYjvN0t1AkXOH5t7AGMmP9xG2Ytdsd4lc8didPCqSrGR+MmmAbztHzg6aKmZquoG2x
 QNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wE4Z2uEU5zkP059wesIVpV5pqjvxIAvibtXumDX0rcU=;
 b=LoESyMayZHB2SSZIpFmN0HxWHlgk20JX0ezBl9dc8IoJ1vycx7SroDB0mvJnQ4GZk4
 Pp6AyJF/U53YBtvlLXxzA6pOFB8IsNFEW1HWDef1eI3Xnmer82h3MK/5z08Zo8YFAyEd
 RebH2K8w8qd6oMVm0D8/1fAsinrkLt2ANiA8cCjumnMD26sAjWklYJr2d/sPFugckgGZ
 rbSqVZmJSH9quXOEQo+XNE1itm91HgJidjZJBrkHIzbR24JmJokVUImXoUvJDfif4Qq4
 Jbk3sUtDaFHYFrm32mL+SdaVv6Z7EdjOOgc+zrMbJYzCuAMWJSNxvs/c+ns+vuepKRW8
 7UNA==
X-Gm-Message-State: AOAM53277BNBlHOMp38/V9qJsVbR+RyMo5cQJ+QuBTaBTFIECQCQZpFH
 pCXS7+c8aaE714+NcoGHchk=
X-Google-Smtp-Source: ABdhPJwBtTi7h+GlxAMUjBrSrfPNmfdzjCvH9CDIKTs6Y5vQV0NiuK7ayaI7ugoShgOdEZi7SFEYCw==
X-Received: by 2002:a1c:b387:: with SMTP id c129mr14754574wmf.58.1605527519991; 
 Mon, 16 Nov 2020 03:51:59 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id s202sm19631917wme.39.2020.11.16.03.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:51:59 -0800 (PST)
Subject: Re: [PATCH 2/4] configure: Do not build pc-bios/optionrom on Haiku
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ffffe64-3045-8162-4f65-9830b1ea01d7@amsat.org>
Date: Mon, 16 Nov 2020 12:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201114165137.15379-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, David CARLIER <devnexen@gmail.com>,
 kraxel@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/14/20 5:51 PM, Thomas Huth wrote:
> Compilation of pc-bios/optionrom fails on Haiku with:
> 
>    BUILD   pvh.img
>  ld: pvh_main.o: in function `pvh_load_kernel':
>  pc-bios/optionrom/pvh_main.c:73: undefined reference to `GLOBAL_OFFSET_TABLE_'
>  Makefile:57: recipe for target 'pvh.img' failed
>  make[1]: *** [pvh.img] Error 1
> 
> Let's simply disable it, like it is already done on macOS and Solaris.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

