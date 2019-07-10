Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C761C6426F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 09:18:09 +0200 (CEST)
Received: from localhost ([::1]:58390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl6rh-0004Vt-2M
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 03:18:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58536)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hl6po-0003sp-1p
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:16:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hl6pm-0000gB-Nb
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:16:11 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:43352)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hl6pi-0000TP-J6
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 03:16:08 -0400
Received: by mail-ot1-x343.google.com with SMTP id q10so1116782otk.10
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 00:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A2QhuxE+PKanxB2fnz1KZf4nLuqSSG0BPKCsBfK4o/s=;
 b=Lus2BUggxbCfesyMXznqhK1nmZvrUbXQ68qhjUlK5FdTjictszwCGS1ZStiSQ+OWwE
 zlnHft6q0ujBHaL6+0ZRwhUmVx6cVuZjvs5FDRZif8Br+dXuwT1AhALbF9L5kRgbkE6R
 EVZZ7Oq+liw/7arX0LRpEb0UKELsPRkLJSVHP4q9a7J4bXOaKB9Gmgjlx9r++qKzC/Fo
 g1g2DnfNgZ6UZQzhzWM37feu9Ih9+gijMIMImMBDky+IMmyC6HmXwnf5wom4xh5xN8ZH
 MyxV+D4/N/rOgxnqJZaVdJIeePFDQBTyVsBaqhDYYCEq+Ehl8I6liQoTAeCRBMJZy/Yz
 4SPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A2QhuxE+PKanxB2fnz1KZf4nLuqSSG0BPKCsBfK4o/s=;
 b=r2FQQlKuv59Bnc5dSQPPi3fVgq+blYg2NcvCVlJHNjcdqxy0/F0wweYnqAg3Tkf60h
 ekxeYNfxsDbAlEQ9iKwPakvbcrHRbQakLc+yeDKNApUmoJ/Vn7iy8aiMx3QPJRkfpzbk
 8vL1eXJJ6Wi6QrFTUzVP+XfVzr/qXU1z4/0Oz5twU3Xcv/anETRktE1PWXpYe2NQXDi8
 wahvc5Lo5IawygPLg3YcJr5oX5WP2XhO3brB7XJJShn/Ph3WzzTaNcS9+Kk52e1GvY6L
 tcwlEajW9+v7W9QqXiaYS89DORmfI/VpEHg6LUwCXib0Ym3jt8nH1ao0hsZyrasOdCtZ
 TJDQ==
X-Gm-Message-State: APjAAAVbVxEK7mwIKIAlR7xc0KlfGt/SdeaI2DWGrl3yFqo1YMinN8Xp
 36+ByOvy0vRL3hSAizHTI25LJCedXi1ixg==
X-Google-Smtp-Source: APXvYqwBmhI+46eMXoj/+0L7aGLaT4RWepZWkZ5OMkcV/XY51pKhgIA95X3qrgIIyjkQQ56U4ORokg==
X-Received: by 2002:a9d:6508:: with SMTP id i8mr22710531otl.355.1562742947337; 
 Wed, 10 Jul 2019 00:15:47 -0700 (PDT)
Received: from [192.168.43.94] ([172.56.7.82])
 by smtp.gmail.com with ESMTPSA id 198sm520866oie.13.2019.07.10.00.15.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 00:15:46 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190705160421.19015-1-alex.bennee@linaro.org>
 <20190705160421.19015-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fecd49db-8517-764f-d998-bca7656de8d1@linaro.org>
Date: Wed, 10 Jul 2019 09:15:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190705160421.19015-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v1 5/5] gdbstub: revert to previous set_reg
 behaviour
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Jon Doron <arilou@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/19 6:04 PM, Alex Bennée wrote:
> The refactoring of handle_set_reg missed the fact we previously had
> responded with an empty packet when we were not using XML based
> protocols. This broke the fallback behaviour for architectures that
> don't have registers defined in QEMU's gdb-xml directory.
> 
> Revert to the previous behaviour and clean up the commentary for what
> is going on.
> 
> Fixes: 62b3320bddd
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Jon Doron <arilou@gmail.com>
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  gdbstub.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

