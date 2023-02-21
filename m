Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3CB69DDFC
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 11:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUQ18-00068w-2z; Tue, 21 Feb 2023 05:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQ16-00068c-Qg
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:37:00 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUQ15-000743-7x
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 05:37:00 -0500
Received: by mail-wr1-x432.google.com with SMTP id l25so3470419wrb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 02:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dgSv7ZuWk/DxEc28BEwMqUn8a6ouFhzMgY0nXBMnv3c=;
 b=gSD3+QJ6f2d5ZTFGNgKygthUJkM2/5za1YQvOA8fadW/QeOwF8NyauQlmH9vVQsY0P
 KPZbhFgvi60PRJK/MUgvy0ycHwmHcoeehAlmpqC2mWzazc2iTuuVUiEEeTS4toNvuHtQ
 swNM/coAl+b0HCUSMJQzBMoHRBIY0cJnQ12XdLDqaD424HQJrGJmB44X0PINcd5sbrMK
 fIazIpqpWcYaQxYaL8jBAJMkhySzhk1BlrZHWoDfjusH3tvXqHa962uTAcPsyN6lFuKa
 QJv22QJtNFpYRY+na87qcFcSfwn39sTycN6qHOrK7iIj4pgqYHhUmsotXw3HDKWA7W4i
 YaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dgSv7ZuWk/DxEc28BEwMqUn8a6ouFhzMgY0nXBMnv3c=;
 b=0p+GHQmUSiFLEFwkCVMJ2XEOPxLXVaPdPXxEKxugcuVgCGlZd+Hc1vEnmKAzgy5Mp1
 5xD/O9vKiWsxcSdJwHWZHoglndv24SdKN/1gx6GEUsgEgBmlEM+9/80jHj2vdmPexLGw
 n/gtUT4XGQN3x0fahK927sfoBeF17kpF6IhH08OLGC39N7CTr4COFjWI0SP/Opal5vhU
 TvfSpqpbx/jnfA/yNVCA/0PrUFcG4gIOZ80gN2/FswbrwvtXde9ZlbDEiWT1fEtdvauo
 UM7MqQs/1Hdu11HLeO+GqZFQ7m9/i6HpuaTBCzYfzdNCScLaICWo6G9BX4GWWHJtyloX
 njXw==
X-Gm-Message-State: AO0yUKULBAXZK3mv6KIW9folUkvVzl/e8vrYzm6tYqV5g/9wDTLcT/gy
 uSGMpLbL19ljfLx8PeHcy4+ykA==
X-Google-Smtp-Source: AK7set9YmpKN15cEB+oZRwiUb+eoHt3T2WuNiHGayxO+4abA4GLG/6GxsNiUVviAJgV0KlInd9vOPA==
X-Received: by 2002:a5d:55c3:0:b0:2c5:55c6:28f1 with SMTP id
 i3-20020a5d55c3000000b002c555c628f1mr2792351wrw.19.1676975817711; 
 Tue, 21 Feb 2023 02:36:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d678f000000b002c6e84cadcbsm2331840wru.72.2023.02.21.02.36.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 02:36:57 -0800 (PST)
Message-ID: <07192b8a-c6e3-6dcb-ada3-35842f800068@linaro.org>
Date: Tue, 21 Feb 2023 11:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/14] tests: be a bit more strict cleaning up fifos
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Alexander Bulekov
 <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
 <20230221094558.2864616-5-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221094558.2864616-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 21/2/23 10:45, Alex Bennée wrote:
> When we re-factored we dropped the unlink() step which turns out to be
> required for rmdir to do its thing. If we had been checking the return
> value we would have noticed so lets do that with this fix.
> 
> Fixes: 68406d1085 (tests/unit: cleanups for test-io-channel-command)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/unit/test-io-channel-command.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Per v1
https://lore.kernel.org/qemu-devel/20230215192530.299263-5-alex.bennee@linaro.org/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>


