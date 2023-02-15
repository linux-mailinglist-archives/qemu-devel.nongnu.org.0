Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2069863A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:48:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOga-0005Hi-Sp; Wed, 15 Feb 2023 15:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOgU-0005GP-Bb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:47:25 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOgS-00017j-FA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:47:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id s13so2754577wrw.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pJqRjEhlKl13zFx6NJMV4OwwodZkI1RwaD9JBSeHc0w=;
 b=oHfYTMt9Ghl4YWAmJJKkgDEe6Vxt7pLoKN5R+TkVDyajYowbYv0BKmiiSa64XsLGN+
 keRn+FG/Q629s97/+tbyXUhvRytbWJuUEZUpXcI1n4BoVkhcTk7jIURUoixPVobczUIl
 2qWapUtTVpX8hndMMBO2Rlheu96Dbr77RVVhEwjR6gyMx0YrRe9ZAsoZHmLpI3qzQwCq
 eafAVtGDIpBHvqp27BKAz/PzKdGS/xJ2YXsSgp6NiFQqFANT11/dF9hlefrb88rK0ZgK
 U6lMbm2UNCJ1Ykbs+0FKh7Rl7Xi8xhF3r7Zl7oNJNp2hgRQgYST09e703OsHd6k3QGyv
 qjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pJqRjEhlKl13zFx6NJMV4OwwodZkI1RwaD9JBSeHc0w=;
 b=3E0WQp7Vbr412mVS8ipgAyvGirUkTcgJJCuTxCb/H9zFOtAkfiQMN+2Pr6C0yL6kzE
 ewUSrom3gyg9RU1cgkVp3YYXeGMLr+L4n/Ey5R4Fvarl+FuwjcAP9pQgVGGtQ9ksojWN
 5j20JwQwKM3Cpe3S1VWw2IZkzzp882furW/d05KIXLPjbC1uADsaPNHt0Zn9wrYcOq3r
 Ok2NZ/TlLSg+/Oyqz8BauhMxrFHoDT3ax8fgyW0UOUch/8uIr1SQxzuD5o2Y+/QgJLvn
 mbWFRb8qBbxlFtxtU5h0qUtbnT2Pc8/OLDjm7BYi/S8Zo/t0C/fsMLLkT9s6G0i2Voz8
 7z4w==
X-Gm-Message-State: AO0yUKXBU/E7v3z3/1Fnj+07dy1ZHyQy10HBsXabAh6DijLIsadGvkdO
 K3UcPo9dDqjRqD0kXXr2jpXn9w==
X-Google-Smtp-Source: AK7set+a2IOcqn9xvjwBVMrNk1X+wc6aiLN27fyZx6tVCc05Ln8cFl9l3z/SQYrVHWk6aPZMLch8rw==
X-Received: by 2002:a5d:64e3:0:b0:2c5:5335:73f3 with SMTP id
 g3-20020a5d64e3000000b002c5533573f3mr440214wri.34.1676494037976; 
 Wed, 15 Feb 2023 12:47:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r2-20020adff702000000b002bddac15b3dsm16081586wrp.33.2023.02.15.12.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:47:17 -0800 (PST)
Message-ID: <534be66c-bd70-a4e9-0e30-6892d7b0c8bd@linaro.org>
Date: Wed, 15 Feb 2023 21:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 08/12] tests: skip the nios2 replay_kernel test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-9-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 15/2/23 20:25, Alex Bennée wrote:
> It is buggy and keeps failing.
> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/replay_kernel.py | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
> index 00a26e4a0c..f13456e1ec 100644
> --- a/tests/avocado/replay_kernel.py
> +++ b/tests/avocado/replay_kernel.py
> @@ -349,6 +349,7 @@ def test_or1k_sim(self):
>           file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
>           self.do_test_advcal_2018(file_path, 'vmlinux')
>   
> +    @skip("nios2 emulation is buggy under record/replay")

It will be hard to notice the flakyness got improved. What about:

        @skipUnless(os.getenv('AVOCADO_RUN_FLAKY_TESTS'), 'Flaky test')

>       def test_nios2_10m50(self):
>           """
>           :avocado: tags=arch:nios2


