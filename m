Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC38378D7E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:43:30 +0200 (CEST)
Received: from localhost ([::1]:57350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6Bw-0003UF-7F
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg65A-0007FV-Ux
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:36:24 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lg658-00039j-6n
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:36:24 -0400
Received: by mail-wr1-x429.google.com with SMTP id a4so16676248wrr.2
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 06:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=7q3lLpjKwWBlhSY+7iPm5DeIsEOgeEO33n0pE89nuc8=;
 b=IcmAnWYkn4fwlJ+0d0TQu2rpOPbBm2VetIcOr/jEITkOfmsquIpqa9fZYCxdQymEbR
 v4mhu80EcuOVHi/wDFHeghshHiBeVKnRUJcbQwWN+d1aWmy5eIRd3Oh6GxGHd8p+hOpI
 vHMrm0Jt6n2oxk+HZvIRL/+hXZ+JSs1i91NeW/odRXMF+o7R1O1ynECQy0UQX6O73+eY
 uibpNRWhnIeG7g7SlWsQpvsH0X9FAr3jFhiCkUfxOkSOq8XsZCHQDFKAsC2uUXv4LRo9
 +JP2wkJt6qO9tDiVcUuFEeiYhXjctHZ7sv/OPPaM+XkYRAvLDEh0ruJJNmVSLWaX1P2g
 9Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=7q3lLpjKwWBlhSY+7iPm5DeIsEOgeEO33n0pE89nuc8=;
 b=gx0aGFSIxPj+ijdSWicihuMQWKIP8NZqwYiTZGIi9gAXQnN+aUkN264GjRSDe/FlsY
 0mxpc1NYIyg/KKLPLyITDs8DIelqYKQ73NfitDvOLQSJPa16qJLpdH/PeoxpZ/uHCD4t
 Qt2YjFJfV2JMfP0/Fl18dpuU/3WgDlIY4wKfUSGU0JPVsMjYQDofFtsirfFxsUfOMf3D
 dXnLGBllkp/mfJwWvaraFknHHGXInGwPfMmCaHjBYn+nYeOni5vJ3PImgBntv1KX9Azk
 mfdBc5468CFWTHf9SdBKM9VReESsKvDcHsBcVMqNy24GVNfyhO1PM7zEl/o/Eag34yTs
 K7ng==
X-Gm-Message-State: AOAM532adhyn+GBwk1DKgy/Ik8f53LVzlBy89PHDckqw43wwCwoNAa+V
 4wzZ3F/WtT9asWdvszev7A21Kg==
X-Google-Smtp-Source: ABdhPJwafrHOgcZ+aOJ38ODTXLVJ6eTq5+l7A/kr98mXqKCX8uvgQ/B4/me0ehqTzy4MwmFB3iPvcQ==
X-Received: by 2002:a5d:660c:: with SMTP id n12mr30702675wru.87.1620653780528; 
 Mon, 10 May 2021 06:36:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l21sm25356518wme.10.2021.05.10.06.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 06:36:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 079B11FF7E;
 Mon, 10 May 2021 14:36:19 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-7-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 06/72] softfloat: Move the binary point to the msb
Date: Mon, 10 May 2021 14:36:13 +0100
In-reply-to: <20210508014802.892561-7-richard.henderson@linaro.org>
Message-ID: <87eeeeyalp.fsf@linaro.org>
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Rather than point the binary point at msb-1, put it at the msb.
> Use uadd64_overflow to detect when addition overflows instead
> of DECOMPOSED_OVERFLOW_BIT.
>
> This reduces the number of special cases within the code, such
> as shifting an int64_t either left or right during conversion.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

