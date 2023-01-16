Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CEB66BC79
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNLv-0002ZW-AZ; Mon, 16 Jan 2023 06:08:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNLt-0002ZM-L0
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:08:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHNLr-0004hP-Uj
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 06:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673867311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzk452qWLu6DXFW8Fnw6fYwj95LE92i0gyWiSioYEgQ=;
 b=S5bakicdS2K2IM61AzniH1t2Sm+FfPx4hJ05m9Pr+W/JQ2t3a0l17iJtwy69TjQwxMq/Hd
 Ba1Zw1LQU8dSB1O3JPHlQkB0nBVQNmj8BuF5gbFFTxxuRN0RPxDlwdh/fusCSj0Dg4Wzv2
 GYlugWet9KfMoSUCtINEOgyjWfLf/ZQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-2tqXEOWkOySFRXDsgCXpgw-1; Mon, 16 Jan 2023 06:08:27 -0500
X-MC-Unique: 2tqXEOWkOySFRXDsgCXpgw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EE682A2AD7E;
 Mon, 16 Jan 2023 11:08:26 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1227D492B26;
 Mon, 16 Jan 2023 11:08:23 +0000 (UTC)
Date: Mon, 16 Jan 2023 11:08:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: arei.gonglei@huawei.com, mst@redhat.com, dgilbert@redhat.com,
 eblake@redhat.com, armbru@redhat.com, michael.roth@amd.com,
 pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [for-8.0 v2 03/11] cryptodev: Introduce cryptodev alg type in QAPI
Message-ID: <Y8UwJuHbchQLDnOJ@redhat.com>
References: <20221122140756.686982-1-pizhenwei@bytedance.com>
 <20221122140756.686982-4-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122140756.686982-4-pizhenwei@bytedance.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 22, 2022 at 10:07:48PM +0800, zhenwei pi wrote:
> Introduce cryptodev alg type in cryptodev.json, then apply this to
> related codes, and drop 'enum CryptoDevBackendAlgType'.
> 
> There are two options:
> 1, { 'enum': 'QCryptodevBackendAlgType',
>   'prefix': 'CRYPTODEV_BACKEND_ALG',
>   'data': ['sym', 'asym']}
> Then we can keep 'CRYPTODEV_BACKEND_ALG_SYM' and avoid lots of
> changes.
> 2, changes in this patch(with prefix 'QCRYPTODEV_BACKEND_ALG').
> 
> To avoid breaking the rule of QAPI, use 2 here.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  backends/cryptodev-builtin.c |  6 +++---
>  backends/cryptodev-lkcf.c    |  4 ++--
>  backends/cryptodev.c         |  6 +++---
>  hw/virtio/virtio-crypto.c    | 14 +++++++-------
>  include/sysemu/cryptodev.h   |  8 +-------
>  qapi/cryptodev.json          | 14 ++++++++++++++
>  6 files changed, 30 insertions(+), 22 deletions(-)


> diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
> index 08895271eb..5fb7b8f43f 100644
> --- a/backends/cryptodev-builtin.c
> +++ b/backends/cryptodev-builtin.c
> @@ -537,7 +537,7 @@ static int cryptodev_builtin_operation(
>      CryptoDevBackendBuiltinSession *sess;
>      CryptoDevBackendSymOpInfo *sym_op_info;
>      CryptoDevBackendAsymOpInfo *asym_op_info;
> -    enum CryptoDevBackendAlgType algtype = op_info->algtype;
> +    enum QCryptodevBackendAlgType algtype = op_info->algtype;

QAPI generates a typedef for every enum with the same name as
the enum itself. IOW, this should change to merely

   QCryptodevBackendAlgType algtype = op_info->algtype;


> diff --git a/backends/cryptodev-lkcf.c b/backends/cryptodev-lkcf.c
> index de3d1867c5..919bf05b75 100644
> --- a/backends/cryptodev-lkcf.c
> +++ b/backends/cryptodev-lkcf.c
> @@ -477,7 +477,7 @@ static int cryptodev_lkcf_operation(
>      CryptoDevBackendLKCF *lkcf =
>          CRYPTODEV_BACKEND_LKCF(backend);
>      CryptoDevBackendLKCFSession *sess;
> -    enum CryptoDevBackendAlgType algtype = op_info->algtype;
> +    enum QCryptodevBackendAlgType algtype = op_info->algtype;

As above


> diff --git a/backends/cryptodev.c b/backends/cryptodev.c
> index 81941af816..d3caded920 100644
> --- a/backends/cryptodev.c
> +++ b/backends/cryptodev.c
> @@ -120,10 +120,10 @@ int cryptodev_backend_crypto_operation(
>  {
>      VirtIOCryptoReq *req = opaque1;
>      CryptoDevBackendOpInfo *op_info = &req->op_info;
> -    enum CryptoDevBackendAlgType algtype = req->flags;
> +    enum QCryptodevBackendAlgType algtype = req->flags;

As above.


> diff --git a/include/sysemu/cryptodev.h b/include/sysemu/cryptodev.h
> index af152d09db..f68a4baf13 100644
> --- a/include/sysemu/cryptodev.h
> +++ b/include/sysemu/cryptodev.h
> @@ -49,12 +49,6 @@ typedef struct CryptoDevBackendPeers CryptoDevBackendPeers;
>  typedef struct CryptoDevBackendClient
>                       CryptoDevBackendClient;
>  
> -enum CryptoDevBackendAlgType {
> -    CRYPTODEV_BACKEND_ALG_SYM,
> -    CRYPTODEV_BACKEND_ALG_ASYM,
> -    CRYPTODEV_BACKEND_ALG__MAX,
> -};
> -
>  /**
>   * CryptoDevBackendSymSessionInfo:
>   *
> @@ -181,7 +175,7 @@ typedef struct CryptoDevBackendAsymOpInfo {
>  } CryptoDevBackendAsymOpInfo;
>  
>  typedef struct CryptoDevBackendOpInfo {
> -    enum CryptoDevBackendAlgType algtype;
> +    enum QCryptodevBackendAlgType algtype;

As above, drop the 'enum' qualifier

>      uint32_t op_code;
>      uint64_t session_id;
>      union {

With the redundant 'enum' qualifiers dropped, then you may add

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


