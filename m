Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467CB1B5CE1
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 15:48:27 +0200 (CEST)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRcDK-00074r-4w
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 09:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRcBw-0006Ji-09
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 09:47:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRcBq-00034X-Ti
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 09:46:59 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:38027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jRcBq-000325-9q
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 09:46:54 -0400
Received: by mail-wm1-x343.google.com with SMTP id g12so6608549wmh.3
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=x2CpJ/nxJyeDrac9eQL4q2hSOXZ/7KFnhnarNYoOFOQ=;
 b=aBo86K0j+MHac3ScMveBT+SqMCMBtbkpXOTzYkuII4bh6ONI+/ZO6Wr8NaViZHt0oy
 EEDkHPzpsC/rl3FKL7s0VpH2NHcW00ySgN/UqDMeemgZZkFbH2X0WMYGv65PKzP+vV2V
 haeLxQ8RgbspspYdJb6K7cDhvokgvhtT0+QGVtPLkaY9AZN7onFKoaGQvLiMsFJEFMwe
 2VLjU046FNHjbfDqdEV/Xa19MUuUR5yQlb3Q4o0rM6OzpSszw317X2/lENLvymG+KzPO
 P/79495wAijW5K5Yv5ekD7d4J5mvP9fFsg4H7/Lqwovm6bmkzberdRHs3XnnaarDSuyu
 oBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=x2CpJ/nxJyeDrac9eQL4q2hSOXZ/7KFnhnarNYoOFOQ=;
 b=Rg0uugu8m4K21L+ULeskCtAwPMxdUGPMUX5RpQctKreBgXa9MjENooY9WZ/ZXSnrhj
 7BEmiB+Nhec6gKUqBd+TodbZKXZmxTpjrkci5jo8WilDg5WqecH3GJtGVuGGAS/amc5/
 NlooTQ/J/irhcDXIjoX0Vp+ljcZDGCAXaTnEJ3SPNfzq/u5G/Q4sQVQ2LRHUBn+0Ijtv
 ByijOjWo3qiYf2vA5NHZes4EWA+AKwHFhwA0JLj7O99dNUJnKMhZNH517kUTn9DAXqDt
 +lfwKc0pmODYaOP7c68oMoqWneJ2x+jM2ssEab53j2yEuJp5yLF2IqiSTVIIWQVIynHN
 zEpQ==
X-Gm-Message-State: AGi0PuYNklJp9u5U9WzZtLRipYOKh/ekKE1/5L/c1scpNp9udj1lG31C
 RUthVJwenZ/8c3aIMlLk4TGJ4Q==
X-Google-Smtp-Source: APiQypIFeWnyFs0YBj0AO0MgfxgZ4SJSsnNYWMFJzWcWO0AbXP2pRwBVWxCNWKKvLdcYvZupn+42jQ==
X-Received: by 2002:a1c:f014:: with SMTP id a20mr4241750wmb.86.1587649611830; 
 Thu, 23 Apr 2020 06:46:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u3sm3741821wrt.93.2020.04.23.06.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 06:46:50 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2413B1FF7E;
 Thu, 23 Apr 2020 14:46:50 +0100 (BST)
References: <20200422011722.13287-1-richard.henderson@linaro.org>
 <20200422011722.13287-32-richard.henderson@linaro.org>
User-agent: mu4e 1.4.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 31/36] tcg: Implement gvec support for rotate by scalar
In-reply-to: <20200422011722.13287-32-richard.henderson@linaro.org>
Date: Thu, 23 Apr 2020 14:46:50 +0100
Message-ID: <87y2qm9uwl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::343
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

> No host backend support yet, but the interfaces for rotls
> are in place.  Only implement left-rotate for now, as the
> only known use of vector rotate by scalar is s390x, so any
> right-rotate would be unused and untestable.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

