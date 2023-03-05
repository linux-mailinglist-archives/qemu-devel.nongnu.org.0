Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E56AB19C
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 18:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYsOp-0005iZ-1e; Sun, 05 Mar 2023 12:43:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYsOm-0005iN-J3
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:43:52 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYsOl-0002cr-4r
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 12:43:52 -0500
Received: by mail-pl1-x62f.google.com with SMTP id p20so7764700plw.13
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 09:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678038230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VI9Ygl0uIAOTyS8+RtbqZGQaBrHsiULM5wHvTYeuXbA=;
 b=PHHg/8reQXOMx5kqNDdD1cyoINEasH7aq5NvJ4rztOnn0I5uvy/diVqYfGQ5zDrDC4
 7ARWo/0vun6R7ofuWugU+iWU3w+CsNMMDAI9wdvVaOjMA0hCKdQ7ZyMpON+oPvVykLsc
 DuqKd45dCDYa+OJi/Tp8nVHLGdyZ/TEyCqUgYcAxVx6e/h/0nWKdP1HWM/BtOiF/Uw6r
 Lztj66CPiKdGWyTEKCOydkhlzqurgiXFfCcWJbE3UHAk5R1UahkEUXFv97EvVQKFUjQI
 5zBLEFkBAHx6X9uSYTd4jPIESVh2TavHMvsiCX43P96edFVcdFNRn+7MOcADN3vhZGXD
 JhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678038230;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VI9Ygl0uIAOTyS8+RtbqZGQaBrHsiULM5wHvTYeuXbA=;
 b=kji1GhWXeCZ/ii8zoX8aKX7QH4yEHpquEGpxGTqQInncw32SVZkIKZzKY7Py20nyjI
 KlMxrWYl25zy6WiE//eBl7M6WXvqZgIg4MPcUEjS4UMH/cb/P7zEWiie1WL6cz9BJmWb
 UnJtaqHHd8M7C6xL3OKnmQwyXMU/LZOd6uta3GtFMUE1zRMJ8blG8G5r8k7JWG1dPscU
 YYZ4ycWIAYGqhH33932GdOQSkcVejXlbIEN5uVvqV4eoTx/wgC/gndVqWJxPPF5VU5Pf
 AMS+F/Vp4eH+JaTiYuWM5T5NbegeIjAhNb4fe3Hfm204ILoq23Fxj7eyXr2J/10AfRuP
 P0zA==
X-Gm-Message-State: AO0yUKUTfCfd194XZDg0jqcy/Shmgy/ZENdiWVgq/BmIC46k3UZk1d10
 L4c6XWW0lRkcSOecXIE4q3DcmgIKpzncg+nJhGxa0gZ3QDIQUf0s
X-Google-Smtp-Source: AK7set8tymoYD73Uek3JlcQdSK0+hf6JLJ+emI0q4tI2lWvn8rS0ukFPFFamUH/2gRpo4zcL1M6wSwE+TWn/mc2fLyU=
X-Received: by 2002:a17:903:1243:b0:19a:b151:eb83 with SMTP id
 u3-20020a170903124300b0019ab151eb83mr3162844plh.13.1678038229762; Sun, 05 Mar
 2023 09:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20230304181900.1097116-1-richard.henderson@linaro.org>
 <20230304181900.1097116-2-richard.henderson@linaro.org>
In-Reply-To: <20230304181900.1097116-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Mar 2023 17:43:38 +0000
Message-ID: <CAFEAcA-Ht=90ZEvGetA4j28b+xAqcqgo0PPvEyMOs3Pgwm7SCg@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] target/i386: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 4 Mar 2023 at 18:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

