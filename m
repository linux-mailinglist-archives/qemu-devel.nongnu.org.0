Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1695B42D640
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 11:39:52 +0200 (CEST)
Received: from localhost ([::1]:60926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maxDK-0005r7-SA
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 05:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maxAr-0002th-5U
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:37:19 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maxAn-00085n-Qv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 05:37:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id g25so17459217wrb.2
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 02:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6zBoYC21MUfXe1LCCoiGFcYBpf78P9StBYpQnj5opVo=;
 b=OekTyYs0O1FRrzDLSvF/0TPN+2rfbAkiNlnSIZ1hZfxTuv3JUry9BsKOELbm8sqMBY
 zN5+BsGKWX8hMpL/HUiWLknW6YhlgNbHhQgn0mxoOaJBzvTISQwJStFSFrsGL525PMQa
 GrfBT9W9rVKpQW0mWG4RizDO0SVUu7pjjETMYGjE41LbvJF/as4Mu2HksAmfduhGnRE1
 Xx4AdHb+M+hKP+oDKr0VO/RY4MpPKQpjtX37ZXZfddk/EMFJKIMO+v8gJWPTCPiP9qWF
 IcIZ8hgplq0FUzpoUI77fGNsMjGCFZGds2BCAemI/gdS8WSy6uYpU33JuO+OTX9fXqPb
 wlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6zBoYC21MUfXe1LCCoiGFcYBpf78P9StBYpQnj5opVo=;
 b=mt++PzVQmVAAaT65kqhWMJrj1EnlPt8jHX7FPAGrj3/DwAWtbSuUKN6PEJYfWhIQup
 J21OJgKUwKIDDjWRMmlGkt1QYsHM0mD1CeGNqWf5xHEttCREN/jpSaSW1eKBOwsPrzs+
 ru2wrupOKWqfF7e8eyC1X69pk5fAFCSKE5MAJaD4i+Yn7nLeo/WqAyv3C/KSTooZAwOn
 gmfgyweuv1aIR8vC9oDGrZCAcme0woO32DlRVdRAYFglxCulZBAdsfr3imh6IXypHk3P
 +ZO1rSrAIgxVz2oCJyzdsUadNVPZ8mxuPLcr4yyj7O1gwr9R5cZ4nS8a1yHml+DnW6CN
 Wmdw==
X-Gm-Message-State: AOAM5312PTj3LcEhMx5NuSjf4RVSvuu8KHtp5tgyY5G6kvimZEdo6Aqt
 0ONVDC+uy6we2vwSE4YJ8IgLQQ==
X-Google-Smtp-Source: ABdhPJyeVx1f8efjkRCdxF6KxvhHzx9XbLcgQf67OSaT54fevzrVRKxBEpVNPQmj3kYSzQnA29dCpw==
X-Received: by 2002:adf:aa96:: with SMTP id h22mr5399023wrc.405.1634204227849; 
 Thu, 14 Oct 2021 02:37:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o19sm1953720wrg.60.2021.10.14.02.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 02:37:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 338771FF96;
 Thu, 14 Oct 2021 10:37:06 +0100 (BST)
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
 <20211001153347.1736014-4-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 2/9] linux-user/nios2: Properly emulate EXCP_TRAP
Date: Thu, 14 Oct 2021 10:36:30 +0100
In-reply-to: <20211001153347.1736014-4-richard.henderson@linaro.org>
Message-ID: <87ily0uev1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: marex@denx.de, crwulff@gmail.com, qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> The real kernel has to load the instruction and extract
> the imm5 field; for qemu, modify the translator to do this.
>
> The use of R_AT for this in cpu_loop was a bug.  Handle
> the other trap numbers as per the kernel's trap_table.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

I'm taking the values of the registers on trust but the change of moving
the error_code seems OK to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

