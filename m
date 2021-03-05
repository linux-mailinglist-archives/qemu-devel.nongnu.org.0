Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9E32F2C8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:37:25 +0100 (CET)
Received: from localhost ([::1]:59648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFKG-000365-Ib
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhs-0000Ip-44
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhq-0003kY-LL
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id a18so2994829wrc.13
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=rVgS/TR54pyM9L6veQhr3ZwYe5Z33FDuRRCZkrfNLUk=;
 b=FEygVpesmHqRSdHtqcuN3+2yUeaoKKVn0fF5stdoCEUgtLglO/K7LNxZqc8LuQOf+l
 zjzT2gfEgt5BClAkInSUqDyezaDETlpKqdSEkPVfut+XvNqrurIHJmHQx3v47p6UM4aY
 OP85EawmW+unHIbLDl/D3LcCb7aM1lD8MCtqjLpW9qs0EbHsMd6n4T+PQfExNw5qjaPm
 Eme8mVyGZU7eM5ekz+GJ5k9pk6D/9bKHwYXnmedwvlE1+LF5iabGf0nrd/BtAZlrm3nX
 SulKkqOAL/HsJoFppFqmbN/hyxUYxxlNYszS6GXmcsdhmbHXWODRtpowsLm7YfD1mqsW
 QBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=rVgS/TR54pyM9L6veQhr3ZwYe5Z33FDuRRCZkrfNLUk=;
 b=FwyGUOkhbea8vjv5/X0yR7JAShKYB22BWnYiHTrMe/IRS5eGYccua2wQ8e/araBrQ+
 uHLKAokRPlrhzDP3nQJ8X0hbd4LU/OJbl5yE6FPk7hL2fEtVs7rJbs07FyaqKZlLYM5f
 urao10rj4TsnRsq2XmsLf4cs5Gfbt381gVKaoRWw6ln7jKKi7ti0NgyPyUL5oQu+uYuq
 lCtp6d4J3RWoLz1H1eAxc2ytSwdqtqFVXD5zy1yIVGOqOetmmaobuOpNvijmQR9mfMBy
 7DCJ11F4EwEXSVp7cxU0k/5XfH5Vcb/Lknb8RkSpAVmamo5MJOADxLg5eZswidKBnkHq
 x2xw==
X-Gm-Message-State: AOAM530aaG1DJoeCtoO74FqGvGNEhbs9L6/deCFWW/lx3KaztHVAWjEH
 CF3dXlcfH7AGxmSLbJ8yyQW15w==
X-Google-Smtp-Source: ABdhPJz7P333i3UUq1x/t9bUkhaQqpxqoo3oToEp62TIDJIUbjeIJ/p+QTAVn2aswKvPRQoFP/qFsQ==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr10652301wrx.23.1614967061345; 
 Fri, 05 Mar 2021 09:57:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm5331856wmh.39.2021.03.05.09.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:57:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E428A1FF7E;
 Fri,  5 Mar 2021 17:57:38 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-22-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 21/27] tcg/tci: Merge bswap operations
Date: Fri, 05 Mar 2021 17:57:34 +0000
In-reply-to: <20210302175741.1079851-22-richard.henderson@linaro.org>
Message-ID: <87mtvhcwkt.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This includes bswap16 and bswap32.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

