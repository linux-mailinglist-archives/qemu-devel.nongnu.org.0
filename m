Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3C6F5A20
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:33:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDWD-0006Jm-5Q; Wed, 03 May 2023 10:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puDW8-0006JH-QU; Wed, 03 May 2023 10:31:42 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1puDW6-0003RF-Uv; Wed, 03 May 2023 10:31:40 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-187c78c6657so3610620fac.2; 
 Wed, 03 May 2023 07:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683124296; x=1685716296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zYdfS+DttZJ+HvBAGQ8Rcokmnq3yxtbqCsF9dwyusDg=;
 b=cPu2A5xN+DWP3tXRUhonMeOLJy/6/gJt48TT3TRtAo1+htTyrpmndDgOd+NbObTjk9
 yl90Wzrkr62Wi6zchoipn5BgSWHmgmEwoHZ9cA2rJ5IjNrOPt7lLIZuTtvJ2XT3ZBNQb
 2Rlf4z1TEtWy64Wix2kdEHZXAMDMHEPFVrXeLh+Wedc/9kMFgiGrBKVba7BXre/sc8ap
 LvNFZnxxn6+8x14mWVL5RHPQkU64f4XUT/+ezFVtES5psjXSy9TiVWupJmWlx+qzifOg
 Y9UWT1TkOwnK5u1etrI2pI2JmC1d/a2oQ6bItswsdNudnXSTjzJaBxrHlYXheyKtRTPf
 3aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683124296; x=1685716296;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zYdfS+DttZJ+HvBAGQ8Rcokmnq3yxtbqCsF9dwyusDg=;
 b=EEI8quiERCqflL2jc21FymovSVH5C312zWL3lB2gjcxI4D29aMab3mMS3DR0f5BFyM
 9aV8sN5Dw6TI2yySchwbT8637mxCeE2sK3MUs6tYLjvc0AYIt8YB+AFWNsRHQZNFbGvh
 vs4u56+SINWQ2pBIJYFX0hMHx+HoudOKFdaXm+tQUulh43pDAec37Ddq5eNHDU+EMjH/
 +YXI2jj+cPH8KJ4BwntCqb9h0auH2USfoUlaVCVCGf9qi8YoM36IqTFw59TGYJFbMAH/
 7TvyyZA03cpCs50L5st3D4WkmCJjPmr9IOSC2IUQro++E7zHEYRII0rQh4qZq+3D/COV
 K7oQ==
X-Gm-Message-State: AC+VfDyXB04+cqTzA3TdVSZjaSpVxLwHxfUKlrwdJ6oQ/iEG0HtUokP3
 3gJoMcfKF5OLYrqp31vs9is=
X-Google-Smtp-Source: ACHHUZ6hPBJTYNy2XqMIS4wNoO3b7YvxY1OIL5JiLMEflcp+ZFqsNIDn5gG0IjTWYENV9nD40afzxA==
X-Received: by 2002:a05:6808:1d8:b0:387:2075:59c with SMTP id
 x24-20020a05680801d800b003872075059cmr106375oic.37.1683124295733; 
 Wed, 03 May 2023 07:31:35 -0700 (PDT)
Received: from [192.168.68.107] ([179.111.98.125])
 by smtp.gmail.com with ESMTPSA id
 r2-20020acaf302000000b0038e086c764dsm637557oih.43.2023.05.03.07.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 07:31:35 -0700 (PDT)
Message-ID: <f45b4655-394b-8843-e735-288f513ad023@gmail.com>
Date: Wed, 3 May 2023 11:31:30 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/2] tcg: ppc64: Fix mask generation for vextractdm
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, philmd@linaro.org,
 richard.henderson@linaro.org, lucas.araujo@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org
Cc: john_platts@hotmail.com, qemu-devel@nongnu.org
References: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <168141244011.3026479.13697197743885252330.stgit@ltc-boston1.aus.stglabs.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.28,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Shiva,

I just queued patch 1 adding this line in the commit msg:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1536

This was mentioned by Cedric in patch 2. Also, speaking of patch 2, take a look
on Cedric's review and see if it's applicable or not.

I plan to send a ppc pull request at the end of the week.


Thanks,


Daniel


On 4/13/23 16:00, Shivaprasad G Bhat wrote:
> While debugging gitlab issue[1] 1536, I happen to try the
> vextract[X]m instructions on the real hardware. The test
> used in [1] is failing for vextractdm.
> 
> On debugging it is seen, in function do_extractm() the
> mask is calculated as dup_const(1 << (element_width - 1)).
> '1' being signed int works fine for MO_8,16,32. For MO_64,
> on PPC64 host this ends up becoming 0 on compilation. The
> vextractdm uses MO_64, and it ends up having mask as 0.
> 
> The first patch here fixes that by explicitly using
> 1ULL instead of signed int 1 like its used everywhere else.
> Second patch introduces the test case from [1] into qemu
> tcg/ppc64 along with fixes/tweaks to make it work for both
> big and little-endian targets.
> 
> Let me know if both patches should be squashed into single
> patch. Checkpatch flagged me to avoid use of __BYTE_ORDER__
> in the test file(second patch), however I see it being
> used in multiarch/sha1.c also this being arch specific
> test, I think it is appropriate to use it here. Let me
> know if otherwise.
> 
> References:
> [1] : https://gitlab.com/qemu-project/qemu/-/issues/1536
> 
> ---
> 
> Shivaprasad G Bhat (2):
>        tcg: ppc64: Fix mask generation for vextractdm
>        tests: tcg: ppc64: Add tests for Vector Extract Mask Instructions
> 
> 
>   target/ppc/translate/vmx-impl.c.inc |  2 +-
>   tests/tcg/ppc64/Makefile.target     |  6 +++-
>   tests/tcg/ppc64/vector.c            | 50 +++++++++++++++++++++++++++++
>   3 files changed, 56 insertions(+), 2 deletions(-)
>   create mode 100644 tests/tcg/ppc64/vector.c
> 
> --
> Signature
> 

