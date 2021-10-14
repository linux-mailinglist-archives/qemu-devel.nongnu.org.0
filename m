Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5127942D63D
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:38:29 +0200 (CEST)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxC0-0003w0-E5
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1max8v-0008Ke-9S
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:35:21 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1max8r-0003dP-Kr
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:35:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id t2so17421296wrb.8
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6Vm1RGvhG2/FC0aP0m/g5zGp4nydSL3tFdeu238UjRI=;
 b=SxKw+YFbBfBwtqbHMJ5wixTssaulnrTDqjdbJMxFloKq7C2TWsdSe2SFwscM2MXFyx
 IXWbqfR0PdHhAfpBhYfp3MedBErupJmYoYnTPmX0Ddtrid5mZMJlNoSgGoqpXRjL/sCP
 IJoSsxuvevr0Q4Bjkcs+DwuQEX84RHewm71XDbAHd8yPFzQcSR5cow+kvF2a9fZEZThV
 Uf9cTCXWgYx7YcNDf41QW4dkQN0Sypv0t1plu6v79JB+3xg7XcVGu3mnhhd+6CQGU1IU
 iuEwTNZfLOFXgb7l9TaBx+rdhYY9LZ3Ol1CC90IvvHwsfxspxWk+4YGU6z60biQIlSNg
 Xhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6Vm1RGvhG2/FC0aP0m/g5zGp4nydSL3tFdeu238UjRI=;
 b=LGN0ob4FX9E6a4csGqPLGDYQX1rJkXuGnf0QWxI0I9vX+3gzAjHnTLOLsdm/5wTzHP
 Wm1S/yoYYzWVslle+OldLxI4d1oWUk6Q29m6gk/yeldLhZUPCL6K2cZrNg8KAjGjCojk
 mhoMxRdvl8ekPHcphdSA7lO3fIR+8i7Cz4D65sSxutOvVOBxfdzFzX4kTteYzzWYG2Xv
 xmBws+VKQ5HBC+8GoeX1QcS3cIZ3y6fv2L8DYUA+xrpitLHqOs3wEROgX/mqqpM765IY
 Jm8WFFXQ20Ys8mPW/p3Pkka8VEh6eApxNTsFXAuusDJi8xqtyeT/Xqw47WUtuRZWGLju
 Q2vA==
X-Gm-Message-State: AOAM532Py/LGfsb1SDdODfBfaatxwMsNyAJYWnH1aYm72328mV6HE24y
 sqxnscjTd9gZJwAqIFFEYtiUgQ==
X-Google-Smtp-Source: ABdhPJxKOKBRwdf3Gdvd4cHxy5R/Hph3N4SdrUZ1We/Zim126FfEtLHcODAGjNHJj4G2WINwKFc17g==
X-Received: by 2002:adf:bb8d:: with SMTP id q13mr5430614wrg.327.1634204111559; 
 Thu, 14 Oct 2021 02:35:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m4sm2092578wrz.45.2021.10.14.02.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:35:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38ADA1FF96;
 Thu, 14 Oct 2021 10:35:10 +0100 (BST)
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-3-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/2] tests/docker: Remove fedora-i386-cross from
 DOCKER_PARTIAL_IMAGES
Date: Thu, 14 Oct 2021 10:35:05 +0100
In-reply-to: <20211001153347.1736014-3-richard.henderson@linaro.org>
Message-ID: <87mtncuey9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: marex@denx.de, Thomas Huth <thuth@redhat.com>, crwulff@gmail.com,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The image was upgraded to a full image in ee381b7fe146.
> This makes it possible to use docker-test@image syntax
> with this container.
>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

