Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E4D3079CD
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:34:01 +0100 (CET)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59J2-0008Dg-8q
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:34:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59G8-0006TE-LK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:31:00 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59G3-0008JB-Cn
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:31:00 -0500
Received: by mail-wr1-x429.google.com with SMTP id s7so2830049wru.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=Sg/sf9Y/r61r76lly+s7AXtGH3F0t0cJAis6kbFaybr0eZREA12bFAAJZh+fT15NWz
 gjL8SDE0ObSdPPKMPLl+udNM7MTeN+DrcyGaFbJjl3wDdYsckqTQM9kXffAQmURQKP7x
 HVnNHLWKVniv8057WyM6VesaQq/7LO1AO3Cuwn5gNy9nnyc0biLt9WGG9cgLziiZ44GR
 /ZoqZeLgZE40fXcKQcx4zNf4iHHDNNxlrs4X3DKTq1vSNQD2tKq9+CxubrEum4xrN0u6
 z4zhpIYfawSnJozJk446djIn7xPJyVKoKOTpyeom5Vwjx/AFrGhprDC5eIWwhv8N5smp
 WATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=d5vgXZzhugC5LROC1GPd9nccwz/bFAjMNQVwKVXSdsC3xxpZWm3vdziS6T2xVch7pp
 By06xQqXU0+6/rA1bW3HrTh+tgBFg1y8lCbFnsxFX7kZILFnJp4s7crzCf9aTcA0bO9p
 EmtpdttH8Qh9Em7KT4e+qcwbrJE5o8v20ij+03Tb4H7NxSyhjyYsZFlsBPJdK0K3Ydu2
 xDaAODAq0BAQxSjYlzFNUoYGPd34eHwB7HPBZMgwEq3PspKeONC3j1t6xmQPfikzoRUl
 tX/r8cNt6pz4BsgHEDH1sfsn+R70W+JL6wQCdkzVbB29rRIzWnKZVGGhFwCeO28PbuiT
 j7vA==
X-Gm-Message-State: AOAM533ZZ0/GzwhBD2sj+Jh/KDDvnydt+mX3mzDxNrq0vr84Q/v67Ekv
 Csaj5ZollQDstcKPXvPs43ldmw==
X-Google-Smtp-Source: ABdhPJwBz2364LhoWtk2r6/zRIaeJiKW2fe0MLDBznpd9Re7eI9xnGk5F7YJRsKzw6CxlVscrLvwFA==
X-Received: by 2002:a5d:51c8:: with SMTP id n8mr12525105wrv.18.1611847853674; 
 Thu, 28 Jan 2021 07:30:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l14sm7030045wrq.87.2021.01.28.07.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:30:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8B85A1FF7E;
 Thu, 28 Jan 2021 15:30:51 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-9-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 08/23] tcg/tci: Inline tci_write_reg16 into the only caller
Date: Thu, 28 Jan 2021 15:30:47 +0000
In-reply-to: <20210128082331.196801-9-richard.henderson@linaro.org>
Message-ID: <87y2gdulhw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

