Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA86104A6
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 23:43:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooAe7-0002KF-Bm; Thu, 27 Oct 2022 17:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAe4-0002Is-BV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:42:36 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ooAe2-0007YW-Gf
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 17:42:35 -0400
Received: by mail-wr1-x434.google.com with SMTP id h9so4425550wrt.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LYeZdmKW7klyfKmK54Xa7qu1Vr0cL+u0HqvbNAYw33A=;
 b=nlAyoEHmsUehNIyc4ZW4G496h6M4/O4qRv/dx2FOKBNrEHC01muN5rQp5ibV4HL3pu
 ZNh5/7a6SJf9V+Fd0M4lgjHkenTTr3lNYrETT6Rx1+fgzCHpJzIxA8hAsAgLjzb4mwyc
 Mfay9pezCNMvwe6rfPvqAV8pGEo4nXjXAivVSEOlNGz4+5NOZg83d+puJ5dyOzNTtwpu
 aLmgZowYE0NImgv3Uu2aJDx6fIQIrIZWYTcCvX91EJgjCRiGKNnCW7QwYg6TUpo0kRFo
 ODgwdxBCx0V+v36sWgbA2EpgehaTDBumlrG8YJdboPB9g+MJ2JdUvTEq9wx/VIeh8UNm
 8jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LYeZdmKW7klyfKmK54Xa7qu1Vr0cL+u0HqvbNAYw33A=;
 b=SOUf2fNz4jvpsj4XvucPUOW7bkCUajaPy/OKhp0CnwK0cOlyGaOQOxTLjvxrhMGE7U
 8hDlASoppsK9VoxwbhOHwHA1J/AG29gj8pb7Jiecz2hmxKwFsADWTiUJUscaGQp5YPVN
 VoKnyaSVXCXe+2wgNyLS2cM6vebB62EuzGawprtSgH7cqQOsSVrEN9FbTV+N7rQUZedg
 DN0V/xJasJDAV/KI/Oc8RUSUnaDLn5XaSh2Yy3tLoZ4FRZWi5OAFcLx2L6LLTu+47Vyo
 1wjDMeJHKp5AmUuMyQTaVCUn/vFrIp9aJjB9o25JPgBlLMYhJwVaiX6dBP28ViRktNb6
 kAvA==
X-Gm-Message-State: ACrzQf2hTV2Zlq2jB1aS9VC8DghYqm6lQCFHIkMyB4urhlegfPIon/2b
 WmB3VmjZ3RmKEyQ72BZTN9+44IrjRIHTwkru
X-Google-Smtp-Source: AMsMyM4dxu7WnAF/4xN4uJXn2YI3o/k90qCMDGnsv44EUzwqc8BZNvlmLYWxyiCzyn9B6BOCPhBaSg==
X-Received: by 2002:a5d:66ca:0:b0:236:6d69:e1a0 with SMTP id
 k10-20020a5d66ca000000b002366d69e1a0mr16611456wrw.558.1666906952875; 
 Thu, 27 Oct 2022 14:42:32 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a5d60c4000000b0022cce7689d3sm2334368wrt.36.2022.10.27.14.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 14:42:32 -0700 (PDT)
Message-ID: <c77f7be2-e30d-b42b-3cc5-f488b96fa889@linaro.org>
Date: Thu, 27 Oct 2022 23:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v2 0/3] hw/isa/piix4: Remove MIPS Malta specific bits
Content-Language: en-US
To: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20221027204720.33611-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221027204720.33611-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/22 22:47, Philippe Mathieu-Daudé wrote:
> Since v1:
> - bswap -> tswap (Bernhard)
> 
> Bernhard posted a series merging both PIIX3/PIIX4 models
> in one [1]. Due to Malta-specific board code forced into
> the PIIX4 reset values, Bernhard had to include an array
> of "register values at reset" as a class property. This
> is not wrong, but to model properly the model, we should
> simply use the hardware real reset values, not try to
> bend the model to please the Malta board.
> 
> This series fix this issue by having the Malta bootloader
> code setting the board-specific PIIX4 IRQ routing values.
> 
> Note patch 2 still misses an equivalent nanoMIPS code.

So this series won't be merged until this is added, but
it should be enough to let Bernhard keep working on the
"Consolidate PIIX series".

