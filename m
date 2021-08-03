Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256CF3DF5B4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 21:30:52 +0200 (CEST)
Received: from localhost ([::1]:33858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB07l-0003SX-SK
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 15:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mB06F-0002Vw-NU
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:29:15 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:46035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1mB06D-0006ck-AE
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 15:29:15 -0400
Received: by mail-oi1-x22c.google.com with SMTP id o20so29384376oiw.12
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=hCt/p285GDyqfK5dT3U1VthaMi2qbsLlMqm0Y1PJrcI=;
 b=cEJ4oov4U9Jz5w7IVOWEPdRh9d3KgatHiybwLwx+lfy/y4RxplZLTzkdrR8GSaFDJx
 Z36/JohIkQdKjE+nRgbbR7AZnxfwgjWmZC6zrCs3de0Z2eXVlPhUqKcSN/kMe8Wg2BkW
 3NqSPqSLgaBWlxOOg0ZNHhFxH+DcBn6Dhea2IhFwxJJyXVfYsCQZLCy+rOSTm1PvXhL/
 WaRzqKw3JbpB4lYqzrwWXATec8SM2wMc3MsMur8xP/K8G60rl9EepoNqYAl6FgV7Hytn
 NbddbXimRoLAWw6q5iucGfYVExN7/f9XEPdwnkRmXPiAKV8opk1zPHNUWW+NeMpyvZ7S
 tO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=hCt/p285GDyqfK5dT3U1VthaMi2qbsLlMqm0Y1PJrcI=;
 b=s0drRk2JaieLrMSi2+TWqwo7MxeK8jJQGZTyFSEmBIbLOBBnyeNa+modl2v85nGuZv
 l319mpbXAvH/p231kr/Mji4zYbg3aocAQV6VgXMdi0hpvVOuTlMbNsdectfZVSsl20Jc
 BcHsC0bWS+Vz5g4T9WbX1PRFnCMCTnhCK3MA1hTl4SVkZzzKEUS8GM1Orq/+N6b+iQaC
 O5jmZ8XYW6wLUwKCe7w3UcHeFL6kxI+B/csse1HMrtf9PqKlGInahB8fpNEdAUWZJg7z
 Ss6dFQXHvrjOIAEF8bV5y1NXF3NAImOnfmLjeapu57PGfoG0NZ/4aRnZOM+q3jV50oWA
 sPqg==
X-Gm-Message-State: AOAM532yjRzG2TdXL8bZyCqnBMPENafsS8QZoOSLf+47B2EUY6I+5YIY
 zeu8A1GhetwVQacC4ux8rejiKA==
X-Google-Smtp-Source: ABdhPJxM4bwKTZQ4gZQ7EHLtx1I46kz6tniQh8SxJ2jiychu2zIOmOY4cvPPSAgi09FtPjkWHmf7fg==
X-Received: by 2002:a05:6808:695:: with SMTP id
 k21mr9497839oig.52.1628018950392; 
 Tue, 03 Aug 2021 12:29:10 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:2d69:7978:778e:9e64])
 by smtp.gmail.com with ESMTPSA id j20sm334625oos.13.2021.08.03.12.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 12:29:09 -0700 (PDT)
Date: Tue, 3 Aug 2021 14:29:08 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Shengtan Mao <stmao@google.com>
Subject: Re: [PATCH v2 0/1] Add remote I2C device to support external I2C
 device
Message-ID: <20210803192908.GU3431@minyard.net>
References: <20210802230323.1164787-1-stmao@google.com>
 <20210802230323.1164787-3-stmao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210802230323.1164787-3-stmao@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: venture@google.com, qemu-devel@nongnu.org, wuhaotsh@google.com,
 qemu-arm@nongnu.org, maoshengtan2011@gmail.com, crauer@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 11:03:22PM +0000, Shengtan Mao wrote:
> This patch implements the remote I2C device.
> The remote I2C device allows an external I2C device to communicate with the I2C controller in QEMU through the remote I2C protocol.
> Users no longer have to directly modify QEMU to add new I2C devices and can instead implement the emulated device externally and connect it to the remote I2C device.

I apologise, I haven't had time to look at this, and I'm going to be
really busy for a little while.

I looked it over a bit, and is there some description of the protocol?
Could you add a reference to it in the code?

-corey

> 
> Previous work by Wolfram Sang (https://git.kernel.org/pub/scm/virt/qemu/wsa/qemu.git/commit/?h=i2c-passthrough) was referenced.
> It shares the similar idea of redirecting the actual I2C device functionalities, but Sang focuses on physical devices, and we focus on emulated devices.
> The work by Sang mainly utilizes file descriptors while ours utilizes character devices, which offers better support for emulated devices.
> The work by Sang is not meant to offer full I2C device support; it only implements the receive functionality.
> Our work implements full support for I2C devices: send, recv, and event (match_and_add is not applicable for external devices).
> 
> Shengtan Mao (1):
>   hw/i2c: add remote I2C device
> 
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/Kconfig                |   4 +
>  hw/i2c/meson.build            |   1 +
>  hw/i2c/remote-i2c.c           | 117 ++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  tests/qtest/remote-i2c-test.c | 216 ++++++++++++++++++++++++++++++++++
>  6 files changed, 340 insertions(+)
>  create mode 100644 hw/i2c/remote-i2c.c
>  create mode 100644 tests/qtest/remote-i2c-test.c
> 
> -- 
> 2.32.0.554.ge1b32706d8-goog
> 

