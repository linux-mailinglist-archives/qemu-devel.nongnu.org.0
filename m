Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FAB6F3316
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 17:43:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptVeh-0002Lj-JA; Mon, 01 May 2023 11:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ptVed-0002L8-Q6; Mon, 01 May 2023 11:41:33 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ptVec-0008AT-Ak; Mon, 01 May 2023 11:41:31 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MG90u-1q3Pg13U3Y-00GVW1; Mon, 01 May 2023 17:41:25 +0200
Message-ID: <396b251f-08d5-7f9c-b31b-86cfc8184b05@vivier.eu>
Date: Mon, 1 May 2023 17:41:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] linux-user/main: Use list_cpus() instead of cpu_list()
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20230424122126.236586-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230424122126.236586-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TmzP7j2RxjLuo2FSumpZD1spIgX2tRR4UuHOquv6jcSePtTJCvV
 C1YeanDYat/ODdqMxvNarLZ4NkOAxdAPJplgqW+EzMJ5g6G7I8nj5NxxGRe7ud+FnxeeJ9T
 xiAPpEFs/5z7shGM5KbdiNsN4IhojvR2fh994LW9XwOOSkBGzJDuFqhLfWA7SDCOdME0qeB
 YBJU/Uw280ymqInWhgWxg==
UI-OutboundReport: notjunk:1;M01:P0:J0rRmYBs2mc=;zMdPIxwzFAaB3iMH8Rtb8tyS4a/
 3dAUIPrgY9d5MVBpo3BO3cb7PI5GeQkt0g0F4LwiRAx/u8JCypIMiBrzjE4fXq0o9Tkozq55s
 K6bAitlU61HCwyspDuf8MgC8jfmPbyMsY0xSHG8FrK7enmEJw40TSpjgJMjkqhRmoofLOWScR
 g24MBnKYdAS+SBhBrsGaE5bLWeKA6ZQCbK3aGO368cScspXMyf5HHZz/DsSrMOhF9596acPms
 Gv8GVgamesHzJJCODnEozQ1P5DzZ0ZbLqe6+5PvqeX47BSTkHzz0K82JTlCHI6XQfYVvdKB66
 WzfLdjhsPcaMBj0U1NlbX1t1JDrqugin0X/ym0O8b5livX0Z4+ZQ/3g6bRQe3/Gg6i0PNKm93
 mCYj5nKMXyiowjCmISmizU4nA1U6lqnkd2RcKvDSXcfJ0+EtwADDtYhnMjDkZ6htfRjdysicO
 1FNxMaR25RKscSkajVoFoxpHKkN7W32Vbc+1Inl65HeGocPjTF0XLZ0SSwGf5YlOZHVfuIQSQ
 49wRLT3AbL6MguzTo7ZES8n3v8nUOC6hLhKzrsfIC20Vg41Y4GxiWu6/8XDvkAXm0jipoKKIT
 DKwceuBw70vUa+3cMzyFASzRFMPoVNI0mF40TpI6qJjOWoTojwbBqjoNynrPy9ar3rgGzp9eT
 wgRQhOZFi11hZFWpba0m2PvZA3Usm1jYfIJt2dM9nw==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 24/04/2023 à 14:21, Thomas Huth a écrit :
> This way we can get rid of the if'deffery and the XXX comment
> here (it's repeated in the list_cpus() function anyway).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   linux-user/main.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index fe03293516..aece4d9e91 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -359,10 +359,7 @@ static void handle_arg_cpu(const char *arg)
>   {
>       cpu_model = strdup(arg);
>       if (cpu_model == NULL || is_help_option(cpu_model)) {
> -        /* XXX: implement xxx_cpu_list for targets that still miss it */
> -#if defined(cpu_list)
> -        cpu_list();
> -#endif
> +        list_cpus();
>           exit(EXIT_FAILURE);
>       }
>   }

Applied to my linux-user-for-8.1 branch.

Thanks,
Laurent


