Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC6B30F5D7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:10:54 +0100 (CET)
Received: from localhost ([::1]:40074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gHV-0002n8-1n
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gCB-0005YB-9V
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:05:23 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7gC9-0003b1-Go
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:05:23 -0500
Received: by mail-wr1-x429.google.com with SMTP id c12so3869997wrc.7
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 07:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ydmeuZnL9MhIBzrr7zZE5TlNo9RbZ5rIHtMKoTc5qS0=;
 b=sDCgFX0/Dr2XBc19sy8ngPkoCwH4AbzYmGORV1OMfKyvmLlx2cnoDcdPjTYCVQmdo5
 cF3TeycVMboRzIMmdDadzm+hMGZFJNfXFl5E+VfasIn9BneXANQ8IMIwOrSiOZkBNklu
 quXH4ch+4MMg7aDKKzlPcbde6IzpiLZ2Vum2NEQ5R7qk2rcYllwACghELeU97tRIqS5u
 vUDhAS++HNhVER1JEq9LOSk1OJyL3/HHBGqu7VJYZ89Z9THPhXWa95FM01JQiRAxxnoo
 eORqWTzzb7dVo5tjIYJKWtVnYqPBP7dcVH+7d8h1XKOgmAOckEoxSmJUGjpnj0W14HWv
 4/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ydmeuZnL9MhIBzrr7zZE5TlNo9RbZ5rIHtMKoTc5qS0=;
 b=NibW/hu/dJMhXlAvwu3qvcxYNVmZYBuSMyFD0g3T4K3ibD4/5bgTuzZ6C3Nn3EBAPu
 yOyWD63uSE11oCXxHGck6VtLPI20lZVYu939Ijoq/TbglhAHK73nQ9mxv/Ymuwf/pb2D
 PYidATJzrh1JjS6qKBD+Q/46L91CDmyar7uenrSzyPC+sq/T5L9iu9uIJAGYbdv5pET1
 V9WYBi672k8i5Q2h6pKdnsN+99+pa7zTrWhu2KsDuOMd3R8ji6f9PYpCRPl9QWHhL2wd
 IgsWqzfq5sjbysou4ugyyD+NHWa2nd4/LxMWq5Jej+hwPxeLtHUK3XfqspWrKNwpZdaW
 3DjA==
X-Gm-Message-State: AOAM533tZWXrGWdo81cMuPS3+0RGXpJ2r+jZ1dR1/javKfGr/lcrunIi
 LHKDYDzVLGlv5D/uC1dl3tnw2g==
X-Google-Smtp-Source: ABdhPJxWEIyDXUzznWinCMH2t5kVS+k42j+S6E4ErBirCjXS6yFRN+eN5HFgPiYog/X6gVTEIDoIWw==
X-Received: by 2002:adf:f749:: with SMTP id z9mr9621210wrp.327.1612451119745; 
 Thu, 04 Feb 2021 07:05:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b11sm8273416wrp.60.2021.02.04.07.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:05:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9317B1FF7E;
 Thu,  4 Feb 2021 15:05:17 +0000 (GMT)
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-6-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 05/93] tcg/tci: Make tci_tb_ptr thread-local
Date: Thu, 04 Feb 2021 15:05:12 +0000
In-reply-to: <20210204014509.882821-6-richard.henderson@linaro.org>
Message-ID: <87r1lvq3f6.fsf@linaro.org>
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Each thread must have its own pc, even under TCI.
>
> Remove the GETPC ifdef, because GETPC is always available for
> helpers, and thus is always required.  Move the assignment
> under INDEX_op_call, because the value is only visible when
> we make a call to a helper function.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

