Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B591968DDA4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:12:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQZq-00026t-Vl; Tue, 07 Feb 2023 11:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPQZo-000245-9Q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:12:12 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPQZm-0004Cb-6O
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:12:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id u10so8344862wmj.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zNIMj8uYWpdVZkbFydh+3NAhR8ljKjY7vJDjRVXwAsk=;
 b=Y9KGYzxvp75eeio5lpxtkQbtqvna/olXyIdVIDVcGMNe5GGg3mc1S6CtR4thw5tzQx
 nR2gQ+pzqP5IMbHTcrYlm9kyWT+N2njTZ/SoT+ZhH2TRhUQlxU6oIr67CH65ludFi9+0
 tLQQ4LC2h1T8xtu04QZMlXxyS11w5ktILoTa/+yYAiVEohq8GNLr72cMLDycvRlmlTUu
 5j5gtEiJIEe5NdWVohqdXNj9EoNAa/BHCyd7WU7TQ0Mdflae++8JfluIKgUQ2fKRg6PR
 hmUmnQL7jeqxKF4ghHSYrWFbgPg6Q0ZsZsr3f+I7FgrcxM+d9F21XTms1jHpvMRTE7mS
 srsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zNIMj8uYWpdVZkbFydh+3NAhR8ljKjY7vJDjRVXwAsk=;
 b=kF/aCAHwXxkTD11EZkTmYZGioJRrGxSPRwh8TeccRNGLfZCEvkk4TUpBJ52PyGAR2U
 47Rwccn7huD1qccTAYVW9vxLnI/6RpZVxhhfWGreD11f0l3wsrVSlsc8tpwP49GfWkbK
 CggdbwzTjf9oj8701RfbJ6Q45VmsxbqeyLOuzA50VG7PYFDCpAOMeNRYtjVi47NUJ+mz
 3pYjuT8lcvPPjW4xwC2eE35MVqwVjnjPGNjhupEq34B52LSxcYPGXzhwgMbPnCJp6WcO
 2g7aaNYlLipDk/yj6Ov3ZN88dozQwfVZx8SFe+WFndrnHLqKqJl0hB7DD+l9SPleOPDI
 RYQQ==
X-Gm-Message-State: AO0yUKU/69YFSjrlhVXj1Wa70WnvKxog1A7SFT78RgyffG1ZrCGOi/qq
 10eE2x7QEgVqm7HjA6jCx2e6nQ==
X-Google-Smtp-Source: AK7set/UTB0aKpc1P6VDxR15fOAEQfwRY4NvXXkkgQIrqY2GofEDqH58wWEXgTRJG92MOjjboF3crQ==
X-Received: by 2002:a05:600c:810:b0:3df:f7e7:5f01 with SMTP id
 k16-20020a05600c081000b003dff7e75f01mr3543965wmp.15.1675786328836; 
 Tue, 07 Feb 2023 08:12:08 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az24-20020a05600c601800b003dc4baaedd3sm19854751wmb.37.2023.02.07.08.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 08:12:08 -0800 (PST)
Message-ID: <d3724386-08a8-cf2d-fded-0ca8d1ddd326@linaro.org>
Date: Tue, 7 Feb 2023 17:12:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] Hexagon (meson.build): define min bison version
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
 Matheus Tavares Bernardino <quic_mathbern@quicinc.com>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 quic_acaggian@quicinc.com, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
 <53dd2acc-0eb7-5e49-e803-2625f0841880@linaro.org>
 <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
 <2d3719ee-9144-b9bf-91c2-c3997305f5ba@linaro.org>
In-Reply-To: <2d3719ee-9144-b9bf-91c2-c3997305f5ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 7/2/23 17:11, Philippe Mathieu-Daudé wrote:
> +Bastian
> 
> On 7/2/23 16:08, Thomas Huth wrote:
>> On 07/02/2023 15.54, Philippe Mathieu-Daudé wrote:
>>> Cc'ing Paolo/Daniel/Thomas
>>>
>>> On 7/2/23 15:52, Matheus Tavares Bernardino wrote:
>>>> Hexagon's idef-parser machinery uses some bison features that are not
>>>> available at older versions. The most preeminent example (as it can
>>>> be used as a sentinel) is "%define parse.error verbose". This was
>>>> introduced in version 3.0 of the tool, which is able to compile
>>>> qemu-hexagon just fine. However, compilation fails with the previous
>>>> minor bison release, v2.7. So let's assert the minimum version at
>>>> meson.build to give a more comprehensive error message for those trying
>>>> to compile QEMU.
>>>>
>>>> [1]: 
>>>> https://www.gnu.org/software/bison/manual/html_node/_0025define-Summary.html#index-_0025define-parse_002eerror
>>>>
>>>> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
>>>> ---
>>>>   target/hexagon/meson.build | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
>>>> index c9d31d095c..42b03c81e6 100644
>>>> --- a/target/hexagon/meson.build
>>>> +++ b/target/hexagon/meson.build
>>>> @@ -183,7 +183,7 @@ if idef_parser_enabled and 'hexagon-linux-user' 
>>>> in target_dirs
>>>>       )
>>>>       bison = generator(
>>>> -        find_program('bison'),
>>>> +        find_program('bison', version: '>=3.0'),
>>>>           output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
>>>>           arguments: ['@INPUT@', '--defines=@OUTPUT1@', 
>>>> '--output=@OUTPUT0@']
>>>>       )
>>
>> Looks reasonable, thus:
>>
>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>
>> Out of curiosity: Where did you encounter this problem? After having a 
>> quick look at https://repology.org/project/bison/versions it seems to 
>> me that all our supported OS distros should already ship bison 3.0 or 
>> newer...
> 
> I suppose this fix the tricore container problem Peter reported last week:

s/fix/fixes/

> https://lore.kernel.org/qemu-devel/CAFEAcA-Vr8=br=9jGU1Tr=HTyH6o+S9H79oG=6BqZb8FSp+2Tw@mail.gmail.com/
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3710561054
> 
> #6 43.63 ldlex.l: In function 'yy_input':
> #6 43.63 ldlex.l:615:7: error: 'yy_current_buffer' undeclared (first
> use in this function); did you mean 'yy_create_buffer'?
> #6 43.63 {
> #6 43.63 ^
> #6 43.63 yy_create_buffer

(if so, it would be helpful to have that mentioned in the commit 
description)


