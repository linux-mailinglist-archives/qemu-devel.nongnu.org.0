Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEC38FFC9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 13:12:54 +0200 (CEST)
Received: from localhost ([::1]:37114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUzV-0005c4-9r
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 07:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUxy-00049I-GE
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:11:18 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llUxw-0002X6-RI
 for qemu-devel@nongnu.org; Tue, 25 May 2021 07:11:18 -0400
Received: by mail-wm1-x32d.google.com with SMTP id u133so16499643wmg.1
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=bE3lyICztMztRLFemuLcIjroPsk96tHjqcTbLuBjkh0=;
 b=WQQZnLUmpyfVMEIkQUqSal+YQ4BxcuPWy8I93sdJhi0GZa0hgCt3bGj3puxUFl30RA
 eyGQ6X7y8A+kQNkJYlMFP62hTocHS7edqshuDYmlVFMQ3LUT6cm4HtUhyxPrGDqGqv38
 JT1hvaDmC57OKc+ydiB63NKQQ1DuCdlX58galK0qHCnQKB9uZMmv0HsuG3yRpQysKxeN
 GI4hM8zBp7zsRj1n+YJZhNf98c1k/4y6T9TO9ujMF+E8DF1B58B7UFmVndXIvrBLPBXz
 J/aR++3r9Mtn8Pv/UTckTtqttX91wuJCS6khVi3MkNGCbU6XrGmhf0czOeiqTdlWBAJT
 rjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=bE3lyICztMztRLFemuLcIjroPsk96tHjqcTbLuBjkh0=;
 b=LJfaPHH5aHfY3X/1sjf7xcpNxhJc+aQYP72T1Il3LmpbkDFlBHIj+WXY+Dv8rD0GEj
 6q/e5KkGBRkaBNKa4U85HqQlB6KuERNuON+w1GuEaw3mElQj8hhBot82cdoxIR4s5xkb
 rg61xwCKudZoyWREcG8EnyayHOSGwPPtCFU2Y+VEh9y0HdPraM0FBljMkKOtAqS3PWT9
 gPkxmpPO3iSqhyvtiUdw71ZFLGl8PVV/U8DUKO24SdTOmC90Ltc84LcVZpBlD2gDH3P1
 rgUtCU6xmcsWzvXRoltoovoyLtHrGILlQYRLVkKOV1jweAz7SDvnC1XWzavsawPorrfC
 MLMw==
X-Gm-Message-State: AOAM531dfV19YJZqDFbrP1yT0OLxJ+45GGBVV+4tK/qg2p3VHU1ljlvo
 kbxpgS7/pwkSJZZfat0nU7D0yw==
X-Google-Smtp-Source: ABdhPJxWCrXwihDkx8AQ5ThSCeXIMy8Dhi5n6hFznaUzqXumP/0wfWGgRYJjSDM17oSqv9q1LeKGbA==
X-Received: by 2002:a7b:c849:: with SMTP id c9mr3388429wml.84.1621941075401;
 Tue, 25 May 2021 04:11:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z12sm15348101wrv.68.2021.05.25.04.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 04:11:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BEF341FF7E;
 Tue, 25 May 2021 12:11:13 +0100 (BST)
References: <20210525082556.4011380-1-f4bug@amsat.org>
 <20210525082556.4011380-6-f4bug@amsat.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH 5/9] gitlab-ci: explicitly reference the upstream registry
Date: Tue, 25 May 2021 12:10:55 +0100
In-reply-to: <20210525082556.4011380-6-f4bug@amsat.org>
Message-ID: <87v9772hm6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Since c8e6793903 ("containers.yml: build with docker.py tooling") we
> don't need to manually pull stuff from the upstream repository. Just
> set the -r field to explicitly use that rather than the current
> registry.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20210520174303.12310-3-alex.bennee@linaro.org>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> [PMD: Rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

FWIW this should get merged with today's PR.

--=20
Alex Benn=C3=A9e

