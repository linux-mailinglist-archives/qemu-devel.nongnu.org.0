Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 910C254B849
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 20:09:32 +0200 (CEST)
Received: from localhost ([::1]:40562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Ayp-00061s-7N
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 14:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1AvJ-0004Lj-Mu
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 14:05:53 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:46872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o1AvH-0005iR-Ru
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 14:05:53 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so9767714pjg.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 11:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4pR9oXXSw3RakAiOi0aqPbmVxCPJ967Anzsrs+8kip4=;
 b=V1BuwkHlnq4qYME9HINCtvXITZ56H9rAhXIioii6TgI5ICxBrUdORycAi4wrk2GD2O
 SyhW/qfmt4Px9gTvsKXtj9UejMlt96joWrxzJGqb0kdbCLHDPPITbEzVQas5l2jbg3h8
 O/+DkXAkcQQUZH2c5ptr0zhPafDXCKORSBM/dx8veGEPlQOpjACN5wCyylqG3U9vCoQm
 xWL/YKxNF16IUlwdDKU4OpBB47bBAloau30TFeO1ryL3xwGSULxGNZti9k59co4acL9p
 2OGJstxzEiK+xJnwm6sqToovRi0TIdULDbo6MnJXw05T1hgAZCdfPcr4suVX2kfb4ywE
 AQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4pR9oXXSw3RakAiOi0aqPbmVxCPJ967Anzsrs+8kip4=;
 b=0l5iCu2TUjNLKaUFktl+XR3Yy6X0qAUFsg3ApxBbxjiDFrNu6ri7D56oPuGxgUsdKN
 uscm+Q5qFAC4+h+SxLpVSPd/oiecHtY7m5Yjd8sshot3LlsO1eVl6Sv+/gNo5gp3hzhy
 GS32wBsKrSawur1iFPGgN7FQfuj9KQaC9b70CKVGE/Yocw1GrUCROuynXfqYZ30JIRLI
 j3uk3p5ZTGVliLtMAmWH09l6976i0qurAuj/OwqvLrA4KMcOlKOxry+cSib/Vfe1O+CT
 qZyuTXTq2esfwgsYy+UD852GDNlQSC/12TDbUCemCBCrOlisIRtZF2sw2PwhNFqlUmpQ
 6qDw==
X-Gm-Message-State: AOAM533hhmeLR4wutAVJTwIef7t7QRevHNngLxipUscIlp3SUjXj7K8U
 uOu7Mw82HuuVd6M7cOVzWiWEbA==
X-Google-Smtp-Source: ABdhPJx+ykDWSvkgWKlUAWSlZMQx4f6zzneUM/KbGmCz77PzNMMEKKckCbvtwjFiwCGqmP6ubA1NFQ==
X-Received: by 2002:a17:902:e5ca:b0:164:1958:c84a with SMTP id
 u10-20020a170902e5ca00b001641958c84amr5429985plf.72.1655229949639; 
 Tue, 14 Jun 2022 11:05:49 -0700 (PDT)
Received: from [172.22.33.109] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a62f943000000b0050dc7628168sm7856762pfm.66.2022.06.14.11.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 11:05:48 -0700 (PDT)
Message-ID: <795ad7ac-27f9-4b84-4d47-86d107f5bf49@linaro.org>
Date: Tue, 14 Jun 2022 11:05:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/10] Block jobs & NBD patches
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 peter.maydell@linaro.org
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/22 03:29, Vladimir Sementsov-Ogievskiy wrote:
> The following changes since commit debd0753663bc89c86f5462a53268f2e3f680f60:
> 
>    Merge tag 'pull-testing-next-140622-1' of https://github.com/stsquad/qemu into staging (2022-06-13 21:10:57 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/vsementsov/qemu.git tags/pull-block-2022-06-14
> 
> for you to fetch changes up to 5aef6747a250f545ff53ba7e1a3ed7a3d166011a:
> 
>    MAINTAINERS: update Vladimir's address and repositories (2022-06-14 12:51:48 +0300)
> 
> ----------------------------------------------------------------
> Block jobs & NBD patches
> 
> - add new options for copy-before-write filter
> - new trace points for NBD
> - prefer unsigned type for some 'in_flight' fields
> - update my addresses in MAINTAINERS (already in Stefan's tree, but
>    I think it's OK to send it with this PULL)
> 
> 
> Note also, that I've recently updated my pgp key with new address and
> new expire time.
> Updated key is here: https://keys.openpgp.org/search?q=vsementsov%40yandex-team.ru

This introduces or exposes new timeouts:

https://gitlab.com/qemu-project/qemu/-/pipelines/563590515/failures


r~

