Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83C1FD34F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 19:19:50 +0200 (CEST)
Received: from localhost ([::1]:38410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlbj3-0001mP-IN
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 13:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlbhd-0000oP-PU
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 13:18:21 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55397
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jlbhb-0002ZS-Kv
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 13:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592414299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/4s+KMLjPKl04oe//sCwCoYlXg/y+lC+n2CkmOvRm34=;
 b=GBeNTs+7gK6Sgci9vBQgH1thUfYBM3EjaJnPqNBD2i0IeO4AwL3/pEvsDfBOZSUK6H6qYP
 lHSMYmj72pqlJg94RNlMjRvjHG0nBkPQD8D6N6C1nZyhquGZ3C/IQdAFSi1rlz+xrOAhM0
 a/D7Qm0zOT+4RTiekWvp7CV6VBdJCW4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-lpt7BAn2MQiGlcFixWSWzQ-1; Wed, 17 Jun 2020 13:18:14 -0400
X-MC-Unique: lpt7BAn2MQiGlcFixWSWzQ-1
Received: by mail-ej1-f70.google.com with SMTP id z21so1426425ejl.6
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 10:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/4s+KMLjPKl04oe//sCwCoYlXg/y+lC+n2CkmOvRm34=;
 b=GzUClFyjJMPwWkDJTTxZloO9eEqM9d/ORwWF2QvHs4nauIoc/KPt/ZCvi8Dpc5TmqL
 WqWkK3qoJ6on3Fv+sukTXLZ+D7KhvO3LjJhu+UG++Ox63GxQ/aZ0GdGIgzkAjfibr+FR
 zuPxFlgWaHNN6k6pNc+nQQVxTxzOAYiOFTDu9z/+jiYs5L6RM1OdKfNQbxSGXbAvJ54i
 Kv2ExSGbf19/0+UqjR8luxv0Hsh3U/6mDl46FFFJB2pDwr0C9iHIAW72dGGL+45r7BvG
 rQ1fTIO+oFEiMdpUwJZDmlsZ4wJGqz54Sagas5q0s4Q8kj+mU3WyqZbXnQSvw2qkTgOC
 tOKA==
X-Gm-Message-State: AOAM530wfDt19HmtFTL7ZIIz3ZLXMzwCl0KkzzWZLfulGAjyqzbus60j
 OT6LOuciMR417xdtDK9VhfB3fV2Kg6m6LbdmQeq1LdUYt4xWweb+OUJnlKs/h2oXuvM05iOIQ5v
 ajHe22bp6DUEXCls=
X-Received: by 2002:a05:6402:1d89:: with SMTP id
 dk9mr159487edb.275.1592414291612; 
 Wed, 17 Jun 2020 10:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm9ayRReM1bxBSfS9z67Ucsqs9yZDvDR2+RYc16OAVmsE8XgJWccQXtVSM/+ib/Qul+vgZ/g==
X-Received: by 2002:a05:6402:1d89:: with SMTP id
 dk9mr159473edb.275.1592414291428; 
 Wed, 17 Jun 2020 10:18:11 -0700 (PDT)
Received: from [192.168.1.38] (93.red-83-59-160.dynamicip.rima-tde.net.
 [83.59.160.93])
 by smtp.gmail.com with ESMTPSA id f5sm179417edv.36.2020.06.17.10.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2020 10:18:10 -0700 (PDT)
Subject: Re: [PATCH v3 00/16] python: add mypy support to python/qemu
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20200604202236.25039-1-jsnow@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <47c9dce0-2dca-e73a-8a33-40938a4da44b@redhat.com>
Date: Wed, 17 Jun 2020 19:18:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200604202236.25039-1-jsnow@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/17 02:02:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/20 10:22 PM, John Snow wrote:
> Based-on: 20200604195252.20739-1-jsnow@redhat.com
> 
> This series is extracted from my larger series that attempted to bundle
> our python module as an installable module. These fixes don't require that,
> so they are being sent first as I think there's less up for debate in here.
> 
[...]
> 
> John Snow (16):
>   python/qmp.py: Define common types
>   iotests.py: use qemu.qmp type aliases
>   python/qmp.py: re-absorb MonitorResponseError
>   python/qmp.py: Do not return None from cmd_obj
>   python/qmp.py: add casts to JSON deserialization
>   python/qmp.py: add QMPProtocolError
>   python/machine.py: Fix monitor address typing
>   python/machine.py: reorder __init__
>   python/machine.py: Don't modify state in _base_args()
>   python/machine.py: Handle None events in events_wait
>   python/machine.py: use qmp.command
>   python/machine.py: Add _qmp access shim
>   python/machine.py: fix _popen access
>   python/qemu: make 'args' style arguments immutable
>   iotests.py: Adjust HMP kwargs typing
>   python/qemu: Add mypy type annotations
> 
>  python/qemu/accel.py          |   8 +-
>  python/qemu/machine.py        | 286 ++++++++++++++++++++--------------
>  python/qemu/qmp.py            | 111 +++++++++----
>  python/qemu/qtest.py          |  53 ++++---
>  scripts/render_block_graph.py |   7 +-
>  tests/qemu-iotests/iotests.py |  11 +-
>  6 files changed, 298 insertions(+), 178 deletions(-)
> 

Thanks, applied to my python-next tree:
https://gitlab.com/philmd/qemu/commits/python-next


