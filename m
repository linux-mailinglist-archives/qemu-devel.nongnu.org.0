Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB0466981
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:57:19 +0100 (CET)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msqKc-00006C-LG
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msqDZ-0007OL-Dr
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:50:02 -0500
Received: from [2a00:1450:4864:20::32f] (port=37822
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1msqDX-0004ZL-UE
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 12:50:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso2949635wms.2
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 09:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AUJFagNdlzHzvWIwFBNMtB8LIV/RxSu80pXK+Dj+gr8=;
 b=kGfp4oEYHpMaS8i8ue9XkwtN9sLqcCzS+n0JHcXzWkjcchQ6EeTT19EOfXWvgrb0ju
 j690P6SZjta6/xidd/bczbM53pAg0+y38AvPOPsD7XEXzfZr2McAGkPi8yVI8SP5kap6
 Rhe1mhMf/auzQo0h5gay213MNJeeQD6UszhCxoU0OuWNf9LUvPXzZuW+kZlwjw4hM8Y7
 VdyA8rCf7jhuj6t1IFYOehQIamF3hWZpSVaTzbEQmzcjxiLUxAT9SySMIbzoMYPnzgIi
 b/Md00LxKyhSKlqDuy1pTo7A7YtyOdKwT2gEYMfGm2swiyzuJ30YS6llNyUV/Jitd/ub
 lzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AUJFagNdlzHzvWIwFBNMtB8LIV/RxSu80pXK+Dj+gr8=;
 b=7KNYy8xiyWT/kxSGfpunexxrwjzIlV7jyIjNNfX7a0zsUL5GYqqa81b5XS5KGk5pcM
 tP6Q3dUKKcGz+s+G8w78dbwxIf90xYRatiba7X1SH5hZ1VAONAX8k220g8ILEU7V6lNt
 AO6gvdZs9MIetm7xwd90n61o4SaU+aGgZmFQJMfUrE1kgjtYnUWGRoGYrMynO1Ohbfc0
 XnJ+LuIx5uUYg3vbfgidb/ob9akqAvupg2iP9/LuXpNGGpdInkwdfB2MttDv8KEyrRKd
 ErdrzkgCj0pbHssgorIyIUINlzNu+U+K1dgxXFwcR4C1l/23aLQFPgNVpoOFQQg8U8Yh
 wvJw==
X-Gm-Message-State: AOAM533zdedh7YVnxaTkN20zkRw71wXELIyTwAzwHd3cO9EvCrdDnjJY
 GG02KK2XmDtXDexeuV6P1l8=
X-Google-Smtp-Source: ABdhPJwmuYiCo7uIBYu2fGw+H5NSHpWQ7AUOW34YOwiy4+1aygTQiE5n5oyhx78j0TTFatb/EuBnQw==
X-Received: by 2002:a05:600c:378b:: with SMTP id
 o11mr8217088wmr.157.1638467398602; 
 Thu, 02 Dec 2021 09:49:58 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id o4sm528172wry.80.2021.12.02.09.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Dec 2021 09:49:57 -0800 (PST)
Message-ID: <49c8b83d-b517-2212-cf24-89b089e70ae4@amsat.org>
Date: Thu, 2 Dec 2021 18:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for 6.2?] Revert "vga: don't abort when adding a duplicate
 isa-vga device"
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211202164929.1119036-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211202164929.1119036-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.3,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 17:49, Alex Bennée wrote:
> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
> 
> The check is bogus as it ends up finding itself and falling over.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu.git/-/issues/733

This link gives 404. The correct one is:
https://gitlab.com/qemu-project/qemu/-/issues/733

> ---
>  hw/display/vga-isa.c | 10 ----------
>  1 file changed, 10 deletions(-)

