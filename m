Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1094955C0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:02:57 +0100 (CET)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAea8-0000o9-0q
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:02:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZpa-0008Od-J3
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:58:35 -0500
Received: from [2607:f8b0:4864:20::429] (port=33626
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAZpY-00020a-V6
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:58:34 -0500
Received: by mail-pf1-x429.google.com with SMTP id y27so1838576pfa.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 07:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q39ELXbeB23k/CoTp9kA1k4fj30FnRRIpxnZmhL4hmc=;
 b=ZO67IB9c+jva60j9e/kd51r/vXzayaS2IgR/QjdHVd2kjtnGlYpDnufqZFx2+3acWj
 2CoVWnweP1fmmUERUfegiq8xLKUKmYex+wvl8Z6M3Z4VPBWkmhZZQ7UUBxcKyJzxma7X
 WucGyuUzj3ZYxA0rLgpTLGv4XxzRUlMbTbwEg5uqJb0OTVJtmh/xZt10FB3tVEcb+Fia
 m+UthNL+iZ/VWktxwVo7KwJe5fV+TbjbuHWmhNYA162tmDICW+MShOYQt6nduDBudsf4
 4AgMviQcGdfAbAJwbmC05k+u7JaukwN566n5jaTHulax2a7CHhahIIBZpEdE8iqvNslk
 Q7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q39ELXbeB23k/CoTp9kA1k4fj30FnRRIpxnZmhL4hmc=;
 b=tRGiXxMEtH1VipW/5XGdjollbnqa6n98nwS4ikbmoOZ26zEIvKzbSbbyC2j248Rcxf
 OpA6j9tTB35o6Dy7liMltxwlb4PyC0TnIDVvVy8xXMPJIxpKVgP72n/fvtGkV+Ddbb1i
 AdMOMT8e3jLDN0uf1I7nsu9ayKIyTn3F6FEPswxpxZQ8jzxczjaf9RUpGvnawn7OWqzm
 BpAwZqjbYo7hY4s1CN2yegWqRtLIsgCvaQmGFe51/7VZuYnnBSkcepauepJQOmOqDpKn
 gkU6sa8sYpeuZZ5Tl+r6FFeDg3LT8YZ7wwjuOQX0h585jtAKbGMlgYEgN8RHdW2FHOaG
 Y3Qw==
X-Gm-Message-State: AOAM530IH5wWIbT+aEjLXGowgrbRJVNq5ESvK5FWz28DicUjsidCexMb
 5ddk20YtrowCkT5104bxwlk=
X-Google-Smtp-Source: ABdhPJw81fOTSzqItt++gTrYiH4RO8/V+r8kBbB0m4SCe/5pqEbxa4swsN5Cywd/OeE0ll8HFKpQjA==
X-Received: by 2002:a63:7202:: with SMTP id n2mr32558568pgc.254.1642694310622; 
 Thu, 20 Jan 2022 07:58:30 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id v11sm4679328pfu.3.2022.01.20.07.58.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 07:58:30 -0800 (PST)
Message-ID: <22e10c58-84b8-ee09-eaf7-1d9ce513c032@amsat.org>
Date: Thu, 20 Jan 2022 16:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2] qapi: Cleanup SGX related comments and restore
 @section-size
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20220119235720.371961-1-yang.zhong@intel.com>
 <YeknCiBuMEaD3XP2@redhat.com>
 <ec7654fd-5c2c-3d46-1151-6254c3c6951a@amsat.org>
 <YemCZ6UHLX4P4m08@redhat.com>
In-Reply-To: <YemCZ6UHLX4P4m08@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 20/1/22 16:40, Daniel P. Berrangé wrote:
> On Thu, Jan 20, 2022 at 04:31:14PM +0100, Philippe Mathieu-Daudé wrote:
>> On 20/1/22 10:10, Daniel P. Berrangé wrote:
>>> On Wed, Jan 19, 2022 at 06:57:20PM -0500, Yang Zhong wrote:
>>>> The SGX NUMA patches were merged into Qemu 7.0 release, we need
>>>> clarify detailed version history information and also change
>>>> some related comments, which make SGX related comments clearer.
>>>>
>>>> The QMP command schema promises backwards compatibility as standard.
>>>> We temporarily restore "@section-size", which can avoid incompatible
>>>> API breakage. The "@section-size" will be deprecated in 7.2 version.
>>>>
>>>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
>>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>>> ---
>>>>    qapi/machine.json     |  4 ++--
>>>>    qapi/misc-target.json | 17 ++++++++++++-----
>>>>    hw/i386/sgx.c         | 11 +++++++++--
>>>>    3 files changed, 23 insertions(+), 9 deletions(-)
>>
>>>> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
>>>> index 1022aa0184..a87358ea44 100644
>>>> --- a/qapi/misc-target.json
>>>> +++ b/qapi/misc-target.json
>>>> @@ -344,9 +344,9 @@
>>>>    #
>>>>    # @node: the numa node
>>>>    #
>>>> -# @size: the size of epc section
>>>> +# @size: the size of EPC section
>>>>    #
>>>> -# Since: 6.2
>>>> +# Since: 7.0
>>>>    ##
>>>>    { 'struct': 'SGXEPCSection',
>>>>      'data': { 'node': 'int',
>>>> @@ -365,7 +365,9 @@
>>>>    #
>>>>    # @flc: true if FLC is supported
>>>>    #
>>>> -# @sections: The EPC sections info for guest
>>>> +# @section-size: The EPC section size for guest (Will be deprecated in 7.2)
>>>
>>> I expected deprecation would start now (7.0, and it would be removed
>>> in 7.2.
>>>
>>> Also needs to be documented in docs/about/deprecated.rst
>>
>> Isn't docs/about/deprecated.rst for user-facing changes *only*?
>>
>> Machine-facing changes are already described in the QAPI schema.
>>
>> Please correct me.
> 
> Just because something is machine-facing, doesn't mean it isn't
> also user-facing, as users' write the machines that talk to QEMU.
> 
> deprecated.rst documents *everything* that changes in one of our
> publically consumable interfaces, whether CLI args, QAPI schema,
> HMP commands, or device impls or more. There's a whole section
> there just for QMP command changes already.

OK got it, thanks!


