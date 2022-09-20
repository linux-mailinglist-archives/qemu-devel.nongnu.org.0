Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8825A5BECFA
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 20:47:45 +0200 (CEST)
Received: from localhost ([::1]:47994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaiHX-0005NB-SI
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 14:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeTq-0004uV-Dz
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:44:12 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:33484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeTo-0000QX-QH
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:44:10 -0400
Received: by mail-ed1-x52a.google.com with SMTP id b35so4272842edf.0
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=sIGndOLger40GjvWKmega4cCEBRPt+S3y/MvazD3NaU=;
 b=n8UHAuw/sorsvy65Mz9bnBc7SQSIwSswUnNRHq+BE2I8IXnTajeWR8/nTgA6jnXf+5
 egAp8lsR1s7AfntAFmj9FQOiwdet0X7mWKZ26REPq3N/YcllbwpUGbk1hvFnCq8+9uEL
 kJ6t7RRZcVi/UYlhbZNY1+bhDMh1faOj0/QP7fzg2ibBm/4bqzCxZvtp8NEVCn33jOCm
 QR6ooCKBs6/4evGGJ3UfLN0qocpiLug25VQyrVlgd9aFnj0HpoWwC6Mn5Q/TY1Qv63DY
 BO8aapAnX3VzoNi7qZsRSe7OK9MPW44jq4mzVZu8NK/z/Qf37jXHLroD2rRfvJy5OQwy
 v2HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=sIGndOLger40GjvWKmega4cCEBRPt+S3y/MvazD3NaU=;
 b=zuchwaBt1stGT1OFbId1Od7DrtL9rYlIyPtYo6rFQ3QSwcE5ceDmcjy53G+ryKlTk+
 VQ25g1z/5rN/6I7L8Ynpf4Z0zMhUTkeYRC2wkZ/DmWoEk6lvC4YYKZ4SzldjDZYh61A/
 Ymf1EHVOWl7eL09zDc0iqOnWu+74H6mI1nPG3C+6OLpVCKuRb/b7xr5buIK/tcnLXKZw
 xYl9jwbbGJEfRyZ8DFlFvCjajKbBJj/v/Rp36PY8W9p0mgx9rW5wUyZI9KmAtcudtddp
 p87710k5NpR3VjMSlI6wm2TlNkmWUWVcSgcGuSj8kJj8Zv27kDBAbb/yKSnUAOqy9zdO
 la+A==
X-Gm-Message-State: ACrzQf1gsZxkpFpBnVcpMDAgxhiLb/c/SrWJtMSghN++dd9VGIYjqTT1
 zkt2OYnUDiaytzzu4tqqeS2xfRiDsFQ0jpThIVnHd2NeQo4=
X-Google-Smtp-Source: AMsMyM7p7lfIbQvt6seA1VezTL70wUR6ZC0wD0pTNOvDYw/9GUUfxcoyCOvxuiKF9u9Kzrr0+gJp12HEBFZLeKB30kY=
X-Received: by 2002:a05:6402:11d4:b0:452:a97c:cd36 with SMTP id
 j20-20020a05640211d400b00452a97ccd36mr20779715edw.53.1663685045724; Tue, 20
 Sep 2022 07:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-13-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:43:54 +0100
Message-ID: <CAFEAcA8sihpyZo+YFK-YSScM7fmfhe98f-+4Y7yK4WvfjRrjbg@mail.gmail.com>
Subject: Re: [PATCH v2 12/66] target/arm: Add secure parameter to
 pmsav8_mpu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 22 Aug 2022 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from pmsav8_mpu_lookup,
> passing the new parameter to the lookup instead.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

