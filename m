Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAEC5BED48
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:03:18 +0200 (CEST)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiWZ-0008SP-KV
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeWf-0000PH-Uz
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:47:06 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:36768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeWe-0000xb-Gi
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:47:05 -0400
Received: by mail-ej1-x636.google.com with SMTP id 13so6777092ejn.3
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=N9KvHJ2UuOpNu4tSSK6u1AfaR49RMbabaXRqo5WP64g=;
 b=Nh0+/ijN7v13QU63EJbG1v6magZtdM01hR4m3rQ+1PQlYsbYfm7hVBIU1Z/kVsCFtR
 t3mBiTO9F4TzujkNesH6gzwgdGGq0wvrYcV80j+nvv+4j6SrNpTVt0wmU7tj2j0Vf1wr
 a++sJ4BWfi28z4+X56BsBZi72NFCtrp2QP10/RGAvb6jPvsYiDsgqQh/iCYwAD4xQIzV
 dc9sKVixMugeh6eT9er+GfsQn2wqOnGhdqNuEmoRKRx+OV8LWlLwFVrLbUVbU6pdbQvx
 BVV+oBelQOkctMM4JDw5YalIdcrG9FuecVppiI5RrjYN8b3rGwOu6wy7E1QR3Ir6Vm0e
 1pkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N9KvHJ2UuOpNu4tSSK6u1AfaR49RMbabaXRqo5WP64g=;
 b=SmoA/W8SE/0SHzFBde4uT8wpRyPztGg2VBkJ3UhU1zDsv93rIo0utxJ48e+lCkjcEI
 QPkJFfbKUlj+X+Eo7K5MFwMoucPXd/jE7c+MChJJeyQwsjq5EENfn83u9iIN0Z2spQGd
 0qCEqfBSPHiDGP2Opik0wA32avlzMjOzEByuoSIYFoo8B/yWt/HrwKGm3iMwIX1YAVir
 59hJmYXWAFGCAtg+w2Vk6wGpE5OzOrdFRVYguAIR4n63kp2MqyO+SbsoixfiYW7g/nel
 YgCrLuJKGkY7cHuz48mIoW/HTRIZpC1RQcW3Z+nfCfho7CuGJAoUvZ4jUq7F0B4hg64/
 aEBg==
X-Gm-Message-State: ACrzQf27G7+zxNditWo1kDtSlwDsZ9DdAgEoif4Yr/SGdKPVPg783zDu
 cpz275/fhCbq+TUkdnl0NpRtjRQI/MgxceL4BWHHT2pPkE0=
X-Google-Smtp-Source: AMsMyM78XJrg2ro/xZBLvYDKUBsrpnPy/V2ktgelo0na591prXsF9fIfePTuspNJ0xdY5gNIPW21n9KesnGxSvIxM3M=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr16714747ejc.619.1663685223031; Tue, 20
 Sep 2022 07:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-17-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:46:49 +0100
Message-ID: <CAFEAcA9piGJZe9cmP1gUAJZRrh+2xbGJ-M0kr5sJP5LcYLkDXg@mail.gmail.com>
Subject: Re: [PATCH v2 16/66] target/arm: Add is_secure parameter to
 pmsav7_use_background_region
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Aug 2022 at 16:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from pmsav7_use_background_region,
> using the new parameter instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

