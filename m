Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B79E2DDDA0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 05:09:53 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq75U-00044x-9k
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 23:09:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6z8-0000J1-7W
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 23:03:18 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scw@google.com>) id 1kq6yr-0004aO-5r
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 23:03:17 -0500
Received: by mail-ej1-x62b.google.com with SMTP id ga15so1231389ejb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 20:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+hCvXfg+g5i5JTzzWcy0PHP3dbCTbzL+tdlc/86gt9Q=;
 b=Nxt94IaQK2RmfA8Ujmjq4vQw4ymSyryQVKVSfJ+wHzORG5nM6wB74JDlYrlGgWbCEr
 AkyoTtBQ50g3NSO+e4Y/gwADNWJUQdP2YnRMqNcThZ8pLZ7qs4cGhk7gxMs9bKO3Z1/y
 DSJdAei3P2zd+KyeVZ/4qHQ9iO4MHyp+yzFdeyxAP47uIvrYaOWRuSxJaXCbfwlllKem
 nmhhiYDNUG53M1GLfaids9bRiiROOezS3sTBWg/SCyW0wVr50fO0iSqK1TKll7riQlm9
 uab9hJGklM68N7l1n2TTfRlLJrCFdML3OW9mEe+uZD77lMPD1Vgsu+D8Kn0dh5Ni3kPd
 jk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+hCvXfg+g5i5JTzzWcy0PHP3dbCTbzL+tdlc/86gt9Q=;
 b=p4Unf2LGL/20mK3mgCKRDN+G1Cyd3ybrYgFl7xqpBiYZgy0RtrJhvgNFh4Lvv5Libd
 DnmYBxMO4HfQcF58bUGfWgTou47XKuDQby0O/Ptx/wKISNcdiomrhxKwKv3Sz1HoYNYr
 wKMUj0YG6ag5EuhrwkZT8WdeTKbzU9zvAvafiKaP4uU9LrIQoTzISpudb4xyZQNBHMut
 h1W+g6zo39SKxHkkUugFxnYuzBbMdUKIujaj89cb6xwZQhSfhPpjnWtc68WZe5kPuM25
 dIo0mBRfVtqTsvfeJDcC6wK75i1GvgsyqvH80m4cp++Jo6vu8wN24fCjl8VeWqszisvT
 lbbg==
X-Gm-Message-State: AOAM530+xfoBhq8YrNJrA0T1SG9iw0n9u/g83T6xP3eBroHWGu4P64b2
 eRcazx7/HNL1C13YxLijfBua6YbRSCAtQwCcWJ6BsTTiBtoCMY8b
X-Google-Smtp-Source: ABdhPJzki2EpHG36Pfs/pDSz3rWtdFlndKfAmQaFPTCeK2sxyEs5rvqMWgVk6+YJdpEYuWTTa6IpOiMroYlFi9GV20U=
X-Received: by 2002:a17:906:5847:: with SMTP id
 h7mr2117858ejs.124.1608264178544; 
 Thu, 17 Dec 2020 20:02:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1597129029.git.scw@google.com>
 <c1fdce46c35527ea9da34ca26eab4efcdac407db.1597129029.git.scw@google.com>
In-Reply-To: <c1fdce46c35527ea9da34ca26eab4efcdac407db.1597129029.git.scw@google.com>
From: Shu-Chun Weng <scw@google.com>
Date: Thu, 17 Dec 2020 20:02:47 -0800
Message-ID: <CAF3nBxhvnMKitovtGnTGPOSCMmdObx8b8A2SbHiFtEs=5_aBTw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] linux-user: setsockopt() SO_TIMESTAMPNS and
 SO_TIMESTAMPING
To: qemu-devel@nongnu.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000195a6a05b6b52fa5"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=scw@google.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000195a6a05b6b52fa5
Content-Type: multipart/alternative; boundary="00000000000011995805b6b52fc5"

--00000000000011995805b6b52fc5
Content-Type: text/plain; charset="UTF-8"

Ping -- any comments on
https://patchew.org/QEMU/cover.1597129029.git.scw@google.com/c1fdce46c35527ea9da34ca26eab4efcdac407db.1597129029.git.scw@google.com/

On Tue, Aug 11, 2020 at 12:10 AM Shu-Chun Weng <scw@google.com> wrote:

