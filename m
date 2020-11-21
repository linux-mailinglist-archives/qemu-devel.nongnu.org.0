Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EF2BC1E3
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:02:08 +0100 (CET)
Received: from localhost ([::1]:34156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZ5D-0005HC-85
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:02:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYwz-0004tg-7S
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:53:37 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYwx-0007hp-IO
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:53:36 -0500
Received: by mail-pf1-x444.google.com with SMTP id n137so1108507pfd.3
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3WCGhvkLZ7Nv06CbBNcGdEUTtYIcR1oe/tatEJKpEcQ=;
 b=S/82gd/pKYPq/+R+8pz64cz+XbX/HfD7pwt2ndn5myo5mCwBIVzP7IScK4sfRflySW
 Yy0aonia4Pd7guSzHhN6eLwZKb+sKgSEkDoCQNleaPD6vkfP0ot8hZEFHQMAnY1Iy3NP
 YzY/9udMFfZoFefgpNC+3bCabMxmVfzOwkk4kO0qP9lnPScM3E8Xh+YUhrwesMoGbAJB
 tHvevRD8As9E8YWX5y+yBvtadLRBG1MQ41pNYYkSW/+V44qnpjJuhF/D+9twrz5qO8/4
 xm4T2XRjAbZpWWOl+pwBvibv1WXO8tdWTB5a6k5cM0m738cjeNaJbLjCHLTip/52YpAF
 BxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3WCGhvkLZ7Nv06CbBNcGdEUTtYIcR1oe/tatEJKpEcQ=;
 b=Y+YJCmJnuU7LvhTCRLWh7H6VccOaJugXBtxJX0ffZW3Q4fn7fWNQ89NcDixbkpup35
 KuVktIxX0LCAoCenB2BDxkCeUjJblkQS/3Ci9yOJ2W6PqL/RHioySDtgUq5Ew6hp360a
 j0oc8poEA9ZqeVQ8Hq8gqIxza2Fv9JdXryVdoiFIA8OfYzSZ7eOu6EP9XKCmaQB4xR4A
 fKkAJHVBH6ATn5TvxTBeWrNCUQCffLWCQkc9AMjgUoh1OwC+ZRRfXwu9stLZ/mM+KHcc
 1J9AHXxGD5yAnH7XhuExtfWkt8W20D3HrxP+C+ynmSPYV7HGDQx6azAWPqF0tLYy5sVu
 mDJg==
X-Gm-Message-State: AOAM531hA4wZMJusODggTBVblexNeu2NkJZrDivEV66TB/5CJ0pLeSKz
 wdXhlDwP3lPu7K5m9xvVFyMLJg==
X-Google-Smtp-Source: ABdhPJwpVLiEXWdXgxmt0NpjWfgVEW1P37oZxmEaj8Dvpsf4juSM8Bk97Y+C5Pa3a4JPgFUK5aiIqQ==
X-Received: by 2002:a17:90a:fd02:: with SMTP id
 cv2mr16768219pjb.176.1605988414172; 
 Sat, 21 Nov 2020 11:53:34 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 203sm7731279pfw.116.2020.11.21.11.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:53:33 -0800 (PST)
Subject: Re: [PATCH 08/26] target/mips: Extract Multi-Threading helper
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3c27c6bf-529f-979b-fdef-6706cce6a1c0@linaro.org>
Date: Sat, 21 Nov 2020 11:53:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> 'MIPS MT' is defined as a Module by MIPS. Extract the helper
> definitions to 'mod-mips-mt_helper.h.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.h                 | 24 +------------------
>  target/mips/mod-mips-mt_helper.h.inc | 36 ++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 23 deletions(-)
>  create mode 100644 target/mips/mod-mips-mt_helper.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


