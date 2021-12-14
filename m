Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0930474381
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:29:03 +0100 (CET)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7ra-0004De-I7
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:29:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7iX-0005NE-VQ
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:19:42 -0500
Received: from [2a00:1450:4864:20::435] (port=42730
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mx7iW-0001vo-JV
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:19:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id c4so32312519wrd.9
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gd8YdqQRvLoQtvU5kAuYmRD3Dj8gEDu0bd5YnY5aZUs=;
 b=lxVStErNJ5QAjtZpN+JPPj27ZMAovOWgfKnl7A096+dPe+d2zcbG1Al+DfrUDTS026
 +DbVWICyQLwVWcIksfuGAwhlO0P4iN25AGDkTYFh5+m53L5LLn8ZyQRGIshjBQ6r7iv9
 1wTrrEoeqHlmPrSHOKHLcLD4+nYBQ9TAeBNRKhGLq3jIji9L6Nbdb87vLQfV8mEU6g5w
 +eEIcsX8cloAm8udKt8HTxy7V56YlqmRRwA/jzymzVPLs/d5Mu+Og/3X99HN1Xx+8WNM
 xcPIj7lOnqJDDpD2grV/GtOLG15KIuiC7nC9XpgnZL6HIiEqvxhh3hgcUlKl6jMpesCr
 Z3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gd8YdqQRvLoQtvU5kAuYmRD3Dj8gEDu0bd5YnY5aZUs=;
 b=3W+XQtOx59U39aLUSaENv45M5wg9PE3NjyFsPCQ2MKskV5KtaQ2mHHhD/zEF7opbej
 P9z7cosD2xDl+0BMlfkNugBKDQC1jryQqebc/GRAqzAW7Av5/AlbH9Pg77JuELc8xo6+
 t78z1RtbK73N9Jwu60nqWzdYfuPb3Lz2SFMGhGgNvpItDipKsaz4YkQshmp2N4wY1TM8
 cFthoiYhIihKyTm4c62uyu4VDj2JQhfAdI6F4+4jkypmmUU3nMxUnn7BNrXNnUJYGvrY
 868bnpja/q3os2d3whrsDyJUSs0J2fYtrgkuNQ8PHYBax+/070NsdvRwj7dHJjMT43ER
 qHQA==
X-Gm-Message-State: AOAM532EewHzfZCAOfcZ1XAHnBI87R8FFtAbtsai/5ka0I1w78/R3jME
 bfFkSHJ13e4gTqFyllh0Ltv0NEkKzLs=
X-Google-Smtp-Source: ABdhPJzTyXe+JmCNzVpGkCNwqvFuq5vSOmOn2hIE0pVK2B0EI9wlFuOLc08wm0+OPAYAZ9B6zsiR6w==
X-Received: by 2002:adf:e286:: with SMTP id v6mr6054980wri.565.1639487978343; 
 Tue, 14 Dec 2021 05:19:38 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id d6sm13699334wrn.53.2021.12.14.05.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:19:37 -0800 (PST)
Message-ID: <42375253-82fe-b031-d13b-a15b1eb21c80@amsat.org>
Date: Tue, 14 Dec 2021 14:19:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v9 07/31] tcg/loongarch64: Implement necessary relocation
 operations
Content-Language: en-US
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20211214080154.196350-1-git@xen0n.name>
 <20211214080154.196350-8-git@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211214080154.196350-8-git@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Song Gao <gaosong@loongson.cn>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 09:01, WANG Xuerui wrote:
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/loongarch64/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

