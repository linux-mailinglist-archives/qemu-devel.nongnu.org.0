Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DA952A984
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 19:44:48 +0200 (CEST)
Received: from localhost ([::1]:41002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr1FO-00028K-UI
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 13:44:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1B6-0007xY-F6
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:40:12 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr1B3-0005wY-Q2
 for qemu-devel@nongnu.org; Tue, 17 May 2022 13:40:11 -0400
Received: by mail-pf1-x433.google.com with SMTP id k16so10751958pff.5
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ek4m9QDrQu81S3Sw48IgF4832oSTj0UHlCZzDjalZzQ=;
 b=BvPHpNH5aCxs8SSoy4PVj5MBYYvSzE8gJ9Vycn5oCURY/LGn1h5rce804cToWAtwJn
 V5TKxdmQ2QrCKt+1WS6gjGnvDP1dDgbsQTQRFqwSkblf0ubnTQO0fce12FgRbBqcxWix
 3owCs0CNz6XpNGnBG7ZE6kkx04OoIpz/0WFU0z+XT7k6fQTdHCyyT0V4mVIziyJhCxYh
 M9hx9dVZDd3uiYCF8cLMhKGZHLDdO/MbggpnGwOax6QfDI7D4PqTbq3RcXz0f9S2c/Wu
 5dsuXQAs2xXF7iu00TZO1dTs27zr6lq7yuTT+PYRifym0Va30xXqfqn9xVnHEBCgD+dg
 ZsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ek4m9QDrQu81S3Sw48IgF4832oSTj0UHlCZzDjalZzQ=;
 b=1HVWPQv96JWIe1Kek3O2FcSCEaKdh1ANs8Pz3Ef2PAv4i4PQmzlwpYWrtolwupf9mE
 DFQgD/3Jb34ZL8z4jqyOmlWZJQH4Vt7pljEThggKlcARIoVDKt7sHd7LHloMreKszY6p
 rsvtuWB+oN70G+E0pPG6NcdbvZU1rMJQPtJXu9zMiJJ/DTQHNSIC6uXHtFA7QMpobXw2
 E4GawFThx+GjqYZqynlrhDj3KdlYJx4kQBK1Fm6WerPu6MF680uTkcMk4GydJrhB+p1a
 G4UAKlKxc+XxaQet4Otl5OFv7WH1HWwoGZ3yDO314grxtdTC3HwxXf7tpDQsu6lQYVj5
 LSXQ==
X-Gm-Message-State: AOAM533+aAlBN40jyfcrJ2evvUKxen92OqdZWVriGvZ9WKfPMeUQp+23
 5MqnC607jmx4SdHv8eO9DsYPlw==
X-Google-Smtp-Source: ABdhPJw9fzlX1QxaZwZxNj0co/ACkVo7XMXSlc0lekaiZJhTwuBkFWzMpRXdDdnKahBeh+9zBPZPKg==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id
 b18-20020a056a00115200b004beab79fcfamr23425704pfm.3.1652809204278; 
 Tue, 17 May 2022 10:40:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b0050dc7628161sm17902pfg.59.2022.05.17.10.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 10:40:03 -0700 (PDT)
Message-ID: <11c9aedc-44de-f4bb-c90c-9581d6a7a971@linaro.org>
Date: Tue, 17 May 2022 10:40:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 12/12] target/ppc: declare vmsumshm helper with call flags
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org
References: <20220517123929.284511-1-matheus.ferst@eldorado.org.br>
 <20220517123929.284511-13-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517123929.284511-13-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/17/22 05:39, matheus.ferst@eldorado.org.br wrote:
> -DEF_HELPER_5(vmsumshm, void, env, avr, avr, avr, avr)
> -DEF_HELPER_5(vmsumshs, void, env, avr, avr, avr, avr)
> +DEF_HELPER_FLAGS_4(VMSUMSHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
> +DEF_HELPER_5(VMSUMSHS, void, env, avr, avr, avr, avr)

Similarly, VMSUMSHS can set call flags as well, because the only thing from env that is 
modified is the saturation flag.  With that,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

