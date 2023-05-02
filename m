Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309826F4645
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:45:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrF7-0004lI-Uu; Tue, 02 May 2023 10:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrF6-0004lA-6Y
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:44:36 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrF4-0002IJ-Ka
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:44:35 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94a34a14a54so785444566b.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683038673; x=1685630673;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=BAXvzo01/9zJCNu/TStA9jNdoqlv5CkHuJqguDPq0NU=;
 b=SaXrvB0AB2KY9Q1Soc366oRRe6cAzU/JcZgq0U2fMROzPMJ2F++7CcOalK3Q1UvvqD
 zMcgcytM99HTNIMUyNYw29pk8ZwrKvsRS65y40NlXbyNmtWQPXOHAyxS/+KMIxHUKPdK
 gE1Us+KdaPZVDE0lSpI2Y6ZPF1hh083n9uRhY12Zbz0srFlYJSdcTV+7pQOdDGQh3cuv
 8Q3HC6Z9/FwkFQCvFFnBQMsA5jYqKmWl/RxqF3D0yvd5qUFWPknXd5Sy8iGfZnndY99P
 eP5kNCndXaVIROBoXDwHdQO8nE8cHyAU56Qj77TWPSf7ATnesqdJqSs+j2H37HWqYNe9
 9mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683038673; x=1685630673;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAXvzo01/9zJCNu/TStA9jNdoqlv5CkHuJqguDPq0NU=;
 b=h1mnkUp8/8Aq5URc1kVSqUBmOMo8eaqiGUAd70w1UoJgtOvCwdht+5kZm5yxWnTbmA
 MgD7KPZnBM+AAkUKC1fYOvj4PdcwJ8awvHa2OE9S6YAt9kfEOCMYa1TP6wFvXPGa/X60
 tyzE0CPxY3PprGOehlP04V4DyC5MnwmzeacByuOBe33boGNI5aHGiY0MDxCmSSnhMRoP
 czeo+EStdYQFlzXxM1uoeBi65XJEIyc/LXbxnzPUgFWYc0mnZzIs0szEZzUe3BZNqK4L
 wF+YwE1Bv973l5p4HYX83uU3n8rI+JYZ0SzamXCE23EeuCidYj7XGVtEjefsmWzOYuwO
 a80w==
X-Gm-Message-State: AC+VfDxB/tDmI4VPNUOKXcwssUhI3vgDYOwM7wVi0CF1pl/eDZY8N598
 zaH59mK4vl/3cM9oikWG5BOUjepgp6Co2zMucrbgtKl9ji6/NqbV
X-Google-Smtp-Source: ACHHUZ6Qpg4vmbDEhbpkVA9oVrfTnaBKjeMqWR+zTSsVf9drPac9zorXK24hdnFHLjmLcWZn/3vb4j4Ay5RUKsbeuQU=
X-Received: by 2002:a17:907:7245:b0:946:2fa6:3b85 with SMTP id
 ds5-20020a170907724500b009462fa63b85mr265351ejc.36.1683038672888; Tue, 02 May
 2023 07:44:32 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 15:44:21 +0100
Message-ID: <CAFEAcA_=Zp9YBcJDsCZ-UoMUyjBoG8XMkgfjS3_iGX9hWzM0=Q@mail.gmail.com>
Subject: proposed schedule for 8.1 release
To: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi; I figured we could put some dates into the proposed 8.1
schedule. Here's a starter:

2023-07-11 Soft feature freeze
2023-07-18 Hard feature freeze. Tag rc0
2023-07-25 Tag rc1
2023-08-01 Tag rc2
2023-08-08 Tag rc3
2023-08-15 Release; or tag rc4 if needed
2023-08-22 Release if we needed an rc4

(dates picked largely to ensure that we don't slip into
September)

Richard, you're doing merges, so the most important
question is whether this works for you :-)

thanks
-- PMM

