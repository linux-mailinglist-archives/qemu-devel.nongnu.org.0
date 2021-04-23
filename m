Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D3369C04
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 23:24:37 +0200 (CEST)
Received: from localhost ([::1]:41046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la3Hw-0000gh-PV
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 17:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la3H9-00009P-EB
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:23:47 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1la3H7-0000Qz-Fv
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 17:23:46 -0400
Received: by mail-wr1-x435.google.com with SMTP id c4so10750844wrt.8
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 14:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6dBFftcxN5gnq+XjkeArn6b8WVpNAb8aDguLdtvP9cA=;
 b=Bwm2WP5YxGmWxL5apASjizOvYJzXFweIw1jK5Ui0zVgl+xReKoKxdYVKedhpPgXS75
 J8laSFInNBaJRVk5RTcvO2VkrE2MVXgGQYsuOZdaFbFwSgsLZaFo5ggITFlj1xiFdv24
 4Bwbz3o/0+2xiw7CnrKgsOEJ4vmgapu0TSUrwhyCegox9r4F4I6mt7wkulOFQ4hVZ4hc
 ot8DBkv1+WJi1H1m4darbX4rwMxDNfNoVif/lE/ELXYxwvMK+hFQWI/vrbPP5Fx7eFMK
 q2YjxEpXB4YsOAE20hS8Yu43O7fydXfysQcmZvsTbyv/KlhD5SU/i0vhB5U1+JYo5wMa
 tvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6dBFftcxN5gnq+XjkeArn6b8WVpNAb8aDguLdtvP9cA=;
 b=ozoQ69EDRzkWTAfOIIuA+Q4y9mGlCOaj/OM2ZFy8D5sHbxBHWEOvs6bGkx3gSTEAvE
 bTZHPQ6e+21Y7ldefv29uTikWPBGqalcuLG3x6yRjhPdpFkIBKpqSG57uSMh0B3nYaE9
 3p2ZAP8jHYiV7sRu1J+z8TGj2/AF3Hn/XGRBwqDmPaL50HJQXsgrhQbZrAKgh2MHAV64
 bkU/zRSDSHKUjZvhWfAU0MgPCRo1bXT9KOWt7Sep71AnIHXMxr+pfyOJk1gxt1B5PsIM
 zdzoaZCHCoOJNmYyN3ouXP/TNgwjYxyIwflBt5cb6sDHI9AXHDlXVM66J883oKMjvCXI
 6mPQ==
X-Gm-Message-State: AOAM533EVKuCJgxvT4DCpNeo+b9IuObYGMIWJOPrRssGLZWr0ULi9Jqm
 WBHZSpwciz6d+bjM3RN9KPM=
X-Google-Smtp-Source: ABdhPJysE/JgrSDHCmyR55k2aG8k0G+yfvXn4TB4s/zUJr+R2e4mYENosgyPlkc1Mo7P+P1RcBEkIQ==
X-Received: by 2002:a5d:6e06:: with SMTP id h6mr6922484wrz.201.1619213023883; 
 Fri, 23 Apr 2021 14:23:43 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u8sm9688187wrp.66.2021.04.23.14.23.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 14:23:43 -0700 (PDT)
Subject: Re: [PULL 11/24] bsd-user: style tweak: if 0 -> ifdef notyet for code
 needed in future
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-2-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2e4fb308-07c3-c998-89b2-f49b69e90092@amsat.org>
Date: Fri, 23 Apr 2021 23:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 10:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh <imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  bsd-user/elfload.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
> index 87154283ef..07a00ddbd5 100644
> --- a/bsd-user/elfload.c
> +++ b/bsd-user/elfload.c
> @@ -1270,7 +1270,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
>                ibcs2_interpreter = 1;
>              }
>  
> -#if 0
> +#ifdef notyet

Better describe in the cover letter "ignored checkpatch errors" and keep
this unmodified rather than trying to bypass them by dubious code style
IMO. The checkpatch.pl script is here to help us ;)

>              printf("Using ELF interpreter %s\n", path(elf_interpreter));
>  #endif

