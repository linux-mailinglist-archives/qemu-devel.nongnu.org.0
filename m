Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605B2E31A4
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Dec 2020 16:06:21 +0100 (CET)
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktXci-0004Dn-LI
	for lists+qemu-devel@lfdr.de; Sun, 27 Dec 2020 10:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXbJ-0003VJ-GB
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:04:53 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ktXbG-0003Vj-JC
 for qemu-devel@nongnu.org; Sun, 27 Dec 2020 10:04:53 -0500
Received: by mail-wr1-x433.google.com with SMTP id 91so8312846wrj.7
 for <qemu-devel@nongnu.org>; Sun, 27 Dec 2020 07:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4PE46wGD3VE/Yw3dgFGhk0OL3foEGRn4xpdGjRBPaO4=;
 b=slrpevL1YR1DzEv+P3VwKeGa453FrrxYxQQ9VK+vs0XsJ33VwZdcyS5kIpoXAhdcAZ
 CHCUvVp5nPPKbkoaNGcCewzm8wxz1X0oArk5eXy9Q6ER+dZxNs8o5cw7ji6DGW3Rm4QK
 bqr3pQKZsQ3/gEoY3xkG3zQ1EH4CKIznixlgWX4GzdVuk/cSoJO1IMIPDVasRHLgoNbM
 jrM5hBhTrVSyatgwym/UGnqisIBIzV94kk7fJIqYvbBl5QNRgWKAhUZ2kSNxTZoWpL/Z
 xdCe+Gco+L0ZG8mQXs3+0qsrktc+ovWk6FSuSNsqGqZpj7tTfdlaA+Ta+5t+v3gaUsBv
 JkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4PE46wGD3VE/Yw3dgFGhk0OL3foEGRn4xpdGjRBPaO4=;
 b=KVVpfrKPoSgyZ00mDHQ3EWB+d7ggJ/LNum5n+X/LT6j46axwuLupc0IoDg7mAF8RaC
 2ZKgSIcxiXwPix37Imslntt21JxtM9bvm2IYcYJQzcYXF/iBIeOQKgNTLfgf65Jsdcaw
 4FdBAj7cdWPD8Qt7E5TxG63mfGgfI/PUcFQoYxNKQ2MSa1m7oOSmZVGiA5cvIwJcZklh
 GqIn5Bz8RfJbFeXw2EHu3LMTZDxLjnWngl/Bv8hpyvC6o1hicqmlNmuNAdQ24Kviyrco
 /iDIuBWCYysnOhCQO99Ck+Mf6kAmJ5Zb1SOJegg14qNLnrkBGCV8kTvRipdlpdfDRwJ3
 XSlg==
X-Gm-Message-State: AOAM532IB7wMdfyebu0o1BAcTiO5dzlJz0pAzcqPseaAz16G14u78DRg
 i2WZtBaJTyIV1fEfEl6fKz0=
X-Google-Smtp-Source: ABdhPJwWdlcV8U0kevBSVZYvEWJA6j1cbGskcqraJeAK9DyrLHzlKk7T//h4AUvarHHjenbBW9xDWg==
X-Received: by 2002:adf:ee90:: with SMTP id b16mr47479442wro.221.1609081488878; 
 Sun, 27 Dec 2020 07:04:48 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id 138sm17176575wma.41.2020.12.27.07.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Dec 2020 07:04:48 -0800 (PST)
Subject: Re: [PATCH 02/12] vt82c686: Rename AC97/MC97 parts from VT82C686B to
 VIA
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609031406.git.balaton@eik.bme.hu>
 <5f864b4ad285932076f12ce4beb00e165550c870.1609031406.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6841076b-f43e-c361-ca2c-f0d783f5c0d0@amsat.org>
Date: Sun, 27 Dec 2020 16:04:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <5f864b4ad285932076f12ce4beb00e165550c870.1609031406.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.829,
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/27/20 2:10 AM, BALATON Zoltan via wrote:
> These parts are common between VT82C686B and VT8231 so can be shared
> in the future. Rename them to VIA prefix accordingly.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

