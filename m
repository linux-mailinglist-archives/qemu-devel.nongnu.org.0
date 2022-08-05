Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5933A58A990
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:42:15 +0200 (CEST)
Received: from localhost ([::1]:34464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJumU-0003xC-E9
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJugQ-0007Jt-7x; Fri, 05 Aug 2022 06:35:58 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:46786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJugM-0002PY-0v; Fri, 05 Aug 2022 06:35:57 -0400
Received: by mail-ej1-x633.google.com with SMTP id y13so4206508ejp.13;
 Fri, 05 Aug 2022 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KLz3yk+w0ZWHS4PG/7lj+laCIilI9autLcfl8crPEI0=;
 b=c28SWPmMPTw6CiVC68QE8hBfMU8t+XXiJ2p2W1FYvaeymO/F8FGZu9Z4B/ljGTMrG/
 b2iYSWE/MyvZtlDt0Rdo5GgbvPLsV046EUNUmZIet1o/obk8wSxni4LXR2nbmfxRqyO4
 hlKEytaCGWyDw4tGjqZ8kW/a5Hh0TkwYKwHoF2yLeqASZPFp4UIlcsocFjFNOItTfQxf
 MDzb0Jeb2+/DzfTRrfAlwHjZWZKk+rClONQ7OzsF15vbOh1LD6a2xNk7jEo+W4uUeBbl
 yReH6RG3yQAomKh+MXKn4f2YWq/bTWRvMVBkf196gqrruFgpJgnbhX43RRlnAc6sf5nk
 dSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KLz3yk+w0ZWHS4PG/7lj+laCIilI9autLcfl8crPEI0=;
 b=CdyV8s7lrkVKLe+wPurTkPyn2MkmUGBDfzo8km+4Gsj0V5drGuMWXWeJ+7uwK51mAo
 /XoRa1UIdjtge3qBlrotdjrRUTlCAoHEOjL1ksz+4YkRqFudaDjFt8gSumKwPXzv14UL
 ejXJtpfim5zqb39BeYCN4iQ7x6P1Ws1GkQE3tRtDWcGkCEgW1wqPtCWWN0DvbfxyMIVB
 NlcPS/eRnDaMxl1MZAVIL4KKKq9RxFlil0sI+bf6Owr2eft+TMbwQPjyTXrwZgTqvziJ
 nohlbvuT/Hl2Rm1aGKGeQiAVO8YMDmuV4rpVQV63Xslv/aNhtMma7wwDnuSLrea0Le7D
 IGeQ==
X-Gm-Message-State: ACgBeo1d4JR+X7+oYJKryATeiIH/CslLMguNhvxLPnQe9oxs9hBqoTcz
 Y+UZcJ11j4yZB9O14s7TUwk=
X-Google-Smtp-Source: AA6agR7d1jp4GCpKP8VRFQYbIRppvAMQ0VZVdnqTQ2vrm5g3UVr9q26vAH1wiujXf0HB/LiWwdBnoQ==
X-Received: by 2002:a17:906:4795:b0:730:a6a0:36f4 with SMTP id
 cw21-20020a170906479500b00730a6a036f4mr4848270ejc.148.1659695752147; 
 Fri, 05 Aug 2022 03:35:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 qk27-20020a170906d9db00b006ff0b457cdasm1444732ejb.53.2022.08.05.03.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 03:35:51 -0700 (PDT)
Message-ID: <cce5f807-e8ab-8779-7d01-b225520e9a87@redhat.com>
Date: Fri, 5 Aug 2022 12:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 14/15] mtest2make.py: teach suite name that are just
 "PROJECT"
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-block@nongnu.org, Xie Yongji <xieyongji@bytedance.com>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Warner Losh <imp@bsdimp.com>, Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <laurent@vivier.eu>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220712093528.4144184-1-marcandre.lureau@redhat.com>
 <20220712093528.4144184-15-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220712093528.4144184-15-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/12/22 11:35, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> A subproject test may be simply in the "PROJECT" suite (such as
> "qemu-common" with the following patches)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   scripts/mtest2make.py | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/mtest2make.py b/scripts/mtest2make.py
> index 0fe81efbbcec..606821ee2732 100644
> --- a/scripts/mtest2make.py
> +++ b/scripts/mtest2make.py
> @@ -51,8 +51,11 @@ def process_tests(test, targets, suites):
>   
>       test_suites = test['suite'] or ['default']
>       for s in test_suites:
> -        # The suite name in the introspection info is "PROJECT:SUITE"
> -        s = s.split(':')[1]
> +        # The suite name in the introspection info is "PROJECT" or "PROJECT:SUITE"
> +        try:
> +            s = s.split(':')[1]
> +        except IndexError:
> +            continue

Shouldn't you continue with s begin simply "PROJECT"?  That is, just

     if ':' in s:
         s = s.split(':')[1]

This way you can do "make check-qemu-common".

>           if s == 'slow' or s == 'thorough':
>               continue
>           if s.endswith('-slow'):

and then however these two "ifs" need to be under the case where the 
suite name is "PROJECT:SUITE".

Paolo