> This change supports SO_TIMESTAMPNS_OLD/NEW and SO_TIMESTAMPING_OLD/NEW
> for setsocketopt() with SOL_SOCKET. Based on the SO_TIMESTAMP_OLD/NEW
> framework. The three pairs share the same flag `SOCK_TSTAMP_NEW` in
> linux kernel for deciding if the old or the new format is used.
>
> Signed-off-by: Shu-Chun Weng <scw@google.com>
> ---
> v1 -> v2:
>   Only keep track of old/new format in a global state.
>   Fix style problems.
>
>  linux-user/alpha/sockbits.h            |  13 +-
>  linux-user/generic/sockbits.h          |   8 +
>  linux-user/hppa/sockbits.h             |  12 +-
>  linux-user/mips/sockbits.h             |   8 +
>  linux-user/sparc/sockbits.h            |  13 +-
>  linux-user/strace.c                    |  12 +
>  linux-user/syscall.c                   | 149 ++++++++-
>  tests/tcg/multiarch/socket_timestamp.c | 442 +++++++++++++++++++------
>  8 files changed, 540 insertions(+), 117 deletions(-)
>
> diff --git a/linux-user/alpha/sockbits.h b/linux-user/alpha/sockbits.h
> index 40f0644df0..c2c88f432b 100644
> --- a/linux-user/alpha/sockbits.h
> +++ b/linux-user/alpha/sockbits.h
> @@ -51,8 +51,6 @@
>
>  #define TARGET_SO_PEERSEC       30
>  #define TARGET_SO_PASSSEC       34
> -#define TARGET_SO_TIMESTAMPNS       35
> -#define TARGET_SCM_TIMESTAMPNS      TARGET_SO_TIMESTAMPNS
>
>  /* Security levels - as per NRL IPv6 - don't actually do anything */
>  #define TARGET_SO_SECURITY_AUTHENTICATION       19
> @@ -61,9 +59,6 @@
>
>  #define TARGET_SO_MARK          36
>
> -#define TARGET_SO_TIMESTAMPING      37
> -#define TARGET_SCM_TIMESTAMPING TARGET_SO_TIMESTAMPING
> -
>  #define TARGET_SO_RXQ_OVFL             40
>
>  #define TARGET_SO_WIFI_STATUS       41
> @@ -75,9 +70,17 @@
>
>  #define TARGET_SO_TIMESTAMP_OLD        29
>  #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
> +#define TARGET_SO_TIMESTAMPNS_OLD      35
> +#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
> +#define TARGET_SO_TIMESTAMPING_OLD     37
> +#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
>
>  #define TARGET_SO_TIMESTAMP_NEW        63
>  #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
> +#define TARGET_SO_TIMESTAMPNS_NEW      64
> +#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
> +#define TARGET_SO_TIMESTAMPING_NEW     65
> +#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
>
>  /* TARGET_O_NONBLOCK clashes with the bits used for socket types.
> Therefore we
>   * have to define SOCK_NONBLOCK to a different value here.
> diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h
> index 532cf2d3dc..a0496d8751 100644
> --- a/linux-user/generic/sockbits.h
> +++ b/linux-user/generic/sockbits.h
> @@ -56,8 +56,16 @@
>
>  #define TARGET_SO_TIMESTAMP_OLD        29
>  #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
> +#define TARGET_SO_TIMESTAMPNS_OLD      35
> +#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
> +#define TARGET_SO_TIMESTAMPING_OLD     37
> +#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
>
>  #define TARGET_SO_TIMESTAMP_NEW        63
>  #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
> +#define TARGET_SO_TIMESTAMPNS_NEW      64
> +#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
> +#define TARGET_SO_TIMESTAMPING_NEW     65
> +#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
>
>  #endif
> diff --git a/linux-user/hppa/sockbits.h b/linux-user/hppa/sockbits.h
> index 284a47e74e..d7e9aa340d 100644
> --- a/linux-user/hppa/sockbits.h
> +++ b/linux-user/hppa/sockbits.h
> @@ -29,8 +29,6 @@
>  #define TARGET_SO_BSDCOMPAT    0x400e
>  #define TARGET_SO_PASSCRED     0x4010
>  #define TARGET_SO_PEERCRED     0x4011
> -#define TARGET_SO_TIMESTAMPNS  0x4013
> -#define TARGET_SCM_TIMESTAMPNS TARGET_SO_TIMESTAMPNS
>
>  #define TARGET_SO_SECURITY_AUTHENTICATION              0x4016
>  #define TARGET_SO_SECURITY_ENCRYPTION_TRANSPORT        0x4017
> @@ -44,8 +42,6 @@
>  #define TARGET_SO_PEERSEC              0x401d
>  #define TARGET_SO_PASSSEC              0x401e
>  #define TARGET_SO_MARK                 0x401f
> -#define TARGET_SO_TIMESTAMPING         0x4020
> -#define TARGET_SCM_TIMESTAMPING        TARGET_SO_TIMESTAMPING
>  #define TARGET_SO_RXQ_OVFL             0x4021
>  #define TARGET_SO_WIFI_STATUS          0x4022
>  #define TARGET_SCM_WIFI_STATUS         TARGET_SO_WIFI_STATUS
> @@ -67,9 +63,17 @@
>
>  #define TARGET_SO_TIMESTAMP_OLD        0x4012
>  #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
> +#define TARGET_SO_TIMESTAMPNS_OLD      0x4013
> +#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
> +#define TARGET_SO_TIMESTAMPING_OLD     0x4020
> +#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
>
>  #define TARGET_SO_TIMESTAMP_NEW        0x4038
>  #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
> +#define TARGET_SO_TIMESTAMPNS_NEW      0x4039
> +#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
> +#define TARGET_SO_TIMESTAMPING_NEW     0x403A
> +#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
>
>  /* TARGET_O_NONBLOCK clashes with the bits used for socket types.
> Therefore we
>   * have to define SOCK_NONBLOCK to a different value here.
> diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h
> index b4c39d9588..49524e23ac 100644
> --- a/linux-user/mips/sockbits.h
> +++ b/linux-user/mips/sockbits.h
> @@ -69,9 +69,17 @@
>
>  #define TARGET_SO_TIMESTAMP_OLD        29
>  #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
> +#define TARGET_SO_TIMESTAMPNS_OLD      35
> +#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
> +#define TARGET_SO_TIMESTAMPING_OLD     37
> +#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
>
>  #define TARGET_SO_TIMESTAMP_NEW        63
>  #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
> +#define TARGET_SO_TIMESTAMPNS_NEW      64
> +#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
> +#define TARGET_SO_TIMESTAMPING_NEW     65
> +#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
>
>  /** sock_type - Socket types
>   *
> diff --git a/linux-user/sparc/sockbits.h b/linux-user/sparc/sockbits.h
> index 07440efd14..c5fade3ad1 100644
> --- a/linux-user/sparc/sockbits.h
> +++ b/linux-user/sparc/sockbits.h
> @@ -51,14 +51,9 @@
>
>  #define TARGET_SO_PEERSEC              0x001e
>  #define TARGET_SO_PASSSEC              0x001f
> -#define TARGET_SO_TIMESTAMPNS          0x0021
> -#define TARGET_SCM_TIMESTAMPNS         TARGET_SO_TIMESTAMPNS
>
>  #define TARGET_SO_MARK                 0x0022
>
> -#define TARGET_SO_TIMESTAMPING         0x0023
> -#define TARGET_SCM_TIMESTAMPING        TARGET_SO_TIMESTAMPING
> -
>  #define TARGET_SO_RXQ_OVFL             0x0024
>
>  #define TARGET_SO_WIFI_STATUS          0x0025
> @@ -104,9 +99,17 @@
>
>  #define TARGET_SO_TIMESTAMP_OLD        0x001d
>  #define TARGET_SCM_TIMESTAMP_OLD       TARGET_SO_TIMESTAMP_OLD
> +#define TARGET_SO_TIMESTAMPNS_OLD      0x0021
> +#define TARGET_SCM_TIMESTAMPNS_OLD     TARGET_SO_TIMESTAMPNS_OLD
> +#define TARGET_SO_TIMESTAMPING_OLD     0x0023
> +#define TARGET_SCM_TIMESTAMPING_OLD    TARGET_SO_TIMESTAMPING_OLD
>
>  #define TARGET_SO_TIMESTAMP_NEW        0x0046
>  #define TARGET_SCM_TIMESTAMP_NEW       TARGET_SO_TIMESTAMP_NEW
> +#define TARGET_SO_TIMESTAMPNS_NEW      0x0042
> +#define TARGET_SCM_TIMESTAMPNS_NEW     TARGET_SO_TIMESTAMPNS_NEW
> +#define TARGET_SO_TIMESTAMPING_NEW     0x0043
> +#define TARGET_SCM_TIMESTAMPING_NEW    TARGET_SO_TIMESTAMPING_NEW
>
>  /* Security levels - as per NRL IPv6 - don't actually do anything */
>  #define TARGET_SO_SECURITY_AUTHENTICATION              0x5001
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index a11a5e9e86..7aabb3c972 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -2260,9 +2260,21 @@ print_optint:
>          case TARGET_SO_TIMESTAMP_OLD:
>              qemu_log("SO_TIMESTAMP_OLD,");
>              goto print_optint;
> +        case TARGET_SO_TIMESTAMPNS_OLD:
> +            qemu_log("SO_TIMESTAMPNS_OLD,");
> +            goto print_optint;
> +        case TARGET_SO_TIMESTAMPING_OLD:
> +            qemu_log("SO_TIMESTAMPING_OLD,");
> +            goto print_optint;
>          case TARGET_SO_TIMESTAMP_NEW:
>              qemu_log("SO_TIMESTAMP_NEW,");
>              goto print_optint;
> +        case TARGET_SO_TIMESTAMPNS_NEW:
> +            qemu_log("SO_TIMESTAMPNS_NEW,");
> +            goto print_optint;
> +        case TARGET_SO_TIMESTAMPING_NEW:
> +            qemu_log("SO_TIMESTAMPING_NEW,");
> +            goto print_optint;
>          case TARGET_SO_RCVLOWAT:
>              qemu_log("SO_RCVLOWAT,");
>              goto print_optint;
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index e6b1a18cc0..bfc4219104 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1771,6 +1771,34 @@ static inline abi_long host_to_target_cmsg(struct
> target_msghdr *target_msgh,
>                      break;
>                  }
>                  break;
> +            case SCM_TIMESTAMPNS:
> +                switch (target_expected_timestamp_version) {
> +                case TARGET_TIMESTAMP_OLD:
> +                    tgt_len = sizeof(struct target_timespec);
> +                    target_cmsg->cmsg_type =
> +                        tswap32(TARGET_SCM_TIMESTAMPNS_OLD);
> +                    break;
> +                case TARGET_TIMESTAMP_NEW:
> +                    tgt_len = sizeof(struct target__kernel_timespec);
> +                    target_cmsg->cmsg_type =
> +                        tswap32(TARGET_SCM_TIMESTAMPNS_NEW);
> +                    break;
> +                }
> +                break;
> +            case SCM_TIMESTAMPING:
> +                switch (target_expected_timestamp_version) {
> +                case TARGET_TIMESTAMP_OLD:
> +                    tgt_len = sizeof(struct target_timespec[3]);
> +                    target_cmsg->cmsg_type =
> +                        tswap32(TARGET_SCM_TIMESTAMPING_OLD);
> +                    break;
> +                case TARGET_TIMESTAMP_NEW:
> +                    tgt_len = sizeof(struct target__kernel_timespec[3]);
> +                    target_cmsg->cmsg_type =
> +                        tswap32(TARGET_SCM_TIMESTAMPING_NEW);
> +                    break;
> +                }
> +                break;
>              default:
>                  break;
>              }
> @@ -1838,6 +1866,81 @@ static inline abi_long host_to_target_cmsg(struct
> target_msghdr *target_msgh,
>                  }
>                  break;
>              }
> +            case SCM_TIMESTAMPNS:
> +            {
> +                struct timespec *ts = (struct timespec *)data;
> +                if (len != sizeof(struct timespec)) {
> +                    goto unimplemented;
> +                }
> +
> +                switch (target_expected_timestamp_version) {
> +                case TARGET_TIMESTAMP_OLD:
> +                {
> +                    struct target_timespec *target_ts =
> +                        (struct target_timespec *)target_data;
> +                    if (tgt_len != sizeof(struct target_timespec)) {
> +                        goto unimplemented;
> +                    }
> +
> +                    __put_user(ts->tv_sec, &target_ts->tv_sec);
> +                    __put_user(ts->tv_nsec, &target_ts->tv_nsec);
> +                    break;
> +                }
> +                case TARGET_TIMESTAMP_NEW:
> +                {
> +                    struct target__kernel_timespec *target_ts =
> +                        (struct target__kernel_timespec *)target_data;
> +                    if (tgt_len != sizeof(struct
> target__kernel_timespec)) {
> +                        goto unimplemented;
> +                    }
> +
> +                    __put_user(ts->tv_sec, &target_ts->tv_sec);
> +                    __put_user(ts->tv_nsec, &target_ts->tv_nsec);
> +                    break;
> +                }
> +                }
> +                break;
> +            }
> +            case SCM_TIMESTAMPING:
> +            {
> +                int i;
> +                struct timespec *ts = (struct timespec *)data;
> +                if (len != sizeof(struct timespec[3])) {
> +                    goto unimplemented;
> +                }
> +
> +                switch (target_expected_timestamp_version) {
> +                case TARGET_TIMESTAMP_OLD:
> +                {
> +                    struct target_timespec *target_ts =
> +                        (struct target_timespec *)target_data;
> +                    if (tgt_len != sizeof(struct target_timespec[3])) {
> +                        goto unimplemented;
> +                    }
> +
> +                    for (i = 0; i < 3; ++i) {
> +                        __put_user(ts[i].tv_sec, &target_ts[i].tv_sec);
> +                        __put_user(ts[i].tv_nsec, &target_ts[i].tv_nsec);
> +                    }
> +                    break;
> +                }
> +                case TARGET_TIMESTAMP_NEW:
> +                {
> +                    struct target__kernel_timespec *target_ts =
> +                        (struct target__kernel_timespec *)target_data;
> +                    if (tgt_len != sizeof(struct
> target__kernel_timespec[3])) {
> +                        goto unimplemented;
> +                    }
> +
> +                    for (i = 0; i < 3; ++i) {
> +                        __put_user(ts[i].tv_sec, &target_ts[i].tv_sec);
> +                        __put_user(ts[i].tv_nsec, &target_ts[i].tv_nsec);
> +                    }
> +                    break;
> +                }
> +                }
> +                break;
> +            }
>              case SCM_CREDENTIALS:
>              {
>                  struct ucred *cred = (struct ucred *)data;
> @@ -2381,6 +2484,22 @@ set_timeout:
>                  target_timestamp_version = TARGET_TIMESTAMP_NEW;
>                  optname = SO_TIMESTAMP;
>                  break;
> +        case TARGET_SO_TIMESTAMPNS_OLD:
> +                target_timestamp_version = TARGET_TIMESTAMP_OLD;
> +                optname = SO_TIMESTAMPNS;
> +                break;
> +        case TARGET_SO_TIMESTAMPNS_NEW:
> +                target_timestamp_version = TARGET_TIMESTAMP_NEW;
> +                optname = SO_TIMESTAMPNS;
> +                break;
> +        case TARGET_SO_TIMESTAMPING_OLD:
> +                target_timestamp_version = TARGET_TIMESTAMP_OLD;
> +                optname = SO_TIMESTAMPING;
> +                break;
> +        case TARGET_SO_TIMESTAMPING_NEW:
> +                target_timestamp_version = TARGET_TIMESTAMP_NEW;
> +                optname = SO_TIMESTAMPING;
> +                break;
>          case TARGET_SO_RCVLOWAT:
>                 optname = SO_RCVLOWAT;
>                 break;
> @@ -2393,7 +2512,9 @@ set_timeout:
>         if (get_user_u32(val, optval_addr))
>              return -TARGET_EFAULT;
>         ret = get_errno(setsockopt(sockfd, SOL_SOCKET, optname, &val,
> sizeof(val)));
> -        if (!is_error(ret) && optname == SO_TIMESTAMP) {
> +        if (!is_error(ret) &&
> +            (optname == SO_TIMESTAMP || optname == SO_TIMESTAMPNS ||
> +             optname == SO_TIMESTAMPING)) {
>              target_expected_timestamp_version = target_timestamp_version;
>          }
>          break;
> @@ -2637,6 +2758,26 @@ get_timeout:
>                  (target_expected_timestamp_version ==
> TARGET_TIMESTAMP_NEW);
>              optname = SO_TIMESTAMP;
>              goto int_case;
> +        case TARGET_SO_TIMESTAMPNS_OLD:
> +            timestamp_format_matches =
> +                (target_expected_timestamp_version ==
> TARGET_TIMESTAMP_OLD);
> +            optname = SO_TIMESTAMPNS;
> +            goto int_case;
> +        case TARGET_SO_TIMESTAMPNS_NEW:
> +            timestamp_format_matches =
> +                (target_expected_timestamp_version ==
> TARGET_TIMESTAMP_NEW);
> +            optname = SO_TIMESTAMPNS;
> +            goto int_case;
> +        case TARGET_SO_TIMESTAMPING_OLD:
> +            timestamp_format_matches =
> +                (target_expected_timestamp_version ==
> TARGET_TIMESTAMP_OLD);
> +            optname = SO_TIMESTAMPING;
> +            goto int_case;
> +        case TARGET_SO_TIMESTAMPING_NEW:
> +            timestamp_format_matches =
> +                (target_expected_timestamp_version ==
> TARGET_TIMESTAMP_NEW);
> +            optname = SO_TIMESTAMPING;
> +            goto int_case;
>          case TARGET_SO_RCVLOWAT:
>              optname = SO_RCVLOWAT;
>              goto int_case;
> @@ -2661,9 +2802,9 @@ get_timeout:
>              return ret;
>          if (optname == SO_TYPE) {
>              val = host_to_target_sock_type(val);
> -        }
> -        if (optname == SO_TIMESTAMP) {
> -            val = val && timestamp_format_matches;
> +        } else if ((optname == SO_TIMESTAMP || optname == SO_TIMESTAMPNS
> ||
> +                    optname == SO_TIMESTAMPING) &&
> !timestamp_format_matches) {
> +            val = 0;
>          }
>          if (len > lv)
>              len = lv;
> diff --git a/tests/tcg/multiarch/socket_timestamp.c
> b/tests/tcg/multiarch/socket_timestamp.c
> index 71ab1845de..3ae833ad44 100644
> --- a/tests/tcg/multiarch/socket_timestamp.c
> +++ b/tests/tcg/multiarch/socket_timestamp.c
> @@ -1,5 +1,6 @@
>  #include <assert.h>
>  #include <errno.h>
> +#include <linux/net_tstamp.h>
>  #include <linux/types.h>
>  #include <netinet/in.h>
>  #include <stdint.h>
> @@ -11,6 +12,7 @@
>  #include <sys/time.h>
>  #include <sys/types.h>
>  #include <sys/wait.h>
> +#include <time.h>
>  #include <unistd.h>
>
>  #ifdef __kernel_old_timeval
> @@ -27,6 +29,33 @@ struct kernel_sock_timeval {
>      int64_t tv_usec;
>  };
>
> +struct kernel_old_timespec {
> +    __kernel_long_t tv_sec;
> +    long            tv_nsec;
> +};
> +
> +struct kernel_timespec {
> +    int64_t   tv_sec;
> +    long long tv_nsec;
> +};
> +
> +struct scm_timestamping {
> +    struct timespec ts[3];
> +};
> +
> +struct scm_old_timestamping {
> +    struct kernel_old_timespec ts[3];
> +};
> +
> +struct scm_timestamping64 {
> +    struct kernel_timespec ts[3];
> +};
> +
> +const int so_timestamping_flags =
> +    SOF_TIMESTAMPING_RX_HARDWARE |
> +    SOF_TIMESTAMPING_RX_SOFTWARE |
> +    SOF_TIMESTAMPING_SOFTWARE;
> +
>  int create_udp_socket(struct sockaddr_in *sockaddr)
>  {
>      socklen_t sockaddr_len;
> @@ -61,43 +90,47 @@ int create_udp_socket(struct sockaddr_in *sockaddr)
>   * Checks that the timestamp in the message is not after the reception
> timestamp
>   * as well as the reception time is within 10 seconds of the message time.
>   */
> -void check_timestamp_difference(const struct timeval *msg_tv,
> -                                const struct timeval *pkt_tv)
> +void check_timestamp_difference(const struct timespec *msg_ts,
> +                                const struct timespec *pkt_ts)
>  {
> -    if (pkt_tv->tv_sec < msg_tv->tv_sec ||
> -        (pkt_tv->tv_sec == msg_tv->tv_sec && pkt_tv->tv_usec <
> msg_tv->tv_usec))
> +    if (pkt_ts->tv_sec < msg_ts->tv_sec ||
> +        (pkt_ts->tv_sec == msg_ts->tv_sec && pkt_ts->tv_nsec <
> msg_ts->tv_nsec))
>      {
>          fprintf(stderr,
> -                "Packet received before sent: %lld.%06lld <
> %lld.%06lld\n",
> -                (long long)pkt_tv->tv_sec, (long long)pkt_tv->tv_usec,
> -                (long long)msg_tv->tv_sec, (long long)msg_tv->tv_usec);
> +                "Packet received before sent: %lld.%06lld <
> %lld.%09lld\n",
> +                (long long)pkt_ts->tv_sec, (long long)pkt_ts->tv_nsec,
> +                (long long)msg_ts->tv_sec, (long long)msg_ts->tv_nsec);
>          exit(-1);
>      }
>
> -    if (pkt_tv->tv_sec > msg_tv->tv_sec + 10 ||
> -        (pkt_tv->tv_sec == msg_tv->tv_sec + 10 &&
> -         pkt_tv->tv_usec > msg_tv->tv_usec)) {
> +    if (pkt_ts->tv_sec > msg_ts->tv_sec + 10 ||
> +        (pkt_ts->tv_sec == msg_ts->tv_sec + 10 &&
> +         pkt_ts->tv_nsec > msg_ts->tv_nsec)) {
>          fprintf(stderr,
>                  "Packet received more than 10 seconds after sent: "
> -                "%lld.%06lld > %lld.%06lld + 10\n",
> -                (long long)pkt_tv->tv_sec, (long long)pkt_tv->tv_usec,
> -                (long long)msg_tv->tv_sec, (long long)msg_tv->tv_usec);
> +                "%lld.%06lld > %lld.%09lld + 10\n",
> +                (long long)pkt_ts->tv_sec, (long long)pkt_ts->tv_nsec,
> +                (long long)msg_ts->tv_sec, (long long)msg_ts->tv_nsec);
>          exit(-1);
>      }
>  }
>
>  void send_current_time(int sock, struct sockaddr_in server_sockaddr)
>  {
> -    struct timeval tv = {0, 0};
> -    gettimeofday(&tv, NULL);
> -    sendto(sock, &tv, sizeof(tv), 0, (struct sockaddr *)&server_sockaddr,
> +    struct timespec ts = {0, 0};
> +    clock_gettime(CLOCK_REALTIME, &ts);
> +#ifdef MSG_CONFIRM
> +    const int flags = MSG_CONFIRM;
> +#else
> +    const int flags = 0;
> +#endif
> +    sendto(sock, &ts, sizeof(ts), flags, (struct sockaddr
> *)&server_sockaddr,
>             sizeof(server_sockaddr));
>  }
>
> -typedef void (*get_timeval_t)(const struct cmsghdr *cmsg, struct timeval
> *tv);
> +typedef void (*get_timespec_t)(const struct cmsghdr *cmsg, struct
> timespec *tv);
>
> -
> -void receive_packet(int sock, get_timeval_t get_timeval)
> +void receive_packet(int sock, get_timespec_t get_timespec)
>  {
>      struct msghdr msg = {0};
>
> @@ -113,7 +146,7 @@ void receive_packet(int sock, get_timeval_t
> get_timeval)
>          struct cmsghdr align;
>      } u;
>      struct cmsghdr *cmsg;
> -    struct timeval msg_tv, pkt_tv;
> +    struct timespec msg_ts, pkt_ts;
>
>      int res;
>
> @@ -134,31 +167,35 @@ void receive_packet(int sock, get_timeval_t
> get_timeval)
>
>      assert(res == sizeof(struct timeval));
>      assert(iov.iov_base == iobuf);
> -    memcpy(&msg_tv, iov.iov_base, sizeof(msg_tv));
> -    printf("Message timestamp: %lld.%06lld\n",
> -           (long long)msg_tv.tv_sec, (long long)msg_tv.tv_usec);
> +    memcpy(&msg_ts, iov.iov_base, sizeof(msg_ts));
> +    printf("Message timestamp: %lld.%09lld\n",
> +           (long long)msg_ts.tv_sec, (long long)msg_ts.tv_nsec);
>
>      cmsg = CMSG_FIRSTHDR(&msg);
>      assert(cmsg);
> -    (*get_timeval)(cmsg, &pkt_tv);
> -    printf("Packet timestamp: %lld.%06lld\n",
> -           (long long)pkt_tv.tv_sec, (long long)pkt_tv.tv_usec);
> +    (*get_timespec)(cmsg, &pkt_ts);
> +    printf("Packet timestamp: %lld.%09lld\n",
> +           (long long)pkt_ts.tv_sec, (long long)pkt_ts.tv_nsec);
>
> -    check_timestamp_difference(&msg_tv, &pkt_tv);
> +    check_timestamp_difference(&msg_ts, &pkt_ts);
>  }
>
> -void get_timeval_from_so_timestamp(const struct cmsghdr *cmsg,
> -                                   struct timeval *tv)
> +void get_timespec_from_so_timestamp(const struct cmsghdr *cmsg,
> +                                    struct timespec *ts)
>  {
> +    struct timeval tv;
>      assert(cmsg->cmsg_level == SOL_SOCKET);
>      assert(cmsg->cmsg_type == SCM_TIMESTAMP);
> -    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(struct timeval)));
> -    memcpy(tv, CMSG_DATA(cmsg), sizeof(*tv));
> +    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tv)));
> +
> +    memcpy(&tv, CMSG_DATA(cmsg), sizeof(tv));
> +    ts->tv_sec = tv.tv_sec;
> +    ts->tv_nsec = tv.tv_usec * 1000LL;
>  }
>
>  #ifdef SO_TIMESTAMP_OLD
> -void get_timeval_from_so_timestamp_old(const struct cmsghdr *cmsg,
> -                                       struct timeval *tv)
> +void get_timespec_from_so_timestamp_old(const struct cmsghdr *cmsg,
> +                                        struct timespec *ts)
>  {
>      struct kernel_old_timeval old_tv;
>      assert(cmsg->cmsg_level == SOL_SOCKET);
> @@ -166,13 +203,13 @@ void get_timeval_from_so_timestamp_old(const struct
> cmsghdr *cmsg,
>      assert(cmsg->cmsg_len == CMSG_LEN(sizeof(old_tv)));
>
>      memcpy(&old_tv, CMSG_DATA(cmsg), sizeof(old_tv));
> -    tv->tv_sec = old_tv.tv_sec;
> -    tv->tv_usec = old_tv.tv_usec;
> +    ts->tv_sec = old_tv.tv_sec;
> +    ts->tv_nsec = old_tv.tv_usec * 1000LL;
>  }
>
>  #ifdef SO_TIMESTAMP_NEW
> -void get_timeval_from_so_timestamp_new(const struct cmsghdr *cmsg,
> -                                       struct timeval *tv)
> +void get_timespec_from_so_timestamp_new(const struct cmsghdr *cmsg,
> +                                        struct timespec *ts)
>  {
>      struct kernel_sock_timeval sock_tv;
>      assert(cmsg->cmsg_level == SOL_SOCKET);
> @@ -180,42 +217,298 @@ void get_timeval_from_so_timestamp_new(const struct
> cmsghdr *cmsg,
>      assert(cmsg->cmsg_len == CMSG_LEN(sizeof(sock_tv)));
>
>      memcpy(&sock_tv, CMSG_DATA(cmsg), sizeof(sock_tv));
> -    tv->tv_sec = sock_tv.tv_sec;
> -    tv->tv_usec = sock_tv.tv_usec;
> +    ts->tv_sec = sock_tv.tv_sec;
> +    ts->tv_nsec = sock_tv.tv_usec * 1000LL;
>  }
>  #endif /* defined(SO_TIMESTAMP_NEW) */
>  #endif /* defined(SO_TIMESTAMP_OLD) */
>
> -void set_socket_option(int sock, int sockopt, int on)
> +void get_timespec_from_so_timestampns(const struct cmsghdr *cmsg,
> +                                      struct timespec *ts)
> +{
> +    assert(cmsg->cmsg_level == SOL_SOCKET);
> +    assert(cmsg->cmsg_type == SCM_TIMESTAMPNS);
> +    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(*ts)));
> +
> +    memcpy(ts, CMSG_DATA(cmsg), sizeof(*ts));
> +}
> +
> +#ifdef SO_TIMESTAMPNS_OLD
> +void get_timespec_from_so_timestampns_old(const struct cmsghdr *cmsg,
> +                                          struct timespec *ts)
> +{
> +    struct kernel_old_timespec old_ts;
> +    assert(cmsg->cmsg_level == SOL_SOCKET);
> +    assert(cmsg->cmsg_type == SO_TIMESTAMPNS_OLD);
> +    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(old_ts)));
> +
> +    memcpy(&old_ts, CMSG_DATA(cmsg), sizeof(old_ts));
> +    ts->tv_sec = old_ts.tv_sec;
> +    ts->tv_nsec = old_ts.tv_nsec;
> +}
> +
> +#ifdef SO_TIMESTAMPNS_NEW
> +void get_timespec_from_so_timestampns_new(const struct cmsghdr *cmsg,
> +                                          struct timespec *ts)
> +{
> +    struct kernel_timespec sock_ts;
> +    assert(cmsg->cmsg_level == SOL_SOCKET);
> +    assert(cmsg->cmsg_type == SO_TIMESTAMPNS_NEW);
> +    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(sock_ts)));
> +
> +    memcpy(&sock_ts, CMSG_DATA(cmsg), sizeof(sock_ts));
> +    ts->tv_sec = sock_ts.tv_sec;
> +    ts->tv_nsec = sock_ts.tv_nsec;
> +}
> +#endif /* defined(SO_TIMESTAMPNS_NEW) */
> +#endif /* defined(SO_TIMESTAMPNS_OLD) */
> +
> +void get_timespec_from_so_timestamping(const struct cmsghdr *cmsg,
> +                                       struct timespec *ts)
> +{
> +    int i;
> +    struct scm_timestamping tss;
> +    assert(cmsg->cmsg_level == SOL_SOCKET);
> +    assert(cmsg->cmsg_type == SCM_TIMESTAMPING);
> +    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tss)));
> +
> +    memcpy(&tss, CMSG_DATA(cmsg), sizeof(tss));
> +
> +    for (i = 0; i < 3; ++i) {
> +        if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {
> +            *ts = tss.ts[i];
> +            return;
> +        }
> +    }
> +    assert(!"All three entries in scm_timestamping are empty");
> +}
> +
> +#ifdef SO_TIMESTAMPING_OLD
> +void get_timespec_from_so_timestamping_old(const struct cmsghdr *cmsg,
> +                                           struct timespec *ts)
> +{
> +    int i;
> +    struct scm_old_timestamping tss;
> +    assert(cmsg->cmsg_level == SOL_SOCKET);
> +    assert(cmsg->cmsg_type == SO_TIMESTAMPING_OLD);
> +    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tss)));
> +
> +    memcpy(&tss, CMSG_DATA(cmsg), sizeof(tss));
> +
> +    for (i = 0; i < 3; ++i) {
> +        if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {
> +            ts->tv_sec = tss.ts[i].tv_sec;
> +            ts->tv_nsec = tss.ts[i].tv_nsec;
> +            return;
> +        }
> +    }
> +    assert(!"All three entries in scm_old_timestamping are empty");
> +}
> +
> +#ifdef SO_TIMESTAMPING_NEW
> +void get_timespec_from_so_timestamping_new(const struct cmsghdr *cmsg,
> +                                           struct timespec *ts)
> +{
> +    int i;
> +    struct scm_timestamping64 tss;
> +    assert(cmsg->cmsg_level == SOL_SOCKET);
> +    assert(cmsg->cmsg_type == SO_TIMESTAMPING_NEW);
> +    assert(cmsg->cmsg_len == CMSG_LEN(sizeof(tss)));
> +
> +    memcpy(&tss, CMSG_DATA(cmsg), sizeof(tss));
> +    for (i = 0; i < 3; ++i) {
> +        if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {
> +            ts->tv_sec = tss.ts[i].tv_sec;
> +            ts->tv_nsec = tss.ts[i].tv_nsec;
> +            return;
> +        }
> +    }
> +    assert(!"All three entries in scm_timestamp64 are empty");
> +}
> +#endif /* defined(SO_TIMESTAMPING_NEW) */
> +#endif /* defined(SO_TIMESTAMPING_OLD) */
> +
> +void set_socket_option(int sock, int sockopt, int set_to)
>  {
>      socklen_t len;
> -    int val = on;
> +    int val = set_to;
>      if (setsockopt(sock, SOL_SOCKET, sockopt, &val, sizeof(val)) < 0) {
>          int err = errno;
> -        fprintf(stderr, "Failed to setsockopt %d (%s): %s\n",
> -                sockopt, on ? "on" : "off", strerror(err));
> +        fprintf(stderr, "Failed at setsockopt(%d, SOL_SOCKET, %d, %d):
> %s\n",
> +                sock, sockopt, set_to, strerror(err));
>          exit(err);
>      }
>
> +#ifdef SO_TIMESTAMPING_NEW
> +    if (sockopt == SO_TIMESTAMPING_NEW) {
> +        /*
> +         * `getsockopt(sock, SOL_SOCKET, SO_TIMESTAMPING_NEW)` not
> implemented
> +         * as of linux kernel v5.8-rc4.
> +         */
> +        return;
> +    }
> +#endif
> +
>      len = sizeof(val);
>      val = -1;
>      if (getsockopt(sock, SOL_SOCKET, sockopt, &val, &len) < 0) {
>          int err = errno;
> -        fprintf(stderr, "Failed to getsockopt (%d): %s\n", sock,
> strerror(err));
> +        fprintf(stderr, "Failed at getsockopt(%d, SOL_SOCKET, %d): %s\n",
> +                sock, sockopt, strerror(err));
>          exit(err);
>      }
>      assert(len == sizeof(val));
> -    assert(val == on);
> +    assert(val == set_to);
> +}
> +
> +void child_steps(int sock, struct sockaddr_in addr, int run_old)
> +{
> +    /* Test 1: SO_TIMESTAMP */
> +    send_current_time(sock, addr);
> +
> +    /* Test 2: SO_TIMESTAMPNS */
> +    printf("Test 2: SO_TIMESTAMPNS\n");
> +    set_socket_option(sock, SO_TIMESTAMPNS, 1);
> +    receive_packet(sock, &get_timespec_from_so_timestampns);
> +    set_socket_option(sock, SO_TIMESTAMPNS, 0);
> +
> +    /* Test 3: SO_TIMESTAMPING */
> +    send_current_time(sock, addr);
> +
> +    if (!run_old) {
> +        return;
> +    }
> +
> +#ifdef SO_TIMESTAMP_OLD
> +    if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
> +        /* Test 4a: SO_TIMESTAMP_OLD */
> +        printf("Test 4a: SO_TIMESTAMP_OLD\n");
> +        set_socket_option(sock, SO_TIMESTAMP_OLD, 1);
> +        receive_packet(sock, &get_timespec_from_so_timestamp_old);
> +        set_socket_option(sock, SO_TIMESTAMP_OLD, 0);
> +    }
> +#ifdef SO_TIMESTAMP_NEW
> +    else {
> +        /* Test 4b: SO_TIMESTAMP_NEW */
> +        printf("Test 4b: SO_TIMESTAMP_NEW\n");
> +        set_socket_option(sock, SO_TIMESTAMP_NEW, 1);
> +        receive_packet(sock, &get_timespec_from_so_timestamp_new);
> +        set_socket_option(sock, SO_TIMESTAMP_NEW, 0);
> +    }
> +#endif /* defined(SO_TIMESTAMP_NEW) */
> +#endif /* defined(SO_TIMESTAMP_OLD) */
> +
> +#ifdef SO_TIMESTAMPNS_OLD
> +    if (SO_TIMESTAMPNS_OLD != SO_TIMESTAMPNS) {
> +        /* Test 5a: SO_TIMESTAMPNS_OLD */
> +        send_current_time(sock, addr);
> +    }
> +#ifdef SO_TIMESTAMPNS_NEW
> +    else {
> +        /* Test 5b: SO_TIMESTAMPNS_NEW */
> +        send_current_time(sock, addr);
> +    }
> +#endif /* defined(SO_TIMESTAMPNS_NEW) */
> +#endif /* defined(SO_TIMESTAMPNS_OLD) */
> +
> +#ifdef SO_TIMESTAMPING_OLD
> +    if (SO_TIMESTAMPING_OLD != SO_TIMESTAMPING) {
> +        /* Test 6a: SO_TIMESTAMPING_OLD */
> +        printf("Test 6a: SO_TIMESTAMPING_OLD\n");
> +        set_socket_option(sock, SO_TIMESTAMPING_OLD,
> so_timestamping_flags);
> +        receive_packet(sock, &get_timespec_from_so_timestamping_old);
> +        set_socket_option(sock, SO_TIMESTAMPING_OLD, 0);
> +    }
> +#ifdef SO_TIMESTAMPING_NEW
> +    else {
> +        /* Test 6b: SO_TIMESTAMPING_NEW */
> +        printf("Test 6b: SO_TIMESTAMPING_NEW\n");
> +        set_socket_option(sock, SO_TIMESTAMPING_NEW,
> so_timestamping_flags);
> +        receive_packet(sock, &get_timespec_from_so_timestamping_new);
> +        set_socket_option(sock, SO_TIMESTAMPING_NEW, 0);
> +    }
> +#endif /* defined(SO_TIMESTAMPING_NEW) */
> +#endif /* defined(SO_TIMESTAMPING_OLD) */
> +}
> +
> +void parent_steps(int sock, struct sockaddr_in addr, int run_old)
> +{
> +    /* Test 1: SO_TIMESTAMP */
> +    printf("Test 1: SO_TIMESTAMP\n");
> +    set_socket_option(sock, SO_TIMESTAMP, 1);
> +    receive_packet(sock, &get_timespec_from_so_timestamp);
> +    set_socket_option(sock, SO_TIMESTAMP, 0);
> +
> +    /* Test 2: SO_TIMESTAMPNS */
> +    send_current_time(sock, addr);
> +
> +    /* Test 3: SO_TIMESTAMPING */
> +    printf("Test 3: SO_TIMESTAMPING\n");
> +    set_socket_option(sock, SO_TIMESTAMPING, so_timestamping_flags);
> +    receive_packet(sock, &get_timespec_from_so_timestamping);
> +    set_socket_option(sock, SO_TIMESTAMPING, 0);
> +
> +    if (!run_old) {
> +        return;
> +    }
> +
> +#ifdef SO_TIMESTAMP_OLD
> +    if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
> +        /* Test 4a: SO_TIMESTAMP_OLD */
> +        send_current_time(sock, addr);
> +    }
> +#ifdef SO_TIMESTAMP_NEW
> +    else {
> +        /* Test 4b: SO_TIMESTAMP_NEW */
> +        send_current_time(sock, addr);
> +    }
> +#endif /* defined(SO_TIMESTAMP_NEW) */
> +#endif /* defined(SO_TIMESTAMP_OLD) */
> +
> +#ifdef SO_TIMESTAMPNS_OLD
> +    if (SO_TIMESTAMPNS_OLD != SO_TIMESTAMPNS) {
> +        /* Test 5a: SO_TIMESTAMPNS_OLD */
> +        printf("Test 5a: SO_TIMESTAMPNS_OLD\n");
> +        set_socket_option(sock, SO_TIMESTAMPNS_OLD, 1);
> +        receive_packet(sock, &get_timespec_from_so_timestampns_old);
> +        set_socket_option(sock, SO_TIMESTAMPNS_OLD, 0);
> +    }
> +#ifdef SO_TIMESTAMPNS_NEW
> +    else {
> +        /* Test 5b: SO_TIMESTAMPNS_NEW */
> +        printf("Test 5b: SO_TIMESTAMPNS_NEW\n");
> +        set_socket_option(sock, SO_TIMESTAMPNS_NEW, 1);
> +        receive_packet(sock, &get_timespec_from_so_timestampns_new);
> +        set_socket_option(sock, SO_TIMESTAMPNS_NEW, 0);
> +    }
> +#endif /* defined(SO_TIMESTAMPNS_NEW) */
> +#endif /* defined(SO_TIMESTAMPNS_OLD) */
> +
> +#ifdef SO_TIMESTAMPING_OLD
> +    if (SO_TIMESTAMPING_OLD != SO_TIMESTAMPING) {
> +        /* Test 6a: SO_TIMESTAMPING_OLD */
> +        send_current_time(sock, addr);
> +    }
> +#ifdef SO_TIMESTAMPING_NEW
> +    else {
> +        /* Test 6b: SO_TIMESTAMPING_NEW */
> +        send_current_time(sock, addr);
> +    }
> +#endif /* defined(SO_TIMESTAMPING_NEW) */
> +#endif /* defined(SO_TIMESTAMPING_OLD) */
>  }
>
>  int main(int argc, char **argv)
>  {
>      int parent_sock, child_sock;
>      struct sockaddr_in parent_sockaddr, child_sockaddr;
> -    int pid;
> +    int pid, run_old;
>      struct timeval tv = {0, 0};
>      gettimeofday(&tv, NULL);
>
> +    /* Too close to y2038 old systems may not work. */
> +    run_old = tv.tv_sec < 0x7fffff00;
> +
>      parent_sock = create_udp_socket(&parent_sockaddr);
>      child_sock = create_udp_socket(&child_sockaddr);
>
> @@ -226,64 +519,15 @@ int main(int argc, char **argv)
>      if (pid < 0) {
>          fprintf(stderr, "SKIPPED. Failed to fork: %s\n", strerror(errno));
>      } else if (pid == 0) {
> -        close(child_sock);
> -
> -        /* Test 1: SO_TIMESTAMP */
> -        send_current_time(parent_sock, child_sockaddr);
> -
> -        if (tv.tv_sec > 0x7fffff00) {
> -            /* Too close to y2038 problem, old system may not work. */
> -            close(parent_sock);
> -            return 0;
> -        }
> -
> -#ifdef SO_TIMESTAMP_OLD
> -        if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
> -            /* Test 2a: SO_TIMESTAMP_OLD */
> -            set_socket_option(parent_sock, SO_TIMESTAMP_OLD, 1);
> -            receive_packet(parent_sock,
> &get_timeval_from_so_timestamp_old);
> -            set_socket_option(parent_sock, SO_TIMESTAMP_OLD, 0);
> -        }
> -#ifdef SO_TIMESTAMP_NEW
> -        else {
> -            /* Test 2b: SO_TIMESTAMP_NEW */
> -            set_socket_option(parent_sock, SO_TIMESTAMP_NEW, 1);
> -            receive_packet(parent_sock,
> &get_timeval_from_so_timestamp_new);
> -            set_socket_option(parent_sock, SO_TIMESTAMP_NEW, 0);
> -        }
> -#endif /* defined(SO_TIMESTAMP_NEW) */
> -#endif /* defined(SO_TIMESTAMP_OLD) */
> -
>          close(parent_sock);
> +        child_steps(child_sock, parent_sockaddr, run_old);
> +        close(child_sock);
>      } else {
>          int child_status;
> -        close(parent_sock);
> -
> -        /* Test 1: SO_TIMESTAMP */
> -        set_socket_option(child_sock, SO_TIMESTAMP, 1);
> -        receive_packet(child_sock, &get_timeval_from_so_timestamp);
> -        set_socket_option(child_sock, SO_TIMESTAMP, 0);
> -
> -        if (tv.tv_sec > 0x7fffff00) {
> -            /* Too close to y2038 problem, old system may not work. */
> -            close(child_sock);
> -            return 0;
> -        }
> -
> -#ifdef SO_TIMESTAMP_OLD
> -        if (SO_TIMESTAMP_OLD != SO_TIMESTAMP) {
> -            /* Test 2a: SO_TIMESTAMP_OLD */
> -            send_current_time(child_sock, parent_sockaddr);
> -        }
> -#ifdef SO_TIMESTAMP_NEW
> -        else {
> -            /* Test 2b: SO_TIMESTAMP_NEW */
> -            send_current_time(child_sock, parent_sockaddr);
> -        }
> -#endif /* defined(SO_TIMESTAMP_NEW) */
> -#endif /* defined(SO_TIMESTAMP_OLD) */
>
>          close(child_sock);
> +        parent_steps(parent_sock, child_sockaddr, run_old);
> +        close(parent_sock);
>
>          if (waitpid(pid, &child_status, 0) < 0) {
>              int err = errno;
> --
> 2.28.0.220.ged08abb693-goog
>
>

--00000000000011995805b6b52fc5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping -- any comments on <a href=3D"https://patchew.org/QEM=
U/cover.1597129029.git.scw@google.com/c1fdce46c35527ea9da34ca26eab4efcdac40=
7db.1597129029.git.scw@google.com/">https://patchew.org/QEMU/cover.15971290=
29.git.scw@google.com/c1fdce46c35527ea9da34ca26eab4efcdac407db.1597129029.g=
it.scw@google.com/</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Aug 11, 2020 at 12:10 AM Shu-Chun Weng &lt;<a=
 href=3D"mailto:scw@google.com">scw@google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">This change supports SO_TIMES=
TAMPNS_OLD/NEW and SO_TIMESTAMPING_OLD/NEW<br>
for setsocketopt() with SOL_SOCKET. Based on the SO_TIMESTAMP_OLD/NEW<br>
framework. The three pairs share the same flag `SOCK_TSTAMP_NEW` in<br>
linux kernel for deciding if the old or the new format is used.<br>
<br>
Signed-off-by: Shu-Chun Weng &lt;<a href=3D"mailto:scw@google.com" target=
=3D"_blank">scw@google.com</a>&gt;<br>
---<br>
v1 -&gt; v2:<br>
=C2=A0 Only keep track of old/new format in a global state.<br>
=C2=A0 Fix style problems.<br>
<br>
=C2=A0linux-user/alpha/sockbits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 13 +-<br>
=C2=A0linux-user/generic/sockbits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A08 +<br>
=C2=A0linux-user/hppa/sockbits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 12 +-<br>
=C2=A0linux-user/mips/sockbits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A08 +<br>
=C2=A0linux-user/sparc/sockbits.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 13 +-<br>
=C2=A0linux-user/strace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 12 +<br>
=C2=A0linux-user/syscall.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 149 ++++++++-<br>
=C2=A0tests/tcg/multiarch/socket_timestamp.c | 442 +++++++++++++++++++-----=
-<br>
=C2=A08 files changed, 540 insertions(+), 117 deletions(-)<br>
<br>
diff --git a/linux-user/alpha/sockbits.h b/linux-user/alpha/sockbits.h<br>
index 40f0644df0..c2c88f432b 100644<br>
--- a/linux-user/alpha/sockbits.h<br>
+++ b/linux-user/alpha/sockbits.h<br>
@@ -51,8 +51,6 @@<br>
<br>
=C2=A0#define TARGET_SO_PEERSEC=C2=A0 =C2=A0 =C2=A0 =C2=A030<br>
=C2=A0#define TARGET_SO_PASSSEC=C2=A0 =C2=A0 =C2=A0 =C2=A034<br>
-#define TARGET_SO_TIMESTAMPNS=C2=A0 =C2=A0 =C2=A0 =C2=A035<br>
-#define TARGET_SCM_TIMESTAMPNS=C2=A0 =C2=A0 =C2=A0 TARGET_SO_TIMESTAMPNS<b=
r>
<br>
=C2=A0/* Security levels - as per NRL IPv6 - don&#39;t actually do anything=
 */<br>
=C2=A0#define TARGET_SO_SECURITY_AUTHENTICATION=C2=A0 =C2=A0 =C2=A0 =C2=A01=
9<br>
@@ -61,9 +59,6 @@<br>
<br>
=C2=A0#define TARGET_SO_MARK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 36<br>
<br>
-#define TARGET_SO_TIMESTAMPING=C2=A0 =C2=A0 =C2=A0 37<br>
-#define TARGET_SCM_TIMESTAMPING TARGET_SO_TIMESTAMPING<br>
-<br>
=C2=A0#define TARGET_SO_RXQ_OVFL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A040<br>
<br>
=C2=A0#define TARGET_SO_WIFI_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A041<br>
@@ -75,9 +70,17 @@<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 29<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_OLD<br>
+#define TARGET_SO_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0 35<br>
+#define TARGET_SCM_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_OLD<br>
+#define TARGET_SO_TIMESTAMPING_OLD=C2=A0 =C2=A0 =C2=A037<br>
+#define TARGET_SCM_TIMESTAMPING_OLD=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_OL=
D<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 63<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_NEW<br>
+#define TARGET_SO_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0 64<br>
+#define TARGET_SCM_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_NEW<br>
+#define TARGET_SO_TIMESTAMPING_NEW=C2=A0 =C2=A0 =C2=A065<br>
+#define TARGET_SCM_TIMESTAMPING_NEW=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_NE=
W<br>
<br>
=C2=A0/* TARGET_O_NONBLOCK clashes with the bits used for socket types.=C2=
=A0 Therefore we<br>
=C2=A0 * have to define SOCK_NONBLOCK to a different value here.<br>
diff --git a/linux-user/generic/sockbits.h b/linux-user/generic/sockbits.h<=
br>
index 532cf2d3dc..a0496d8751 100644<br>
--- a/linux-user/generic/sockbits.h<br>
+++ b/linux-user/generic/sockbits.h<br>
@@ -56,8 +56,16 @@<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 29<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_OLD<br>
+#define TARGET_SO_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0 35<br>
+#define TARGET_SCM_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_OLD<br>
+#define TARGET_SO_TIMESTAMPING_OLD=C2=A0 =C2=A0 =C2=A037<br>
+#define TARGET_SCM_TIMESTAMPING_OLD=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_OL=
D<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 63<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_NEW<br>
+#define TARGET_SO_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0 64<br>
+#define TARGET_SCM_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_NEW<br>
+#define TARGET_SO_TIMESTAMPING_NEW=C2=A0 =C2=A0 =C2=A065<br>
+#define TARGET_SCM_TIMESTAMPING_NEW=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_NE=
W<br>
<br>
=C2=A0#endif<br>
diff --git a/linux-user/hppa/sockbits.h b/linux-user/hppa/sockbits.h<br>
index 284a47e74e..d7e9aa340d 100644<br>
--- a/linux-user/hppa/sockbits.h<br>
+++ b/linux-user/hppa/sockbits.h<br>
@@ -29,8 +29,6 @@<br>
=C2=A0#define TARGET_SO_BSDCOMPAT=C2=A0 =C2=A0 0x400e<br>
=C2=A0#define TARGET_SO_PASSCRED=C2=A0 =C2=A0 =C2=A00x4010<br>
=C2=A0#define TARGET_SO_PEERCRED=C2=A0 =C2=A0 =C2=A00x4011<br>
-#define TARGET_SO_TIMESTAMPNS=C2=A0 0x4013<br>
-#define TARGET_SCM_TIMESTAMPNS TARGET_SO_TIMESTAMPNS<br>
<br>
=C2=A0#define TARGET_SO_SECURITY_AUTHENTICATION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x4016<br>
=C2=A0#define TARGET_SO_SECURITY_ENCRYPTION_TRANSPORT=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x4017<br>
@@ -44,8 +42,6 @@<br>
=C2=A0#define TARGET_SO_PEERSEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x401d<br>
=C2=A0#define TARGET_SO_PASSSEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x401e<br>
=C2=A0#define TARGET_SO_MARK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x401f<br>
-#define TARGET_SO_TIMESTAMPING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x4020<br>
-#define TARGET_SCM_TIMESTAMPING=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_SO_TIMES=
TAMPING<br>
=C2=A0#define TARGET_SO_RXQ_OVFL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x4021<br>
=C2=A0#define TARGET_SO_WIFI_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x402=
2<br>
=C2=A0#define TARGET_SCM_WIFI_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGE=
T_SO_WIFI_STATUS<br>
@@ -67,9 +63,17 @@<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4012<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_OLD<br>
+#define TARGET_SO_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0 0x4013<br>
+#define TARGET_SCM_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_OLD<br>
+#define TARGET_SO_TIMESTAMPING_OLD=C2=A0 =C2=A0 =C2=A00x4020<br>
+#define TARGET_SCM_TIMESTAMPING_OLD=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_OL=
D<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x4038<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_NEW<br>
+#define TARGET_SO_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0 0x4039<br>
+#define TARGET_SCM_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_NEW<br>
+#define TARGET_SO_TIMESTAMPING_NEW=C2=A0 =C2=A0 =C2=A00x403A<br>
+#define TARGET_SCM_TIMESTAMPING_NEW=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_NE=
W<br>
<br>
=C2=A0/* TARGET_O_NONBLOCK clashes with the bits used for socket types.=C2=
=A0 Therefore we<br>
=C2=A0 * have to define SOCK_NONBLOCK to a different value here.<br>
diff --git a/linux-user/mips/sockbits.h b/linux-user/mips/sockbits.h<br>
index b4c39d9588..49524e23ac 100644<br>
--- a/linux-user/mips/sockbits.h<br>
+++ b/linux-user/mips/sockbits.h<br>
@@ -69,9 +69,17 @@<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 29<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_OLD<br>
+#define TARGET_SO_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0 35<br>
+#define TARGET_SCM_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_OLD<br>
+#define TARGET_SO_TIMESTAMPING_OLD=C2=A0 =C2=A0 =C2=A037<br>
+#define TARGET_SCM_TIMESTAMPING_OLD=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_OL=
D<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 63<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_NEW<br>
+#define TARGET_SO_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0 64<br>
+#define TARGET_SCM_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_NEW<br>
+#define TARGET_SO_TIMESTAMPING_NEW=C2=A0 =C2=A0 =C2=A065<br>
+#define TARGET_SCM_TIMESTAMPING_NEW=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_NE=
W<br>
<br>
=C2=A0/** sock_type - Socket types<br>
=C2=A0 *<br>
diff --git a/linux-user/sparc/sockbits.h b/linux-user/sparc/sockbits.h<br>
index 07440efd14..c5fade3ad1 100644<br>
--- a/linux-user/sparc/sockbits.h<br>
+++ b/linux-user/sparc/sockbits.h<br>
@@ -51,14 +51,9 @@<br>
<br>
=C2=A0#define TARGET_SO_PEERSEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x001e<br>
=C2=A0#define TARGET_SO_PASSSEC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x001f<br>
-#define TARGET_SO_TIMESTAMPNS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0021<br>
-#define TARGET_SCM_TIMESTAMPNS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMPNS<br>
<br>
=C2=A0#define TARGET_SO_MARK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00x0022<br>
<br>
-#define TARGET_SO_TIMESTAMPING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0023<br>
-#define TARGET_SCM_TIMESTAMPING=C2=A0 =C2=A0 =C2=A0 =C2=A0 TARGET_SO_TIMES=
TAMPING<br>
-<br>
=C2=A0#define TARGET_SO_RXQ_OVFL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00x0024<br>
<br>
=C2=A0#define TARGET_SO_WIFI_STATUS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x002=
5<br>
@@ -104,9 +99,17 @@<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x001d<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_OLD=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_OLD<br>
+#define TARGET_SO_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0 0x0021<br>
+#define TARGET_SCM_TIMESTAMPNS_OLD=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_OLD<br>
+#define TARGET_SO_TIMESTAMPING_OLD=C2=A0 =C2=A0 =C2=A00x0023<br>
+#define TARGET_SCM_TIMESTAMPING_OLD=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_OL=
D<br>
<br>
=C2=A0#define TARGET_SO_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0046<br>
=C2=A0#define TARGET_SCM_TIMESTAMP_NEW=C2=A0 =C2=A0 =C2=A0 =C2=A0TARGET_SO_=
TIMESTAMP_NEW<br>
+#define TARGET_SO_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0 0x0042<br>
+#define TARGET_SCM_TIMESTAMPNS_NEW=C2=A0 =C2=A0 =C2=A0TARGET_SO_TIMESTAMPN=
S_NEW<br>
+#define TARGET_SO_TIMESTAMPING_NEW=C2=A0 =C2=A0 =C2=A00x0043<br>
+#define TARGET_SCM_TIMESTAMPING_NEW=C2=A0 =C2=A0 TARGET_SO_TIMESTAMPING_NE=
W<br>
<br>
=C2=A0/* Security levels - as per NRL IPv6 - don&#39;t actually do anything=
 */<br>
=C2=A0#define TARGET_SO_SECURITY_AUTHENTICATION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x5001<br>
diff --git a/linux-user/strace.c b/linux-user/strace.c<br>
index a11a5e9e86..7aabb3c972 100644<br>
--- a/linux-user/strace.c<br>
+++ b/linux-user/strace.c<br>
@@ -2260,9 +2260,21 @@ print_optint:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TARGET_SO_TIMESTAMP_OLD:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;SO_TIMESTAMP=
_OLD,&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto print_optint;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPNS_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;SO_TIMESTAMPNS_OL=
D,&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPING_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;SO_TIMESTAMPING_O=
LD,&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TARGET_SO_TIMESTAMP_NEW:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;SO_TIMESTAMP=
_NEW,&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto print_optint;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPNS_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;SO_TIMESTAMPNS_NE=
W,&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPING_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log(&quot;SO_TIMESTAMPING_N=
EW,&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto print_optint;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TARGET_SO_RCVLOWAT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_log(&quot;SO_RCVLOWAT,=
&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto print_optint;<br>
diff --git a/linux-user/syscall.c b/linux-user/syscall.c<br>
index e6b1a18cc0..bfc4219104 100644<br>
--- a/linux-user/syscall.c<br>
+++ b/linux-user/syscall.c<br>
@@ -1771,6 +1771,34 @@ static inline abi_long host_to_target_cmsg(struct ta=
rget_msghdr *target_msgh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SCM_TIMESTAMPNS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (target_exp=
ected_timestamp_version) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt_=
len =3D sizeof(struct target_timespec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targ=
et_cmsg-&gt;cmsg_type =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tswap32(TARGET_SCM_TIMESTAMPNS_OLD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt_=
len =3D sizeof(struct target__kernel_timespec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targ=
et_cmsg-&gt;cmsg_type =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tswap32(TARGET_SCM_TIMESTAMPNS_NEW);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SCM_TIMESTAMPING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (target_exp=
ected_timestamp_version) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt_=
len =3D sizeof(struct target_timespec[3]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targ=
et_cmsg-&gt;cmsg_type =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tswap32(TARGET_SCM_TIMESTAMPING_OLD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tgt_=
len =3D sizeof(struct target__kernel_timespec[3]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targ=
et_cmsg-&gt;cmsg_type =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tswap32(TARGET_SCM_TIMESTAMPING_NEW);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -1838,6 +1866,81 @@ static inline abi_long host_to_target_cmsg(struct ta=
rget_msghdr *target_msgh,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SCM_TIMESTAMPNS:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec *t=
s =3D (struct timespec *)data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len !=3D sizeo=
f(struct timespec)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto=
 unimplemented;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (target_exp=
ected_timestamp_version) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct target_timespec *target_ts =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (struct target_timespec *)target_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
tgt_len !=3D sizeof(struct target_timespec)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto unimplemented;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __pu=
t_user(ts-&gt;tv_sec, &amp;target_ts-&gt;tv_sec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __pu=
t_user(ts-&gt;tv_nsec, &amp;target_ts-&gt;tv_nsec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct target__kernel_timespec *target_ts =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (struct target__kernel_timespec *)target_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
tgt_len !=3D sizeof(struct target__kernel_timespec)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto unimplemented;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __pu=
t_user(ts-&gt;tv_sec, &amp;target_ts-&gt;tv_sec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __pu=
t_user(ts-&gt;tv_nsec, &amp;target_ts-&gt;tv_nsec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case SCM_TIMESTAMPING:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec *t=
s =3D (struct timespec *)data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len !=3D sizeo=
f(struct timespec[3])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto=
 unimplemented;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (target_exp=
ected_timestamp_version) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct target_timespec *target_ts =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (struct target_timespec *)target_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
tgt_len !=3D sizeof(struct target_timespec[3])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto unimplemented;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
(i =3D 0; i &lt; 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __put_user(ts[i].tv_sec, &amp;target_ts[i].tv_sec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __put_user(ts[i].tv_nsec, &amp;target_ts[i].tv_nsec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_TIMEST=
AMP_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stru=
ct target__kernel_timespec *target_ts =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (struct target__kernel_timespec *)target_data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (=
tgt_len !=3D sizeof(struct target__kernel_timespec[3])) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto unimplemented;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
(i =3D 0; i &lt; 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __put_user(ts[i].tv_sec, &amp;target_ts[i].tv_sec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 __put_user(ts[i].tv_nsec, &amp;target_ts[i].tv_nsec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SCM_CREDENTIALS:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ucred =
*cred =3D (struct ucred *)data;<br>
@@ -2381,6 +2484,22 @@ set_timeout:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_timest=
amp_version =3D TARGET_TIMESTAMP_NEW;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optname =3D S=
O_TIMESTAMP;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPNS_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_timestamp_v=
ersion =3D TARGET_TIMESTAMP_OLD;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIM=
ESTAMPNS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPNS_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_timestamp_v=
ersion =3D TARGET_TIMESTAMP_NEW;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIM=
ESTAMPNS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPING_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_timestamp_v=
ersion =3D TARGET_TIMESTAMP_OLD;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIM=
ESTAMPING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPING_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_timestamp_v=
ersion =3D TARGET_TIMESTAMP_NEW;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIM=
ESTAMPING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TARGET_SO_RCVLOWAT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_RCVL=
OWAT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
@@ -2393,7 +2512,9 @@ set_timeout:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_user_u32(val, optval_addr))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -TARGET_EFAULT;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_errno(setsockopt(sockfd, SOL_SOCKET=
, optname, &amp;val, sizeof(val)));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_error(ret) &amp;&amp; optname =3D=3D S=
O_TIMESTAMP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!is_error(ret) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (optname =3D=3D SO_TIMESTAMP || =
optname =3D=3D SO_TIMESTAMPNS ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optname =3D=3D SO_TIMESTAM=
PING)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_expected_timestamp_v=
ersion =3D target_timestamp_version;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
@@ -2637,6 +2758,26 @@ get_timeout:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(target_expec=
ted_timestamp_version =3D=3D TARGET_TIMESTAMP_NEW);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optname =3D SO_TIMESTAMP;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto int_case;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPNS_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timestamp_format_matches =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_expected_t=
imestamp_version =3D=3D TARGET_TIMESTAMP_OLD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIMESTAMPNS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto int_case;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPNS_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timestamp_format_matches =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_expected_t=
imestamp_version =3D=3D TARGET_TIMESTAMP_NEW);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIMESTAMPNS;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto int_case;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPING_OLD:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timestamp_format_matches =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_expected_t=
imestamp_version =3D=3D TARGET_TIMESTAMP_OLD);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIMESTAMPING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto int_case;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TARGET_SO_TIMESTAMPING_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timestamp_format_matches =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (target_expected_t=
imestamp_version =3D=3D TARGET_TIMESTAMP_NEW);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optname =3D SO_TIMESTAMPING;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto int_case;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case TARGET_SO_RCVLOWAT:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optname =3D SO_RCVLOWAT;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto int_case;<br>
@@ -2661,9 +2802,9 @@ get_timeout:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (optname =3D=3D SO_TYPE) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val =3D host_to_target_sock=
_type(val);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (optname =3D=3D SO_TIMESTAMP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D val &amp;&amp; timestamp=
_format_matches;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if ((optname =3D=3D SO_TIMESTAMP || opt=
name =3D=3D SO_TIMESTAMPNS ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 optn=
ame =3D=3D SO_TIMESTAMPING) &amp;&amp; !timestamp_format_matches) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (len &gt; lv)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D lv;<br>
diff --git a/tests/tcg/multiarch/socket_timestamp.c b/tests/tcg/multiarch/s=
ocket_timestamp.c<br>
index 71ab1845de..3ae833ad44 100644<br>
--- a/tests/tcg/multiarch/socket_timestamp.c<br>
+++ b/tests/tcg/multiarch/socket_timestamp.c<br>
@@ -1,5 +1,6 @@<br>
=C2=A0#include &lt;assert.h&gt;<br>
=C2=A0#include &lt;errno.h&gt;<br>
+#include &lt;linux/net_tstamp.h&gt;<br>
=C2=A0#include &lt;linux/types.h&gt;<br>
=C2=A0#include &lt;netinet/in.h&gt;<br>
=C2=A0#include &lt;stdint.h&gt;<br>
@@ -11,6 +12,7 @@<br>
=C2=A0#include &lt;sys/time.h&gt;<br>
=C2=A0#include &lt;sys/types.h&gt;<br>
=C2=A0#include &lt;sys/wait.h&gt;<br>
+#include &lt;time.h&gt;<br>
=C2=A0#include &lt;unistd.h&gt;<br>
<br>
=C2=A0#ifdef __kernel_old_timeval<br>
@@ -27,6 +29,33 @@ struct kernel_sock_timeval {<br>
=C2=A0 =C2=A0 =C2=A0int64_t tv_usec;<br>
=C2=A0};<br>
<br>
+struct kernel_old_timespec {<br>
+=C2=A0 =C2=A0 __kernel_long_t tv_sec;<br>
+=C2=A0 =C2=A0 long=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tv_nsec;<br>
+};<br>
+<br>
+struct kernel_timespec {<br>
+=C2=A0 =C2=A0 int64_t=C2=A0 =C2=A0tv_sec;<br>
+=C2=A0 =C2=A0 long long tv_nsec;<br>
+};<br>
+<br>
+struct scm_timestamping {<br>
+=C2=A0 =C2=A0 struct timespec ts[3];<br>
+};<br>
+<br>
+struct scm_old_timestamping {<br>
+=C2=A0 =C2=A0 struct kernel_old_timespec ts[3];<br>
+};<br>
+<br>
+struct scm_timestamping64 {<br>
+=C2=A0 =C2=A0 struct kernel_timespec ts[3];<br>
+};<br>
+<br>
+const int so_timestamping_flags =3D<br>
+=C2=A0 =C2=A0 SOF_TIMESTAMPING_RX_HARDWARE |<br>
+=C2=A0 =C2=A0 SOF_TIMESTAMPING_RX_SOFTWARE |<br>
+=C2=A0 =C2=A0 SOF_TIMESTAMPING_SOFTWARE;<br>
+<br>
=C2=A0int create_udp_socket(struct sockaddr_in *sockaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0socklen_t sockaddr_len;<br>
@@ -61,43 +90,47 @@ int create_udp_socket(struct sockaddr_in *sockaddr)<br>
=C2=A0 * Checks that the timestamp in the message is not after the receptio=
n timestamp<br>
=C2=A0 * as well as the reception time is within 10 seconds of the message =
time.<br>
=C2=A0 */<br>
-void check_timestamp_difference(const struct timeval *msg_tv,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct timeval *pkt_tv)<br>
+void check_timestamp_difference(const struct timespec *msg_ts,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct timespec *pkt_ts)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 if (pkt_tv-&gt;tv_sec &lt; msg_tv-&gt;tv_sec ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (pkt_tv-&gt;tv_sec =3D=3D msg_tv-&gt;tv_sec &a=
mp;&amp; pkt_tv-&gt;tv_usec &lt; msg_tv-&gt;tv_usec))<br>
+=C2=A0 =C2=A0 if (pkt_ts-&gt;tv_sec &lt; msg_ts-&gt;tv_sec ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (pkt_ts-&gt;tv_sec =3D=3D msg_ts-&gt;tv_sec &a=
mp;&amp; pkt_ts-&gt;tv_nsec &lt; msg_ts-&gt;tv_nsec))<br>
=C2=A0 =C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Packet recei=
ved before sent: %lld.%06lld &lt; %lld.%06lld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)pkt_tv-=
&gt;tv_sec, (long long)pkt_tv-&gt;tv_usec,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)msg_tv-=
&gt;tv_sec, (long long)msg_tv-&gt;tv_usec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Packet recei=
ved before sent: %lld.%06lld &lt; %lld.%09lld\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)pkt_ts-=
&gt;tv_sec, (long long)pkt_ts-&gt;tv_nsec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)msg_ts-=
&gt;tv_sec, (long long)msg_ts-&gt;tv_nsec);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(-1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (pkt_tv-&gt;tv_sec &gt; msg_tv-&gt;tv_sec + 10 ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (pkt_tv-&gt;tv_sec =3D=3D msg_tv-&gt;tv_sec + =
10 &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkt_tv-&gt;tv_usec &gt; msg_tv-&gt;tv_us=
ec)) {<br>
+=C2=A0 =C2=A0 if (pkt_ts-&gt;tv_sec &gt; msg_ts-&gt;tv_sec + 10 ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (pkt_ts-&gt;tv_sec =3D=3D msg_ts-&gt;tv_sec + =
10 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkt_ts-&gt;tv_nsec &gt; msg_ts-&gt;tv_ns=
ec)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Packet =
received more than 10 seconds after sent: &quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%lld.%06lld =
&gt; %lld.%06lld + 10\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)pkt_tv-=
&gt;tv_sec, (long long)pkt_tv-&gt;tv_usec,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)msg_tv-=
&gt;tv_sec, (long long)msg_tv-&gt;tv_usec);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%lld.%06lld =
&gt; %lld.%09lld + 10\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)pkt_ts-=
&gt;tv_sec, (long long)pkt_ts-&gt;tv_nsec,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (long long)msg_ts-=
&gt;tv_sec, (long long)msg_ts-&gt;tv_nsec);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(-1);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
=C2=A0void send_current_time(int sock, struct sockaddr_in server_sockaddr)<=
br>
=C2=A0{<br>
-=C2=A0 =C2=A0 struct timeval tv =3D {0, 0};<br>
-=C2=A0 =C2=A0 gettimeofday(&amp;tv, NULL);<br>
-=C2=A0 =C2=A0 sendto(sock, &amp;tv, sizeof(tv), 0, (struct sockaddr *)&amp=
;server_sockaddr,<br>
+=C2=A0 =C2=A0 struct timespec ts =3D {0, 0};<br>
+=C2=A0 =C2=A0 clock_gettime(CLOCK_REALTIME, &amp;ts);<br>
+#ifdef MSG_CONFIRM<br>
+=C2=A0 =C2=A0 const int flags =3D MSG_CONFIRM;<br>
+#else<br>
+=C2=A0 =C2=A0 const int flags =3D 0;<br>
+#endif<br>
+=C2=A0 =C2=A0 sendto(sock, &amp;ts, sizeof(ts), flags, (struct sockaddr *)=
&amp;server_sockaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(server_sockaddr));<br>
=C2=A0}<br>
<br>
-typedef void (*get_timeval_t)(const struct cmsghdr *cmsg, struct timeval *=
tv);<br>
+typedef void (*get_timespec_t)(const struct cmsghdr *cmsg, struct timespec=
 *tv);<br>
<br>
-<br>
-void receive_packet(int sock, get_timeval_t get_timeval)<br>
+void receive_packet(int sock, get_timespec_t get_timespec)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct msghdr msg =3D {0};<br>
<br>
@@ -113,7 +146,7 @@ void receive_packet(int sock, get_timeval_t get_timeval=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct cmsghdr align;<br>
=C2=A0 =C2=A0 =C2=A0} u;<br>
=C2=A0 =C2=A0 =C2=A0struct cmsghdr *cmsg;<br>
-=C2=A0 =C2=A0 struct timeval msg_tv, pkt_tv;<br>
+=C2=A0 =C2=A0 struct timespec msg_ts, pkt_ts;<br>
<br>
=C2=A0 =C2=A0 =C2=A0int res;<br>
<br>
@@ -134,31 +167,35 @@ void receive_packet(int sock, get_timeval_t get_timev=
al)<br>
<br>
=C2=A0 =C2=A0 =C2=A0assert(res =3D=3D sizeof(struct timeval));<br>
=C2=A0 =C2=A0 =C2=A0assert(iov.iov_base =3D=3D iobuf);<br>
-=C2=A0 =C2=A0 memcpy(&amp;msg_tv, iov.iov_base, sizeof(msg_tv));<br>
-=C2=A0 =C2=A0 printf(&quot;Message timestamp: %lld.%06lld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long)msg_tv.tv_sec, (long l=
ong)msg_tv.tv_usec);<br>
+=C2=A0 =C2=A0 memcpy(&amp;msg_ts, iov.iov_base, sizeof(msg_ts));<br>
+=C2=A0 =C2=A0 printf(&quot;Message timestamp: %lld.%09lld\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long)msg_ts.tv_sec, (long l=
ong)msg_ts.tv_nsec);<br>
<br>
=C2=A0 =C2=A0 =C2=A0cmsg =3D CMSG_FIRSTHDR(&amp;msg);<br>
=C2=A0 =C2=A0 =C2=A0assert(cmsg);<br>
-=C2=A0 =C2=A0 (*get_timeval)(cmsg, &amp;pkt_tv);<br>
-=C2=A0 =C2=A0 printf(&quot;Packet timestamp: %lld.%06lld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long)pkt_tv.tv_sec, (long l=
ong)pkt_tv.tv_usec);<br>
+=C2=A0 =C2=A0 (*get_timespec)(cmsg, &amp;pkt_ts);<br>
+=C2=A0 =C2=A0 printf(&quot;Packet timestamp: %lld.%09lld\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(long long)pkt_ts.tv_sec, (long l=
ong)pkt_ts.tv_nsec);<br>
<br>
-=C2=A0 =C2=A0 check_timestamp_difference(&amp;msg_tv, &amp;pkt_tv);<br>
+=C2=A0 =C2=A0 check_timestamp_difference(&amp;msg_ts, &amp;pkt_ts);<br>
=C2=A0}<br>
<br>
-void get_timeval_from_so_timestamp(const struct cmsghdr *cmsg,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct timeval *tv)<br>
+void get_timespec_from_so_timestamp(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec *ts)<b=
r>
=C2=A0{<br>
+=C2=A0 =C2=A0 struct timeval tv;<br>
=C2=A0 =C2=A0 =C2=A0assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
=C2=A0 =C2=A0 =C2=A0assert(cmsg-&gt;cmsg_type =3D=3D SCM_TIMESTAMP);<br>
-=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(struct timev=
al)));<br>
-=C2=A0 =C2=A0 memcpy(tv, CMSG_DATA(cmsg), sizeof(*tv));<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(tv)));<br>
+<br>
+=C2=A0 =C2=A0 memcpy(&amp;tv, CMSG_DATA(cmsg), sizeof(tv));<br>
+=C2=A0 =C2=A0 ts-&gt;tv_sec =3D tv.tv_sec;<br>
+=C2=A0 =C2=A0 ts-&gt;tv_nsec =3D tv.tv_usec * 1000LL;<br>
=C2=A0}<br>
<br>
=C2=A0#ifdef SO_TIMESTAMP_OLD<br>
-void get_timeval_from_so_timestamp_old(const struct cmsghdr *cmsg,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ti=
meval *tv)<br>
+void get_timespec_from_so_timestamp_old(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct t=
imespec *ts)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct kernel_old_timeval old_tv;<br>
=C2=A0 =C2=A0 =C2=A0assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
@@ -166,13 +203,13 @@ void get_timeval_from_so_timestamp_old(const struct c=
msghdr *cmsg,<br>
=C2=A0 =C2=A0 =C2=A0assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(old_tv)=
));<br>
<br>
=C2=A0 =C2=A0 =C2=A0memcpy(&amp;old_tv, CMSG_DATA(cmsg), sizeof(old_tv));<b=
r>
-=C2=A0 =C2=A0 tv-&gt;tv_sec =3D old_tv.tv_sec;<br>
-=C2=A0 =C2=A0 tv-&gt;tv_usec =3D old_tv.tv_usec;<br>
+=C2=A0 =C2=A0 ts-&gt;tv_sec =3D old_tv.tv_sec;<br>
+=C2=A0 =C2=A0 ts-&gt;tv_nsec =3D old_tv.tv_usec * 1000LL;<br>
=C2=A0}<br>
<br>
=C2=A0#ifdef SO_TIMESTAMP_NEW<br>
-void get_timeval_from_so_timestamp_new(const struct cmsghdr *cmsg,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ti=
meval *tv)<br>
+void get_timespec_from_so_timestamp_new(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct t=
imespec *ts)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct kernel_sock_timeval sock_tv;<br>
=C2=A0 =C2=A0 =C2=A0assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
@@ -180,42 +217,298 @@ void get_timeval_from_so_timestamp_new(const struct =
cmsghdr *cmsg,<br>
=C2=A0 =C2=A0 =C2=A0assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(sock_tv=
)));<br>
<br>
=C2=A0 =C2=A0 =C2=A0memcpy(&amp;sock_tv, CMSG_DATA(cmsg), sizeof(sock_tv));=
<br>
-=C2=A0 =C2=A0 tv-&gt;tv_sec =3D sock_tv.tv_sec;<br>
-=C2=A0 =C2=A0 tv-&gt;tv_usec =3D sock_tv.tv_usec;<br>
+=C2=A0 =C2=A0 ts-&gt;tv_sec =3D sock_tv.tv_sec;<br>
+=C2=A0 =C2=A0 ts-&gt;tv_nsec =3D sock_tv.tv_usec * 1000LL;<br>
=C2=A0}<br>
=C2=A0#endif /* defined(SO_TIMESTAMP_NEW) */<br>
=C2=A0#endif /* defined(SO_TIMESTAMP_OLD) */<br>
<br>
-void set_socket_option(int sock, int sockopt, int on)<br>
+void get_timespec_from_so_timestampns(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timespec=
 *ts)<br>
+{<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_type =3D=3D SCM_TIMESTAMPNS);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(*ts)));<br>
+<br>
+=C2=A0 =C2=A0 memcpy(ts, CMSG_DATA(cmsg), sizeof(*ts));<br>
+}<br>
+<br>
+#ifdef SO_TIMESTAMPNS_OLD<br>
+void get_timespec_from_so_timestampns_old(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct timespec *ts)<br>
+{<br>
+=C2=A0 =C2=A0 struct kernel_old_timespec old_ts;<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_type =3D=3D SO_TIMESTAMPNS_OLD);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(old_ts)));<b=
r>
+<br>
+=C2=A0 =C2=A0 memcpy(&amp;old_ts, CMSG_DATA(cmsg), sizeof(old_ts));<br>
+=C2=A0 =C2=A0 ts-&gt;tv_sec =3D old_ts.tv_sec;<br>
+=C2=A0 =C2=A0 ts-&gt;tv_nsec =3D old_ts.tv_nsec;<br>
+}<br>
+<br>
+#ifdef SO_TIMESTAMPNS_NEW<br>
+void get_timespec_from_so_timestampns_new(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct timespec *ts)<br>
+{<br>
+=C2=A0 =C2=A0 struct kernel_timespec sock_ts;<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_type =3D=3D SO_TIMESTAMPNS_NEW);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(sock_ts)));<=
br>
+<br>
+=C2=A0 =C2=A0 memcpy(&amp;sock_ts, CMSG_DATA(cmsg), sizeof(sock_ts));<br>
+=C2=A0 =C2=A0 ts-&gt;tv_sec =3D sock_ts.tv_sec;<br>
+=C2=A0 =C2=A0 ts-&gt;tv_nsec =3D sock_ts.tv_nsec;<br>
+}<br>
+#endif /* defined(SO_TIMESTAMPNS_NEW) */<br>
+#endif /* defined(SO_TIMESTAMPNS_OLD) */<br>
+<br>
+void get_timespec_from_so_timestamping(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct ti=
mespec *ts)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct scm_timestamping tss;<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_type =3D=3D SCM_TIMESTAMPING);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(tss)));<br>
+<br>
+=C2=A0 =C2=A0 memcpy(&amp;tss, CMSG_DATA(cmsg), sizeof(tss));<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ts =3D tss.ts[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 assert(!&quot;All three entries in scm_timestamping are empt=
y&quot;);<br>
+}<br>
+<br>
+#ifdef SO_TIMESTAMPING_OLD<br>
+void get_timespec_from_so_timestamping_old(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct timespec *ts)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct scm_old_timestamping tss;<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_type =3D=3D SO_TIMESTAMPING_OLD);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(tss)));<br>
+<br>
+=C2=A0 =C2=A0 memcpy(&amp;tss, CMSG_DATA(cmsg), sizeof(tss));<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts-&gt;tv_sec =3D tss.ts[i].tv_s=
ec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts-&gt;tv_nsec =3D tss.ts[i].tv_=
nsec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 assert(!&quot;All three entries in scm_old_timestamping are =
empty&quot;);<br>
+}<br>
+<br>
+#ifdef SO_TIMESTAMPING_NEW<br>
+void get_timespec_from_so_timestamping_new(const struct cmsghdr *cmsg,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0struct timespec *ts)<br>
+{<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 struct scm_timestamping64 tss;<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_level =3D=3D SOL_SOCKET);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_type =3D=3D SO_TIMESTAMPING_NEW);<br>
+=C2=A0 =C2=A0 assert(cmsg-&gt;cmsg_len =3D=3D CMSG_LEN(sizeof(tss)));<br>
+<br>
+=C2=A0 =C2=A0 memcpy(&amp;tss, CMSG_DATA(cmsg), sizeof(tss));<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; 3; ++i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tss.ts[i].tv_sec || tss.ts[i].tv_nsec) {<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts-&gt;tv_sec =3D tss.ts[i].tv_s=
ec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ts-&gt;tv_nsec =3D tss.ts[i].tv_=
nsec;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 assert(!&quot;All three entries in scm_timestamp64 are empty=
&quot;);<br>
+}<br>
+#endif /* defined(SO_TIMESTAMPING_NEW) */<br>
+#endif /* defined(SO_TIMESTAMPING_OLD) */<br>
+<br>
+void set_socket_option(int sock, int sockopt, int set_to)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0socklen_t len;<br>
-=C2=A0 =C2=A0 int val =3D on;<br>
+=C2=A0 =C2=A0 int val =3D set_to;<br>
=C2=A0 =C2=A0 =C2=A0if (setsockopt(sock, SOL_SOCKET, sockopt, &amp;val, siz=
eof(val)) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Failed to setsockopt %d =
(%s): %s\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sockopt, on ? &quo=
t;on&quot; : &quot;off&quot;, strerror(err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Failed at setsockopt(%d,=
 SOL_SOCKET, %d, %d): %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock, sockopt, set=
_to, strerror(err));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(err);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+#ifdef SO_TIMESTAMPING_NEW<br>
+=C2=A0 =C2=A0 if (sockopt =3D=3D SO_TIMESTAMPING_NEW) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* `getsockopt(sock, SOL_SOCKET, SO_TIMES=
TAMPING_NEW)` not implemented<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* as of linux kernel v5.8-rc4.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+#endif<br>
+<br>
=C2=A0 =C2=A0 =C2=A0len =3D sizeof(val);<br>
=C2=A0 =C2=A0 =C2=A0val =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0if (getsockopt(sock, SOL_SOCKET, sockopt, &amp;val, &am=
p;len) &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D errno;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Failed to getsockopt (%d=
): %s\n&quot;, sock, strerror(err));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Failed at getsockopt(%d,=
 SOL_SOCKET, %d): %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sock, sockopt, str=
error(err));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit(err);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0assert(len =3D=3D sizeof(val));<br>
-=C2=A0 =C2=A0 assert(val =3D=3D on);<br>
+=C2=A0 =C2=A0 assert(val =3D=3D set_to);<br>
+}<br>
+<br>
+void child_steps(int sock, struct sockaddr_in addr, int run_old)<br>
+{<br>
+=C2=A0 =C2=A0 /* Test 1: SO_TIMESTAMP */<br>
+=C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+<br>
+=C2=A0 =C2=A0 /* Test 2: SO_TIMESTAMPNS */<br>
+=C2=A0 =C2=A0 printf(&quot;Test 2: SO_TIMESTAMPNS\n&quot;);<br>
+=C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPNS, 1);<br>
+=C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so_timestampns);=
<br>
+=C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPNS, 0);<br>
+<br>
+=C2=A0 =C2=A0 /* Test 3: SO_TIMESTAMPING */<br>
+=C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+<br>
+=C2=A0 =C2=A0 if (!run_old) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+#ifdef SO_TIMESTAMP_OLD<br>
+=C2=A0 =C2=A0 if (SO_TIMESTAMP_OLD !=3D SO_TIMESTAMP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 4a: SO_TIMESTAMP_OLD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Test 4a: SO_TIMESTAMP_OLD\n&quot;=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMP_OLD, 1);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so=
_timestamp_old);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMP_OLD, 0);<=
br>
+=C2=A0 =C2=A0 }<br>
+#ifdef SO_TIMESTAMP_NEW<br>
+=C2=A0 =C2=A0 else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 4b: SO_TIMESTAMP_NEW */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Test 4b: SO_TIMESTAMP_NEW\n&quot;=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMP_NEW, 1);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so=
_timestamp_new);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMP_NEW, 0);<=
br>
+=C2=A0 =C2=A0 }<br>
+#endif /* defined(SO_TIMESTAMP_NEW) */<br>
+#endif /* defined(SO_TIMESTAMP_OLD) */<br>
+<br>
+#ifdef SO_TIMESTAMPNS_OLD<br>
+=C2=A0 =C2=A0 if (SO_TIMESTAMPNS_OLD !=3D SO_TIMESTAMPNS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 5a: SO_TIMESTAMPNS_OLD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+=C2=A0 =C2=A0 }<br>
+#ifdef SO_TIMESTAMPNS_NEW<br>
+=C2=A0 =C2=A0 else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 5b: SO_TIMESTAMPNS_NEW */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+=C2=A0 =C2=A0 }<br>
+#endif /* defined(SO_TIMESTAMPNS_NEW) */<br>
+#endif /* defined(SO_TIMESTAMPNS_OLD) */<br>
+<br>
+#ifdef SO_TIMESTAMPING_OLD<br>
+=C2=A0 =C2=A0 if (SO_TIMESTAMPING_OLD !=3D SO_TIMESTAMPING) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 6a: SO_TIMESTAMPING_OLD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Test 6a: SO_TIMESTAMPING_OLD\n&qu=
ot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPING_OLD, s=
o_timestamping_flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so=
_timestamping_old);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPING_OLD, 0=
);<br>
+=C2=A0 =C2=A0 }<br>
+#ifdef SO_TIMESTAMPING_NEW<br>
+=C2=A0 =C2=A0 else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 6b: SO_TIMESTAMPING_NEW */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Test 6b: SO_TIMESTAMPING_NEW\n&qu=
ot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPING_NEW, s=
o_timestamping_flags);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so=
_timestamping_new);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPING_NEW, 0=
);<br>
+=C2=A0 =C2=A0 }<br>
+#endif /* defined(SO_TIMESTAMPING_NEW) */<br>
+#endif /* defined(SO_TIMESTAMPING_OLD) */<br>
+}<br>
+<br>
+void parent_steps(int sock, struct sockaddr_in addr, int run_old)<br>
+{<br>
+=C2=A0 =C2=A0 /* Test 1: SO_TIMESTAMP */<br>
+=C2=A0 =C2=A0 printf(&quot;Test 1: SO_TIMESTAMP\n&quot;);<br>
+=C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMP, 1);<br>
+=C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so_timestamp);<b=
r>
+=C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMP, 0);<br>
+<br>
+=C2=A0 =C2=A0 /* Test 2: SO_TIMESTAMPNS */<br>
+=C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+<br>
+=C2=A0 =C2=A0 /* Test 3: SO_TIMESTAMPING */<br>
+=C2=A0 =C2=A0 printf(&quot;Test 3: SO_TIMESTAMPING\n&quot;);<br>
+=C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPING, so_timestamping_fla=
gs);<br>
+=C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so_timestamping)=
;<br>
+=C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPING, 0);<br>
+<br>
+=C2=A0 =C2=A0 if (!run_old) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+#ifdef SO_TIMESTAMP_OLD<br>
+=C2=A0 =C2=A0 if (SO_TIMESTAMP_OLD !=3D SO_TIMESTAMP) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 4a: SO_TIMESTAMP_OLD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+=C2=A0 =C2=A0 }<br>
+#ifdef SO_TIMESTAMP_NEW<br>
+=C2=A0 =C2=A0 else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 4b: SO_TIMESTAMP_NEW */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+=C2=A0 =C2=A0 }<br>
+#endif /* defined(SO_TIMESTAMP_NEW) */<br>
+#endif /* defined(SO_TIMESTAMP_OLD) */<br>
+<br>
+#ifdef SO_TIMESTAMPNS_OLD<br>
+=C2=A0 =C2=A0 if (SO_TIMESTAMPNS_OLD !=3D SO_TIMESTAMPNS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 5a: SO_TIMESTAMPNS_OLD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Test 5a: SO_TIMESTAMPNS_OLD\n&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPNS_OLD, 1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so=
_timestampns_old);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPNS_OLD, 0)=
;<br>
+=C2=A0 =C2=A0 }<br>
+#ifdef SO_TIMESTAMPNS_NEW<br>
+=C2=A0 =C2=A0 else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 5b: SO_TIMESTAMPNS_NEW */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;Test 5b: SO_TIMESTAMPNS_NEW\n&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPNS_NEW, 1)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(sock, &amp;get_timespec_from_so=
_timestampns_new);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(sock, SO_TIMESTAMPNS_NEW, 0)=
;<br>
+=C2=A0 =C2=A0 }<br>
+#endif /* defined(SO_TIMESTAMPNS_NEW) */<br>
+#endif /* defined(SO_TIMESTAMPNS_OLD) */<br>
+<br>
+#ifdef SO_TIMESTAMPING_OLD<br>
+=C2=A0 =C2=A0 if (SO_TIMESTAMPING_OLD !=3D SO_TIMESTAMPING) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 6a: SO_TIMESTAMPING_OLD */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+=C2=A0 =C2=A0 }<br>
+#ifdef SO_TIMESTAMPING_NEW<br>
+=C2=A0 =C2=A0 else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 6b: SO_TIMESTAMPING_NEW */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(sock, addr);<br>
+=C2=A0 =C2=A0 }<br>
+#endif /* defined(SO_TIMESTAMPING_NEW) */<br>
+#endif /* defined(SO_TIMESTAMPING_OLD) */<br>
=C2=A0}<br>
<br>
=C2=A0int main(int argc, char **argv)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int parent_sock, child_sock;<br>
=C2=A0 =C2=A0 =C2=A0struct sockaddr_in parent_sockaddr, child_sockaddr;<br>
-=C2=A0 =C2=A0 int pid;<br>
+=C2=A0 =C2=A0 int pid, run_old;<br>
=C2=A0 =C2=A0 =C2=A0struct timeval tv =3D {0, 0};<br>
=C2=A0 =C2=A0 =C2=A0gettimeofday(&amp;tv, NULL);<br>
<br>
+=C2=A0 =C2=A0 /* Too close to y2038 old systems may not work. */<br>
+=C2=A0 =C2=A0 run_old =3D tv.tv_sec &lt; 0x7fffff00;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0parent_sock =3D create_udp_socket(&amp;parent_sockaddr)=
;<br>
=C2=A0 =C2=A0 =C2=A0child_sock =3D create_udp_socket(&amp;child_sockaddr);<=
br>
<br>
@@ -226,64 +519,15 @@ int main(int argc, char **argv)<br>
=C2=A0 =C2=A0 =C2=A0if (pid &lt; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;SKIPPED. Failed to =
fork: %s\n&quot;, strerror(errno));<br>
=C2=A0 =C2=A0 =C2=A0} else if (pid =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(child_sock);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 1: SO_TIMESTAMP */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(parent_sock, child_sockaddr)=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tv.tv_sec &gt; 0x7fffff00) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Too close to y2038 problem, o=
ld system may not work. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(parent_sock);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-#ifdef SO_TIMESTAMP_OLD<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SO_TIMESTAMP_OLD !=3D SO_TIMESTAMP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 2a: SO_TIMESTAMP_OLD */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(parent_sock, S=
O_TIMESTAMP_OLD, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(parent_sock, &amp=
;get_timeval_from_so_timestamp_old);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(parent_sock, S=
O_TIMESTAMP_OLD, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-#ifdef SO_TIMESTAMP_NEW<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 2b: SO_TIMESTAMP_NEW */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(parent_sock, S=
O_TIMESTAMP_NEW, 1);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(parent_sock, &amp=
;get_timeval_from_so_timestamp_new);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(parent_sock, S=
O_TIMESTAMP_NEW, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-#endif /* defined(SO_TIMESTAMP_NEW) */<br>
-#endif /* defined(SO_TIMESTAMP_OLD) */<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(parent_sock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 child_steps(child_sock, parent_sockaddr, run_o=
ld);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(child_sock);<br>
=C2=A0 =C2=A0 =C2=A0} else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int child_status;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(parent_sock);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 1: SO_TIMESTAMP */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(child_sock, SO_TIMESTAMP, 1)=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 receive_packet(child_sock, &amp;get_timeval_fr=
om_so_timestamp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 set_socket_option(child_sock, SO_TIMESTAMP, 0)=
;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tv.tv_sec &gt; 0x7fffff00) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Too close to y2038 problem, o=
ld system may not work. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(child_sock);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-#ifdef SO_TIMESTAMP_OLD<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (SO_TIMESTAMP_OLD !=3D SO_TIMESTAMP) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 2a: SO_TIMESTAMP_OLD */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(child_sock, pa=
rent_sockaddr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-#ifdef SO_TIMESTAMP_NEW<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Test 2b: SO_TIMESTAMP_NEW */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 send_current_time(child_sock, pa=
rent_sockaddr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-#endif /* defined(SO_TIMESTAMP_NEW) */<br>
-#endif /* defined(SO_TIMESTAMP_OLD) */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(child_sock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 parent_steps(parent_sock, child_sockaddr, run_=
old);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 close(parent_sock);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (waitpid(pid, &amp;child_status, 0) &l=
t; 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int err =3D errno;<br>
-- <br>
2.28.0.220.ged08abb693-goog<br>
<br>
</blockquote></div>

--00000000000011995805b6b52fc5--

--000000000000195a6a05b6b52fa5
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPkgYJKoZIhvcNAQcCoIIPgzCCD38CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggzsMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBMswggOzoAMCAQICEAHy0XLDpZOCM1Wo/zUt
MzMwDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yMDA5MDgy
MzU2MDBaFw0yMTAzMDcyMzU2MDBaMB8xHTAbBgkqhkiG9w0BCQEWDnNjd0Bnb29nbGUuY29tMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4K9xeUFzU1L6hntxALFgW0aoyikZjIgW4pd8
nWcrCSYXChFhwyifutcbbhIG6D0eyvZG/1sRjH9l+qnGEiYbgFYD6XeANyo/T9+zjeJXvaoYpSzw
6mV1aRDyNvUNeCqwud+goNpXsnt3r4zpowSzJdzYGpUYIaM/z+/gA+Mxir+1/SDMgkYaklCjBIOv
r27gND8qfYGRnw0MWYVS/KFRUReGbrAEt+2Sos4rJp0E1gQeJwz4xN8jTxpLlOtjEr77kVac2av/
uN9FuHOjhRTlQkXYh1mKW+U6SX8xX1vCxrKtZy2q7sfNuQoHS/dEIeVWgdPvF92J3WgeAEVLS0l6
lwIDAQABo4IBzDCCAcgwGQYDVR0RBBIwEIEOc2N3QGdvb2dsZS5jb20wDgYDVR0PAQH/BAQDAgWg
MB0GA1UdJQQWMBQGCCsGAQUFBwMEBggrBgEFBQcDAjAdBgNVHQ4EFgQUOjPQqHnozC7J67Eo0jG0
Scoq+EwwTAYDVR0gBEUwQzBBBgkrBgEEAaAyASgwNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cu
Z2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADCBmgYIKwYBBQUHAQEEgY0wgYow
PgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2NhL2dzYXRsYXNyM3NtaW1l
Y2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9n
c2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgwFoAUfMwKaNei6x4schvRzV2Vb4378mMw
RgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9jYS9nc2F0bGFzcjNz
bWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEBAGl/OCpv+gNa2mmNvwCHtnIPN9VOMir/
nWtLJO2quRG5sYvR+716VG+AviULPlSwcbBaBDYUsq5USyjbs0T2kMgzQ2EUWKIQhmCHK5GVGuwo
CQ5rOcJw2IT5O75oFFDJ6QEBboCvT04P0k7dzurR37JkbD124ZvWXSpfxI4WY88rVEyq75zAJWhB
fj6NEprNrkDFdegzTt/ptu3CS432kneuiLZXOyBWmhZkcdOHipuYjQ1nmuDk9ziWVtGUTl3XqE5B
UoUMJm713ykBBikjH02oVRiJNqGk+emm2TLaroGhvyFsGFqqfub8CPbQyxd3e0Ch6LjZCosQjxT9
LNTa43AxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52
LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIzIFNNSU1FIENBIDIwMjACEAHy0XLDpZOC
M1Wo/zUtMzMwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIL+d1Hr39CT6E76X0MN+
DRq8mH+1im60TIkTcT2PABU7MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTIwMTIxODA0MDI1OVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUD
BAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsG
CWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQC8n5V3pcY/LGUArfxwjtwKb+36gUbjodf4xspr
ThY94Kaa4pZtTfWPLSjT1wDkwJDOwH3KcAB+qdVCxCUGs2TFSkV4lwjmzYhBxM8RZNEAKoNjAu10
VjUIwJcc+ynMStEf+9dizXdFmGFvy3QYzTG1rHoKYe6M7jxy8wwnnysKNFYde/7Fw2J1hSa+WoSp
hkPimgj3Kp00cy6H3GdyUTYx3cXy+0tGxAMegKKTwUs02nbofxW4TU+uRaP8rBHiNQxz8Xa5zFW0
PoJaMcxIu1zzCG4fNzILCy3myY8xQSBJqDZPqgnjw03mTl+wdkwv6pFYHztTGSj809eUIf/JgP7z
--000000000000195a6a05b6b52fa5--

