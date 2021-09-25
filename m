Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C225A41852D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 01:23:31 +0200 (CEST)
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUH10-0007oe-Cs
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 19:23:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+e64d73.54b2c1-qemu-devel=nongnu.org@ngai.me>)
 id 1mUGzq-00073I-Cm
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 19:22:18 -0400
Received: from m228-4.mailgun.net ([159.135.228.4]:39608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+e64d73.54b2c1-qemu-devel=nongnu.org@ngai.me>)
 id 1mUGzn-0008LB-MW
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 19:22:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=ngai.me; q=dns/txt;
 s=mx; 
 t=1632612136; h=Content-Transfer-Encoding: Content-Type: In-Reply-To:
 MIME-Version: Date: Message-ID: From: References: Cc: To: Subject:
 Sender; bh=VD2qxq9CIzuA8T5qQcBnoRgmdVVhrxjyzZoH0izvKyg=;
 b=UlK+pXG3ciw4xWIF7o5BP25HMvHmlPkXpTtaH/0lMkTwbw8oYmX+PKg/VmXTgUbM+/4gUpb+
 Whv8Joj6xsiIDUwRdB7WhP5tLx/7GOM6tibXeizas9Ii9uceBXlFhSJ1H3D8/U+kQLYOLPdL
 37hVhQzbMr01dtEpUh68uH0dvEC22ke3UbYH9KtD+thiHLqZqpobdM+5VkICruIGOMkImxGA
 2hc/zkfQs8nry/XCceIL2LTLfBzF9Hu5Gc+1xqGxyLKHzZUuJuyqB12moCj+NZNwEIiYU3OF
 R2msEulHu3IjmNURqxyRu+6yuRhRYcJPD54wSkjNfmg8cK1nfaiX3A==
X-Mailgun-Sending-Ip: 159.135.228.4
X-Mailgun-Sid: WyJmZTU1MyIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiNTRiMmMxIl0=
Received: from mail.pedantry.org (30.111.83.34.bc.googleusercontent.com
 [34.83.111.30]) by smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 614faf1c3cc3a01f26d1b767 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sat, 25 Sep 2021 23:22:04 GMT
Received: from MacBook-N.local (unknown [185.202.221.174])
 by mail.pedantry.org (Postfix) with ESMTPSA id 05CABA081A;
 Sat, 25 Sep 2021 23:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ngai.me; s=mail;
 t=1632612124; bh=VD2qxq9CIzuA8T5qQcBnoRgmdVVhrxjyzZoH0izvKyg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CMN+ioAz7t9RsN//834bp6gRj2Jc15mCSJOqwGZBdp5nlnegdY+PawMFUgxAb4mZJ
 V211WCEMC/3AGFRK8ezSA/QDVTVzKlxwUO0kQXxcNpKZ/ihArPu5tb9lhOuj9VJwKw
 Fn9R8S4bYFto3m7yyidu+F37Baxe2VwhZ+EmAl3oAq2/YALSxVvsyfENqQMwbDJXY5
 0sDlur7WlcnZu9NPO4/DemfS3PcKLNzbuPpMArlyn/BuUDoC+2trwONKS2CJvZhvD9
 vCzs073XAMAIntNnFxqh9EFBjJlYaZEif14KS9bOBw4WjCDxBcW2F1r6fLyzzJSrYt
 zN4wdB/QRBSzQ==
Subject: Re: [PATCH] net/slirp: Use newer slirp_*_hostxfwd API
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>
References: <20210925214820.18078-1-nicholas@ngai.me>
From: Nicholas Ngai <nicholas@ngai.me>
Message-ID: <8143f015-056c-6362-2d3e-7fed66aaffe7@ngai.me>
Date: Sat, 25 Sep 2021 16:22:02 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210925214820.18078-1-nicholas@ngai.me>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=159.135.228.4;
 envelope-from=bounce+e64d73.54b2c1-qemu-devel=nongnu.org@ngai.me;
 helo=m228-4.mailgun.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Sorry for the duplicate email. The cc’s for the maintainers on the email 
didn’t go through the first time.

Nicholas Ngai

