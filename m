Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392C68C090
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:55:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2t2-0004mW-5a; Mon, 06 Feb 2023 09:54:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2sy-0004kA-NM
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:54:25 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pP2sv-00059K-AU
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:54:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id y1so10635808wru.2
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VZ1hK7zbrCJL049ViTy/OHCLm8+k6a2bvfwqgDBGVSo=;
 b=OOr+jwgredJeNYeeKf2uuajLD6vOm7o0FMhu/AZ95To0y6/J2WRw8nuhGEtngppXIN
 9k2rh1r8AhA0vyqX+14rI41gRC6O9ICACBHtqNO3EWsc0lIcCEFO8j5RWb6YIHsDq6fL
 LNzGXb3DRwdZZ/HdPxJx4IyBoopVDs2FZDNynHnITKfFrzrWgWyeJ4e/A24it6g55CJe
 LUHSe1vkW9CpeZNVrs2369b4uBUUBaNyp+/5v88A4TwTv7DmeyNeTY8sm9ZxBepyHTqZ
 PcMYnDxWgg6ZK+1s5OggRbIcP06rNpPx+7QyidliIYm1HMtCdNy/FyJ5RQ4keOjDxKLU
 O2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VZ1hK7zbrCJL049ViTy/OHCLm8+k6a2bvfwqgDBGVSo=;
 b=8KKDYT/KWLMtLDMkoADAR2mdCDpeoBf20+P/bRClAvL0sGGNQkB5RTITpJmA8vwd2V
 vTWP77LUqI+vN+a2roUlY5GCZx85ZGl3wfCMXM48YZVi1bswPh8gdmXRUww+04V88red
 LUG4Y92vTJZhehassZ7zejJ0B1OV7thXR/wB0FdxPhWAK5bX8445Lx0p3PKxHdXbVERG
 SAcW42YzNax6cKoaq4XvqrefJpeVRlghr1DNeBLbA0Xi1yrDrVcm0BdTu2TPVtpvnoYx
 dYvgEaxuY2Huw7xQowpUY74PxqDi1crlaN4tr0dTfnbej+ith/22TZ66bdDx/aOC+gHw
 ZAWA==
X-Gm-Message-State: AO0yUKVtDifINX384JFHusaZsrpSs6d7+NtEUWpK04+CtWAWPXiqBlh5
 UawXQOEfSPMeJkXxjX1t5aqHUg==
X-Google-Smtp-Source: AK7set843My4J78Sh4yaGF7bsM0rID7zFwMl37rxNKb0QH6vLWiVuMq33vbxEb477yKy7gLkEHhRkg==
X-Received: by 2002:adf:eac5:0:b0:2c3:dc42:524e with SMTP id
 o5-20020adfeac5000000b002c3dc42524emr7453058wrn.10.1675695259556; 
 Mon, 06 Feb 2023 06:54:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w5-20020a5d6085000000b0029100e8dedasm8947049wrt.28.2023.02.06.06.54.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 06:54:19 -0800 (PST)
Message-ID: <3d76dc8b-0328-3159-3f52-ca8c86d14f7f@linaro.org>
Date: Mon, 6 Feb 2023 15:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH] tests: be a bit more strict cleaning up fifos
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230206141051.4088777-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230206141051.4088777-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 6/2/23 15:10, Alex Bennée wrote:
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
> 
> diff --git a/tests/unit/test-io-channel-command.c b/tests/unit/test-io-channel-command.c
> index 425e2f5594..c2179a6462 100644
> --- a/tests/unit/test-io-channel-command.c
> +++ b/tests/unit/test-io-channel-command.c
> @@ -42,6 +42,7 @@ static void test_io_channel_command_fifo(bool async)
>       g_auto(GStrv) dstargv = g_strsplit(dstargs, " ", -1);
>       QIOChannel *src, *dst;
>       QIOChannelTest *test;
> +    int err;
>   
>       if (mkfifo(fifo, 0600)) {
>           g_error("mkfifo: %s", strerror(errno));
> @@ -61,7 +62,10 @@ static void test_io_channel_command_fifo(bool async)
>       object_unref(OBJECT(src));
>       object_unref(OBJECT(dst));
>   
> -    g_rmdir(tmpdir);
> +    err = g_unlink(fifo);
> +    g_assert(err == 0);
> +    err = g_rmdir(tmpdir);
> +    g_assert(err == 0);
>   }

Thanks for the patch, but unfortunately this doesn't help:

Unknown TAP version. The first line MUST be `TAP version <int>`. 
Assuming version 12.

71/93 qemu:unit / test-io-channel-command             ERROR 
1.06s   killed by signal 13 SIGPIPE
 >>> G_TEST_BUILDDIR=/Users/philmd/source/qemu/build/tests/unit 
G_TEST_SRCDIR=/Users/philmd/source/qemu/tests/unit MALLOC_PERTURB_=27 
/Users/philmd/source/qemu/build/tests/unit/test-io-channel-command --tap -k
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― 
✀ 
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
2023/02/06 15:46:03 socat[88615] E read(5, 0x13480c000, 8192): Bad file 
descriptor

(test program exited with status code -13)

TAP parsing error: Too few tests run (expected 4, got 0)

$ tests/unit/test-io-channel-command
# random seed: R02Se92d5500c30bbf1797b1047cd480607c
1..4
# Start of io tests
# Start of channel tests
# Start of command tests
# Start of fifo tests
2023/02/06 15:47:31 socat[88651] E read(5, 0x12000c000, 8192): Bad file 
descriptor
$ echo $?
141

Should we add 'socat' as testing dependency in lci-tool?

