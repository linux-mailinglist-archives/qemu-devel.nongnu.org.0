Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2854AA8F5
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 14:03:34 +0100 (CET)
Received: from localhost ([::1]:60526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGKiz-0003TC-Cg
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 08:03:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKUg-0001Pr-VD
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:48:47 -0500
Received: from [2607:f8b0:4864:20::102e] (port=43695
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGKUf-0006ZB-2r
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 07:48:46 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 v15-20020a17090a4ecf00b001b82db48754so8749674pjl.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 04:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6o7/qqEUOf546bV9nkH93P0btyQKzhbTjIAEQ0OFwPE=;
 b=LD/EznZRk892aQEB/FPneyHDg8MtgGFky19meV3Hx9fwoEzxOf6cClpPqEwx9rW6ew
 nrPllfuCjiy+0r12XMuvq5RZFq39Eu+eAT0x7+lvjhM1RjmYlifcqbLu3/N+5kzQOEVe
 QZ/Cl0QfHX0iDiokUNc3MVE98A+HU3dRbIvtoVC9rtZUtcv9x9Rb9ZUiJhgdNOaSbs44
 5U0IXmz+uZHS8YQ1zlHtT9JqghoAZGAMOFiAGsB30CL2mG9x3/JInzTfWQW+KFf2E2iR
 qlDuPzl3TgqTlvhKLK4tEh60xaR9trMIMs8BKu0Dx5BX9kphANgU6uRP77Ll+fMRFayA
 FhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=6o7/qqEUOf546bV9nkH93P0btyQKzhbTjIAEQ0OFwPE=;
 b=Dl7ksnxxsBgVtXxqvl8rk9u3ekYa6nZsc00QwhsssmYN3fhic0jtKDns6IKpUbpM/k
 aT7E4qmfT5VBrbHgyF3Yg/BCN+WBpvWmlnJWmZ184+6RJqQBm9LjiSYhCmBecXktY3YX
 hMgsqJLJ7GcZEpjFJgpXUMvVv6KLpoXESPMjzhNqt0fam2Aj6CFGJsfIB81QYaYz8IPr
 WUe/u9K+hlqUEPDe+TrEc6BZSazEnNch2OhTSFTuAz1wKdPI7vudRHJubQGVQs/Ee/J5
 ktEGYPoa5mv93zsWvexzYyo44MyWQWHI2iUISFhUflyF/7GtfURp08t1ev0QWnnLujAj
 bfYA==
X-Gm-Message-State: AOAM533R2QPRiYPOR0tsRqWs7GJrNcrR0kaYxC3CdSsMLUnKQ4pXgMr6
 Dmw/J5G8fGNA0deUIvKhQps=
X-Google-Smtp-Source: ABdhPJw4bZQi5n8IssFe+reZKD5ciemqlb8aw3aOQdaTKpuJA2R3/xHV6bksErgoTpLIvJwLiBzIEQ==
X-Received: by 2002:a17:90b:19d5:: with SMTP id
 nm21mr5673022pjb.56.1644065323512; 
 Sat, 05 Feb 2022 04:48:43 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id ob7sm3260553pjb.15.2022.02.05.04.48.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 04:48:43 -0800 (PST)
Message-ID: <8336d365-36b3-06c8-a582-959559019453@amsat.org>
Date: Sat, 5 Feb 2022 13:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/2] hw/i386: Attach CPUs to machine
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Yang Zhong <yang.zhong@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220131233507.334174-1-f4bug@amsat.org>
 <20220131233507.334174-2-f4bug@amsat.org>
 <CABgObfY6+-GjEi9hfFs2x6CRctPHFBt3hxwRK_73tL8Hm4on5A@mail.gmail.com>
 <7cd97d2e-30a6-3857-464e-f39ddd98a407@amsat.org>
 <CABgObfb8EQxObAnBJKSq=OMCFhkL7FzNFCn1H=HoCyxz03R2Fw@mail.gmail.com>
 <f4544f90-4fb4-dfad-48ef-8631cf3c7666@amsat.org>
In-Reply-To: <f4544f90-4fb4-dfad-48ef-8631cf3c7666@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/2/22 11:32, Philippe Mathieu-Daudé wrote:
> +Igor
> 
> On 5/2/22 10:21, Paolo Bonzini wrote:
>> It broke check-system-debian in CI.
> 
> OK. This is odd because I am using Ubuntu 20.04 x86_64 host and
> can not reproduce. I'll investigate.

OK I could reproduce using the Docker image pulled from
registry.gitlab.com/qemu-project/qemu/qemu/debian-amd64:

acpi-test: Warning! VIOT binary file mismatch. Actual 
[aml:/tmp/aml-INVNG1], Expected [aml:tests/data/acpi/q35/VIOT.viot].
See source file tests/qtest/bios-tables-test.c for instructions on how 
to update expected files.
to see ASL diff between mismatched files install IASL, rebuild QEMU from 
scratch and re-run tests with V=1 environment variable set**
ERROR:../tests/qtest/bios-tables-test.c:531:test_acpi_asl: assertion 
failed: (all_tables_match)
Bail out! ERROR:../tests/qtest/bios-tables-test.c:531:test_acpi_asl: 
assertion failed: (all_tables_match)
Aborted (core dumped)

I'll post a v4 silencing this warning, but I have no much clue about
this.

Phil.

