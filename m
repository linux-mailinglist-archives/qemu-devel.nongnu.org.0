Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10ED418115
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 12:39:53 +0200 (CEST)
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU560-0002Pc-S1
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 06:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU54N-0000SK-1n
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:38:11 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:34440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU54L-0006QT-ML
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 06:38:10 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t8so35260777wri.1
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 03:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B/gNn2+6mLDOiY5AAAkHMjV+gHJo/PUyTq7bZVwwGdA=;
 b=VIQfCTZxwW2mqcV4/lTcM5NOk5MvQwMvcpbdieHWdK2+CqWOSbg8PUPuihbI6zdRpj
 xTVVLicv40pxgC4/f7J1AcPp1xM77BS3qS96p3xeNMfmU+42g8GnKMXX2axbqhXJi2Fl
 XDXYVHtXciuZHJHSc2G0jorfV9cKxd9mOJBj7Bw2A5WmOgWKO9vXcKFzD+D7+Ez1vWUp
 xknqEkov4LPHSYdP88c0K18yFIoXQPiGxxMcPHffN6O6cY2AMe3FatgS7COuTJXI8a5y
 wT6Yq4Oand7z6oTQ9QlC5CqOyaEvmMmM7PMApNDsUD4RbxRovKtR/8NynPRuRpnEnaGg
 Q7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B/gNn2+6mLDOiY5AAAkHMjV+gHJo/PUyTq7bZVwwGdA=;
 b=XBD8767tTTFBSFTYnTp1Lw0T/e5E1MFCZBwdj2bCjZmwhanEJe+2pbx3CEIZCq8DEB
 nzAiAYDXxuyV17LVaFaPrROPhXs5TrEfl4xEUSS/Y4nlmbbHY9cO+Lcf0V8PlH/Ett5C
 Yk/O9XtF3M7g5u/UrsLSYV7RD0OFtCdQKLvVpyQBtL1Gh5f9zBmGYmY/2t/yzinCRPt0
 1G+67HqI53GEt3UwHHrlsExxTdBav2CpzagyQZZh/94Z2u7H+PJ4sFbhYDJny5npGCry
 wOkFbtjTRNbtRgzq2dOJsXMPRAc9LObF+5cqqwOxRUfASEg076N6UqXg4ggZDi7edO0D
 mO6w==
X-Gm-Message-State: AOAM532LtOnfZOFcns6ZCC6+EGtqrn7c4HLx5vYsAhLvWgLfxg9RmrMB
 pMIMNScIXNFKW0NV/aznquc=
X-Google-Smtp-Source: ABdhPJyTL5ABnDJ0GK0POwpVG/4v1V2ZvDmB95GgByFy/mCkF7Giy5PB2C9ZEGOKoPB1DGmlJw6T8g==
X-Received: by 2002:a05:600c:4c05:: with SMTP id
 d5mr6509476wmp.2.1632566285823; 
 Sat, 25 Sep 2021 03:38:05 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id l2sm15021922wmi.1.2021.09.25.03.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Sep 2021 03:38:05 -0700 (PDT)
Message-ID: <f772cc9e-f03c-682b-791e-c4b4ac0ab399@amsat.org>
Date: Sat, 25 Sep 2021 12:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 09/14] bsd-user: Remove used from TaskState
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-10-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210922061438.27645-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/22/21 08:14, Warner Losh wrote:
> The used field of TaskState is write only. Eliminate it.

The 'used' field ...

> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/main.c | 1 -
>   bsd-user/qemu.h | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

