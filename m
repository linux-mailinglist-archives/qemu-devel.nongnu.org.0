Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF789B3A7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 17:43:37 +0200 (CEST)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1Biz-0004QZ-4M
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 11:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i1BXS-0000Wj-8O
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:31:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i1BXQ-00041Q-QB
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:31:42 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:52327)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i1BXQ-00040Y-6Z
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 11:31:40 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MZTua-1hgwxm29ME-00WaHM; Fri, 23 Aug 2019 17:31:32 +0200
To: qemu-devel@nongnu.org
References: <20190714134028.315-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <90d08991-e812-36ae-9ee7-bc074cb4628a@vivier.eu>
Date: Fri, 23 Aug 2019 17:31:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190714134028.315-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a31fV9PiphTMjfc1qc67Z4hlE3iQic9JqVUP9FZCWkdZBJRkjGE
 8UUCuXfo1h8znh0nDC1mB8VEvOgRMy+gxDXBbf2FJp46Ht2UW78YzAV+60uYDmsC012/641
 SKDpqnuzwGVzYB3yIU3DVqX564Jh8h9/rC0N76GYZchOP05ah+XzCsWmmWPw7Pnz31lxRMk
 VYKxqflHfmIK8VbdhVUuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W86fLRcDKsU=:RFbk67oplzkgrTiWIzyX7O
 B8OVgFmxa0TzCpQbqFUBS30os1iwvpf6d2UqFbP92Tz76ppdAfO7vQa526jg8UE4/vs0badtG
 /+smMhkUUWbasf72vlBKMqXWR1Ak0ccqRURZmIV0lanFGKDdszs07p3kTxKGk5Hr4pgOCm/6A
 Yb+QGpKs5oErMlGVfd7qyDUqtwobeWZFmM4E2e2aQY7SIwbMKgSaJO17otKGQhr+ZS6CvZ+fX
 32mJQnAqgFmr7ZF+sBsYAccRsuCFkc/QWHZvwT2RmqwI0zqw3yAA6ZMn2QLmIYnLaSaobwpQw
 gc9MwdfXyZBY7RO8RpqAVU/GONQrUFs2gFDCFApQcARo/19M2PBU54HlkfDLTZzgzmOVYeZ8B
 A8rseyki3CggTX0Ua26wPFK9mcXAdnXH33G6fOEPHwS04eLk7QbKrcVOPYEWxOUX9kdoTLMFZ
 573zgsTswD5VZEFcx3k87VkpKAsJFCFEn+cKOuL4Gxve0QM4WSm6hPkspe/D1sqLR6aq5m2S3
 fHlvZ41BNw+PCO5J0HOuKVztgpvFTgwvwbZiipYnVWy/+44Rx5gGYsFGLNksvJ8IFBMPri/bf
 RZFDtgIClin722Zb5FHp59FO5fcWRjQxfNb2HOKKFKPJ7HIPUtFCTvXmNt+4m553eQDZjehyV
 2XhtTLjogphYu3W0rMXUCS3KTWKKhRasVf6a2or4I89SmZSuLmZ10d3h4oFxSYSR0yFqBoZy2
 fSPB9yxlMy2iTJU1HXdQUwE1bnOldV+aUetp/q39kpHpok0Z3bz3WbXR8Y4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-devel] [PATCH 1/2] linux-user: remove useless variable
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/07/2019 à 15:40, Laurent Vivier a écrit :
> filename is only used to open the file if AT_EXECFD is not provided.
> But exec_path already contains the path of the file to open.
> Remove filename as it is only used in main.c whereas exec_path is
> also used in syscall.c.
> 
> Fixes: d088d664f201 ("linux-user: identify running binary in /proc/self/exe")
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  linux-user/main.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index a59ae9439de1..ef8e8cb10eba 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -48,7 +48,6 @@
>  char *exec_path;
>  
>  int singlestep;
> -static const char *filename;
>  static const char *argv0;
>  static int gdbstub_port;
>  static envlist_t *envlist;
> @@ -580,7 +579,6 @@ static int parse_args(int argc, char **argv)
>          exit(EXIT_FAILURE);
>      }
>  
> -    filename = argv[optind];
>      exec_path = argv[optind];
>  
>      return optind;
> @@ -651,9 +649,9 @@ int main(int argc, char **argv, char **envp)
>  
>      execfd = qemu_getauxval(AT_EXECFD);
>      if (execfd == 0) {
> -        execfd = open(filename, O_RDONLY);
> +        execfd = open(exec_path, O_RDONLY);
>          if (execfd < 0) {
> -            printf("Error while loading %s: %s\n", filename, strerror(errno));
> +            printf("Error while loading %s: %s\n", exec_path, strerror(errno));
>              _exit(EXIT_FAILURE);
>          }
>      }
> @@ -778,10 +776,10 @@ int main(int argc, char **argv, char **envp)
>      cpu->opaque = ts;
>      task_settid(ts);
>  
> -    ret = loader_exec(execfd, filename, target_argv, target_environ, regs,
> +    ret = loader_exec(execfd, exec_path, target_argv, target_environ, regs,
>          info, &bprm);
>      if (ret != 0) {
> -        printf("Error while loading %s: %s\n", filename, strerror(-ret));
> +        printf("Error while loading %s: %s\n", exec_path, strerror(-ret));
>          _exit(EXIT_FAILURE);
>      }
>  
> 

Applied to my linux-user branch.

Thanks,
Laurent

