Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D005E67DE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:59:08 +0200 (CEST)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obObT-00082x-JA
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obN5G-0004AP-09
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:21:49 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obN5D-0003zt-9X
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:21:44 -0400
Received: by mail-ej1-x62b.google.com with SMTP id l14so21416770eja.7
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=SKGDx92+n7z7e47qDXW9i9QmOYs3PQ4ULvPe75LIW+8=;
 b=SnTUzhOm/opDsYZef0NNG/6GGjOxQiWxDDWZiwSsQJL+4KaueQvnGJgHqPLq/78wrX
 7dUhvTAFF10mSsrx09Fc9Mt6wqutL4JH7i2YZyo5ECAEhhZroT50LB6EnhJzb69zUfc5
 fmpjN5DuIG0EeJTTQYWdydAhxFYp9FaP5qsTDYIDaSen1nsgwuE0LeRpjjHbvjT4upHM
 zhH4zLk8e7fTk5YggoRhY/iZjOUcUbk9uxhp/b5E1FOiuxRsaVu+fQg+msJTq7AZiU1c
 bvQaEt8kbLK4nNkI9oDon4/BDRJJTmjJQOMj2N8hs8EJNXobclKmnGi1zZGM6zmDnJ7w
 4Atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=SKGDx92+n7z7e47qDXW9i9QmOYs3PQ4ULvPe75LIW+8=;
 b=uwAeeQ6ZWDpeTRPwpT7K1G3pr/Frblp0gCV8tHznytdwcxHwTfDRXff6NZeT/f63sQ
 nn/vxqmJMw0jZfmhGOV1hpf08zWOUpFx+W/xiW51AT4N2qVjKCOEoyt67A20Il8lNhEP
 hAaqMhWG+JDYo3OLgTLE4p1v1pSSBK+BjKxRrnfr4l5yuNArMYybaWPKj98c+4818g1q
 xf0pz8POQvF4t/x+Cxt0IZykRckz6G99cZcBbQTmHVMTUrlKEKIfXkWYYfQc6+vIJnJk
 zQW+f2M3ltuHwnGaldLKNwj5y/ZK3MgxFlxwrOcaEWldjW1iHMdv9NCDJOXTVfzQ2uP9
 MSHw==
X-Gm-Message-State: ACrzQf3Q2D+eftXurPDZq0IbdYQ0ikatOxByUlNY9+Xc3HV3EqMrEsfK
 gfzAHlewNdnWoguovxqgzmtqEENPsyDWbtdYDkSDBw==
X-Google-Smtp-Source: AMsMyM7IlI8At1uxNApjsXbtqW5U5FjafPyPOIyRZn1yaENa13WZEHpD6oLCJly8Q0uELRI2tXxdlxy7JA7BpNoHtp8=
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr3048158ejc.555.1663856501486; Thu, 22
 Sep 2022 07:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220910061252.2614-1-vikram.garhwal@amd.com>
 <20220910061252.2614-5-vikram.garhwal@amd.com>
In-Reply-To: <20220910061252.2614-5-vikram.garhwal@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:21:30 +0100
Message-ID: <CAFEAcA-T3e407ML7Y-x2gm3N97xk+6RLXpotn+ytdEtWcCNGEg@mail.gmail.com>
Subject: Re: [QEMU][PATCH 5/5] MAINTAINERS: Include canfd tests under Xilinx
 CAN
To: Vikram Garhwal <vikram.garhwal@amd.com>
Cc: qemu-devel@nongnu.org, edgar.iglesias@amd.com, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 10 Sept 2022 at 09:12, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

