Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1943BBCB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:44:20 +0200 (CEST)
Received: from localhost ([::1]:40658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTIw-0001IA-Lm
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfTHH-0008Hf-Bq
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:42:35 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:46868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfTHF-00028b-8D
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:42:34 -0400
Received: by mail-pf1-x433.google.com with SMTP id x66so560873pfx.13
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y+1/hG5rPhKGtu2CIVhjqeKa6yIOeU9S/k81ABTNAik=;
 b=tbOiP0+/52Pp5b0x7xPsL7EY5L6jfSACpAhZrMlYx/oB+USDsnKvt7l+oBcnwI+8ds
 Som3UJgPdgA6FGOmiiyJAOkjnJqJJbi1CrpkeJlYG9zTIC0doi/rxxDulFlMo8xB73x3
 /pFqj67TxMTGcWpMTG87pJAu7S5yk7IpZBIRAAKKQUBty/RgqeaeugBYjsA5W2ijpFb3
 BF7i7zaweH0ziTYcg3x8Ey4c3rg7ZEZEj0OPCA+TEhL8C2Z/QxEondYlab0p69vC+8E1
 YDK0oqrctpEIkaGcF4LjR4fkiOaQPYhGQj/DJ/OOmuVff9F0eqNvcEC69ALo5jJRYyc+
 irTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y+1/hG5rPhKGtu2CIVhjqeKa6yIOeU9S/k81ABTNAik=;
 b=W6JUQ12LBJLcku1Q/SDOK18hDgmejkTPVZ2AVtktl3ObKjjBSSqKbpMQKn8rcMTBdH
 FBMBzuytonBSTEvge9S5AEZfIAFz34f0Hknxse28v5XWOaxzi2bz6tKHNXVEDUH4r38C
 3KyaB6qlTuFkpRpcERpOX5G6vOj2QT5IoPBBnOuCOq6pozwJQVIKaPOn5EkHLN04Bwd7
 R4Irjh+7gM4e9CdVTwzk64VejqNlEec3FQF88WHkPWFdhR/u6rL2osge+v8B1edRdfjm
 vxOBpFjrCeoGJ8WFXUjrYjNvbBmaxGsDkk2rk2G/Qv2/LEeoLP0ZUkuIUKKCnEFr+qKY
 Szfw==
X-Gm-Message-State: AOAM531dIOyLfAWlic1RvYBV0+AWLyCNTIu71ODKAZc392TKwk49d9Aw
 rejbmDwK1ms0202cH4wdS4iN8A==
X-Google-Smtp-Source: ABdhPJxz6xOWibfMrHPLAJAkAnay4MnwyJjK0gOEkxqdkFcG2uRl1WT8knffHzotjGdwM0Ze52zjGQ==
X-Received: by 2002:a63:4f:: with SMTP id 76mr20722825pga.457.1635280951222;
 Tue, 26 Oct 2021 13:42:31 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g8sm3840179pfv.123.2021.10.26.13.42.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:42:29 -0700 (PDT)
Subject: Re: [PATCH v1 10/28] tests/docker: allow non-unique userid
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <270fd718-14aa-dae9-d72b-71b9607ab374@linaro.org>
Date: Tue, 26 Oct 2021 13:42:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> This is a bit of a band-aid against hand-built images that have been
> accidentally polluted by a user build. All images pulled from the
> registry shouldn't have the user defined.

I believe that I've fixed the images currently uploaded.

I think we ought to totally rewrite now we add users to images.  I don't think we can 
reasonably layer one image upon another without getting the user added at an intermediate 
image.  At present the only way to do this is NOCACHE=1 NOUSER=1, so that all of the 
intermediate images are also rebuilt, and also force nouser.

Does this patch really help in the meantime?


r~

