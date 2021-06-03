Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D91239A5CF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:34:35 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqIk-0006bc-0N
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqHe-0004Nx-Nd
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:33:26 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1loqHc-0002wO-VI
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:33:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id f2so6467404wri.11
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=W6phH5oIaCHyi6EmJ6lWerhw4w+vsTMNumYj3h+9nxs=;
 b=IqgB0IvY6Go/b4p6mBZOzci0hhlJtvxCUwqNhdacCAUSi9ubERLeH1gY5AfH76JuQB
 UTgpH3jGSbkkppbC4uN8ssVCMsUT0nJwtQopDmOernD1KthJC4Kbi/qDzm5QnQQv+hSd
 UxRgcBsO/o0F23+h3RbXbz7gxsPQhJyTIYu7EfYNcOHen8IdD0T2sfrg2mVGAi7+sK+3
 QhdLfm81lfw1T9g32wExueFhlwbBy5kFaSRUqaM5hOTcMC6Yr2TZ4ztt1e9lZBSgko1f
 nXpGBMBXR/FohyRzc0Uto6IyrQC6va3hgXSEeC+yQl+QZx1ftUX6i/ccZ1xDYuLjwDQA
 FBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=W6phH5oIaCHyi6EmJ6lWerhw4w+vsTMNumYj3h+9nxs=;
 b=QflHLx8UBArqRoK5VJmjtIczjaDdQ8gGZEJjwo40BojpjztdtnrIjLaCRH/VRbBHgQ
 C9uwHhu6WkEF1n1ICH5lNXjnG5Ps7xuiwXhiFpcgAEJqZnFKYHYr2UQzMxsJ3Yf/GyhZ
 MO8SvMbnWNTLikaGNufC4zxkiSTWZ/cCoUhk+IibehO+z+Hfcv5gecX3dmMX4POJfl+R
 p6rbNk426ZvJ+f9qXWqLvFlT4ENTaIcFzbILbHw+HmNe141hbyEoco+xfMliB4xjn8Ip
 gESRIbpZT9b9lSXXrKuBJirVr2b5DtDba1iZqHxAcBCOVVHnkWo0RCGGIjwwSs6IQ7vW
 HwUQ==
X-Gm-Message-State: AOAM532ygu4ccqrrO5DJuw0hnl8xrQXLVta8zEv8GCDqfJ2rc7t4dE9o
 yJ2xwCP4bc2s1LpcHG2m5nCkQQ==
X-Google-Smtp-Source: ABdhPJzpK9bBLcglF0Q49/5xjBySCrkeIbR06TOThVUz0tG9VBlPDZ6MaW+3rvyLIwI77Vup3w50sQ==
X-Received: by 2002:adf:f708:: with SMTP id r8mr811721wrp.159.1622738003226;
 Thu, 03 Jun 2021 09:33:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm3965813wru.87.2021.06.03.09.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:33:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73BCD1FF7E;
 Thu,  3 Jun 2021 17:33:21 +0100 (BST)
References: <20210525164541.17985-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] accel/tcg: change default codegen buffer size for
 i386-softmmu
Date: Thu, 03 Jun 2021 17:33:03 +0100
In-reply-to: <20210525164541.17985-1-alex.bennee@linaro.org>
Message-ID: <8735ty9acu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 1896298@bugs.launchpad.net,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> There are two justifications for making this change. The first is that
> i386 emulation is typically for smaller machines where having a 1gb of
> generated code is overkill for basic emulation. The second is the
> propensity of self-modifying code (c.f. Doom/edit) utilised on i386
> systems can trigger a rapid growth in invalidated and re-translated
> buffers. This is seen in bug #283. Execution is still inefficient but
> at least the host memory isn't so aggressively used up.
>
> That said it's still really just a sticking plaster for user
> convenience.

ping?


--=20
Alex Benn=C3=A9e

