Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A86529DD6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:21:09 +0200 (CEST)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtO8-0005Wx-6A
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqtKc-00043H-W8; Tue, 17 May 2022 05:17:31 -0400
Received: from smtp3.mail.ru ([94.100.179.58]:44014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqtKZ-00027W-Lb; Tue, 17 May 2022 05:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=ugfzsjmSbLfnfRR96BQnW871DD+RJaGiiSlRuXgIsNU=; 
 t=1652779047;x=1653384447; 
 b=OmLYWVCRly8PPP2g+5EpEuXqML3auplmSRwzEj+ZwdBlskI2fDfsDk2ZG6isVq170gF0+7N0R05DmdMckkEhZwpFONvJdUefcy8i4EGi3/f6N1WWpF/7tVxoK/h9Hevpod3zXjOlRpoV/zw067SN8bZ6YowIonW3+/tvCULpaUa+S4BXSF6BqNIDPP9NKPrymqjQbIt7P9L7YQwe59itS26vhDhui1F9qGn49OSNBdDd24XtmKTbgGdebuw2zl15CpszbSdIm0u0wL8lg4GynpmW4l2uKPtP7od+DB3p93Z+f46YQ1VKldeoLYYGezf7obxxXZ29aGj1QfIHQNCS5Q==;
Received: by smtp3.mail.ru with esmtpa (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqtKT-0006uR-QR; Tue, 17 May 2022 12:17:22 +0300
Message-ID: <dcde36bb-6bdc-49fe-d8d0-4b72fd6b43ba@mail.ru>
Date: Tue, 17 May 2022 12:17:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] nbd: Drop dead code spotted by Coverity
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
References: <20220516210519.76135-1-eblake@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220516210519.76135-1-eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp3.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9F33B3806BF114D159E7BD6746107077164F3C96AD71A0548182A05F5380850404C228DA9ACA6FE271E488FD287A6FC867307631A31098BC54BF32871ABBCF809C131704D47150E9C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7F9D05773942AAE9CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637352A1F9739ED04D38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D89380F351A1EB8719EEF20194BA20D56C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78A0F7C24A37A3D769FA2833FD35BB23D9E625A9149C048EE26055571C92BF10F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2CCD8F0CAA010FB389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637E0FFE498A6D76A8ED81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE7B78D39C50F1DEB0DEC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C306E75DF76071776535872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A54F171563253922CBFA591B7C373CBB791DC16544AB38208FD59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342B8615F5CFAD9D0264C6D9A812ED49A183011B940F29E53223BA16F23F9F8D150B23374717D1C8BB1D7E09C32AA3244CB6FB645DC33F1E2DC243893A60214434A95CA90A1D8AC5658D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394PeQqSMY1tKMQ==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D443796659B9BA3855D0FAC7A2EDFAC5572E52D39E0E44A3216E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.179.58;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp3.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

17.05.2022 00:05, Eric Blake wrote:
> CID 1488362 points out that the second 'rc >= 0' check is now dead
> code.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: 172f5f1a40(nbd: remove peppering of nbd_client_connected)
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   block/nbd.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/block/nbd.c b/block/nbd.c
> index 6085ab1d2c..7f5f50ec46 100644
> --- a/block/nbd.c
> +++ b/block/nbd.c
> @@ -521,12 +521,8 @@ static int coroutine_fn nbd_co_send_request(BlockDriverState *bs,
>       if (qiov) {
>           qio_channel_set_cork(s->ioc, true);
>           rc = nbd_send_request(s->ioc, request);
> -        if (rc >= 0) {
> -            if (qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
> -                                       NULL) < 0) {
> -                rc = -EIO;
> -            }
> -        } else if (rc >= 0) {
> +        if (rc >= 0 && qio_channel_writev_all(s->ioc, qiov->iov, qiov->niov,
> +                                              NULL) < 0) {
>               rc = -EIO;
>           }
>           qio_channel_set_cork(s->ioc, false);


Hi all! I am back). And happy to start with something simple:

Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>

(yes, not @openvz.org, just my personal address. Probably new employer will ask to use a corporate one, if so I'll have to send one another patch to MAINTAINERS. But I'd prefer not to hurry with it.)

Sorry for a long delay. That was a gap between old place of work and a new one. I have planned to do some review and resending work in the list during the gap, but.. There were so many things)
Anyway, now at new work I've given some time to continue Qemu maintenance and working on my unfinished series and that's wonderful.

-- 
Best regards,
Vladimir

