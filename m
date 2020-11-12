Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2052B0C71
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:19:43 +0100 (CET)
Received: from localhost ([::1]:59316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHC9-00024x-Qc
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:19:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHAT-0000vS-L6
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:17:57 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHAR-00075y-K1
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:17:57 -0500
Received: by mail-wr1-x429.google.com with SMTP id o15so7026570wru.6
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=i1+ht4Q/Oi4fW1tCR4AAJwn+Oc0mydwWdhkJYIpw/cw=;
 b=Uz+7M6qDPifDrl0Qx3fDElDKDE7ig+z2RHpsjMcgxsve7yrEHRmb9KH/5I+hWNDvdU
 OpTgzG62PBp0GSZjXYPuQq08PxN9V+0y4uvPXrRZWT2d57Z00q5ptDJEytSv35ybjbPp
 bkukIbS9WkO03XEOi6afUzmOYkJRT2vpzosuhIyGe6he4XSUlYTwRxrjSpWOT0XkwLkU
 n2T4r92gE2GGRbCNqrN8uA+6eGN90k79WZ8DQamwFTRWaBLX6/WkWQHjhFCuy+A/APiQ
 k8OyFVSm+9QH08dIZPTlFUVBPssUXeaWPQiIXnKh+Np+KqLOLK08qkCPYuC84dNspJho
 +ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=i1+ht4Q/Oi4fW1tCR4AAJwn+Oc0mydwWdhkJYIpw/cw=;
 b=N95oweMJA0EEoE5xuWIRKn0vT6WshyxIIWuTPbzWtSsVqlLYUg6ZNgcEQC+JsboRzT
 cFIahM4YUJrStj7bUA9rQKvqSY3p7wC8gboRD9iss/JKcHO9XUWhvr0dAC3HcLt0qKGW
 rkWN0DMRVpFKcQAxK8KqLRsVQaamEe591m5O0tsHyQ8GTVckPhJ/hOZEeGMV+6mpGOf/
 b2FBtXWLE0+mogg1LvWiupCyj6zyMgMMnfXU7eQZx6ZXweyGILoWYz72A093hdtcE/Mp
 rj2Zd/rZdSZCwNzRKGleHH5wI/9Fnkpz1ZT26JpecwMr1Jtnzbj3ZC2oUjwUZ6xTKy+C
 68NQ==
X-Gm-Message-State: AOAM532xlCGsONeE74m4gLgUe/NLHgYF9jbx/fLhQsox/rk5y5OhlYoC
 ZTdZwCXQoQfafHrV+yGmzBFz8A==
X-Google-Smtp-Source: ABdhPJxw//926lU076FfWtPerX86M0sdE7iNv1DeeycqFDsFa5fKQIhHR+JiftKqjJyZ59AIFHBrYg==
X-Received: by 2002:adf:f181:: with SMTP id h1mr839172wro.267.1605205073939;
 Thu, 12 Nov 2020 10:17:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j8sm4450310wrx.11.2020.11.12.10.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:17:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BD4DC1FF7E;
 Thu, 12 Nov 2020 18:17:51 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-4-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 3/9] docs: Move virtio-pmem.rst into the system manual
In-reply-to: <20201112144041.32278-4-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:17:51 +0000
Message-ID: <871rgy7834.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

