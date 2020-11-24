Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46D2C2576
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 13:15:49 +0100 (CET)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khXEa-0006K1-Gk
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 07:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khXCr-0005h9-OM; Tue, 24 Nov 2020 07:14:02 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khXCm-000884-Vd; Tue, 24 Nov 2020 07:14:01 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CgNG55GQ9zLsqx;
 Tue, 24 Nov 2020 20:13:17 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Nov 2020 20:13:36 +0800
Message-ID: <5FBCF8F0.9060103@huawei.com>
Date: Tue, 24 Nov 2020 20:13:36 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
References: <5F9AC6FF.4000301@huawei.com>
 <CAC_L=vVg=YitEAKE+wGEmphuL8Eu87mYDiYD=UNKGhqOyd8PpQ@mail.gmail.com>
In-Reply-To: <CAC_L=vVg=YitEAKE+wGEmphuL8Eu87mYDiYD=UNKGhqOyd8PpQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
 QEMU <qemu-devel@nongnu.org>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 zhengchuan@huawei.com, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi everyone，

Who can help me merge this patch into the master branch? This patch may be need for qemu-5.2

Thanks，
Alex

On 2020/11/4 0:35, Marcel Apfelbaum wrote:
> Hi Alex,
> 
> On Thu, Oct 29, 2020 at 3:43 PM AlexChen <alex.chen@huawei.com <mailto:alex.chen@huawei.com>> wrote:
> 
>     When fd is not found according to ifid, the _hash_tbl_search_fd_by_ifid()
>     returns 0 and assigns the result to *fd, so We have to check that *fd is 0,
>     not that fd is 0.
> 
>     Reported-by: Euler Robot <euler.robot@huawei.com <mailto:euler.robot@huawei.com>>
>     Signed-off-by: AlexChen <alex.chen@huawei.com <mailto:alex.chen@huawei.com>>
>     ---
>      contrib/rdmacm-mux/main.c | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
> 
>     diff --git a/contrib/rdmacm-mux/main.c b/contrib/rdmacm-mux/main.c
>     index bd82abbad3..771ca01e03 100644
>     --- a/contrib/rdmacm-mux/main.c
>     +++ b/contrib/rdmacm-mux/main.c
>     @@ -186,7 +186,7 @@ static int hash_tbl_search_fd_by_ifid(int *fd, __be64 *gid_ifid)
>          *fd = _hash_tbl_search_fd_by_ifid(gid_ifid);
>          pthread_rwlock_unlock(&server.lock);
> 
>     -    if (!fd) {
>     +    if (!*fd) {
>              syslog(LOG_WARNING, "Can't find matching for ifid 0x%llx\n", *gid_ifid);
>              return -ENOENT;
>          }
>     -- 
>     2.19.1
> 
> 
> Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com <mailto:marcel.apfelbaum@gmail.com>>
> 
> Thanks for the fix,
> Marcel
> 
>  


