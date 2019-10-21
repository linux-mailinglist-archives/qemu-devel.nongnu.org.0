Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D895DF1A3
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 17:34:13 +0200 (CEST)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMZhD-0003Gn-QO
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 11:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iMZXP-0004WV-Dd
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iMZXO-0005lT-C5
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:24:03 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iMZXO-0005lD-6h
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 11:24:02 -0400
Received: by mail-pg1-x544.google.com with SMTP id c8so3203078pgb.2
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NJIe63cJZXocRBQ8ED1V/Xsp1zrK5+aJicKvT16YnS4=;
 b=CMdupyrNybic58U22upNlK+hehuI2m/HYhBwjzRcBhfF+ndQYXYXogzM6VUR7MS3Sl
 LGxB8b7mxs5Q//i6MWCD6cSVSndnA9U5rT1yfx0rL5fGoILr82sL2CtRPNLnoDvg/6dT
 2RufQDYH3dND6qCFTpgn2BVfn3y7PEGdQt5G/XeWKowELZ8Ake0XyDA8uUFcf47joCq4
 nlRjORtqV5t0bmB/UM3Dx0HHlMV9ryC8VdxWENZ9ZQr3QWb3tnwPOt1OMHY9KJayEgLn
 a8GJwUYiXBVLwyZqBPnmUfWat4rdIU5PCyXACM1Gb1hxCRAZfyO3ZtVPiPfGhDxeojwG
 M6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NJIe63cJZXocRBQ8ED1V/Xsp1zrK5+aJicKvT16YnS4=;
 b=CtrdvcHi/88ginbf/7X7JtXMaXbTQxG8H5D4wCJAMO1cSnqHRmDISk1eUtRnjDwaB4
 Ui9yhomih77PS88oCabiE3MSz4FQCI9DMpG7zeNJYnn2o66hYNkuX9COR6d6bH33SE22
 pmJZ3jCjfEjIZtNTUoGdpogO+R36h9vEHaXGsv3YwiusiSq7gbPtp3HccSlXErBcnkKS
 HY5r8PYcXzaJC2nEQWmiMUTnTk0nWXHZU7AIdKwcwZl+zj6NHIgIBeUIwECf8/hx5jyZ
 joA/KcWAMiXRH2rZziLrtE+xp0ERbpNYKmYBpojmt4lEQwmRADhKJqENvnJJl1IbibBI
 F91A==
X-Gm-Message-State: APjAAAXBaMuusvzmKINXXbD1D7UX3poCrtinGh8fQteh/+ZZaSQDwv+3
 b4z1azPIXxBGy+2lDUByYo3TkA==
X-Google-Smtp-Source: APXvYqxN7BerMRx0qEROjXxQOZA1nX5TrFNQyhMDqTmdld3QKTvkH8lKC3S7K0+N7gwsDpSKJ3mLVg==
X-Received: by 2002:a17:90a:b003:: with SMTP id
 x3mr30008332pjq.101.1571671441105; 
 Mon, 21 Oct 2019 08:24:01 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y8sm20285220pgs.34.2019.10.21.08.23.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 08:24:00 -0700 (PDT)
Subject: Re: [PATCH v2 5/6] s390x/tcg: Fix VECTOR SUBTRACT WITH BORROW
 INDICATION
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20191021085715.3797-1-david@redhat.com>
 <20191021085715.3797-6-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ca80ddc4-81ae-ee33-f100-577ae3db20b8@linaro.org>
Date: Mon, 21 Oct 2019 08:23:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021085715.3797-6-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/19 1:57 AM, David Hildenbrand wrote:
> Testing this, there seems to be something messed up. We are dealing with
> unsigned numbers. "Each operand is treated as an unsigned binary integer."
> Let's just implement as written in the PoP:
> 
> "A subtraction is performed by adding the contents of
>  the second operand with the bitwise complement of
>  the third operand along with a borrow indication from
>  the rightmost bit position of the fourth operand and
>  the result is placed in the first operand."
> 
> We can reuse gen_ac2_i64().
> 
> Fixes: 48390a7c2716 ("s390x/tcg: Implement VECTOR SUBTRACT WITH BORROW INDICATION")
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  target/s390x/translate_vx.inc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


