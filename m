Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EA55EC73B
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:08:52 +0200 (CEST)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCCZ-0005Er-EA
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odAlk-0000JH-4C
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odAli-000818-0W
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:37:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664285821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lMPIj6xOw18Qe78N7dKWUrynAVW2O6mbMgniDHDPuY=;
 b=GOn9ysTX4gwLNIfzWrxNhOzZ8JSS5hA6J+kBCD47RdzsaSd0poRzKzwvykItDkOB8ZxFrP
 xJ9sD9JMOITGePM+JzaygZQG5FrjEOM9MZvd77aBBGqGBrKcEYKW8YJJR23+gfpxFMjQUi
 KzLeoocA01NKTUuj6vD3wKtfKdADUKg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-549-x2ebwsNjPwqfXZqtkP8kQw-1; Tue, 27 Sep 2022 09:36:59 -0400
X-MC-Unique: x2ebwsNjPwqfXZqtkP8kQw-1
Received: by mail-wm1-f70.google.com with SMTP id
 f25-20020a7bc8d9000000b003b4768dcd9cso2756589wml.9
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9lMPIj6xOw18Qe78N7dKWUrynAVW2O6mbMgniDHDPuY=;
 b=6mHN9TzgGyu/SJ0EcJ+fqzHaEGMkWKgTehXXGUuSLMAWz7NiNsVZHjyTxrw1Zv+S35
 9gsX0zJkK1fx1wbU2p1xc9OjQ+Kn0W6GFXBfAiFcJ9msBW1Orj+bI5t7B1kY3Pfxlldu
 P9bUOG0/NRXGI4e3hHHU32KO5yvUGMVGxBWcYEbP/g/NyxGZibR8ZXgHOi96vO6JJ4kN
 anZo5aghcQdUQT1hTOcOmg4o2yfeeNTgDP32zhHK91obRrIXqdEDEfCa6g+99xwlqkzo
 hA2GLgGLCiETjO80hy7DPaOMLDKuAniLAEuw1M0Tik/7Z0X59iiDSplS8bYsfbT+C4ea
 z/yw==
X-Gm-Message-State: ACrzQf3xCGq7eziwVaZkwHEqdrC/LmywP9ygJuCANPajMm/J8CTDMvsO
 25sStZIF8B8ROyWMvTFYH99zeMJCaaCtpWWC/Jff46NfDbVu87zr7tyCgyiGtSlf7FK8mJeswJX
 xTq2rrl8Bf8/OeAc=
X-Received: by 2002:adf:fd0a:0:b0:22c:bdb2:e484 with SMTP id
 e10-20020adffd0a000000b0022cbdb2e484mr2207415wrr.350.1664285818694; 
 Tue, 27 Sep 2022 06:36:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Z+u+mMo5RBPe1vOZfAniPFw7rk3PEAY2q/qj2ufWC4UsLBG940XFBr9kAEJqnnz5N0OnUQQ==
X-Received: by 2002:adf:fd0a:0:b0:22c:bdb2:e484 with SMTP id
 e10-20020adffd0a000000b0022cbdb2e484mr2207399wrr.350.1664285818494; 
 Tue, 27 Sep 2022 06:36:58 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-30.web.vodafone.de.
 [109.43.179.30]) by smtp.gmail.com with ESMTPSA id
 bh24-20020a05600c3d1800b003a531c7aa66sm2007706wmb.1.2022.09.27.06.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 06:36:57 -0700 (PDT)
Message-ID: <fe94da78-bfa1-da72-dd15-5eb1bea20204@redhat.com>
Date: Tue, 27 Sep 2022 15:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 54/54] docs/devel: testing: Document writing portable
 test cases
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-55-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220927110632.1973965-55-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/09/2022 13.06, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Update the best practices of how to write portable test cases that
> can be built and run successfully on both Linux and Windows hosts.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> 
> Changes in v4:
> - Move the new text section after the "QTest" section instead
> - Use plural in both cases: "on POSIX hosts as well as Windows hosts"
> - Use "The following list shows some best practices"
> - Fix typo of delimiter
> 
> (no changes since v3)
> 
> Changes in v2:
> - Minor wording changes
> - Drop patches that were already applied in the mainline
> - Drop patch: "qga/commands-posix-ssh: Use g_mkdir_with_parents()"
> - Drop patch: "tests: Skip iotests and qtest when '--without-default-devices'"
> - Drop patch: "tests/qtest: Fix ERROR_SHARING_VIOLATION for win32"
> 
>   docs/devel/testing.rst | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index aea5b42356..fbb98faabe 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -81,6 +81,36 @@ QTest cases can be executed with
>   
>      make check-qtest
>   
> +Writing portable test cases
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Both unit tests and qtests can run on POSIX hosts as well as Windows hosts.
> +Care must be taken when writing portable test cases that can be built and run
> +successfully on various hosts. The following list shows some best practices:
> +
> +* Use portable APIs from glib whenever necessary, e.g.: g_setenv(),
> +  g_mkdtemp(), g_mkdir().
> +* Avoid using hardcoded /tmp for temporary file directory.
> +  Use g_get_tmp_dir() instead.
> +* Bear in mind that Windows has different special string representation for
> +  stdin/stdout/stderr and null devices. For example if your test case uses
> +  "/dev/fd/2" and "/dev/null" on Linux, remember to use "2" and "nul" on
> +  Windows instead. Also IO redirection does not work on Windows, so avoid
> +  using "2>nul" whenever necessary.
> +* If your test cases uses the blkdebug feature, use relative path to pass
> +  the config and image file paths in the command line as Windows absolute
> +  path contains the delimiter ":" which will confuse the blkdebug parser.
> +* Use double quotes in your extra QEMU commmand line in your test cases
> +  instead of single quotes, as Windows does not drop single quotes when
> +  passing the command line to QEMU.
> +* Windows opens a file in text mode by default, while a POSIX compliant
> +  implementation treats text files and binary files the same. So if your
> +  test cases opens a file to write some data and later wants to compare the
> +  written data with the original one, be sure to pass the letter 'b' as
> +  part of the mode string to fopen(), or O_BINARY flag for the open() call.
> +* If a certain test case can only run on POSIX or Linux hosts, use a proper
> +  #ifdef in the codes. If the whole test suite cannot run on Windows, disable
> +  the build in the meson.build file.

Reviewed-by: Thomas Huth <thuth@redhat.com>



