Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7927738FFC5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:09:06 +0200 (CEST)
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUvo-0001Y0-2d
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUtg-0006ug-Ur
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:06:52 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:53909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUtf-0008Cm-Dj
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:06:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id h3so3750096wmq.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WE154O+tx7xDFpWamMMUYzvdGzWVYn7+SPnIxWoixkc=;
 b=xAByJbodRkJi6ABwUbdenkI2QuyI/QJl4s3ijZyFO+9BI6ZhmAeLLGHAJEn0aC9KCM
 F5XqkkjrRMZRoGVIAwXpWNco+Lqe2J8iHyrxDKv0Nz0yZQj4yjSy1U9YjHmAJkw58Lmg
 FXvDcT3C2PCC+NuMIwyMwUtuLhKRd5faVCL/nyTKTDZFg7KH9DFYUOUV9KGibNA0H0De
 zPFpG6u5rj5NAdXOtRKGvo6tfPbCwsbjjMGUWmphX7gi3wxh6e2hI7R64y8sLx8GW1WS
 1zF7bwY3VLSUfwmQQ3degPgaVHR7QB9FxbyHrDPLtq/9FESP3b5EQtjmHmU1TDE7aSk6
 oARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WE154O+tx7xDFpWamMMUYzvdGzWVYn7+SPnIxWoixkc=;
 b=V0dGi0HE++kYYvDrZi5/caSnA4TV2tJNzcupuSalHYMpbPe6lylL5oC3zzjbLtG1De
 ah7z5UR9XE/85ICSN3RduqFrtgBZ2L9T+qpf3t53hYMIAghQwVAuLumWM3WxPrQkcIHo
 k77siFwe5aURcw9nEW4bv7d1l4///DGtmp09PJ1F39RUA2/eEi+UWPALwWzt/VX+WAsL
 7NxAgGMMMg3Rzo4GwtBoEi1iDYIR/AlXE7RpVWo7MxaDJmv4UTt0YuoKdaFsCwwTjEq3
 LzEHqFwFt0L34sFUk6mgbBfGARpIMYZP6gR4H+bQpKMESxTyDIyrAJv+ev7xRBPKIQPA
 zFXg==
X-Gm-Message-State: AOAM531QmnCPVZLf5hjrRNZVfFS9WujrmmeAJYDCL5/QWuze39KRfbSV
 9ucgcItmceurMVAiSsZxf3Fjow==
X-Google-Smtp-Source: ABdhPJxJM3LtS945h9sTDKNXjFh8PV/deapVIQcJQhjJfFEJBCzOc/hq4H6OzEmRqk6rqtIdqe4SBA==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr24100719wma.169.1621940809970; 
 Tue, 25 May 2021 04:06:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u8sm2255930wmq.29.2021.05.25.04.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:06:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A43301FF7E;
 Tue, 25 May 2021 12:06:48 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-5-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 4/9] gitlab-ci: Extract cross-container jobs to
 container-cross.yml
Date: Tue, 25 May 2021 12:06:43 +0100
In-reply-to: <20210525082556.4011380-5-f4bug@amsat.org>
Message-ID: <87y2c32htj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Extract the jobs preparing the cross containers into a new file
> (container-cross.yml).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

