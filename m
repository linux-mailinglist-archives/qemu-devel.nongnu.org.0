Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F7B313EAC
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:17:17 +0100 (CET)
Received: from localhost ([::1]:50314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9C28-0002ey-91
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:17:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l96gB-0002Vw-7d
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:34:18 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l96g0-0004Cp-2m
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:34:12 -0500
Received: by mail-wr1-x436.google.com with SMTP id v14so1567352wro.7
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=8xQ8NTAa1qNwkvm959+RaRdezYg5tTtejQG8BM6rY8c=;
 b=qADVBe6r0nuTF785wOt/B+tX/y3cwHXBk8BMELxcxh2dD9lurIAvHvlHf2zetOWkpS
 aVocqOelZJw05G6mT3mHm5Tyqk483jFsLIFQOXjt+bG7ZW891omqzA/R2/cnDsfei4vS
 bHxJHuPx3aWCz2hcWwn9c3yYs8ZbB+KqJ+bWHe0NYYDBWWtetP3f5RpB1zBz0W9DVZtq
 RNlmnu7G2rX74N8BS4h8b/OrNjEOiRKpG68qFco666A+REOnvVaLUgqs9j0ArgS0kd9U
 jhyHf0wjAzpr423NTpITRM/bk9h+R6UqfpJ+NE2+yMV42gPGNkecw9/ydgjnHP9/M+/1
 HMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=8xQ8NTAa1qNwkvm959+RaRdezYg5tTtejQG8BM6rY8c=;
 b=K0SPDPwDMJSol9xZVqJo63zlp4FPhmKDoilRPJ7RBDWEoQtiO9b+QjC9zQH3q6LzAW
 r+YqD27q8BvRBXmX+qsc0IsdlP0pA3fw7Ho8j8LwIwBcXs4pGMg8jyn+n08AuNnUX+oi
 3UDo7YQ6bGX8pF2qcgrqJNHZ3WXJB17vgi5sZSQBWqKlBdgW+c1Q55DrWJ/KI0Koe0Wq
 c7GgsSlubK7NGkKiv+o/cHaXCNGfcli1YAfuImdIXsAqTFovG8Gtfz1FtQD7qYdYyaUJ
 vShKObhGRsc7RQTseBP7hbUWTxc5HVsNB4aV22/39mrJePDWjyVwwvmAy4vP2ilJ0sZf
 3raA==
X-Gm-Message-State: AOAM533ywhHmM8qYSk1QotyFZddDBDGvBmGheXjickgU/ziNA6GOnd90
 toJIcS/Mi9hI4vaIfa2pAMZ/Qg==
X-Google-Smtp-Source: ABdhPJxA5S0OgfcYpCV9jiJ15s6rQrDkxTbVOZkrB615sjvp5rZTJFbuUIMxhWh/1GN3Fni8jcXsiA==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr11108644wrt.238.1612791241249; 
 Mon, 08 Feb 2021 05:34:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r1sm28562911wrl.95.2021.02.08.05.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:34:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 851C81FF7E;
 Mon,  8 Feb 2021 13:33:59 +0000 (GMT)
References: <20210208113729.25170-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
Date: Mon, 08 Feb 2021 13:33:38 +0000
In-reply-to: <20210208113729.25170-1-peter.maydell@linaro.org>
Message-ID: <87czxabs54.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: qemu-trivial@nongnu.org,
 Philippe =?utf-8?Q?Mat?= =?utf-8?Q?hieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Noticed this because my recent patchset which touched gdbstub.h
> didn't cause check-maintainers to add the gdb stub maintainers
> automatically.

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Do you want me to pull these into my tree (with your other set)?

--=20
Alex Benn=C3=A9e

