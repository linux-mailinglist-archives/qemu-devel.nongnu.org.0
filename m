Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8305BA799F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 06:21:31 +0200 (CEST)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5MnS-0004P6-3x
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 00:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55749)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5Mli-0003tF-PB
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 00:19:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5Mlg-0005GM-7F
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 00:19:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53330)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i5Mlf-0005FS-VL
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 00:19:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26522281D1;
 Wed,  4 Sep 2019 04:19:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-69.ams2.redhat.com [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5052160920;
 Wed,  4 Sep 2019 04:19:34 +0000 (UTC)
To: Yury Kotov <yury-kotov@yandex-team.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20190903162246.18524-1-yury-kotov@yandex-team.ru>
 <20190903162246.18524-3-yury-kotov@yandex-team.ru>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <ced2a481-9089-6d0a-2934-b9714d053254@redhat.com>
Date: Wed, 4 Sep 2019 06:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903162246.18524-3-yury-kotov@yandex-team.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Wed, 04 Sep 2019 04:19:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/3] tests/libqtest: Allow setting
 expected exit status
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
Cc: qemu-devel@nongnu.org, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/09/2019 18.22, Yury Kotov wrote:
> Add qtest_set_expected_status function to set expected exit status of
> child process. By default expected exit status is 0.
> 
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
> ---
>  tests/libqtest.c | 36 +++++++++++++++++++++---------------
>  tests/libqtest.h |  9 +++++++++
>  2 files changed, 30 insertions(+), 15 deletions(-)
> 
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index 2713b86cf7..a79d4887ae 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -43,6 +43,7 @@ struct QTestState
>      int qmp_fd;
>      pid_t qemu_pid;  /* our child QEMU process */
>      int wstatus;
> +    int expected_status;
>      bool big_endian;
>      bool irq_level[MAX_IRQ];
>      GString *rx;
> @@ -113,6 +114,11 @@ bool qtest_probe_child(QTestState *s)
>      return false;
>  }
>  
> +void qtest_set_expected_status(QTestState *s, int status)
> +{
> +    s->expected_status = status;
> +}
> +
>  static void kill_qemu(QTestState *s)
>  {
>      pid_t pid = s->qemu_pid;
> @@ -126,24 +132,23 @@ static void kill_qemu(QTestState *s)
>      }
>  
>      /*
> -     * We expect qemu to exit with status 0; anything else is
> +     * Check whether qemu exited with expected exit status; anything else is
>       * fishy and should be logged with as much detail as possible.
>       */
>      wstatus = s->wstatus;
> -    if (wstatus) {
> -        if (WIFEXITED(wstatus)) {
> -            fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
> -                    "process but encountered exit status %d\n",
> -                    __FILE__, __LINE__, WEXITSTATUS(wstatus));
> -        } else if (WIFSIGNALED(wstatus)) {
> -            int sig = WTERMSIG(wstatus);
> -            const char *signame = strsignal(sig) ?: "unknown ???";
> -            const char *dump = WCOREDUMP(wstatus) ? " (core dumped)" : "";
> -
> -            fprintf(stderr, "%s:%d: kill_qemu() detected QEMU death "
> -                    "from signal %d (%s)%s\n",
> -                    __FILE__, __LINE__, sig, signame, dump);
> -        }
> +    if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) != s->expected_status) {
> +        fprintf(stderr, "%s:%d: kill_qemu() tried to terminate QEMU "
> +                "process but encountered exit status %d (expected %d)\n",
> +                __FILE__, __LINE__, WEXITSTATUS(wstatus), s->expected_status);
> +        abort();
> +    } else if (WIFSIGNALED(wstatus)) {
> +        int sig = WTERMSIG(wstatus);
> +        const char *signame = strsignal(sig) ?: "unknown ???";
> +        const char *dump = WCOREDUMP(wstatus) ? " (core dumped)" : "";
> +
> +        fprintf(stderr, "%s:%d: kill_qemu() detected QEMU death "
> +                "from signal %d (%s)%s\n",
> +                __FILE__, __LINE__, sig, signame, dump);
>          abort();
>      }
>  }
> @@ -248,6 +253,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>      g_test_message("starting QEMU: %s", command);
>  
>      s->wstatus = 0;
> +    s->expected_status = 0;
>      s->qemu_pid = fork();
>      if (s->qemu_pid == 0) {
>          setenv("QEMU_AUDIO_DRV", "none", true);
> diff --git a/tests/libqtest.h b/tests/libqtest.h
> index 07ea35867c..c00bca94af 100644
> --- a/tests/libqtest.h
> +++ b/tests/libqtest.h
> @@ -997,4 +997,13 @@ void qmp_assert_error_class(QDict *rsp, const char *class);
>   */
>  bool qtest_probe_child(QTestState *s);
>  
> +/**
> + * qtest_set_expected_status:
> + * @s: QTestState instance to operate on.
> + * @status: an expected exit status.
> + *
> + * Set expected exit status of the child.
> + */
> +void qtest_set_expected_status(QTestState *s, int status);
> +
>  #endif
> 

Acked-by: Thomas Huth <thuth@redhat.com>

