Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8432FF1B3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 18:22:24 +0100 (CET)
Received: from localhost ([::1]:55318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2df5-0007R0-Cb
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 12:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2dO5-0007nz-9K
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:04:49 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:55017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l2dO1-0000aH-FS
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 12:04:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id B45EE845BCD4;
 Thu, 21 Jan 2021 18:04:42 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 21 Jan
 2021 18:04:08 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001598f50ed-bdc6-45db-8006-7b6175df0ec1,
 A41C5EF03AA0D3A03B7528971392D1AB75695B26) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 21 Jan 2021 18:04:06 +0100
From: Greg Kurz <groug@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: Re: [PATCH] 9pfs/proxy: Check return value of proxy_marshal()
Message-ID: <20210121180406.2ccd3633@bahia.lan>
In-Reply-To: <161035859647.1221144.4691749806675653934.stgit@bahia.lan>
References: <161035859647.1221144.4691749806675653934.stgit@bahia.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 868aa298-224c-41a1-b7b9-e51362969b8d
X-Ovh-Tracer-Id: 12973744627021486557
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeggddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeevvdevueegieevfeegfeelheefveelteevhffgffetuedufedtieeuueeiveekkeenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 10:49:56 +0100
Greg Kurz <groug@kaod.org> wrote:

> This should always successfully write exactly two 32-bit integers.
> Make it clear with an assert(), like v9fs_receive_status() and
> v9fs_receive_response() already do when unmarshalling the same
> header.
> 
> Fixes: Coverity CID 1438968
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---

Applied to https://gitlab.com/gkurz/qemu/-/tree/9p-next

>  hw/9pfs/9p-proxy.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
> index 6f598a0f111c..4aa4e0a3baa0 100644
> --- a/hw/9pfs/9p-proxy.c
> +++ b/hw/9pfs/9p-proxy.c
> @@ -537,7 +537,8 @@ static int v9fs_request(V9fsProxy *proxy, int type, void *response, ...)
>      }
>  
>      /* marshal the header details */
> -    proxy_marshal(iovec, 0, "dd", header.type, header.size);
> +    retval = proxy_marshal(iovec, 0, "dd", header.type, header.size);
> +    assert(retval == 4 * 2);
>      header.size += PROXY_HDR_SZ;
>  
>      retval = qemu_write_full(proxy->sockfd, iovec->iov_base, header.size);
> 
> 


