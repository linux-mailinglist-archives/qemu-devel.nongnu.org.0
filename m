Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7F5559689
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:31:08 +0200 (CEST)
Received: from localhost ([::1]:43136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fed-0005lV-8r
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4fIC-0000rz-7e
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:07:57 -0400
Received: from mxout.security-mail.net ([85.31.212.42]:40203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o4fI9-0003EL-0G
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 05:07:54 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx302.security-mail.net (Postfix) with ESMTP id 436853D3B1C8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 11:07:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656061670;
 bh=vXGn7y5oqx9vrteTxSi9na3WW0PDuAqCPhHp0d7aaHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=QIo5qYmtYsx+OSz8WwFMkbP3gQKtqbjdvWfcztDG8GxnICKdz7zMIFHJIhohyk6/f
 sgKb04Ppsmh94gsBPljjj2CsculBYIMjAujNpCJYmwc6eDwQKWIWncxhd1zIga3TA5
 8pDS1TPNomv5XfDMLYJOvcCi4dqEci5eiomkmk2E=
Received: from fx302 (localhost [127.0.0.1]) by fx302.security-mail.net
 (Postfix) with ESMTP id DDBED3D3B1AB; Fri, 24 Jun 2022 11:07:48 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx302.security-mail.net (Postfix) with ESMTPS id 51AD63D3B174; Fri, 24 Jun
 2022 11:07:48 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 14F7027E04FE; Fri, 24 Jun 2022
 11:07:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id F220F27E04FD; Fri, 24 Jun 2022 11:07:47 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 TZ7HZYfhlZwZ; Fri, 24 Jun 2022 11:07:47 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id D7BC827E04FB; Fri, 24 Jun 2022 11:07:47 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <9ab2.62b57ee4.30d64.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu F220F27E04FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656061668;
 bh=K9QVd2pyrt9mW3H2keeRQmDUT5Uy3XmWLiu+IMcVcPg=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=qg2qa8lIDaeS6W2NKx2YdHIKR/INNp2mmFFJtn0AcgJdkCxMhAVLu25UmttqntwLY
 B501CTjlSTNkBfM4Zlr6SRIN1ubjjnnws20ulM9LT8mXqJpNBO6tXS+frw28+TExSI
 Lhd2IoVNs8YrjWerdulJWq6sY85w1TkxYE5hZDg4=
Date: Fri, 24 Jun 2022 11:07:47 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 44/53] semihosting: Cleanup chardev init
Message-ID: <20220624090747.GL25499@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-45-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-45-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.42; envelope-from=lmichel@kalray.eu;
 helo=mxout.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> Rename qemu_semihosting_connect_chardevs to
> qemu_semihosting_chardev_init; pass the result
> directly to qemu_semihosting_console_init.
> 
> Store the chardev in SemihostingConsole instead
> of SemihostingConfig, which lets us drop
> semihosting_get_chardev.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  include/semihosting/semihost.h | 13 ++-----------
>  semihosting/config.c           | 17 +++++++----------
>  semihosting/console.c          | 31 +++++++++++++++----------------
>  softmmu/vl.c                   |  3 +--
>  stubs/semihost.c               |  6 +-----
>  5 files changed, 26 insertions(+), 44 deletions(-)
> 
> diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
> index 0c55ade3ac..5b36a76f08 100644
> --- a/include/semihosting/semihost.h
> +++ b/include/semihosting/semihost.h
> @@ -51,14 +51,6 @@ static inline const char *semihosting_get_cmdline(void)
>  {
>      return NULL;
>  }
> -
> -static inline Chardev *semihosting_get_chardev(void)
> -{
> -    return NULL;
> -}
> -static inline void qemu_semihosting_console_init(void)
> -{
> -}
>  #else /* !CONFIG_USER_ONLY */
>  bool semihosting_enabled(void);
>  SemihostingTarget semihosting_get_target(void);
> @@ -66,12 +58,11 @@ const char *semihosting_get_arg(int i);
>  int semihosting_get_argc(void);
>  const char *semihosting_get_cmdline(void);
>  void semihosting_arg_fallback(const char *file, const char *cmd);
> -Chardev *semihosting_get_chardev(void);
>  /* for vl.c hooks */
>  void qemu_semihosting_enable(void);
>  int qemu_semihosting_config_options(const char *opt);
> -void qemu_semihosting_connect_chardevs(void);
> -void qemu_semihosting_console_init(void);
> +void qemu_semihosting_chardev_init(void);
> +void qemu_semihosting_console_init(Chardev *);
>  #endif /* CONFIG_USER_ONLY */
>  
>  #endif /* SEMIHOST_H */
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 50d82108e6..4bca769fad 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -50,7 +50,6 @@ QemuOptsList qemu_semihosting_config_opts = {
>  typedef struct SemihostingConfig {
>      bool enabled;
>      SemihostingTarget target;
> -    Chardev *chardev;
>      char **argv;
>      int argc;
>      const char *cmdline; /* concatenated argv */
> @@ -121,11 +120,6 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
>      }
>  }
>  
> -Chardev *semihosting_get_chardev(void)
> -{
> -    return semihosting.chardev;
> -}
> -
>  void qemu_semihosting_enable(void)
>  {
>      semihosting.enabled = true;
> @@ -171,16 +165,19 @@ int qemu_semihosting_config_options(const char *optarg)
>      return 0;
>  }
>  
> -void qemu_semihosting_connect_chardevs(void)
> +/* We had to defer this until chardevs were created */
> +void qemu_semihosting_chardev_init(void)
>  {
> -    /* We had to defer this until chardevs were created */
> +    Chardev *chr = NULL;
> +
>      if (semihost_chardev) {
> -        Chardev *chr = qemu_chr_find(semihost_chardev);
> +        chr = qemu_chr_find(semihost_chardev);
>          if (chr == NULL) {
>              error_report("semihosting chardev '%s' not found",
>                           semihost_chardev);
>              exit(1);
>          }
> -        semihosting.chardev = chr;
>      }
> +
> +    qemu_semihosting_console_init(chr);
>  }
> diff --git a/semihosting/console.c b/semihosting/console.c
> index df618a28a4..4088192842 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -27,11 +27,21 @@
>  #include "qapi/error.h"
>  #include "qemu/fifo8.h"
>  
> +/* Access to this structure is protected by the BQL */
> +typedef struct SemihostingConsole {
> +    CharBackend         backend;
> +    Chardev             *chr;
> +    GSList              *sleeping_cpus;
> +    bool                got;
> +    Fifo8               fifo;
> +} SemihostingConsole;
> +
> +static SemihostingConsole console;
> +
>  int qemu_semihosting_log_out(const char *s, int len)
>  {
> -    Chardev *chardev = semihosting_get_chardev();
> -    if (chardev) {
> -        return qemu_chr_write_all(chardev, (uint8_t *) s, len);
> +    if (console.chr) {
> +        return qemu_chr_write_all(console.chr, (uint8_t *) s, len);
>      } else {
>          return write(STDERR_FILENO, s, len);
>      }
> @@ -106,16 +116,6 @@ void qemu_semihosting_console_outc(CPUArchState *env, target_ulong addr)
>  
>  #define FIFO_SIZE   1024
>  
> -/* Access to this structure is protected by the BQL */
> -typedef struct SemihostingConsole {
> -    CharBackend         backend;
> -    GSList              *sleeping_cpus;
> -    bool                got;
> -    Fifo8               fifo;
> -} SemihostingConsole;
> -
> -static SemihostingConsole console;
> -
>  static int console_can_read(void *opaque)
>  {
>      SemihostingConsole *c = opaque;
> @@ -169,10 +169,9 @@ int qemu_semihosting_console_read(CPUState *cs, void *buf, int len)
>      return ret;
>  }
>  
> -void qemu_semihosting_console_init(void)
> +void qemu_semihosting_console_init(Chardev *chr)
>  {
> -    Chardev *chr = semihosting_get_chardev();
> -
> +    console.chr = chr;
>      if  (chr) {
>          fifo8_create(&console.fifo, FIFO_SIZE);
>          qemu_chr_fe_init(&console.backend, chr, &error_abort);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4c1e94b00e..83e2af4eab 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1944,8 +1944,7 @@ static void qemu_create_late_backends(void)
>          exit(1);
>  
>      /* now chardevs have been created we may have semihosting to connect */
> -    qemu_semihosting_connect_chardevs();
> -    qemu_semihosting_console_init();
> +    qemu_semihosting_chardev_init();
>  }
>  
>  static void cxl_set_opts(void)
> diff --git a/stubs/semihost.c b/stubs/semihost.c
> index 4bf2cf71b9..f486651afb 100644
> --- a/stubs/semihost.c
> +++ b/stubs/semihost.c
> @@ -65,10 +65,6 @@ void semihosting_arg_fallback(const char *file, const char *cmd)
>  {
>  }
>  
> -void qemu_semihosting_connect_chardevs(void)
> -{
> -}
> -
> -void qemu_semihosting_console_init(void)
> +void qemu_semihosting_chardev_init(void)
>  {
>  }
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=f3b8.629fd419.cecd0.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+44%2F53%5D+semihosting%3A+Cleanup+chardev+init&verdict=C&c=10d71a2e8353924e95ea4f98e698ba376e5bb76b
> 

-- 





