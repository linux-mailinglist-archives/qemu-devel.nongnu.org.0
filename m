Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921C1155721
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 12:49:17 +0100 (CET)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j028K-0003PB-G7
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 06:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36932)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j021M-0006cx-B5
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:42:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j021L-0004XX-AJ
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:42:04 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:41859)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j021L-0004Vi-3c
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 06:42:03 -0500
Received: by mail-wr1-x443.google.com with SMTP id c9so2280832wrw.8
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 03:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=8O7tkOKS8YWV9DK1uEznr33bHACSFdyulJrwV/gKRSc=;
 b=ROeEWCqkfiMwlLVlhy518AmTjwuK2rVvyo4+FoPXCFYdN0B/I9ItzQXcdK3BBs0kfq
 OGbzdaNaSUGv5/M0/vIly1E87nQNo/QPxElpwFAt5GiGZRYMDNtXEzrcstpWtvlh8Y3U
 W6mMqvxl/XjQIU3zl+eLX3oaY9zOhowQKnidihvEkSLMj4Yc6Zet6Kxz/WurtgYVTNAS
 s/dJL2CPV63QoWboMhTIWJfAeSS6Pl8VdV8Nu3TFPqd0/0C34epnlHCS6xiPnjUGZLoN
 x4oQzxtagXlUzzEW+iO83Q9DZTc55YbD1zN1w7H9ZKhjbkGOxLYInQe2OQtubsTud5Dw
 59LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=8O7tkOKS8YWV9DK1uEznr33bHACSFdyulJrwV/gKRSc=;
 b=fGFOzcqCTQAHzI0Zz0MX+Ud73ZUU4dcisBvTddjrG3bwt3LqeMkIP7g+DZWubS+4YY
 x0ik+Fzfls/36y8qWyIqLu5i529OmnFHC1aiX6A3/IURBz+ArjJJq0eydGkVR/I4PiSq
 HO6vECaaQWa3zVQmNTjxivNJW9ApuekydtDB1SrgzGZqQTjuUwBWZJw+L5rdR2ZD10ja
 udEjj28H6WPjNXQlWKA1CHQ0Gw3II9LYQLxAmBYH19UOqLqn6z6z06MkbAbnWdi8QGNr
 53kBfupVVnNM9XUVTTGF12b4ILCGsFs+oJmw0grpFQt8FGRFfT1/P0EC/fVhNkqN2Do+
 x8Iw==
X-Gm-Message-State: APjAAAWksdzRxobDFX7R8p1XalxCO5mDNC6DmgiRy+j8E1zJRGw+ZV1A
 dgDwtup9VGHSVJV6enlG2GBf8g==
X-Google-Smtp-Source: APXvYqzQetx7eMYUcfw0SkK9uLZ+YEpMQ0xXLBzqWX7DXAHi2G1K0zapTl4/hBtvJj2fXv8rhMhbxg==
X-Received: by 2002:adf:df83:: with SMTP id z3mr4285064wrl.389.1581075722177; 
 Fri, 07 Feb 2020 03:42:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b11sm2987866wrx.89.2020.02.07.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 03:42:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DE921FF87;
 Fri,  7 Feb 2020 11:42:00 +0000 (GMT)
References: <20200205212920.467-1-robert.foley@linaro.org>
 <20200205212920.467-2-robert.foley@linaro.org>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH v1 01/14] tests/vm: use $(PYTHON) consistently
In-reply-to: <20200205212920.467-2-robert.foley@linaro.org>
Date: Fri, 07 Feb 2020 11:42:00 +0000
Message-ID: <87pneq7hfb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: fam@euphon.net, peter.puhov@linaro.org, philmd@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Robert Foley <robert.foley@linaro.org> writes:

> Change Makefile.include to use $(PYTHON) so for vm-boot-ssh to be
> consistent with other cases like vm-build.
>
> Signed-off-by: Robert Foley <robert.foley@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/vm/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
> index 9e7c46a473..778e506755 100644
> --- a/tests/vm/Makefile.include
> +++ b/tests/vm/Makefile.include
> @@ -80,7 +80,7 @@ vm-boot-serial-%: $(IMAGES_DIR)/%.img
>=20=20
>  vm-boot-ssh-%: $(IMAGES_DIR)/%.img
>  	$(call quiet-command, \
> -		$(SRC_PATH)/tests/vm/$* \
> +		$(PYTHON) $(SRC_PATH)/tests/vm/$* \
>  		$(if $(J),--jobs $(J)) \
>  		--image "$<" \
>  		--interactive \


--=20
Alex Benn=C3=A9e

