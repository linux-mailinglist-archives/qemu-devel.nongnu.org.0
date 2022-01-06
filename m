Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0045486492
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 13:48:00 +0100 (CET)
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SBT-0003kR-2a
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 07:47:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5S2c-00017C-8N
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 07:38:52 -0500
Received: from [2a00:1450:4864:20::32a] (port=56301
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n5S2W-00046k-J0
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 07:38:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id c66so1645110wma.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 04:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RK6mvMST7AuZ4A0MAs9pC0Rxlm3l4KI0Sbcol2RyfxI=;
 b=c/Ryi1scAPiDVAosmKF+aB1dtnVBUl5di05WXMcfqAQr4bajSaVVtXJNTsL0GwcELY
 f1HCrZyLAR/zHa/WGHDKwtUkxoBgMqQv4YrE6w5wYCwrktdfprCZ4HRV67avleXaVoVG
 +POEhHWUrU9wBPEd+LWWhpqvzpKzDTqcFbHiJ6/hnqK6JUM8uVa9uIo2Gsrp36JybqdN
 k4rQmPsOsMGVhSLCwt46g4LdVV5CTCjDnIGTtj3hmro9QGrFWxciZqFSeqETUde7rT6t
 vqKgl4DdPVa+nWKlXA9IIqyqgNk2oOdghh9huqmn1LqBtU/TuCVHTjEYO49ua7SDTT2L
 oy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RK6mvMST7AuZ4A0MAs9pC0Rxlm3l4KI0Sbcol2RyfxI=;
 b=1ZT9UO7zpzmTpchHjeT5HJXJFg8q520h/KX1OB8G2rQDw1DrdnZWTUgpZokNQlBRGX
 q33PnLe9Bdu4qrjR8i20BZEn1QIVZqxC0OlYtshNaKXqvMz3V6r2DtQuHMIZlX+MpPkK
 I8eyEDlE18mTNGOTOkD2hL/j10Gw/RP2XaUUUXKAFZqTC7JujcGN/sFNB9F0858+x46p
 BiTE5pXguo3MEAm0ECTNsUEwRuEEoz1N6QNoWgCrMO8yaM7rnWxkCxQuTQUgtipfGC+F
 Wh4R/avRYhxFbNchHOOXpeyrBpgDMpdBxe9SjqSRVQPxDkQbok5mnA7jhKoQTeXk8bRB
 DOKg==
X-Gm-Message-State: AOAM531ImC+vvkdQtmMYRhpy42KvE8WipPSyb+Qemh+2rJrzxYOW7s9P
 Yu/7t2sc5natTffTrVRpQ5w=
X-Google-Smtp-Source: ABdhPJxa+EqUh8olW8v5Xw63n82x46OKeOosQx9AWGja339/W98ogCYMdYH8ywZXOdBDuNfTVM9c+w==
X-Received: by 2002:a05:600c:34ca:: with SMTP id
 d10mr7035676wmq.133.1641472721933; 
 Thu, 06 Jan 2022 04:38:41 -0800 (PST)
Received: from [192.168.1.33] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id b4sm2010409wrw.4.2022.01.06.04.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 04:38:41 -0800 (PST)
Message-ID: <702a7149-4696-4b32-03f8-8b825244cef9@amsat.org>
Date: Thu, 6 Jan 2022 13:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] q800: fix segfault with invalid MacROM
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220106122247.771454-1-laurent@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220106122247.771454-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/22 13:22, Laurent Vivier wrote:
> "qemu-system-m68k -M q800 -bios /dev/null" crahses with a segfault

Typo "crashes".

> in q800_init().
> This happens because the code doesn't check that rom_ptr() returned
> a non-NULL pointer .
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/756
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   hw/m68k/q800.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

