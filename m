Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CE242B29
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Aug 2020 16:17:38 +0200 (CEST)
Received: from localhost ([::1]:46226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5rZR-0006bW-3q
	for lists+qemu-devel@lfdr.de; Wed, 12 Aug 2020 10:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rXi-0005IQ-CZ
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 10:15:50 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k5rXg-0001rU-P2
 for qemu-devel@nongnu.org; Wed, 12 Aug 2020 10:15:50 -0400
Received: by mail-wm1-x342.google.com with SMTP id k8so2112677wma.2
 for <qemu-devel@nongnu.org>; Wed, 12 Aug 2020 07:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=icRLnGV3YL50+5AjSjMAxhtAvXTSbCOpbMHrDDg5Hlc=;
 b=Ykx7MKtzD2rnumU3qIbcpRARArQob0mnRLRK3lKZ7VsapDPOcGY88qqsSDvphnwUUG
 sFPFUiSJDv9kYDAlobEYH2RV3xemziamCRB49qVjulVWvo6kNVFKd5zyFu9i06mWvBoC
 IxmAreX2d1QmXayrvDL2wpTOZvaUfFL51hSoA8gs1Ngx/cxAEKg+Zx7EJouuTT41Ogs/
 EvukgBHFEaaMijveYiCoS7YLu7ke5XbZXvNOumrlfxTiI69WB+a6oNOPxiZZLoHRk2qx
 USre0DA+jbjrqL44G3+5dHz6wCQUJg5vhwbWyDw5URPdn7gBup0nh9DaNSgPcS6zJM8s
 dUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=icRLnGV3YL50+5AjSjMAxhtAvXTSbCOpbMHrDDg5Hlc=;
 b=jIA1mW8OVpoQzNAO37SyO9jDepW3HsY/FSSzE+Jy6oC9xfV0HO7KYZHbDlODtamLb+
 LnCz1JbH9iKbsJg9YzkTf07SHgtV3n90J45FgzoYisyDVgnDlRpi7ChCdnlwn+jxV1k6
 VhTs3pQ77MseORLO9cAKxI95wNGzW3perrPm3G1igZJq3qalOrBPXj7lm5xDLzMjN7MP
 mzT1QPv8/02hmuWvdyFaOIfKVk1n/uJnojIuAlArhiwazL5HwR8fsL7HfFIMNisYqhWL
 2PdMo+Q98uWFc15gYajRhaznTKvYxsGvv7KU5JxPHB+YJDsC9h8bhs99TeP2JEUS0l5h
 chVQ==
X-Gm-Message-State: AOAM530w9XWchh5fM0TCWIw0zMx0baV5kxPu09WO72Gu0bT/iXKqcRdf
 tjMqvAmljCxmvshCvYIskmIoG4mFw28=
X-Google-Smtp-Source: ABdhPJw0wIAZmyNr11sirpBgEH1L+D0rQv6a6bQ6Ivc9i8t03uL4tYjfd86TgXZTCFUpky00KIaHYA==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr9382wmk.108.1597241747359;
 Wed, 12 Aug 2020 07:15:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e4sm4505298wru.55.2020.08.12.07.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 07:15:46 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 749551FF7E;
 Wed, 12 Aug 2020 15:15:45 +0100 (BST)
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-7-zhaolichang@huawei.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: zhaolichang <zhaolichang@huawei.com>
Subject: Re: [PATCH RFC 06/10] linux-user/: fix some comment spelling errors
In-reply-to: <20200812101500.2066-7-zhaolichang@huawei.com>
Date: Wed, 12 Aug 2020 15:15:45 +0100
Message-ID: <875z9o0x2m.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_TONAME_EQ_TOLOCAL_SHORT=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


zhaolichang <zhaolichang@huawei.com> writes:

> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the linux-user folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

