Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8659651BB6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:31:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7X57-0000Yp-Pp; Tue, 20 Dec 2022 02:30:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7X4i-0000WN-8I
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:30:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7X4g-00079x-Ai
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:30:07 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m5-20020a7bca45000000b003d2fbab35c6so8046981wml.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 23:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EbUUMP9RonkydEpBsPM34hJhv1HaWaZp2j3DYkViEH0=;
 b=XR2Q3hFXiK5aj7rZ+KFbiuBFCrcYoxJSiBGr2gJULrLXDX4g2szyCTfIWnzAk/i36J
 GSXRlzbv3f46tBYACHpBa6AEKMkByhSvxUy+P3GnbfXlKOcVNCu7nGX3pCcWihKRv+o3
 nAGMX/YujnZGgN7/kFxliLXKuuD8IC2jJYW2TkRCRneLZWsJ7xWj4/gImAcDSF3Trige
 /RDZEvAMiiUVfqR+obQ/lxg2JZYRHZknFDBhZZtQLhbm8o10gyWNq0Y44z8yiYnzHGQa
 CfabYO7GKpS80CCSGsuXhnsiiGBP3uA7QZy3gQFicBRoWH9DqPenYOxmHw1xfbGbz2ih
 sSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbUUMP9RonkydEpBsPM34hJhv1HaWaZp2j3DYkViEH0=;
 b=E0DxwBlNs+IOm6GPNAWcNLNrBZN5OBCUOxnRHVMciYKJ+SsP5PU/+DAmz7gDq1FWIN
 U0sNlgvBQt9ietUzQmFGZuw7Lm0IxKhJzxD+IryouCPICTKM0I9chFvL13K8zpQMZblm
 89H0D7zHmcebtHNac1js0tQ9QwZLnsaypHDZAVTesH3V1tJiVMkRTTFEgsgBTOrX+oHL
 1vRsc3WhQR3kA4JC+viO+fZVpeXx4kyI/eVzZO+Ydv3xMgOGy20/Va7vwdOCMHEyLaPP
 DZesmWzYRWd/tSuRd2O+YmZOnpzm3uGOVWnj8rC7Jyg1+xzl8iAEUM+9ZkvLIgN8F15o
 f9eA==
X-Gm-Message-State: ANoB5pkUNH0hH8dWmns7jnx0S0V1xtIsXZFcodPTF04UrKRFToyL8pi1
 1rrmoFGka7CXZzt12L9XU61U3w==
X-Google-Smtp-Source: AA0mqf5JtVYmxytP/yGZdjMNnGYSiiOjsdEFEpUefIa6K71UxL4sVJhOwl07CicpUIw5PAIWp8iAkg==
X-Received: by 2002:a05:600c:3592:b0:3d1:bc32:2447 with SMTP id
 p18-20020a05600c359200b003d1bc322447mr34138827wmq.21.1671521404440; 
 Mon, 19 Dec 2022 23:30:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c502300b003cffd3c3d6csm14800695wmr.12.2022.12.19.23.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 23:30:04 -0800 (PST)
Message-ID: <144e9b21-3bcc-4519-bdc7-4293f2c4af90@linaro.org>
Date: Tue, 20 Dec 2022 08:30:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 Alessandro Di Federico <ale@rev.ng>, Paolo Montesel <babush@rev.ng>,
 Anton Johansson <anjo@rev.ng>
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 bcain@quicinc.com, quic_mathbern@quicinc.com, stefanha@redhat.com
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <efcdbcb2-87c3-870f-5462-fad7a276de7a@linaro.org>
In-Reply-To: <efcdbcb2-87c3-870f-5462-fad7a276de7a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/12/22 00:19, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> On 16/12/22 21:48, Taylor Simpson wrote:
> 
>> ----------------------------------------------------------------
> 
>> 12-21)
>> Instruction definition parser (idef-parser) from rev.ng
>> Parses the instruction semantics and generates TCG
> 
> Building QEMU with Clang I'm now getting:
> 
> target/hexagon/idef-parser.p/idef-parser.tab.c:2197:9: error: variable 
> 'yynerrs' set but not used [-Werror,-Wunused-but-set-variable]
>      int yynerrs = 0;
>          ^

idef-parser.tab.c is built using:

193     idef_parser = executable(
194         'idef-parser',
195         [flex.process(idef_parser_dir / 'idef-parser.lex'),
196          bison.process(idef_parser_dir / 'idef-parser.y'),
197          idef_parser_dir / 'parser-helpers.c'],
198         include_directories: ['idef-parser', '../../include/'],
199         dependencies: [glib_dep],
200         c_args: ['-Wextra'],
                       ^^^^^^^^
201         native: true
202     )

(see commit c0a41ee631 "target/hexagon: import parser for idef-parser")

Do we really need this level? IIUC the problem with -Wextra is using a
newer compiler toolchain it can include warnings we haven't fixed. Maybe
worthwhile but it can break from times to times.

Using '-Wextra -Wno-unused-but-set-variable' seems a hack. I guess I'd
simply remove -Wextra for simplicity, since no much value is added here.

Regards,

Phil.

