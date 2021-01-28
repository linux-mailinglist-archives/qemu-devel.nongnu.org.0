Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B20A307A97
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:23:53 +0100 (CET)
Received: from localhost ([::1]:39526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5A5I-0005G5-JS
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A2J-0003Sw-TU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:20:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5A2D-0003dl-VG
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:20:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q7so5961028wre.13
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=gXldtvSWcm36LCUNR6AF+C1N0SDfkiEAnkC5PpTDh1NeTlkZHqeWvwqEfufnPtiDtb
 Lgtj0uOo4KZCRLHGm80S6nR0rQ4x4Guy6t2U44qf2/jBHZldeLJutPDs0L2Fbd7wRBPA
 nO7FXYnAnePO3fnn/Szj6niDthy6U+IPNjJtuxSpoiIP0Hfj18ItOqecpFdMjtDzCy2Z
 yA1kedms99ZNovacFC9L/hoSuBzpfXEyfxZq/x1US1VgJv1ENY0OlVe4mv+qTUiMC3LH
 rDS1MR8QO7+R7R6b50PX4UoTx1Z7/6fhs5d9TbLU8pYJe2tO2TSbUTSMdms0tEpv6/hz
 p0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=bwjKb1uBWFTCHD6vX6T7o+J11VgfANcj2rhYsB9yabb0jGp3+mYVCH+qx29u4AlTFB
 zfZk6hlVVHI8xQLcll6vnyOcEZAJQKA6CHWbRCCvqAzvhtlcSYIUdjqKJx2oAh6BL6o3
 BY05heAm2Q7oFu1LlpBAYed4H8fAP18z/zMY4wXZnUyCGH9eNv3dMJftEysG8DB6qmNT
 lh0OFznqzEb0qyw38ro15Nwb5G3q9mxABxrMvZswipozN+gblH7krVgsqtHnf8RGV4sg
 DtyfaEfV34ns3DpKAFT2bRW29GT3f56SJKRnNfJr0yCCaqnyfW8bO/BvOnbLn3IRkdL2
 OC3Q==
X-Gm-Message-State: AOAM533YP/OhIdRR+FCnGjMc7PVumFTtttCS7Bg9ObRzOlNW0ZTwors5
 itzuomwBFvdrtIabFDRY+JoIMW0RTbRuafFg
X-Google-Smtp-Source: ABdhPJz8uY4KKlYClYX9SHdy9ZMeTuuozcc/EKYRppLtyLEX7ETByv5H+/h5JStkuMbnSD7HWU8RnQ==
X-Received: by 2002:a5d:4b0b:: with SMTP id v11mr16863450wrq.226.1611850840444; 
 Thu, 28 Jan 2021 08:20:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 192sm7195600wme.27.2021.01.28.08.20.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:20:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4971C1FF7E;
 Thu, 28 Jan 2021 16:20:38 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-16-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 15/23] tcg/tci: Merge INDEX_op_{ld_i32,ld32u_i64}
Date: Thu, 28 Jan 2021 16:20:33 +0000
In-reply-to: <20210128082331.196801-16-richard.henderson@linaro.org>
Message-ID: <87tur1t4mh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: sw@weilnetz.de, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

