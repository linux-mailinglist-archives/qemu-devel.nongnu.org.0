Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633343244B8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:40:56 +0100 (CET)
Received: from localhost ([::1]:41326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF01m-0004cM-Sz
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lF00F-00042K-87
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:39:19 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:57591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lF00B-0003pD-78
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:39:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=LpX/lg+cCo+rNuFFSoQQuk17sLYRcyLE37m+Jx8GFW8=; b=H9VgCHCt4Q1lfJ/8fkispaSnFu
 Vyxg3WkMzuQEB5hJFYLZOFAY4Q/O5uAHJDPS8yqkXdA1UlG5J4H4CZQX/tSKRK9VQEioXAO1+CGva
 IKov3BR9p7DSwHfeRAIPyXDblps754Y/iM7GR9wQ100extYCWMRZeB/UxBS2XnRMroR5Sav181Pyr
 T4ctzM0R2Rm8QLMI20HiI+f+iB+yEBnNXcZAx1HgL8OuiA4gZZMXuWJRpLz5+kGhhAfSuzxIDQLJ0
 QiIGEp8rMdRGZJV118YJ6oxTKeyuUNx9LzVY5Vm2OHDfDsV4Dn/v9nMlhMU3xASxPKyVmDOKWxoIy
 Cejaon3RR3HnV6FObFWpyd7msfPsQmr1qnWNs6rEzkOoVb7OYmS+AFQiXsesu3pRkobQ9+m9jV4Gp
 M3ujCSh2amPwm2Ruf9/tNDQcMuCaRoDGIVX/62Qk5G7QEgzDJ7FBzoxuXZx7QNwGLJzXLd99LWD5u
 gpiKNXZyst16I27qmbo/2p4bmOIkaZjT12P5vT7RxC53FK1N0MX3x77Vn95fXofNgSeFP1UxQBUn0
 CLEcp1QTQGemVnRptqpyQLU9M3qzl92ftDuBOvgR1v3kWMpknAPxaX2jLz2+dtwJMXuSPVurW/CMc
 e8doGPuJQOqjfxcGBizDQZw5vQjg8XhnxqGEMBmaQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: =?ISO-8859-1?Q?Jos=E9?= Pekkarinen <koalinux@gmail.com>, kraxel@redhat.com,
 geoff@hostfission.com
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Date: Wed, 24 Feb 2021 20:39:01 +0100
Message-ID: <3407243.daszWApDLn@silver>
In-Reply-To: <20210224191927.19271-1-koalinux@gmail.com>
References: <20210224191927.19271-1-koalinux@gmail.com>
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

On Mittwoch, 24. Februar 2021 20:19:27 CET Jos=E9 Pekkarinen wrote:
> This patch provides a default value to connect
> jack ports when the user don't specify connect-ports.
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1908832
>=20
> Signed-off-by: Jos=E9 Pekkarinen <koalinux@gmail.com>
> ---
>  audio/jackaudio.c | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
>=20
> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> index 3031c4e29b..0a87d5e23a 100644
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void *buf,
> size_t len)
>=20
>  static void qjack_client_connect_ports(QJackClient *c)
>  {
> -    if (!c->connect_ports || !c->opt->connect_ports) {
> +    if (!c->connect_ports) {
>          return;
>      }
>=20
>      c->connect_ports =3D false;
>      const char **ports;
> -    ports =3D jack_get_ports(c->client, c->opt->connect_ports, NULL,
> -        c->out ? JackPortIsInput : JackPortIsOutput);
> +    if (c->out) {
> +        ports =3D jack_get_ports(c->client,
> +            c->opt->connect_ports ? c->opt->connect_ports
> +                : "system:playback_.*",
> +            NULL, JackPortIsInput);
> +    } else {
> +        ports =3D jack_get_ports(c->client,
> +            c->opt->connect_ports ? c->opt->connect_ports
> +                : "system:capture_.*",
> +            NULL, JackPortIsOutput);
> +    }
>=20
>      if (!ports) {
>          return;

Looks fine to me now.

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Thanks Jos=E9!

Best regards,
Christian Schoenebeck



