Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D996ABD95
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 12:00:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ8Zc-0001HW-D1; Mon, 06 Mar 2023 06:00:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZ8ZY-0001HC-HI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:00:04 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZ8ZW-0002R1-Oz
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 06:00:04 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mgw7n-1qDRT90qNx-00hMAI; Mon, 06 Mar 2023 11:59:58 +0100
Message-ID: <7a01b1c8-cd91-8133-8134-25afa6178604@vivier.eu>
Date: Mon, 6 Mar 2023 11:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Andreas Schwab <schwab@suse.de>
Cc: qemu-devel@nongnu.org
References: <mvmedq2kxoe.fsf@suse.de>
Content-Language: fr
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] linux-user: fill out task state in /proc/self/stat
In-Reply-To: <mvmedq2kxoe.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:JT3aSWEpDrhM3LoRON98ztdMRNgrl8D5BeR19/Irym9SRcRlEeV
 ag4myVuFc9IN4pyBN1WWo9Qqv+BT9SuBSFPPd1SanwTADGAUI9GzVsfRkFg7yRqsrA+QV/R
 B1I97NrjPYZbEWDTefvYK+1Ca5dZkmJPwhp8Aef+gVVPrFGg+CB5g1J+mg8dexCfvoQfAjS
 V75YbTOmYDGvsoKUyz8Sg==
UI-OutboundReport: notjunk:1;M01:P0:Zb67xHRZnG4=;1tgQ75sfca7ddcEgdlhCnCKgKhU
 uZ0YB2+upxLuXiHUCwGe7BuO2gU0Wt6Mrd100fXwDSToArb5K+StowA93Z4XhtDgkWw2qNgHV
 rj34xxJa0QReaISSr1nrBp1DQEVZWWN+ZjFLyycetCmWWfTyKfGgEK25JuYM0+Hf1cw89bOdq
 s5hRkmCbZbijgZMBzHJmVwgUaGOgdh2VFOqpUzAwcIveW5tm/4tUlHpeeg7qFazmJC1/KJXti
 N5XqCzUjjPbdrtqQNKWuo5WqPlU2hBEEIE6QbhLVLX6Wh1JUqpv2bhaTEgaj5+SKmJxL8AdBH
 LcmlAk7gB/79tfpTIUcPikCh5aiIMRcOGnYpKfA4+m9fcq1jDw4RkMI7G3DVcHYag1+WQDe4+
 1hBuNHQDtUd2UPCz3FNQbFELdAbFH+hnVrKWqSHtcgpdo+Mcfvkdd/RQhu/3olm+82iIg/cKT
 wDPROJUvkjzxGtUda943NU1K2lBRl4U8vggOGQ71WiyQnE6yIhoLH9CLCgx+lQLoHgGtaxEND
 EJDxcWOdi1/cnVPpn08e5xoaUjwj4epzAePw+qbnRyGV5u79Hk1QkEkWuMemPXTTCqAcbI1RJ
 wvC/jMZ5byvlja/XOTUwm6kgJYpbS+q8NZ7GsBsqsX6VNw510XTavoBHoIjccPudYSMLjoThA
 LB3OZR4A4b/AwNSAWJoxGy7exMCSoxKChMNCKjeaNg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 06/03/2023 à 10:59, Andreas Schwab a écrit :
> Some programs want to match an actual task state character.
> 
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   linux-user/syscall.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 36fffd36ca..eb4c2c3162 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8127,6 +8127,9 @@ static int open_self_stat(CPUArchState *cpu_env, int fd)
>               gchar *bin = g_strrstr(ts->bprm->argv[0], "/");
>               bin = bin ? bin + 1 : ts->bprm->argv[0];
>               g_string_printf(buf, "(%.15s) ", bin);
> +        } else if (i == 2) {
> +            /* task state */
> +            g_string_assign(buf, "R "); /* we are running right now */
>           } else if (i == 3) {
>               /* ppid */
>               g_string_printf(buf, FMT_pid " ", getppid());

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

