Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05517618BC3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 23:46:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqixr-0008LR-9Y; Thu, 03 Nov 2022 18:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqixk-0008Kd-Tp
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 18:45:29 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqixh-0000mL-0E
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 18:45:27 -0400
Received: by mail-pf1-x42f.google.com with SMTP id z26so2980779pff.1
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 15:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9tXecOxnZSBCU09GuG3ealQ3HvnH7ZACKp9zv6w8O3s=;
 b=ZKg37rNnf6v3HRJbY+MWyZFG2aOHsESybhGXtyQEtl2HuhJK06AlyCw/TMO8ksajrK
 NgGUZr15zP4HjPZD814JD/yqzomasHloWsXyvffdxYUqwhQBhCVFS/btJl7Tvgnnn+f+
 Xk7J8WNWGwgfiWBvgc6HSGPjwD2rMp9y0VonX8hz/fNk5jQB3WpKpQVjFJzDl+OdWjJv
 dJ+tmNYu9L7Ktr64HSQgPFkE4doZl62cJ0gOnRWmoWpdQ0UfVO/U8ogHgEmD4MXdYTwu
 4dnnMRY6qrJzk+TndqlE/sVGZHMi3zGFn4VzlRHVcRk9I7Ny22iCfaecgjQK1f/0clFx
 AKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9tXecOxnZSBCU09GuG3ealQ3HvnH7ZACKp9zv6w8O3s=;
 b=CHrZyO/06ZkiqL5D4gobtRH1yvhMDspL/CQ5YkvDkEHfUnDqNuVzysf+8Ki75U6Jqa
 DaPymwB/7xfAmcE+Oc/oPz3z+g9wAlEf+Rvy11GBh0t8rfHgWhPcMGTLNeFL+wYafW5j
 xfsvj2sLyS77qXlLMXHXQa0vuaHAxuw0J9iY0pgmMuv8cVeGSDnubJGj1xECeHg/DPMx
 /9OKdBpFBKQBEVj3Fvm9RbetbiS+A5jJkp+NksSE5Lli4jqlHjAjE2wMaLoBVPrSCq4F
 ovDPdPsKYe9vBTYyfHM51N/2bQlyMAQh4WehvUJIXqwHyZ818rS0salCCeMqmxkSXekQ
 wknQ==
X-Gm-Message-State: ACrzQf35WMd+UCDvyiJ4h3G4n4U4HOa2693D+CnoR56lFt75eHBpcuE9
 M1G9ZNjADppFZoTeDlFX0r1+Rg==
X-Google-Smtp-Source: AMsMyM6oir80VUfPNO3BJ6MJMvZunu4n0XgH/OxWI6nsO4NLcizvey8NGjxYmZkScTME2hkWu06x+g==
X-Received: by 2002:a63:464d:0:b0:441:5968:cd0e with SMTP id
 v13-20020a63464d000000b004415968cd0emr28989676pgk.595.1667515523287; 
 Thu, 03 Nov 2022 15:45:23 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 123-20020a621781000000b00562784609fbsm1216809pfx.209.2022.11.03.15.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 15:45:21 -0700 (PDT)
Message-ID: <0d6bed9b-9776-8dc3-9e8c-8b64eeda0ee0@linaro.org>
Date: Fri, 4 Nov 2022 09:45:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] gitlab-ci: split clang-user to avoid timeout
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20221103212321.387738-1-stefanha@redhat.com>
 <e188327c-9afc-db4b-4a83-e88ac31cd353@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <e188327c-9afc-db4b-4a83-e88ac31cd353@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 09:32, Philippe Mathieu-Daudé wrote:
> +Richard
> 
> On 3/11/22 22:23, Stefan Hajnoczi wrote:
>> GitLab CI times out when the clang-user job takes over 1 hour. Split it
>> into parts that check various architectures.
>>
>> An alternative is to have one job per architecture but that clutters the
>> pipeline view and maybe there is some sharing when multiple targets are
>> built at once.
>>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 11 +++++++++++
>>   .gitlab-ci.d/buildtest.yml          | 18 +++++++++---------
>>   2 files changed, 20 insertions(+), 9 deletions(-)
>>
>> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
>> index 73ecfabb8d..38b055e139 100644
>> --- a/.gitlab-ci.d/buildtest-template.yml
>> +++ b/.gitlab-ci.d/buildtest-template.yml
>> @@ -81,3 +81,14 @@
>>       - du -chs ${CI_PROJECT_DIR}/avocado-cache
>>     variables:
>>       QEMU_JOB_AVOCADO: 1
>> +
>> +.clang-user-template:
>> +  extends: .native_build_job_template
>> +  needs:
>> +    job: amd64-debian-user-cross-container
>> +  variables:
>> +    IMAGE: debian-all-test-cross
>> +    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
>> +      --extra-cflags=-fsanitize=undefined
>> +      --extra-cflags=-fno-sanitize-recover=undefined
>> +    MAKE_CHECK_ARGS: check-unit check-tcg
>> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
>> index 6c05c46397..116fce4e8f 100644
>> --- a/.gitlab-ci.d/buildtest.yml
>> +++ b/.gitlab-ci.d/buildtest.yml
>> @@ -323,16 +323,16 @@ clang-system:
>>         ppc-softmmu s390x-softmmu
>>       MAKE_CHECK_ARGS: check-qtest check-tcg
>> -clang-user:
>> -  extends: .native_build_job_template
>> -  needs:
>> -    job: amd64-debian-user-cross-container
>> +# clang-user takes too long so split it into parts
>> +clang-user-part1:
>> +  extends: .clang-user-template
>>     variables:
>> -    IMAGE: debian-all-test-cross
>> -    CONFIGURE_ARGS: --cc=clang --cxx=clang++ --disable-system
>> -      
>> --target-list-exclude=microblazeel-linux-user,aarch64_be-linux-user,i386-linux-user,m68k-linux-user,mipsn32el-linux-user,xtensaeb-linux-user
> 
> We can exclude these targets which are a bit redundant:
> 
> 
> armeb-linux-user,mips64-linux-user,mipsel-linux-user,mipsn32-linux-user,ppc64-linux-user,sh4-linux-user,sparc-linux-user,riscv32-linux-user
> 
> Alternatively, instead of using the exclude pattern, we can switch to including the 
> targets which do have tcg tests:
> 
> $ ls -1 tests/tcg/
> Makefile.target
> README
> aarch64
> alpha
> arm
> cris
> hexagon
> hppa
> i386
> loongarch64
> m68k
> minilib
> mips
> multiarch
> nios2
> openrisc
> ppc
> ppc64
> ppc64le
> riscv64
> s390x
> sh4
> sparc64
> tricore
> x86_64
> xtensa
> 
> Although we have 'multiarch' :/

If we're talking about tests, this runs on debian-all-test-cross, which has fewer 
cross-compilers than that.

However, the main purpose of clang-user is to make sure that stuff *builds* with clang, as 
opposed to gcc, which is where we've seen most problems in the past.  So we do want as 
much coverage across targets/*/ as possible, even if cross-compilers for tests are not 
available.

I agree that we can drop some redundancy, like aarch64_be, armbe, mips{set}, riscv32, 
which have no remarkable difference in linux-user/.  But be careful of e.g. ppc64 vs 
ppc64le and sparc vs sparc64 which have very different ABIs.

Perhaps an interesting split would be those guests supported by debian-all-test-cross, for 
which we build + test, and the others, for which we build only.


r~

