Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0BA5EBFFB
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:42:29 +0200 (CEST)
Received: from localhost ([::1]:36664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od82m-0006NS-G9
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7ur-0004En-El
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:34:17 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:41369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1od7up-0006dt-Rh
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 06:34:17 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M72Xn-1obkTa38nv-008dhs; Tue, 27 Sep 2022 12:34:13 +0200
Message-ID: <a61c6643-4d70-0c79-5576-5e4015e81813@vivier.eu>
Date: Tue, 27 Sep 2022 12:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 8/8] linux-user: Log tid for strace
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220829021006.67305-1-richard.henderson@linaro.org>
 <20220829021006.67305-9-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220829021006.67305-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e6eXNN5KrUrRcuQJnb3Z5JBepljJmNKOVOgNNa7qJsNTu39Jofm
 KrVZXhNZiZGjG7zzRRl1zjZrwlbn1H/8DTVhhuqxhKWEMoch4G20OLdB+UGoc2llAj46EUt
 5ZybPEDe8Lkf1KDS3082lbioYaowE+qtMetDoYTKhqDUjwjMjBG5GJFdK7hkWi8UqR7ydJp
 EssuDuZycMNDfd3HPN0iA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RKC+c17Ei8Q=:AMFpMTnQ4ktXKDgz6q5s7V
 bePYFwSnUxOJs/WQcL59tLx0ThWq5mdRVoW2GzouvIbOW+4MVTAKDODONX+PgAhW9rfxrDGd/
 BJbwPjA1piDdocFfKy1conDahMSB8HuSvps6YsBCRikVLkYqLJbqGG5U208CCGbKbS5wByH8Y
 D2SYWGJkdZ9YzHX8IkNC8S3ENnlVTg5izlMz3zlWDSFXb4CjgkS7rEEbLx16pbffgaM1vXF+2
 Y8q2HjydvOiIFRybJtd+8kVkQqqTODluycRb/B6PygivEPb1W9QGbLI0LVj1+E3+33jqxze2N
 CWtsgMAUqRRmNrKEVj1w4CNZpfghsI4BGhN4bMhokpB6NDzNldSCw6itwD/wXfYOyty7ihTE5
 einywkhntiqq444W9VswptKnHHWxAM4A38MAyGcExN2h4n6T43fyB9zc08O7no0Ymji5K+mZQ
 oSpsTncLM1+yPPPtWBNlDaW61qBAWX1Klx4TTjzBmjwZaJiw5pIt8odMLyX6+reeeVXK8ajw7
 xE5y2aJoAbq8eYbQBUgLvAjjWjNiKrYLpIW56mgV5RumE0vJv6EqqWqL3QdDA2gOUcyfdicjp
 RZlsf3L6QsxpOqhaVSBiqd7j89l2OhX6JjveeDAHaM7YVCL2V43wtKjR6pITQyun+u/U6Gb8x
 u40n4JVJ8jLnaC7YVFKjlWn+TN09O/ZwkAnYcp2NE9wJP5YfxrKW8MKvVziCULANGj4YslLY0
 wOJA8QoV/IUlB++E3gA24JbiqNHlkeIQ0sNN0KacowLKzR5kX7AuinbFuG3NV9UutxHG65Nbp
 CIq7Nig
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 29/08/2022 à 04:10, Richard Henderson a écrit :
> Printing the same pid for all threads isn't helpful.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/strace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/strace.c b/linux-user/strace.c
> index c47d91bb3d..ca9d44fa7c 100644
> --- a/linux-user/strace.c
> +++ b/linux-user/strace.c
> @@ -3782,7 +3782,7 @@ print_syscall(CPUArchState *cpu_env, int num,
>       if (!f) {
>           return;
>       }
> -    fprintf(f, "%d ", getpid());
> +    fprintf(f, "%d ", gettid());
>   
>       for (i = 0; i < nsyscalls; i++) {
>           if (scnames[i].nr == num) {

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


