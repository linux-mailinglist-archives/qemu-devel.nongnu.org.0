Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C02365AF2
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 16:12:09 +0200 (CEST)
Received: from localhost ([::1]:57232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYr6m-0000Qg-1e
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 10:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lYr4n-00089L-6U
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:10:05 -0400
Received: from wforward3-smtp.messagingengine.com ([64.147.123.22]:42291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lYr4h-0001ZW-RE
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 10:10:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailforward.west.internal (Postfix) with ESMTP id C95572B4F;
 Tue, 20 Apr 2021 10:09:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 20 Apr 2021 10:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=YpRUUaxAIUotHJRDDilb+rUAdTFGzkKamv5j6+58N
 a0=; b=dtSbyHixS/eTCu7Zt6SA0VH05qhMDNYAFWClun9/RB8oLr17rqg7qfeMB
 lok3r+wGlsQ3016YxTW/JBqB1hfOTqpZLnVsvMMgIYRaXIT+qILU1JqPXHLsNIa1
 w8kPtjxlwev9QrJ/Xt7dW1chgAxDE3nk7nDlj9uXMB+rtkpg/POjBAPjsv9Xgpz8
 ylkGBaWoAaqbJBB7HKZZofXtyuE+EvuWSNljDDp4VIvR9mxcgIylLe3ytcWDGgcd
 6l08ZvQ8Ujx6KzG7JUqsC5eaZEf7GMRUV3navYNdfCAJke96VOlafCAmSWyI9RJ9
 FbwEY3XWEXyxnCPpiHtsLKblOL70Q==
X-ME-Sender: <xms:suB-YDSDafPM8Wf-VufjTLRxpegfvEFxItHSS_9pEku5thaYh5nSYA>
 <xme:suB-YIfWLnOaGX0oAKrjwtrrDfX_2aBBOMGDNDV8B7yCAn52HxOioc24CSNG1Hefq
 wQIkcJKfejOEmdJX5o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtiedgjeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvffujghfhfffkfggtgfgsehtqhertddttdejnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 epteevgeeuvedvjefhkefffeffveekvdekffehueeludfgteefheeljeetuddvkefhnecu
 kfhppeekuddrudekjedrvdeirddvfeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepughmvgesughmvgdrohhrgh
X-ME-Proxy: <xmx:suB-YCr85T6pZto6F5zr2EHXum12sP3G8B_rrWLPZdbddxxGvnHtsQ>
 <xmx:suB-YJ-JHy84o64PV-aJB6QCuL--7MQ8nynsuM7buwLV8-J4cnv_cQ>
 <xmx:suB-YOdBHI18JCE__FfwKXpoUrKYmbRDYgqi0AF4CKQ2KSVI2BohXA>
 <xmx:s-B-YAHi9w6WFSw7WYH3qfC1RUgheiEPfAIJLsialNO6eXRGSYJKur_QNA8>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id C6BE6108006A;
 Tue, 20 Apr 2021 10:09:53 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 69ab0976;
 Tue, 20 Apr 2021 14:09:52 +0000 (UTC)
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1] migration/dirtyrate: make sample page count
 configurable
In-Reply-To: <76153f1cea1ba01997b2b6944ffbb69083d4f7db.1618420974.git.huangy81@chinatelecom.cn>
References: <76153f1cea1ba01997b2b6944ffbb69083d4f7db.1618420974.git.huangy81@chinatelecom.cn>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Tue, 20 Apr 2021 15:09:52 +0100
Message-ID: <m25z0hujwv.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=64.147.123.22; envelope-from=dme@dme.org;
 helo=wforward3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: =?utf-8?Q?Hyman_Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-04-15 at 01:23:54 +08, huangy wrote:

> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> introduce optional sample-pages argument in calc-dirty-rate,
> making sample page count per GB configurable so that more
> accurate dirtyrate can be calculated.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> ---
>  migration/dirtyrate.c | 32 ++++++++++++++++++++++++++++----
>  migration/dirtyrate.h |  8 +++++++-
>  qapi/migration.json   | 13 ++++++++++---
>  3 files changed, 45 insertions(+), 8 deletions(-)
>
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index ccb9814..43a531c 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -48,6 +48,16 @@ static bool is_sample_period_valid(int64_t sec)
>      return true;
>  }
>=20=20
> +static bool is_sample_pages_valid(int64_t pages)
> +{
> +    if (pages < MIN_SAMPLE_PAGE_COUNT ||
> +        pages > MAX_SAMPLE_PAGE_COUNT) {
> +        return false;
> +    }
> +
> +    return true;
> +}

Could be:

return pages >=3D MIN_SAMPLE_PAGE_COUNT &&
       pages <=3D MAX_SAMPLE_PAGE_COUNT;

?