On 9/25/21 2:48 PM, Nicholas Ngai wrote:
> libslirp provides a newer slirp_*_hostxfwd API meant for
> address-agnostic forwarding instead of the is_udp parameter which is
> limited to just TCP/UDP.
>
> Signed-off-by: Nicholas Ngai <nicholas@ngai.me>
> ---
>   net/slirp.c | 64 +++++++++++++++++++++++++++++++++++------------------
>   1 file changed, 42 insertions(+), 22 deletions(-)
>
> diff --git a/net/slirp.c b/net/slirp.c
> index ad3a838e0b..49ae01a2f0 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -643,12 +643,17 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
>   
>   void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>   {
> -    struct in_addr host_addr = { .s_addr = INADDR_ANY };
> -    int host_port;
> +    struct sockaddr_in host_addr = {
> +        .sin_family = AF_INET,
> +        .sin_addr = {
> +            .s_addr = INADDR_ANY,
> +        },
> +    };
> +    int port;
> +    int flags = 0;
>       char buf[256];
>       const char *src_str, *p;
>       SlirpState *s;
> -    int is_udp = 0;
>       int err;
>       const char *arg1 = qdict_get_str(qdict, "arg1");
>       const char *arg2 = qdict_get_try_str(qdict, "arg2");
> @@ -670,9 +675,9 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>       }
>   
>       if (!strcmp(buf, "tcp") || buf[0] == '\0') {
> -        is_udp = 0;
> +        /* Do nothing; already TCP. */
>       } else if (!strcmp(buf, "udp")) {
> -        is_udp = 1;
> +        flags |= SLIRP_HOSTFWD_UDP;
>       } else {
>           goto fail_syntax;
>       }
> @@ -680,15 +685,17 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>       if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
>           goto fail_syntax;
>       }
> -    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
> +    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
>           goto fail_syntax;
>       }
>   
> -    if (qemu_strtoi(p, NULL, 10, &host_port)) {
> +    if (qemu_strtoi(p, NULL, 10, &port)) {
>           goto fail_syntax;
>       }
> +    host_addr.sin_port = htons(port);
>   
> -    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
> +    err = slirp_remove_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
> +            sizeof(host_addr), flags);
>   
>       monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
>                      err ? "not found" : "removed");
> @@ -700,12 +707,22 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
>   
>   static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>   {
> -    struct in_addr host_addr = { .s_addr = INADDR_ANY };
> -    struct in_addr guest_addr = { .s_addr = 0 };
> -    int host_port, guest_port;
> +    struct sockaddr_in host_addr = {
> +        .sin_family = AF_INET,
> +        .sin_addr = {
> +            .s_addr = INADDR_ANY,
> +        },
> +    };
> +    struct sockaddr_in guest_addr = {
> +        .sin_family = AF_INET,
> +        .sin_addr = {
> +            .s_addr = 0,
> +        },
> +    };
> +    int flags = 0;
> +    int port;
>       const char *p;
>       char buf[256];
> -    int is_udp;
>       char *end;
>       const char *fail_reason = "Unknown reason";
>   
> @@ -715,9 +732,9 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>           goto fail_syntax;
>       }
>       if (!strcmp(buf, "tcp") || buf[0] == '\0') {
> -        is_udp = 0;
> +        /* Do nothing; already TCP. */
>       } else if (!strcmp(buf, "udp")) {
> -        is_udp = 1;
> +        flags |= SLIRP_HOSTFWD_UDP;
>       } else {
>           fail_reason = "Bad protocol name";
>           goto fail_syntax;
> @@ -727,7 +744,7 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>           fail_reason = "Missing : separator";
>           goto fail_syntax;
>       }
> -    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
> +    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
>           fail_reason = "Bad host address";
>           goto fail_syntax;
>       }
> @@ -736,29 +753,32 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
>           fail_reason = "Bad host port separator";
>           goto fail_syntax;
>       }
> -    host_port = strtol(buf, &end, 0);
> -    if (*end != '\0' || host_port < 0 || host_port > 65535) {
> +    port = strtol(buf, &end, 0);
> +    if (*end != '\0' || port < 0 || port > 65535) {
>           fail_reason = "Bad host port";
>           goto fail_syntax;
>       }
> +    host_addr.sin_port = htons(port);
>   
>       if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
>           fail_reason = "Missing guest address";
>           goto fail_syntax;
>       }
> -    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
> +    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr.sin_addr)) {
>           fail_reason = "Bad guest address";
>           goto fail_syntax;
>       }
>   
> -    guest_port = strtol(p, &end, 0);
> -    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
> +    port = strtol(p, &end, 0);
> +    if (*end != '\0' || port < 1 || port > 65535) {
>           fail_reason = "Bad guest port";
>           goto fail_syntax;
>       }
> +    guest_addr.sin_port = htons(port);
>   
> -    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
> -                          guest_port) < 0) {
> +    if (slirp_add_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
> +                           sizeof(host_addr), (struct sockaddr *) &guest_addr,
> +                           sizeof(guest_addr), flags) < 0) {
>           error_setg(errp, "Could not set up host forwarding rule '%s'",
>                      redir_str);
>           return -1;


