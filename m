Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3C295162
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 19:16:08 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVHiZ-0007EL-BH
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 13:16:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVHg5-0005uW-2u
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:13:33 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:37249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVHg3-0002zZ-G9
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:13:32 -0400
Received: by mail-wr1-x444.google.com with SMTP id h7so3981824wre.4
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=qNDoU4rky3mlkBjmm5NXYAjGWt99YpYFTykyo1r7pwAd3CT24O2u4zP2DNY287ct+P
 oN+0sl/FKmf+jfdxqmw/8Z4s8GeU6ns06BN+xwZgPiDOPX8G72MizmoaipEyddpsZqP4
 1nbCsjK6BZE5PPlVNnObo7zFElt07nZLPL6wxSSYjKY5RqlWaAoZbMXEcNMuXn8hPImc
 OTytxcWP7isimEzgSQ+5rn9zdbFXYu50vUXWQ06kE+MFlxBUDexTKHsbxgzEWqiRnVzm
 AuPyZ5AXGbhAmyytP3OR4G3Bt6gd45VW9qpYm66L9OHUlyY5sXzMw4QgdjeWkanuGbYy
 dDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=dIyGW7vH/HczXq4+/MY/j2PwlnKInJq2U0IDSkYp7Jh0Wn6+VdW1CjE6t1wjDtSg6S
 8yXxzFTOu5/juAQ1xQq9VYqntVfOrd5ApJIBAK+AE0v7Gul0RVcWCuMPHH9oC/Q8zLGV
 aVcU3Q7b+ftFB6knR1yOIbzc7e7ZDB41MHSWJXBd+LyY3OZo1F+Mp/bSR4BJlsBct2VJ
 NnQFJg65426C9zeJGjrsYZU91dLkEeyX74UDdfh8ZM1nqjymyA3NHLCMKyh+UUDPic6U
 j1dds5J+P0U2/wa5N9KXlLNSzHWqBY3IOwEYzXT+Vsear2k/J3V7QbNc26S5It2liZT+
 rJFA==
X-Gm-Message-State: AOAM531xHZXW2I1JM3CK15KMnIclX/CrjwUVuRYYvw8e7NUK9EPu8aAS
 TrHFenN9N+lZljkrMfbqkhancmHmz7FWlg==
X-Google-Smtp-Source: ABdhPJzyQRlmZqVnUvhg2JtwyxY39UdIPN6bxkdeXTUat4TKCWgcGCUDZ2oHvH3KW5OuC5shRbaHCA==
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr6379662wra.276.1603300410211; 
 Wed, 21 Oct 2020 10:13:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u20sm4219203wmm.29.2020.10.21.10.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 10:13:29 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B05331FF7E;
 Wed, 21 Oct 2020 18:13:27 +0100 (BST)
References: <20201021045149.1582203-1-richard.henderson@linaro.org>
 <20201021045149.1582203-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH 02/15] qemu/int128: Add int128_clz, int128_ctz
In-reply-to: <20201021045149.1582203-3-richard.henderson@linaro.org>
Date: Wed, 21 Oct 2020 18:13:27 +0100
Message-ID: <87wnzjv6x4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

