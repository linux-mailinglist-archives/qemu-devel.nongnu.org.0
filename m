Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FD30E2A8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 19:38:40 +0100 (CET)
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7N31-000667-6y
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 13:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7MoD-00041c-4a
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:23:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7Mo9-0001dr-RD
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 13:23:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612376595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjLoSOZM3zbF9Mi0HBC7D7MLVUemjk0XhHhfHZvGlwI=;
 b=f4qEmJUnImlRmooKHb1jkdJckYVlwYTZT5vL67iL4YK0GpqlQ07tfiStJoprXIWsO8xrKn
 n+u8xknxyrbucLB4lLVcOL2HtP7fltpvvTIz4RF/Ue5YxIFhFZR6QVyXJiXLqpJt8sDJ3k
 nDeemIxJz6r/OySsVrX+RzehbgKxb9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-8t2dlZoyPCu0tCBhSgHVeQ-1; Wed, 03 Feb 2021 13:23:14 -0500
X-MC-Unique: 8t2dlZoyPCu0tCBhSgHVeQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 212A3801960;
 Wed,  3 Feb 2021 18:23:13 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE6121007610;
 Wed,  3 Feb 2021 18:23:10 +0000 (UTC)
Date: Wed, 3 Feb 2021 18:23:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v4 06/18] migration/rdma: export
 MultiFDSendParams/MultiFDRecvParams
Message-ID: <20210203182307.GQ2950@work-vm>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
 <1612339311-114805-7-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1612339311-114805-7-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: yubihong@huawei.com, berrange@redhat.com, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> MultiFDSendParams and MultiFDRecvParams is need for rdma, export it
>=20
> Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>

I think these become simpler if you just return a NULL on error,
also I think you can make 'id' unsigned and then you don't have
to worry about it being negative.

Also, please make it start with multifd_ so we know where it's coming
from; so:

MultiFDSendParams *multifd_send_param_get(unsigned channel);

Dave

> ---
>  migration/multifd.c | 26 ++++++++++++++++++++++++++
>  migration/multifd.h |  2 ++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 5d34950..ae0b7f0 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -390,6 +390,19 @@ struct {
>      MultiFDSetup *setup_ops;
>  } *multifd_send_state;
> =20
> +int get_multifd_send_param(int id, MultiFDSendParams **param)
> +{
> +    int ret =3D 0;
> +
> +    if (id < 0 || id >=3D migrate_multifd_channels()) {
> +        ret =3D -1;
> +    } else {
> +        *param =3D &(multifd_send_state->params[id]);
> +    }
> +
> +    return ret;
> +}
> +
>  /*
>   * How we use multifd_send_state->pages and channel->pages?
>   *
> @@ -934,6 +947,19 @@ struct {
>      MultiFDSetup *setup_ops;
>  } *multifd_recv_state;
> =20
> +int get_multifd_recv_param(int id, MultiFDRecvParams **param)
> +{
> +    int ret =3D 0;
> +
> +    if (id < 0 || id >=3D migrate_multifd_channels()) {
> +        ret =3D -1;
> +    } else {
> +        *param =3D &(multifd_recv_state->params[id]);
> +    }
> +
> +    return ret;
> +}
> +
>  static void multifd_recv_terminate_threads(Error *err)
>  {
>      int i;
> diff --git a/migration/multifd.h b/migration/multifd.h
> index e3ab4b0..d57756c 100644
> --- a/migration/multifd.h
> +++ b/migration/multifd.h
> @@ -176,6 +176,8 @@ typedef struct {
>  #ifdef CONFIG_RDMA
>  extern MultiFDSetup multifd_rdma_ops;
>  #endif
> +int get_multifd_send_param(int id, MultiFDSendParams **param);
> +int get_multifd_recv_param(int id, MultiFDRecvParams **param);
>  MultiFDSetup *multifd_setup_ops_init(void);
> =20
>  void multifd_register_ops(int method, MultiFDMethods *ops);
> --=20
> 1.8.3.1
>=20
--=20
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


