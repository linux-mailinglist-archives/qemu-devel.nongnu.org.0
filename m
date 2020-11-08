Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B62AAE62
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 00:57:17 +0100 (CET)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbuYe-0001ex-Q3
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 18:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kbuWY-0000bs-Le
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 18:55:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kbuWV-0003Kq-QY
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 18:55:05 -0500
Received: by mail-wm1-x332.google.com with SMTP id h62so6379040wme.3
 for <qemu-devel@nongnu.org>; Sun, 08 Nov 2020 15:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5teheWB90dljIWXpfYsbXqV3ry70iEk3eh/okW4vupo=;
 b=D0SViI9w2tRyZuEZDU1lZu3438WGRN08g7BFzkKD0L2knJuLZzCmK2Ef19lSS9pP07
 CZdsh8Ccrv8xZJl4nZEGYPFvsft4YJbc/igsK4a1KFfD7z014ImIUq5bo0jwz03titsg
 acIv1w8sSG9oE2Sct13jt0Hqf0/kjWSsIAny34N8nkucyx6Ionmy0rXaGNVMPJ85aGRt
 aUSia4MFX4uMzPZfTSzm7okaEUokfl8lO5uRO0U2fGMwMEaqA85lZw1s2ps7ooRjOpYM
 +0L8fWWpDwlNLERMPqJjqWdC5GA/EqjNE2PYKbNXoXfa1SLuYF+/GROfn5Xj7DjS9TDN
 MX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5teheWB90dljIWXpfYsbXqV3ry70iEk3eh/okW4vupo=;
 b=dqNpqrqgF85FiOoNlRBlWJcUFaS5UCaKmjXr8HNAwoixIHELdAh2L64bEBXLGHM21G
 6BdMC2gZaRBw17KqLInKUuWOrTrZ6AaF0saMHuQuJOPPoQu5UE6Pl+FbEWobEyNXDX5b
 27xquZII+enVyJBEYakDUQk2xvSfRHSjFf7/rx3PHYIPKT1WOtG8AU2omoRQzRQCjbnd
 LhsLSYgQE+8ZBAy3jfzahHPx/VV4GADGi6TIK2nIhTNP7Gn9W5sapjjYOY/iZ8WMcvCh
 5hDvivITmzY2iXgOO+FtuEjcTqRRGhhcUk9qCzmY8jUUGPZZZ/IPfNKbOUZvlwI+DAeY
 o54w==
X-Gm-Message-State: AOAM531xu8wkXC0/UzMmbLTqqpYh3bW5h25qtP96Cva7Yr3Pm1iQx2jr
 loQ7ZveK0V41DYdyXhMAywE=
X-Google-Smtp-Source: ABdhPJyrMDmMojn0ToukL0/Nc/KvbxFRFcYA9vigJ9TnYJb6toaZdizxtccj0eziMaMla2s7P3vteA==
X-Received: by 2002:a1c:3c84:: with SMTP id
 j126mr11717734wma.151.1604879702214; 
 Sun, 08 Nov 2020 15:55:02 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id o63sm10960697wmo.2.2020.11.08.15.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 15:55:01 -0800 (PST)
Subject: Re: [PATCH-for-5.2] MAINTAINERS: Demote Renesas target & hardware to
 'Odd Fixes'
To: qemu-devel@nongnu.org
References: <20201102104001.2062572-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d88c93c9-b512-a18b-2d4c-264d861f7668@amsat.org>
Date: Mon, 9 Nov 2020 00:55:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201102104001.2062572-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/20 11:40 AM, Philippe Mathieu-Daudé wrote:
> To be fair with other subsystems listed as 'Odd Fixes' but having
> maintainers more present, demote the Renesas sections from being
> 'Maintained' to 'Odd Fixes' (has a maintainer but they don't have
> time to do much other than throw the odd patch in.)
> 
> This matches Magnus's possibilities so far:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg710319.html
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Thanks, applied to renesas-fixes.

