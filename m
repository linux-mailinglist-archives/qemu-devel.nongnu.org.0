Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF164AE2B3
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 21:57:10 +0100 (CET)
Received: from localhost ([::1]:58020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHXXx-0003JG-AC
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 15:57:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHWXS-0000QC-Ti
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 14:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHWXO-0003WT-UC
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 14:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644349949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PHrNHX8nETxnxf4k09oyasyNKsFM49x96FcmHxImSYM=;
 b=XAeY5pp7+CpRaipm5gm0Tk3g0KVhkZYlf/JBDxuTOhDCfi6SyZwAg1novHfngFUkWOsH1C
 0j5RVnKDIXTy7vp/n1PSwqmrGaAzFkKZ6FjtsS7QoGYEotWPczWJWkkhT/X37rKIkQZmAA
 ID8QvAZ0HS9i9escmWwgONg7rNcTlDs=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-5KLrwkxTMJagkXr5Ne2ePA-1; Tue, 08 Feb 2022 14:52:28 -0500
X-MC-Unique: 5KLrwkxTMJagkXr5Ne2ePA-1
Received: by mail-vk1-f197.google.com with SMTP id
 d13-20020a05612212cd00b00320d929c3c3so2385056vkp.16
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 11:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PHrNHX8nETxnxf4k09oyasyNKsFM49x96FcmHxImSYM=;
 b=ZpFdaqyLhUB0e23uZUoG3px+SFuX2AyTtmis5fmq4VhqGE6l2AulRb2LKOVCmGioi5
 /BH1wUR43qAxSL4eTkziIHNnqEM5KaHQnS9lKtRpOFWhE2wyF4t9Zlp/5eJVHXPVSGYx
 5rG16WsKutPVvCHSjRF/N2nvFeRFHv6MSijsHMRNKK4ems22r+ygbc41VaoCeFX5dp66
 0X/VTMIFc64I9fpZITdijwTC10tNhBxND+oDsYuqPhKY0u+wz0b7lSRO7SJdX5sGsj0t
 B+KCW89thKjRly8oh3bI6PRnwiqO4YsAFKhxumpXKixH3C41KkcfI9Ike9YMc3Q1xNTw
 thfg==
X-Gm-Message-State: AOAM530Oq1nf2g38B3KvgZCb6GLViNGcwO6ltUMY3ecVuTLoqY/j4IoT
 u45I8I1JfQ7PTQb3f8qRN+VGibgh05zyiU/fXIJ46gdgOHkP1rTHCn/QtFQijdfoy2t8HjCyBKE
 PLBrQmf8AP5cBEv51vnkw0taGaAUcbuQ=
X-Received: by 2002:a67:e901:: with SMTP id c1mr2087597vso.38.1644349947526;
 Tue, 08 Feb 2022 11:52:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyiHJa/E37Nx/KTbmx3MVjicfAhzRtWqpd9AqEdT2Zq8Sjg0/BIM8+JZzAMIEfq7IOmilA5V3R7IXP/xFLZqww=
X-Received: by 2002:a67:e901:: with SMTP id c1mr2087586vso.38.1644349947268;
 Tue, 08 Feb 2022 11:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20220203022405.1336635-1-jsnow@redhat.com>
In-Reply-To: <20220203022405.1336635-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 8 Feb 2022 14:52:16 -0500
Message-ID: <CAFn=p-bL4XoZMajFffM9LKtFZBKj8W=x2qMQAiewSxLJAP7Qfw@mail.gmail.com>
Subject: Re: [PATCH 0/4] iotests: finalize switch to async QMP
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Squeak Squeak...

...Any objections to me staging this?

(This patchset removes the accommodations in iotests for allowing
either library to run and always forces the new one. Point of no
return for iotests.)

--js

On Wed, Feb 2, 2022 at 9:24 PM John Snow <jsnow@redhat.com> wrote:
>
> Based-on: <20220203015946.1330386-1-jsnow@redhat.com>
>           [PULL 0/4] Python patches
> GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-qmp-legacy-switch-pt1b
>
> This tiny series is a spiritual v4 to:
> "[PATCH v3 00/31] Python: delete synchronous qemu.qmp package".
>
> I've isolated just the bits that touch iotests, and that's these four
> patches. If this series is approved, I'll send the series that renames
> "qemu.aqmp" to "qemu.qmp" separately. That series has a lot of churn,
> but it doesn't meaningfully alter anything -- so I'll avoid cluttering
> up qemu-block list with those.
>
> (Just be aware that I plan to finalize the switch soon!)
>
> John Snow (4):
>   python/machine: permanently switch to AQMP
>   scripts/bench-block-job: switch to AQMP
>   iotests/mirror-top-perms: switch to AQMP
>   iotests: switch to AQMP
>
>  python/qemu/machine/machine.py            | 18 +++++++-----------
>  python/qemu/machine/qtest.py              |  2 +-
>  scripts/simplebench/bench_block_job.py    |  3 +--
>  tests/qemu-iotests/iotests.py             |  2 +-
>  tests/qemu-iotests/tests/mirror-top-perms |  9 +++------
>  5 files changed, 13 insertions(+), 21 deletions(-)
>
> --
> 2.31.1


