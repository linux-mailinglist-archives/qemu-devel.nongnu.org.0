Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE30642A9D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 15:46:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2CjB-0006CQ-8k; Mon, 05 Dec 2022 09:45:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Cj4-000687-Qo
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:45:47 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p2Cj1-00011h-U7
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 09:45:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 n16-20020a05600c3b9000b003d08febff59so5182949wms.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 06:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FkuTM8uCfNVdil+5mS/n8c4IWcmYZtyKq5PL1JGpBBw=;
 b=HG9EKxyr+m8nsyaruBSqNOaPkz8L5tcsEDtXT9213gSAa+xb4CZjm5CA9fyIMsb/Bw
 oTr5Ykrd9cLsI5mlqAXhiUQzwZX1tUQALlEs8rnTuxTdV5/ChJPJF1tvC70RZjZvXAU6
 wZJXMv6SUb89yWynEEgIOpLj1VEnRHtnLTKsvke8z/nZDzuMPRV/kMuxIgpBx5EiO547
 xlKNO9xiFWfmWvbuhm9zMB07mI5YCW0zq6vIUr31NQdnxg+/dKnrazhE4qpN14EKJG6Y
 ReTSk2TBZwLvnzhLMjblzc0bhrH+Ysc4D4DsR/B1NZJFTapYo0kofg+PxUAyQLzofUr8
 KNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FkuTM8uCfNVdil+5mS/n8c4IWcmYZtyKq5PL1JGpBBw=;
 b=n1qg4JWmXtnSnPTSlaySVT+tJW8g41kMtTPqn8w5Byy82YnZicAe4uV10Kh6+FOvT9
 s4BOwDVFvdCDLF4+MGfr2zlVI5IFJDR+q6Zt5eIN1Kq7ODSuGh/hiXdCPv8d7qNrL0RT
 fP5gq80loz0j340hGPhFMvGe9U69Aqa9+I1s02GxoxnSy8sOA9/qvF4WivCMQWRzlFjD
 K+SWwXXeYo5O7K4yMGqypYXgknepPV6yF3pRzNMdL7J4z0ubMz6T+VxoYhfGKDnsl3in
 zvBdMjcaia1PspiEZ/8acznoVndgIDvA2Ss55mWa+6X683YJKA7ZuY7b9RQ2TYa7hhi2
 UkZg==
X-Gm-Message-State: ANoB5pkVAiYVchgjaXQ5T+k8GW1w6jvhC4+IqcNTlDAVrG9bLmV9GBfV
 5drNjj75S8XpS+7+xohq/QA6xSohdhg0OTNM/Phzmj0/r5jFgg==
X-Google-Smtp-Source: AA0mqf4LGqd5nL2G/y8+WoVHwlmM/kwdnTKk03Yc1xC/SlYtvFtdYjI8cV4iils/nc3alZKWqQU33z6jnM8RnyA10sM=
X-Received: by 2002:a05:600c:5388:b0:3cf:37b1:e581 with SMTP id
 hg8-20020a05600c538800b003cf37b1e581mr58360853wmb.96.1670251520491; Mon, 05
 Dec 2022 06:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20221127132112.300331-1-tobias.roehmel@rwth-aachen.de>
 <20221127132112.300331-3-tobias.roehmel@rwth-aachen.de>
In-Reply-To: <20221127132112.300331-3-tobias.roehmel@rwth-aachen.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Dec 2022 14:45:07 +0000
Message-ID: <CAFEAcA-uR3oE0KSxA9mEmZhhn6bissa0omH7raAfZQ5ch0z-hA@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] target/arm: Make RVBAR available for all ARMv8 CPUs
To: tobias.roehmel@rwth-aachen.de
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, 27 Nov 2022 at 13:21, <tobias.roehmel@rwth-aachen.de> wrote:
>
> From: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>
>
> RVBAR shadows RVBAR_ELx where x is the highest exception
> level if the highest EL is not EL3. This patch also allows
> ARMv8 CPUs to change the reset address with
> the rvbar property.
>
> Signed-off-by: Tobias R=C3=B6hmel <tobias.roehmel@rwth-aachen.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

