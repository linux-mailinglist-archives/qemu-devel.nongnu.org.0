Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D8A3075A5
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:14:19 +0100 (CET)
Received: from localhost ([::1]:56042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l56Bm-0002XZ-7s
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l55r4-0008C9-0I
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:52:54 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l55r2-00019u-CH
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:52:53 -0500
Received: by mail-wr1-x432.google.com with SMTP id l12so5105858wry.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=TBuDbQ2ImRM1hAK/NHptTnbEK5bf/MlAjWM9xQpjMrU=;
 b=YXD9HRRkbT1+BCQmOaXEox/3+kgUTqTTBPuoyO9t8h5ttqUtGgNmMDPk6LFUQ5ZAl1
 qiV4CflA9QutX/MMuUxXnhYfJ1wC4+83ICdqAY70Iz8I/Z86H1TuVg/uHaooGa4UA3+I
 3wQao7X2vgDs4+pjvyfD+noCq4GH4dwVaYq3kGd1UGzLkE43ppIYHmTCtubeVjZ6XgBq
 JrtqJEljH6MC4KbeiSzCjhpO4rg6DjFgiM0y+M3fbZoPC8LaTATQmoNnh8+WWNBFwyCf
 rc4ZK9gTCturecNb6A+MYX7pNo5UsKAokByUBn9/6i+w2u12L4KJu/H1L2wYiju/ROPQ
 S9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=TBuDbQ2ImRM1hAK/NHptTnbEK5bf/MlAjWM9xQpjMrU=;
 b=eQwoYMIoko9rF0Y39HgtK/TZkljqu0j0cvxcdRCRGmlmbDku1pA9gGFyPBnBRAqTzs
 c+mk708O6vZLh3IOwgfVCkURnIuuyC2JkD7Xlnd2+OVcC/s4zgWPuN2mHYwz1+nbL47U
 lORvuSlIUGa0NH4UdE9WHnj9C9DB35CTY2q6Ru4lA5EJxOrnA0+TnzL/GAyW6TDPd3f9
 syk4sZlbj6psjc4MxmjfZRbhFLV+AD89JYo9WMOLm6v0vm4a7LoDkAXbnZ+k5+51FyT4
 oWVRXud1RHuDmLNd6qS5jBUCeT5CmEWDdhb/WwG9A3O72xzak9vOFBRZim7dKAoybfEZ
 T0Jw==
X-Gm-Message-State: AOAM532I2kF9UY1CNbU75wXi3u2SRdEE4lpJkG9KMk7IeG5pBo2qebFZ
 AgpIPGVqCOHMhe0Xg0hGxYbPjA==
X-Google-Smtp-Source: ABdhPJwOWAx+J9/hj/aqeCfrSJeWDrfHbKYsC13tH3qcqsLQProfrNjfOqZtdA99AlXYKDXJ5NUYBQ==
X-Received: by 2002:adf:e7d0:: with SMTP id e16mr16226128wrn.363.1611834770485; 
 Thu, 28 Jan 2021 03:52:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h18sm6704236wru.65.2021.01.28.03.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:52:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C2A61FF7E;
 Thu, 28 Jan 2021 11:52:48 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-2-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 01/23] configure: Fix --enable-tcg-interpreter
Date: Thu, 28 Jan 2021 11:47:44 +0000
In-reply-to: <20210128082331.196801-2-richard.henderson@linaro.org>
Message-ID: <87im7hwa5r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

> The configure option was backward, and we failed to
> pass the value on to meson.
>
> Fixes: 23a77b2d18b
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

I was going to say I'd seen this before, and indeed I had so here are
all the tags you can add from 20210125144530.2837481-2-philmd@redhat.com:

Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Tested-by: Stefan Weil <sw@weilnetz.de>


--=20
Alex Benn=C3=A9e

