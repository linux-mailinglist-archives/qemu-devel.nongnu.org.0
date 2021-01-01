Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5232E853F
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jan 2021 19:07:22 +0100 (CET)
Received: from localhost ([::1]:42764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvOpc-0000EM-VO
	for lists+qemu-devel@lfdr.de; Fri, 01 Jan 2021 13:07:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvOo8-0007qb-Tc
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 13:05:48 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kvOo7-0003n0-Cu
 for qemu-devel@nongnu.org; Fri, 01 Jan 2021 13:05:48 -0500
Received: by mail-wr1-x436.google.com with SMTP id r3so22456821wrt.2
 for <qemu-devel@nongnu.org>; Fri, 01 Jan 2021 10:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f1P1CAG6WQ082JAnSMnQ/SSE7oBq0TndgRhL/HWKxc4=;
 b=brLo/qWAGrqkfy4K5WSz6uyVq/iVuhVbko49o8aqEzP1c/HiV4fMtMZgOytiUwDft1
 eJ++WghHkQsdpx+lzT/Q7GTEvJCaNz2LmzHm6d6Ald7eOu+b7Co04a+u19qK6TSP/06D
 W2WxqRgLxLW+UFBGBsuFCkypW1ejJ2RZK79XWlK/ZaeCg5VAsJeGqyrwCeAiyCOoI/Ys
 /4g8HYDWKJ+F+kH8MJQ2mQTIlbzi57eDg9OtkbomThkXskzshirazjoVpw/S0Mq1PGnm
 3gD/8KBn/kXsnPL/rKJlRJJIfpvWU/RUQ12nbJsQaBXAdluVyMk/193+3nv2jaSQKxvk
 1CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f1P1CAG6WQ082JAnSMnQ/SSE7oBq0TndgRhL/HWKxc4=;
 b=WODwjRdsD8/ijluywrwaf9tJRQWdRlVsW5tSyEeO4sjqZ2zJm1Rqkt8kzbGzdj+sR7
 GyL/jBKdG7fpxkk81jIZfOj/ZI0P4wrVgkOsKTtiSjRHfyeU8EYsZMrzzhuRn+ejlJy6
 INdLSG9g4+nbi4U0blwbv3ZUGsiugHupgsiF64GwJGbrFV7vV+d5skBbsCm5mq85vgno
 4QZ36Aw9MKf/C9bS+NfYXBWaXuKiuiEInZsmulMSJduLGxumjh/UbAh7M0yOK9dN2zM6
 I/uBRsbfG6r9BIaH7gsbuiVYhRShaBIwwgsgIm5gTL3dayKIQyjkBw5WNpm/jnZwT7zb
 vVRQ==
X-Gm-Message-State: AOAM532zMNQdaZFzw2Ks3K9JTKk915McW3U08m1+Um6wlf6CVMSOR09z
 ISOsgerZnNP7TUxOD+J7rRM=
X-Google-Smtp-Source: ABdhPJws7XObI4R5dqJwHPIveypGBkGGM8AzCjX4odfYvBi3JyyhCMK275yk2S+zxUNYydK/2LGaRg==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr68866936wrw.386.1609524345468; 
 Fri, 01 Jan 2021 10:05:45 -0800 (PST)
Received: from [192.168.1.34] (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id q143sm18419006wme.28.2021.01.01.10.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jan 2021 10:05:44 -0800 (PST)
Subject: Re: [PATCH v3 5/8] hw/mips/fuloong2e: Remove unused env entry
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-6-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <178da26f-421b-28cc-bfa1-4d233a8d8de2@amsat.org>
Date: Fri, 1 Jan 2021 19:05:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201224031750.52146-6-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/24/20 4:17 AM, Jiaxun Yang wrote:
> modetty is not handled by kernel and the parameter
> here seems unreasonable.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v3: Bring busclock back
> ---
>  hw/mips/fuloong2e.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index d846ef7b00..c4843dd15e 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -159,10 +159,8 @@ static uint64_t load_kernel(CPUMIPSState *env)
>      }
>  
>      /* Setup minimum environment variables */
> -    prom_set(prom_buf, index++, "busclock=33000000");
>      prom_set(prom_buf, index++, "cpuclock=100000000");
>      prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
> -    prom_set(prom_buf, index++, "modetty0=38400n8r");
>      prom_set(prom_buf, index++, NULL);

This makes my Linux kernel 2.6 test behave oddly:

 (4/4)
tests/acceptance/machine_mips_fuloong2e.py:MipsFuloong2e.test_linux_kernel_isa_serial:
 console: Linux version 2.6.27.7lemote (root@debian) (gcc version 4.1.3
20080623 (prerelease) (Debian 4.1.2-23)) #6 Fri Dec 12 00:11:25 CST 2008
console: busclock=0, cpuclock=-2145008360,memsize=256,highmemsize=0
console: console [early0] enabled
console: CPU revision is: 00006302 (ICT Loongson-2)

