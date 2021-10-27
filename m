Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1EF43C127
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 06:08:09 +0200 (CEST)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfaES-00011T-Fr
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 00:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaCZ-0007pu-DE; Wed, 27 Oct 2021 00:06:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfaCX-0007oV-H7; Wed, 27 Oct 2021 00:06:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id b71so580400wmd.0;
 Tue, 26 Oct 2021 21:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j15Dmu2/LkB8pFkQJBaKct/trn6G6kqBHrkk9r89YMw=;
 b=KHqy47t3pZu+fPs+pmsuQ0tgOwF52oyDplARMs0d5LVdyfm2RCt+s5BcigOWuhjNah
 epVZlNPbVU7xoPnROiaX0y3GNZp+ejqTfbCFAgJQJmv3lFnTw3eeJxL8e08ulAXA1jBC
 x9q7QG4VEXAczmNXtaJrtE9XApvmOWt8PuWQ/p8FtLReHDUycXn92nZoB5ayuW6jTfSx
 TqTrGu6BMcStGbV20jHgjnx7q/Gez7OVbyBz30S6iHiwc8at0kLHlPEEzrLxGFIYWFx3
 weXffzlj025D/6wbvvxKBkFA3+SlX8OGFJHqjO+vv2qh6YBkluY7HgiUth8K3Dg8EG49
 GRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j15Dmu2/LkB8pFkQJBaKct/trn6G6kqBHrkk9r89YMw=;
 b=tC3IL4S+MRWQboxZ0i6fkiv24+yrF2E0LM0oQDQchNkx5cc3Xq5xzLBilgd9gs4MQX
 b53jLsJs00e1HNRmwZBgC683LgBvK56wjpjUbxBqvLYUKmekPxJ+eRO3HStSOOBotJ94
 bbkDPZTqs1ad1UvEK9K8G1JR3SwQ9IJyc5TRxJ23Aad9RdUDGffX/CsNRDQyMlWeY099
 9cwYr+ndIlJIpVumSZ1xnJ8yPGklGjID4XAYunA6OXNGqYWYhSa2nNoYCH4wfLt3tM8C
 YHorIuHkuGbRMRj4FVhP+q59ht+CrgRdcVOet6FZwYWzyHefcomFSBhu18IVv916dTE8
 rJcA==
X-Gm-Message-State: AOAM532ySFipO0jF/e1NhoQKVNmbB9z+yMpfHu2FdlCSdfDXyZRx1+4c
 unsLytWldIZDcO+AQLpfP8Q=
X-Google-Smtp-Source: ABdhPJziNhP4FW7WCMKXpyfxVJ+ooQuEirEAXACCL7NjnvfoUiR2AuQv/We3WFQBjvWPuekZq8+dyg==
X-Received: by 2002:a1c:27c1:: with SMTP id n184mr3077275wmn.190.1635307567398; 
 Tue, 26 Oct 2021 21:06:07 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k6sm21013926wri.83.2021.10.26.21.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 21:06:05 -0700 (PDT)
Message-ID: <125ddbae-7855-d42d-9156-e8bbe7e21e56@amsat.org>
Date: Wed, 27 Oct 2021 06:06:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <YVwRfETMFxFKuXO1@redhat.com>
 <268ffea6-9a3e-fcba-6722-7d1f24cf5794@amsat.org>
 <YVx7YGqUENP83vNF@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <YVx7YGqUENP83vNF@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.215,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/21 18:20, Daniel P. Berrangé wrote:
> On Tue, Oct 05, 2021 at 06:15:35PM +0200, Philippe Mathieu-Daudé wrote:
>> On 10/5/21 10:49, Daniel P. Berrangé wrote:
>>> On Tue, Oct 05, 2021 at 06:44:23AM +0200, Christophe Leroy wrote:
>>
>>>> I will look at it, please allow me a few weeks though.
>>>
>>> Once something is deprecated, it remains in QEMU for a minimum of two
>>> release cycles, before being deleted. At any time in that deprecation
>>> period it can be returned to supported status, if someone provides a
>>> good enough justification to keep it.
>>
>> My understanding is once being in deprecated state for 2 releases, it
>> can be removed, but it doesn't have to be removed (assuming it is
>> functional and nobody complains). Am I incorrect?
> 
> It should be removed after 2 releases. Things live longer because
> people forget or are busy with other things, but ultimately anything
> in the deprecated list is liable to be deleted at any point after
> the 2 release minimum is up.
> 
> If we change our minds about deleting something, then it should
> be un-deprecated.

Sigh. This is more work on me then.

>> I am raising this because the nanoMIPS support is in deprecated state
>> since more than 2 releases, but it is still in-tree and I try to keep
>> it functional. However, since no toolchain reached mainstream GCC/LLVM
>> it is not easy to maintain. By keeping it in that state we give some
>> time to other communities to have their toolchain upstreamed / merged.
> 
> If you're trying to keep it functional and aren't going to remove
> it, then it shouldn't be marked deprecated.

OK, I'll move it back to Odd-fixes.

