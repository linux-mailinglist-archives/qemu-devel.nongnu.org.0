Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B74A4A7489
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 16:24:01 +0100 (CET)
Received: from localhost ([::1]:53828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFHUG-0002ec-BS
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 10:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGcL-0007Ib-9I
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:28:17 -0500
Received: from [2a00:1450:4864:20::635] (port=40470
 helo=mail-ej1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFGcD-0002CL-86
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 09:28:16 -0500
Received: by mail-ej1-x635.google.com with SMTP id p15so66075530ejc.7
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 06:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=RuXnq7tkVa+CVgC5EszKvt7PaDj6mn9ujF9ckd2R8Ro=;
 b=gBEx2l31DBiYattUh4dGU9+gARlvfZdwqERKDqNRsqKs1cPDb9LZFDVfPpHuKAFWpy
 hh/OJsrDsfZjZNHujmip2qv0K+0RPT4J8eF6gz80tYxYLXtDeChPDfkBKS+qmJK6SW9x
 KiIjQS7M7++pRdKqPAI3xUwG8B/MwvnPlHYhdul34boP57sT2CK3inSeLSuFv0j74SxH
 8g9EkFsStCP73iyjw49lNqK2JWC3I0k+zcIA725aLQ8b3ZTlA0jPdgSCZSD/EeweUsEv
 corrYkHEifDxwKMs+DOno8vufEfYXZWohkvmFhzUrVWbfLD9lFNTrtXwXL77PSSJnOo7
 OhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=RuXnq7tkVa+CVgC5EszKvt7PaDj6mn9ujF9ckd2R8Ro=;
 b=oPqMjtpqRgIyWVn1HeiiDKb2OxccDigT5zpavh9P8028gor4CXkfJsM8+NeyPUBKRf
 GOVSUU9z6w3kjsQIppuH7jMqebfoJjaA8XkT19Y22PeKIrrw/5hEht90k+tXkO5mWrtR
 SwwK655QiY4FR+qfQ4rk9lPOUeyF+SmhnloRlXKxt+TuuEuOr0iR7nfK89XrM5T5jMkT
 t+bS8HxH+oG0gGh0izSQq/lIqj4cQdixB2j+Of6+Is2Br4o8fhcsZS/pa+RW1xwKW2Ce
 7FOsUGmL6yVg/B0rldeb9Jea6Cv+r8HEakv8OrGP8skvTjWNGV65muFQKkXfkuUM5YRE
 bvVw==
X-Gm-Message-State: AOAM530aqZ4IhSH3L5w6I4Hz41XaVsSwrQPwwjWBrhUJ2Vuh0pf0qSgJ
 TcN44vRtK++FOpLaYhWf1gYzTw==
X-Google-Smtp-Source: ABdhPJy0NKAblCAKiJ0kKiXk1g4b2gZRwEUSxC8NVwAQFXdPWc09LCsx8RBeU3die5Jhs/o7NgHN9A==
X-Received: by 2002:a17:906:99c1:: with SMTP id
 s1mr21739730ejn.298.1643812087370; 
 Wed, 02 Feb 2022 06:28:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i14sm3710880ejp.181.2022.02.02.06.28.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 06:28:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D31E1FFB7;
 Wed,  2 Feb 2022 14:28:05 +0000 (GMT)
References: <20211218194250.247633-1-richard.henderson@linaro.org>
 <20211218194250.247633-14-richard.henderson@linaro.org>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 13/20] tcg/i386: Support avx512vbmi2 vector shift-double
 instructions
Date: Wed, 02 Feb 2022 14:28:00 +0000
In-reply-to: <20211218194250.247633-14-richard.henderson@linaro.org>
Message-ID: <87o83puyve.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::635
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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

> We will use VPSHLD, VPSHLDV and VPSHRDV for 16-bit rotates.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

