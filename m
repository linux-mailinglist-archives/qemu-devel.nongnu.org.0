Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E0250A2A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 22:40:44 +0200 (CEST)
Received: from localhost ([::1]:35614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAJGm-0001Gb-15
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 16:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kAJFa-0000cX-PZ
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 16:39:30 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:46567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kAJFY-0007oS-0L
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 16:39:30 -0400
Received: from [192.168.100.1] ([82.252.135.186]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1McpaE-1kkCIO0oJW-00ZyLZ; Mon, 24 Aug 2020 22:39:18 +0200
Subject: Re: [PATCH v2 2/3] linux-user: Add missing termbits types and values
 definitions
To: Filip Bozuta <Filip.Bozuta@syrmia.com>, qemu-devel@nongnu.org
References: <20200723210233.349690-1-Filip.Bozuta@syrmia.com>
 <20200723210233.349690-3-Filip.Bozuta@syrmia.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c1214e6d-1e37-2d9e-944b-aab9e6bea409@vivier.eu>
Date: Mon, 24 Aug 2020 22:39:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723210233.349690-3-Filip.Bozuta@syrmia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Hx24xDVtmfzND28lkd6CIFn5/q5wckAB+LvsO0Yxw2FN6gmx+lj
 TUssGVMODzp4dtGkN8ahDE7kfOgfF+QPT/A4vsO7DWohw6KQSkUuDcnZQC6huj8mW1HiGaR
 nCqlyAUEuBrozw8HIMQEHHUHpnqqb+2GKM+G1+cMr0QhiIIbgtmEzsEC7b/urNjfOuUV7Er
 lI48rx81aVPFdLCuQkt2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:05Zkf/e7kl4=:D5Xj1Easqg8nS9IXHuWP7h
 EtBI+AHeXQ0k1JgJKIwUTXA2DtDQtrhFLYayQHgFzaO28cb+FCJHppdQAeI+yiNALKFjTH8Rb
 9J7SyK/UiV/lqJDqJmELC6AiDTaIi7Nl+i53k250g3ZjxO/0ZdesSjqlgZlOQsl1LgWCq9poC
 PFLO4Su53Jhx0D39NZTDR4EtvI6A05EgFOMS0Ot8bHuc9LO0uYMUrlJ6PXUrO8RQVgkF3ooZx
 RH82neqmHFbeM7Fm0KvSbPhDJDYazggNXQ+ewnbVp8szGmbJ0Q4s1NExmoX0LXhYxy9AlPAXG
 w4K4cH4hLmM/GqgHkoReWaZ1QbosAW+Tht3wuPZOX9pAnsKiIsJDd4enLxSTxYwaacK2zU24j
 WDF9wIpBfRKg3bTul93b3K4xVdsaR8x3MkpV1DmC7aJ325/Pde6meMxYkHrYY1ZqB03+gzETx
 XWCfSpphKH3s9mPpq1g4zrMGEuM/JqZ2N/4TVuRlB0SOsPLZFbeaJ/9/MJ1msukjCnFkXXcW7
 1bz5CD7nEqjLacoZErjunFmxXxsx4AwVaX7Zr9YpiyaL3UcxBWCDh0MXKlgVVqcDV4xuNijiT
 npMSod+zw0oClPuPg6YlEdqQIiqvG0WKDzOfev8N/bmXGWxmTaaKz3XvLV9ii+Kwl4yfJN1v+
 ekMPEJZryIU0UIRmH3a5zbXqFyckZqbQYBT5zdm3txH4eJSiAIIknTToEAnjPFSBdIfdYGSew
 s4ObHJDHP7jQTbDuVX5z2nyLOeSAiTDryeXVCvCxgw/WWxJU9zr8DYxh8D3HqD71XEXQEwg5/
 JgKXGzuKphDWjo1ncZHLmYQOVucq3JHiVgQ4ODZrsgGNz314xYqkWvxeg2wDsjmpRsVf6B1
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 16:34:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/07/2020 à 23:02, Filip Bozuta a écrit :
> This patch introduces missing target types ('target_flag_t', 'target_cc_t',
> 'target_speed_t') in a few 'termibts.h' header files. Also, two missing
> values ('TARGET_IUTF8' and 'TARGET_EXTPROC') were also added. These values
> were also added in file 'syscall.c' in bitmask tables 'iflag_tbl[]' and
> 'lflag_tbl[]' which are used to convert values of 'struct termios' between
> target and host.
> 
> Signed-off-by: Filip Bozuta <Filip.Bozuta@syrmia.com>
> ---
>  linux-user/alpha/termbits.h   |  1 +
>  linux-user/cris/termbits.h    | 18 ++++++++----
>  linux-user/hppa/termbits.h    | 17 +++++++----
>  linux-user/mips/termbits.h    | 17 +++++++----
>  linux-user/ppc/termbits.h     | 21 ++++++++------
>  linux-user/sh4/termbits.h     | 19 +++++++++----
>  linux-user/sparc/termbits.h   | 18 ++++++++----
>  linux-user/sparc64/termbits.h | 18 ++++++++----
>  linux-user/syscall.c          | 34 +++++++++++-----------
>  linux-user/xtensa/termbits.h  | 53 ++++++++++++++++++-----------------
>  10 files changed, 130 insertions(+), 86 deletions(-)
> 
> diff --git a/linux-user/alpha/termbits.h b/linux-user/alpha/termbits.h
> index a71425174a..4a4b1e96f2 100644
> --- a/linux-user/alpha/termbits.h
> +++ b/linux-user/alpha/termbits.h
> @@ -159,6 +159,7 @@ struct target_termios {
>  #define TARGET_FLUSHO	0x00800000
>  #define TARGET_PENDIN	0x20000000
>  #define TARGET_IEXTEN	0x00000400
> +#define TARGET_EXTPROC  0x10000000
>  
>  #define TARGET_FIOCLEX		TARGET_IO('f', 1)
>  #define TARGET_FIONCLEX	TARGET_IO('f', 2)
> diff --git a/linux-user/cris/termbits.h b/linux-user/cris/termbits.h
> index 475ee70fed..0c8d8fc051 100644
> --- a/linux-user/cris/termbits.h
> +++ b/linux-user/cris/termbits.h
> @@ -5,13 +5,17 @@
>  
>  #define TARGET_NCCS 19
>  
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
> +
>  struct target_termios {
> -    unsigned int c_iflag;               /* input mode flags */
> -    unsigned int c_oflag;               /* output mode flags */
> -    unsigned int c_cflag;               /* control mode flags */
> -    unsigned int c_lflag;               /* local mode flags */
> -    unsigned char c_line;                    /* line discipline */
> -    unsigned char c_cc[TARGET_NCCS];                /* control characters */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
>  };
>  
>  /* c_iflag bits */
> @@ -29,6 +33,7 @@ struct target_termios {
>  #define TARGET_IXANY   0004000
>  #define TARGET_IXOFF   0010000
>  #define TARGET_IMAXBEL 0020000
> +#define TARGET_IUTF8   0040000
>  
>  /* c_oflag bits */
>  #define TARGET_OPOST   0000001
> @@ -118,6 +123,7 @@ struct target_termios {
>  #define TARGET_FLUSHO  0010000
>  #define TARGET_PENDIN  0040000
>  #define TARGET_IEXTEN  0100000
> +#define TARGET_EXTPROC 0200000
>  
>  /* c_cc character offsets */
>  #define TARGET_VINTR	0
> diff --git a/linux-user/hppa/termbits.h b/linux-user/hppa/termbits.h
> index 8fba839dd4..11fd4eed62 100644
> --- a/linux-user/hppa/termbits.h
> +++ b/linux-user/hppa/termbits.h
> @@ -5,13 +5,17 @@
>  
>  #define TARGET_NCCS 19
>  
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
> +
>  struct target_termios {
> -    unsigned int c_iflag;               /* input mode flags */
> -    unsigned int c_oflag;               /* output mode flags */
> -    unsigned int c_cflag;               /* control mode flags */
> -    unsigned int c_lflag;               /* local mode flags */
> -    unsigned char c_line;                    /* line discipline */
> -    unsigned char c_cc[TARGET_NCCS];                /* control characters */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
>  };
>  
>  /* c_iflag bits */
> @@ -120,6 +124,7 @@ struct target_termios {
>  #define TARGET_FLUSHO  0010000
>  #define TARGET_PENDIN  0040000
>  #define TARGET_IEXTEN  0100000
> +#define TARGET_EXTPROC 0200000
>  
>  /* c_cc character offsets */
>  #define TARGET_VINTR    0
> diff --git a/linux-user/mips/termbits.h b/linux-user/mips/termbits.h
> index 3287cf6df8..e8b4b58d87 100644
> --- a/linux-user/mips/termbits.h
> +++ b/linux-user/mips/termbits.h
> @@ -5,13 +5,17 @@
>  
>  #define TARGET_NCCS 23
>  
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
> +
>  struct target_termios {
> -    unsigned int c_iflag;               /* input mode flags */
> -    unsigned int c_oflag;               /* output mode flags */
> -    unsigned int c_cflag;               /* control mode flags */
> -    unsigned int c_lflag;               /* local mode flags */
> -    unsigned char c_line;                    /* line discipline */
> -    unsigned char c_cc[TARGET_NCCS];                /* control characters */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
>  };
>  
>  /* c_iflag bits */
> @@ -133,6 +137,7 @@ struct target_termios {
>  #define TARGET_PENDIN  0040000
>  #define TARGET_TOSTOP  0100000
>  #define TARGET_ITOSTOP TARGET_TOSTOP
> +#define TARGET_EXTPROC 0200000
>  
>  /* c_cc character offsets */
>  #define TARGET_VINTR	0
> diff --git a/linux-user/ppc/termbits.h b/linux-user/ppc/termbits.h
> index 19e4c6eda8..7066d1e552 100644
> --- a/linux-user/ppc/termbits.h
> +++ b/linux-user/ppc/termbits.h
> @@ -5,15 +5,19 @@
>  
>  #define TARGET_NCCS 19
>  
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
> +
>  struct target_termios {
> -    unsigned int c_iflag;               /* input mode flags */
> -    unsigned int c_oflag;               /* output mode flags */
> -    unsigned int c_cflag;               /* control mode flags */
> -    unsigned int c_lflag;               /* local mode flags */
> -    unsigned char c_cc[TARGET_NCCS];                /* control characters */
> -    unsigned char c_line;                    /* line discipline */
> -    unsigned int c_ispeed;		/* input speed */
> -    unsigned int c_ospeed;		/* output speed */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
> +    target_speed_t c_ispeed;               /* input speed */
> +    target_speed_t c_ospeed;               /* output speed */
>  };
>  
>  /* c_cc character offsets */
> @@ -158,6 +162,7 @@ struct target_termios {
>  #define TARGET_FLUSHO	0x00800000
>  #define TARGET_PENDIN	0x20000000
>  #define TARGET_IEXTEN	0x00000400
> +#define TARGET_EXTPROC  0x10000000
>  
>  /* ioctls */
>  
> diff --git a/linux-user/sh4/termbits.h b/linux-user/sh4/termbits.h
> index dd125b6a2b..f91b5c51cf 100644
> --- a/linux-user/sh4/termbits.h
> +++ b/linux-user/sh4/termbits.h
> @@ -5,15 +5,20 @@
>  
>  #define TARGET_NCCS 19
>  
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
> +
>  struct target_termios {
> -	unsigned int c_iflag;			/* input mode flags */
> -	unsigned int c_oflag;			/* output mode flags */
> -	unsigned int c_cflag;			/* control mode flags */
> -	unsigned int c_lflag;			/* local mode flags */
> -	unsigned char c_line;			/* line discipline */
> -	unsigned char c_cc[TARGET_NCCS];	/* control characters */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
>  };
>  
> +
>  /* c_cc characters */
>  #define TARGET_VINTR 0
>  #define TARGET_VQUIT 1
> @@ -150,6 +155,8 @@ struct target_termios {
>  #define TARGET_FLUSHO	0010000
>  #define TARGET_PENDIN	0040000
>  #define TARGET_IEXTEN	0100000
> +#define TARGET_EXTPROC  0200000
> +
>  
>  /* tcflow() and TCXONC use these */
>  #define TARGET_TCOOFF		0
> diff --git a/linux-user/sparc/termbits.h b/linux-user/sparc/termbits.h
> index f85219ed71..704bee1c42 100644
> --- a/linux-user/sparc/termbits.h
> +++ b/linux-user/sparc/termbits.h
> @@ -5,15 +5,20 @@
>  
>  #define TARGET_NCCS 19
>  
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
> +
>  struct target_termios {
> -    unsigned int c_iflag;               /* input mode flags */
> -    unsigned int c_oflag;               /* output mode flags */
> -    unsigned int c_cflag;               /* control mode flags */
> -    unsigned int c_lflag;               /* local mode flags */
> -    unsigned char c_line;                    /* line discipline */
> -    unsigned char c_cc[TARGET_NCCS];                /* control characters */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
>  };
>  
> +
>  /* c_cc characters */
>  #define TARGET_VINTR    0
>  #define TARGET_VQUIT    1
> @@ -170,6 +175,7 @@ struct target_termios {
>  #define TARGET_FLUSHO	0x00002000
>  #define TARGET_PENDIN	0x00004000
>  #define TARGET_IEXTEN	0x00008000
> +#define TARGET_EXTPROC  0x00010000
>  
>  /* ioctls */
>  
> diff --git a/linux-user/sparc64/termbits.h b/linux-user/sparc64/termbits.h
> index 11b5abcf84..1ab1e80db5 100644
> --- a/linux-user/sparc64/termbits.h
> +++ b/linux-user/sparc64/termbits.h
> @@ -5,15 +5,20 @@
>  
>  #define TARGET_NCCS 19
>  
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
> +
>  struct target_termios {
> -    unsigned int c_iflag;               /* input mode flags */
> -    unsigned int c_oflag;               /* output mode flags */
> -    unsigned int c_cflag;               /* control mode flags */
> -    unsigned int c_lflag;               /* local mode flags */
> -    unsigned char c_line;                    /* line discipline */
> -    unsigned char c_cc[TARGET_NCCS];                /* control characters */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
>  };
>  
> +
>  /* c_cc characters */
>  #define TARGET_VINTR    0
>  #define TARGET_VQUIT    1
> @@ -170,6 +175,7 @@ struct target_termios {
>  #define TARGET_FLUSHO	0x00002000
>  #define TARGET_PENDIN	0x00004000
>  #define TARGET_IEXTEN	0x00008000
> +#define TARGET_EXTPROC  0x00010000
>  
>  /* ioctls */
>  
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 24d915f0ff..e815f14bac 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5508,6 +5508,7 @@ static const bitmask_transtbl iflag_tbl[] = {
>          { TARGET_IXANY, TARGET_IXANY, IXANY, IXANY },
>          { TARGET_IXOFF, TARGET_IXOFF, IXOFF, IXOFF },
>          { TARGET_IMAXBEL, TARGET_IMAXBEL, IMAXBEL, IMAXBEL },
> +        { TARGET_IUTF8, TARGET_IUTF8, IUTF8, IUTF8},
>          { 0, 0, 0, 0 }
>  };
>  
> @@ -5575,22 +5576,23 @@ static const bitmask_transtbl cflag_tbl[] = {
>  };
>  
>  static const bitmask_transtbl lflag_tbl[] = {
> -	{ TARGET_ISIG, TARGET_ISIG, ISIG, ISIG },
> -	{ TARGET_ICANON, TARGET_ICANON, ICANON, ICANON },
> -	{ TARGET_XCASE, TARGET_XCASE, XCASE, XCASE },
> -	{ TARGET_ECHO, TARGET_ECHO, ECHO, ECHO },
> -	{ TARGET_ECHOE, TARGET_ECHOE, ECHOE, ECHOE },
> -	{ TARGET_ECHOK, TARGET_ECHOK, ECHOK, ECHOK },
> -	{ TARGET_ECHONL, TARGET_ECHONL, ECHONL, ECHONL },
> -	{ TARGET_NOFLSH, TARGET_NOFLSH, NOFLSH, NOFLSH },
> -	{ TARGET_TOSTOP, TARGET_TOSTOP, TOSTOP, TOSTOP },
> -	{ TARGET_ECHOCTL, TARGET_ECHOCTL, ECHOCTL, ECHOCTL },
> -	{ TARGET_ECHOPRT, TARGET_ECHOPRT, ECHOPRT, ECHOPRT },
> -	{ TARGET_ECHOKE, TARGET_ECHOKE, ECHOKE, ECHOKE },
> -	{ TARGET_FLUSHO, TARGET_FLUSHO, FLUSHO, FLUSHO },
> -	{ TARGET_PENDIN, TARGET_PENDIN, PENDIN, PENDIN },
> -	{ TARGET_IEXTEN, TARGET_IEXTEN, IEXTEN, IEXTEN },
> -	{ 0, 0, 0, 0 }
> +  { TARGET_ISIG, TARGET_ISIG, ISIG, ISIG },
> +  { TARGET_ICANON, TARGET_ICANON, ICANON, ICANON },
> +  { TARGET_XCASE, TARGET_XCASE, XCASE, XCASE },
> +  { TARGET_ECHO, TARGET_ECHO, ECHO, ECHO },
> +  { TARGET_ECHOE, TARGET_ECHOE, ECHOE, ECHOE },
> +  { TARGET_ECHOK, TARGET_ECHOK, ECHOK, ECHOK },
> +  { TARGET_ECHONL, TARGET_ECHONL, ECHONL, ECHONL },
> +  { TARGET_NOFLSH, TARGET_NOFLSH, NOFLSH, NOFLSH },
> +  { TARGET_TOSTOP, TARGET_TOSTOP, TOSTOP, TOSTOP },
> +  { TARGET_ECHOCTL, TARGET_ECHOCTL, ECHOCTL, ECHOCTL },
> +  { TARGET_ECHOPRT, TARGET_ECHOPRT, ECHOPRT, ECHOPRT },
> +  { TARGET_ECHOKE, TARGET_ECHOKE, ECHOKE, ECHOKE },
> +  { TARGET_FLUSHO, TARGET_FLUSHO, FLUSHO, FLUSHO },
> +  { TARGET_PENDIN, TARGET_PENDIN, PENDIN, PENDIN },
> +  { TARGET_IEXTEN, TARGET_IEXTEN, IEXTEN, IEXTEN },
> +  { TARGET_EXTPROC, TARGET_EXTPROC, EXTPROC, EXTPROC},
> +  { 0, 0, 0, 0 }
>  };
>  
>  static void target_to_host_termios (void *dst, const void *src)
> diff --git a/linux-user/xtensa/termbits.h b/linux-user/xtensa/termbits.h
> index d1e09e61a6..2a603ecae6 100644
> --- a/linux-user/xtensa/termbits.h
> +++ b/linux-user/xtensa/termbits.h
> @@ -15,40 +15,40 @@
>  
>  #include <linux/posix_types.h>
>  
> -typedef unsigned char   cc_t;
> -typedef unsigned int    speed_t;
> -typedef unsigned int    tcflag_t;
> +typedef unsigned char   target_cc_t;        /* cc_t */
> +typedef unsigned int    target_speed_t;     /* speed_t */
> +typedef unsigned int    target_tcflag_t;    /* tcflag_t */
>  
> -#define TARGET_NCCS 19
>  struct target_termios {
> -    tcflag_t c_iflag;       /* input mode flags */
> -    tcflag_t c_oflag;       /* output mode flags */
> -    tcflag_t c_cflag;       /* control mode flags */
> -    tcflag_t c_lflag;       /* local mode flags */
> -    cc_t c_line;            /* line discipline */
> -    cc_t c_cc[TARGET_NCCS]; /* control characters */
> +    target_tcflag_t c_iflag;               /* input mode flags */
> +    target_tcflag_t c_oflag;               /* output mode flags */
> +    target_tcflag_t c_cflag;               /* control mode flags */
> +    target_tcflag_t c_lflag;               /* local mode flags */
> +    target_cc_t c_line;                    /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS];         /* control characters */
>  };
>  
> +
>  struct target_termios2 {
> -    tcflag_t c_iflag;       /* input mode flags */
> -    tcflag_t c_oflag;       /* output mode flags */
> -    tcflag_t c_cflag;       /* control mode flags */
> -    tcflag_t c_lflag;       /* local mode flags */
> -    cc_t c_line;            /* line discipline */
> -    cc_t c_cc[TARGET_NCCS]; /* control characters */
> -    speed_t c_ispeed;       /* input speed */
> -    speed_t c_ospeed;       /* output speed */
> +    target_tcflag_t c_iflag;       /* input mode flags */
> +    target_tcflag_t c_oflag;       /* output mode flags */
> +    target_tcflag_t c_cflag;       /* control mode flags */
> +    target_tcflag_t c_lflag;       /* local mode flags */
> +    target_cc_t c_line;            /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS]; /* control characters */
> +    target_speed_t c_ispeed;       /* input speed */
> +    target_speed_t c_ospeed;       /* output speed */
>  };
>  
>  struct target_ktermios {
> -    tcflag_t c_iflag;       /* input mode flags */
> -    tcflag_t c_oflag;       /* output mode flags */
> -    tcflag_t c_cflag;       /* control mode flags */
> -    tcflag_t c_lflag;       /* local mode flags */
> -    cc_t c_line;            /* line discipline */
> -    cc_t c_cc[TARGET_NCCS]; /* control characters */
> -    speed_t c_ispeed;       /* input speed */
> -    speed_t c_ospeed;       /* output speed */
> +    target_tcflag_t c_iflag;       /* input mode flags */
> +    target_tcflag_t c_oflag;       /* output mode flags */
> +    target_tcflag_t c_cflag;       /* control mode flags */
> +    target_tcflag_t c_lflag;       /* local mode flags */
> +    target_cc_t c_line;            /* line discipline */
> +    target_cc_t c_cc[TARGET_NCCS]; /* control characters */
> +    target_speed_t c_ispeed;       /* input speed */
> +    target_speed_t c_ospeed;       /* output speed */
>  };
>  
>  /* c_cc characters */
> @@ -195,6 +195,7 @@ struct target_ktermios {
>  #define TARGET_FLUSHO   0010000
>  #define TARGET_PENDIN   0040000
>  #define TARGET_IEXTEN   0100000
> +#define TARGET_EXTPROC  0200000
>  
>  /* tcflow() and TCXONC use these */
>  
>
Applied to my linux-user-for-5.2 branch.

Thanks,
Laurent


