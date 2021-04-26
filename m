Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8336B75A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 18:59:37 +0200 (CEST)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb4a8-0001eG-3N
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 12:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb4YJ-0000Mw-2Y
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:57:43 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lb4YH-0002UQ-Jb
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 12:57:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id x7so56592603wrw.10
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 09:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=jMoZLYtYSR5YiV/RBZN0yTlJO5E+gDl4ad59jnmOixQ=;
 b=ZnxTREJXvIOXFb5Y33Z4kVea9doQx1ABRwWLsoYBcd5oYTsCoXXBTW8rjXgVqbCPq3
 6cTsTfpP/+KR9jyi5ZJhqd8Ein5BKailo2EUA5Vi+GjbYfI9dVnhe1GdXMJFR1swWSay
 isD/CPxXl2C5vUm1qcLL3YpbUN6aswseDdl/MC50gzxBxdC5iLbA4rMtnqSxDGLNrFxT
 MphjfBOv+J8p/2WKCZVBBCZ8e2GeMirRBTTu3mw4IjSCBdWtC10OcE6RJ16Ly4a830yb
 DPH96Njm+vKM1jTVPscvUhSnZuaVuQWYJ/IilaN6fll///eLDnT6z6WZVUeQmKRsH/qO
 uUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=jMoZLYtYSR5YiV/RBZN0yTlJO5E+gDl4ad59jnmOixQ=;
 b=Dv3deUfSD6vVjwzujj3noP/dq2iZusV/ATsRKBUrPQjzqY0NIDkxF3bYjU0vOPCPYb
 VhQKJIxurjXQqSbqQxvXZSEwNQ01wbnzmBrb0GkRybn0/wlMGuqKUGPXKjAmF7pzjyNH
 +0G4x4LeFsfQQtm8JvonvjwR/7LAyiHZ3Jqi0ydclwqezhMgZpl9kyzxh61HB46rMs19
 5OGi5G91Jc8ehLjP3hiseRXuGHQmL1jBL1A4iRuPqGwodNzvcwoAxncAWLFpUnsqg/0O
 I8w74ocDEFprdSbnHICbWRSGSksVpvBlVR2JvtAleRb8V36qdIihyX6CG/3h+k1sboET
 KdvQ==
X-Gm-Message-State: AOAM530G4c9dWOiHDv2t6poW1rRqNgMGWHT0/V1+NcKr3Eu2U6kE9u97
 5NEQdzADOuNlM/7WNXEMnqHjNw==
X-Google-Smtp-Source: ABdhPJz/Cn/llJ038Cv6wW8do3xSADIjRYn4wluUwj9k9y7aPnjoFu2RtOLR0CyjHWMxQcE8eah87g==
X-Received: by 2002:a5d:58d8:: with SMTP id o24mr10720058wrf.288.1619456260097; 
 Mon, 26 Apr 2021 09:57:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p18sm730256wrs.68.2021.04.26.09.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 09:57:39 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8A0231FF7E;
 Mon, 26 Apr 2021 17:57:38 +0100 (BST)
References: <20210422005043.3569-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v2 0/2] plugins: Freeing allocated values in hash tables.
Date: Mon, 26 Apr 2021 17:57:30 +0100
In-reply-to: <20210422005043.3569-1-ma.mandourr@gmail.com>
Message-ID: <87r1ixrnjx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> A hash table made using ``g_hash_table_new`` requires manually
> freeing any dynamically allocated keys/values. The two patches
> in this series fixes this issue in hotblocks and hotpages plugins.
>
> v1 -> v2: Added a freeing function to hotpages instead of freeing
>     the sorted list. That's probably better because the sorted list
>     is only made on having ``counts !=3D NULL`` and ``counts`` has a next
>     pointer so essentially at least 2 elements in the list.

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e

