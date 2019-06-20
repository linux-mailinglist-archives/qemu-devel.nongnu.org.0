Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06324CCE1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jun 2019 13:27:41 +0200 (CEST)
Received: from localhost ([::1]:46430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdvED-00014e-11
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 07:27:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52851)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdv4H-0004QD-8u
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:17:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdv0D-0003BR-Pn
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:13:14 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40818)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hdv0D-0003As-KR
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 07:13:13 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so2731113wmj.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 04:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=716XKHodatM02Cxtj8XZxZhJd8kDjQVWNgZdEZm4Me0=;
 b=onMUFtAIT33eV3aKjkT4uUQwt7fHGMIfvKi1gb3ByhxVzDWsJCaFDaEJWjhdnK/hxz
 p1n/GGr7zYRtV8tcGT1FD7JxfYqmp1h78Z+029AdLlo4UHaNtvxDz0IBQcwLjXMsV1xs
 VAQp0QNQp+7ZJIEhary/rYzqShlh23nehSkq6vdZOLmpcy3XPvHcDzMzm9t2M4pjF9z1
 LI/z2tJYQNTa4fYL46p3WNb6+OJtYrBfPk55yXH3dgLXy/R7q4YBGeDOKNEDr2AwH55L
 scapdyUG+Te1tahEQcX9f3FJdI+ZPWdlmzh5D1OUMo4s2Dsnyn5IQ7FCwwQQ2Ms5pRwA
 Hm+A==
X-Gm-Message-State: APjAAAUN/H1Jhybv69iG9jsuOpw4e/s17J/LCPTJAf85LH++n6PYnGb/
 rNdhY3v7Xav32arQK6O6F8sX+w==
X-Google-Smtp-Source: APXvYqw9xtiDchYecZ8KE1sHUB/Itz2UdtzddXrY5VSzt3NUaua49TUVkuq8JKcIUdfN9Qm5RTDABw==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr2303029wma.123.1561029192519; 
 Thu, 20 Jun 2019 04:13:12 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id h133sm1866927wme.28.2019.06.20.04.13.11
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 04:13:12 -0700 (PDT)
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>, qemu-devel@nongnu.org
References: <1561022396-20649-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1561022396-20649-2-git-send-email-aleksandar.markovic@rt-rk.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <197176a8-193c-1c58-ebe4-49fb8aee4fb4@redhat.com>
Date: Thu, 20 Jun 2019 13:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1561022396-20649-2-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH 1/4] MAINTAINERS: Update file items for
 MIPS Malta board
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/19 11:19 AM, Aleksandar Markovic wrote:
> From: Aleksandar Markovic <amarkovic@wavecomp.com>
> 
> hw/mips/gt64xxx_pci.c is used for Malta only, so it is logical to
> place this file in Malta board section of the MAINTAINERS file.
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index acbad13..869e87b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -930,6 +930,7 @@ M: Aurelien Jarno <aurelien@aurel32.net>
>  R: Aleksandar Rikalo <arikalo@wavecomp.com>
>  S: Maintained
>  F: hw/mips/mips_malta.c
> +F: hw/mips/gt64xxx_pci.c
>  F: tests/acceptance/linux_ssh_mips_malta.py
>  
>  Mipssim
> 

