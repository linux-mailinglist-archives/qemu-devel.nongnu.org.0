Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E61566832
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:38:50 +0200 (CEST)
Received: from localhost ([::1]:42422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fxB-0005qo-5E
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o8fw4-0005Aw-CN
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:37:40 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o8fw2-0005vZ-OI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:37:40 -0400
Received: by mail-wr1-x434.google.com with SMTP id d16so10592209wrv.10
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/b+ct1siUx+szHISEgrAJPRDs8X6RMWy2CE3hgTTZDY=;
 b=Kc5FmvFFOdXIlXv8E9M4w7BC3MzmOVH60fxREwTDTo2UcFWO4fDnBefrp2zMJPsGM5
 lhXRZTIWQZO6b6fsSRILHBSNyZpX3zTYnAyyC3DNZa0sdkFLMiMVyIEauPXztj3dgsvy
 i9xD1G0kgqyr4lAQQtceIjgXPGUfDjAR5NXdPU3OrSCR0qZNPlsBO1J1N8vfdZjWkr+v
 XbPq/IK0N1wVb+TH+PMR4si7O6xffl0yHR4grzRxUioCxoaX73snR+OLp59FNWJzZf37
 khelnPT13eDF/MSepOmEFOriVJ3FiM1WtJkkjeFXsqqg0op1fWSiPhXBrVUA9dpUQoZV
 2rBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/b+ct1siUx+szHISEgrAJPRDs8X6RMWy2CE3hgTTZDY=;
 b=mmayie2Lngjl431D49qbzQHOTpdYkc85ftIT1SPTezDLadnB6NH5xphai8eUTyyHVR
 HnvSNBdFzo1U0bHH9e4z2QgehkV0qGMVfvpOCIZFJoQuJOosRHTyr5Xi+ZgXW/Z/hc5p
 1r0WasGtMhFqS2qs3+ijAbm0hoMip2oKRReYLBB30p9QJwoT9nzqSeTYJt0CmpNakl6i
 A0WZmM4KgnV5T/UzezFyn5rBXCc8WtXob9o5AxdWT4hqALmEKq5j28/fWS70ZtrOvoOO
 ATNUVZ9I4o21QXEgUS1Zw/aAFxhDWLL1Pr6W2huB/CDzMrmjmOPYGgGON7JCbbwebPwn
 cXjw==
X-Gm-Message-State: AJIora/5n+8NQX/o7Uy/PZDAYV94mI0fDD6rLsQi7nNoG00Zt2EGgRJv
 LngalYNmkzpoRAQWwHhLFbZQgg==
X-Google-Smtp-Source: AGRyM1un3ljAP/xls3auqhegQd8zmzil/gGBWhTuIsoV/rIWRaan6V6Tyes59frXnGBFL1fIUM+lMg==
X-Received: by 2002:a05:6000:1a8d:b0:21b:bc45:9c3e with SMTP id
 f13-20020a0560001a8d00b0021bbc459c3emr31360768wry.390.1657017457127; 
 Tue, 05 Jul 2022 03:37:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a5d650c000000b0021d7050ace4sm2035764wru.77.2022.07.05.03.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 03:37:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E5391FFB7;
 Tue,  5 Jul 2022 11:37:35 +0100 (BST)
References: <20220705083623.1142250-1-richard.henderson@linaro.org>
User-agent: mu4e 1.7.27; emacs 28.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Subject: Re: [PATCH] tcg/tci: Remove CONFIG_DEBUG_TCG_INTERPRETER
Date: Tue, 05 Jul 2022 11:37:30 +0100
In-reply-to: <20220705083623.1142250-1-richard.henderson@linaro.org>
Message-ID: <878rp7sv4g.fsf@linaro.org>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> There is nothing in this environment variable that cannot
> be done better with -d flags.  There is nothing special
> about TCI that warrants this hack.
>
> Moreover, it does not compile -- remove it.
>
> Reported-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

