Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDC95EDCDF
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:36:06 +0200 (CEST)
Received: from localhost ([::1]:58352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWIG-0000RA-Rq
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTmu-0002f1-SP
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odTms-0005aX-N6
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664358930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHGCrNU7/ujL9C1SwHjuxc6BUKJ3ExAxx/TA1i/i2Ho=;
 b=BlE9CrBvMd+VVlgYVIXJv9CwGKaLcymDLaoQCgUQTqokNLxdaCUaXDnv0LzEw/+EjLSVZG
 rX/2UpedtBR1UGNbTCFbHYLQjbDcKSQS78CnUGKao0iSX1gtEG2BI31n9Ipsbl3ZG3HJww
 k12JUQoSaJqxv3fAoUFD/K+BsO91ef8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-332-NTNmtlHNO8qg1Obz9yiaFg-1; Wed, 28 Sep 2022 05:55:28 -0400
X-MC-Unique: NTNmtlHNO8qg1Obz9yiaFg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h20-20020adfaa94000000b0022cc1de1251so1104603wrc.15
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 02:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=AHGCrNU7/ujL9C1SwHjuxc6BUKJ3ExAxx/TA1i/i2Ho=;
 b=jsujGDxkbhXrLetl+uwp+/mNt0YKy3AZNz2QTJydSv3T4CtzEJuaWiKtl/39DfWmcE
 Ds6Y1CGYNZqLAEeSn1hYhDZmuti7sDhKk03OsYMjlWiAfQYvXpkiMhCvgaZzJqQoeYfC
 0I+/xoopTDc7ErexKBehoQS1KfmIbwxF2p9lIVm4uaNj/b6vyUEKi7udTk4lD4Aw7WuG
 vNDabzTEbmkWreNjwsLmD0ugxsPdchVGfc4vKb/2tdaGO+P5qpHJRK5gg6hY2aXH2eWe
 n4uVqo6jZPGPllY3dPz6I2WSzz9O1XFd0nrVyyj6eTCN6Cl/IY9dQQ7esj0HL9Fse1nB
 /a7w==
X-Gm-Message-State: ACrzQf1AXMglDOS6LmEh8bFaIbrz6Rs3PX3RiGsCIDQO00SJ8CdgkOqd
 7mcNsXVjn6df+ivs23fJfDsQJYvq9r40GJ5tviTeL6zjgVpMf674itFyqAeQMlHV3scTp5twFCU
 S4ZqgGKaKwI7VkfI=
X-Received: by 2002:a05:600c:1ca0:b0:3a8:41cf:a31f with SMTP id
 k32-20020a05600c1ca000b003a841cfa31fmr6241627wms.161.1664358927306; 
 Wed, 28 Sep 2022 02:55:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM626s5etl6k+w7Tdi9CKCXB5SAiaxhHzJ1rsxkoCgRhtOtRq6YpoGwT/nyYlR9x5u+B1CZQgg==
X-Received: by 2002:a05:600c:1ca0:b0:3a8:41cf:a31f with SMTP id
 k32-20020a05600c1ca000b003a841cfa31fmr6241616wms.161.1664358927106; 
 Wed, 28 Sep 2022 02:55:27 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de.
 [109.43.176.89]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c230300b003b4727d199asm1266136wmo.15.2022.09.28.02.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 02:55:26 -0700 (PDT)
Message-ID: <80b0cecd-b5aa-4982-0ef6-af08a93f484a@redhat.com>
Date: Wed, 28 Sep 2022 11:55:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Why we should avoid new submodules if possible
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
References: <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org>
 <654ed688-55c2-6ea5-6f02-5ba6b4454863@redhat.com>
 <20220928054730-mutt-send-email-mst@kernel.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220928054730-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 28/09/2022 11.47, Michael S. Tsirkin wrote:
> On Wed, Sep 28, 2022 at 11:33:52AM +0200, Thomas Huth wrote:
>> On 28/09/2022 11.26, Michael S. Tsirkin wrote:
>>> On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
>>>> On 28/06/2022 12.03, Michael S. Tsirkin wrote:
>>>> [...]
>>>>> For biosbits if we are going this route then I feel a submodule is much
>>>>> better.  It records which version exactly each qemu version wants.
>>>>
>>>> As far as I know, you can also specify the version when using pip, can't
>>>> you? So that's not really an advantage here.
>>>>
>>>> On the contrary, submodules have a couple of disadvantages that I really
>>>> dislike:
>>>>
>>>> - submodules do not get updated automatically when doing a "git checkout",
>>>> we have to update them via a script instead. This causes e.g. trouble if you
>>>> rsync your source tree to a machine that has no access to the internet and
>>>> you forgot to update the submodule before the sync
>>>>
>>>> - the content of submodules is not added to the tarballs that get created on
>>>> the git forges automatically. There were lots of requests from users in the
>>>> past that tried to download a tarball from github and then wondered why they
>>>> couldn't compile QEMU.
>>>>
>>>> - we include the submodule content in our release tarballs, so people get
>>>> the impression that hte submodule content is part of the QEMU sources. This
>>>> has two disadvantages:
>>>>    * We already got bug reports for the code in the submodule,
>>>>      where people did not understand that they should report that
>>>>      rather to the original project instead (i.e. you ship it - you
>>>>      own it)
>>>>    * People get the impression that QEMU is a huge monster
>>>>      application if they count the number of code lines, run
>>>>      their code scanner tools on the tarball contents, etc.
>>>>      Remember "nemu", for example, where one of the main complaints
>>>>      was that QEMU has too many lines of code?
>>>>
>>>> - If programs includes code via submodules, this gets a higher
>>>>     burder for distro maintainers, since they have to patch each
>>>>     and every package when there is a bug, instead of being able to
>>>>     fix it in one central place.
>>>>
>>>> So in my opinion we should avoid new submodules if there is an alternative.
>>>>
>>>>    Thomas
>>>
>>> So looking at the latest proposals downloading files from CI,
>>> checksumming them etc etc. No auto checkout, not added automatically
>>> either, right?
>>>
>>> This seems to be the only difference:
>>> - we include the submodule content in our release tarballs
>>>
>>> How about we just fix that? Thomas would that address your
>>> concern at least wrt tests?
>>
>> If I'm not forced to checkout that submodule,
> 
> I think the make check script can do that?

Yes, currently there are only some submodules that are always checked out: 
dtc, meson, tests/fp/berkeley-softfloat-3, tests/fp/berkeley-testfloat-3 and 
ui/keycodemapdb.
And for example the ones in the roms/ directory are not checked out by default.

  Thomas


