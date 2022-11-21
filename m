Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8429D6328F7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 17:06:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox9Ik-0006am-UV; Mon, 21 Nov 2022 11:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9HJ-0006MM-Gt
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:04:18 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox9H2-00052r-Hr
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 11:03:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so13125329wmb.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 08:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KSUeMmCg94RK7l3nVd8QwBc1ocqYyvzzlsrJFKkg9ss=;
 b=rwrJBIMg7+ggaBprHg6ahbtvFFuQVBk4ztyzTnkjF04XI1yOeQ/0a7pcxBGAPa6ION
 FgrU2He2IOgtDvSo7EjJB5AuvAwmkoupiKv5HPEUTzJiponMdjBxEFVa+pcLavdGGnYP
 s1x3eqSqMlIL+DbnoeFWsE3KpzoExPSBwWqYYaagNsQMVBFbsZJMA08bzSzZAUylMUAC
 6LYVoMsNziTzhukEv5IRhPJ9L435hneL9C9bwfv5GdoTkDrgLMToYYa49gVAwn4Fh9Bk
 cog1Rva9mckLEc14xFjs/Eue29nrO3/P15u1BQDnjpuZlgXWerKVBtHCj+Jky2aCr4ec
 eKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSUeMmCg94RK7l3nVd8QwBc1ocqYyvzzlsrJFKkg9ss=;
 b=tauT21vMy7x+RkRkxzEb4NQc9ujZzXHIxh8tt90HswyJOx8KFnPdbF3x7UwZb4H1Za
 OQbzb+udcmp54zePorXb47W5+0+Hd8fa66rFzCOa50kJ4xwaf1ZuhORK1Kz46APH7hQS
 h8l9zf7jjUYiEWK9Qaw5/weRNsRpgZVtzKW8DIEAYfXQvHHqseIzHOHspg+WMfzyVAq5
 Zhqa8LYGsePMZcz7oDjYyt8agEBYMd1BS4sEdCOySHFh9Ka7pXjCBXUVyUf6vGF5lWkr
 aPuqX1shQW3BtTFsH9vnVzevLsbwKsk/21TgKDhtlmS9ntu/oXpO9/4QL6i9fjGiqdXe
 wjIQ==
X-Gm-Message-State: ANoB5pmkI1eil0iLFYRNURXudBzH1pc7leJtlNN1xblsD99/Qsp3dg47
 +d7jlFflaZ5+iEr94k+zT2s3mQ==
X-Google-Smtp-Source: AA0mqf7kHkMMIoBjBnktKF+uES/hfX3Nq7uTEGOptK0+fFnMaYo0+7FDsuOpeIdciEEaOIgON44cNw==
X-Received: by 2002:a1c:6a01:0:b0:3cf:a895:a9cb with SMTP id
 f1-20020a1c6a01000000b003cfa895a9cbmr16672488wmc.96.1669046634874; 
 Mon, 21 Nov 2022 08:03:54 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q125-20020a1c4383000000b003c6cd82596esm18691105wma.43.2022.11.21.08.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 08:03:53 -0800 (PST)
Message-ID: <7875a42b-2776-9d36-5373-78ac75cff89d@linaro.org>
Date: Mon, 21 Nov 2022 17:03:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] cleanup: Tweak and re-run return_directly.cocci
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, fam@euphon.net, kwolf@redhat.com,
 hreitz@redhat.com, groug@kaod.org, qemu_oss@crudebyte.com,
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, yuval.shaia.ml@gmail.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, pavel.dovgaluk@ispras.ru, alex.bennee@linaro.org,
 peterx@redhat.com, david@redhat.com, mrolnik@gmail.com, gaosong@loongson.cn,
 yangxiaojuan@loongson.cn, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, berrange@redhat.com,
 thuth@redhat.com, lvivier@redhat.com, suhang16@mails.ucas.ac.cn,
 chen.zhang@intel.com, lizhijian@fujitsu.com, stefanha@redhat.com,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 virtio-fs@redhat.com
References: <20221121140121.1079100-1-armbru@redhat.com>
 <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_jnbp36Trjd3qJYzbf5-6SNNrirG7q2_-wKXkcX49ptg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 21/11/22 15:36, Peter Maydell wrote:
> On Mon, 21 Nov 2022 at 14:03, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Tweak the semantic patch to drop redundant parenthesis around the
>> return expression.
>>
>> Coccinelle drops comments in hw/rdma/vmw/pvrdma_cmd.c; restored
>> manually.
>>
>> Coccinelle messes up vmdk_co_create(), not sure why.  Transformed
>> manually.
>>
>> Line breaks in target/avr/cpu.h and hw/rdma/vmw/pvrdma_cmd.c tidied up
>> manually.
>>
>> Whitespace in fuse_reply_iov() tidied up manually.
>>
>> checkpatch.pl complains "return of an errno should typically be -ve"
>> two times for hw/9pfs/9p-synth.c.  Preexisting, the patch merely makes
>> it visible to checkpatch.pl.
>>
>> checkpatch.pl complains "return is not a function, parentheses are not
>> required" three times for target/mips/tcg/dsp_helper.c.  False
>> positives.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> 
>>   .../user/ase/msa/bit-count/test_msa_nloc_b.c  |   9 +-
>>   .../user/ase/msa/bit-count/test_msa_nloc_d.c  |   9 +-
> [snip long list of other mips test files]
> 
>>   328 files changed, 989 insertions(+), 2099 deletions(-)
> 
> This patch seems to almost entirely be huge because of these
> mips test case files. Are they specific to QEMU or are they
> effectively a 3rd-party import that it doesn't make sense
> to make local changes to?

They are imported and will unlikely be modified.

