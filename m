Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D565307B27
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:41:58 +0100 (CET)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AMn-0004GB-CZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5AKp-00035C-E2
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:39:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l5AKn-0002Gq-7l
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:39:55 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so6080224wry.2
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 08:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/rz8WYVrGiWXnSaWbnMqzYihphGEY1mgYxl9Rgpf5bY=;
 b=EqCL/9tUxtty526H7fyGmEA7kvnpxvZDm06AnfLh8BFPJUupP6J3iiduQH9TiRyhif
 c6G62cuFCm6XR+Y2uExrL06den8MXK2ItZdtUl6xTr1c0hlMBt1Qpvn/vtgHvwsIxBzr
 pADRwavxCcX8szH/Q7Pd42imaDGY530k8gCoLGRz635XLEvgpyFn7KuwnKZxhn/6PzeH
 cHhWTw37l0mzTPi2DeiYCNCqLj3gSriYo21GD2foqxarXQL+LHsDiTFuNJjY+jPaGrn5
 c5pr/IOPmAfCTiyOpa16LUdYs0Y5LsHjNztfJ6SGKgLXWevTuEabRdw8RmQWWN3qmu81
 y+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/rz8WYVrGiWXnSaWbnMqzYihphGEY1mgYxl9Rgpf5bY=;
 b=XNQIiUORPpAw5S1kXLVnHHmd41Wb5c0xeIM2s1dsebVIwLsaOZ9AWaOYO6Sb9hgFoL
 kuvJkgMBFHLOVXHl/+AjZGcw+KssCh4MQo8mCjHT2Al8mzi97TgPrmZ+NQYsMaq9bB12
 eUVNbXV1bJgGsfX1zOLfTIuOLcxpq1XadT+pzJ6pzobiXcjwmhWFvq/vek75b5aUFUNR
 wSIMs/eGm5ahPtSDtCMa/ohydNv4WXMjQjgPLtRAPb0PZt1CCRz59JTSF2Hd9ESWeB+o
 qgZ1rPZ5t2cOtRA0MSIBKH6Sic30NMFTiSXRDGbedXzjoZwd+J4B6LwnzaPdsTH4MyE2
 5NMQ==
X-Gm-Message-State: AOAM533/aqDFDljT2B7Hk30QHw9kCbsksuAiC9vgWn2EQHoTzQ13oSxd
 YMJ1mDhGe3/wSnxZORUDFRVlZvW54EcFYzcw
X-Google-Smtp-Source: ABdhPJwHZUCVupgHUOLu6RfBuoQBvh5fYCYUWot/DmfJYnb6fuY3wNHxAZTj8TJKs7PhC/wI4QQ2cQ==
X-Received: by 2002:adf:9031:: with SMTP id h46mr17344407wrh.19.1611851991942; 
 Thu, 28 Jan 2021 08:39:51 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e16sm7570136wrp.24.2021.01.28.08.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 08:39:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D53001FF7E;
 Thu, 28 Jan 2021 16:39:49 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/23] TCI fixes and cleanups
Date: Thu, 28 Jan 2021 16:39:32 +0000
In-reply-to: <20210128082331.196801-1-richard.henderson@linaro.org>
Message-ID: <87ft2lt3qi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

> The first patch I believe is queued by Paolo, but is not yet
> upstream; copied here for convenience.  Then, fill in all of
> the TODO blanks in TCI.
>
> The tci_write_reg* functions are redundant with tcg_write_reg.
> Just pass in the properly truncated result to begin.  In the
> cases of the loads, we've automatically done that with the
> type of the indirection.  For all of the other arithmetic,
> we don't actually have to do anything -- the value is either
> right, or the high bits are undefined.  And in fact will
> currently be ignored by the extension on read.

Hmm it also failed CI pretty hard:

  https://gitlab.com/stsquad/qemu/-/pipelines/248074046/failures

--=20
Alex Benn=C3=A9e

