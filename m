Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D97E2B9506
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:43:04 +0100 (CET)
Received: from localhost ([::1]:53902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfl9L-0004IV-DD
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:43:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfl6z-0002rM-5Q
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:40:37 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kfl6t-0003O4-Im
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:40:36 -0500
Received: by mail-wr1-x443.google.com with SMTP id j7so6717378wrp.3
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 06:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=UhKr/hD4erty7MAzJUsEReOZUy20GtDiE7cbsaAmjO4=;
 b=BKJG60yD9kmWdR52vqOyxjswTrgKrXWRdnueFHZ2K2z0VSECVzKuojZfOWpTJAq8S/
 4+ViVH9oEAKTxF6bj5e6yeDndzt67Jeqh/Rg50Z0l/6RS/V8iNo3+veE8DMtzUerdoNc
 e5EAnCFmtMLfWBxuRjYZUZ9qczeK3GSQqX+POitnzV5640wVfe2fOqgfVE2xKjDcbLOF
 PPaqlBbj0aXJcrvHHIt80zSwLFb26YQywfAXQMrCvGsAmcGCAD1wIsAaEDU9xozCbe0L
 kYnwPYuI/M/+6GAP8klwgcr6jC/NOMVQLItC9TDZ/Qh5AuCaVVjVeZa1KxmrfMOwJ+Gh
 5xvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=UhKr/hD4erty7MAzJUsEReOZUy20GtDiE7cbsaAmjO4=;
 b=UmVct3gU7SU6zzmwkAgVdAA/mf58MRj17+E7J5RXuHooJon+c8vNIZYaUH5tfIo003
 WtjI29h6slNJgfa/etNFnFJF7S0azqynuzHjm2g86nUaRoKYkMwu6eoVNxqPSUAcq9ao
 EO3dn4yzzPalR3Yj6bEsnoR+kGrYP2VvPev7K+8Ovv5VQcBm0hExtVjQRZhB6kDaztUK
 MIPqwQ+/NwDS7vtoktuRtSdODylNGE8UREiB9eOe8Kpb/sQNrG4YxHaT0JwDllTqNCIP
 v983GIzsFt4baY3+WZZMXqRrx2n9/i2ZW6Xi+Gv2RcYnb8rdad0X9CXhTcpZ05e5X5T6
 U59g==
X-Gm-Message-State: AOAM533iVMegbEbLwCmSz8LaOC8ZXHQ27g13l3DbsSI6xmNX/tYdpVTR
 s4kLwFNgv55ZEuN/NaehJWEQTQ==
X-Google-Smtp-Source: ABdhPJyCgzXTROtPRsC4d+9a1EqqcykpKTSp+8V0w+VdpE/E+V2ZqOkucFDN/YfFuOy4Z6OnMRwsKA==
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr10527958wrn.408.1605796829768; 
 Thu, 19 Nov 2020 06:40:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm43120209wrv.57.2020.11.19.06.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 06:40:28 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C035F1FF7E;
 Thu, 19 Nov 2020 14:40:27 +0000 (GMT)
References: <20201117173635.29101-1-alex.bennee@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH for 5.2-rc3 v1 0/6] testing fixes (avocado, gitlab)
In-reply-to: <20201117173635.29101-1-alex.bennee@linaro.org>
Date: Thu, 19 Nov 2020 14:40:27 +0000
Message-ID: <871rgpv290.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> Hi,
>

Gentle ping:<snip>

> The following need review:
>
<snip>
>   - tests/avocado: clean-up socket directory after run
<snip>
>   - scripts/ci: clean up default args logic a little
<snip>

--=20
Alex Benn=C3=A9e

