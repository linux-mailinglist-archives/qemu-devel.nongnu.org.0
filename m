Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 576794161A7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:03:42 +0200 (CEST)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQGC-00032V-S7
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQCJ-0008PZ-HJ; Thu, 23 Sep 2021 10:59:39 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:49963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQCH-0000tM-A3; Thu, 23 Sep 2021 10:59:39 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MUGuZ-1mLY5x0GLD-00RM8w; Thu, 23 Sep 2021 16:59:30 +0200
Subject: Re: [PATCH v2] docs/nvdimm: Update nvdimm option value in machine
 example
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 xiaoguangrong.eric@gmail.com, lvivier@redhat.com, stefanha@redhat.com,
 pankaj.gupta@ionos.com
References: <20210923103015.135262-1-pankaj.gupta.linux@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <64a8d3ab-ec39-1273-bcc0-29be962950d4@vivier.eu>
Date: Thu, 23 Sep 2021 16:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923103015.135262-1-pankaj.gupta.linux@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K1hUOvSZOqG0GueIzd0Y1laTPcysku526SmrXxGlvYJJyaA5czm
 aUp4hbht0Z4GJ+++JE6XOLGIJ5U7v+Byy7QguQmyqN4Lt02LR16LjaY//OAupYq3VO4muIM
 jxLzM7ZCSYEsWTUec1/WkqPqyAQLMQAnPJD5o2jgJkhmEDgQfViOT31rq2UYK28faPbo6eM
 Q34+g05hKGXoPw9s+qs/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qH4QaH4xrY8=:Hg8+2TJY8tosiML50SFKox
 KqCJBHevt8J2yneTd0lNTiXB37a0fMwDqtdSMDJYjZSb6Hu8ItuKu6wGStIdBWPqC3gPks4jT
 gAuDfgpRYSfr55tpuqKVkDeNGvawq2Zz/fEWqLSPRWJh/RAwJowST07yR1e/GXnlIPRqBBqci
 jRAWMJLtQG/vgdETh8drQPg0eunLs7ZJX72nXoqDL+ytTIzpuALQeiHiRJzHCC/fSUpi/hZiP
 YB/WbwvVddsjrV+TtfI0A7kJe8ZKwSLJcyVa1fHeaYmcf/ZXvseVi5QZF+xT4xQS2djXNnG95
 fhTcAiCOsjslsMYTwEG8LFa1ZgrZ/+MMhXQX3ssLYthJjKTX7zLvTbZIk5tvU7q23DklTeQnO
 BCvxR1hhJE9Dr4PxEGJvVn5A38GJl08bUE3FfTTnEhZLHLS0gXMus1aUo/P3ehwv5HzWWIinL
 F2ng0uHobxwyGBTeAd6kn1JwFh++zsEWQ/jz9h4o0Ude5ZwMnNuub22/JCjoyJeDekWWOolRh
 QUF+iOjcYG1ciV9Ds1M5XFP8MAB+0heM4+zocvcllRNu/QXtnOho9sY0a7kYXtDVtq1086CRH
 +KcTIsWEY7Rr+vWsC9yCl1jBfd5h1mNtPWDlFWf/x/TYMYyUDAcErJjOqi8fIf39Pcr/ogZUG
 L+6ju4SCQM91NNkdKC2Xe6TbeJimfbc21oBOWm9+PEZxrTOAaocrSEdEve+y5Qz40BY+gtxRI
 q5BxJhUCODNu2CpdndfvInqTFtCvjRNQaUrk7Q==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/09/2021 à 12:30, Pankaj Gupta a écrit :
> Update nvdimm option value in example command from "-machine pc,nvdimm"
> to "-machine pc,nvdimm=on" as former complains with the below error:
> 
> "qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> ---
>  docs/nvdimm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
> index 0aae682be3..fd7773dc5a 100644
> --- a/docs/nvdimm.txt
> +++ b/docs/nvdimm.txt
> @@ -15,7 +15,7 @@ backend (i.e. memory-backend-file and memory-backend-ram). A simple
>  way to create a vNVDIMM device at startup time is done via the
>  following command line options:
>  
> - -machine pc,nvdimm
> + -machine pc,nvdimm=on
>   -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
>   -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
>   -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

