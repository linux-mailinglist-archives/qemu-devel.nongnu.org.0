Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAAD324D44
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:55:13 +0100 (CET)
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDMU-0008Lj-P7
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFDLG-0007lm-II
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:53:54 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:42921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFDL8-0003oe-A7
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:53:54 -0500
Received: by mail-wr1-x42b.google.com with SMTP id r3so4570829wro.9
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 01:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=IBPItdOoqc0V7VCQ9KVrOOlZAete9p6Yxfi3Fk836RU=;
 b=OQ2tUCRC1UuAGnrjdLfAu1IsB7t+st+/jGjE+Q6YGS/cUZz7TxX4X6WCqKokmeGLJy
 Wm62A9wrJHjoWOAW1IUXYw0OGiH5YCwht+8Fpgq4U30wla1m60GHpWttFvLtpCPl+ZR1
 67HMfnnGxG1o4YalOTc1oI7PYTVeslyMy8W+vNGjfh8V2R0+blQjIw2eBbPfaWlIitYY
 xXtocpr8nPisGEtiytP2BHFVRAAg3R0qGTpehecAI4r9XEG4gBYBPVg3SN42a0QufQZ/
 GzFC+3oeZav9dkcEJgyTHhEKNEtQbO0ac/ucviggrleCafeQkKStXofFg8EaUvK3DdIQ
 xBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=IBPItdOoqc0V7VCQ9KVrOOlZAete9p6Yxfi3Fk836RU=;
 b=UJmpJmICg/a6gDU+ogEnTI3asM9bbTpNo5u0cwuae9ek7FZzyIF0eL7BXC5Tluwz/f
 14MsHRjESd2EbPm/d/hdv3M2aZSPFdeGvZzfyC0um9LMsuNhUjriAQAK2K6rIdWHhjmp
 1MT2Z26VfcT2kF1swVbDCRERW9GY+7jI4BnkLs1Gy4TWciqbGnNDbymwZDfOVzU5Cer6
 HsZps6Zh+Uajn/zzfwoprvEqzGXPcbrlcPspllK/L2iXs6eZ+MA6YiG6Fu4ZF/yoIisJ
 oXCPowJoUNgLxltn9J+Aw8JH6u8rd76pPyqSejiFPS9EOMHYPEc1dwDtbsKEJ6Klmmrn
 f21Q==
X-Gm-Message-State: AOAM530eVyqM4CFm9Baer/HN0Ajm7XVieXejfffeFpi6HyRVAeigfhnt
 8gWhxtfT2gY4mWe+HT3M9+eyJQ==
X-Google-Smtp-Source: ABdhPJyZwI44L8b4jcmQrdkwCB8k2IEqDi5bxisO/4M6OCYz1EZv8QeThphA9q7dx9oGKCEgyB7SPg==
X-Received: by 2002:a5d:644d:: with SMTP id d13mr2569503wrw.191.1614246823957; 
 Thu, 25 Feb 2021 01:53:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z2sm6951654wml.30.2021.02.25.01.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 01:53:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C1F21FF7E;
 Thu, 25 Feb 2021 09:53:42 +0000 (GMT)
References: <20210224230532.276878-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] target/arm: Speed up aarch64 TBL/TBX
Date: Thu, 25 Feb 2021 09:52:51 +0000
In-reply-to: <20210224230532.276878-1-richard.henderson@linaro.org>
Message-ID: <874ki0bhi1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Always perform one call instead of two for 16-byte operands.
> Use byte loads/stores directly into the vector register file
> instead of extractions and deposits to a 64-bit local variable.
>
> In order to easily receive pointers into the vector register file,
> convert the helper to the gvec out-of-line signature.  Move the
> helper into vec_helper.c, where it can make use of H1 and clear_tail.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Looked marginally slower on the (1!) run I did but probably in the noise
and the generated code looks nicer.

--=20
Alex Benn=C3=A9e

