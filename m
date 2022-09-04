Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5DF5AC4B2
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 16:12:33 +0200 (CEST)
Received: from localhost ([::1]:33926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUqMS-0006BB-Ql
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 10:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqKl-0004Om-Rj
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:10:47 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqKj-0002os-LV
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:10:47 -0400
Received: by mail-wr1-x430.google.com with SMTP id k9so8228799wri.0
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 07:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=/AX6USPCO59bBpEhs3uH1aataslR0EeIu5MpVU8C/n8=;
 b=kSk8tUi6eZQ2YO5+pFExwfgp3efhkbKQ2aua05K4RsWvo/qoNOpElN4711dSk9Py8x
 tTy9Bk2D/4hdYb6cnvnsHssh3NxPBR/ZFPfHvH0A7747F6Kno78p6SQ/YGzdKWFgXsZG
 C2SH/Gpp53GjIfBfW9WucWY6iZ2VK8uyKt1siI4kE3Xl8yoYSJoZh0nrOphGISo1sGhO
 v/Kl2zuMfaczCKD1DmbbihAgNV7ryENDsQjoPfXvC+rn9IIwjjOS4lhEGnD+bgtsvh3x
 F+eqzHJwuyDgenolrD3wAVB6RCxB6ahVK73LCLUtmS/sq+D4q5eer8GoxOc1bcE5Rq+4
 rHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=/AX6USPCO59bBpEhs3uH1aataslR0EeIu5MpVU8C/n8=;
 b=JbiW1rMv3Z/pXgqNeZALRpWrOE2LZReJKLpXnP7+XbmlnRu8C2GMC9zhDY9Atx6Ftq
 49P9RwLbV8DrNRW3nvQq2vn8l5WCPvJa9LBWw37RSEJEGbpuobNVp/J9kwqBkv/H3IxM
 A4XnN/O0K3z59IcXxJr9Ka37qYRvXEuLlugbE5hYw0u+LHCm0Py4rOy+sueqSZvJYS7q
 e6v+3U1hn1aK2zLFdARrGu1XWHGhHNZS5eSrtVyNDDES1uay+G0Ej65FBEGUjF/JHlyC
 NXT/dbcXFIt+UoMRSuBD2RdcUFMADWVYuZldAlv56+De6YC6zuctaEZgMywDGICAK2Ir
 jm7Q==
X-Gm-Message-State: ACgBeo19W+lR65MAmlhzwCevye3N6REwPqJusEjrjcxCPJWy5SOUMyV1
 NVGF5XcnPW1eEMXSoU4oC7U=
X-Google-Smtp-Source: AA6agR4sLrZtgMBkUU5/BDc8GycCRP3EvY7jUa6dWb+swzb1YWEBd3lssjLPWOo+w7pH1xpYQMT/jw==
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr21992562wrr.361.1662300643826; 
 Sun, 04 Sep 2022 07:10:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a05600000cd00b002288a532003sm610534wrx.90.2022.09.04.07.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 07:10:43 -0700 (PDT)
Message-ID: <535c2fbe-dd6e-0c73-6021-cd12199c98aa@amsat.org>
Date: Sun, 4 Sep 2022 16:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 01/51] tests/qtest: Use g_setenv()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-2-bmeng.cn@gmail.com>
In-Reply-To: <20220824094029.1634519-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 24/8/22 11:39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Windows does not provide a setenv() API, but glib does.
> Replace setenv() call with the glib version.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
>   tests/qtest/libqtest.c          | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)

Should we warn for 'setenv' use in checkpatch?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

