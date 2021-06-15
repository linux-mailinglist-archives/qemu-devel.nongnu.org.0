Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A53A79B6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:01:05 +0200 (CEST)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt4wR-0004J6-TC
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt4sk-0002Je-JS
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:57:14 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt4sh-0001Nd-RN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 04:57:14 -0400
Received: by mail-wr1-x42d.google.com with SMTP id y7so17410450wrh.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 01:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=Z764WhoUNzZR/2odgUFyr2Skm5bcnVy5N+S5Cv+uv0s=;
 b=hMsNMaYUH3Rq/RQH27ftkKOZZ/hMqigvc91QfkM9xTgO7YznY1WDNh5KR09YnaqYit
 /VGiJGs0Z9LdogkBgPXR1QKm9MXez+rQUNky6T0WW9+zZQtHn1peDxa3LKhdZNcg4ryw
 xgJrtNncE2RxB6a2NlLuaHRJ0RPMMX7+1s7D0Z0+G/upPaVUrxZwcUE5EZTQSlwg+p60
 s0fueHeQZOlZgKv7CNpLVlqm0TRuTE1EpoGTjxE695hW+DpbN54q85l9eiqNfPQIZRrO
 Y3XLxglbKlgu7Lc9aCuibF3rhT1qWnNj9kWJFxIhj+GlT5QXxmRbWGyo5lupjaYqe4Ft
 zjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=Z764WhoUNzZR/2odgUFyr2Skm5bcnVy5N+S5Cv+uv0s=;
 b=aPMrZxienTrFdhryQaSH1Ic49IfoeazCGipAduayoWAy5ex26aD8jY/wvZgyTtJVv6
 RkzNOpYg7W2j5kPXNOpMJDYJPiGGl7G7DB/0bYxAmeBaspJO55sURIJGEOIucbYE7MHq
 XU68YqO2A6u0bAr9o3M18P2GhZXghbof3Q1hatbV2z4mtbA9g0KQTlRtejLcu7HYDzC7
 LFE5dA88LVNK6itjZHdiVS+3d/pykG2RrdfJVLS7zM8joHd0d71cbxZVKneIUYiTBWaJ
 fje9sucsIkY3xjTaGoACIOOqAfQEtP3njQ51BcG+6Z6H92NgiZbRNayI8lagg6cIx7Mz
 PNMg==
X-Gm-Message-State: AOAM530KjlVBF9saT1J6wHThNYf1M/YcptgB2ItuXqejOqqtjd8juFLX
 PK5vUSN3m/KLPBhTb9u4LnNSMg==
X-Google-Smtp-Source: ABdhPJwsC2+LSjGv2OXbFbCycYSK2zsiHJCv27SjfuXoER0vMmZreGob9mXwmwcjHWb33dMpwCrkHQ==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr23832989wrr.10.1623747430111; 
 Tue, 15 Jun 2021 01:57:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm1586277wmi.46.2021.06.15.01.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 01:57:08 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AADD01FF7E;
 Tue, 15 Jun 2021 09:57:07 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/5] target/s390x: Expose load_psw and get_psw_mask to
 cpu.h
References: <20210615030744.1252385-1-richard.henderson@linaro.org>
 <20210615030744.1252385-2-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 09:57:07 +0100
In-Reply-To: <20210615030744.1252385-2-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 20:07:40 -0700")
Message-ID: <87wnqvijz0.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: ruixin.bao@ibm.com, jonathan.albrecht@linux.vnet.ibm.com, david@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to s390_cpu_set_psw and s390_cpu_get_psw_mask at the
> same time.  Adjust so that they compile for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

