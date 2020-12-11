Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE242D6E0A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 03:13:33 +0100 (CET)
Received: from localhost ([::1]:54626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knXw3-0005Ew-FW
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 21:13:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1knXun-0004nA-CK
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 21:12:13 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <changzihao1@huawei.com>)
 id 1knXuk-0006CK-Ez
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 21:12:13 -0500
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CsZ5W4Dzsz543g;
 Fri, 11 Dec 2020 10:11:11 +0800 (CST)
Received: from dggema758-chm.china.huawei.com (10.1.198.200) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 11 Dec 2020 10:11:53 +0800
Received: from [10.174.186.85] (10.174.186.85) by
 dggema758-chm.china.huawei.com (10.1.198.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 11 Dec 2020 10:11:53 +0800
Subject: Re: [PULL 13/13] docs/devel/writing-qmp-commands.txt: Fix docs
To: Markus Armbruster <armbru@redhat.com>, <qemu-devel@nongnu.org>
References: <20201210163132.2919935-1-armbru@redhat.com>
 <20201210163132.2919935-14-armbru@redhat.com>
From: Zihao Chang <changzihao1@huawei.com>
Message-ID: <01bae7eb-eeb6-b820-9507-ad0e4fc415d4@huawei.com>
Date: Fri, 11 Dec 2020 10:11:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210163132.2919935-14-armbru@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.85]
X-ClientProxiedBy: dggeme716-chm.china.huawei.com (10.1.199.112) To
 dggema758-chm.china.huawei.com (10.1.198.200)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=changzihao1@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, xiexiangyou@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/12/11 0:31, Markus Armbruster wrote:
> From: Zihao Chang <changzihao1@huawei.com>
> 
> Fix the example of add qmp hello-world example.
> Without ":", make will report error:
> ../qapi/misc.json:573:2: line should end with ':'
> 
> Signed-off-by: Zihao Chang <changzihao1@huawei.com>
> Message-Id: <20201201143308.1626-1-changzihao1@huawei.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/devel/writing-qmp-commands.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
> index 46a6c48683..28984686c9 100644
> --- a/docs/devel/writing-qmp-commands.txt
> +++ b/docs/devel/writing-qmp-commands.txt
> @@ -243,7 +243,7 @@ There are many examples of such documentation in the schema file already, but
>  here goes "hello-world"'s new entry for qapi/misc.json:
I follow the steps of hello world demo and find the problem, other entries seem to have the same
problem. Because I didn't test the other entries, I only modified hello world. Maybe I can test
them later.
>  
>  ##
> -# @hello-world
> +# @hello-world:
>  #
>  # Print a client provided string to the standard output stream.
>  #
> 

