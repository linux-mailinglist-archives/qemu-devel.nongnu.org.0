Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45694174EB8
	for <lists+qemu-devel@lfdr.de>; Sun,  1 Mar 2020 18:40:27 +0100 (CET)
Received: from localhost ([::1]:50468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8SZl-0007NI-50
	for lists+qemu-devel@lfdr.de; Sun, 01 Mar 2020 12:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SYa-0006fP-LW
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:39:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SYZ-00055F-MM
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:39:12 -0500
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:39693)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8SYZ-00054s-G5
 for qemu-devel@nongnu.org; Sun, 01 Mar 2020 12:39:11 -0500
Received: by mail-pj1-x1044.google.com with SMTP id e9so3406676pjr.4
 for <qemu-devel@nongnu.org>; Sun, 01 Mar 2020 09:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zPf2ELswWbCzCNFcU/z1N+mq3I+1pGGuQpnnhEqMtVY=;
 b=qsDnRFKijUsyNilUPJ8pe4BIY09jF058/idooEHv+OwsWIYi9g7kpq0h52y3Pe0U5F
 t8G9bdv08k7Ovhlhh+6jZbEd4Ry15ibW/V1P6IIepLcfGAlBbR/IGuFHtUNc87adjk+y
 dihsWf0NxFfxqmotSrYJR5Y83L5erP73I+kuB/aeWHYiLYepMxueb1gz+JuopmeHaYHp
 o02rcEBH60aqRZ47DgD0O8xc7QNaXlwK6+3fR0aSMWCphJbi2D4l1U6lYIQsRx9lPxrV
 nFPY/2Q3S+O5JrGLG3KUCQydvnyw9h9+qaFUzUtpkyUOIYnhhL/CyHTSs0i+Y4ZLOatn
 9DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zPf2ELswWbCzCNFcU/z1N+mq3I+1pGGuQpnnhEqMtVY=;
 b=uUI6R4EaY8OlpHV9b1NvPnwHq9S+0EPASfgjKPR3j0i252UM+ad0HLasKWoPqlBP7V
 EUFPECd/ot5V+v1gBYHOglj3iu2a1Z05aIyfKAugrGpmSf2lOVK2i2cUKwQmcpZzrL3N
 L/YSP6gQS86LrjkDXVy3efegkOG0GIxrNnLoI6T4tqqy57v5ohqiFwledkUyduLl8j9S
 Vg/+fvbl5IS9MIto+uADKEPQoxKCJOuZhoaWikCcU5uOzXXwSW5znILTQv3gDD9+0Uys
 EliNPmpFOHTbBJ+zEuzbdyDv/irz2ThUs6bt8MavBBgsNConEcVUg7qm+6u51yOXL02f
 zAQQ==
X-Gm-Message-State: APjAAAWnnP2Buy9VsxgkdvfeOFelG0u0IYqhyn7lxh3XPoG9t0U1acUx
 lnuO3OvO5Z3GxqnrnQPmK5O0xw==
X-Google-Smtp-Source: APXvYqz81LSZaS1BZmyOQ11oAk37F0vZ/J55as8q2RPBu1V15xDC6ZvCFplUPz1EDNX3N12nmVz0dg==
X-Received: by 2002:a17:902:7203:: with SMTP id
 ba3mr13745352plb.249.1583084350136; 
 Sun, 01 Mar 2020 09:39:10 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 22sm1577573pfc.14.2020.03.01.09.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:39:09 -0800 (PST)
Subject: Re: [PATCH v2 1/6] hw/arm/virt: Document 'max' value in gic-version
 property description
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-2-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dfcd4971-f581-52ef-4726-a524b336f889@linaro.org>
Date: Sun, 1 Mar 2020 09:39:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/20 2:40 AM, Eric Auger wrote:
> Mention 'max' value in the gic-version property description.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

