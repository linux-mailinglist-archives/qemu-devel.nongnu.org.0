Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32F62F96A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 16:37:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow3PV-0001G6-F6; Fri, 18 Nov 2022 10:36:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3PR-0001Ei-Ci
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:36:05 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3PO-0008Ej-DU
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 10:36:05 -0500
Received: by mail-pl1-x634.google.com with SMTP id jn7so3009327plb.13
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 07:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ofhv7T5rhXIOp5AAOhVjXl1IVUWEWCNX6+KkF4r09pA=;
 b=W00/SdLHKItRlMOEZ7/LJoibrwzguB+7x5Y0jAPIX5zpRyjfE3PCgIBhEepUQB/RON
 +uIJm16EbHWuM/zQQkGy2C98VSklS2av5XKsPcdjAw/rammpI5uHGtYPq1coMHYb1w3u
 XraCSX3NIRIeBKAq8GjYaLA4hpLdJkkOj9N+BgFAbpe9j4UeoSmz51PAL5UC7G0rOoIr
 fH5i/Fh7CpjecFYd/2sNlndWabAzfMztPMIstoN33+6URVLFvE7AEVvuenIcXRpRQ5Wm
 xnnjw4tbf3c9oCxoz1JZs4Xav+til7YmW2PvPXFN4gQWl/Rj1j3peAxfZPXjOiq/yUcl
 KABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ofhv7T5rhXIOp5AAOhVjXl1IVUWEWCNX6+KkF4r09pA=;
 b=CYcJLGU0VkpVBBpYYZP9EOwKlC/Yk8wz7s+deoUL+0gI74iMNmAREJvlZQxVluoj8l
 YzPo+ftrkl2C767RgwPvOyx2hU1FJFmPIDjK5e+GzNItPu1GyTDCEfcTLSuYB2qJBTdt
 SxVFzo4JmI95l015AEiOVoRIP0webRKZ1ZQyUA/yxJFOgq4r1ijZPXnlyym3iodr+AQq
 VlIYR5UA0XG/SgH8oLGgUNItPz6AFgmZmCv19CO6X4C7gutT+so++GCTmDZvHWrfLTr5
 SdFcvBlx72Yr9qa+w4ptnhOYNBDM/nQVx/PZkV6mn2n0ZnGEjkXBJyc/vOrQK55frQ3U
 JxCA==
X-Gm-Message-State: ANoB5pmmzzRfciK87xzwn+TVMUGo4citl2YWXsPzxfmjFZCjdq8gLrjT
 EYrXh9Wjuu/yJo4yOl8ApD97y6kIp2Xz1g97PGb/Ng==
X-Google-Smtp-Source: AA0mqf4q46XyfCkzKaygtbk5LcGmBsJ6plpsAWEk1RZuaJoThrOjNJzsCQ/nLRI8hU9PBm3Fj5W3FIot1eE1IuzeGLA=
X-Received: by 2002:a17:902:b18a:b0:188:5240:50ec with SMTP id
 s10-20020a170902b18a00b00188524050ecmr8003733plr.168.1668785761140; Fri, 18
 Nov 2022 07:36:01 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-2@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-2@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:35:49 +0000
Message-ID: <CAFEAcA9txkkRb3J8U+L=PsdiS+RzdScK7NYF4BUyOYff=7CGVw@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 2/9] hw/timer/imx_epit: cleanup CR defines
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> remove unused defines, add needed defines
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

