Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B58655C3B7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:48:47 +0200 (CEST)
Received: from localhost ([::1]:48084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ae5-0000XA-QD
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AY5-00057h-J1
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AY1-0001r0-K8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:42:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656420149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/csj0zcBVsD3ilK2cuRowyVOc66cEblgOPkjo+6o360=;
 b=T0SmFfakh39LahpgCZL00/vDZqnw3N7iwUE3LeowjcheuxpgmRE5l+QD1kTsVs+hbqEM+T
 SNaTTzq9PC2jxaEJJ41IBkqAhB/cvuGgRQZc0hxcVVyoMyV4JBAIvcQWYXdLfnkVZJlzs8
 J9FuyXyrw5ruS0+U12MXMH3na05o+wA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-548-4pFPz9gCPj2UVJMMJyJFzw-1; Tue, 28 Jun 2022 08:42:28 -0400
X-MC-Unique: 4pFPz9gCPj2UVJMMJyJFzw-1
Received: by mail-wm1-f70.google.com with SMTP id
 v125-20020a1cac83000000b0039c832fbd02so8818581wme.4
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/csj0zcBVsD3ilK2cuRowyVOc66cEblgOPkjo+6o360=;
 b=nd7WW4+kASRil3zEwN4AZcZhvcOrtP7HHhwbJDsrCXl7YE4cL37Ci7oxGul/4Pd1UC
 9lIi35zIZx3vR21kgf4A06OjFE+gH+tbbCOmH7RBg4hUekYYOSnkFLOLD5IYLvTpPzTq
 V8VoXK9ok4TFiRmTguGGFsctF5wB1UxQRi8fcCcbAMNYz0Ner13wm+jTLojm0NhAwWh9
 XCObqEdnIjd2Zh2qlpOFNABY5h9F9xnxsuMS7vR6bFWqvZb1APaV7cse8jt+YSBIiuj+
 zaqpe+NPCnvcyjbSaWNw8PNk3OucGlD3WYV3oM8RsPEhyRLPd7pHLPGktqetDuDSeBeH
 r7qA==
X-Gm-Message-State: AJIora9SY1XHZWAtNsvMJT21wc72CnF0wfBgiELX9dDp1Hb0CngTQ6fk
 x3MUiVGxkq1Q9PQk5I5tBHsnUa3twDUj9Wmb6sZPBR11TZizKTISOndW5WRQjhq1SW0AvcPfiPZ
 0Gq+9KAU7dTqgwi8=
X-Received: by 2002:a05:600c:5028:b0:3a0:524c:2aa2 with SMTP id
 n40-20020a05600c502800b003a0524c2aa2mr3996345wmr.66.1656420146859; 
 Tue, 28 Jun 2022 05:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2t0lQHEHKCIlS69WiiYcEMTczKiq3VrACcj1FaPnylBlxLfXewj8GiRqgf4gZycU1kZ26Iw==
X-Received: by 2002:a05:600c:5028:b0:3a0:524c:2aa2 with SMTP id
 n40-20020a05600c502800b003a0524c2aa2mr3996321wmr.66.1656420146641; 
 Tue, 28 Jun 2022 05:42:26 -0700 (PDT)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a5d54ca000000b0021b85664636sm13386881wrv.16.2022.06.28.05.42.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 05:42:26 -0700 (PDT)
Message-ID: <eb7f19e8-d530-c1e5-fa2d-c34969ee6f58@redhat.com>
Date: Tue, 28 Jun 2022 14:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
References: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
 <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
 <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgwyLbVFCKJZXwdwwweVxgmG8VX1wc1bBYEaNpvKiPcU+TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 28/06/2022 14.36, Ani Sinha wrote:
> On Tue, Jun 28, 2022 at 5:40 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Tue, 28 Jun 2022 at 12:50, Michael S. Tsirkin <mst@redhat.com> wrote:
>>> I think the main difference is not even in how it works, it's
>>> in what it does. Which is check that ACPI tables are sane.
>>> Who cares about that? Well developers do when they change the
>>> tables. Users really don't because for users we have the expected
>>> tables in tree and we check against these.
>>
>> It wants to build and run a big guest binary blob -- that to me is
>> the main difference. Users don't much care about any of our tests,
> 
> perhaps but we do enforce patch submitters to make sure make check
> passes before submitting patches. make check-avocado is not run as
> part of make check, requires considerable disk space to download all
> guest images and hence generally not run by patch submitters. Making
> bits parts of avocado tests almost defeats the purpose of having this
> test at all.
You can define sane subsets of the avocado tests by using tags. For example, 
as I'm one of the s390x maintainers, I'm also only running the tests that 
are tagged with tags=arch:s390x there. You could simply introduce an "acpi" 
tag for your tests, too.

  Thomas


