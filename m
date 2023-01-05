Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169C065EA53
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:03:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOxP-0001K8-Jv; Thu, 05 Jan 2023 07:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOww-0001C5-Rz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:02:29 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOwj-0000Zt-U5
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:02:16 -0500
Received: by mail-pg1-x532.google.com with SMTP id r18so24351220pgr.12
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LHvmOn8wyCNEuBNpRFuAPJKZnG1VWFc8K4QEkp1Ac30=;
 b=S9QzF6lM8vYdq9oetEOaQDYEEJGPBQmc/LtoTWABcDhuFqVstr1K9G6ZghJoCMlYM4
 95K3z6YRxX684Yk8hkEZfnLwbRrnLrWl+CpMUe9aK5i3UJdAHCbYyZhJCAWu0kNkPxOx
 ujY3Jms5Y3n10eZSLjZOb+Byj0nis0wxfsYxw89urenizd0xipREjjIP8ZF6CMJ8xizq
 GxZ0ukZEdXSlRfbFsv+RLBGfGgNQ8c94T0aTEVrDCj0wzIsYGu1t+DUJA6/wqQP5vnxC
 cGVQzs/jgzmoSU4xnr52V9IJHpkZzcgO8WFqKVxhXBnl2VChP9/JJmTFQ8/gIDpx9bN8
 S+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHvmOn8wyCNEuBNpRFuAPJKZnG1VWFc8K4QEkp1Ac30=;
 b=ap76439vV7UPKLg4vIY7b84YvFd9i2zvcoCgnOJYY0kFszfOjKM9SWoIkSGUfjKx+Q
 5FOyVKaY/1zN+RLsxHVIgznbTRoCv6oZms+j6MfK4tj/aS81vANpjpM9/LAZj6eTOEh+
 n980MX/fciIm51ix0E59sVS7G8W1ypbB2bXBJPGz2TxpjbIhBwVuZJ2gO98SBt9dDKVm
 CA8e2Nd9//LxfiS9M7CQU71HkrFHdq10F8oFrV3GPrfdoDK1zo3SSKQxPm8NJ5eD2Tmf
 fUf5rqi3U+w2KZAcpKDLAsq2qivBq05dak3WGlyXkyzkeaQKlt8l9BNQIgdgJ8TpWN5l
 0pXA==
X-Gm-Message-State: AFqh2kpwE1Mx2jLG4AOTdkUeIsNvtF31cMI0aimaLypBJCxcd1g44Bae
 vNjK3ej7CFlR6B8B9bWtVWoPKzJHGj3SvLdvlIhasN1tobGzPw==
X-Google-Smtp-Source: AMrXdXvYLdw2H9nr5sun+Ql2t7IBfg4YERs0nA0pMqva6OtTT/0c9dW2IFIUJsR2BSx9I4p6WUMVqeDm1RxiI5MZpck=
X-Received: by 2002:a65:694b:0:b0:477:86c1:640f with SMTP id
 w11-20020a65694b000000b0047786c1640fmr3346380pgq.231.1672920125596; Thu, 05
 Jan 2023 04:02:05 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-3@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-3@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:01:54 +0000
Message-ID: <CAFEAcA_C+-JGJfuu1pea_w09-a1LFBOF2M24cOdVm-wVgT2DiA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 3/8] hw/timer/imx_epit: define SR_OCIF
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

