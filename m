Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443CF4000B5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 15:43:30 +0200 (CEST)
Received: from localhost ([::1]:34722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM9Td-0004yk-9x
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 09:43:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9NF-0004N5-Li
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:36:53 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mM9NE-0008EW-2P
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 09:36:53 -0400
Received: by mail-wr1-x435.google.com with SMTP id n5so8268705wro.12
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 06:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=6uYm9dvURbdqGk6y1HEudEZ5V6aTFEaAQiwc4RNrGaE=;
 b=Y5RnRUVvqJeZaopnYC6lW7C6n17uBO6dKKM8HTGd5CMUynEjgg4bxPOLsi7+t0F1pV
 N/3LqmEC+eKAnDIuQ1iloE/Y+CDvcTZ/M6EcSo2nhNFcjoPtjE1mCn3KMzJhkZXdtZ2X
 XWUMoMOcJ7AKMY+u0igT7wSzhdTEeI6Dw+zmWM+jvFc6dim60ngZYfpLfLQ4eX+Dkx/+
 nlv6gAc6TUzPjDHPSVni+BlpSZvrKYum7TnILyuEDLiDU3hDfXu+Hpn2bbZ6Yi/q7eF6
 asclIMO58i5gpGNYG5zRv32o56MHYGu7/OV815O7yOK2MJ+I3dZry7jdov8GVd//26Do
 dv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6uYm9dvURbdqGk6y1HEudEZ5V6aTFEaAQiwc4RNrGaE=;
 b=WClTGtYQW2am66SoBK1GpkbT+fC8YXX50DWiP9NnNiaK3JFIvoP4XJ4UCP475qXStc
 1QKbw9Ynp1UYt0xERfAZ+a0qpvpGkAvm1U2wKYjL6sH8ToroH+xUxhvERscZQYf9cEY2
 iMpwVM/3AfD8DXEc8un7yfTYGW//4uW7L4+XGL9iBGCW9assWUns3N3lMnH61lLjrtgq
 uENmJIzlvN7NgeLkDv2NIzq7yyQTmaVRouoL2y8IazjNJDoGmNloNivDUbG/cg1aBZDC
 mZk1EcuSKFvm28XI2bnodtPOAnanItlLmLFB0ijjJSt5IBKqzaTje1HELBN2klCk3MFd
 xEtA==
X-Gm-Message-State: AOAM530zX1HYWK4mCbuVjkYyaDtIsToGTBnXeZuCclRz0Fq69n1BatNT
 CICQx4iytxW7BpnoV4N4gcQpS7DLsBgYI24g9C8=
X-Google-Smtp-Source: ABdhPJzpK7YH4JieREvo6J72iFjU2ku9rmMhrYu8rESGwbOHxhLT7Bh2glGz+kOGL9Ea5MPIYv9XSg==
X-Received: by 2002:a5d:61c1:: with SMTP id q1mr4251258wrv.87.1630676210001;
 Fri, 03 Sep 2021 06:36:50 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id x9sm4131378wmi.30.2021.09.03.06.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 06:36:49 -0700 (PDT)
Subject: Re: proposed schedule for 6.2 release
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <CAFEAcA-W+cgapSFJ5+s8G-4VZiTWn-8pX_-ANJ+bWtTcH2Oziw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1883f66e-4c05-b5bb-5fcf-7bf7c53de126@linaro.org>
Date: Fri, 3 Sep 2021 15:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-W+cgapSFJ5+s8G-4VZiTWn-8pX_-ANJ+bWtTcH2Oziw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_XBL=0.375, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 12:36 PM, Peter Maydell wrote:
> Draft schedule for 6.2. This is just starting from "don't want
> a possibly-late release to get too close to xmas holiday season"
> and working backwards.
> 
> 2021-11-02 Soft feature freeze. Only bug fixes after this point.
>             All feature changes must be already in a sub maintainer
>             tree and all pull requests from submaintainers must have
>             been sent to the list by this date.
> 2021-11-09 Hard feature freeze. Tag rc0
> 2021-11-16 Tag rc1
> 2021-11-23 Tag rc2
> 2021-11-30 Tag rc3
> 2021-12-07 Release; or tag rc4 if needed
> 2021-12-14 Release if we needed an rc4

Looks plausible.  There's the US thanksgiving holiday on the 26th, but I would hope that 
the number of merges required for rc3 would already be low.


r~

