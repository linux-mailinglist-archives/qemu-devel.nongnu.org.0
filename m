Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476353244A0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:31:34 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzsj-0001xw-9x
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:31:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEzqk-0001GN-UE
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:29:30 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEzqi-0007h7-TZ
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:29:30 -0500
Received: by mail-wm1-x32f.google.com with SMTP id k66so2861044wmf.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7utd8Vjdas8FYZCc99dZRZNuOBMu8F+0qQu+zIySNIM=;
 b=dkiye24/u4N3O/ryHWAw6IcePc0h6AzqvvSUijDoH9Rh8y/t46XX4CkD/MJb/LNyqL
 SXCQf+Y8DvfaAwV8HQYKgIJ3Oq+tSz2MLVBO653CKyXdvGT+SqOpskMCx8O2k24p8TFd
 FK/zLxwU2goP6/KdAl91raD6TsD32s+ra7JUKQHsrX8ENx/RISJXKTBjtdLBwKzfXpRs
 thXBCnGLmDlNEw7tdTibDQ1pNR0ozL5EjutV+Eec0iAcJRskRjzKDK5bO2WiXP0dxCvp
 +eXZRExdGKUvIVHILLSUnmG+Ki0DNoxvDYAneehyy/pidy1hcPEdfq7+B1Z8i7BXbwsi
 eB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7utd8Vjdas8FYZCc99dZRZNuOBMu8F+0qQu+zIySNIM=;
 b=nW6bx6Wrz2mwnwua/eV4e9Eh0lDDFfMoMYA2Rsnw2q87CxrYI3lvIJNcvoBNJhiiYZ
 MdQ0zS4ezycqnKJMSK0PO00NcTfzQ8QYYhXaYjFYnE2ZyN3XHZcUcPUcAAn2S+y4kHtA
 K67e0yBKQVr0yK4pjoeJMbBQKUhOJzgzTMGxCaaRs6ytiJVdt3gCuYuMKBikmqjLZIP1
 SO2+B96pgWDr37VBbgVAJMKBxa4lj4GQZjigjzcYQUuWGxqSpqMhAUUaQT6ODasVXiCh
 86/OGjY7yR58rcZs/JBd2cketOlYvYQwhICxmeI+I2yxFLb1PG1/KRIy8nvJxEMemmrv
 iNpg==
X-Gm-Message-State: AOAM530/ukwuoX/aSrXF7j4WeVNRzLr2wWd/KQFKTI6+I83AO4UICsmO
 T++lJD3zpJOQYubXmQqeAxJrCQ==
X-Google-Smtp-Source: ABdhPJx/hXuWMSdypoRPs3bP7h3aDB+R2tClvLk9aqXI702QZ39zs/GyhLmGm+b0nsY/nI9/VqVudQ==
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr5116644wml.62.1614194965602; 
 Wed, 24 Feb 2021 11:29:25 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n10sm5063469wrt.83.2021.02.24.11.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 11:29:24 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E7B051FF7E;
 Wed, 24 Feb 2021 19:29:23 +0000 (GMT)
References: <20210224183952.80463-1-thuth@redhat.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] Remove deprecated target tilegx
Date: Wed, 24 Feb 2021 19:29:16 +0000
In-reply-to: <20210224183952.80463-1-thuth@redhat.com>
Message-ID: <87czwpb6y4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Chen Gang <gang.chen.5i5j@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> TILE-Gx was only implemented in linux-user mode, but support for this CPU
> was removed from the upstream Linux kernel in 2018, and it has also been
> dropped from glibc, so there is no new Linux development taking place with
> this architecture. For running the old binaries, users can simply use old=
er
> versions of QEMU.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

