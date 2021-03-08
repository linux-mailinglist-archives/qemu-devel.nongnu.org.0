Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A83330863
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:45:41 +0100 (CET)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9e8-0001Uj-8P
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJ9az-0000dy-CB
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:42:26 -0500
Received: from mail-io1-f53.google.com ([209.85.166.53]:33728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lJ9ax-0005Td-9L
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:42:24 -0500
Received: by mail-io1-f53.google.com with SMTP id n132so8841669iod.0
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=usa2ylFox8ljKOs99Hu3ndQQX6Kpc3708ZCjBwkH4U4=;
 b=MtBux64VIj4WCdg86pZ2WnALSb4iUP2/kjsOMgOLhKlfvWxvuuS50MuLHIJsKd65PJ
 ndrznTDD86wa/RosWe4Gna48LIg3yPq1kLjHn/Y9J6i2W5lw1UlNTlzImvMvxmzxPGZI
 l2fNdSkbUq88qeTh6AI/MsUE31fnoGcXN3FCtU1aUWz/mEOdYFe5AzVbgDCbaHWvJKmc
 h/0kYzVfDWGX6p4wyXLqTC0CCqotp6Isbwcng5fSiV1ZMfrhVqRNIQRkut6HG+OR8x5i
 CFMWFapXR8xOofk+Eqjt7eah40bDzF3gx7rLofJuoyghRATLIclwwLpHqzD2sBCQMd6+
 7oWA==
X-Gm-Message-State: AOAM533N1MUGTAuVYh31njXI04h2uHMNDZgz+DNj82F4wj+wxNFbOvBW
 Lu/qi0cOp3bcbptClz1/6gUW2JzV0tc=
X-Google-Smtp-Source: ABdhPJynVY2Ydq74JBjIhQLRufLRWt6KiK2DgFQb1QtRponuaDIWCj+Ozzhz9E+FgsYsSiPtRsDqrg==
X-Received: by 2002:a5d:9e18:: with SMTP id h24mr8170849ioh.80.1615185741496; 
 Sun, 07 Mar 2021 22:42:21 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id c9sm6005582ili.34.2021.03.07.22.42.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 22:42:21 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id c10so7870033ilo.8
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:42:21 -0800 (PST)
X-Received: by 2002:a92:ce89:: with SMTP id r9mr17449265ilo.191.1615185741094; 
 Sun, 07 Mar 2021 22:42:21 -0800 (PST)
MIME-Version: 1.0
References: <20210125073427.3970606-1-marcandre.lureau@redhat.com>
 <20210125073427.3970606-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210125073427.3970606-2-marcandre.lureau@redhat.com>
From: Joelle van Dyne <j@getutm.app>
Date: Sun, 7 Mar 2021 22:42:10 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBCkeh7Z0g1KDbpL569F3pMcPohZM8JUqS0NcPUrOaBTw@mail.gmail.com>
Message-ID: <CA+E+eSBCkeh7Z0g1KDbpL569F3pMcPohZM8JUqS0NcPUrOaBTw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] slirp: update to git master
To: marcandre.lureau@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.166.53; envelope-from=osy86dev@gmail.com;
 helo=mail-io1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Joelle van Dyne <j@getutm.app>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 24, 2021 at 11:34 PM <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> git cherry-diff:
>
> Commits on bacb71f1c3ed5f40e393afd8be81bedfba13a401 branch that is not on=
 8f43a99191afb47ca3f3c6972f6306209f367ece branch
> + 1021b0dc38d39f1dc95a296fe3e05a24a087cdc6 disable_dns option
> + 0f94ceec752592e4ac632a24e3c64a97dd09bf4c limit vnameserver_addr to port=
 53
> + b57bafa852ef16b133907a13678ec69e9531f177 libslirp.h: fix SlirpConfig v3=
 documentation
> + 1abf18b2b5edb462797629ed47ad4515a195686e Update CHANGELOG
> + ff4ecf9b6c6542b24b4ac6ea178be9d44e159f79 Release v4.3.0
> + 21f1d933050a40d62612c6274c32de60b811d9ea changelog: post-release
> + 376187c4b14c795763d472214812826eebe7e9c2 Release v4.3.1
> + 73336e08902a7e826f7d960453df037380266186 changelog: post-release
> + 5c1c9d43be61571608e9b14615045b67b830daf5 udp, udp6, icmp: handle TTL va=
lue
> + 73ed49ab71998d4288e71e954ef6214b70f23d79 icmp, icmp6: Add icmp_forward_=
error and icmp6_forward_error
> + 7a4840a57ec7dbc37cca1ab96f058a9610b26950 udp, udp6, icmp, icmp6: Enable=
 forwarding errors on Linux
> + e9b2bc19ae652a2907f247e621b2e4773bdd2aab TCPIPHDR_DELTA: Fix potential =
negative value
> + 39f9a363eec082f04513413046321abd04163148 .gitlab-ci: add a Coverity sta=
ge
> + 1b0093b973cfa0dc041522e5d4e6f576b2df642e sosendoob: better document wha=
t urgc is used for
> + 5b9ad89ebbb8afa50162c9156fabd5fc56291088 Add G_GNUC_PRINTF to local fun=
ction slirp_vsnprintf
> + 8a808aa493980e212b4d5f5465330905c8294e59 meson: remove meson-dist scrip=
t
> + 0b669b5fbe4d3c25a682a67f1059d8633c963b3d meson: support compiling as su=
bproject
> + 9f82a47b81f2864422b82c1e40e51a2ed9c6ac32 Add DNS resolving for iOS
> + c0eac03e8ce1b9a743231f2fe21e7cb579fc9339 Remove the QEMU-special make b=
uild-system
> + 1bfd4d9368f9fa2e4f0731e1266bec05bbc83a80 socket: consume empty packets
> + 92413be68914f8cae2f5bad4bf3ab8491dcbc5d7 Release v4.4.0
> + 07e8cfac69766081871ab620d9f16a630543d302 changelog: post-release
> + 4c4e035813313d02b63fdeb920d56fb2fdc0a5b1 Remove some needless (void)cas=
ts
> + eee9db9d115d91aa82f33685c4e76d656db92976 fork_exec_child_setup: improve=
 signal handling
> + 216f434a018b3af182a4f31bbe5a00daee170343 Fix unused variables
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Tested-by: Joelle van Dyne <j@getutm.app>

