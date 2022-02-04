Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090524A9C36
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:48:39 +0100 (CET)
Received: from localhost ([::1]:38682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0pB-0006Xr-RJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:48:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0gB-0007qh-Bk
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:39:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0g5-0005qs-3g
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643989134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q0ld7+bwgHCZA/uPYpkGVqXcO8duoPbdMZSSGWnmodg=;
 b=Lnudfx/QXIdUthB1iC3t4bpyEi7jqqQ7Ir1Redy4jwds1Adm/SDo4cRvE8t4KXYPg9l8ts
 Atp7crYaoY9JwwQ5MxVp7YsbHZNabFZA0crY33EqeeuhDTZ9gCpnlPlFK39Y2FQVkObGM+
 e2p+wEPWnsl560utfnh+cd3kDPiVWfA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-RM0-q_zONBOG5zOsrQUSgw-1; Fri, 04 Feb 2022 10:38:53 -0500
X-MC-Unique: RM0-q_zONBOG5zOsrQUSgw-1
Received: by mail-wr1-f71.google.com with SMTP id
 k7-20020adfb347000000b001dd761d46c7so2171019wrd.4
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q0ld7+bwgHCZA/uPYpkGVqXcO8duoPbdMZSSGWnmodg=;
 b=w5rhA6/y33qqOzkM0Ky0VV/vDI3+5rv2K6pa0ua3ukIjUddAEtrMNRjhpHkFW5opyx
 uDRQQqHAKGfYEFYo9kJXpkJqWLcvsAGmRS4DkHwX4YbXSJG2HH4mqy9dWVLkC8bVcLXP
 dLFNaEh+uccRQCTuQXXabZPssINrC1uJ9gGVHEhmoSJYJTgj13ySNPNSyo//qP6nsZMj
 KDcDR96TZFOcR4MIBvyQ2xOff/vt8n4kBztUlulWV1mZeaB9e1gBGhqULJjKyPFCtzIx
 zItBavVYD/ySvPmgYTQblbJYxwGm35TP6hX3jNPX2LbM13GJpnphxJamAZ5eVr5Ki9Xt
 8h3w==
X-Gm-Message-State: AOAM532PNTj0QZ/kMg9prJemo8lbh7VU2puNIAx5KPFpfHohiD+wuWV1
 8WMC1z8EXW7nBC3YZr1dAtcWgUdkC21POV8piYrzsBU+1Fe3VWwjQ/w0icmZ1pzmJVsAtcD839M
 1f1anjc3Uk8aPjZU=
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr2715922wmq.125.1643989132264; 
 Fri, 04 Feb 2022 07:38:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMJjJ5V3iv8jrIMH7bSaKtzvmUJa+m/QDhKQaK8TeSICSF8lGcyv4RP7gdIXd0A3dHWi9qCA==
X-Received: by 2002:a05:600c:364f:: with SMTP id
 y15mr2715902wmq.125.1643989132019; 
 Fri, 04 Feb 2022 07:38:52 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id h9sm1894888wmq.8.2022.02.04.07.38.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:38:50 -0800 (PST)
Message-ID: <137a9a4f-c632-105b-315d-ca42dead942f@redhat.com>
Date: Fri, 4 Feb 2022 16:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] tests/fp: Do not build softfloat3 tests if TCG is
 disabled
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220204152924.6253-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/02/2022 16.29, Philippe Mathieu-Daudé wrote:
> Technically we don't need the TCG accelerator to run the
> softfloat3 tests. However it is unlikely an interesting
> build combination. Developers using softfloat3 likely use
> TCG too. Similarly, developers disabling TCG shouldn't
> mind much about softfloat3 tests.
> 
> This reduces a non-TCG build by 474 objects!
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/fp/meson.build | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/fp/meson.build b/tests/fp/meson.build
> index 59776a00a7..60843fce85 100644
> --- a/tests/fp/meson.build
> +++ b/tests/fp/meson.build
> @@ -1,3 +1,6 @@
> +if 'CONFIG_TCG' not in config_all

Alternatively "if not config_all.has_key('CONFIG_TCG')" ? ... not sure which 
one is better, though

> +  subdir_done()
> +endif
>   # There are namespace pollution issues on Windows, due to osdep.h
>   # bringing in Windows headers that define a FLOAT128 type.
>   if targetos == 'windows'

Reviewed-by: Thomas Huth <thuth@redhat.com>


