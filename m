Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CB4E4AB2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 03:00:59 +0100 (CET)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWqIz-0007uX-EJ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 22:00:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+e64d73.54b2c1-qemu-devel=nongnu.org@ngai.me>)
 id 1nWqH5-0006WR-1n
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:58:59 -0400
Received: from a3.mail.mailgun.net ([198.61.254.62]:18111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+e64d73.54b2c1-qemu-devel=nongnu.org@ngai.me>)
 id 1nWqH3-000608-1Y
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 21:58:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=ngai.me; q=dns/txt;
 s=mx; 
 t=1648000720; h=Content-Transfer-Encoding: Content-Type: In-Reply-To:
 From: From: References: Cc: To: To: Subject: Subject: MIME-Version:
 Date: Message-ID: Sender: Sender;
 bh=eUhA12LIM67QsdImzIscB+vvx9KZIQWUdch1MiGfTGQ=;
 b=F8lib2r26HzPmgd4XROREWPItOqu548TXgBa2rBqtV4V+K+f/EHgzg/BY2lPoYstJvjcsLoz
 I9Z3MWsujmUWsNnWj2vwd/Wu3cKV4Dtd7J0gEkiFpy4Cg9jDgMEfukvTrzP5vly/hc3kApGs
 20F2z5NXEPmgz2aLBFWYEkBCo5NbdOZi9Nw5YIuTsuJ7mdlZIVVWkQ2GWQXkvWmiJ9r3YalU
 jrH9m6mCeJlNTorA/DzDgaq0yHDAKJR/0XbgJPIGB7lnb4LXwnyKm1YgkJTQ62E6HxK3K5TB
 2ypSqNrf/IyeDUc5kfysJqOxwx45Hwlf7wO0ZzthXqdA3GJkAbgaIA==
X-Mailgun-Sending-Ip: 198.61.254.62
X-Mailgun-Sid: WyJmZTU1MyIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiNTRiMmMxIl0=
Received: from mail.pedantry.org (30.111.83.34.bc.googleusercontent.com
 [34.83.111.30]) by smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 623a7ecf07b42f471c39a675 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 23 Mar 2022 01:58:39 GMT
Received: from [10.8.0.2] (unknown [192.145.118.196])
 by mail.pedantry.org (Postfix) with ESMTPSA id 8A6E9A0515;
 Tue, 22 Mar 2022 18:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ngai.me; s=mail;
 t=1648000717; bh=eUhA12LIM67QsdImzIscB+vvx9KZIQWUdch1MiGfTGQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SL+9g9BWkPQzSZkZm0CvAf3GWiRC04MHhHPZTZF4JG+2XBim3RcfhxRePKJM8w/vg
 Z7f9eSs2AUqpVKMU2z3pKKwEASz3cwt0v2dOPkd0X3X5LKrw7KDIXIHloCrDSBy1Vz
 9+B+wjVFDJ0XUa+7uzRIey00zEpOkAZy0Kpgm8G2Wyy1GA/QCrNNsrMKjT5+sLptYv
 hWW/mOXnYLNOm4OXs4fwfFHsRS9Y7rPGkoKPc34nLW/rqduBYijVunu+aj9HsaHg4/
 kyGW4cB/dVmAxoN5qhJoj+iGyuwkSR+J8Xvvi91vzt0fDQeTKT+hL4iWWNUUuldShF
 IpvduBSjkRP2Q==
Message-ID: <807f262d-bc28-865f-dda5-2e503f5ebf31@ngai.me>
Date: Tue, 22 Mar 2022 18:58:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] net/slirp: Use newer slirp_*_hostxfwd API
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@gnu.org>, Jason Wang <jasowang@redhat.com>
References: <20210925214820.18078-1-nicholas@ngai.me>
 <8143f015-056c-6362-2d3e-7fed66aaffe7@ngai.me>
 <20211005235613.kuwbfixvp74sv5en@begin>
From: Nicholas Ngai <nicholas@ngai.me>
In-Reply-To: <20211005235613.kuwbfixvp74sv5en@begin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.61.254.62;
 envelope-from=bounce+e64d73.54b2c1-qemu-devel=nongnu.org@ngai.me;
 helo=a3.mail.mailgun.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Pinging this. It’s a bit old, though the patch still applies cleanly to 
master as far as I can tell.

Link to patchew is 
https://patchew.org/QEMU/20210925214820.18078-1-nicholas@ngai.me/.

I’d love to get https://gitlab.com/qemu-project/qemu/-/issues/347 
addressed once libslirp makes a release with added Unix-to-TCP support 
in the hostxfwd API, but this patch is a requirement for that first.

Thanks!

Nicholas Ngai

