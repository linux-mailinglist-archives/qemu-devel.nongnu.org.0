Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C56702E6D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:38:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsY-00007P-Pr; Mon, 15 May 2023 09:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyXr5-0004hh-IH
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:11 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pyXqw-00012s-6g
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:06 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.195])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 800352826E;
 Mon, 15 May 2023 13:02:57 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 15 May
 2023 15:02:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002dd8ec664-e471-4cc4-b562-b6a193b1a973,
 C2820DDF228AE5DDDBFD944B87CC7F3B41DD1A91) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <594d94de-41fb-1cf5-8e5c-e7eb1dec5ad9@kaod.org>
Date: Mon, 15 May 2023 15:02:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 14/21] migration: We don't need the field rate_limit_used
 anymore
To: Juan Quintela <quintela@redhat.com>, <qemu-devel@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, <qemu-block@nongnu.org>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Eric Farman
 <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>, <qemu-ppc@nongnu.org>,
 <qemu-s390x@nongnu.org>, Fam Zheng <fam@euphon.net>, Thomas Huth
 <thuth@redhat.com>, Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>
References: <20230508130909.65420-1-quintela@redhat.com>
 <20230508130909.65420-15-quintela@redhat.com>
Content-Language: en-US
In-Reply-To: <20230508130909.65420-15-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 43b94c22-6a70-41b6-9512-dbe1a1bd4bbb
X-Ovh-Tracer-Id: 3278902005489634201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfeehjedgiedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfhffuvfevfhgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeivefgteeltdefleeiiedutdfhledvhedutdeuteetvdejkeejgeeigfeileffgeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleekpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehquhhinhhtvghlrgesrhgvughhrghtrdgtohhmpdhthhhuthhhsehrvgguhhgrthdrtghomhdpfhgrmhesvghuphhhohhnrdhnvghtpdhqvghmuhdqshefledtgiesnhhonhhgnhhurdhorhhgpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhfrghrmhgrnheslhhinhhugidrihgsmhdrtghomhdphhgrrhhshhhpsgeslhhinhhugidrihgsmhdrtghomhdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdprhhitg
 hhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhlvghosghrrghssehrvgguhhgrthdrtghomhdpphgvthgvrhigsehrvgguhhgrthdrtghomhdpjhhsnhhofiesrhgvughhrghtrdgtohhmpdhvshgvmhgvnhhtshhovheshigrnhguvgigqdhtvggrmhdrrhhupdgvsghlrghkvgesrhgvughhrghtrdgtohhmpdhqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhgpdhsthgvfhgrnhhhrgesrhgvughhrghtrdgtohhmpdgurghvihgusehrvgguhhgrthdrtghomhdpsghorhhnthhrrggvghgvrheslhhinhhugidrihgsmhdrtghomhdpuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpphgrshhitgeslhhinhhugidrihgsmhdrtghomhdpihhiiheslhhinhhugidrihgsmhdrtghomhdpghhrohhugheskhgrohgurdhorhhgpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.811,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/8/23 15:09, Juan Quintela wrote:
> Since previous commit, we calculate how much data we have send with
> migration_transferred_bytes() so no need to maintain this counter and
> remember to always update it.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>



Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   migration/migration-stats.c |  6 ------
>   migration/migration-stats.h | 14 --------------
>   migration/multifd.c         |  1 -
>   migration/qemu-file.c       |  4 ----
>   4 files changed, 25 deletions(-)
> 
> diff --git a/migration/migration-stats.c b/migration/migration-stats.c
> index eb1a2c1ad4..a42b5d953e 100644
> --- a/migration/migration-stats.c
> +++ b/migration/migration-stats.c
> @@ -59,15 +59,9 @@ void migration_rate_limit_set(uint64_t limit)
>   
>   void migration_rate_limit_reset(QEMUFile *f)
>   {
> -    stat64_set(&mig_stats.rate_limit_used, 0);
>       stat64_set(&mig_stats.rate_limit_start, migration_transferred_bytes(f));
>   }
>   
> -void migration_rate_limit_account(uint64_t len)
> -{
> -    stat64_add(&mig_stats.rate_limit_used, len);
> -}
> -
>   uint64_t migration_transferred_bytes(QEMUFile *f)
>   {
>       uint64_t multifd = stat64_get(&mig_stats.multifd_bytes);
> diff --git a/migration/migration-stats.h b/migration/migration-stats.h
> index 4029f1deab..ab4cc15a74 100644
> --- a/migration/migration-stats.h
> +++ b/migration/migration-stats.h
> @@ -77,10 +77,6 @@ typedef struct {
>        * Maximum amount of data we can send in a cycle.
>        */
>       Stat64 rate_limit_max;
> -    /*
> -     * Amount of data we have sent in the current cycle.
> -     */
> -    Stat64 rate_limit_used;
>       /*
>        * How long has the setup stage took.
>        */
> @@ -108,16 +104,6 @@ extern MigrationAtomicStats mig_stats;
>   
>   void calculate_time_since(Stat64 *val, int64_t since);
>   
> -/**
> - * migration_rate_limit_account: Increase the number of bytes transferred.
> - *
> - * Report on a number of bytes the have been transferred that need to
> - * be applied to the rate limiting calcuations.
> - *
> - * @len: amount of bytes transferred
> - */
> -void migration_rate_limit_account(uint64_t len);
> -
>   /**
>    * migration_rate_limit_get: Get the maximum amount that can be transferred.
>    *
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 2efb313be4..9d2ade7abc 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -432,7 +432,6 @@ static int multifd_send_pages(QEMUFile *f)
>       multifd_send_state->pages = p->pages;
>       p->pages = pages;
>       transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
> -    migration_rate_limit_account(transferred);
>       qemu_mutex_unlock(&p->mutex);
>       stat64_add(&mig_stats.transferred, transferred);
>       stat64_add(&mig_stats.multifd_bytes, transferred);
> diff --git a/migration/qemu-file.c b/migration/qemu-file.c
> index 3f993e24af..0086d67d83 100644
> --- a/migration/qemu-file.c
> +++ b/migration/qemu-file.c
> @@ -292,7 +292,6 @@ void qemu_fflush(QEMUFile *f)
>               qemu_file_set_error_obj(f, -EIO, local_error);
>           } else {
>               uint64_t size = iov_size(f->iov, f->iovcnt);
> -            migration_rate_limit_account(size);
>               f->total_transferred += size;
>           }
>   
> @@ -344,9 +343,6 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
>       if (f->hooks && f->hooks->save_page) {
>           int ret = f->hooks->save_page(f, block_offset,
>                                         offset, size, bytes_sent);
> -        if (ret != RAM_SAVE_CONTROL_NOT_SUPP) {
> -            migration_rate_limit_account(size);
> -        }
>   
>           if (ret != RAM_SAVE_CONTROL_DELAYED &&
>               ret != RAM_SAVE_CONTROL_NOT_SUPP) {


