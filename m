Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C61F3B601A
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 16:20:05 +0200 (CEST)
Received: from localhost ([::1]:53096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxs7I-00013V-9m
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 10:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxs4d-0006TD-DK
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:17:19 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxs4b-0006L5-KG
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 10:17:18 -0400
Received: by mail-ej1-x632.google.com with SMTP id l24so948482ejq.11
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZP3HW+bfK9KA1dTEiG0+ba2NGY3I/BgQfFlh/4iL3Do=;
 b=k+NVSQDxBEmPjTglea/vS+W3avHKVpa79rZifGiKYkwLERxSXSnTuQ95NFT4F8vFSq
 mOAdmOBwR1pSH3fCx1HonpZ8mYONCQb6AHQCaRjmjt9ZMcKq76EOL+SrZ3uSzpcTNnPJ
 701USojE1C/D1mly6HdzZnK9x7y2PpPvfRIjcdosrETTbgeq8+FskR6dd/GQV5njKk8U
 9N7SKbnCPrki9xhtgLqC+35FbjjMP/1QJeNrH1rVrauCbGGX7w4EMcIKr33ZcwJlancq
 ejy3W4qpgZ6nuJU5PQjYRqu2G7nNqGwiVzMhhc1LOo6e5Ca3Z149yl53ZvG6V6lxw3Cy
 RWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZP3HW+bfK9KA1dTEiG0+ba2NGY3I/BgQfFlh/4iL3Do=;
 b=VWkNR+IsL9tP474+O+7pszctHcEIbqVPA2rhBgHBldHabjKEIdcq2+FKXgH7WB/uEm
 A2/sEkr0k3OWTu6rmvETOCrxjbDS/di4gUde24F/4YxlKbroEZM6fg8F7ZNH4duQxWin
 iaT6VeWLq0RwwAjTcVluHkslA3qfEZ9dQrAk+BBHBVfdXKqhZFUKbIUw3GvJxNxzAfuH
 d0CtTSOcAJCAW/ClVLOrSCP200o3GXFMEFxssDct3faEX2FIOPcJcQ+TrG69d2MRI+qI
 5eNkqcXkgb/Hly0heBE03uhHPaIJbnp5s/FLyClpsi94ttKwts48geTsen8VAgfK3JTS
 tUbg==
X-Gm-Message-State: AOAM533zEZQEgaYzHKmwHDRpEdlCCs+SNwgZ/Du6EfOSoQmBHCZnJV8E
 PZbuk8o6riTQYKqlO5I7L2vA1iULlFdrwYtmtV3B/g==
X-Google-Smtp-Source: ABdhPJw4OzcHVg8kAPF75IxLvQbRd0EGc+A3O24P7YJ9FS5llC47PDBnaBmpRhkYPmAHpRE8deLI909KgmK3FIaSmWI=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr24117353ejy.407.1624889835530; 
 Mon, 28 Jun 2021 07:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-4-richard.henderson@linaro.org>
In-Reply-To: <20210626063631.2411938-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 15:16:38 +0100
Message-ID: <CAFEAcA9NFPPU--k8Fb1nThOadqA7vgZ-5xV9WjkeWF2xXCRyhA@mail.gmail.com>
Subject: Re: [PATCH v3 03/29] tcg/aarch64: Merge tcg_out_rev{16,32,64}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 26 Jun 2021 at 07:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass in the input and output size.  We currently use 3 of the 5
> possible combinations; the others may be used by new tcg opcodes.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 42 ++++++++++++++----------------------
>  1 file changed, 16 insertions(+), 26 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

