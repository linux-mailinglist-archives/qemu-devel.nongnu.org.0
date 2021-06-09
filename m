Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842263A0FE2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 12:04:04 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqv47-0004qY-Ij
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 06:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqv2f-0002gd-2J
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:02:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqv2d-0005N8-1g
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 06:02:32 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso3868149wmi.3
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ZALrF0+IEhO4ccyMHmiZtiUfomI9pJkpyTt1cboSgEo=;
 b=Jz95XKUt1yz/iub0zK41vfLsj8j+rHHbADFryBv68FVyzFcSFccdz0CbhZ8VM2txTe
 Xh/lEDcU0Z0XgE4n2AnZ65JAP/4SWgC4KT7m453ZIZLcm+HwDGgqpq9ZRou18MEdxVlJ
 yd/DznaV0q/iBpP4b3lUlDrlN/LkPZHrO+v+WIU9P7j7crUT6YF9cQQ0aMdMy7/JfTT7
 3u9mdC6z5deAlyriFffm+FJlLOrWRcSUJfknKPv5y4+I369dmb64dd/II+aG9l9JhgEo
 fujOt6Q9lZtTuDEyAKSp1amoiBE4kEQi3e+LJlJJnB/FzQNiomflgHXr/a3H/X4iUBM3
 BwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ZALrF0+IEhO4ccyMHmiZtiUfomI9pJkpyTt1cboSgEo=;
 b=dXzSk0hOk/00frS8hL/cEAlcatvq0gHgX3PjCoiY95ZeLym9oMPTg9IoLgBu7OhaPn
 djGpFb2ws8YfAiudJq+IbEfXmyzZJ0TZbR5Z79qEjfr+eTwl1bEcmuC4UD3IpU/gvr1A
 lST8yJjeKm0pHXcciLSasRVMgRDKW5y0dhY4NUp9aIPK1pdigNGp4+WOTn8xzKgiqjsL
 8VzqAlWgnJcrgZis6oOuafPI0GvO3H7ubsp99iRH4EHld2LxcFHWsAWQYwOtTU6UXvqY
 639O6nCAIUvsDclsjouvdzim8tnMJiR4FxanITTQ9M3LgZEHVO6edvZIEGqQ1VZEe08r
 e7+Q==
X-Gm-Message-State: AOAM5334RuhonJudQSXiGG1ZJUataq8XNpEPycKNPh1v6TtyWkcN1qWl
 Ime8MNJaBrl1OsRWeRpdGGe3KTb4Nb/YYg==
X-Google-Smtp-Source: ABdhPJzH7TbQyOdAe5ESBbaUeB2EkyxZZ3mX1a3HDvuScZ2ZGJrvjS9WogOP3PUSjJVIKd0J/2oG1Q==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr26426955wmc.142.1623232949642; 
 Wed, 09 Jun 2021 03:02:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t14sm22226640wra.60.2021.06.09.03.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:02:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BB44C1FF7E;
 Wed,  9 Jun 2021 11:02:27 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-20-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 19/28] tcg: Tidy split_cross_256mb
Date: Wed, 09 Jun 2021 11:01:47 +0100
In-reply-to: <20210502231844.1977630-20-richard.henderson@linaro.org>
Message-ID: <87sg1rjqz0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Return output buffer and size via output pointer arguments,
> rather than returning size via tcg_ctx->code_gen_buffer_size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This is giving off string "lipstick on a pig" energy but given it's to
work around mips foibles:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

