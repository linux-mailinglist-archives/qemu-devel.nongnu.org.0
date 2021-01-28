Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C37C3079E6
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:38:46 +0100 (CET)
Received: from localhost ([::1]:57686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Nd-0005om-5d
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:38:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Jg-0002WI-Sd
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:34:42 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Je-0001I2-L0
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:34:40 -0500
Received: by mail-wm1-x32f.google.com with SMTP id s24so5376702wmj.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:34:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jTA0+z9gm/n5Qpk6MTQ8UzLzY8lpFN+C8Z6AIigv484=;
 b=JnK5fZBNj7yXQqEoqYaSxoD9PgOmtjp4ClXGkko6VrGDh6FyxVMNfELSbMnZmuoDnn
 ykyD8QOdJWKaALR13ZD6kmnQhiL7/6udCoF8gZYIBHqshvKYPoGq7GYgxQUY+FjddxLv
 QyppCGrjYMfd5zCDQ5AXqkkTOd6WUvWRLi9Vn1z10YddYPNwiGUNsw5QIIclt+N6sOaT
 /sHufp89lQirv8fahJHK48UhtkQby/gxpxWu09QN0uEYVc7kjAcq8NRyBjg+SWVc9e3K
 hV1zj6tfjXTE4O56j9y0o+fv/hmrpTuBZG59yO8vpUde2ljBlpfEcYzwxG3pOI4c9quc
 4n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jTA0+z9gm/n5Qpk6MTQ8UzLzY8lpFN+C8Z6AIigv484=;
 b=SG0PlE9wcCTugiJwMvC/akHQ8k4aL08oDAs5xh0odA2cuesDOZrU3IvBZIozM6rUeW
 E+W/JmiO01ci+8EVkqWSk2bpjsHBZIXoCeY6M9tV815sfV0o9dw5ro4Nu1/q4u0PCyBg
 Pp7cAnq9Z7TO6Btj9Xg/PFU+ZFPB7SeZlNIRQk6oiR8uE/+N8C9V3GsV/c5SMskvjj12
 smG6pKdG4d7qGFo+gb8oFGMvTKy74112P8LSexk2GvGD+AiDaK6+FKiW042nvtSHCF6w
 TLOOL1akqRCnKzvBc2u9KUgEDmx7USYA3YPma0AsAWl9ydIEi9keBpyOSafYS7FAgjaK
 wCyw==
X-Gm-Message-State: AOAM533HAXInqks2BlPx5lmqqU0/Sa9hXt/TAycTAEdcS84cc9TXci6k
 Rspck6iTvTuxImDZo9vkXgLNfA==
X-Google-Smtp-Source: ABdhPJwi3UCWqDRzbw0twb3y0PqMSgoZT34LfA5l+Is6ZBAx7rSxR4eAqACD25yJRvTSehq5JkprCQ==
X-Received: by 2002:a7b:c449:: with SMTP id l9mr9189148wmi.158.1611848075816; 
 Thu, 28 Jan 2021 07:34:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i59sm7716088wri.3.2021.01.28.07.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:34:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9C4D1FF7E;
 Thu, 28 Jan 2021 15:34:33 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-21-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 20/23] tcg/tci: Use g_assert_not_reached
Date: Thu, 28 Jan 2021 15:34:29 +0000
In-reply-to: <20210128082331.196801-21-richard.henderson@linaro.org>
Message-ID: <87pn1pulbq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Three TODO instances are never happen cases.
> Other uses of tcg_abort are also indicating unreachable cases.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

