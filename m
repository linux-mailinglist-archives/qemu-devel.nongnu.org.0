Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C92C37F59C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:29:57 +0200 (CEST)
Received: from localhost ([::1]:34672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh8bM-000859-1K
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8H3-00029e-IP
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:08:57 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8H1-0005MN-Q7
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:08:57 -0400
Received: by mail-wr1-x431.google.com with SMTP id x5so26357932wrv.13
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=qj6AHRg2ys1rs3BqY56x6Ze62+A2aS7mtMZaOHDhfEE=;
 b=S3hKZMdgFXZB5W7X/XLMeRQx61BmVYAwS15rOjeo4U2Fv8agpSASo5RvCwbEuzQkWL
 T02YYra6L9hTRj9/0knC6vwZSPuvh2o9oKTkb+5gMK6U39b5t065Hb1NFKnN95C2TBcH
 evMmg9kQlbZH0JbYrPhdMnEG632bWXuHEhOrQx8DmgI1T9BwUJSFEZXM1aeePJDrvui3
 mraJVVi3A9/pGWZGje3lESAhtyQd5IlkogKTPGz3xZDclI5n522sgvbfJiJ1K2P7nROH
 3ESi2HHga0Lmzqywygexkqdc7vMmObTCYcI7JQEfkiM2IU2SsgM27WAPR9fUqlO0++ZN
 RLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=qj6AHRg2ys1rs3BqY56x6Ze62+A2aS7mtMZaOHDhfEE=;
 b=P9HeIrNoFatwqpNsPOk+dvBX6w4A4g8RE4dasC4hMpHS558EmNVtwFNEnrQhDO+pc3
 9tIkZ0OshHotbcOJDME8T4WIURM0tt6bXgl5Ge5He84tnAfWifSSA9FMF+ph5sHqoMXh
 nbklE407lZb1MAL0MBDHXX+uz3J3pOv3ohq1mso0nW9ZhhCW+Xj9X2cvR0hH6XwAxo9P
 sXz2HCATAuDbwI1mLYrhQpYGcKDrS6EqOT4jx8jnqHHPynyOFhLLgFG90e3fJtqWiaLr
 a5c7Gq4Djg4Up4JaDDMuM8L6hRz34200KQFPsEfHy1+lszLV+EfUfVfgViLHHWYSzNQt
 qZmw==
X-Gm-Message-State: AOAM533/Ib/k/Yoe4xkaltKCiP5Duo79wNWBvE5+2Hu4m/t1gjGhYSi8
 FkhF/MyL78prgvv2+2vk5J4RYQ==
X-Google-Smtp-Source: ABdhPJzn2/ltuCvz/dk0HizVYkrkdPZO9w0oRCEWk+KyIt7PKLzGoaDkSa4Z+L20zWh9Di8LZDW4VA==
X-Received: by 2002:a5d:534f:: with SMTP id t15mr15145372wrv.206.1620900534078; 
 Thu, 13 May 2021 03:08:54 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y2sm9367808wmq.45.2021.05.13.03.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:08:53 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6FC421FF7E;
 Thu, 13 May 2021 11:08:52 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-37-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 36/72] softfloat: Move mul_floats to softfloat-parts.c.inc
Date: Thu, 13 May 2021 11:08:46 +0100
In-reply-to: <20210508014802.892561-37-richard.henderson@linaro.org>
Message-ID: <87fsyrdjyj.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rename to parts$N_mul.
> Reimplement float128_mul with FloatParts128.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

