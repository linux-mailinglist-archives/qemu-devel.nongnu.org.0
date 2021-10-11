Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6942428A56
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 12:03:09 +0200 (CEST)
Received: from localhost ([::1]:48802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZs9E-0002dG-7G
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 06:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZs2L-0005Hg-56
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:56:01 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:44867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZs2J-0007rc-P9
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 05:56:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id e3so20673151wrc.11
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 02:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=9BZ0g+w/DOUssDhTTpNmFtzwfZxRzadAkLeDeuXDEMQ=;
 b=hJ8YvTCDDvArN97v8GJk/75Z7H3q4mtYefd7+8XJTKh0JUR5kSd4VFO66O0rjxNRMz
 61RwB/CDBE6Mnq3ByUemHQr1DpnNgxBRNOWVrj+ztzbv9JOZm5V9ziFN5rtH6VwlB+rC
 e54G72ODdKS5tgq1Sxh2J32Ukym1YM1qBPWZFFZ5R9PNbcjLx63fOQchzy5V1uCgE3PR
 6WBDqbUNkcVFwgwx54swDwJA4igqfSwAkZ/z+1StLgRTX43o6mizT+qWL+7g08sVEC9g
 lgUTIaOjZLp/PfEKCDBQpeGtjqK0pk6muVvx8hWRLSslG0MstFypJBz5SY0EwD5MOWFm
 dPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=9BZ0g+w/DOUssDhTTpNmFtzwfZxRzadAkLeDeuXDEMQ=;
 b=ZXKsn5aYUmIQgHPHT+mdlXWCa0SlPRiaRyP4kC26O9/efFiQ4b8k48yDnmSe3jVVHn
 WAqV5G4dvhra34OkTazW8oV0KW50SziptUSwUyKPxBpFqOTgl2LpYMc1bxhQrXlq+AjQ
 3+GMkdLbzkKwawLAGsa6zRX058y4veynFVcfuyBJ8efKY4hmZQXIRpZdV8mm6I2obkJ8
 lnrNBfCwrsnkuusCAQiE951XOmqCa5q6HDvCNfCDETKPnr1p7uUQPOIuMva14taaWDFj
 P8xIVLXaFdDf6vbtpQjnMm1KIPYsE2GqI4/J87hJD2db/kzJ50alQwSaByaILhr1fXJP
 LhCw==
X-Gm-Message-State: AOAM533R8N7+8O3StHF2ofuqXVmiSfgw4k9v4wOsjapp8Pmlsg6TIkwF
 eNVMXAKRvjlZg3j1eGcX5HMvaA==
X-Google-Smtp-Source: ABdhPJwQ1igSECRaHFSKAhNWvM1CWprRL7l3Dc/vmCVXdtawhBZlhq931meNcXYVH60YE/8Dhm1IOA==
X-Received: by 2002:a05:600c:4ba9:: with SMTP id
 e41mr7775063wmp.70.1633946156590; 
 Mon, 11 Oct 2021 02:55:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z133sm21421796wmc.45.2021.10.11.02.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 02:55:55 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1890B1FF96;
 Mon, 11 Oct 2021 10:55:55 +0100 (BST)
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/8] accel/tcg: Split out g2h_tlbe
Date: Mon, 11 Oct 2021 10:55:50 +0100
In-reply-to: <20211010174401.141339-3-richard.henderson@linaro.org>
Message-ID: <87fst7yjf8.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: git@xen0n.name, Alistair.Francis@wdc.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Create a new function to combine a CPUTLBEntry addend
> with the guest address to form a host address.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

