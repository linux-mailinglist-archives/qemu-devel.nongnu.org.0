Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9334205748
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 18:34:11 +0200 (CEST)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnlsA-000870-U0
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 12:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnlqR-0006j3-2F
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:32:23 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jnlqM-0006WX-RI
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 12:32:22 -0400
Received: by mail-wm1-x341.google.com with SMTP id o8so1814046wmh.4
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=O7NmUH81xFdRxSc/9Xq0BGoPQVaJ3xy3XT1+ez+ecfo=;
 b=TAkIaS1aNiIuokONEDy2S0MapI/zL5x5laSctgVT416FnQqc3ZtzpRo0EqwWTpiiwL
 WPHxsoA/IfI1Q43wMRUgHsmr58eTna+YUWX7CBNr1lMAlXIr9ePAKXDT83QLfukQAgZG
 xcaQ8IyAhMxjUh1lMLQr2lCchSW41T+HMfKDVwDC1hrhK+tDNBY4TmDda0QjiZyQnPut
 kP1YB8XI/BTlOfTSmgTpnTG4oonOM2ZbQsj4F269u2DP1GGvzZPc08Vhlx3T4bUaiUDP
 H2PidwufBvHL2eohxXm40EA8I4waFUI2u/iqypRQEID0ryx1JZEHztsgL3VEcIHVKWSD
 Xeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=O7NmUH81xFdRxSc/9Xq0BGoPQVaJ3xy3XT1+ez+ecfo=;
 b=Py9S7ZYVF9MzOYD+OxidO0tsCkB8p+bYwz7Ao8QB2cqosCWhCdrvcjVlBYxal26TIv
 kVZ3TYZJosxcbVvwOyioT0n84/UM145zhQT3yw1z5Yb2sclz4VAMcbRtkG2rts3AD35J
 w/azC8dkGf/NYikv3HDHR6Y35Db7j1PGCv4LohCBFEWiaYMb6H6hQeZ0s8fnz12KXqTJ
 LH+fexC6MxnGUPnZK+77wwqlPdoJdmGdRyyE8rCQdA7zFdZCwVPjF8h3n6Xvg6E/h5Xi
 vkJo1nSiRfozebXKAqnYVcHvgkzdYN1ARRRW8lhBiOc6mhnTlvDxWjlcf9fLvxiVSssM
 zAcg==
X-Gm-Message-State: AOAM5323m2zSfywysZA9qbMIMJ+oXtvVdcYxTea+cCxXjqq7E5PM98Ro
 fYd8FVBVO6TND1MFlTUqxWlWmA==
X-Google-Smtp-Source: ABdhPJz0W9GIw8Y9d5FpUhl4ad8OrmEpnCueTvdE5uFt3BQdyNTXoL7MHWCXnZ99AVOWvUmrJ031gQ==
X-Received: by 2002:a1c:b007:: with SMTP id z7mr2705780wme.37.1592929937023;
 Tue, 23 Jun 2020 09:32:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z1sm14798086wru.30.2020.06.23.09.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 09:32:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 576E51FF7E;
 Tue, 23 Jun 2020 17:32:14 +0100 (BST)
References: <20200522023440.26261-1-richard.henderson@linaro.org>
 <20200522023440.26261-20-richard.henderson@linaro.org>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 19/25] aarch64: Reorg sve reginfo to save space
In-reply-to: <20200522023440.26261-20-richard.henderson@linaro.org>
Date: Tue, 23 Jun 2020 17:32:14 +0100
Message-ID: <877dvx920h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Mirror the signal frame by storing all of the registers
> as a lump.  Use the signal macros to pull out the values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

