Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93439E79A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 21:39:29 +0200 (CEST)
Received: from localhost ([::1]:60622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqL5t-0006N2-0w
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 15:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqL4e-000534-9n
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:38:13 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqL4b-0005Ej-S5
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 15:38:11 -0400
Received: by mail-wr1-x433.google.com with SMTP id z8so18867727wrp.12
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 12:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jwzinfTO4lfFDUVnW0Smnnlxm9fGMekxeI5wBEJkEbA=;
 b=FaC2baEXTNh+GKgvxZPd3zmj9QUWBJtuStoPLV/F1bI2XSCX0wfsfdC4/PmHcvHQN3
 TKHghUlNf2O8cJJH5JmDI8fpfVwSpocq2O2Dk9yW9EeBvdupERSLy3WQ31bNjtPunNyl
 N/p5Xedn2InMZEsfNysIenuydZ6o/wtgCu5H74yjjT5DA/U7P9O376hu+Zn6tXQrTZMn
 RnRLEhKS53ktXecDzEnE/BRrRGaw/8d2TaDMR7NZ5eSOM6kh/kkrU44K/THHCmvfFBYf
 7cMtNZ2j2rtg/ahAalE9IS1av3NF4lUtmOVUT4mMUIQZTYKGWC+7oYNu+WM73ktoJnO4
 F6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jwzinfTO4lfFDUVnW0Smnnlxm9fGMekxeI5wBEJkEbA=;
 b=j2Ksa+0hINPnB97rtWwF17i1feFNSOaBFXQE2qvk6eHQmVAdeB94rlkKdDdEtduXgh
 qVWhvTeeE6Z+IZTKgJ7L5ArQ9PgiV9wQ+LkvFPiHJ7EFWKzQCM/cb9D9zflzKey8vjA1
 JNWjv5PECoRsz1Wso+s3AtR6OOTRXnx13rDqZ+i9sMmceSmVtCDjQpWcWT27bm/B53eW
 SxRe72iQM5mV9VWmnhZ+fynsY7C17fXJ5eKSB5i95Tt0KRxLlDvEGrRQqpNAzJg8LGLa
 OZ8H7xnTXIu0wC6bogvVatjwYv+fVtTvjn2f61GnB7DX4gOoOmVHYGbfCP/78GH8hiuW
 nHmA==
X-Gm-Message-State: AOAM530s+qfsv+1rOyaPj0nq4+NzBGlQg8yJD9YEcrUfeun/IstOd/ZW
 eFC4SgrL6k+Dx0U0dJKHvgvTMQ==
X-Google-Smtp-Source: ABdhPJy+UeP7WC5TLYMsCJxujbnFifC8+/eFaBz8NGINGeUWl3siMarLQgcdK5T/M2cVXS6qD1nq9w==
X-Received: by 2002:adf:de03:: with SMTP id b3mr18788341wrm.15.1623094688109; 
 Mon, 07 Jun 2021 12:38:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm484978wmm.33.2021.06.07.12.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 12:38:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0C4B1FF7E;
 Mon,  7 Jun 2021 20:38:05 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 01/28] meson: Split out tcg/meson.build
Date: Mon, 07 Jun 2021 20:38:01 +0100
In-reply-to: <20210502231844.1977630-2-richard.henderson@linaro.org>
Message-ID: <87mts1mpnm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

