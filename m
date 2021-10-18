Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9A4316C9
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:04:38 +0200 (CEST)
Received: from localhost ([::1]:59268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQRa-0001Qm-1J
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQKc-0004OX-4c
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:57:26 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:50998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mcQKa-0001XY-Ja
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 06:57:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id o24so939512wms.0
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=Uh8/MyDTxHdzMUpq1MgdtgH3CMesXn5sD0awuczitP2dGe55NI8vJYnd5lmmBNqC3I
 0q6oQc3X13QHK6Z4qAsMgVDMWVr4B0NpV1c8fP02/UKi3QgDgEHALZlW7mqfzcw99XoT
 nLUrpjl61mVPAf9ySEQ/rdYVEJTWJfsccccf6Dck9dJy/cxTd90htpjzhSO0MTfWwjIM
 uaQJRTxJaiEG5D1MaAnTBOQNQBjmS0GSWXVJGW+B1jwPSO6tVDGoHS4wpnO+qPmWqvGV
 x88SVmaI8/eh9DqnGaneH19t21R8BNmW+rvRdYO4v5HhdE8ciH6TUaTH8Z540LdwIjhy
 DubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=ME4XV3U8fNL+WYfPzJS/qKgM1DcmZ3VjHuA6442P9XgU3IqLYkv7SObDHk5mPEG2cC
 KlfvGc+QjpMmvnqMtCU0tsW8Mapgi0IauYBWo8g4gFUuJkIO9akMgNNIuLUA7LQck/fj
 XldKRWxP0Th/widvLb1bzx0BPp01ZsNvOqD8pRgo/BRcax+ik/PA0vrrhDTmAE/rF1a9
 YB30btoOLAxhUXwfTsX7y07iC+4Q1KH8oI343Oeu284lYZoGmm/UiU/T9TYoDRIXiorn
 ikp3GPdT5h35TouTcKQjl4rYcFmF19gdilvvXXyNodcLpmmm765URAwq+dkxDY/1kFmh
 PdLQ==
X-Gm-Message-State: AOAM531/+vqJy93JROLuFWxUz3o0SzWSRHmLf28OyCpTlWGjbPTBAIod
 DYXw1gP44zlYxWhs6Bw8anwb8A==
X-Google-Smtp-Source: ABdhPJwJRmaG9JD72v2bP9qDLK4F5k2tAe7fmjXQ2Dy/WtT+sBoGf9kku2DoX8XVv4alkqKjUmmRIw==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr36254860wmc.37.1634554642446; 
 Mon, 18 Oct 2021 03:57:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c3sm10967842wrw.66.2021.10.18.03.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 03:57:20 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 26CA91FF96;
 Mon, 18 Oct 2021 11:57:20 +0100 (BST)
References: <20211014224435.2539547-1-richard.henderson@linaro.org>
 <20211014224435.2539547-8-richard.henderson@linaro.org>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 7/7] tests/tcg: Enable container_cross_cc for microblaze
Date: Mon, 18 Oct 2021 11:57:15 +0100
In-reply-to: <20211014224435.2539547-8-richard.henderson@linaro.org>
Message-ID: <87a6j61tyn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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


Richard Henderson <richard.henderson@linaro.org> writes:

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

