Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7E5511C0F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 17:51:55 +0200 (CEST)
Received: from localhost ([::1]:59740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njjxK-0007Jh-H4
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 11:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njjvz-0005zB-Sg
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:50:31 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njjvy-0003nb-9b
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 11:50:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id l7so4298539ejn.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 08:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fA6aXkezhnG92Zw+tAMEfbEP51ZWZvb++ZipEHX/QHc=;
 b=IJudmJ4COezbgGhBfwZMljzSMj1Rv8Q8At4K14fwr5yHfGG5NSMSM9Udx+chRcUDDI
 MWFuVMEWOws3XCrIqgh9cmny6q9NQb8eYfWjjEoxfgXeRE3mgPJUfX+lhpC4XVkJycI8
 hbhKrAP7GiJH6XbJgcoC6TBSverT5/duQlaTKSBZzZND+4u6ecvc7kWh66Cfl+NOLg0J
 N05C9JXTs11K/ncwjiVvd8TYCE7TR8R5ecBvuib+0VBZoWNcJHDG4AhpetrQkYJF3Agy
 vjzzqlB5Qx8AsVlW3ArTar/UAs1qyE3w1oVkRz+z/Ffq7u4uZ1VLlG7DG/neaZX7PpT6
 fFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fA6aXkezhnG92Zw+tAMEfbEP51ZWZvb++ZipEHX/QHc=;
 b=Y1GWt0GOkASuAmnNek5G6GtuXqtH+Rbf21++fYmH34lFowKasVNNz2/onW3fhMGGWU
 fh3mSIPh0bd741TpFbG+AK5YUQoKulu0kNUrMLOD4d5aOwfqq81bb2UPdDzRy8lJAarz
 fKW5y0tlZKjXTNBCLMk3s4bVNFxI1HjJZtStkjQf3N7kT0Od/K6x1aSoQfkviTVE/Wko
 McybuUCGqxZz4RIogFewsScC729bZubDyss4AnYpUkyV/ovoG9CZUD48XwWYxs/hKfKl
 dFggRaTKrpWeWBl0v3AXpw1jxhLsZ4REte/GALf8Dql/D6EzNfQ8Z2E3dnfzbAZGN8a4
 daWg==
X-Gm-Message-State: AOAM533n2JmaGFdHIeJeBkg9qzIRzs9SVOKOrJVxfiBD+r5y3gp3HhEV
 HYJntr2/DPv38Mkaxjc/Dtw=
X-Google-Smtp-Source: ABdhPJy5DfTHoihc+lKFBNIg4r6QaR3+RYVsyG75F9j5vtA+E//aY74yu1H7wsJk+y/9EGyj4+3zDA==
X-Received: by 2002:a17:907:96ab:b0:6f3:d0de:f8e1 with SMTP id
 hd43-20020a17090796ab00b006f3d0def8e1mr2149238ejc.113.1651074628561; 
 Wed, 27 Apr 2022 08:50:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 lb18-20020a170907785200b006efe7bb40b0sm6949056ejc.74.2022.04.27.08.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 08:50:28 -0700 (PDT)
Message-ID: <cde483f2-28ee-88fb-921d-336186ff8222@redhat.com>
Date: Wed, 27 Apr 2022 17:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com> <YmkwndPwSDxqqdZA@work-vm>
 <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com> <Ymk4U4O4CN3e7+9A@work-vm>
 <2aed3f83-5941-d723-7c27-cc657f7c257a@redhat.com> <YmleMMNkZ8ukENDZ@work-vm>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YmleMMNkZ8ukENDZ@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/27/22 17:16, Dr. David Alan Gilbert wrote:
> * Paolo Bonzini (pbonzini@redhat.com) wrote:
>> On 4/27/22 14:34, Dr. David Alan Gilbert wrote:
>>> If I specify a 'vm' it's not obvious to me whether I'd get NICs and
>>> block devices in the future?
>>
>> VM would not get those (it's global statistics), but the size could balloon
>> if you specify no target at all.
>>
>>> Adding a syntax for 'all' into the vcpus list would fix that?
>>
>> I don't like having special syntax.  The current QAPI just doesn't filter
>> what is not in the arguments.
> 
> Is there a object that represents the set of all vcpus?

No.

>> Yes, those would have different providers.  But a single target can support
>> multiple providers.
> 
> Is that just for different implementations - kvm/hcf/tcg etc or do you
> envisage multiple providers on an object in a running VM?

I think multiple providers are possible for a single object, for example 
a device could expose both PCI (how many MSIs, etc.) and SCSI (how many 
commands sent/succeeded/failed) statistics.

Paolo

