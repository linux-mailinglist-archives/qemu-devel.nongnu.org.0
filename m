Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C67D3571104
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 05:57:35 +0200 (CEST)
Received: from localhost ([::1]:54690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB71i-0006zY-By
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 23:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB6zX-00053P-5h
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:55:19 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oB6zV-0003Yu-J7
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 23:55:18 -0400
Received: by mail-pf1-x435.google.com with SMTP id j3so6438506pfb.6
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 20:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XKgDREMtzCUnTEw+cjMUCaZe9QboHvms3sme9mBnF50=;
 b=TDwK2DbaT15TQjDmHYQOUIQfkoO4AEEjvV66yOJxumN7LAgX1AT6qgTrtgkCyrmwSf
 Nv1wdB8V2vDwY1Hobk4M1aFXWpXGQyVyT36hhgLBUdjpsrR/DRkXrgmxFVueq7p0e4Tf
 efWBVXymAndEk4lBs6QYJgXAqQGrc6IT25owEYSqfi9IzHU4+YPMi7KmIEkQ9074prXw
 rvrYprMsbxpPn3aeNEhvDrY6xgq5umIK0xSvm3R3zcS7dxoJ2YqsHWv9xMpPVbFkp2LX
 odQeDiB5vvbhPmJYK2owtKwgjIPBROwgY7dws7+9e9Q3YNf2pthz44JG1totkNR745PG
 f1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XKgDREMtzCUnTEw+cjMUCaZe9QboHvms3sme9mBnF50=;
 b=IJIX614n6zHoad+oASGZJrTM2thGu9v/DRxAaCO17xFAuAFfZrFqwUQdjCU1fm7JjO
 hot5sKAaOP9Hnr+ByNRDjYrIjQLV5CIbW6EnrKaGUMGnDwn2wFnW3MotGUmg2P+o0ZYT
 752UjkDDgIYNJL50mErZ2IIqh4IU/Vtf0ARnytohwSUwX2y06LgJ8+CcdAqFIVvZriS/
 9q9Q2OocoEZQDCJKSfiz4o5jvU0IzCwMJUYCgbj0DkK1TP8SJFHPco0OBU4EU1vLESrc
 Bxwrbk0sdauYfWOycjZbrusafx4+wxhrPks7YJtwUHgoQr/VaulDLTmdxed+BE/x1yu8
 nE4g==
X-Gm-Message-State: AJIora+haXjvf6ddKmZ2rV7Ch213SZ0b8s0uPHjM8CyfJlCjdKpXHpaR
 OIpvhMqxvZ3LeJyYpvI6VtEWIg==
X-Google-Smtp-Source: AGRyM1vW5U2TNbQeo+WezJv8tilCwTWTjoAxHOoIQWaGIMe9445WG42X2esd4+H5JJnuQZMuEz10sw==
X-Received: by 2002:a63:db41:0:b0:40d:e79f:8334 with SMTP id
 x1-20020a63db41000000b0040de79f8334mr18354359pgi.565.1657598113940; 
 Mon, 11 Jul 2022 20:55:13 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a63c109000000b0040d87299ca3sm5022915pgf.54.2022.07.11.20.55.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 20:55:13 -0700 (PDT)
Message-ID: <ec9ce92e-4e91-6ff6-49d0-bc694eef5fa8@linaro.org>
Date: Tue, 12 Jul 2022 09:24:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] gitlab-ci: msys2 improvements
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220711075643.3744153-1-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220711075643.3744153-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/11/22 13:26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi
> 
> This is a small series to attempt to debug "Intermittent meson failures on
> msys2" and improve a bit msys2/gitlab reports.

Thanks.  I've pushed this to staging for a test run:

https://gitlab.com/qemu-project/qemu/-/pipelines/585473909


r~

