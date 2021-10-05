Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BA14234B9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 02:01:03 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXuMn-00078l-O3
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 20:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1mXuKR-0006Do-Ka
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 19:58:35 -0400
Received: from hera.aquilenet.fr ([2a0c:e300::1]:49748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1mXuKP-000284-QQ
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 19:58:35 -0400
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 9A6A8362;
 Wed,  6 Oct 2021 01:58:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6f_ZCyCjiO2Z; Wed,  6 Oct 2021 01:58:28 +0200 (CEST)
Received: from begin (acaen-652-1-186-147.w86-215.abo.wanadoo.fr
 [86.215.106.147])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id D34459E;
 Wed,  6 Oct 2021 01:58:27 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1mXuI9-00GfDj-NU;
 Wed, 06 Oct 2021 01:56:14 +0200
Date: Wed, 6 Oct 2021 01:56:13 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Nicholas Ngai <nicholas@ngai.me>
Subject: Re: [PATCH] net/slirp: Use newer slirp_*_hostxfwd API
Message-ID: <20211005235613.kuwbfixvp74sv5en@begin>
References: <20210925214820.18078-1-nicholas@ngai.me>
 <8143f015-056c-6362-2d3e-7fed66aaffe7@ngai.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8143f015-056c-6362-2d3e-7fed66aaffe7@ngai.me>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 9A6A8362
X-Spamd-Result: default: False [-2.50 / 15.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 HAS_ORG_HEADER(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_NOT_FQDN(0.50)[]; BAYES_HAM(-3.00)[100.00%]
Received-SPF: softfail client-ip=2a0c:e300::1;
 envelope-from=samuel.thibault@gnu.org; helo=hera.aquilenet.fr
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nicholas Ngai, le sam. 25 sept. 2021 16:22:02 -0700, a ecrit:
> Sorry for the duplicate email. The cc’s for the maintainers on the email
> didn’t go through the first time.
> 
> Nicholas Ngai
> 
> On 9/25/21 2:48 PM, Nicholas Ngai wrote:
> > libslirp provides a newer slirp_*_hostxfwd API meant for
> > address-agnostic forwarding instead of the is_udp parameter which is
> > limited to just TCP/UDP.
> > 
> > Signed-off-by: Nicholas Ngai <nicholas@ngai.me>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> > ---
> >   net/slirp.c | 64 +++++++++++++++++++++++++++++++++++------------------
> >   1 file changed, 42 insertions(+), 22 deletions(-)
> > 
> > diff --git a/net/slirp.c b/net/slirp.c
> > index ad3a838e0b..49ae01a2f0 100644
> > --- a/net/slirp.c
> > +++ b/net/slirp.c
> > @@ -643,12 +643,17 @@ static SlirpState *slirp_lookup(Monitor *mon, const char *id)
> >   void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
> >   {
> > -    struct in_addr host_addr = { .s_addr = INADDR_ANY };
> > -    int host_port;
> > +    struct sockaddr_in host_addr = {
> > +        .sin_family = AF_INET,
> > +        .sin_addr = {
> > +            .s_addr = INADDR_ANY,
> > +        },
> > +    };
> > +    int port;
> > +    int flags = 0;
> >       char buf[256];
> >       const char *src_str, *p;
> >       SlirpState *s;
> > -    int is_udp = 0;
> >       int err;
> >       const char *arg1 = qdict_get_str(qdict, "arg1");
> >       const char *arg2 = qdict_get_try_str(qdict, "arg2");
> > @@ -670,9 +675,9 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
> >       }
> >       if (!strcmp(buf, "tcp") || buf[0] == '\0') {
> > -        is_udp = 0;
> > +        /* Do nothing; already TCP. */
> >       } else if (!strcmp(buf, "udp")) {
> > -        is_udp = 1;
> > +        flags |= SLIRP_HOSTFWD_UDP;
> >       } else {
> >           goto fail_syntax;
> >       }
> > @@ -680,15 +685,17 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
> >       if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> >           goto fail_syntax;
> >       }
> > -    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
> > +    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
> >           goto fail_syntax;
> >       }
> > -    if (qemu_strtoi(p, NULL, 10, &host_port)) {
> > +    if (qemu_strtoi(p, NULL, 10, &port)) {
> >           goto fail_syntax;
> >       }
> > +    host_addr.sin_port = htons(port);
> > -    err = slirp_remove_hostfwd(s->slirp, is_udp, host_addr, host_port);
> > +    err = slirp_remove_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
> > +            sizeof(host_addr), flags);
> >       monitor_printf(mon, "host forwarding rule for %s %s\n", src_str,
> >                      err ? "not found" : "removed");
> > @@ -700,12 +707,22 @@ void hmp_hostfwd_remove(Monitor *mon, const QDict *qdict)
> >   static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
> >   {
> > -    struct in_addr host_addr = { .s_addr = INADDR_ANY };
> > -    struct in_addr guest_addr = { .s_addr = 0 };
> > -    int host_port, guest_port;
> > +    struct sockaddr_in host_addr = {
> > +        .sin_family = AF_INET,
> > +        .sin_addr = {
> > +            .s_addr = INADDR_ANY,
> > +        },
> > +    };
> > +    struct sockaddr_in guest_addr = {
> > +        .sin_family = AF_INET,
> > +        .sin_addr = {
> > +            .s_addr = 0,
> > +        },
> > +    };
> > +    int flags = 0;
> > +    int port;
> >       const char *p;
> >       char buf[256];
> > -    int is_udp;
> >       char *end;
> >       const char *fail_reason = "Unknown reason";
> > @@ -715,9 +732,9 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
> >           goto fail_syntax;
> >       }
> >       if (!strcmp(buf, "tcp") || buf[0] == '\0') {
> > -        is_udp = 0;
> > +        /* Do nothing; already TCP. */
> >       } else if (!strcmp(buf, "udp")) {
> > -        is_udp = 1;
> > +        flags |= SLIRP_HOSTFWD_UDP;
> >       } else {
> >           fail_reason = "Bad protocol name";
> >           goto fail_syntax;
> > @@ -727,7 +744,7 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
> >           fail_reason = "Missing : separator";
> >           goto fail_syntax;
> >       }
> > -    if (buf[0] != '\0' && !inet_aton(buf, &host_addr)) {
> > +    if (buf[0] != '\0' && !inet_aton(buf, &host_addr.sin_addr)) {
> >           fail_reason = "Bad host address";
> >           goto fail_syntax;
> >       }
> > @@ -736,29 +753,32 @@ static int slirp_hostfwd(SlirpState *s, const char *redir_str, Error **errp)
> >           fail_reason = "Bad host port separator";
> >           goto fail_syntax;
> >       }
> > -    host_port = strtol(buf, &end, 0);
> > -    if (*end != '\0' || host_port < 0 || host_port > 65535) {
> > +    port = strtol(buf, &end, 0);
> > +    if (*end != '\0' || port < 0 || port > 65535) {
> >           fail_reason = "Bad host port";
> >           goto fail_syntax;
> >       }
> > +    host_addr.sin_port = htons(port);
> >       if (get_str_sep(buf, sizeof(buf), &p, ':') < 0) {
> >           fail_reason = "Missing guest address";
> >           goto fail_syntax;
> >       }
> > -    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr)) {
> > +    if (buf[0] != '\0' && !inet_aton(buf, &guest_addr.sin_addr)) {
> >           fail_reason = "Bad guest address";
> >           goto fail_syntax;
> >       }
> > -    guest_port = strtol(p, &end, 0);
> > -    if (*end != '\0' || guest_port < 1 || guest_port > 65535) {
> > +    port = strtol(p, &end, 0);
> > +    if (*end != '\0' || port < 1 || port > 65535) {
> >           fail_reason = "Bad guest port";
> >           goto fail_syntax;
> >       }
> > +    guest_addr.sin_port = htons(port);
> > -    if (slirp_add_hostfwd(s->slirp, is_udp, host_addr, host_port, guest_addr,
> > -                          guest_port) < 0) {
> > +    if (slirp_add_hostxfwd(s->slirp, (struct sockaddr *) &host_addr,
> > +                           sizeof(host_addr), (struct sockaddr *) &guest_addr,
> > +                           sizeof(guest_addr), flags) < 0) {
> >           error_setg(errp, "Could not set up host forwarding rule '%s'",
> >                      redir_str);
> >           return -1;
> 

