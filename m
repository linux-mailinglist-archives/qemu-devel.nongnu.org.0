Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CAD458E88
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 13:39:09 +0100 (CET)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp8bE-00031Y-9D
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 07:39:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp8ZE-0001mh-Bu
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:37:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mp8ZA-00083e-TC
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 07:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637584619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oRDSwKGp6/TtS9Vqg6re7APNlEvOEfPPXi7uJVn2wv8=;
 b=N9H4qL3lcns4+rLabNoONfKUAcVcLVqsE+B6W4BkPZeQTB9cYArpmyROGfNuI8GYUq17Vr
 vKp171XZH96fmJ7vkr7vK52SeTba29Kd5d9Wmgx2T1HmAXQtDFxuxZKr34ii+fKScgNKVL
 YKL4Z+fNovjBDAwK58WVcQo0OAsY4nM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-m1-xMsKsOAK5u8r1fhfTew-1; Mon, 22 Nov 2021 07:36:57 -0500
X-MC-Unique: m1-xMsKsOAK5u8r1fhfTew-1
Received: by mail-wm1-f71.google.com with SMTP id
 n41-20020a05600c502900b003335ab97f41so9318084wmr.3
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 04:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oRDSwKGp6/TtS9Vqg6re7APNlEvOEfPPXi7uJVn2wv8=;
 b=imiYx4AxVZiEGUvmyJJU8rr47zY7JiyeCIJlqDuZnBevu83IxXOe7vmTTHkQjLPAXp
 j12FTuabczr6j6WzmsX2radGoFY3C/PS+ICGwRhdCHOsWGGDoNR2w67FvTstYG+z5rdk
 cqgiScgZiPBtNEuRQflx47mv9sqxNm2CBV3IeaxlpldzVWOxuTxb3Y5rOQ6dv0uYcu7E
 j+t6p5fnkVRSTdURLpnZXzpD0Z4ejpJYtcJT3EJp00M2UHrtqgnWjnNNnvdA1VeVW6EZ
 6Qjn3rc6lQ3gkrUsoJZcIeocXz1ZS+lciYyVXd+xv//bC2OL83vuA3+KeMB9S9onjcYn
 XwPg==
X-Gm-Message-State: AOAM532OsESaGOa3E64l9SV3pHb6384KPSNpZEqN58h2qFnc2WtKZ20l
 WzocW6tParWkNGJqogCYPwrRs9VjQafAQRX2C3KT2OQv7XuFNGnEXSepw28uKVc/TrGEItBK6T6
 n4rAW9QMHWw69Y1Y=
X-Received: by 2002:a05:6000:168f:: with SMTP id
 y15mr36913142wrd.61.1637584616242; 
 Mon, 22 Nov 2021 04:36:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZNt1k16o0THWIOYWA8OdPTNhfpXZrz8g2t3JT5dNbrKRiLN7NaTRlX2AmtipN+yzP+0usAw==
X-Received: by 2002:a05:6000:168f:: with SMTP id
 y15mr36913107wrd.61.1637584616033; 
 Mon, 22 Nov 2021 04:36:56 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id g6sm11914241wmq.36.2021.11.22.04.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 04:36:55 -0800 (PST)
Message-ID: <c591c571-f922-28a5-e8be-75e6cccb261a@redhat.com>
Date: Mon, 22 Nov 2021 13:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] docs: Fix botched rST conversion of
 'submitting-a-patch.rst'
To: Kashyap Chamarthy <kchamart@redhat.com>
References: <20211119193118.949698-1-kchamart@redhat.com>
 <20211119193118.949698-2-kchamart@redhat.com>
 <56026d2a-0b9e-ff83-d953-a284a810a8ed@redhat.com> <YZtu59t8DoZZ15nQ@paraplu>
 <b03ffb0c-0c4f-b792-f6c1-55014a0ae003@redhat.com> <YZuK09xP0I28dvMr@paraplu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YZuK09xP0I28dvMr@paraplu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/11/2021 13.19, Kashyap Chamarthy wrote:
> On Mon, Nov 22, 2021 at 11:36:54AM +0100, Thomas Huth wrote:
>> On 22/11/2021 11.20, Kashyap Chamarthy wrote:
>>> On Mon, Nov 22, 2021 at 10:51:15AM +0100, Thomas Huth wrote:
> 
> [...]
> 
>>>> I'll add the link to https://wiki.qemu.org/Contribute/SpellCheck again.
>>>
>>> Please don't -- I intentionally dropped it in a previous iteration based
>>> on this feedback from Peter Maydell:
>>>
>>>       "I'm not sure that SpellCheck in particular is sufficiently baked
>>>       to be in the actual docs. I'd rather just drop the reference to it
>>>       from SubmitAPatch."
>>>       (https://lists.nongnu.org/archive/html/qemu-devel/2021-11/msg00137.html)
>>
>> Ok, so I'll drop that line completely (otherwise it does not really make
>> sense to have it in this list after the "See also:" right in front of it).
> 
> I kept that because an explicit reminder about spell-check is useful;
> it's easy to forget.  Another option is to retain the line, but replace
> "See also:" with "And:".  Not sure if it's any better.  But I don't mind
> either way.

What about simply replacing it with a new sentence below the bullet list, 
saying:

"Please also use a spell checker like `codespell 
https://github.com/codespell-project/codespell` with your patches"

?

  Thomas


