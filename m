Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 473FB3089DA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:24:00 +0100 (CET)
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Vct-0004Yn-CI
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:23:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5VaO-0003dc-5x
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:21:24 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5VaL-0000Yn-GZ
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:21:23 -0500
Received: by mail-wr1-x434.google.com with SMTP id 6so9213302wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 07:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hhaEV3HeCOp3JLOIgFE7U2FYbSLkQZwhT4v6HG1odug=;
 b=Af8dZmvxMJxCqnMV98uZZEmZt5o3KG6eqRN8IHyBiydpzme4/hgs42SXDzZac9psxq
 jh7THbirIIeEYhkNF7TTh/IqRzFjjiN5HxvfB0Z+F0j3y1mAFkLni5evQJSfuzalBgwo
 IXvCNJSc2GM9+NhrM/199FhjeLC5XU9sk4ym8l8Vjfp4gwf3devA6d2UnGJe41OV6AXU
 yF5VmkIst3c0YNFoxvN8sDTHhoNusEW3F5ofDPe9UPZWr0BheGmL6x0Su2jYhVlEp7G0
 3kA0MfrYGk80eUwl9b50TZDXS9c6RpypOyhdjq81zNw5w/Np/xXE+wEXRUtlp7auCF7R
 j12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hhaEV3HeCOp3JLOIgFE7U2FYbSLkQZwhT4v6HG1odug=;
 b=boiF1TIFNc6wGUSIi47toke6Ny9xAh5XCs8xOIY8Ev8Ngkz5kTqHyX7UlmDycJzZTS
 Pz1h1H1MrVHBFINw8svlTENiwRLUafzfOYqCW4Z+KkLnOanPLK98S2MqBdLSbrxamR0d
 tUO2nlqUTDeJrSgKSgUNGZh+V8BVmg77clXXUHJjo4XHgfv468xsspWfLmUL8RM+vHEv
 3/HOVXZmfStqVp6lqzZpAw7ZEJr8IWfN+OB1VVtdK/g44t6CrC6CiUQFR+vq4dC8/HES
 9vj61giJam+Tw3SO1M92cVS7YiTQx8wDz/13xMJ1GZWH4MvFDZFLNmIO0z5QpoL2Maj6
 UzfA==
X-Gm-Message-State: AOAM531Mt3OW7N8G3MvZeo4csks+Rdy0x2C8Zn8OHF5BqYD0Ki5hoj6W
 msdmcgj81YmVkbpM3fs5YfXNYg==
X-Google-Smtp-Source: ABdhPJzOhRZt1K1LcFZsKlzzOrXJ0YdPsSlvOpjXq7aqnVbNlcEPoMy+6p1azAujgOtsCfz2EKlYvA==
X-Received: by 2002:a05:6000:1082:: with SMTP id
 y2mr4937433wrw.27.1611933679767; 
 Fri, 29 Jan 2021 07:21:19 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m18sm12399044wrx.17.2021.01.29.07.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 07:21:18 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB3D01FF7E;
 Fri, 29 Jan 2021 15:21:17 +0000 (GMT)
References: <20210122181854.23105-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH  v2 0/8] testing/next (docker, binfmt, gdb version)
Date: Fri, 29 Jan 2021 15:20:52 +0000
In-reply-to: <20210122181854.23105-1-alex.bennee@linaro.org>
Message-ID: <87v9bfsr9u.fsf@linaro.org>
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>
> The testing updates keep on rolling. This expands on the last version
> by adding some more handling of weird gdb version numbers and bumping
> the minimum requirement again.
>
> The following need review:
>
>  - configure: bump the minimum gdb version for check-tcg to 9.1
>  - configure: make version_ge more tolerant of shady version input
>  - tests/docker: add a docker-exec-copy-test
>  - tests/docker: alias docker-help target for consistency
>  - tests/docker: preserve original name when copying libs

Ping?


--=20
Alex Benn=C3=A9e

