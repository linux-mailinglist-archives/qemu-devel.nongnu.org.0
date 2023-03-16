Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BBD6BC790
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 08:46:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pciIr-0004nv-Oo; Thu, 16 Mar 2023 03:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciIn-0004kV-Fy
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:45:33 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pciIl-0004ul-QD
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 03:45:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id q16so639945wrw.2
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 00:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678952730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ylDetEhdXktOF7mSgEutRThFdKOsr4i7Asa8+Hd4hCs=;
 b=x2Ms2b1qXP1U3wU1GQK1zfEhRAlDm10LcHOkWkUFQ89L6SWdoPBM6zZxq3qhxuejet
 3ogWrum+xu1VRC0ANp58B9vIX4pMEa4+wheMlMr8+AoSEO/OV2PVNAvUlXc0lHIzeKVl
 7WaC1Iyb/mleGWuAvkzF6GzaBOVupS0JjJL94W4a8+wuM41zUoNUZkOUORk8sAPdmUqT
 9NOwtMHEkJqZdUkEQT7k3mqPBTzTmlnnuG/u3J6CxjWWL8dkMFuabEqAaON/tqLJUUA4
 +niC1STCqAQzgu5QCGev2JYqMAaT1cMyd0m1goPNg9W1h9xrQvBvm9VGZQarqCgtAk3e
 N18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678952730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ylDetEhdXktOF7mSgEutRThFdKOsr4i7Asa8+Hd4hCs=;
 b=C0AuL8AKeNMqH5onbyQbcdmfwT4GNVxnHef0SsH1Yum1YLCenPW0NzuNaFSjrJ0QyN
 dQus84qbjihqlPQQ4cYvezl7xa+b0qHsVdmTBnq79ucgPhDTCJ0gJpF8+gS8HWgJlOqy
 JQ4jx6iXzeaVC8BxiN4KK8RkED5g1WJ+X+t091I0PlX+PzpNgIWhiUQdRAx0rgCYmEc4
 gf8LR2TaLPObdeQhxbweXf2ePS8INYnT1lawYkD5VHnlP25f4awlhRMubWVKvzSnwNAL
 f5p/0TfUe8ArQCVvNhGYkd4NyiHIWra/b7k74pvr/wCABiG9GztIpvdN+mANQux6CHC8
 wyVg==
X-Gm-Message-State: AO0yUKVEVTd1J0KqgSFXgRIcFsQykIEUH1c0fGnNJGytGSR7Q5ahPnie
 h9r9uxvKEJNHakm2GwDtJEjV1A==
X-Google-Smtp-Source: AK7set/WuvExfEq1HfaBa60irwe05If47gDGb6WmEqDum3kbMpa38jlvlwgz9aBfX1PlcF8FJ5L2dQ==
X-Received: by 2002:adf:f607:0:b0:2cb:c474:7597 with SMTP id
 t7-20020adff607000000b002cbc4747597mr3305081wrp.66.1678952730017; 
 Thu, 16 Mar 2023 00:45:30 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j15-20020adff00f000000b002cea9d931e6sm6699569wro.78.2023.03.16.00.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 00:45:29 -0700 (PDT)
Message-ID: <29fbda77-26fb-c2f7-95ac-0c442d210e78@linaro.org>
Date: Thu, 16 Mar 2023 08:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 10/14] tests/qapi-schema: Rename a few conditionals
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 eblake@redhat.com, jsnow@redhat.com
References: <20230316071325.492471-1-armbru@redhat.com>
 <20230316071325.492471-11-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230316071325.492471-11-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 16/3/23 08:13, Markus Armbruster wrote:
> Positive test case
> 
>      { 'enum': 'TestIfEnum',
>        'data': [ 'foo', { 'name' : 'bar', 'if': 'TEST_IF_ENUM_BAR' } ],
>        'if': 'TEST_IF_ENUM' }
> 
> generates
> 
>      #if defined(TEST_IF_ENUM)
>      typedef enum TestIfEnum {
> 	TEST_IF_ENUM_FOO,
>      #if defined(TEST_IF_ENUM_BAR)
> 	TEST_IF_ENUM_BAR,
>      #endif /* defined(TEST_IF_ENUM_BAR) */
> 	TEST_IF_ENUM__MAX,
>      } TestIfEnum;
> 
> Macro TEST_IF_ENUM_BAR clashes with the enumeration constant.
> Wouldn't compile with -DTEST_IF_BAR.
> 
> Rename the macro to TEST_IF_ENUM_MEMBER.  For consistency, rename
> similar macros elsewhere as well.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   tests/qapi-schema/qapi-schema-test.json | 12 ++++++------
>   tests/qapi-schema/qapi-schema-test.out  | 12 ++++++------
>   2 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


