Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85443CDC99
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:34:33 +0200 (CEST)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5VHs-0005xb-PH
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:34:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5VFo-0003EK-EJ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:32:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:38889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5VFm-0001zy-Ot
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 11:32:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id g16so22567689wrw.5
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 08:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=rFC3bXhZfPGmJJhXW8zMANc2F720kriDydpRjYKDZHwZJm/Jx+oskA80sm6t7uFhjU
 FrrA2ZSmTZj1k+gpza83PjL0zwBR7/NKwexgHes+Onn0no2nHSdZo1LBVogmTN7POrMI
 p0RRXCqm4rUak7/JU82Q25QG+VRrkeEcpZYB9yBby6W+rJydDPZ4m5/LtcMBQ6W1e6RZ
 rYsMCSDnLUVgQWTnHGxbvW7bs3sKWAe4cHj3/LPaEJljPsS64hrkxLQCOAH38Vtjebkl
 bX1PHWkirD4hB5BtxA1yfacRO1/U7FEOsexLJd8HypDOug4dbI1jVp0CcC/oMtoga42R
 JQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ArxRg9O/H0Ur0tT6Ee6HWr0R2zhrxnm5DbEFs3RMRKU=;
 b=JJ/WbcOTpDjJ+qE5vmYPuC4HE3nSwmrzFQqFenEMQhAA34cfKn729u7g13t2jJgVbQ
 eoZ4e1VxEE8wEmBftHWZIgj0c7BxymJd1UDxVkjfw9HcJ2kfmf+bLdxN8vVF9hfXDnud
 bksCCRbcmb9OiLQYGn0IW93pZ1pfhVLVn6vqBqf2b2M/wKxp89SMGxyWRPvtT+ybv8OQ
 W9OrIYIvOHy9PeBqgZ3BE07bvD/fdLnMicS0RcHtptrChyiSIWry7fiLIkUyffos2zJh
 fIntsu/mnj0JMQRIMJu1R2dtqRPblo45QHMoT3nAq0xlxxXrCJ9pH2W6oLt8rXB9WEf7
 412A==
X-Gm-Message-State: AOAM5305VhZMUJf2VQ90uefcb0Hg98KhTEg6QSjy1Q38/7ih36v4aMZU
 i0c6cMHAvlPyTYWnqH/ymnhYRA==
X-Google-Smtp-Source: ABdhPJxRy660Rbk0WVByAaPPNwAsERyMvuZ5NFXAPa+cChX5I6jR5ZpYD8Sh1dLjpwzRfvzJ5mlw6Q==
X-Received: by 2002:a5d:59a1:: with SMTP id p1mr30736601wrr.100.1626708741444; 
 Mon, 19 Jul 2021 08:32:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i10sm9288920wml.31.2021.07.19.08.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 08:32:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A54231FF7E;
 Mon, 19 Jul 2021 16:32:19 +0100 (BST)
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
 <20210717100920.240793-13-ma.mandourr@gmail.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 12/13] tests/plugins/syscalls: adhere to new arg-passing
 scheme
Date: Mon, 19 Jul 2021 16:32:15 +0100
In-reply-to: <20210717100920.240793-13-ma.mandourr@gmail.com>
Message-ID: <87mtqinwu4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

