Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B732ED80
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:53:01 +0100 (CET)
Received: from localhost ([::1]:53536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBp6-0006Ej-7q
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIBlI-0002NJ-1S
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:49:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIBlG-0007OW-Gt
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:49:03 -0500
Received: by mail-wr1-x434.google.com with SMTP id d15so2382079wrv.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HDO3KN1T42agoOrrttxXvApcqj7AMOfY+9DjG4IaSFc=;
 b=Oj6C3WhscAXgeSs8w+NgEN57JNcfdISFWc+L6bghcmOvHk9zNK5JTdl7o1Vdx/mToC
 kGM8qywsEgjLtPICBTPW2HU0+v219tICwpIb9E42HaC8CGZQQybO/mQs25/Q2WyJih1U
 xu4Rji9qHAYTxGbu9WASTnptEBUZPn+qRv53kRum5tUEuqM/Gz26FBg0KPviEHCw/eWB
 MckcWjpkikr63eShCepj3Qq0DrwCjk5O0fg+KMXo9Qmh0YpGS3qwSPGgWm2NftkvTc5f
 6LTK2cCqX+GYbZaEXGC61OJvetIV5qGbhbxBWpgDqyK+JimTmReatmoGDMC8qTP7bgFn
 ourw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HDO3KN1T42agoOrrttxXvApcqj7AMOfY+9DjG4IaSFc=;
 b=qBlPgi5ekjhpHaDgH22YwhwOOeUPMZafNNfqonDN01KK5gyFryHZdbhTSpyyv6+UbX
 H4r+iIgup8SxnVV1hVYFFsZUC4HpF24bsdzJTf4pDN4MZ6EOIwyydz2LjBIa12DB9g/H
 8hSFfyk2xK1QnWDy23Z+NGqI3AZSUpHPoTTKZGGfrX9N5Lfb74g0txUVe336AHa2YZko
 d0lmYjjxwRqDI+I6mPNC3weVAckevrKc3Xt9dDSC1VHTMOUJQDiowvOBEbGq9pRgAb0u
 gxZ/csglAFyi07lY++r9JvQTM0zmH1UqrNpt+VCCJBS2yaPEj6Qyh51ZvyucyYm2hRvo
 W6zA==
X-Gm-Message-State: AOAM530Y+VDILqbiGMxGnATk16BP7WARotK5BTIGcqjL7G/1uKTQs1kZ
 z8SNDOoz2m0He5DObjmAXUbHpA==
X-Google-Smtp-Source: ABdhPJwR+8sH5lXYaGJ1+MJJGgzUH/E/eiGPWX/tBJRAq9oLJKx5x+4uPwgHijzMX1EYXYx4URwe2Q==
X-Received: by 2002:adf:c752:: with SMTP id b18mr9614481wrh.233.1614955741263; 
 Fri, 05 Mar 2021 06:49:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x13sm4789342wrt.75.2021.03.05.06.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 06:49:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7B3BA1FF7E;
 Fri,  5 Mar 2021 14:48:59 +0000 (GMT)
References: <20210208023752.270606-1-richard.henderson@linaro.org>
 <20210208023752.270606-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 02/70] tcg: Split out tcg_raise_tb_overflow
Date: Fri, 05 Mar 2021 14:48:55 +0000
In-reply-to: <20210208023752.270606-3-richard.henderson@linaro.org>
Message-ID: <87blbxfyg4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

> Allow other places in tcg to restart with a smaller tb.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

