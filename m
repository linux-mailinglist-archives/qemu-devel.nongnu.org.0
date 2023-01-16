Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8320066CE9B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 19:16:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHU1s-0006Yn-Or; Mon, 16 Jan 2023 13:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHU1o-0006T3-9q; Mon, 16 Jan 2023 13:16:16 -0500
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pHU1m-0004pI-G0; Mon, 16 Jan 2023 13:16:16 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mzz6s-1oURsl2tCY-00x7Ti; Mon, 16 Jan 2023 19:16:09 +0100
Message-ID: <3693854c-579c-390d-7027-205cfaeddcf8@vivier.eu>
Date: Mon, 16 Jan 2023 19:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/cxl/cxl-host: Fix an error message typo
Content-Language: fr
To: Hoa Nguyen <hoanguyen@ucdavis.edu>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20221127032220.2649-1-hoanguyen@ucdavis.edu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221127032220.2649-1-hoanguyen@ucdavis.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RRTdGtnH0sSXhSz616EgrFlBmW8QHr59dmvhj2V1xpA+jk+JJPD
 0cokdUeVSs0FdAXfwoGrmph5rYhQag/Cy1aFO5ofTmWesHU7JVnL2WvdnH4EdW/hQ8PKvLa
 GIErcEwo+ss8bFjzU/tYILAgzBy5HIFl4ghUfkve37k9XazQMKvR4JZIufmEGcf3hnYDUsk
 WjUbNt9Wvx8jb6eKgBTSw==
UI-OutboundReport: notjunk:1;M01:P0:nNDxwijKf6o=;zyfXSvh+NqzuYTBaxlPbdVW30X4
 TrS2Z5j3B2I26mDYFJZ/Gvcu2uqcLGVrKaJ1I7YiXh+LrK7hSYi/wXSQ9Z/VK1od+Q0ZDUzPp
 8v4p6O+iJ54vvs+IIUIR2RZzhNEI/qGvQykk8dbey1hE+RcE49yzoSXux5u833D9WcIsIEdnq
 V1/iHAx+IYKDbnAv/6cfAvDAPEWPXFMhjaMc3FQDzLDBnY0dP/rs+IawtpMNJuun9J/3iPFjJ
 fWQjWf2IvVrNCGufkYnPpGzNY5Za7kmc4IHTrK4gFROx53YN5ODKIF5IWccWcA8IYuaSLvoQt
 lEkqjly2lPFRlpGzKDDD1YNxfZS7QCfZ9JYIas0+yo2lWWcOnDVgMoR3LREBJHZcMfzcuAcOl
 fhaEXWTt2VmPriTG9CvZxpUTMddbko4TeqhoD+i8CiRmemSb41GiShtz+79mwfm7ltu5jq4P+
 eEN7pk2aR3nR/OZgX07EGubbUS0L+jkY2eS5o8qseJ8b24znP6Tvmrc26RJpxdJosXy5hvat/
 nSfG/mmsUGGB2plXZ6NVAGZPwG2r7NYZvgFfNAl3CcY4j/BSjoqDJcPxrdRY9+hlzJCYRXytd
 In9tNgjWfR38tUg+PhY2CtCD9ouS7Vwp9t9VAzpUL9+oVVn6Ka92am7CF13mjjpAPWLn7YUuq
 cAjDZJLqO+y56sYpmoSWa+TjLTLpg0Vg6m8ad7opdw==
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
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

Le 27/11/2022 à 04:22, Hoa Nguyen a écrit :
> Signed-off-by: Hoa Nguyen <hoanguyen@ucdavis.edu>
> ---
>   hw/cxl/cxl-host.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
> index 1adf61231a..3c1ec8732a 100644
> --- a/hw/cxl/cxl-host.c
> +++ b/hw/cxl/cxl-host.c
> @@ -47,7 +47,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
>   
>       if (object->size % (256 * MiB)) {
>           error_setg(errp,
> -                   "Size of a CXL fixed memory window must my a multiple of 256MiB");
> +                   "Size of a CXL fixed memory window must be a multiple of 256MiB");
>           return;
>       }
>       fw->size = object->size;

Applied to my trivial-patches branch.

Thanks,
Laurent


