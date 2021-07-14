Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E453C8348
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:55:36 +0200 (CEST)
Received: from localhost ([::1]:34032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3cYA-0008Hr-K4
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:55:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1m3cWk-000799-RP
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:54:06 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:38499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1m3cWi-0006nn-PW
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 06:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=anhdeeyYNR8F70eSPNFq1h9ew3mITfaSdYsJPkFqW3o=; b=PpE72Z2+Wibu0wug9UPUtjMn6z
 8lZfHG6qwNrTadxW0azIvwUENfQAalSvMc0AY73mlxFIPoiWvoS1lSA3ffl7nJQf1i4dBcKVac5QK
 uK4NCbAgmGf1bIfIntvG9v7QB5PWps2F0rGk9MVCWqaJ1UGbYMiKdg/Pmek/bK9jHgOFLKTCYPEnk
 wjHLoSAUMdEL88Y010qPoUm+KjRo4ZvuG8MHRd+5zn+81QpyKVEXyiyOhYN6I/7mT1WPE2GwpvmiG
 TLThtbheeiyTxhVU87kXcI4FB8cZVo81VRBXdF4i+jySIBtjKWckx41nQ8FPWGMml5Rg7JZBud+3q
 eNnU2yeILXYLKbwWTlF2BMPRqZsRDnkDCTYPQxUJdWWOfIboPASiXs5Lww4SWA5qrx1CmAjRqn3+U
 hoGPO+Rwc5QxUk7YkUScGvShUaF3hA4GyCflNomOpJWBeBakFsvaSGAnBj81pX9wjuvYBpJ+NJZLX
 tHWt2hMTFSrkBNiDqxsyYAibR4PqnwlbRaU3CGwAjYmtMHXUQg9LnbOULzL8NBVrnfOWM33G4/zAP
 KyRRP9NQ13kzW0IHQYtSlplCHtx+r/XSga9gmV77WzekOxPEKFwSqlHuhBuVYYx5vYHvmdHeWG/yV
 bTVKNd049qYUfiyki7X/PqdIeQ5zX0dc2aU7r4uYU=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH  v1 14/21] contrib/gitdm: add domain-map for Crudebyte
Date: Wed, 14 Jul 2021 12:54:00 +0200
Message-ID: <1697536.XvsAyVjLyX@silver>
In-Reply-To: <20210714093638.21077-15-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
 <20210714093638.21077-15-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 14. Juli 2021 11:36:31 CEST Alex Benn=E9e wrote:
> Let me know if you want to be moved to individual contributor or you
> want to keep with the work domain mapping.
>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  contrib/gitdm/domain-map | 1 +
>  1 file changed, 1 insertion(+)

Either way is fine with me. Thanks Alex!

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>=20
> diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> index 5ac8288716..e42861cd11 100644
> --- a/contrib/gitdm/domain-map
> +++ b/contrib/gitdm/domain-map
> @@ -9,6 +9,7 @@ baidu.com       Baidu
>  bytedance.com   ByteDance
>  cmss.chinamobile.com China Mobile
>  citrix.com      Citrix
> +crudebyte.com   Crudebyte
>  eldorado.org.br Instituto de Pesquisas Eldorado
>  fujitsu.com     Fujitsu
>  google.com      Google




