Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C79E4349F3
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:19:10 +0200 (CEST)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9cj-0001Wd-I8
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1md8nT-0003Er-1X; Wed, 20 Oct 2021 06:26:11 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:36459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1md8nP-00019j-6Q; Wed, 20 Oct 2021 06:26:10 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 z11-20020a1c7e0b000000b0030db7b70b6bso436928wmc.1; 
 Wed, 20 Oct 2021 03:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=msvvKILlhTQj111fXpWHy+SBH9bCrAHvZnAELsr3mVw=;
 b=UWnTbBJAt2Q1c7wbTgdytVZoRHmtUSTKshm59KO/EXR5Go3bFzM7Hp1zy7cRcZhtTJ
 HxePdstiGP8R1e6dPBFIDNNtucxJQnUEvZxrzk+Mqb/GsGxqeJMv7BF8MAf+aAq0wocq
 Qud1yx6xlJIQWxE2Ct4cokmGpChONZnHRFBI3whrr6VodRVdxS2auhIk1nsLdj13rdJl
 iNRbbnWw0PmSMHR+1vzxHd5bNUXYAct8ApYZqNCMYE62Ms6Uee2jCSEo+Sdr/xcDJc51
 HSsxyzpTttKGZs3zVMg9BetLE68Ky/hdpEo45HJT6X4CdOOAdKf8sQsmc0kX60UEabBL
 vZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=msvvKILlhTQj111fXpWHy+SBH9bCrAHvZnAELsr3mVw=;
 b=hHu+KCQGIKwCD9t2lB9iogh+5wh5OjPt6H5EV6MS9RKrxDXzaB/FUW5cOVm4BbQNeQ
 1LAPLbMKhmM5quuvh3YG5FTO2OevN0oIXL4AyRuhdPdVqGNklhjsE2gwER9bhBz8Ojos
 KDvSATKgsIgR9UR1Z/WwyD/O/QsKgOSQWxW7nfBi98rYxkr903kANT2vazTh57/Vr46B
 zWX3hjs8tA3hfhPtrbLEkCrNcLJqBck4B4onDXQ0WFn5nElwcW71s4IkWMx+biNkAQmX
 Wqc3qGmS7AWQqNehRAPNZ8g902H01+biYilvogRD7TjTTW2byIDFONQDgzRpcnyHnVNx
 vEpg==
X-Gm-Message-State: AOAM530x0L+pGT9PxQfeyt5s/BkjFqRb6iW3KiZPGDTXGrckJoduqQnJ
 Qv4SWhj0K8TPeLyXYDjtml4=
X-Google-Smtp-Source: ABdhPJwiFphe7pZ+f6mAFqxbkOunDjo/ejBVQb6XRWS5iHZfGqfPCnaqcA5XnEqhUOL4XZQC+oc1wg==
X-Received: by 2002:adf:bb08:: with SMTP id r8mr52793900wrg.247.1634725564496; 
 Wed, 20 Oct 2021 03:26:04 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id o12sm1584970wrv.78.2021.10.20.03.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 03:26:03 -0700 (PDT)
Message-ID: <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
Date: Wed, 20 Oct 2021 12:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-2.074,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Richard

On 10/5/21 14:29, Thomas Huth wrote:
> On 05/10/2021 14.20, BALATON Zoltan wrote:
>> On Tue, 5 Oct 2021, Cédric Le Goater wrote:
>>> On 10/5/21 08:18, Alexey Kardashevskiy wrote:
>>>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com>
>>>>>>>>>> wrote:
>>>>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in
>>>>>>>>>>> QEMU (as far as I
>>>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>>>> also not possible
>>>>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>>>>
>>>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>>>>
>>>>>>>>> True. I did some more research, and seems like there was once
>>>>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>>>>> couple of years ago already:
>>>>>>>>>
>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>>>>
>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>>>>
>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>>>>
>>>>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>>>> deprecate-and-delete them.
>>>>>>>>>
>>>>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>>>>
>>>>>>>> I really would like to be able to use them to validate Linux Kernel
>>>>>>>> changes, hence looking for that missing BIOS.
>>>>>>>>
>>>>>>>> If we remove ppc405 from QEMU, we won't be able to do any
>>>>>>>> regression
>>>>>>>> tests of Linux Kernel on those processors.
>>>>>>>
>>>>>>> If you/someone managed to compile an old version of u-boot for
>>>>>>> one of these
>>>>>>> two boards, so that we would finally have something for
>>>>>>> regression testing,
>>>>>>> we can of course also keep the boards in QEMU...
>>>>>>
>>>>>> I can see that it would be usefor for some cases, but unless someone
>>>>>> volunteers to track down the necessary firmware and look after it, I
>>>>>> think we do need to deprecate it - I certainly don't have the
>>>>>> capacity
>>>>>> to look into this.
>>>>>>
>>>>>
>>>>> I will look at it, please allow me a few weeks though.
>>>>
>>>> Well, building it was not hard but now I'd like to know what board
>>>> QEMU actually emulates, there are way too many codenames and PVRs.
>>>
>>> yes. We should try to reduce the list below. Deprecating embedded
>>> machines
>>> is one way.
>>
>> Why should we reduce that list? It's good to have different cpu
>> options when one wants to test code for different PPC versions (maybe
>> also in user mode) or just to have a quick list of these at one place.
> 
> I think there are many CPUs in that list which cannot be used with any
> board, some of them might be also in a very incomplete state. So
> presenting such a big list to the users is confusing and might create
> wrong expectations. It would be good to remove at least the CPUs which
> are really completely useless.

Maybe only remove some from system emulation but keep all of them
in user emulation?

