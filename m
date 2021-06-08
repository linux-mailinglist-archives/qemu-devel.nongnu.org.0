Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF04739F1A9
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:06:25 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqXgm-0008Rd-6l
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqXfV-0007iT-Il
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:05:05 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqXfT-0004Nu-Q6
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:05:05 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso1329629wms.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9vMb6DR0i+qH9GZqyh6Ysod18e75ENl6+aq1LYsvr/k=;
 b=IZpXu1n7CtKiM2Go5O5Q6asxv3smpo/a3fmD3vZ4K5HIynuoWkaivxpECgIaglXm5u
 /unnZ/GvsI1pHRMcpzKzqv+ca2jU6y+AjXyfYwi1eTQfWAvRPMLjl2tWcM5swwwfjw1/
 SmnfOu11/MIN5N/XufTeAn75yAZZxpITGAB16sh7k6u4ikQrW/XCMI2BpVJpbNjQLwkI
 GpVzU4NNSB3N95KsSEvUQnem/C1Q8VUDvsMTdtbu5NTPYkR5TnhW0DXApn2TjSGZNWoL
 2+JMs0tPKkxkdHi0MBNXr6axuVur9+/PCRiuvaSEIIT+xPdO3fwnMc8EVniFMJdhJqy8
 2fPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9vMb6DR0i+qH9GZqyh6Ysod18e75ENl6+aq1LYsvr/k=;
 b=LEstUTNWu7W6SHJuQQz/dfj37zuKjb8kMmgqk6s8QF2er7axvZ5bOsZCoaYNIT9Eo5
 sBsvOWjuoPpytOe60aCgkuNKBnr+2bq8JVth5EOu9/DC+DYVKbHORXgbsaUIVKeIyCCG
 Z9fV42SzaTO1al8F4QCOAq2eKfjYpmZRAhpQKaVObLAHqnIAiBp3Heyp9ajSo9v/xYxX
 XDB2AbBaCUAvEr8gtaCW5rp8Lj/BTAGV+NxydFZ2vDirt7Wcj6Hz1QgoXMcwlqICM3j2
 cEVMmQLyWZUFE475hAA2BU9XSfDNn0SlpcPk2qyPmLSudNHl8jHaAfGuBoPE2aMo3/Mk
 fw2w==
X-Gm-Message-State: AOAM533Zb8yZqVVH5mJhW7yolxewX+MkU6v5MBvRlmVjZaS+fktobCUp
 /0ujBMbcsYM9QNReLMK3Hh9Za+/DyaJfyQ==
X-Google-Smtp-Source: ABdhPJwLGXaFRelCw9mMEqeEJWHH9fMDNOWWeABPTBkfBl04kW+0BZobCM4GOTwl+KnJV1iuDoq02A==
X-Received: by 2002:a1c:5418:: with SMTP id i24mr21234529wmb.1.1623143102117; 
 Tue, 08 Jun 2021 02:05:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n12sm19480320wrs.19.2021.06.08.02.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:05:01 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 80B961FF7E;
 Tue,  8 Jun 2021 10:05:00 +0100 (BST)
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-4-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 03/28] tcg: Re-order tcg_region_init vs
 tcg_prologue_init
Date: Tue, 08 Jun 2021 10:04:48 +0100
In-reply-to: <20210502231844.1977630-4-richard.henderson@linaro.org>
Message-ID: <87h7i8n2v7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> Instead of delaying tcg_region_init until after tcg_prologue_init
> is complete, do tcg_region_init first and let tcg_prologue_init
> shrink the first region by the size of the generated prologue.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e

