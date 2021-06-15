Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E443A7C94
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 12:59:38 +0200 (CEST)
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt6nB-0002HF-5P
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 06:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6l6-0000N3-Nt
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:57:30 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:56303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lt6l4-0000ka-G5
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 06:57:28 -0400
Received: by mail-wm1-x32b.google.com with SMTP id c84so1130570wme.5
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=5vE6p0YV4Ifc5vQM6ee0zloXavM5yoBorEnM4xGPGj0=;
 b=Ya/wTtBJWP22a7bTEUBliY3trUV/N1Mv4oNMeOUNkmbf/UeE9el/A6pri4wTORWDpn
 j4TFPmuSKJ1XGCa2F5XYmSYh4lcBSvgJJMD3fCFqtjnRZJ4FMmuAfT0Yne71rJCqwKq/
 5F+49PDseCyNXzDWG2iOmDmO77Xtslm7e5eERv1U7VlUBR98ukMkzgNQC2RPzqsfKz2Y
 sNaH/wHqu+mGH5eIcz/dJ2GqUwsYZjB3yQ/erGK6GJtUDWtWez5YMgjMzrdKYf1lSIVC
 rdXMlWg5v5PUZ9IlB/33Y3rUH0i0DWf3KdvfOW9TE2nLyR/Z0xhrtR5IijO52bdCkzPu
 EF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=5vE6p0YV4Ifc5vQM6ee0zloXavM5yoBorEnM4xGPGj0=;
 b=EGn9kZd+e/MbD0kW6PDuX3f/Y+PvCIBEOF5jzu7jBTwGMY99BgeuJahtnoUntM4obC
 5NtizWEmiaObmovAWLk/q1Ns5e4wC6Mf6w5kmgsSt0Rn3Mp1NCVB1/W66ZhNt8gftVi4
 eL06JgZjVbvq8GIKJTH0lxnCi1L95rl0e2ghmUbCeC6EmxmWQe2X4W64kU08TpmQtFiq
 zLKhIhUzlmXaIJGhSm1qfreRc/hTECYHGLXv/SmFz+PkJr1zN5oXH3O/ipCn/K8IvUG5
 A5EWX1zxyXBZe3eVMJUEtgtqIZvP5Vz/+M1cJ4mcHqbofkDK2lGhX8S3BuaSMKYgH/bZ
 jQGA==
X-Gm-Message-State: AOAM532onQs8polWpqWq353Qahg3/uk6UYAqJRLFQeetYKduo6pjoJNu
 LKiZB+DDZBUSwkLBcIJUBN+uvA==
X-Google-Smtp-Source: ABdhPJysumDtUhnFzR9fnzjpFnGpmnOLZTuKdJz6azM+V/diBExGg6gp64QCAzizXa2umj+McLMuQw==
X-Received: by 2002:a7b:c453:: with SMTP id l19mr4591798wmi.154.1623754643375; 
 Tue, 15 Jun 2021 03:57:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v7sm20634409wrf.82.2021.06.15.03.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 03:57:22 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7F231FF7E;
 Tue, 15 Jun 2021 11:57:21 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 5/8] util: Use unique type for QemuRecMutex in
 thread-posix.h
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-6-richard.henderson@linaro.org>
Date: Tue, 15 Jun 2021 11:57:21 +0100
In-Reply-To: <20210614233143.1221879-6-richard.henderson@linaro.org> (Richard
 Henderson's message of "Mon, 14 Jun 2021 16:31:40 -0700")
Message-ID: <87y2bbgzu6.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> We will shortly convert lockable.h to _Generic, and we cannot
> have two compatible types in the same expansion.  Wrap QemuMutex
> in a struct, and unwrap in qemu-thread-posix.c.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

