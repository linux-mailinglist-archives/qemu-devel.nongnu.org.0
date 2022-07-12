Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F1572759
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:34:47 +0200 (CEST)
Received: from localhost ([::1]:46486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMak-0000c6-Fm
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUh-0005MI-Eh
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:31 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:45683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMUf-0004qD-Mf
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:28:31 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 p27-20020a05600c1d9b00b003a2f36054d0so53762wms.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hwrBOb3CQALz7XQHud13Yn7srwlTjLhxVG656rgQKQs=;
 b=FePG3n/Y+/ifSFPtQX+cPARMNUK5zTHpiIN9wmCNuE7t1OTqdmVMwPAlNUG9U6Cyyk
 n0P5KimGBERTulA3VVfjLRHaQaCdYhKaIp2BrRBnZvz1eYbg3ufPDyX3SzpsNXU3RtNr
 l6uPJ2ctC9Frni3IeTX11d760KAyD60DUOESXoxy/qz4MCQ8wmjqmIAVClsGx2Hq7s0y
 MvmpT4fNHV83twnLDlLXV2/3ir0aqO+D2fCT0D2b0IH9NetWwi9JhrBcUojCt1+3F4il
 mul5CCQ0QcOw4WyNL5/cX/MVrPduuAC3nnJMSzLHk80/QmS0zSQxAhSYqVRRp4fMhj96
 N61Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hwrBOb3CQALz7XQHud13Yn7srwlTjLhxVG656rgQKQs=;
 b=a4Oq00fjCAwOk5KOQR8cxFTXGdsL+7x5kicLDLFKut6uzgvRCH2gQRDTdquBoI58SV
 HU2U+KIdFlVL3D8UeiWSugXz/1NQtZu4MRQdj+HE0vmHrEgBt82USGU6+DqlfLqHpRKZ
 o+mCqvqd8ewvYpHViJ8OFSs86PxGuU2LHKr1WAoxIxMpfPEYmEvAS+VN7VQcCPeaGZ5z
 Fn3bFHyrhnxNz4zAP46nqcfrAiG0t1IwZyNo6v490mLhNf2St8yyZmZam9InMqZBcqMX
 N3aQec4dfaW1mh6j6JtWYORR6eL8eOhUb3QFFUX9ndowrvmFZCpBDJsCJ+4AVPiTZcfN
 03Iw==
X-Gm-Message-State: AJIora83DrKJ4IfMtVkqHTuPfTeZ/Vved+ED/ZKZTdD/v1rCyAGP6HtO
 WUXxYaaY8BoPerggF1u0FBo=
X-Google-Smtp-Source: AGRyM1vmkCiDm5GzxBEEbrg52miukOuVb/b/7uJWpoG/d2NkpD5UyqT5G1PnlhRIKd+OqUudqlWPng==
X-Received: by 2002:a05:600c:19cd:b0:3a1:77b6:cf1d with SMTP id
 u13-20020a05600c19cd00b003a177b6cf1dmr5704794wmq.141.1657657708448; 
 Tue, 12 Jul 2022 13:28:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b4-20020adfe644000000b0021d6e14a9ccsm8762754wrn.16.2022.07.12.13.28.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 13:28:27 -0700 (PDT)
Message-ID: <c7f3db49-5725-7d96-6a7b-15b727aa8d37@amsat.org>
Date: Tue, 12 Jul 2022 22:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH] ui/cocoa: Fix switched_to_fullscreen warning
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, akihiko.odaki@gmail.com, 
 kraxel@redhat.com
References: <20220702044304.90553-1-peter@pjd.dev>
In-Reply-To: <20220702044304.90553-1-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

On 2/7/22 06:43, Peter Delevoryas wrote:
> I noticed this error while building QEMU on Mac OS X:
> 
>      [1040/1660] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>      ../ui/cocoa.m:803:17: warning: variable 'switched_to_fullscreen' set but not used [-Wunused-but-set-variable]
>          static bool switched_to_fullscreen = false;
>                      ^
>      1 warning generated.
> 
> I think the behavior is fine if you remove "switched_to_fullscreen", I can
> still switch in and out of mouse grabbed mode and fullscreen mode with this
> change, and Command keycodes will only be passed to the guest if the mouse
> is grabbed, which I think is the right behavior. I'm not sure why a static
> piece of state was needed to handle that in the first place. Perhaps the
> refactoring of the flags-state-change fixed that by toggling the Command
> keycode on.
> 
> I tested this with an Ubuntu core image on macOS 12.4
> 
>      wget https://cdimage.ubuntu.com/ubuntu-core/18/stable/current/ubuntu-core-18-i386.img.xz
>      xz -d ubuntu-core-18-i386.img.xz
>      qemu-system-x86_64 -drive file=ubuntu-core-18.i386.img,format=raw
> 
> Fixes: 6d73bb643aa7 ("ui/cocoa: Clear modifiers whenever possible")
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   ui/cocoa.m | 8 --------
>   1 file changed, 8 deletions(-)

Queued, thanks.

