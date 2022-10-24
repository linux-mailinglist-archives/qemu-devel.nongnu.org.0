Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA22F60BD97
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 00:40:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on66H-0008Kv-Oh; Mon, 24 Oct 2022 18:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on66G-0008Aa-7F
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:39:16 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on66E-0000sp-My
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 18:39:15 -0400
Received: by mail-pj1-x102d.google.com with SMTP id ez6so9210022pjb.1
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 15:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zw3DYU+bMu9nBE6QIjgLy3+XLXjLWvv4EqWofFlBjWU=;
 b=Sw6EUv4CJhmfH98ZEhQvraYtVXXESWE1pA/fXHbMN6AxHdgH/9oyNYMZX8p36k5C5w
 THVcN9lEBvWoRfecRjsy8K8brYz0Am3LXCtjdYXtwBzVFRwcZN3jwG8/IiX7CEP+mb2M
 0ttCz+lwYAiSoJHj7rv3x7gPuscaRP2iVhxaATsIx13boYSqraQ6u+VKWFUtTNRIF9FO
 zDimhijiCZkovkAtHZ2gt+rZJS5raN6UejFzZfdENm6XSOcESWyEMflSJ+rUakfyTln4
 SMWepwcisPkic94m1a3J/l3vAXLBIMTD6/ONVIagzeSjPaYezeFaPyTpm8svSIqotYjC
 GEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zw3DYU+bMu9nBE6QIjgLy3+XLXjLWvv4EqWofFlBjWU=;
 b=FnctRsjK4pa7batYdDKgDxSgiDkmR1GQkIPub9Qqscb+ZTsHUNI/it57ZZmXuoExyj
 o/qluKhD1BD8XjsXZ2lQuqZoG3UXII4NHCWnmXJUox9ejSASGlk78RHS5HxyeBjZWkId
 Y8uVjp1eg2kW53UqVdA+Y3pZh2IKSec9+NGOKYTFDLr/VdWBI29WO5Gvf4+EHIte5sWp
 fWk1ucUWGZ1MUPoiGcUqiV1667j4Y/CEgovi7Ho50JEDFVmts5OuzTAK1+Wm57lc51Kj
 JU6/aihiAzIxalZx1fUveGVEMu5gN1QC4Sfq2s6ioFh6mPXIqyucS8SwxQHI3rveHb/+
 JTkw==
X-Gm-Message-State: ACrzQf1xoa7n3TuO9Ppc+EkLZCby/j+GY91rBDFn413v+20xrCTMUven
 aU9vVayFssgXlLRT48ePsq6HbA==
X-Google-Smtp-Source: AMsMyM6fK3lbbEkuFiPRg4sITIMAzw3xoz/z+Fh73YLWxpZp88WegOgWmLeSMe+CexFDRKR/s7F81A==
X-Received: by 2002:a17:902:cccc:b0:178:a9b3:43e6 with SMTP id
 z12-20020a170902cccc00b00178a9b343e6mr35007469ple.92.1666651153159; 
 Mon, 24 Oct 2022 15:39:13 -0700 (PDT)
Received: from [192.168.136.227] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a17090322cc00b00174c1855cd9sm191464plg.267.2022.10.24.15.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 15:39:12 -0700 (PDT)
Message-ID: <6412545a-5b43-421f-d94a-cf3111725047@linaro.org>
Date: Tue, 25 Oct 2022 08:39:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] linux-user: Add close_range() syscall
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <Y1b45IL371MJP2WW@p100>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <Y1b45IL371MJP2WW@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 10/25/22 06:43, Helge Deller wrote:
> +            abi_long maxfd = arg2;
> +
> +            if ((sizeof(abi_long) == 4 && arg2 == (abi_long)0x7FFFFFFFUL) ||
> +                (sizeof(abi_long) == 8 && arg2 == (abi_long)0x7FFFFFFFFFFFFFFFULL)) {
> +                maxfd = target_fd_max;
> +            }
> +
> +            for (fd = arg1; fd < maxfd; fd++) {

Why do we need explicit checks for INT32/64_MAX?  If the guest passes 
0x7FFFFFFFFFFFFFFEULL, do we really need to iterate over all of those impossible values?

I should think some expression involving MIN() is in order.


r~

