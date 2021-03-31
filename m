Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 887473502D9
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 16:57:30 +0200 (CEST)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRcHh-0008A7-0n
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 10:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRcGc-0007iF-2e
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:56:22 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lRcGa-0005xF-82
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 10:56:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so1314615wmi.3
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Vj4mgZP4lMl8U8A00TywV5/7+HG6AYJ2zrX+UZomxJM=;
 b=gkT8EvCIGs98zsLN5cXeadaiNkIlaY3t5agFvgnuo936UJ6v0uTUZMSltGRJTpzLKh
 et2UUCSGWU0Pzc+E5hZtV8nvyfQaisnJ/A+cbLYrt5VB/JSsjkxciafqF8hXxCBiYvdm
 INUgEwx8Vx/yIzK9Xq5sOvLINAdcwQZtc+pl5jS7CxzZeWWGo3f01yr1tggtEOf7xL7d
 2uG7XkoAVyxfoRqBsiweTFSnObM/i71aaCV3UsTCb75dpgRkHvKctD3Od6Pv4zoknZOl
 nFkvKjTWzboVKS1xyQp985tcm2SpIX6HuXaAZNo2WagL99+HSIYDPYchzg7wA3H0Bg46
 /QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Vj4mgZP4lMl8U8A00TywV5/7+HG6AYJ2zrX+UZomxJM=;
 b=O4maHt1hkYkKOATbbpeWU5gog90npF2gw+unx81iVNGzsYrhERP+QY1+xovDeBHeB8
 6YJ4dL8zsAThkcE3DmT2gJyPQFfzcF5zmrFQRrBZ12vsoyBe5MDQFlf5UWAsv/VhcpZT
 84aTxnvX1Q8wbc2SZxf2PxaeKFkrwLt0MjfOUl3K5jaNgXUaOvDeXY5aeB0/xJ1V+f5C
 4XaO6GjOZO8/UTRj4ZErIn+bZ4b9oSaPp6vkPUP/mpV5axburCm3okzmR9QXC3hNj59L
 phl496AdImra6VILi00fbWaI4b7jOe/vvwBzd6u1iD9Ep7N2LN46fTxflDuokyWPbtJC
 IGCg==
X-Gm-Message-State: AOAM532KEK0gioEYQ4D2Mr3rN1l32qEJIjmnBzchsVpNM26eP4/amG7T
 HZkXwp87hCxSRc+xBqFFA5Ru0w==
X-Google-Smtp-Source: ABdhPJwkWT7cE1nFI4j2dD71ROIvEdUZ72TZCxCE/zt26ikbK7V2weAHF5BmAxXXr+1Dr30H8QoXOg==
X-Received: by 2002:a05:600c:2312:: with SMTP id
 18mr3547296wmo.8.1617202577677; 
 Wed, 31 Mar 2021 07:56:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p27sm4654893wmi.12.2021.03.31.07.56.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 07:56:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D8E8E1FF7E;
 Wed, 31 Mar 2021 15:56:15 +0100 (BST)
References: <20210331073316.2965928-1-thuth@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.yml: Fix the filtering for the git submodules
Date: Wed, 31 Mar 2021 15:56:09 +0100
In-reply-to: <20210331073316.2965928-1-thuth@redhat.com>
Message-ID: <87k0pnnzhs.fsf@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> Commit 7d7dbf9dc15be6e introduced a new line starting with
> "GIT_SUBMODULES_ACTION=3D" in the config-host.mak file. The grep that
> tries to determine the submodules in the gitlab-ci.yml file matches
> this new line, too, causing a warning message when updating the modules:
>
>  warn: ignoring non-existent submodule GIT_SUBMODULES_ACTION=3Dupdate
>
> Fix it by matching the "GIT_SUBMODULES=3D..." line only.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Queued to for-6.0/fixes-for-rc2, thanks.

--=20
Alex Benn=C3=A9e

