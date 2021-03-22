Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77696343DA0
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:18:32 +0100 (CET)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHdn-00087Z-G6
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHTc-0007SI-7A
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:08:00 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOHTY-0002Yz-Bi
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:07:58 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so8822801wmc.0
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JZYeJhCPuihmNF459upjgRbCBxGmb04BU4qVHQahk48=;
 b=Xp5fpV90KemfPT9s8mtrw3vlnsjqMI7NebnHoJxuTPi4tVLr8bZWN3YKdcPyhmpCmr
 0rzEVLgYt0VijglDLFND5rRFeNOo0n33/2FJEN9yPm53aGzusmBi/7ofwUnncPzigN9B
 Xo9a8IiiQCjWHnMwR6EOcBEQa3xjMLQnfOfml5mMhJTmsQuDfPFZQUg/14ADqAQ2sfYl
 +r7VdvvZp1Q4K8/LcbBe/6a4BdQzugU+HtQp36PUMlrvQn+aXilIqdogfpobSpXhdBRF
 vefxD34FlXoSpKOVPFzBpuxaGOR88010edqkEXxlUUNgqtgUxHfGL6coU6XhFq5pBgx2
 /+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZYeJhCPuihmNF459upjgRbCBxGmb04BU4qVHQahk48=;
 b=b9eX3Pko47GKSWwsT5fjNSKmxxqLI3Iya6A+5zECrvwPVyxgIekoLRak+9s8ExRQAE
 AGKfwQcwdoFiJY4Ok01yA5qMJ78luHtv/8zj2csKZ/WcxahQlZ5gVhRWMuk2rEONBs0W
 RgYNKkDx5InLJq4zBI9ZxdFJA2xFp/tM3DrRFi0lSm2Myce8iNgtqBBwzXrB+CHpRuPi
 qmfC19Sdz9N5MQyYeovJjllxQO/bIvNgJZ4+VhJ7/cm1wGFpa6HywDgOa68hHhr7t4+l
 G4S/f/eIcBDReHD4ohg/hIBMPENYvo99BgQTv7kFoEQLlO7fgTJIzeqBWxf9AKUxx6k1
 eLoA==
X-Gm-Message-State: AOAM532RJlN7P460stnd549/0fqVSv8uUUfFpoAaHB6QKh3prAVfzy9P
 dxcldxfFFtUtnLErl8ZBkIMR/2ym7NesgA==
X-Google-Smtp-Source: ABdhPJxagz+F6m0cwHrGUlGRaYmPS/8XHwtWrPXt8Csm4b38ti0cS/FBdZJvBDhohVJm5msm7pIa8A==
X-Received: by 2002:a1c:2288:: with SMTP id i130mr14994957wmi.62.1616407673154; 
 Mon, 22 Mar 2021 03:07:53 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id m15sm18202887wrp.96.2021.03.22.03.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:07:52 -0700 (PDT)
Subject: Re: Is accel/stubs/ still needed? (resent)
To: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
References: <YFYDdlMsVQ75UFHj@dropje.13thmonkey.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <74931fa4-ff71-6c97-5e33-78b276c76096@amsat.org>
Date: Mon, 22 Mar 2021 11:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFYDdlMsVQ75UFHj@dropje.13thmonkey.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 3:15 PM, Reinoud Zandijk wrote:
> Hi,
>  
> a quick question. I forgot to add my accel/stubs/nvmm-stub.h

Stub ending in .h? Suspicious... Rename it .c?

> to
> accel/stubs/meson.build but even when I disable NVMM explicitly or build it on
> a NetBSD platform that does not support NVMM, it just compiled. So, is it
> actually still used?

Stub is usually required when you have to call specific code from
generic one. If your specific code is NVMM, then you should test
QEMU still builds outside of NetBSD / NVMM, where the NVMM stubs
would be used.

Regards,

Phil.