> +
>  static int dirtyrate_set_state(int *state, int old_state, int new_state)
>  {
>      assert(new_state < DIRTY_RATE_STATUS__MAX);
> @@ -72,13 +82,15 @@ static struct DirtyRateInfo *query_dirty_rate_info(vo=
id)
>      info->status =3D CalculatingState;
>      info->start_time =3D DirtyStat.start_time;
>      info->calc_time =3D DirtyStat.calc_time;
> +    info->sample_pages =3D DirtyStat.sample_pages;
>=20=20
>      trace_query_dirty_rate_info(DirtyRateStatus_str(CalculatingState));
>=20=20
>      return info;
>  }
>=20=20
> -static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time)
> +static void init_dirtyrate_stat(int64_t start_time, int64_t calc_time,
> +                                uint64_t sample_pages)
>  {
>      DirtyStat.total_dirty_samples =3D 0;
>      DirtyStat.total_sample_count =3D 0;
> @@ -86,6 +98,7 @@ static void init_dirtyrate_stat(int64_t start_time, int=
64_t calc_time)
>      DirtyStat.dirty_rate =3D -1;
>      DirtyStat.start_time =3D start_time;
>      DirtyStat.calc_time =3D calc_time;
> +    DirtyStat.sample_pages =3D sample_pages;
>  }
>=20=20
>  static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> @@ -361,6 +374,7 @@ void *get_dirtyrate_thread(void *arg)
>      int ret;
>      int64_t start_time;
>      int64_t calc_time;
> +    uint64_t sample_pages;
>=20=20
>      ret =3D dirtyrate_set_state(&CalculatingState, DIRTY_RATE_STATUS_UNS=
TARTED,
>                                DIRTY_RATE_STATUS_MEASURING);
> @@ -371,7 +385,8 @@ void *get_dirtyrate_thread(void *arg)
>=20=20
>      start_time =3D qemu_clock_get_ms(QEMU_CLOCK_REALTIME) / 1000;
>      calc_time =3D config.sample_period_seconds;
> -    init_dirtyrate_stat(start_time, calc_time);
> +    sample_pages =3D config.sample_pages_per_gigabytes;
> +    init_dirtyrate_stat(start_time, calc_time, sample_pages);
>=20=20
>      calculate_dirtyrate(config);
>=20=20
> @@ -383,7 +398,8 @@ void *get_dirtyrate_thread(void *arg)
>      return NULL;
>  }
>=20=20
> -void qmp_calc_dirty_rate(int64_t calc_time, Error **errp)
> +void qmp_calc_dirty_rate(int64_t calc_time, bool has_sample_pages,
> +                         int64_t sample_pages, Error **errp)
>  {
>      static struct DirtyRateConfig config;
>      QemuThread thread;
> @@ -404,6 +420,13 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **=
errp)
>          return;
>      }
>=20=20
> +    if (has_sample_pages && !is_sample_pages_valid(sample_pages)) {
> +        error_setg(errp, "sample-pages is out of range[%d, %d].",
> +                         MIN_SAMPLE_PAGE_COUNT,
> +                         MAX_SAMPLE_PAGE_COUNT);
> +        return;
> +    }

Could set "sample_pages =3D DIRTYRATE_DEFAULT_SAMPLE_PAGES" in the else
clause, removing the need for...

> +
>      /*
>       * Init calculation state as unstarted.
>       */
> @@ -415,7 +438,8 @@ void qmp_calc_dirty_rate(int64_t calc_time, Error **e=
rrp)
>      }
>=20=20
>      config.sample_period_seconds =3D calc_time;
> -    config.sample_pages_per_gigabytes =3D DIRTYRATE_DEFAULT_SAMPLE_PAGES;
> +    config.sample_pages_per_gigabytes =3D
> +        has_sample_pages ? sample_pages : DIRTYRATE_DEFAULT_SAMPLE_PAGES;

...checking again here.

>      qemu_thread_create(&thread, "get_dirtyrate", get_dirtyrate_thread,
>                         (void *)&config, QEMU_THREAD_DETACHED);
>  }
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 6ec4295..5f987e2 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -15,7 +15,6 @@
>=20=20
>  /*
>   * Sample 512 pages per GB as default.
> - * TODO: Make it configurable.
>   */
>  #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
>=20=20
> @@ -35,6 +34,12 @@
>  #define MIN_FETCH_DIRTYRATE_TIME_SEC              1
>  #define MAX_FETCH_DIRTYRATE_TIME_SEC              60
>=20=20
> +/*
> + * Take 128 as minimum for sample dirty pages
> + */

This comment doesn't add any value - is there a reason for these values?

> +#define MIN_SAMPLE_PAGE_COUNT                     128
> +#define MAX_SAMPLE_PAGE_COUNT                     4096
> +
>  struct DirtyRateConfig {
>      uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
>      int64_t sample_period_seconds; /* time duration between two sampling=
 */
> @@ -63,6 +68,7 @@ struct DirtyRateStat {
>      int64_t dirty_rate; /* dirty rate in MB/s */
>      int64_t start_time; /* calculation start time in units of second */
>      int64_t calc_time; /* time duration of two sampling in units of seco=
nd */
> +    uint64_t sample_pages; /* sample pages per GB */
>  };
>=20=20
>  void *get_dirtyrate_thread(void *arg);
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 9bf0bc4..868a867 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1741,6 +1741,9 @@
>  #
>  # @calc-time: time in units of second for sample dirty pages
>  #
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512
> +#
>  # Since: 5.2
>  #
>  ##
> @@ -1748,7 +1751,8 @@
>    'data': {'*dirty-rate': 'int64',
>             'status': 'DirtyRateStatus',
>             'start-time': 'int64',
> -           'calc-time': 'int64'} }
> +           'calc-time': 'int64',
> +           'sample-pages': 'uint64'} }
>=20=20
>  ##
>  # @calc-dirty-rate:
> @@ -1757,13 +1761,16 @@
>  #
>  # @calc-time: time in units of second for sample dirty pages
>  #
> +# @sample-pages: page count per GB for sample dirty pages
> +#                the default value is 512
> +#
>  # Since: 5.2
>  #
>  # Example:
> -#   {"command": "calc-dirty-rate", "data": {"calc-time": 1} }
> +#   {"command": "calc-dirty-rate", "data": {"calc-time": 1, 'sample-page=
s': 512} }
>  #
>  ##
> -{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64'} }
> +{ 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64', '*sample-=
pages': 'int'} }
>=20=20
>  ##
>  # @query-dirty-rate:
> --=20
> 1.8.3.1

dme.
--=20
Don't you know you're never going to get to France.

