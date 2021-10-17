Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468C5430AB9
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Oct 2021 18:26:48 +0200 (CEST)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mc8zn-00021P-DD
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 12:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8xz-0008F3-3l
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:24:55 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mc8xx-00009x-5l
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 12:24:54 -0400
Received: by mail-wr1-x431.google.com with SMTP id u18so36723993wrg.5
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/EwZAUknc46JOANRHdohAicnTn3LgxAiln3z0TsSxTU=;
 b=dWmNhrMhtuLI/LPdM7Ou+JETkPmrguYeiPeu6uJYOB3DJAajjZo7B/z+/cMTNWKgMu
 QEd5ANrY4p/LDsTK17c3d1+eZ/wXr31ejUqdF3Y0EsRMWCF8YbcSwS+DOGkMosp20JnW
 vY9VBFQwQlKkMEZV139g3UjE9I9fQ0k9OpV5SbKipjtZXv7o80bzXcrBk6uw/st7fXDI
 iX4xpTPFyBmV3mJQ1nj/43ILcDhRp2osP5xTJZOZX464J5A7em5b/TRsC0RGkcZmDIni
 +Gyb5fDPpfBSHNDEjtXUpWzq6OQZXOZQ0BfpuMcwAYMj2dE/wrUsUDtDB1yID9zjfB3M
 1eOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/EwZAUknc46JOANRHdohAicnTn3LgxAiln3z0TsSxTU=;
 b=5ukqFO9ODUk9DrSzzoU18WUxL5dfkJ4Id5QsTXyo75Vc7wOxOCXofhJUd7ownhVKOq
 A1ZsYEqVy9JFIbHlBE8CeV4S+Fk1ZAs0oYfhobo6YN814Ycs87e8i2NTDB0DmXjzZy4h
 YnlvzrvXLfUg3eW8wlh6FfSjYDI+F456u1RmwlGtS+k+OOjIO1zitaiUZo+M5GyYg8lN
 tdX7n+fYcFqgs2hTGrmz9ZuGo7OsWoXNbIHaNvK0CHAxl5bqDjEFBYeh8MmcUy13CwS2
 VVc/0zEY+LBNgQq4kXM6owRkQO6HvCtQFDo1IIMCd0o2vqD+yeFIDgyr3Sjqq6gRnJkt
 mCaQ==
X-Gm-Message-State: AOAM533qGOje4B189PmHy5GKEHBI39B955zHr+B0n7xkRjkKvajaOp6K
 zPQZ7naoUcIi3Cac6yKFJ711gUJ4vIw=
X-Google-Smtp-Source: ABdhPJx2NWpd7KH5TFXkRKxlDxm8hZNDEktuVa3GNjEWWKsz3AyuE1rAuYgstl8AO0jxaFDamsLyWA==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr29184273wra.432.1634487891738; 
 Sun, 17 Oct 2021 09:24:51 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id 196sm10266837wme.20.2021.10.17.09.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 09:24:51 -0700 (PDT)
Message-ID: <de64ff78-3fdc-b81a-23f0-7ed39849fa7b@amsat.org>
Date: Sun, 17 Oct 2021 18:24:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 3/4] hw/usb/vt82c686-uhci-pci: Avoid using isa_get_irq()
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1634259980.git.balaton@eik.bme.hu>
 <228ffba872d7870392270b36910ac8250cd7ff96.1634259980.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <228ffba872d7870392270b36910ac8250cd7ff96.1634259980.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 03:06, BALATON Zoltan wrote:
> Use via_isa_set_irq() which better encapsulates irq handling in the
> vt82xx model and avoids using isa_get_irq() that has a comment saying
> it should not be used.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/vt82c686-uhci-pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

