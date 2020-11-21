Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429002BC1FE
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:16:28 +0100 (CET)
Received: from localhost ([::1]:37620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZJ5-0001hE-9A
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZI1-0000gW-8m
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:15:22 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZHw-0006h6-4j
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:15:20 -0500
Received: by mail-pg1-x542.google.com with SMTP id m9so10501609pgb.4
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=32qQsgObDCIc2et2w2jdZ/eOL89g1vDrqsP/b5koUdE=;
 b=OC9noan6WPJBRCSeM/KrZN6NJirQ3/371S51LEOGImeTcZjlUQrmNRYfc859fZnz5h
 RbkwUkt2/Nep8VcNeMUD2oCddC4wZW7OePuJCj3S2WKSOk7g962IG2DAv3aABvIMhpVh
 u250eM3F8SwtQx0aFsMDFmsPAyC85bqe+r1IgNwcdR0TGzuxFRh7lXVNFpDlwsb6WihE
 UumD0q/0SIEe2Gdo2Z9bNOuXl5Qo4VCw34SiO5MXQmudsMNJesBw47qTU30VjUuoTu9n
 gwFttc1i7DrMCejmdSQ9LfgcIlr2F6ej0dILP9GrLhV0R5ylGL0UUlIjY61I9CF77rJt
 V03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32qQsgObDCIc2et2w2jdZ/eOL89g1vDrqsP/b5koUdE=;
 b=CarzTTuI08wkgmJh2IK16DRQ+kr4f4WitwqoQ+MKK1GkmOl3yE50AnU8eMBeNqXuUj
 6e0xr8Xqg2TwGyAFpmXFUzYI/ExxaTt/raK6+Kth1+bN2JZWUjqjRgzLiee+bamwz707
 8Q8HoHeAq3Fppbs4d8DwZjuUSwFogM1ORJ07iF7nDPgzwYgrx2FS08aKFk+ncrVy+bBg
 AFa2jozEDW++rzL4eSDmj1xaFbki7UIZPqWZl6PzSeSSuk0pAXvmthK7n6tTTD5RwyCU
 aD3pIWlT5Uqp7jwYQsOQCE1ywOvv3M69dpg7A2vU3LSNP+ksljK7Eim/rdQNT46863Ik
 JOZw==
X-Gm-Message-State: AOAM5338PZSL9lafLh4xM1qTH6N8zomsQgFmDTdhGShV7xuF51M+3WTp
 CD9xFZkgBKYmgNkONhThqherlQ==
X-Google-Smtp-Source: ABdhPJxtDQGz9ik1W1PN0pph/awpgMVcJeXXspYRS6XV7FSPa7HPh4k5JwgXHK29PmEQq6Osc1/LOA==
X-Received: by 2002:a17:90b:3789:: with SMTP id
 mz9mr17022240pjb.123.1605989714356; 
 Sat, 21 Nov 2020 12:15:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id h4sm6610544pgp.8.2020.11.21.12.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:15:13 -0800 (PST)
Subject: Re: [PATCH 22/26] target/mips: Extract Toshiba TXx9 translation
 routines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f51674d-d170-4052-cc6c-51aab5b94e12@linaro.org>
Date: Sat, 21 Nov 2020 12:15:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
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
> Extract 300 lines of the Toshiba TX19/TX39/TX49/TX79
> translation routines to 'vendor-tx_translate.c.inc'.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c               | 302 +-----------------------
>  target/mips/vendor-tx_translate.c.inc | 315 ++++++++++++++++++++++++++
>  2 files changed, 316 insertions(+), 301 deletions(-)
>  create mode 100644 target/mips/vendor-tx_translate.c.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

