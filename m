Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC34BBF12
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:12:03 +0100 (CET)
Received: from localhost ([::1]:60948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL7jd-0005F9-55
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:12:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7h6-0003jj-FA
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:09:28 -0500
Received: from [2607:f8b0:4864:20::1035] (port=51860
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL7h4-0002kf-KE
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:09:24 -0500
Received: by mail-pj1-x1035.google.com with SMTP id y9so9281982pjf.1
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 10:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tmTohSHoe+JQPpzq470FgxtpAE0Jj7SepU34Mt/GbOw=;
 b=hL0KIgnMVAVTR/xgA3o9+o4+FwuP1Eusgvv4a8IhcL1acXNTdjY/LCm6vAXwdurkRf
 ztAHt1XAAjlFdLP3me931o5hw3L6MykE1sxLLHQghNNrlSgpQh+uRUPwByrQ9li5XyHR
 +37c1y6NEdap6xHPSrrhAOU6hfDkI8ewLkj8F7MdVoYzfe2OdcvOGNz7f8Vz6DgZn5SC
 WI0jqLYonRUUHvhYqB5AzPfLsE971Y08++z+asZWKULhm/0MRG2DH/frB10OefvkPZhK
 kTWT1ywMe1kkskGEprKQh78k81MKdz1cRuffnLHxeRmKpTph7i41ywp6GvBhtPnTTq1R
 8ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tmTohSHoe+JQPpzq470FgxtpAE0Jj7SepU34Mt/GbOw=;
 b=4TyyRbQHJvDNhvYa3w5ECl/9r9ri3+DMV1gu7m19GezB0EgwUKSuwdVjcYzh/ihbGE
 bolzVCKu2kzs8Vwn2sV8wvqJeGOVDNzMpPjQyza2emJKnrkzADQ5dD2cWZXxfvuL3LUw
 DcnQXLMz7LUhett1NLloGWh6RG1rVpOR58XtWe2kcr9VwuI2nAtnxN4bEtTZzzez9O30
 M1Pnmd/P2aj6b+2/DIf5dH/VOHI1v5i09XH67QU/FwafnUmd6KrOb59RLsDJADxFSVDd
 8I8cDjVNskI/pMhii0qpeVZJXAjGi0DA3x+65OPV9ire/fyI11C5LPF++UUUFtaHY/1E
 JIlA==
X-Gm-Message-State: AOAM5332Codm76B7qXERlFmYlAMEj5cPqf77aQtD9fJnkG7X1/OM/Lsd
 u+DxpDk4KwWgWOtjiOrvuC4=
X-Google-Smtp-Source: ABdhPJxyys2ylaiQXirqHcTtulp6M1X9hmBcopbuY+Z11tnJz6WbXDuk1CFj8AR3DicWXI9eXi+H+Q==
X-Received: by 2002:a17:903:240a:b0:14e:dad4:5ce4 with SMTP id
 e10-20020a170903240a00b0014edad45ce4mr8434735plo.125.1645207761239; 
 Fri, 18 Feb 2022 10:09:21 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 q13sm4065587pfl.210.2022.02.18.10.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:09:20 -0800 (PST)
Message-ID: <7eb3be1b-68a1-37e4-52f0-8a154d2f23be@gmail.com>
Date: Sat, 19 Feb 2022 03:09:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/15] tests/fp/berkeley-testfloat-3: Ignore ignored
 #pragma directives
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-4-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220215080307.69550-4-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/02/15 17:02, Philippe Mathieu-Daudé via wrote:
> Since we already use -Wno-unknown-pragmas, we can also use
> -Wno-ignored-pragmas. This silences hundred of warnings using
> clang 13 on macOS Monterey:
> 
>    [409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_test_az_f128_rx.c.o
>    ../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warning: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignored-pragmas]
>    #pragma STDC FENV_ACCESS ON
>                 ^
>    1 warning generated.
> 
> Having:
> 
>    $ cc -v
>    Apple clang version 13.0.0 (clang-1300.0.29.30)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/fp/meson.build | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/fp/meson.build b/tests/fp/meson.build
> index 59776a00a7..5192264a08 100644
> --- a/tests/fp/meson.build
> +++ b/tests/fp/meson.build
> @@ -30,6 +30,7 @@ tfcflags = [
>     '-Wno-implicit-fallthrough',
>     '-Wno-strict-prototypes',
>     '-Wno-unknown-pragmas',
> +  '-Wno-ignored-pragmas',
>     '-Wno-uninitialized',
>     '-Wno-missing-prototypes',
>     '-Wno-return-type',


