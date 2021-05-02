Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D21BC370EFB
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 22:14:20 +0200 (CEST)
Received: from localhost ([::1]:43316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldITr-0006du-Uy
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 16:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldISp-0005PQ-3T
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:13:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldISn-0004wp-Hm
 for qemu-devel@nongnu.org; Sun, 02 May 2021 16:13:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id n2so3484709wrm.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 13:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fUmLgqWC2OhBwPWbUvsU5o+eFJC0nReUTzacfx8FNi8=;
 b=JTFNsrXbUatatqhJX5QVxLKJ71bMl/qkl9T4X2aRSPcYUwL3scIsEsybzzvTg83Pi5
 XW0b0cJcEkwr6WzAzL8To46DLNxPJvRyTYsDybDNKJGkEeGGWgsORmGi5RiscKDpiVqR
 6f5r6hvUlkZVDYkY2chwDAZubAvEM61ZF4X20gVrpqPDRIXRMz2v3xLostNRXP1SQ8h/
 wtmXAvB0C4R3/TlP9rtytEphF4ntgTcebpipmLbD0WwJi1ngl+ZWF2h1+eAkMoqILZHc
 rFmJocAxKU8vl8Jg6sd6glLtbWR4/2qQnZYaRxBZbKgsnxKder+pgI84xhNLF3X+4hrl
 vG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fUmLgqWC2OhBwPWbUvsU5o+eFJC0nReUTzacfx8FNi8=;
 b=F6G62r4KzEkMW+pSlA2sZNBz4sxLAQT4z5hEd8RGjQ6+SiJm2a9A19uVYlQT6bcngP
 Yj0ZbBAZ16lq8xy+HuCa7ygfNDncPoKVWOflyKu8kAllc6nRGpe5NiHQ53vpL1k97mYO
 DWOAhe8hIkbO8CJB8xl9X2s/jFtjFWT7k6G7F7nI/tchHJ8e0KA4U4tcqqt5vLEIxAnK
 bwXWG7peGvcq9tVumbvG/JYDEXn7FnEKJdpKeMrQIRpIIGF6OVJGcE4ZV116XDCL9WvC
 Ks0SG1jUVMGSIcXlPOogjE3amk5Gz25uDaTH87Wp3AzSRJHXOf9T7VoDRs5bYde0EBDp
 B39w==
X-Gm-Message-State: AOAM531S7mUzpXZU7scnH//cI+/dQX5pMFi9l+IK8zxAEczlc3YufhWK
 cEU2liznY8TbdxQOiMITX1s=
X-Google-Smtp-Source: ABdhPJxHDTdbESEBATdmQk53LgLTzcs8CpFfBLDXoOD1lRp2lCPBlvX5pNnR9bm4p4UDfzNoNl/EUw==
X-Received: by 2002:a05:6000:1143:: with SMTP id
 d3mr5101718wrx.404.1619986392202; 
 Sun, 02 May 2021 13:13:12 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id t17sm8951392wmq.12.2021.05.02.13.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 13:13:11 -0700 (PDT)
Subject: Re: [PATCH 0/2] hw/usb: Do not build USB subsystem if not required
To: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20210424224110.3442424-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b435a81e-36b0-c9cc-5661-8f87f4a33fc5@amsat.org>
Date: Sun, 2 May 2021 22:13:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210424224110.3442424-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 4/25/21 12:41 AM, Philippe Mathieu-Daudé wrote:
> Not all targets use USB: allow the build system to not
> build it if not selected.
> 
> Philippe Mathieu-Daudé (2):
>   hw/usb/host-stub: Remove unused header
>   hw/usb: Do not build USB subsystem if not required
> 
>  hw/usb/host-stub.c   |  1 -
>  stubs/usb-dev-stub.c | 25 +++++++++++++++++++++++++
>  MAINTAINERS          |  1 +
>  hw/usb/meson.build   |  9 +++------
>  stubs/meson.build    |  1 +
>  5 files changed, 30 insertions(+), 7 deletions(-)
>  create mode 100644 stubs/usb-dev-stub.c
> 

