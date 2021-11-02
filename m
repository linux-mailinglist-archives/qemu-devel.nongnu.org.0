Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 328CA443418
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:54:43 +0100 (CET)
Received: from localhost ([::1]:40038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhx3Z-000355-97
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhwxH-0002Sw-0L; Tue, 02 Nov 2021 12:48:11 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:38863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhwxE-0006GA-Sn; Tue, 02 Nov 2021 12:48:10 -0400
Received: by mail-wr1-x435.google.com with SMTP id u18so34315990wrg.5;
 Tue, 02 Nov 2021 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=I9mMexECIuGNRJjxaSTDrLv3ntUNjViZ4B+QfGaT224=;
 b=GWfkxwz/qk5SUpu4T2OVZ2Y4Vdlao6fi3dQVODYCnd/W1qB4T9/u6GjQG4ccUSQ1RJ
 fCqh6bGYii/2pNUa2VBcNvlzNN0Mc8+MV4xJl5keFW0KaiSkZqcQErkeP4K2fHMBzRDY
 PXycT/AV6Q8SfBBujKUXw2M9CtRtXO9r8KG0PMATs5xOB9aPhFZ4lX0bCjf2F2aGmQ3d
 NM4TxEUPWiiRxbLF2JBG8Meqf/r7Sq9VJZ6fJSl+evCC1oTIiGgfv5jS35j68HPoGYSe
 x8tRXVCnykd/clDClFKky5hoffTdSTlfj6zFFiXh0f3VwDqmz/5GIpIQEne2ejsOJc47
 zlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=I9mMexECIuGNRJjxaSTDrLv3ntUNjViZ4B+QfGaT224=;
 b=Ehh+ArdxufzjLpYPsuv1IMXWNHXwJKrrVYoLaCdw5Dg1C/74AYpMbnn0i/5+0WD2/k
 DyCvodoShygMMCLAJZbS8NK1nnn1iGYSngpVkVsI43FqB7vVfb1tH7UZGtM7eJzCqNFe
 yFAnNGKlL2y4cuhma+DnnJ3aQza0U+KG1Rx21r1rPLaXHBYutOeWC90YC/kBIIUHCO8Y
 MIyeSDfQ0SGU+W/cCU83ocVcGMaj43kbUOkYPPvgZR4uZCjZgFBxhftE0Y0P8xLvc0E7
 lE00rGqWiAMAjsCqDnJwarpD5/h9gxf4SnYRhuCFOLNeSDyYwLEkPBSWO9/yF4LaIzpL
 0pNA==
X-Gm-Message-State: AOAM532ZmrCeLvvPtLJYbCD6ck/7NHti9ijRXUwV7DMMnSF5xYi5YQji
 o7KWGACw39COmdmQKKOCymc=
X-Google-Smtp-Source: ABdhPJwM12CfMIhdlKgd999oisr0mrv/ce1UwKKmuAFt3gIktPX99NSOD5LTb9kIBKpJ9x7B2hgzcw==
X-Received: by 2002:a05:6000:1684:: with SMTP id
 y4mr48005877wrd.252.1635871686898; 
 Tue, 02 Nov 2021 09:48:06 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id h17sm16161897wrp.34.2021.11.02.09.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 09:48:05 -0700 (PDT)
Message-ID: <0fa577e4-dedc-11f2-41fa-d8a3a3a6ec86@amsat.org>
Date: Tue, 2 Nov 2021 17:48:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 6/6] hw/input/lasips2: QOM'ify the Lasi PS/2
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211101082747.2524909-1-laurent@vivier.eu>
 <20211101082747.2524909-7-laurent@vivier.eu>
 <04704da8-24c5-25d6-85e1-6f9901f00b24@linaro.org>
 <a62209b3-340d-e24e-b5a1-0a50accb487f@amsat.org>
In-Reply-To: <a62209b3-340d-e24e-b5a1-0a50accb487f@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
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
Cc: qemu-trivial@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 11/1/21 16:43, Philippe Mathieu-Daudé wrote:
> On 11/1/21 16:31, Richard Henderson wrote:
>> On 11/1/21 4:27 AM, Laurent Vivier wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
>>> Message-Id: <20210920064048.2729397-4-f4bug@amsat.org>
>>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>>> ---
>>>   hw/hppa/lasi.c             | 10 +++++++++-
>>>   hw/input/lasips2.c         | 38 ++++++++++++++++++++++++++++----------
>>>   include/hw/input/lasips2.h | 17 +++++++++++++----
>>>   3 files changed, 50 insertions(+), 15 deletions(-)
>>
>> This has broken the qtest-hppa device-introspection test:
>>
>> ERROR:../src/qom/object.c:2011:object_get_canonical_path_component: code
>> should not be reached
>> Broken pipe
>> Aborted (core dumped)
>>
>> Also, the previous patch 5 does not compile on its own:
>>
>> In file included from ../src/hw/input/lasips2.c:28:0:
>> /home/richard.henderson/qemu/src/include/hw/input/lasips2.h:17:18:
>> error: field ‘reg’ has incomplete type
>>      MemoryRegion reg;
>>                   ^~~
>> ninja: build stopped: subcommand failed.
>>
>> Reverting to patch 4 builds, and passes the introspection test.
> 
> Thank you for the update, I'll have a look.

The last 2 patches are broken, do you mind resending your pullreq
without them?

Thanks,

Phil.

