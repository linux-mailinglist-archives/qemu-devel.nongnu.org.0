Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C44A72D1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 15:16:25 +0100 (CET)
Received: from localhost ([::1]:50572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFGQq-0006e8-Iw
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 09:16:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGDy-0004Yt-Cx
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:03:06 -0500
Received: from [2a00:1450:4864:20::42c] (port=43625
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGDs-00015k-NK
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:03:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v13so38480353wrv.10
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 06:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=A5DURNHSlCbMgBnyOrZ4zDdkMVmhPWbQPXerOfAah/0=;
 b=REeD6HnDVPEL74gvqi6hfDpLa3CYpDjhuf2EbrlZD346iCcpaEgO1HyNfVWBC42PSW
 UFB5zn8TU7U4J4h93QHHH+WtNqR+Y+3RH1BUjcWLkjribIvXEaE42UAijzppDk10LtIY
 tqdpJ4x0lKPsjX8ADub0pgPfXu5r7gVC/9P37ax5lNo936ksjshkMK0aVmXYo9nd3Vxh
 f6KrFbJiPrYB6OstuIWwsC17Xdeff/ue13zJJ7DQH68jjKQP8acQkd+dQPkm/otN1dVL
 gT8okKDjmVhozor5qT+CfFibm9Ox5lnfbJMZs/A7dnJ1oFHDEMSkYODO4/gc6+enlhg7
 Mdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=A5DURNHSlCbMgBnyOrZ4zDdkMVmhPWbQPXerOfAah/0=;
 b=JS1ENXbFg8EZ71A0I+73/ft8VHj9DpDWoCqJJI9D7ju9V0qOOGlo7eHluljdTkdR65
 Ms13jqKia/vxOPv/2WD88bvZ4W0U+AD+KvnZgkU2iR16nWUa6atUVly8uNINluVWSJyT
 9vp+6pfNnQa74NCKkEgvmUnK0FMyjvxZ/erzyA4UN0XjQA6N3C1SwHvcKxFsET0mibOM
 ENmbYjGWOWYuqb8ZjFfkQhambbUPQGvK4qJbCkUxnVrDr4HjUuAZ2ooFJMhvgAvYbtVb
 PVQz9K2yqj3vs6LOpL68CKS5G59j9CKu4SWSayWFHVPyNdt52+rxHDMb71KJLRyyjeoc
 JHjw==
X-Gm-Message-State: AOAM53206B0LJl7y4kJS4FCT38EcfQ4uUu/irKTycPO0hHAN70xshuhu
 BzcVYhdgMUXc9dnZ85IuF73KHQ==
X-Google-Smtp-Source: ABdhPJx1LmSmNmPyBh5skY9sLKdMMw6qgk6vBox5LxqXm7uthw6UOCQmVOi5ULvbo8Z7mFmiYrxwcQ==
X-Received: by 2002:adf:d1c6:: with SMTP id b6mr13194893wrd.669.1643810578267; 
 Wed, 02 Feb 2022 06:02:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n14sm18054056wri.75.2022.02.02.06.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 06:02:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68D9D1FFB7;
 Wed,  2 Feb 2022 14:02:56 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-11-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 10/20] tcg/i386: Implement avx512 immediate sari shift
Date: Wed, 02 Feb 2022 14:02:50 +0000
In-reply-to: <20211218194250.247633-11-richard.henderson@linaro.org>
Message-ID: <871r0lwelr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

> AVX512 has VPSRAQ with immediate operand, in the same form as
> with AVX, but requires EVEX encoding and W1.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

