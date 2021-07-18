Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A085B3CC9DA
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 18:26:20 +0200 (CEST)
Received: from localhost ([::1]:41608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m59cR-0000d7-5L
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 12:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m59ao-0008Il-RF
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:24:39 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m59am-0002gB-Hz
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 12:24:38 -0400
Received: by mail-wr1-x430.google.com with SMTP id t5so18537086wrw.12
 for <qemu-devel@nongnu.org>; Sun, 18 Jul 2021 09:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=InxtImoPTH/QQbpigcIufyXO0yy0sHXRnjyqp2366Mk=;
 b=ORyjNCxzC84c0btPA8Ix/hJrUwzDDmsqG0C0xqTaHqeUaw9vaWyQFmAxm4bzkivD9W
 SZDRsCdoe13epSzIzdiY9CGJ/0e9bIS5HMHbt8ejKXvfQHb//fdf0+TKRfMQhSCRuLKM
 Vw+wHXckWJt3s2oeEq04OwEiAe/LA+CsiMC/MH7nsUKQ8soznwrEGE3SteJk92W3CgbQ
 6hn101tURo7h/B0Fg7yQsaNdkCQSyC/sVi1PoztOC2SlRjSm9xyc6hoC18K2WWNLos7D
 q1L4e7mguBkCFv/rjNK5OEW6NnWiXTqTnZl5SnDacO4m/Dr+bGFsvRlWDXVtuNd8VQ1F
 tjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=InxtImoPTH/QQbpigcIufyXO0yy0sHXRnjyqp2366Mk=;
 b=B0MouBzBtCiAMpxFDWRbUqpjHaxRMCy547VuYE9pAkNgJeM7kelhzkFEBBZWfDrmKG
 W2GxkYwe8kkBzbSJXBzfjfJDBhHlRCRHzD7uV3d+tP2cpsyZNburu4+drdpky2uGzS9M
 3YUrfB4BslDDb/CTAiICQ0a5KTgSCZYYl12fBxV4Jn7UgzRhZcuSJ2Hy9QWfsblgbwnn
 q11v4bZTCRuqmM/99JxrGWbjOu7edELbODZ5lQENHvMF5fFA72ZJOh1cjRAVIbCK/zHu
 m0VBDNQTMS+lTXpcQFSndtkh887oR+76x3wwnQ4X0ufS22DDxvN3rTL0BFqkqDaxmNP9
 l/GQ==
X-Gm-Message-State: AOAM533NGP56uqOa8XCpDkLl6JF3Z4jcD6ubcKzJYAifYB7z5E89VTV1
 EDCHAw+jcOD/aMOx2CZqee4=
X-Google-Smtp-Source: ABdhPJxrNpLRTU14UhDTBz6lzBoTzfnZaIdEMXMZzTGzlIynpveH8aPKu/mfjQuIhlgudjKubC+ZXQ==
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr83798wrw.266.1626625473887;
 Sun, 18 Jul 2021 09:24:33 -0700 (PDT)
Received: from [192.168.1.31] (abordeaux-654-1-74-136.w109-214.abo.wanadoo.fr.
 [109.214.221.136])
 by smtp.gmail.com with ESMTPSA id v11sm16857897wrs.4.2021.07.18.09.24.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jul 2021 09:24:33 -0700 (PDT)
Subject: Re: [PATCH] hw/pci: remove all references to find_i440fx function
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org
References: <20210718131659.55783-1-ani@anisinha.ca>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <818656b2-368a-3fb5-1eca-6d9d0cedd183@amsat.org>
Date: Sun, 18 Jul 2021 18:24:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210718131659.55783-1-ani@anisinha.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.07,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, jusual@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/18/21 3:16 PM, Ani Sinha wrote:
> commit c0e427d6eb5fefc538 ("hw/acpi/ich9: Enable ACPI PCI hot-plug") removed all
> uses of find_i440fx() function. This has been replaced by the more generic call
> acpi_get_i386_pci_host() which maybe able to find the root bus both for i440fx
> machine type as well as for the q35 machine type. There seems to be no more any
> need to maintain a i440fx specific version of the api call. Remove it.

Yay!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Tested by building from a clean tree successfully.
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/pci-host/i440fx.c         | 8 --------
>  include/hw/pci-host/i440fx.h | 1 -
>  stubs/meson.build            | 1 -
>  stubs/pci-host-piix.c        | 7 -------
>  4 files changed, 17 deletions(-)
>  delete mode 100644 stubs/pci-host-piix.c

