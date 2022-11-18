Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C39B62EEE6
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 09:08:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovwQ4-0002gb-86; Fri, 18 Nov 2022 03:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwPu-0002ef-MF
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:08:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ovwPr-0003j7-Pk
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 03:08:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id w14so8051714wru.8
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 00:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/uusR8hX9DRZcwT6IBisqCU2ANhpQTocdOwgJEeveSY=;
 b=C9tDeq9KwYFmgO17SZPploQui199GPZ9K9YwyVi8E2IKbSD2dmjFUY9zENrLdMblnD
 0D7Zpkpktj8/nu2KnRDFaG6v3rETLq1vRc+PcGNE+50EKJR+28kizeAe2z5cPUC5iB3b
 DmdGtm4Df2lQETSzywAXj2gHjH/m49Uo/qVrpGZml+87BYdUhYskU1Fk/zZin6qet5va
 s9ip8zdM/EBwj3V0p8Y4PWxiYBE8dP+wfoWXUu3oqwu+bWuNuCG+1UC+5BqBkE/yfg2L
 OM3h/1mJfAlbj8FsGeAFzAo3sdF2++JKh5sCHuz2rY7aAE/qeFvAOo0YWA95X8qYeYQz
 oiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/uusR8hX9DRZcwT6IBisqCU2ANhpQTocdOwgJEeveSY=;
 b=Z57I3EcuXF/Fead2jz8o7rDZPDsK38LJkzyFnjT4Pwkha9YWRm/x2yFPZluLSGuw3g
 1TnXoPgz3vh8lN2R1jA37Ku0CI/QImI1ivdfwgcR5MkhTnWkKs9XjDjmeimhotJbSWb7
 62CcXLkM0tDIDZwYaH1ou77xqpKGhCyUHj8XO9YqHjKDO65NhCx+FmTtr+knZw7Sz7nN
 5zYPed2rRgtkzx/OogqqhH55cSC1MmeH4w4oKdK/ZPU9ZDXTDtZZwwvbdC1eyCYKv5mN
 eWvZWiVGI0zhIAo2k+nW14xe11uJ8m3CGNfJYtE4//H8xRzs46Jz2/L6+8o2DUInpaji
 njqg==
X-Gm-Message-State: ANoB5pm6vRrwkQ4tvlkEmJDi+YdqBmR4r9Ves203f0JpBoO3pwuz/tps
 QkAc5FnfEv9XYdqzGJTcaTBh7A==
X-Google-Smtp-Source: AA0mqf42fB0Ttglpz/OKf0BYyVqjzYXLdr+Vc5/DOX9w9t99teu5lpSTDlTx7YOqfJZCDtc/42d3lQ==
X-Received: by 2002:a5d:4538:0:b0:236:5270:8f17 with SMTP id
 j24-20020a5d4538000000b0023652708f17mr3811701wra.358.1668758882272; 
 Fri, 18 Nov 2022 00:08:02 -0800 (PST)
Received: from [192.168.230.175] (34.red-88-29-175.dynamicip.rima-tde.net.
 [88.29.175.34]) by smtp.gmail.com with ESMTPSA id
 fn25-20020a05600c689900b003cf78aafdd7sm3577832wmb.39.2022.11.18.00.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 00:08:01 -0800 (PST)
Message-ID: <ae8d0a01-9a08-3799-a5e8-0acea2dc44ca@linaro.org>
Date: Fri, 18 Nov 2022 09:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 12/13] tests/avocado/boot_linux.py: Bump aarch64 virt
 test timeout to 720s
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
 <20221117172532.538149-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221117172532.538149-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 17/11/22 18:25, Alex Bennée wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> The two tests
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
> tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3
> 
> take quite a long time to run, and the current timeout of 240s
> is not enough for the tests to complete on slow machines:
> we've seen these tests time out in the gitlab CI in the
> 'avocado-system-alpine' CI job, for instance. The timeout

The previous patches removed these jobs from GitLab CI, so
this shouldn't be a problem there anymore, but the next part
is still relevant:

> is also insufficient for running the test with a debug build
> of QEMU: on my machine the tests take over 10 minutes to run
> in that config.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Push the timeout up to 720s so that the test definitely has
> enough time to complete.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20221117111628.911686-1-peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

