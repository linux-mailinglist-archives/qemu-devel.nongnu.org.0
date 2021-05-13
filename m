Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F337F97C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 16:14:34 +0200 (CEST)
Received: from localhost ([::1]:35988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhC6j-0001U3-Jn
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 10:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC4H-00078t-O2
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:12:01 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lhC4F-0008O9-E6
 for qemu-devel@nongnu.org; Thu, 13 May 2021 10:12:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id s8so27043441wrw.10
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=V9hvmykAevuOOCQ/mDqHOZfvp0zpZ9zjGEbSxFJG2Y8=;
 b=l6d3q90opngU8Gu9IYdIVdRrRBIFUs/WogNunvGp8sRt//QH9PfenXaNl/Jx6SYecK
 lbKiDtdepD6Ibq+M02JW+OjmCJKbbH7IefbZZPJ+eolDjJakGpTWa29el+Uv1oCC+bEj
 +uH/RpcF06JdwYARcoxiaE4m1803+Kk6KMeX+PMtuXyKgEw5RHHghCyhqG5PB3a7yLXe
 Td8YNl6f0GL8BHlmsOPoHlpHZUCWa54IMIBdb+nTFR6Vg7ls7wcoqzn3KU6eoeGJQbuI
 7oLwEs7PYycG755qvD5BM7rlXpr1gR66j5+WwxqPCqS05+Yz56W6gJIUYebDqLS6itbH
 HMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=V9hvmykAevuOOCQ/mDqHOZfvp0zpZ9zjGEbSxFJG2Y8=;
 b=UAL7cxfbsx3uBdEsULTocPssYr4fT83SGbgj1EzNbO/2S4nw6j4WVqRdtfJOBr50q+
 qIWzhza2C/HErafjKmcRlci0g8lBQQCPdzKGzbaWXYh5Co4xVQirwGqOGMYs6mAXMm6F
 n3o4YE8xd1Z28GuNI5YEzwjn1RjE7+ve9y+QyN6YomxA5VKrCokcf564a5tFEreGghoN
 aq2K4NYbKy7pBVDf7RztmiDioCXXC2bbKqzCTyLWNGmIf6ZDyKzNzN10YBxDr9lh8eh2
 MwWHot5DJGSqe7AAS9xOCLCZc4GCy74PZBRNxVoxzzd7Nf4iSamWil5rvHNcpLGUQn5t
 AJjg==
X-Gm-Message-State: AOAM531zs09yS5zXzCHntNo772TvWVOwUAGTDQ/wsNuTpQgAaQQVJf+A
 Ewvj2O8880cDPShpaHIkQBnXmA==
X-Google-Smtp-Source: ABdhPJyNZ+pXgN2dD3x3Lhjew6TVqzwcGuq+vKBqSANi4dHcZTf+0TSJwRO1SH+90K53jD9HGYholA==
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr52439160wrf.351.1620915117745; 
 Thu, 13 May 2021 07:11:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p14sm2955230wrx.88.2021.05.13.07.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 07:11:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E7001FF7E;
 Thu, 13 May 2021 15:11:56 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-47-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 46/72] softfloat: Move rount_to_int_and_pack to
 softfloat-parts.c.inc
Date: Thu, 13 May 2021 15:11:41 +0100
In-reply-to: <20210508014802.892561-47-richard.henderson@linaro.org>
Message-ID: <87im3mlo43.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_float_to_sint.  Reimplement
> float128_to_int{32,64}{_round_to_zero} with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

