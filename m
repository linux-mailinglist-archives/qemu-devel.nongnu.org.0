Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D926849684E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 00:52:20 +0100 (CET)
Received: from localhost ([::1]:51134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB3hb-0005Nj-Vq
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 18:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3gT-0004F4-H0
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 18:51:09 -0500
Received: from [2607:f8b0:4864:20::1029] (port=41972
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nB3gR-0007x6-Si
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 18:51:09 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 b1-20020a17090a990100b001b14bd47532so10402328pjp.0
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 15:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RKu7mgAW4KQ9FbNFRgIekdtPBSM/dJO/MFgIKDRthig=;
 b=WZPliLl8Hu9/WkNjMgKpC70ZBmRx22acP+QfW6lC/yOz6TpNKn2XohpB2GCsNngLFz
 zf+wnTQQPbS3a1cELWjYJOPXOZNNqqmTV5NFqvNRyXiL4JMRws6q2tqPLM7Sz+I39m9U
 YfVvxsXRKrZjuBn0DeAZ7ubocaEJ/M0jTltg6sSr8wGImfEFxpM+oTmqUV3/usrqZAwj
 JDpQNbIUZyAMItW8qJ0jKnuSEIsgKHkP+UFjGpO+Tgx0tQsJhFoEPgjTbCOQALxZAqSJ
 hs55bTfWCgJEXJvtVva2ckznylWSDLJ8KRtUQ7oNVFIpG1+81ChEl1uhEF3stU4B1K8k
 khLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RKu7mgAW4KQ9FbNFRgIekdtPBSM/dJO/MFgIKDRthig=;
 b=dl9AhysJetoy7qhDQgRa+w9JIfpBN1OWYAL9zsDh9omTqKG0miUCGqiD50Fmq4dwW0
 YwSLTV4EBd8juhrZSEo3DJOpcdmzvFY+d76a9g3cD0IVoVP4ieUySFqLknFxnNkX+4W0
 nWhnuhd0CyJi1od5bcY4L0YtdQ91SqMhY/N37S5KlrqiosqrkRZfMslr/OXBKGSRb8mO
 /vxz81N9XXexYD/uLUGDsEnpee1mhwUpD/nN37uGMjxEB/sKcDg1BTZ8m1Fsed3zG7Y1
 KZeFxExA07v6MzOYygfxTA5hsTI9ot9N5n3EWUYX3Pkg8otJjb8DlHj1gNU2UaoJPxFq
 pI4w==
X-Gm-Message-State: AOAM533UdTipERYQP+bM2rdCcoYaD6IXAsjqXx/uTklrfXHrevxUvB2H
 vjPZwoT0aRFd9+uKvfrjKz4DmQL0cZk=
X-Google-Smtp-Source: ABdhPJyVJRnY/Tm45JVpsj8bxZuCkyjAZD0/4fILFPKbDXO48Ot1e9GLq/WVNCCEiLdxcyHX4WBeBw==
X-Received: by 2002:a17:90a:e454:: with SMTP id
 jp20mr2986426pjb.53.1642809066500; 
 Fri, 21 Jan 2022 15:51:06 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t2sm8414094pfj.170.2022.01.21.15.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 15:51:05 -0800 (PST)
Message-ID: <58ba4eae-1785-a656-e4c2-f73b1a2f7a0b@amsat.org>
Date: Sat, 22 Jan 2022 00:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: tests/tcg/multiarch/threadcount failing on GitLab
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <CAFn=p-boicm8NU6-jimC8qyJVfA3BymcK8687ddBWoQ5LFu6HQ@mail.gmail.com>
 <CAFn=p-a1p3zF=HgREUhhREn1H0LVcKXJCUFV1CNsKXXfGWqZtw@mail.gmail.com>
In-Reply-To: <CAFn=p-a1p3zF=HgREUhhREn1H0LVcKXJCUFV1CNsKXXfGWqZtw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 21/1/22 21:54, John Snow wrote:
> On Fri, Jan 21, 2022 at 3:53 PM John Snow <jsnow@redhat.com> wrote:
>>
>> lately, I've been seeing this test fail under the clang-user job; see
>> https://gitlab.com/jsnow/qemu/-/jobs/2002782042
>>
>> make[2]: *** [../Makefile.target:156: run-threadcount] Error 124
>> make[1]: *** [/builds/jsnow/qemu/tests/tcg/Makefile.qemu:102:
>> run-guest-tests] Error 2
>> make: *** [/builds/jsnow/qemu/tests/Makefile.include:63:
>> run-tcg-tests-sh4-linux-user] Error 2
>>
>> (In this branch I've staged some Python code changes, but I would hope
>> that's not related to this.)
>>
> 
> Oh, and this one:
> 
> make[2]: *** [../Makefile.target:159:
> run-plugin-threadcount-with-libbb.so] Error 124
> make[1]: *** [/builds/jsnow/qemu/tests/tcg/Makefile.qemu:102:
> run-guest-tests] Error 2
> make: *** [/builds/jsnow/qemu/tests/Makefile.include:63:
> run-tcg-tests-sh4-linux-user] Error 2
> make: *** Waiting for unfinished jobs....
> 
> from https://gitlab.com/jsnow/qemu/-/jobs/2002782036 under the
> 'build-user' tests.
> 
> Something you already know about?

Maybe similar to this one?
https://lore.kernel.org/qemu-devel/e27941cc-2622-cb01-4c93-b9ff344bdddb@amsat.org/

