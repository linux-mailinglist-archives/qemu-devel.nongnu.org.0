Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E06EAA63
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 14:31:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pppul-0002Yx-N6; Fri, 21 Apr 2023 08:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppug-0002WS-TD
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:30:55 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pppub-00022H-Go
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 08:30:54 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2v3f73rbz67m0K;
 Fri, 21 Apr 2023 20:29:34 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 21 Apr
 2023 13:30:45 +0100
Date: Fri, 21 Apr 2023 13:30:44 +0100
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "Daniel P. =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>,
 <peter.maydell@linaro.org>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>, Alexandre Iooss
 <erdnaxe@crans.org>, John G Johnson <john.g.johnson@oracle.com>, Jagannathan
 Raman <jag.raman@oracle.com>, Juan Quintela <quintela@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, "Richard Henderson"
 <richard.henderson@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 4/9] docs/cxl: Fix sentence
Message-ID: <20230421133044.000025a4@Huawei.com>
In-Reply-To: <20230420155723.1711048-5-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-5-alex.bennee@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 20 Apr 2023 16:57:18 +0100
Alex Benn=E9e <alex.bennee@linaro.org> wrote:

> From: Stefan Weil via <qemu-devel@nongnu.org>
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Message-Id: <20230409201828.1159568-1-sw@weilnetz.de>
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>

Thomas already sent a pull request with this one in it.
https://lore.kernel.org/qemu-devel/20230420101216.786304-4-thuth@redhat.com/

> ---
>  docs/system/devices/cxl.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/docs/system/devices/cxl.rst b/docs/system/devices/cxl.rst
> index f25783a4ec..4c38223069 100644
> --- a/docs/system/devices/cxl.rst
> +++ b/docs/system/devices/cxl.rst
> @@ -111,7 +111,7 @@ Interfaces provided include:
> =20
>  CXL Root Ports (CXL RP)
>  ~~~~~~~~~~~~~~~~~~~~~~~
> -A CXL Root Port servers te same purpose as a PCIe Root Port.
> +A CXL Root Port serves the same purpose as a PCIe Root Port.
>  There are a number of CXL specific Designated Vendor Specific
>  Extended Capabilities (DVSEC) in PCIe Configuration Space
>  and associated component register access via PCI bars.


