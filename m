Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB183079F3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:42:14 +0100 (CET)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Qz-0008HM-4u
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59NB-00062y-HX
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:38:17 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:35590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59N9-0002br-TV
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:38:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id e15so4943440wme.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=LoRTcBd13f9csbCR61Hc7oNwkcqrPR/77a3G9imy6xM=;
 b=O7BOf7PgFAd/+faCQiklJMxC99B2ewiAMpBF/P2JXXqQa9mQTPVTrBtLbNsMMKS5TH
 3qBRLXfHKJmkAbYeps90J8at1/RvL7xnpWqJ/gFb9G2xOO3rhWytJDXdewaSSd4wix2L
 2D32UTjJnBtVCzQJ52P55BCEDYjLdsrKw1bOjjuZKnXiu+JH64tFjGx4J7Mj/CTWE2ez
 IJFfc1XW6gpB1/yJhGZwQwyFd9/gS3KriA7PFz1xqoo51TUj3tslCmwdiNyuokgDYH/I
 b3FVtiUIxslSKwb43JL3iAbGeZ0zJPbqMQnad9+jD0WdhaMQGCgktImTiGXZZCs12TXX
 M6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=LoRTcBd13f9csbCR61Hc7oNwkcqrPR/77a3G9imy6xM=;
 b=DSVGNpbrfJav5UDWgtAaBegzZ+7LRuRyJgBQiXDQ/eOkqUhBc2tzVGfYCuouExFeBY
 vDU/8WG8140SlsO9b/H65H1RBdbxqXQk0KZTcK73d0SmsUzCGraOlbVPnkfiRwDYuqWa
 n5IY2q/Sn5f2gScn4d2GaWGqZ49o5LTLnCw/QnX6GNsFm4fC/xCDPsedMG0pfi6mq9Il
 QOtdKvZzSvhdDKrOibHY5uKgzs1ySD8lzPaOsdHs5/Iey/wPHEylkCjj05QxopJBWQbW
 thlMkd2i+iwVtsPbaqsjTpE2JlWKmUznWLUQYYriPepMCAZ9wiRBAcgM+V+70XQjt2xb
 Lq1w==
X-Gm-Message-State: AOAM530CfDAsJWhuWwnac26uXIPE2Xc+LCCh6gZpPrVT89fps3/21RP9
 riNeGcfHe9zCrlDDQC/5mRqiKA==
X-Google-Smtp-Source: ABdhPJyYhJ+hkyE5KyNf+uvgKAy7HgPfSGzvG7leTXkyurW40iIZxX8T278vDWCnWr0/RCm+wJBSGQ==
X-Received: by 2002:a1c:2057:: with SMTP id g84mr2587791wmg.68.1611848293662; 
 Thu, 28 Jan 2021 07:38:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h15sm7364002wrt.10.2021.01.28.07.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:38:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18D071FF7E;
 Thu, 28 Jan 2021 15:38:12 +0000 (GMT)
References: <20210128082331.196801-1-richard.henderson@linaro.org>
 <20210128082331.196801-23-richard.henderson@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 22/23] tcg/tci: Implement 64-bit division
Date: Thu, 28 Jan 2021 15:38:07 +0000
In-reply-to: <20210128082331.196801-23-richard.henderson@linaro.org>
Message-ID: <87k0rxul5n.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

> Trivially implemented like other arithmetic.
> Tested via check-tcg and the ppc64 target.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

