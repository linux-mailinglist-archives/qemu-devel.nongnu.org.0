Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09638438B96
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 21:02:23 +0200 (CEST)
Received: from localhost ([::1]:51238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meilA-0000l2-Ut
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 15:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meik4-0008UW-FF
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 15:01:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:42818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meik2-0007zr-RD
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 15:01:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 62-20020a1c0241000000b0032ca21cffeeso6730797wmc.1
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eSrPaeKv2/m/AgJw/iEwEWEsnpI2b120anxnsX2+BYc=;
 b=bTQ70HJZB4gab+OEIOinSSU1etjhezHERYEMNjRwjD8BGmOQqI5WDg39ACAsushz+P
 /NGqjd85ChOBcQGuyBwtPIzcICh/96se8AJoWDwSaI2CieoqiO6BtqeA2JzKC4b08rvD
 gJpf3XfIVVxk02LZbfUH9hcNAfGvh3nBAqM6RuJdJ3RdJ8cSEMTky6LZfR3c0NG3l/I8
 imzQ9874GClIV9eqdnRywVYkuh+ajUTyZBJQ4fq5JY4/79pj+WiupV1fzFe0dpuaHevz
 D9RKgseElTSP5bHHwZ+8jc2X2LOwVPeCfKSBVXeL3rix59SiEpDm3PTcf05Orr4rgXwU
 5emQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eSrPaeKv2/m/AgJw/iEwEWEsnpI2b120anxnsX2+BYc=;
 b=hTiKomHzU0MsBtyDUxgww9O8n6qP3a+pQkVw9eWB47Wm7QW6iHqSqPmP6vCeyyHjwC
 +jItd1pubcboH2+WkzSIEMcwm2wPY6A2yOfcl4GTADmiv+3uvq4nhDoVfY/T3qCeHPYH
 XJCeQFm8jFkbBmcO3TaLQ8AYgSc2nIA8Nybv5Dm7yAfDqAAEwBTttTRCaWDZdizQxCyn
 9EOSVh2XuIr4w5Ueqe5T2aDkhCQtoxPkjNhgc4pClkhoUAzad4RMo0g78NyxWhogG/gM
 mJmhLAbakPevzSSzUB5F26QroN32L5pOJPAZGIUXMK5BR965zJgeLLcu/IxFuysU4u1d
 r2Lg==
X-Gm-Message-State: AOAM532VK+I+Y9/unO+PJF/5hNDsLmrXfxjOKBjL+J9S4vdVnvC0MqU3
 KJ4rFDhh8618p0uTyhaqIHk=
X-Google-Smtp-Source: ABdhPJygGOFnf6Z8/FzDMF7PtQ5o3RgqFeqDRno4BTEak8ALB0Xev73G99y2XJ4u8JrPxvfHBVIQxQ==
X-Received: by 2002:a05:600c:4f11:: with SMTP id
 l17mr14909349wmq.77.1635102069484; 
 Sun, 24 Oct 2021 12:01:09 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l2sm16963404wrs.90.2021.10.24.12.01.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 12:01:08 -0700 (PDT)
Message-ID: <ea5a1c70-fe60-63a0-60bd-7c46b5861104@amsat.org>
Date: Sun, 24 Oct 2021 21:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/33] target/mips: Fully convert MSA opcodes to decodetree
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <3331bed9-5435-1ef8-197e-f67e358c2768@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <3331bed9-5435-1ef8-197e-f67e358c2768@flygoat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/24/21 20:26, Jiaxun Yang wrote:

> Thanks that's really helpful!
> 
> For the whole series:
> 
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Double checked decode tree opcode with manual.

Thank you!

I'll respin addressing Richard comments but won't change the
msa.decode file, so I'll include your R-b tag.

Regards,

Phil.

