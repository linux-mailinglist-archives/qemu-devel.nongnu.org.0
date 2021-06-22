Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7923AFFBB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 10:58:31 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvcEo-0001dt-Hc
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 04:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvcDI-0007qX-Tz
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:56:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lvcDD-0003d8-Mk
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 04:56:56 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 v20-20020a05600c2154b02901dcefb16af0so1713463wml.5
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bYIm65vbeEP9kUwwmh24AasLSxFJVSsWu6TZ3hJAi58=;
 b=Mx1XCP/UMUOwKBltthHKwbpOTnwSh4HvbSrowB8G2qNlLADDs39c2rtBtp1rYGyH1s
 /L4a8CtXZ4PDBy6YB6Fyjzc9o3ollxKwh9xncM7l9W9tUTwTHevzGok2gnzg7x/2qQ4+
 9hAeGWEIdZ43ASWygRXIe8w16DkroeBgr4kg2N3hkoZNzwzhv+bnUXFFjzn7n+fpVVx6
 Cb2ddSJaD1T3o3HCH+X0vPS1iU0Fyi8KPXjhiW47Zs2PBXLlnDTKJwq0AneUX4ArzQVc
 k/R7Sa1dfcS9GxyJ2eE0/D5Yl1YfzKRLC1A2VeodNDI5mgm5taO0Iz2ZY1eoEbqYMx+f
 DdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bYIm65vbeEP9kUwwmh24AasLSxFJVSsWu6TZ3hJAi58=;
 b=TrYt+jFFTiA+weNEjKKSuShkQREyocSTxVOQ85Z2w91PsXDUDfZf5dnreQS9O8Lgmt
 bsH34oMuTv+kx/Z6tUbTyQmB/x8svZF3diupUJiDIVZSHjR9FC9F873KU3sh8bTfcgl0
 QvLYJKX9sD5U9zLMK7gJa9p9XmGnCLxZ3yBep8MNjja0H0sxAHlhDlUsXRmB7A4HE9xi
 N3Pn+tx7oyzmLZA5lS3/vG44ywERPs0kVjqi0sW1fwfHYVaevH97hYSpkkTJf5Xj3AR1
 6dsfTHSr7P1v7lZg65mfNrsTMiOXH8ZKv5cguP8PEKfBVg3gqhbak/J6+nW6jZzYXfCJ
 o8kw==
X-Gm-Message-State: AOAM53163S+p/TriE9QK5drn33FiFPHcrXh4+0JWB0RvwnkhRzKZJMMR
 qoia3L9rSVYuDj8Nzftqx7V5ig==
X-Google-Smtp-Source: ABdhPJy1fkMEXdx6mX4BJSnieK22qEam8DLAkXKk/qsh6Bi7yuiN9zvoq92rFfLqFwveFiM6K0DAmQ==
X-Received: by 2002:a05:600c:1d0a:: with SMTP id
 l10mr3337625wms.124.1624352209995; 
 Tue, 22 Jun 2021 01:56:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm20440540wrx.80.2021.06.22.01.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 01:56:48 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C29F81FF7E;
 Tue, 22 Jun 2021 09:56:47 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre Iooss <erdnaxe@crans.org>
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
Date: Tue, 22 Jun 2021 09:56:22 +0100
In-reply-to: <20210618091101.2802534-3-erdnaxe@crans.org>
Message-ID: <87v966s2eo.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre Iooss <erdnaxe@crans.org> writes:

<snip>

Sorry also missed s/tvg/tcg/ in the subject line.

--=20
Alex Benn=C3=A9e

