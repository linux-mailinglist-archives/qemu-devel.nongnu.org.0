Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00C634BDC3
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 19:43:53 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQZS4-0005pU-SH
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 13:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZPQ-0004DZ-NM
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:41:10 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:40513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lQZPN-00078z-AY
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 13:41:08 -0400
Received: by mail-oi1-x234.google.com with SMTP id i3so10996604oik.7
 for <qemu-devel@nongnu.org>; Sun, 28 Mar 2021 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xRtBhi/A7RJneuNjUm/jJnn8cNr3HAWBBeoIlAWDXpg=;
 b=qoBm5FWmKmVXVcbUD+UhHrElp5F36lX0q7+cXWReZvXgWdGwwRF6NwjEiGERwcn2jg
 MGjl61bsJ8QmHpuYcfOffGKAHO0IlNw50rSWd+zph2/jE8LT5VakABv6yRyQ/qusWF6e
 Oiayn+jBiqf3DcysWxti+7HI/i7uzQdvd24Iql2uHoW1lOMo3d+ow40PUX82xffSbUDi
 FQJNNl83MpdGhIL9wS5ha+kid6QRzpFhHbysoaCq51eU59atnG4YGPUR+H7uUMrkKUWb
 mG7J9ABFVwgrun8OdnkkqFK9a7zuimrPrdicAF3cMVOnZhHe1Sxdmic6286Zt2GR7ChG
 97JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xRtBhi/A7RJneuNjUm/jJnn8cNr3HAWBBeoIlAWDXpg=;
 b=h0f9UThvOBAysmAMw2YKBpHNJgOzx36EOCR2NHIJ1fazDwbP+b/EjE6i1JKPruA9ls
 qtyMQIxEyXm57w7qE2A9ICXg8vN75mKO+aBjw+Zl4ZFKD7BfkoRlWcIKgDQ8+QolHZnt
 wGjs0aYQU7i0C3lyW7e2IapGHiIRfsYF3nRC5R71K0vae7WmliK3plocR7whZClmV1hM
 +mOudhB3A3lz8mwWpuZcgNOiBgkWO5DscbIorhxtJN/L2U0ay6nDCWnZXi0nC4pLsNCB
 Id6IWLkCyy1li3jzMsZ++lIZLtiZ8Vf9Rmsg+HICyxD3aPpWdFE8H7fE9tzgj37n1ewh
 wioA==
X-Gm-Message-State: AOAM533vYIQCq3ezPtONWrv6wfuAp8O9V+dUo+8A6K09R89othSua46c
 /3Cr6WxozOviop3dWASocGugfg==
X-Google-Smtp-Source: ABdhPJyc0OglhwlAtnBvbMKW9gpbyvR2oOBo5grLY4m1ok6VK4w8Vjx+KppHmWUdfQPb24hTvbPYAw==
X-Received: by 2002:aca:741:: with SMTP id 62mr15824753oih.104.1616953263831; 
 Sun, 28 Mar 2021 10:41:03 -0700 (PDT)
Received: from [192.168.211.34] (171.189-204-159.bestelclientes.com.mx.
 [189.204.159.171])
 by smtp.gmail.com with ESMTPSA id n10sm3488502otj.36.2021.03.28.10.41.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Mar 2021 10:41:03 -0700 (PDT)
Subject: Re: [RFC v12 45/65] Revert "target/arm: Restrict v8M IDAU to TCG"
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-46-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b7049ec5-10e9-7cb6-e8b1-1fdd85fb3142@linaro.org>
Date: Sun, 28 Mar 2021 11:40:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326193701.5981-46-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/21 1:36 PM, Claudio Fontana wrote:
> This reverts commit 6e937ba7f8fb90d66cb3781f7fed32fb4239556a
> 
> This change breaks quickly at startup, as all interfaces in boards
> are checked in vl.c in select_machine():
> {
>    GSList *machines = object_class_get_list(TYPE_MACHINE, false);
> }
> 
> In order to restrict v8M IDAU to TCG,
> we need to first disable all incompatible boards when building
> only KVM.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/cpu.c                | 7 +++++++
>   target/arm/tcg/tcg-cpu-models.c | 8 --------
>   2 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I have a notion this should be done earlier in the series (first?), before code 
moves from cpu_tcg.c to tcg/tcg-cpu-models.c.


r~

