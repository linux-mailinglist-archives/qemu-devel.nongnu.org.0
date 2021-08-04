Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C208B3E06F7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 19:52:47 +0200 (CEST)
Received: from localhost ([::1]:50908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBL4Q-0001Si-Q0
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 13:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBJ0z-0007w9-IP
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:41:09 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mBJ0q-0000Hl-9L
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 11:40:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h13so2767648wrp.1
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=DVYhckofxPv5/aAdDXUByoSNSY8m8Bq3tA0apV9u2qg=;
 b=frFrNaTzMNx5h0p+0vZGuXWZDD0gpIUox30yQ+2aRZun/YGNLkSC9yMCCFniqsv9e5
 ylALmycJGC3UCGZjmmR0mXg0ZHCAPEH6trOfKBadMx8mL405CM1FMpdUMI9k7WnOjZGD
 gNcG19abHOKAdSAWmut7YUwZN/WpV6COMYdh3WwI+3sjxApW3A+SsYP8moD/e5qiCNdx
 rvotuxEaM7qHPHJx7hXhpNOtuLSCIqku31q+l+JiUNHV7LRyBDnVD2AxLwO9I0s1Kalu
 uDW+rDJikL9+UizNxa9vrwaC5NxRqh3GSNBNjzg3++d8gJj0grJexG1nFK8nQaqhFNPA
 vx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=DVYhckofxPv5/aAdDXUByoSNSY8m8Bq3tA0apV9u2qg=;
 b=OUBZZGLgUhnQkqUlfS117vGfvYh8/vLu+40Dohwm1wjEg1aI707W1Uy0qJdbJyJRbc
 8I8PmR3YK/sK8byeJ3bnl5FnNfXXqjFbrCgdZL11lVlOd6agrxJwXeKRSVnBnfODWTh7
 ieWtW9JPYfdijfOAMiDVNn5bwnhJALS14Un1K2FKKF/rcjHdpnL/JuOWg/MYCz3Dt89z
 OJa3w12RnQmZEHZMRTM5Hf3MMgE495kud9czq5b0KVy0HSHnak8YRYelXVaDMLXWWl1l
 QGk28vHrDobf6XjqpDhXXrto6P/zO+2D/w9+hx0prHzgzUsZZH94OGR8kra8dRVT0Gak
 1Kpg==
X-Gm-Message-State: AOAM533AYhEm5gsEKOPwFkSeGfJO8kD6vHAosWg0/AcsNLnTt+ijMFf2
 SO9I5jD4T2ABYUhTbsARA2E8pw==
X-Google-Smtp-Source: ABdhPJw1UltcObTMfx8uK9D1VBzl6gz9ixLL2t1Kqe1gjp+XuCakiRuVt2C/mH/q78V/ALtDyMSwIA==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr29352916wru.351.1628091654235; 
 Wed, 04 Aug 2021 08:40:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p2sm3084416wrr.21.2021.08.04.08.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:40:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 37F301FF96;
 Wed,  4 Aug 2021 16:40:52 +0100 (BST)
References: <20210730135817.17816-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH v4 00/13] new plugin argument passing scheme
Date: Wed, 04 Aug 2021 16:40:41 +0100
In-reply-to: <20210730135817.17816-1-ma.mandourr@gmail.com>
Message-ID: <87wnp1dxq3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: cota@braap.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> Hello,
>
> This series removes passing arguments to plugins through "arg=3D" since
> it's redundant and reduces readability especially when the argument
> itself is composed of a name and a value.
<snip>

Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e

