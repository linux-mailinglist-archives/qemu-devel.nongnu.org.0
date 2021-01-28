Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93659307A02
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:46:01 +0100 (CET)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Ue-0004pm-LC
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59PR-0008Fk-Pk
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:40:38 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:55328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59PK-0003Wl-Gk
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:40:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id f16so4664311wmq.5
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=WgUOq3unCzwAEvQ6KR4HHJ4dkDbx3WtK0D9jPPAEGxo=;
 b=G4CciQBQrIa9iDgVkcFzA0MqBw4kqYcZtAtaFSTHsIyBxESm45a6TI+oD5DnUuVE7d
 /ESvml5wyD1vPdQsE6t0WtnB08E0WQsFfBUZN/jsX/TyKkKzgV4NAg+VpjhCblQshjhv
 kdE9jto5gdUZZpPz44R4IwlO+1GFW8eM4B3Kjr8+sFJRcMGng+ndfkTZ/UzXfnkaCAim
 D09/fbvDOYN0UHTRklDdohwOQa/h92Xs8NdrtReGQclYEBbpKX140g+xGIYAkZkDOy0F
 0BVOFVxhCsK04EUgfIHMQxBYPc16jgX6SQwTs8/ywCdvZPsVbMbgunihPBeOm901XTpx
 1nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=WgUOq3unCzwAEvQ6KR4HHJ4dkDbx3WtK0D9jPPAEGxo=;
 b=pdVS2gQFWyNIWXC6KAssTo3Pl+SD7Vcg5Z32z8nsGL8cgO1lLh80yqMj83h4w2YVrZ
 IvSzx5eqb/0I0zAyCE0nnhlToIKgbhqs4JcqwVjcGAi+Ocv28Zv+oSuAJkSE3LkuPfi8
 jldQT43mUa8qLy4ax/NtOIqen+ujq8CZP5P+N9QC6lNjGWaNMCvZUguFE+t+KKJieL0S
 D6fJru1jnN66Q/TYDWhe4OmukZfFOyYVjgUfTFLFKbg0qcY0UbFHmvWIFzpluyXz56Wm
 UsRoyB6/Vx+eDah3NA+qXub7N3iTqnES3MpYR7IFa4c5l397VBy0M3I+DfMk5i6xf6Pc
 Heuw==
X-Gm-Message-State: AOAM533EkQVU6mb3UXDwo6qKyD+WVEjoE3jiGu+UKuJMh9JTxb/Mp507
 rCw1Dfv9/BRNHGZWnAwQTWjLkw==
X-Google-Smtp-Source: ABdhPJz/AAYTwbfZXpfXFnU4GKTha373MP7i3sfZP5XXo5qsrgQ8PksghEaiv7OGlX/EE7Q4ZWrnPw==
X-Received: by 2002:a1c:98c3:: with SMTP id a186mr2583736wme.147.1611848429078; 
 Thu, 28 Jan 2021 07:40:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b18sm7311847wrm.57.2021.01.28.07.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:40:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6CC9A1FF7E;
 Thu, 28 Jan 2021 15:40:27 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/23] TCI fixes and cleanups
Date: Thu, 28 Jan 2021 15:38:50 +0000
In-reply-to: <20210128082331.196801-1-richard.henderson@linaro.org>
Message-ID: <87eei5ul1w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> The first patch I believe is queued by Paolo, but is not yet
> upstream; copied here for convenience.  Then, fill in all of
> the TODO blanks in TCI.
>
> The tci_write_reg* functions are redundant with tcg_write_reg.
> Just pass in the properly truncated result to begin.  In the
> cases of the loads, we've automatically done that with the
> type of the indirection.  For all of the other arithmetic,
> we don't actually have to do anything -- the value is either
> right, or the high bits are undefined.  And in fact will
> currently be ignored by the extension on read.

FWIW aside from the regression with 2/23 I've been testing this in TCI
mode all day on hackbox. So far ffmpeg has encoded a whole 153 frames of
video which is the furthest it has ever got in one of my tests ;-)

So for the TCI part itself:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


>
>
> r~
>
>
> Richard Henderson (21):
>   configure: Fix --enable-tcg-interpreter
>   tcg: Manage splitwx in tc_ptr_to_region_tree by hand
>   exec: Make tci_tb_ptr thread-local
>   tcg/tci: Inline tci_write_reg32s into the only caller
>   tcg/tci: Inline tci_write_reg8 into its callers
>   tcg/tci: Inline tci_write_reg16 into the only caller
>   tcg/tci: Inline tci_write_reg32 into all callers
>   tcg/tci: Inline tci_write_reg64 into 64-bit callers
>   tcg/tci: Merge INDEX_op_ld8u_{i32,i64}
>   tcg/tci: Merge INDEX_op_ld8s_{i32,i64}
>   tcg/tci: Merge INDEX_op_ld16u_{i32,i64}
>   tcg/tci: Merge INDEX_op_ld16s_{i32,i64}
>   tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
>   tcg/tci: Merge INDEX_op_st8_{i32,i64}
>   tcg/tci: Merge INDEX_op_st16_{i32,i64}
>   tcg/tci: Move stack bounds check to compile-time
>   tcg/tci: Merge INDEX_op_{st_i32,st32_i64}
>   tcg/tci: Use g_assert_not_reached
>   tcg/tci: Remove dead code for TCG_TARGET_HAS_div2_*
>   tcg/tci: Implement 64-bit division
>   tcg/tci: Remove TODO as unused
>
> Stefan Weil (2):
>   tcg/tci: Implement INDEX_op_ld16s_i32
>   tcg/tci: Implement INDEX_op_ld8s_i64
>
>  configure                |   5 +-
>  include/exec/exec-all.h  |   2 +-
>  tcg/tci/tcg-target.h     |   4 +-
>  tcg/tcg-common.c         |   2 +-
>  tcg/tcg.c                |  23 +++-
>  tcg/tci.c                | 283 +++++++++++++++------------------------
>  tcg/tci/tcg-target.c.inc |  41 +++---
>  7 files changed, 154 insertions(+), 206 deletions(-)


--=20
Alex Benn=C3=A9e

