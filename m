Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F0537410A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 18:43:04 +0200 (CEST)
Received: from localhost ([::1]:54184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leKc3-0006BZ-KC
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 12:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKBu-00088q-5a
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leKBq-0007zF-Me
 for qemu-devel@nongnu.org; Wed, 05 May 2021 12:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620231358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OV1t8KTOgad4/BP1WZEuHKQ4dGBi81xEO3mfFQkTMu0=;
 b=RJ7Zoywyo3kNl8Is/UdUufOdkLSFKNxNtLBOKvQjeD7KMbDmPN2LdmkQxOZOXKf6SF9Wum
 4KXPTJIpjmbHGj18yeZMcfEqEUR45n3dsJTiWkNKHKep3RDMjBQ8H8/Cqgt92HyutURnSC
 WgNy/e3rWZag1iXyCJs3ueFWt60xR/U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-dzXMchjhPCKW6_IleY0ENA-1; Wed, 05 May 2021 12:15:56 -0400
X-MC-Unique: dzXMchjhPCKW6_IleY0ENA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j3-20020a1c55030000b029012e7c06101aso664657wmb.5
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 09:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OV1t8KTOgad4/BP1WZEuHKQ4dGBi81xEO3mfFQkTMu0=;
 b=ZH8/0UuXYeMZc4uGXINQQV3hLDNa64b6CDq7NEBNiXpnGuPpSBJtrrtfDrve3n4Euc
 wSDGrHknGCtSqEyyLCybJMBGo5v0yK0nJPwsMfNu5BOzoShEcPhQjl1VKNarSNtk4UJ8
 Pkenf8SmdHs7Xs+FUakE1GokYeSBv/U/l0PWK0HmO8YAWh4jeRv2sVl1O9n5sJ6kDS9b
 4reP/xOiawJ2+en+WAqINDMLfis6/USGJbJyi7KUVvp48rZqDtwfnx1rzVdRn54Dmv/R
 +IdCi9n4tpeu+I9NZ+qayeRzXVziNW6sfJgmAIdDtPxjoDPuqmZEeyzhVuO3o1qnd6/L
 7O4g==
X-Gm-Message-State: AOAM532UFDaNlMXzlwp/B12SnfkVjlGrebcWoy8gtwt2fRCiLLbPz1ml
 oEzFdgWeK/eEfw95TvcwPNa5zM1ldagSBX2kVCXoQiBaH3d1aqHX9QMhpBAuG0YBCoyTTh81TP/
 bYGL3lwr598YnRqs=
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr10882130wmm.161.1620231355183; 
 Wed, 05 May 2021 09:15:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtgQypt+pE1xau48s0E3S8F1ajMErR8jSLM2F4jWh9SteloEjHSSzQZg0hVom2z1UTl7DNnQ==
X-Received: by 2002:a05:600c:d6:: with SMTP id
 u22mr10882113wmm.161.1620231355001; 
 Wed, 05 May 2021 09:15:55 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id v21sm6380426wml.5.2021.05.05.09.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 09:15:54 -0700 (PDT)
Subject: Re: [PATCH v6 0/4] Add support for ipv6 host forwarding
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Doug Evans <dje@google.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Maxim Samoylov <max7255@yandex-team.ru>
References: <20210415033925.1290401-1-dje@google.com>
 <CADPb22SBzeHj75aaNnJKN2Ov--=MExh5CuZCYRZO7gK8A-A-Lw@mail.gmail.com>
 <CADPb22RJJHOdSqc4veQU-Gzuf4gDGsCdC6=BpL_eeprtFw-vDw@mail.gmail.com>
 <a30cdc7c-eb53-ff0f-2fb8-e3ec88a3122c@redhat.com>
Message-ID: <83448ff9-0ba1-5ff4-6718-7aefd58c02f2@redhat.com>
Date: Wed, 5 May 2021 18:15:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a30cdc7c-eb53-ff0f-2fb8-e3ec88a3122c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Well Maxim review would help too, so Cc'ing him.

On 5/5/21 6:13 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing Marc-André
> 
> On 5/5/21 5:21 PM, Doug Evans wrote:
>> Ping.
>>
>> On Wed, Apr 28, 2021 at 8:37 PM Doug Evans <dje@google.com
>> <mailto:dje@google.com>> wrote:
>>
>>     Ping.
>>
>>     On Wed, Apr 14, 2021 at 8:39 PM Doug Evans <dje@google.com
>>     <mailto:dje@google.com>> wrote:
>>
>>         This patchset takes the original patch from Maxim,
>>         https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html <https://www.mail-archive.com/qemu-devel@nongnu.org/msg569573.html>
>>         and updates it.
>>
>>         Option hostfwd is extended to support ipv6 addresses.
>>         Commands hostfwd_add, hostfwd_remove are extended as well.
>>
>>         The libslirp part of the patch has been committed upstream,
>>         and is now in qemu. See patch 1/4.
>>
>>         Changes from v5:
>>
>>         1/4 slirp: Advance libslirp submodule to current master
>>         NOTE TO REVIEWERS: It may be a better use of everyone's time if a
>>         maintainer takes on advancing QEMU's libslirp to libslirp's master.
>>         Beyond that, I really don't know what to do except submit this
>>         patch as
>>         is currently provided.
>>
>>         2/4: util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>
>>         Also split out parsing of ipv4=on|off, ipv6=on|off
>>
>>         3/4: net/slirp.c: Refactor address parsing
>>
>>         Use InetSocketAddress and getaddrinfo().
>>         Use new libslirp calls: slirp_remove_hostxfwd, slirp_add_hostxfwd.
>>
>>         4/4: net: Extend host forwarding to support IPv6
>>
>>         Recognize ipv4=,ipv6= options.
>>
>>         Note: v5's 3/5 "Recognize []:port (empty ipv6 address)" has been
>>         deleted:
>>         the churn on this patch series needs to be reduced.
>>         This change is not required, and can easily be done in a later
>>         patch.
>>
>>         Changes from v4:
>>
>>         1/5 slirp: Advance libslirp submodule to add ipv6 host-forward
>>         support
>>         NOTE TO REVIEWERS: I need some hand-holding to know what The Right
>>         way to submit this particular patch is.
>>
>>         - no change
>>
>>         2/5 util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>
>>         - move recognition of "[]:port" to separate patch
>>         - allow passing NULL for ip_v6
>>         - fix some formatting issues
>>
>>         3/5 inet_parse_host_and_addr: Recognize []:port (empty ipv6 address)
>>
>>         - new in this patchset revision
>>
>>         4/5 net/slirp.c: Refactor address parsing
>>
>>         - was 3/4 in v4
>>         - fix some formatting issues
>>
>>         5/5 net: Extend host forwarding to support IPv6
>>
>>         - was 4/4 in v4
>>         - fix some formatting issues
>>
>>         Changes from v3:
>>
>>         1/4 slirp: Advance libslirp submodule to add ipv6 host-forward
>>         support
>>
>>         - pick up latest libslirp patch to reject ipv6 addr-any for
>>         guest address
>>           - libslirp currently only provides a stateless DHCPv6 server,
>>         which means
>>             it can't know in advance what the guest's IP address is, and
>>         thus
>>             cannot do the "addr-any -> guest ip address" translation
>>         that is done
>>             for ipv4
>>
>>         2/4 util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>
>>         - this patch is new in v4
>>           - provides new utility: inet_parse_host_and_port, updates
>>         inet_parse
>>             to use it
>>
>>         3/4 net/slirp.c: Refactor address parsing
>>
>>         - this patch renamed from 2/3 to 3/4
>>         - call inet_parse_host_and_port from util/qemu-sockets.c
>>         - added tests/acceptance/hostfwd.py
>>
>>         4/4 net: Extend host forwarding to support IPv6
>>
>>         - this patch renamed from 3/3 to 4/4
>>         - ipv6 support added to existing hostfwd option, commands
>>           - instead of creating new ipv6 option, commands
>>         - added tests to tests/acceptance/hostfwd.py
>>
>>         Changes from v2:
>>         - split out libslirp commit
>>         - clarify spelling of ipv6 addresses in docs
>>         - tighten parsing of ipv6 addresses
>>
>>         Change from v1:
>>         - libslirp part is now upstream
>>         - net/slirp.c changes split into two pieces (refactor, add ipv6)
>>         - added docs
>>
>>         Doug Evans (4):
>>           slirp: Advance libslirp submodule to add ipv6 host-forward support
>>           util/qemu-sockets.c: Split host:port parsing out of inet_parse
>>           net/slirp.c: Refactor address parsing
>>           net: Extend host forwarding to support IPv6
>>
>>          hmp-commands.hx             |  18 ++-
>>          include/qemu/sockets.h      |   5 +
>>          net/slirp.c                 | 236
>>         ++++++++++++++++++++++++++----------
>>          slirp                       |   2 +-
>>          tests/acceptance/hostfwd.py | 185 ++++++++++++++++++++++++++++
>>          util/qemu-sockets.c         |  82 +++++++++----
>>          6 files changed, 436 insertions(+), 92 deletions(-)
>>          create mode 100644 tests/acceptance/hostfwd.py
>>
>>         -- 
>>         2.31.1.295.g9ea45b61b8-goog
>>
> 


