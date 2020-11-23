Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D272C1789
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 22:19:25 +0100 (CET)
Received: from localhost ([::1]:51824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khJF6-0000LE-3m
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 16:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIpa-0001Bw-H2
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:53:02 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:41855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khIpZ-00048W-0q
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 15:53:02 -0500
Received: by mail-ej1-x644.google.com with SMTP id gj5so25294138ejb.8
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 12:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cU7DoJxv833PmGc2df6a7f1kmAk9p3QINh6FBBR2LVM=;
 b=sfOtikO4ZCdBdnTOCPmDX4FYQOAOWbwNpjBWzwPsyPMy7U1qyt57yu3zlhQ2UY4ECO
 hbsfbK9vbxf29alDC3Hh2VOIfwzVqvoJWdBI6GhADnzYJ1RRKeLmhIO2KB3ILSIiV7mv
 JaYgSzvoMRimfGSVYPJsWPE1wFfDKnwdZ+aDZtI1yezlU3QOehVXxAo7SsGzODze9iVP
 tHBJnBQ2POG7bTh/abMIxbv83IgGDVgxcXsnN3ZZLvjNr8dBLyp5teB39F009972kALp
 uj2VbFbQFFp1/ve3vxbKv9ra6uvbOvPlDvGkgIMsUc5ygsM91fzv0MGkWDtfdc92QyfU
 E4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cU7DoJxv833PmGc2df6a7f1kmAk9p3QINh6FBBR2LVM=;
 b=O66tT0P7/VhNRnJ3wad1BSqgqnUJwZ3W+45oWsCsnsnSr59/QKp2d7GWcUDaITk1eN
 c6NaMb97VYMUwE4QySbibcdeyqJi8WLZCdivI0IY11gngQHg8SKVuFKIKT9A0ddJRnor
 rNfgT2bEfBjOid7C1qCiuDAxY/NgAxI1DQt2T9G8FsrWkbnluCpnO0uPSBsPBrYd5ZJb
 3KwFKJuiF1FMQPUoVZZQTEgZPivdOiS/WvvYkohyjq2K8eRjCsxO0nw0RRcQwbITYAku
 F4r3pr8PmzMN6Vy9TEzJ9/fM37Hn5fwWFYQWGrCgNS9lJce60JMCPfXrqoaey1B/Yf9+
 zZFw==
X-Gm-Message-State: AOAM530i/PgKwOIUyiC6XrsZOe+d0ehBHfOXpPRrgmo305DDGQMNCgUm
 gW676zp2rpG94Ikk6fpq4mw=
X-Google-Smtp-Source: ABdhPJwNr+IE7+DG8wm/wIlGZ4yngjIpeEWwsTR3zAn3KS5dR0ykvqBCwYghWxoC8TpGtCVjSUN/lg==
X-Received: by 2002:a17:906:af69:: with SMTP id
 os9mr1287292ejb.180.1606164779778; 
 Mon, 23 Nov 2020 12:52:59 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e9sm5594615edn.30.2020.11.23.12.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 12:52:59 -0800 (PST)
Subject: Re: [PATCH V17 6/6] docs/system: Update MIPS machine documentation
To: Huacai Chen <zltjiangshi@gmail.com>
References: <1604636510-8347-1-git-send-email-chenhc@lemote.com>
 <1604636510-8347-7-git-send-email-chenhc@lemote.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b9fc2ad9-9713-252d-ffbc-b8d1780094e5@amsat.org>
Date: Mon, 23 Nov 2020 21:52:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1604636510-8347-7-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@gmail.com>, qemu-devel@nongnu.org,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/6/20 5:21 AM, Huacai Chen wrote:
> Update MIPS machine documentation to add Loongson-3 based machine description.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  docs/system/target-mips.rst | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/docs/system/target-mips.rst b/docs/system/target-mips.rst
> index cd2a931..138441b 100644
> --- a/docs/system/target-mips.rst
> +++ b/docs/system/target-mips.rst
> @@ -84,6 +84,16 @@ The Fuloong 2E emulation supports:
>  
>  -  RTL8139D as a network card chipset
>  
> +The Loongson-3 virtual platform emulation supports:
> +
> +-  Loongson 3A CPU
> +
> +-  LIOINTC as interrupt controller
> +
> +-  GPEX and virtio as peripheral devices
> +
> +-  Both KVM and TCG supported

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

