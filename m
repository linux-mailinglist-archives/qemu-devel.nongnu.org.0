Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EA160164
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 02:47:22 +0100 (CET)
Received: from localhost ([::1]:56300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j391l-0002YX-V9
	for lists+qemu-devel@lfdr.de; Sat, 15 Feb 2020 20:47:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41528)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j390E-0001kq-Qe
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 20:45:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j390D-0007ow-Bb
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 20:45:46 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:40049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j390B-0007lP-Pk
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 20:45:45 -0500
Received: by mail-pj1-x1043.google.com with SMTP id 12so5668241pjb.5
 for <qemu-devel@nongnu.org>; Sat, 15 Feb 2020 17:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VSci4wx4LYnYo85JaYPlmlcQQW9GF4TJ1cKQwVDuNkQ=;
 b=RtbogxhKB2XVma7HV5ZK+SYng9GwXkPVY12dbBYiWaEEWbz9LpIWaoBboH5/HPyJbK
 XxTlcN3yQiM6g8Fl4skMboAp+IglHIpeagfpsTTjn7sF2fMmMXzroi0BtHeq07gG0dsi
 fWcPOVkQHE+SDNTZ0FFMa31iySThCmBl0b1o8u+lz5ZGMYh0VyvomIHA8cb22tGIBv8x
 1Hxo3UqTanbf62xsRX1JJNJhFZ7XwMkDELAlzuXak/OZ4EJa0SRILS1T0W65QtqSzs7z
 iMNEujEATbMW1PL3i2Z2dhuXHZmbIyLblknf0LGJRcc1x0ECUwMHsGyOjoHWjUNCFZeb
 SoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSci4wx4LYnYo85JaYPlmlcQQW9GF4TJ1cKQwVDuNkQ=;
 b=aNmiVIQixZmAmVFjt1N8VYPSH9dvVyzrIyOYCqLIKTrqiKr1yYndDHxiGkSoLI3gX7
 wlilhMGA0FHfabRWjdoNXs/EmkOhnso/QiZjgIitha4whnFbxvHrN3uJj8UqKtFl6Sx3
 WmKByQHbP122aVWQ3nZy5gkCtCCdH45dsq7ZA3nqmZjfboVSpmGH/5kmqqLb/4sVz5BE
 YN5zq6SA9hAGSjphA5XktvL4KCxzL+nRIscHBDnPJGE+EF63atB1taIE+667An+9hxm7
 bltGq2fotx3k4EFnXfKMCdhaCp4NJptwbe5PbnNk4+I9qZl5+69bOrEkeRUoqZ8jBssq
 z8Hg==
X-Gm-Message-State: APjAAAXdylazJQFv8dArRiPLFwvHYuSL8FJyUW7x8XPHr1nZNbHR/GDP
 WPAcqawKF+5zRXNgno/B8VRXGw==
X-Google-Smtp-Source: APXvYqxQH8K0t5G7BX0HYaJyUqi/MCIaKPxZ/PWN9NwM2qbQXxifOKuDUHc5tJx/rnCrPrUxnLox5A==
X-Received: by 2002:a17:902:7687:: with SMTP id
 m7mr9983729pll.136.1581817542463; 
 Sat, 15 Feb 2020 17:45:42 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d69sm12502909pfd.72.2020.02.15.17.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 17:45:41 -0800 (PST)
Subject: Re: [PATCH 0/5] hw/display/artist: Fix Coverity 1419388 & 1419389
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org,
 Sven Schnelle <svens@stackframe.org>
References: <20200214001303.12873-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f9c74f9f-1b76-6fda-d26a-5e5337f9ee41@linaro.org>
Date: Sat, 15 Feb 2020 17:45:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214001303.12873-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1043
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/13/20 4:12 PM, Philippe Mathieu-Daudé wrote:
> Another easy Coverity fix.
> 
> Philippe Mathieu-Daudé (5):
>   hw/display/artist: Move trace event to draw_line()
>   hw/display/artist: Remove pointless initialization
>   hw/display/artist: Delay some variables initialization
>   hw/display/artist: Avoid drawing line when nothing to display
>   hw/display/artist: Remove dead code (CID 1419388 & 1419389)
> 
>  hw/display/artist.c | 29 +++++++++--------------------
>  1 file changed, 9 insertions(+), 20 deletions(-)
> 

Queued to tgt-hppa.


r~


