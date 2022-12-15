Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3CD64DC80
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:51:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5odJ-0000FK-G0; Thu, 15 Dec 2022 08:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5odB-0000AM-Nk
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:50:38 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p5odA-0003XY-10
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:50:37 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h7so3105146wrs.6
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=40sI7VIhREQE4Kr8vXl9CmJQSbgHzmapkQzmFJxs6kk=;
 b=R+VMYwREgiCn2sVZN7/lbpYqor4vB8Q4hNdIk6tDi8oZnJqC8kPFNcp4jb2m1MiLVk
 XhPcPClUUi4o0aIqxJwz7gsX/qVQrPaYvHnPraGpzdSalucaKPFet1ECu1eGblg5wXF4
 WFwezKJWEL82W+nGb5jrPb6a1VVNbbWQ9EDBEQ8n5hXZitsWgjHDJaU7Y1CKr5T8iTqe
 rAkHR7KMQj7JPvxJ2N4yCTatiSKIlMn3fmE4QnzdHPBq/EhlambPkTzpJkCa5mzTvgZ9
 98CGY/GENrCdBV7fiC8bw/wLxbruUPMXa+nL701h2SNue6QsAk/VlEogBxaVoSS72lgt
 XA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=40sI7VIhREQE4Kr8vXl9CmJQSbgHzmapkQzmFJxs6kk=;
 b=wakaZW6hoouXZAjBPiwUv8nqmrj8I18uDfI71phMDwxeIWqLKJSMO3vNN1ZXJbSydI
 hp0hRm8bTJL3vA82NJcJ6IgTLDS0bIp2arzIGm4x7y4BVkaDXTo2mkTH7QUO601PHTme
 aWN7G1g6H2jyNbp6T8rkiyV1Z73Wo3uRO4d7OnBdhIQDxh+id0vx2lX6nlrctGsvJH66
 jZt8J9F0Huho8dh0m2/ys8wSIX0+0yV0Wluf6mqbxbhvkO7BbgElQ0Oz/Hzxizl0RO6O
 YcAcDFBMm0xVJllz3XBmQg3d3tTZkKlKyP1TNIfFckdxUZ2tn+quBt3kIGmfR5LywhqM
 Abtg==
X-Gm-Message-State: ANoB5pljmdgOLEAvskLH1/pSarjxNXrPP+K1DFlnCrbAOJuiGm+UwKQm
 cwMChB1AGREj3JP9t/MgmBwHvQ==
X-Google-Smtp-Source: AA0mqf5WjDaRSrtkhvZqeeFEv9xjADqDmSuJoAkrq0uB8r08A1WFtnTvgT1IDzehustwvP57LdfCxg==
X-Received: by 2002:a5d:4109:0:b0:242:4934:8c7 with SMTP id
 l9-20020a5d4109000000b00242493408c7mr16572756wrp.15.1671112234454; 
 Thu, 15 Dec 2022 05:50:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x13-20020a5d650d000000b002365730eae8sm5967196wru.55.2022.12.15.05.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 05:50:33 -0800 (PST)
Message-ID: <80a0d983-6a68-1a02-c759-8fd144b953ed@linaro.org>
Date: Thu, 15 Dec 2022 14:50:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: QEMU PPC VLE support
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ralf-Philipp Weinmann <ralf@comsecuris.com>
References: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAJSP0QVVQLueQDzOb-GAhORetK38EzgBhem=UjChJ3oaxRaFmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Cc'ing qemu-ppc list

On 15/12/22 14:37, Stefan Hajnoczi wrote:
> Hi,
> I came across this post where Ralf-Philipp is looking for a freelancer
> to implement PPC VLE support in QEMU:
> https://chaos.social/@rpw/109516326028642262
> 
> It mentions upstreaming the code and I've included QEMU PPC
> maintainers in this email so they can discuss the project with
> Ralf-Philipp. That way the chances of a mergable result will be
> maximized.
> 
> The Rust aspect is interesting, but QEMU does not have any existing
> targets implemented in Rust. It might be a major effort to create the
> necessary C<->Rust interfacing, so I'm not sure whether that's
> realistic given the timeframe for the project.
> 
> Does anyone have time to take on this freelancing project or know
> someone who is available?
> 
> Thanks,
> Stefan
> 


