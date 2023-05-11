Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 277D06FF60C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:33:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8HU-0006tk-Ti; Thu, 11 May 2023 11:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8HS-0006tQ-Oz
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:32:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1px8HR-0007vo-BH
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:32:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42d937d61so29076535e9.3
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683819151; x=1686411151;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hx5NSzlGXgL6QvtCvpDgW3h0lqn85tWuTEdXzL8I5eY=;
 b=cTTqyX8b+gj4zGQGkcC+Y0i65GRD/pdgroZXwJeAaeOEBpK5AAEx9kwvrUK5bf02Hf
 9XVDNiJa8LNU7dIU4MFpJqjmFU90OvLwIc77u8mJl8L4CSTsRHdBrmG1GnuLkTbRCCGl
 w9mUTqlgKjxrise1MJ0QwwVCyiAE713Ign3aICRyXELErQOs0EPfgMEk2eh07vhEAxbu
 hPPISSfjRPXV44AQ061BCMdkG378f5Fj20LNevI34osoTwzRzXjgD5G9JTU7aIiOwR76
 /Eke5vUTpXq0oDlRSzGgk1HBZJJKpKK3aSLGL86qgpAe284+zBN9wM3aBzwD+wtDLi3m
 TE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683819151; x=1686411151;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hx5NSzlGXgL6QvtCvpDgW3h0lqn85tWuTEdXzL8I5eY=;
 b=FlJvH5zEAw16VfGjP2Du3MX6HCImbV2pv/dPcbx8Ej/PETeGHsTyo3U2quP/ROBdxm
 4TqQVcfZgVTyRSe3T+MiEtf7uMLHQ0BJHCRvoa0lkK6b1JQee4mH63jgSvuFP0dAqmBg
 4KJk3jJu6CM1bWDm7aayilCavQJHN07WYPTcAXNrvFFlNXFJpyGDNPDmdwwuAAjEArq/
 F40ofV5eqV3xqOJ1VLQDOrfadM8/mKnoX1fe1qK7wMOBY7pd7uc4qUXuBCDCgY15fQlQ
 N70r3QZxRW58+IUTUJw66TJ6ZWc2sACQ7xJLGHpDtIkhrzbna4D8JQhnCtb+WcYdcdUn
 9mjw==
X-Gm-Message-State: AC+VfDyJ7tlr1uYwLODIDE+5dG2TyP2O/ylCoT/Re7jdSMvecDc+Y/SL
 uuqE4bcTWvF6bq5NcJrBDsE5Yw==
X-Google-Smtp-Source: ACHHUZ5YL5dOoL5aYiUGJGfj8oB8IQIrTdMpE9QdQJONq4N1H/wRZZjpRuQ9pb1WEPk92yQRLq6w7Q==
X-Received: by 2002:a7b:c4c3:0:b0:3f1:9526:22d4 with SMTP id
 g3-20020a7bc4c3000000b003f1952622d4mr16191532wmk.21.1683819151085; 
 Thu, 11 May 2023 08:32:31 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a5d680e000000b003079693eff2sm12796270wru.41.2023.05.11.08.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 08:32:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C5791FFBB;
 Thu, 11 May 2023 16:32:30 +0100 (BST)
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
 <20230503072331.1747057-6-richard.henderson@linaro.org>
User-agent: mu4e 1.11.4; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, qemu-devel@nongnu.org
Subject: Re: [PATCH 05/84] tcg: Widen helper_atomic_* addresses to uint64_t
Date: Thu, 11 May 2023 16:32:25 +0100
In-reply-to: <20230503072331.1747057-6-richard.henderson@linaro.org>
Message-ID: <87cz363mup.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Richard Henderson <richard.henderson@linaro.org> writes:

> Always pass the target address as uint64_t.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