On 10/5/21 4:56 PM, Samuel Thibault wrote:
> Nicholas Ngai, le sam. 25 sept. 2021 16:22:02 -0700, a ecrit:
>> Sorry for the duplicate email. The cc’s for the maintainers on the email
>> didn’t go through the first time.
>>
>> Nicholas Ngai
>>
>> On 9/25/21 2:48 PM, Nicholas Ngai wrote:
>>> libslirp provides a newer slirp_*_hostxfwd API meant for
>>> address-agnostic forwarding instead of the is_udp parameter which is
>>> limited to just TCP/UDP.
>>>
>>> Signed-off-by: Nicholas Ngai <nicholas@ngai.me>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
>
>>> ---
>>>    net/slirp.c | 64 +++++++++++++++++++++++++++++++++++------------------
>>>    1 file changed, 42 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/net/slirp.c b/net/slirp.c
>>> index ad3a838e0b..49ae01a2f0 100644
>>> --- a/net/slirp.c
>>> +++ b/net/slirp.c
>>> @@ -643,12 +643,17 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
>>>    void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>>>    {
>>> -    struct in_addr host_addr = { .s_addr = INADDR_ANY };
>>> -    int host_port;
>>> +    struct sockaddr_in host_addr = {
>>> +        .sin_family = AF_INET,
>>> +        .sin_addr = {
>>> +            .s_addr = INADDR_ANY,
>>> +        },
>>> +    };
>>> +    int port;
>>> +    int flags = 0;
>>>        char buf[256];
>>>        const char *src_str, *p;
>>>        SlirpState *s;
>>> -    int is_udp = 0;
>>>        int err;
>>>        const char *arg1 = qdict_get_str(qdict, "arg1");
>>>        const char *arg2 = qdict_get_try_str(qdict, "arg2");
>>> @@ -670,9 +675,9 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>>>        }
>>>        if (!strcmp(buf, "tcp") || buf[0] == '\0') {
>>> -        is_udp = 0;
>>> +        /* Do nothing; already TCP. */
>>>        } else if (!strcmp(buf, "udp")) {
>>> -        is_udp = 1;
>>> +        flags |= SLIRP_HOSTFWD_UDP;
>>>        } else {
>>>            goto fail_syntax;
>>>        }
>>> @@ -680,15 +685,17 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>>>        if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
>>>            goto fail_syntax;
>>>        }
>>> -    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
>>> +    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
>>>            goto fail_syntax;
>>>        }
>>> -    if (qemu_strtoi(p, NULL, 10, &host_port)) {
>>> +    if (qemu_strtoi(p, NULL, 10, &port)) {
>>>            goto fail_syntax;
>>>        }
>>> +    host_addr.sin_port = htons(port);
>>> -    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
>>> +    err = slirp_remove_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
>>> +            sizeof(host_addr), flags);
>>>        monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
>>>                       err ? "not found" : "removed");
>>> @@ -700,12 +707,22 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>>>    static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>>>    {
>>> -    struct in_addr host_addr = { .s_addr = INADDR_ANY };
>>> -    struct in_addr guest_addr = { .s_addr = 0 };
>>> -    int host_port, guest_port;
>>> +    struct sockaddr_in host_addr = {
>>> +        .sin_family = AF_INET,
>>> +        .sin_addr = {
>>> +            .s_addr = INADDR_ANY,
>>> +        },
>>> +    };
>>> +    struct sockaddr_in guest_addr = {
>>> +        .sin_family = AF_INET,
>>> +        .sin_addr = {
>>> +            .s_addr = 0,
>>> +        },
>>> +    };
>>> +    int flags = 0;
>>> +    int port;
>>>        const char *p;
>>>        char buf[256];
>>> -    int is_udp;
>>>        char *end;
>>>        const char *fail_reason = "Unknown reason";
>>> @@ -715,9 +732,9 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>>>            goto fail_syntax;
>>>        }
>>>        if (!strcmp(buf, "tcp") || buf[0] == '\0') {
>>> -        is_udp = 0;
>>> +        /* Do nothing; already TCP. */
>>>        } else if (!strcmp(buf, "udp")) {
>>> -        is_udp = 1;
>>> +        flags |= SLIRP_HOSTFWD_UDP;
>>>        } else {
>>>            fail_reason = "Bad protocol name";
>>>            goto fail_syntax;
>>> @@ -727,7 +744,7 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>>>            fail_reason = "Missing : separator";
>>>            goto fail_syntax;
>>>        }
>>> -    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
>>> +    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
>>>            fail_reason = "Bad host address";
>>>            goto fail_syntax;
>>>        }
>>> @@ -736,29 +753,32 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>>>            fail_reason = "Bad host port separator";
>>>            goto fail_syntax;
>>>        }
>>> -    host_port = strtol(buf, &end, 0);
>>> -    if (*end != '\0' || host_port < 0 || host_port > 65535) {
>>> +    port = strtol(buf, &end, 0);
>>> +    if (*end != '\0' || port < 0 || port > 65535) {
>>>            fail_reason = "Bad host port";
>>>            goto fail_syntax;
>>>        }
>>> +    host_addr.sin_port = htons(port);
>>>        if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
>>>            fail_reason = "Missing guest address";
>>>            goto fail_syntax;
>>>        }
>>> -    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
>>> +    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr.sin_addr)) {
>>>            fail_reason = "Bad guest address";
>>>            goto fail_syntax;
>>>        }
>>> -    guest_port = strtol(p, &end, 0);
>>> -    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
>>> +    port = strtol(p, &end, 0);
>>> +    if (*end != '\0' || port < 1 || port > 65535) {
>>>            fail_reason = "Bad guest port";
>>>            goto fail_syntax;
>>>        }
>>> +    guest_addr.sin_port = htons(port);
>>> -    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
>>> -                          guest_port) < 0) {
>>> +    if (slirp_add_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
>>> +                           sizeof(host_addr), (struct sockaddr *) &guest_addr,
>>> +                           sizeof(guest_addr), flags) < 0) {
>>>            error_setg(errp, "Could not set up host forwarding rule '%s'",
>>>                       redir_str);
>>>            return -1;


