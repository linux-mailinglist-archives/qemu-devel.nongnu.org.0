Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 016573780C5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 12:01:59 +0200 (CEST)
Received: from localhost ([::1]:43942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg2je-0007Ot-03
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 06:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg2hS-0005E8-Mz
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg2hP-0008Gk-6Z
 for qemu-devel@nongnu.org; Mon, 10 May 2021 05:59:41 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l24-20020a7bc4580000b029014ac3b80020so10802312wmi.1
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=57m/v09taSRSZknGDp2srJc41uOFO34lBEnUVIC532A=;
 b=jH0354kLJ+VEcnyabrHoSgqt2KJCMSY7P95IHSzf50HBGHNhEGmMzytHjoyCMA+KdV
 kUUkQNgPK27cs1HJxuoEEsxaTn85MbjVEDybheCM7kPHeqsQm6SBSWzLalDBJVntuHVR
 QOlBLpbHi4MK72cKBzinPpdf2yggzpN4Ds33+ajRw78Mx2Jg0A4iQCA9PfovBHdBHOe3
 UwBIahYPxIGNp6R+HMtTfpsdngW4osr+ZtXflrwKa4z+Q27eo7yO9gWSJMGC0L5wsKdo
 9X2acNZfj0qHVPU8JU4AUVAqlWzUbXPGk9GL4MvdVkwUlKvYC7NjB4azGb6iAFJtWCrj
 6+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=57m/v09taSRSZknGDp2srJc41uOFO34lBEnUVIC532A=;
 b=PZVK6Vg6uCl1E2Bizdgbhfs+legVGxVLjr7QjEP4RQge3fPKneUjeD9bXKSq7+ChDf
 rcX1t2yHoZTfwJR5iuCDdtsCjgK78jgaHx8qDcMBp2sdPkTyJr4c3cT3N+e4Q3QPi1+l
 ETl6suDfZixz8v54Cp84O7ZpXOCTZ57c6WP6o06Vi6aoZkqn8DPOOWH0DW4rES/2YRL2
 6VLjYDK7HaXeyx8+IMxfZxiZrI8G81lqxmCJNo7tq/TlqoF2fN7mOJLqg3EqpOAvFv7N
 CB8s71IYZFA/yUOIhCysMv8V7FAiKUo9FidMgyt9rqnqmVU2w15Pb3fuUAW+NwBvpQE8
 1FOg==
X-Gm-Message-State: AOAM5326d6ZQaZQmVmA9N7FTEq57x3zE11BIX6UmSpY6Ebaj1tGxtFff
 1yvrvXvAzCX8lDyj09t9TEh7Lw==
X-Google-Smtp-Source: ABdhPJzlFAbVtxV3W8uy/kUVz3Mh5AzSnvg2UrwwLTSsmCfDVI1xtMxGPhUvA+oFpliHk7Q+WbBiYA==
X-Received: by 2002:a05:600c:28d0:: with SMTP id
 h16mr2422524wmd.52.1620640777274; 
 Mon, 10 May 2021 02:59:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f184sm13840953wmf.0.2021.05.10.02.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 02:59:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D48021FF7E;
 Mon, 10 May 2021 10:59:35 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 01/72] qemu/host-utils: Use __builtin_bitreverseN
Date: Mon, 10 May 2021 10:59:29 +0100
In-reply-to: <20210508014802.892561-2-richard.henderson@linaro.org>
Message-ID: <87pmxyykmw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Clang has added some builtins for these operations;
> use them if available.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

