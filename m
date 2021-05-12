Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5301D37BD8C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:59:53 +0200 (CEST)
Received: from localhost ([::1]:41468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgoSu-0004M6-Ea
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgoRV-00033D-DV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:58:25 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:41568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgoRT-0005g7-Ok
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:58:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d11so23513913wrw.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=eryLC49nGxEWC6c/jbyn1CMkshFpE6DrCUdvCl2XBRM=;
 b=o0nJ25nOI5B/6koEQKz2y9wUdHuUNQltnvJb3lxfuPGnNyMj0lOQ6Iz7BB7KyLmt4p
 vSDksWSW94OvV34MOn287o0VA1OC0/0ldA3omdsBs4chjuV3KfWS0hiVFKroTJfLkDfc
 cTmBuAk5GHDSjFzgyySog4Pri8MPWNG8acGLBdE35OdMz4WYTHocWtJj81zi00UmcEFv
 qlKt08ITfZilOMXpSNOKHViG465y8MUXzg/ZQaT0BzfnTnkLowCt0k0r1xGIHpT/iRJq
 YWhhNtYclp+Q0mqjAtXzJOnXInaQMQFao/ufXVk5fYCco3mavr+XkKo4fYm0/N2tdtT9
 1Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=eryLC49nGxEWC6c/jbyn1CMkshFpE6DrCUdvCl2XBRM=;
 b=R7642Jtfkr5ucyJujf8igD21F8OlRn1+zaix+wkUaetnZjIAgTZ8qU0smcwiUX9xjm
 4q5l5fBh/hflf/XHi3VNDrbmsBrVuQi5FK135J5ulSBjTeaN88f0pH/1ILpM2qkgYsE3
 bcVwRjQLljuP6zJIQN5gTaS020U9JGlDz+3nUkCNE8VqxVB/ty8J9jdQnpsQq8a3Os/f
 FkiiiYkofNo0mdSHWS4FiYePyhO0sVJCnLs1p0NhurYv4p3uwfAYzGIG8X314LDwhQVX
 bcHk8W/IAq3myyXjMUDJjI+Ad+Z0oY/1iLiK1YE9NwQf9PqXdhwoEj6IUdowLaFBlB9g
 OdBw==
X-Gm-Message-State: AOAM532s2TjrZqOduuW9sLuFkrl6Slm2TCfn98eBZHY+Frpmeyoix8E3
 XZ+KKvUS6OSybtKBkyVZUmKP/g==
X-Google-Smtp-Source: ABdhPJzYajRnXmUUrdvFDsou+c54UPZfiKJVEScHKCN+SvjUeofZ6vj7dpOQ+iXB7I4+9DOhZqOvUw==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr43757013wrs.22.1620824301724; 
 Wed, 12 May 2021 05:58:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g11sm31280658wri.59.2021.05.12.05.58.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 05:58:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B9C851FF7E;
 Wed, 12 May 2021 13:58:19 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-19-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 18/72] softfloat: Use pointers with unpack_raw
Date: Wed, 12 May 2021 13:58:14 +0100
In-reply-to: <20210508014802.892561-19-richard.henderson@linaro.org>
Message-ID: <87mtt0f6s4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

> At the same time, rename to unpack_raw64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

