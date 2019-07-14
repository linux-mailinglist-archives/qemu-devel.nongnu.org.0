Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4567FB9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Jul 2019 17:20:34 +0200 (CEST)
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hmgIf-0001Sl-Jl
	for lists+qemu-devel@lfdr.de; Sun, 14 Jul 2019 11:20:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <groeck7@gmail.com>) id 1hmgIS-0000z9-1Z
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 11:20:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1hmgIR-0004AH-4w
 for qemu-devel@nongnu.org; Sun, 14 Jul 2019 11:20:15 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:37771)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1hmgIQ-00048J-SY; Sun, 14 Jul 2019 11:20:15 -0400
Received: by mail-pg1-x542.google.com with SMTP id g15so6551078pgi.4;
 Sun, 14 Jul 2019 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ja7BGDjNpBumPT+R5Gz5Z/tBoNmP2auF00GL6v+qk1U=;
 b=M/I0v8AUTmSjk4mOFRTrSn/vUM0zYV21kkWgq4Y13dXTgmGSnmUJ89HRUPeWDPNhKx
 ipOj/6QKu2ltGLq/9K15wZsO9P18sRkwKaI5peZELPddOoUk7Jqoc0nLJcdqG0v2JvwN
 OC8dXIBk5N1epyZVv2R7a5nkH++eDBkT4GopLV8i6jCEOfyNKH9kAvFKwkzkB8gWUrob
 DENBFYZiTwNritJTgzydJpSjggp1irWGDgIB6Im1I0pOGpkfm5Ey7xFRxSWwsxCKMdXh
 Bp7RcT8tfDC/jfecgE/OMrYFGyxSonNz7qlD5otlC+Qr+yFtzNgg8KCh08R1/V0cV0KE
 tzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ja7BGDjNpBumPT+R5Gz5Z/tBoNmP2auF00GL6v+qk1U=;
 b=t8TG7Ut9ZwDd38QwkasX8eq1tAjkE/xnqCksA01tknScSNQOYHh1PXSS7F393ZJeAZ
 CfXlo4ZWiEn66OUl11HJ6ke4kEaSeLrh0dabUVKaG4Pf2t+msd32E/CycPsGRMc66fF0
 2AGrdXjs5ERjROfkZbyx5UDkUEziNcm6yzYt1IA/Hp6iyvpEJ/1w7WUHRIQNnQ/PoBTf
 4mcr4TTAKn03Yugphcd/WoIQ9apY1Z0mOPVKCfHaMVSOY2Y13Y5rFePGhoXahn6m7DP1
 eEOeT0+miX/kPDoWgMAoCDZsRxtKhkI6PhItKcxT+4NG7qqkfIkblXAhazQZBelAJmMJ
 pfZA==
X-Gm-Message-State: APjAAAVpSvcoOS3j9yaRXaUVa9eXhEPpKNl9bcm4Fg11mBUlOaGY74Yk
 qbSn0VeSwVGOfPepiQp4M+0=
X-Google-Smtp-Source: APXvYqxy+sK8zHR62EcjGJVxYgr5OpNaqEgjxX6wv9QyzWVVruKgPXCnnXCJLR5dJWU6Uwgt3bSsWA==
X-Received: by 2002:a63:61c6:: with SMTP id v189mr16315279pgb.36.1563117612614; 
 Sun, 14 Jul 2019 08:20:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id f64sm15508785pfa.115.2019.07.14.08.20.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 08:20:11 -0700 (PDT)
Date: Sun, 14 Jul 2019 08:20:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Message-ID: <20190714152010.GA28247@roeck-us.net>
References: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561890034-15921-1-git-send-email-hongbo.zhang@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
Subject: Re: [Qemu-devel] [PATCH v9 0/2] Add Arm SBSA Reference Machine
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
Cc: peter.maydell@linaro.org, radoslaw.biernacki@linaro.org,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, leif.lindholm@linaro.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Sun, Jun 30, 2019 at 06:20:32PM +0800, Hongbo Zhang wrote:
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware,  to support
> firmware and OS development for pysical Aarch64 machines.
> 

I tried to boot linux on this machine with -kernel command line argument,
but have not been successful. Can someone point me to a working command
line, one that lets me load the kernel directly ?

Thanks,
Guenter

