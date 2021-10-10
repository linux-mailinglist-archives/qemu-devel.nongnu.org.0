Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1AD428137
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Oct 2021 14:24:39 +0200 (CEST)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZXsb-00083w-Jw
	for lists+qemu-devel@lfdr.de; Sun, 10 Oct 2021 08:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZXps-0006bR-UK
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 08:21:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mZXpr-0001Rs-Dt
 for qemu-devel@nongnu.org; Sun, 10 Oct 2021 08:21:48 -0400
Received: by mail-wr1-x430.google.com with SMTP id r18so46096870wrg.6
 for <qemu-devel@nongnu.org>; Sun, 10 Oct 2021 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Sv6k6DLqv8nLrfM6HpsuIEfFZhpjTZTli5Gt6+5SgQo=;
 b=zmY60kvsPKKlMdKHK6QI8nMGimjkuPSyGLw8kh0ok6Uv/kyGAhOmV12CxvlWBO/eq3
 pO+W8tuVVM2J2XCfI7wsyAA/iyQ+60Z9xPArZQg+APicjaeaQtrZq88SvGJy7bJ4bD4J
 mvEZn2c6RhynquOd6pZtnKQW41+dLu014IsoAVEX/RQg2VtxISU3aeaHLDTyeUz1kCaa
 rnTiuwO87hi3u16jJ5Q5AV3ReoQeXKzb+qCq0CP/WgbUo26vAsJj8PopXmTkBvFNNKF8
 YhNWwhSX/MqQqrbXnROBTzxE8k2axLPYfpekX/Wf0ssi/iJxM0GXyTVbVpTuSGgWrvOZ
 VA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Sv6k6DLqv8nLrfM6HpsuIEfFZhpjTZTli5Gt6+5SgQo=;
 b=x8qX+GNE2sIdw6HwqL9iq2XYLO9UkNWAobkz0NAvcZF8piqR84nW4eUlJs6XL4DE/b
 oijluee+ROpPZW0yS3ZYlL8O8azQ7dIg2Y97pi/c43BQNXNbwEdmfZMD1ikEjqF/GFNP
 AK+zT1JNnoC0fDOmwRi7VG4Lfwhf+Qx31Byt15k67xgG5BbPrNZV+8DsiFzdlfmsXdAl
 Mj9hRlFphmvY9KjDayAI8k02qL3rz7Ih+lDr/Vy3iB7t9RedgP3H8Q20LsSfVpCUinhV
 Rd0YtcnileaQ4Qh3rEiSXPhvL7zKZddD/bSJ8fs2g2UjMwqyfPwfKJCaJK0RPkyF6B/+
 UZIQ==
X-Gm-Message-State: AOAM5319RswmtwCZg4rwl/htJwrzATdHTT4b1BYq7/eE62wFzwYYPHuB
 zBV9ex5c1geu7xYdj73DHIFlIw==
X-Google-Smtp-Source: ABdhPJyNqQW5h4/3jVtUlQyv0fuFy0emtJXR0Nzdyy/s15lqUxQrB1kj38DvZMMVZ9vSH9rxOIw/DA==
X-Received: by 2002:adf:a387:: with SMTP id l7mr17109400wrb.214.1633868504183; 
 Sun, 10 Oct 2021 05:21:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j1sm5936144wrb.56.2021.10.10.05.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 05:21:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D3DCE1FF96;
 Sun, 10 Oct 2021 13:21:41 +0100 (BST)
References: <5ab2a54c262c61f64c22dbb49ade3e2db8a740bb.1633708346.git.crobinso@redhat.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cole Robinson <crobinso@redhat.com>
Subject: Re: [PATCH] tests: tcg: Fix PVH test with binutils 2.36+
Date: Sun, 10 Oct 2021 13:21:17 +0100
In-reply-to: <5ab2a54c262c61f64c22dbb49ade3e2db8a740bb.1633708346.git.crobinso@redhat.com>
Message-ID: <875yu5oysq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cole Robinson <crobinso@redhat.com> writes:

> binutils started adding a .note.gnu.property ELF section which
> makes the PVH test fail:
>
>   TEST    hello on x86_64
> qemu-system-x86_64: Error loading uncompressed kernel without PVH ELF Note
>
> Discard .note.gnu* while keeping the PVH .note bits intact.
>
> This also strips the build-id note, so drop the related comment.
>
> Signed-off-by: Cole Robinson <crobinso@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

