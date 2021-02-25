Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80C7324D2E
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 10:53:17 +0100 (CET)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFDKe-0007Ej-R9
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 04:53:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFDJc-0006lZ-1E
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:52:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lFDJU-0002xO-U3
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 04:52:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id n4so2819205wmq.3
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=27wn3UmujFxlIImn1omFHsjYRALMq9E0PBDRMfe2ROk=;
 b=L4FKLdDjad5RSWlcHD+ZG2+X1aweyl1yUyZ04wNycZz2XYySSXx0Zfxz8rbGG0OVWN
 d1PhayWBGUcsSpXON1Jt2dZEFG5AZZ8qsIil+ORBYa1wTpk+yAvPzSQ2LsaYeyqKR225
 jEVRsqvk0IRudHv7RN5ulubeQP6343Lxqlc+y8FUv5vq10MTmn1dHX0la/S0ZfiWNutv
 mVXRTh0ymJXGIf+FZBfz3L86z5foiXXpA1aWz1Ql3/R9KSE+luoKYsndp+MKAuEol//Q
 lZHjMEG83O+M9kWJAcnXrQ4N0BF6DpPfMbWzWiDnOMgWPV3+a1HMysE6EcsyA2XAaQI4
 AZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=27wn3UmujFxlIImn1omFHsjYRALMq9E0PBDRMfe2ROk=;
 b=EGFraS6KbvCbgk8geHA/Xsc7GE3eK8mlDJlsfawItRyUuG33c+2OV0fTnMceT8hIWS
 /pXdIVG/Ej96CC6u6N8I07RIQl755AakjAlAlaI5pTPahxplzIxXy36xXuLGKRXWl5aR
 s4O/JZbmkVpyMjDUwH+TekqLBZBaCedfButApf79keZMQzF7hMzrCPnwdNba9Ht5G7e1
 6BXj59uPA57il/s22bQn7fZ+Ta2GwLeEwVFen6Lv/5SYYPvpJqtJV1uT5bjaqKzmY3WE
 wEc9QFK3BVrs/u/OZyKIrTSC0Y3IYbXgq3JJpnYYMPifYoPcuIi7fA2qbrYwnCvAG/2I
 PJEw==
X-Gm-Message-State: AOAM531iGysouOMKvGcR7SUV7YcohlEt8bOxc/cpE2f2ej0FmkgjI5dH
 pRhheEJwNnZK/DFq055g6P/FsA==
X-Google-Smtp-Source: ABdhPJzIWkPIwDZXMFHUB/PHEYHasLf8rk1VP+rF4cBiCnJB/WQ1OFjFc91jlm7neKISEkmFzqNcRg==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr2463843wmm.49.1614246722708; 
 Thu, 25 Feb 2021 01:52:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w13sm8636775wre.2.2021.02.25.01.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 01:52:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03E3E1FF7E;
 Thu, 25 Feb 2021 09:52:01 +0000 (GMT)
References: <20210225010708.288696-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 1/1] accel/tcg: Replace parallel_cpus with cpu->cflags_base
Date: Thu, 25 Feb 2021 09:51:09 +0000
In-reply-to: <20210225010708.288696-1-richard.henderson@linaro.org>
Message-ID: <877dmwbhkv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

> Precompute the initial tb->cflags value for a cpu from its cluster
> and the number of cpus live in the system.  This avoids having to
> compute this constant data every time we look up a TB.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

