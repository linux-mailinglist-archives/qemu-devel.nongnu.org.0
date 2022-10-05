Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74D5F5D2F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 01:19:18 +0200 (CEST)
Received: from localhost ([::1]:33804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogDfZ-0000od-C6
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 19:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogDdm-0007sf-6S
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 19:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogDdi-0000Pj-1u
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 19:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665011840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wq2TNne9Lo3Ul3eAUCxIilCbQe4aFdYKG/89tPIH/E=;
 b=AzEpP7ti6ug3fXSX+aVYyVvc4p6VY38WI3hv3mhd4v/n6c9oU82eDHZLTaRGLCXQbwcauK
 p43tyq8Evjf6Nlsy3r3gplUaDaYqqZGTG12AAN0l5CyrazI2zVY8HgtLf49vcVjAzsH46q
 z/Lbu3KLvwgy8z5E3bB1uZmxyDLVsq4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-DP5GhAc0Od6j3Wdkf-sbMw-1; Wed, 05 Oct 2022 19:17:19 -0400
X-MC-Unique: DP5GhAc0Od6j3Wdkf-sbMw-1
Received: by mail-qv1-f70.google.com with SMTP id
 q20-20020ad44354000000b004afb5a0d33cso174143qvs.12
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 16:17:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8wq2TNne9Lo3Ul3eAUCxIilCbQe4aFdYKG/89tPIH/E=;
 b=1e9RcDp5aCiAZ7Se1Hni0yV+qhYlpm8UU1HJuw2ij+qOUGgMstkQQ98oTFwuIyetpr
 5zhWRtQXZ74nHjKEaB2iBKbd5MxeR5gbk8H05uuE088vb7Xxq28h9zKoiMw0jDIq6PJ1
 JOUa5r7npJoAITibsgSFy2XUg9ll7ft+ERL7N0nVuFWVdGXEr8spFFJFXAei4Cb3bx2H
 lbogM9JoSCLDQH++j0UM28vE2hL7D1fPkQty319OXTi6j3MeLt8Kmvi5JO5gw1lIERPX
 KoZUJs6/MJaaYZ7u1hEsH3B7VvrD0D4yCk8/9mJnDfqAmH5jKsSn57y1O+WFTAiAYth0
 ///A==
X-Gm-Message-State: ACrzQf2lBooI33FYa7eHWO+CyjaCgB07W/5s5jCQdrbMOFLH65oRk5Yp
 AmLpfXdvkwvmM4Hbl5lVeuJnoy7pPDLggHKjj6S5JgxsdIsS0ICj3J2/DrMr9oQBl2e3S5nw1nV
 m+XCaoS1cE0FW6d0=
X-Received: by 2002:ac8:5d49:0:b0:392:9eaa:af85 with SMTP id
 g9-20020ac85d49000000b003929eaaaf85mr1509734qtx.496.1665011839306; 
 Wed, 05 Oct 2022 16:17:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6arayCBYU3f8Yb7eFx7jh2ECehPhIwRYNevzECCPHHkzwoltdxy/fIjgGqHMZGTdzBdXoZ7Q==
X-Received: by 2002:ac8:5d49:0:b0:392:9eaa:af85 with SMTP id
 g9-20020ac85d49000000b003929eaaaf85mr1509716qtx.496.1665011839034; 
 Wed, 05 Oct 2022 16:17:19 -0700 (PDT)
Received: from [172.20.5.108] (rrcs-66-57-248-11.midsouth.biz.rr.com.
 [66.57.248.11]) by smtp.googlemail.com with ESMTPSA id
 h7-20020a05620a400700b006b945519488sm5217018qko.88.2022.10.05.16.17.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 16:17:17 -0700 (PDT)
Message-ID: <db151a41-f1e6-92e1-9c05-e9a0155c90f6@redhat.com>
Date: Thu, 6 Oct 2022 01:17:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 00/54] testing, gdbstub, plugin and gitdm updates
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <CAJSP0QUCnYVyDfUY7aC+ayJS0RwJ70QRMti6Z-vLfu9==VWRxA@mail.gmail.com>
 <87o7uqjnut.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87o7uqjnut.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.435, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/5/22 17:23, Alex Bennée wrote:
> 
> Stefan Hajnoczi <stefanha@gmail.com> writes:
> 
>> On Tue, 4 Oct 2022 at 09:38, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>
>>> The following changes since commit efbf38d73e5dcc4d5f8b98c6e7a12be1f3b91745:
>>>
>>>    Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-10-03 15:06:07 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-plugins-gitdm-041022-1
>>
>> Hi Alex,
>> Please rebase and resend. There is a merge conflict.
> 
> Any clue as to where - because it rebased cleanly for me.

That's because "[PULL 12/54] configure: do not invoke as/ld directly for 
pc-bios/optionrom" was also part of my pull request.  Rebasing and 
resending will do the right thing, as it will remove your copy of that 
patch from your branch.

Paolo


