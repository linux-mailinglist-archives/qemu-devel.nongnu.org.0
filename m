Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1F44A39B7
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 22:08:18 +0100 (CET)
Received: from localhost ([::1]:48832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHQn-0002fo-9W
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 16:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHOs-0001iT-Vb
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:06:18 -0500
Received: from [2607:f8b0:4864:20::1031] (port=45891
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHOr-00064s-FA
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 16:06:18 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso2533103pjm.4
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 13:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tNoYTxE8ZzVgdnnogbFPIOgPdQfNRo/1K0aDVmsvAKo=;
 b=f6zYVuuYvEsNevpBnAshZfEQz72uIGdp/xqd9YnqKNgGMT74rgxyUrks4pLf7RhTsp
 E840KmGiVqGui4lcJWQzby+LV/ObnC9YxjRmgZtggQAjN/F8xvvgRzDVlD23ge+E5X5w
 7wN89JbD9HsdFJ16qC3vqc1+3/Nvw3l+6b9tgD1jg0Sl7HEdP1IeJ7zZLMwywb9vXIbC
 i62Q73ePlURypx/PbA7YheII9lvA3ii0Nbh+CTFq31GCxRxnXUwzIDxYfEjHHc+UzKNo
 6taTK4MMKZcJxlgZQwEDxI8WETAWfUzPuqtCQ04za9ol4QNPVmKYwg8X1TOBR/fX/VV6
 ltTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tNoYTxE8ZzVgdnnogbFPIOgPdQfNRo/1K0aDVmsvAKo=;
 b=BMuBCsjPecs9JYKqNScF+FZuXEFd0VBhwjF0K6oTWw8U6QOrxVmi8Tpti4fP63XAOd
 xAt0MtAFz/vDkHTcok7ttpzVaNLhWHziej///lNg4ut7YgmcHi5LQVYX9pxlHQALdq3O
 bJH8S0bD6OnXwvdWx8CMtZwgDZviJiyqUEktZ+SzP/d/OD0pQiDOrpThLU9rg8cn8AeC
 /twzsSdwp5p+P518NQM/7BhbIgUUCd4tmOmDqBAl7fMDqO+J7FZo0o0CoWYhYjmvPqwP
 oZYjnX2ztKUHIPKUDLJV9qcRLb+qmSGUuc62/ARp6iBGQQp0dzsmQt+G4r0+R8gyg05p
 jitg==
X-Gm-Message-State: AOAM5300WdWabPNvMc/xSBvKlxOzFaZOFBG3Clq6gZBSFD/kLNXlZioV
 RN32qkczF5jyVnh6/tXnkqYuig==
X-Google-Smtp-Source: ABdhPJy54S/EaENYD88fLKbFfG1uV+Wy+o1rmNCDnzeB9MP/nyi5X1Rbh6HYWRWoWn+9WwEDm7iVng==
X-Received: by 2002:a17:90b:390a:: with SMTP id
 ob10mr21316397pjb.110.1643576773996; 
 Sun, 30 Jan 2022 13:06:13 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id h3sm8582379pfo.66.2022.01.30.13.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 13:06:13 -0800 (PST)
Message-ID: <206cdccf-3e56-7ba9-b33e-278e0ecdf762@linaro.org>
Date: Mon, 31 Jan 2022 08:06:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 6/7] target/riscv: Add XVentanaCondOps custom extension
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
 <20220128145642.1305416-7-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128145642.1305416-7-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 01:56, Philipp Tomsich wrote:
> This adds the decoder and translation for the XVentanaCondOps custom
> extension (vendor-defined by Ventana Micro Systems), which is
> documented athttps://github.com/ventanamicro/ventana-custom-extensions/releases/download/v1.0.0/ventana-custom-extensions-v1.0.0.pdf
> 
> This commit then also adds a guard-function (has_XVentanaCondOps_p)
> and the decoder function to the table of decoders, enabling the
> support for the XVentanaCondOps extension.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> 
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

