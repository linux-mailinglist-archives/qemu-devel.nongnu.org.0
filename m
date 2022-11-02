Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7BA616365
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 14:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqDDE-0006e9-IS; Wed, 02 Nov 2022 08:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqDDC-0006e2-Lb
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:51:18 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqDDA-0005pd-E8
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 08:51:18 -0400
Received: by mail-io1-xd36.google.com with SMTP id l127so14896063iof.12
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j/TCNc4wYtXTiUOjtRbxzkK+oQWT/rVs/s+MetEBVQA=;
 b=oRbYKEjNgfH6XwtUz5dY/l3aScnQu90bwhBtjGbSqnvxbDEQdcs/8wgmTkpXmUPS8+
 BbZzRwNwo0IMZrE8NkIECJvMuzg49+6lkuPiDxfYpFtxzTrzgnJhYWsEsxbwqeUavYsp
 V6TT+Ku99rRSGwFyOP9fQOgVU+UICr4k2yOZisW3Xv/4YJuz09vgwJYlKRg34lkcLD60
 hYJ0t52+s6/Q0mAxNMAVs1LTbJ7RxkCnxUPedPf0SRqTMzSghfo661S72RL9Me1dTTJg
 A+fIK1cs/IxfWhQfU0jokz/dXt03WR2shLLn8TI3mh0It8qD8UrQBajO+99O9WKR4/tz
 XBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j/TCNc4wYtXTiUOjtRbxzkK+oQWT/rVs/s+MetEBVQA=;
 b=B9mJ7k9ECZ0gQ8GO6yUZZP1m6sUlkq9NZDJCkwHP+NGyu4nx1RrrbyXaPVbIqmvhHH
 id6DfaoibdbhKELS52EhP26HLPPqaF1V8xsO2AKfg6cZNT08SAtUm+4sEAJDUIQm5Ykb
 +IytlZ30u7AJUxNsTXgnpRow/v9GdlSUOpZo0/rZ2QYjRvIQ9SQ9x/w+dkcd8Fwb0eOc
 WlvXdJrDakikLHqnyoLsR306A5VCiWGajzEmBfuc4l3fHmQHiufdye1hSrnlAtQaSZvH
 C2a3xHfyvAdg4qIrbehV14c7p8CZNgv/sh364VRt30b+fFiGeGCxm/cC9P+ONHNN19LX
 j23Q==
X-Gm-Message-State: ACrzQf2x2DHfFJiFlBNiokDhQJZ/DMjsBseUFjE+iWBMiUYMO/Jj8BQH
 +577wXHLFAexEXhNHNPCE9+p2naDgQjBUuhdf1Gitg==
X-Google-Smtp-Source: AMsMyM7DSirigSBb/eiMfClH4lhx5VJiG0po1HHEP5grsnbaFJJQyxv7Wz8GqOstQGZDEShWufxPFQpMxbB3UCWDef0=
X-Received: by 2002:a05:6638:12cf:b0:375:2799:7bf6 with SMTP id
 v15-20020a05663812cf00b0037527997bf6mr16507889jas.309.1667393474994; Wed, 02
 Nov 2022 05:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221031124928.128475-1-mst@redhat.com>
 <20221031124928.128475-22-mst@redhat.com>
 <20221101135221.00000a4a@huawei.com>
 <CAARzgwwQw0wqBiSq03mh0uMkQw+HeYUZnBf18sbZ_WBBzoyR2w@mail.gmail.com>
In-Reply-To: <CAARzgwwQw0wqBiSq03mh0uMkQw+HeYUZnBf18sbZ_WBBzoyR2w@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 2 Nov 2022 18:21:04 +0530
Message-ID: <CAARzgwwzreQpJ5Ahr_7HVPmeTwBfJMFGjwrvEu3k2AZyNYDwQw@mail.gmail.com>
Subject: Re: [PULL 21/86] bios-tables-test: add test for number of cores > 255
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Julia Suvorova <jusual@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 1, 2022 at 7:25 PM Ani Sinha <ani@anisinha.ca> wrote:
>
>
>
> On Tue, Nov 1, 2022 at 19:22 Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
>>
>> On Mon, 31 Oct 2022 08:51:44 -0400
>> "Michael S. Tsirkin" <mst@redhat.com> wrote:
>>
>> > From: Julia Suvorova <jusual@redhat.com>
>> >
>> > The new test is run with a large number of cpus and checks if the
>> > core_count field in smbios_cpu_test (structure type 4) is correct.
>> >
>> > Choose q35 as it allows to run with -smp > 255.
>>
>> Getting a failure on this on i386.
>>
>> qemu-system-i386: current -smp configuration requires kernel irqchip and X2APIC API support.
>>
>> Note that was on bisection of this pull request applied to current mainline
>> (also in the CI report for the HMAT set - though there is another issue there.)
>
>
> Can you point me to the CI report?

To answer my own question:
https://gitlab.com/qemu-project/qemu/-/jobs/3253817453 Also
interesting to see all kinds of cross build and test configs :-)

