Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D44B3210BA
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 07:12:06 +0100 (CET)
Received: from localhost ([::1]:41872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE4Rx-0003Rt-IL
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 01:12:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4PJ-00028L-EW
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:09:21 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:42253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lE4PI-0001aa-0u
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 01:09:21 -0500
Received: by mail-pf1-x429.google.com with SMTP id w18so5944878pfu.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 22:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/7+aZQr7vWgZ2fyWC+t8aItLunHa8QYy864qFt8ZFqM=;
 b=b5tVp4vyoiBiyTaan7cKeZHkZb6VSvfTdnBYW56sdhUPj7UaIkO3oAz8fEb+46VMrs
 CEt77DeghPSgoVT76hwK6zCLkYInoxV2EsYqpmxfAv25Db6kP70qFKSLuQ8iIf5Fw0XA
 X9Dfg6feCFXJwyOffHocBoUUC5d/Otpu0OwWp0AO9iL5MxhcRPmHBmtTfhaWiOMzviV7
 owRfJ51TDwNwfqu+B5r4Nczrz7WRU77Ax0anWeLysipa+afqxNa0rop7cXROCAEPy35B
 uqQoxzsEHE5gNqxpku9KH7a9ynoZrnKxvnNPe2wS+QJlbWQBpJB8jB79Wpoy1tTHlh4l
 CriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/7+aZQr7vWgZ2fyWC+t8aItLunHa8QYy864qFt8ZFqM=;
 b=TTG1PewdgbzwyGj1wbPnOzoKXxG09fNft9MDtvwP+Fho88Xkx5l/FV8lAVVkJVtiW4
 w+cYj4ApKa9Sld2raUdGKfJQYLFErhzpms1Hr2CZxkZ50+twcfd4U+UdAcrpAULRNkCW
 d0mVkb4JGyhqV5y96ngpoZb+8CJZW6CIFfkCZGznG+PzHMN22IuaN0iascgM6d4qoPzp
 HOH2rIpFIB91tvWFFPeyDJkkeetgHCzmOgiV+srD+YkZRbBJhTxp2BfhMcXtQEQVBlGo
 /C6pmqjiPJbTyxrP0l2YWLkXRkPdISHtDbNtpIuwpwv6rAC8qPCf8wyRzMZGb3Ahq2h8
 mKnA==
X-Gm-Message-State: AOAM5339SlKQcbltE2FrQn70lBeKZg0r9b+3a80ENr8iQCAtAeICFyoV
 JGiXhuhNM/SidjhUXgf+Z/CyVoIzAmInoA==
X-Google-Smtp-Source: ABdhPJyM9EIlqyabHDhFIShUw7WoL3b83DxyoJsYwkhWZSP5TmL6BQZc1mX6vjRpxhfwG1quge+hkw==
X-Received: by 2002:a63:de0d:: with SMTP id f13mr18916069pgg.194.1613974158438; 
 Sun, 21 Feb 2021 22:09:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r23sm16782600pgl.42.2021.02.21.22.09.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 22:09:18 -0800 (PST)
Subject: Re: [RFC v1 28/38] target/arm: make arm_pmu_timer_cb TCG-only,
 starting tcg-stub
To: Claudio Fontana <cfontana@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-29-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9e8a95a8-6851-6a1f-f98e-a46ca5918cb6@linaro.org>
Date: Sun, 21 Feb 2021 22:09:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210221092449.7545-29-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 1:24 AM, Claudio Fontana wrote:
> @@ -634,10 +635,11 @@ static int cpu_pre_save(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
>  
> -    if (!kvm_enabled()) {
> +#ifdef CONFIG_TCG
> +    if (tcg_enabled()) {
>          pmu_op_start(&cpu->env);
>      }
> -
> +#endif /* CONFIG_TCG */

Why the ifdef?  Seems like a lack of stub.
I agree that !kvm rather than tcg is a bug.


r~

