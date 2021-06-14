Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365A83A67EE
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 15:32:21 +0200 (CEST)
Received: from localhost ([::1]:59340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsmhQ-0002ql-8X
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 09:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsmfv-0001kH-DC
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:30:47 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:39527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsmft-0001jo-20
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 09:30:47 -0400
Received: by mail-ej1-x632.google.com with SMTP id l1so16644678ejb.6
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4b9Wkd0O7OX6il3ZzHzl28vJKwk5ztLG9V1Wp8jiSW0=;
 b=zsRFLQdsl2LXWXgoqndLgfvAmgq32yvNFKBxchA+M3BxJadyZV8YI7nhg6UM2zDrV0
 hBSGk6PoPGwkkZy9r44noWCbT5af289jrKKy7LKXowcHGnlLwf13H2sM6yCGZUqv0xXN
 ce7PvOQLlI0LvxdvGeYqNNQwhZzOB5S2X82Px+t4lS5dwnrslHJaN6kF7oBhm/Bv7fLY
 ksQUaEn3XGsQaZ77idgZWvwAje/7TJQaT9E+z9wKq6F+N2vKldkhex0x7jd4TMXVz6qT
 WmNjTrTz5ISyFhMReFlYdTxCvyMQBnM0qjDk3/5b6eoizpNl6V92eXhrL/MFsBr9Gxnm
 mmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4b9Wkd0O7OX6il3ZzHzl28vJKwk5ztLG9V1Wp8jiSW0=;
 b=UAyG+MdDFi+udB6U8gbQXVAztaG0CkwE5gauwyZ5W+KE+EdMemiSqHZKcrnhWnYDsr
 N6HI2hGXHtJNHq7G4EUQE98kIpiUn9KdlicMAdGDWEbWEv2RpR7d+B70pGuXKmWZDj0G
 MWWZKccqDNK2FL/1Zb9nhhI8HuKYigNrV+u4BLiz1lKrq9Z+UE9Zm6FJx0bRix1TCF27
 ujYc6z0vGKZEpbpKwNUwQr0mvebuVgEHet5RvEvnOcR6HYtWb7HY6osnUW1ZQIXRkn/M
 0dfar6wE+z0ubl8jfS0Qf0aUyRl/pxxtsQlu1yzu0NEXBYMmMtJYQJ1hWpgLz+qMabAt
 KZmQ==
X-Gm-Message-State: AOAM531VPRHoLDDRzPSFmRatqha4hrAgo3KocTqG55Ny/WK1I9epU2jQ
 aXW5ocSsLLe4vML+LxUndK6AhDPVbot+0cGHSinmMw==
X-Google-Smtp-Source: ABdhPJzgdM7CNJJzsWV0eZozqvMAzp2FRyXOc5Y7yeMPFu+pEfmkeXhnKeoW/lXHk51Lz9VRTWvtRSCP9+zSCXBOcrU=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr15392863ejb.482.1623677443236; 
 Mon, 14 Jun 2021 06:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210614132536.1657-1-alex.bennee@linaro.org>
In-Reply-To: <20210614132536.1657-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 14:30:08 +0100
Message-ID: <CAFEAcA8e0oVDdoAa_zpQQq++dujdWs9BkGTqEMd9Fgn0BjZecw@mail.gmail.com>
Subject: Re: [PATCH] linux-user/trace-events: fix minor type in format string
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 14:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Typo in subject line: should be "typo" :-)

-- PMM

