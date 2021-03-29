Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BFF34DEF4
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 05:06:42 +0200 (CEST)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR4iH-0003mJ-5l
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 23:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lR4gR-0002h3-83
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 23:04:47 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:51025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lR4gO-0002h3-2G
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 23:04:47 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210330030438epoutp02b8c7db7a3d9689590feb8076ba208ad9~w-8LW9HDy3159831598epoutp02f
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 03:04:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210330030438epoutp02b8c7db7a3d9689590feb8076ba208ad9~w-8LW9HDy3159831598epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617073478;
 bh=hIA8vV7G3YKQcmOSiXqkdogXBPBC5yt9M8gk1NPJjqQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jLPg61F4wb8C3iEwXY1Ax1boQUVTmSyRmhxSVGM6i2R8H+2N1hFHHxKPLnLrq3h7Q
 RNWa2PQ8322+cMKffW15ADDaq49E9HBKyyEIAdYk5FrJVHykx1kkIxmI0zwFWx4aFi
 KT/c8PImUSFyOdCwDd4yoAUjHSH7O2YSngUrjbzU=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210330030437epcas5p3741748d0b7cc49b004e09dfea5dd8951~w-8Kwnnj00537005370epcas5p3O;
 Tue, 30 Mar 2021 03:04:37 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 25.1D.41008.54592606; Tue, 30 Mar 2021 12:04:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210329144714epcas5p4adab8d7549b97fcf3b838f18ab9e070a~w14V2fX9V2839628396epcas5p4O;
 Mon, 29 Mar 2021 14:47:14 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210329144714epsmtrp24cbc9105d1997a8ee144ef7616b12799~w14V1q8Yv1780317803epsmtrp28;
 Mon, 29 Mar 2021 14:47:14 +0000 (GMT)
X-AuditID: b6c32a4b-661ff7000001a030-1d-60629545fea4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 19.0E.08745.278E1606; Mon, 29 Mar 2021 23:47:14 +0900 (KST)
Received: from 2030045822 (unknown [107.108.221.178]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210329144713epsmtip1f4eb5d18aba6823bfd771fca2adce5c9~w14UjLvM22464724647epsmtip1w;
 Mon, 29 Mar 2021 14:47:12 +0000 (GMT)
Date: Mon, 29 Mar 2021 20:14:06 +0530
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH for-6.0 2/7] hw/block/nvme: fix missing string
 representation for ns attachment
Message-ID: <20210329144406.GB23272@2030045822>
MIME-Version: 1.0
In-Reply-To: <20210324200907.408996-3-its@irrelevant.dk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7bCmpq7r1KQEg0un9C2u7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV0b3qqiCHu6K3h2eDYyLObsYOTgkBEwk
 fr3W7WLk4hAS2M0oMWlXL3MXIyeQ84lR4sqKLIjEZ0aJtVu+s4EkQBp+tF9khUjsYpT42PqM
 BcJ5xSjx4+0CZpCxLAKqEn2NhSANbAJGErPfvmEEsUUEVCSe/tsLVs8s8JdR4vuu3WBThQVS
 JY48nc0OYvMK6Es0NLVD2YISJ2c+YQGxOQUsJNaebQKrFxVQljiw7TgTyCAJgYkcEv0bbzBD
 nOci0XnvKCOELSzx6vgWdghbSuLzu71AzexAdrXE4SKI1g5GiWOXN0B9Zi/x79k0sFZmgQyJ
 BVO+Q42RlZh6ah0TRJxPovf3EyaIOK/EjnkwtprEglvfoVbJSMz8c5sVwvaQmDvpCjskgHYy
 SsyavYRlAqP8LCS/zUKyD8K2kuj80MQ6CxiOzALSEsv/cUCYmhLrd+kvYGRdxSiZWlCcm55a
 bFpgnJdarlecmFtcmpeul5yfu4kRnJ60vHcwPnrwQe8QIxMH4yFGCQ5mJRFe4QOJCUK8KYmV
 ValF+fFFpTmpxYcYpTlYlMR5dxg8iBcSSE8sSc1OTS1ILYLJMnFwSjUwHTU+XZhb9sFB/9Wr
 WVLs03V9d9u4dzzWDo7f1OXpsPqgwK7tN1K6vnO1fJUu2sXUsKbb5w6/3xmVklgx2fPl2bzv
 3rAWbJzuP+dA7IzpMa+1lk/ZbZe0t06Va3Mut7m1+JL/rTn877xnWOz/I2atePe9+dqN7yP+
 n7tzu4zvvtPxRQq/3ii6zku1cpthUSZz0Cl3jdzkm0tOPN7X+s5GaOH8T5YOD4PnfOCbOiNu
 eRenoYh5/2WTmBTj3vye7yHii4K+bclYOUNUurrHN4u993vYsuyXn6wjf+Y96+rV8K5/9u5u
 uujDb5Lnsw89dGi0mvUlLXDag/X3Hp/qDWNltpt26prP5Z7gVp52Ldt/SizFGYmGWsxFxYkA
 GxHK2r4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnG7Ri8QEg11PRS2u7D/PaLH/4DdW
 i5ONe1gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bkS9PYC/ZxVNzft4mxgfE9WxcjJ4eE
 gInEj/aLrF2MXBxCAjsYJXZeX8YIkZCR+HVqKjOELSyx8t9zdoiiF4wSX3a3AiU4OFgEVCX6
 GgtBatgEjCRmv30D1isioCLx9N9eFpB6ZoH/jBKPdh8BGyQskCpx5OlsdhCbV0BfoqGpnR1k
 jhBQ/PlcV4iwoMTJmU9YQGxmATOJeZsfgq1iFpCWWP6PAyTMKWAhsfZsE9j9ogLKEge2HWea
 wCg4C0n3LCTdsxC6FzAyr2KUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4OLa0djHtW
 fdA7xMjEwXiIUYKDWUmEV/hAYoIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1Kz
 U1MLUotgskwcnFINTP6eLA310h+fLX/OU2aqbhx0M05NYneh2FQ2NZ8FjN/Esg7a3dqo/MR4
 j++NAH12IS6lScniHE/3vU5T+PDouBEHQ/3nC1w6j7fbzQ6brlMjomrrbvRsHdv5DsXelYtU
 cvlvLimYrhMuIfWgULVlrwsrR/oR9/Cc/l8Bi+/sfmCn9trG80VXvfDd+QzL3ObLOIhrlV08
 831lx3TTotC5j9t+zPepqrjIU/9jFVtes/q/+PxVxn4LldLKY290n2Xa0+fTE8z6V8TvvEtI
 wQ65jSncAaGrEpas053FoXJPKDMq4PUaxTTTf47f1mx0U/6z6alb4jzfU+tq1CO+sfkvcw78
 tWznlGl68v/4N01QYinOSDTUYi4qTgQAIh7viv0CAAA=
X-CMS-MailID: 20210329144714epcas5p4adab8d7549b97fcf3b838f18ab9e070a
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_14575_"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210329144714epcas5p4adab8d7549b97fcf3b838f18ab9e070a
References: <20210324200907.408996-1-its@irrelevant.dk>
 <20210324200907.408996-3-its@irrelevant.dk>
 <CGME20210329144714epcas5p4adab8d7549b97fcf3b838f18ab9e070a@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_14575_
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Disposition: inline

On Wed, Mar 24, 2021 at 09:09:02PM +0100, Klaus Jensen wrote:
>From: Klaus Jensen <k.jensen@samsung.com>
>
>Add the missing nvme_adm_opc_str entry for the Namespace Attachment
>command.
>
>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>---
> hw/block/nvme.h | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/hw/block/nvme.h b/hw/block/nvme.h
>index 5b0031b11db2..9edc86d79e98 100644
>--- a/hw/block/nvme.h
>+++ b/hw/block/nvme.h
>@@ -86,6 +86,7 @@ static inline const char *nvme_adm_opc_str(uint8_t opc)
>     case NVME_ADM_CMD_SET_FEATURES:     return "NVME_ADM_CMD_SET_FEATURES";
>     case NVME_ADM_CMD_GET_FEATURES:     return "NVME_ADM_CMD_GET_FEATURES";
>     case NVME_ADM_CMD_ASYNC_EV_REQ:     return "NVME_ADM_CMD_ASYNC_EV_REQ";
>+    case NVME_ADM_CMD_NS_ATTACHMENT:    return "NVME_ADM_CMD_NS_ATTACHMENT";
>     case NVME_ADM_CMD_FORMAT_NVM:       return "NVME_ADM_CMD_FORMAT_NVM";
>     default:                            return "NVME_ADM_CMD_UNKNOWN";
>     }
>--
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>2.31.0
>
>

------9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_14575_
Content-Type: text/plain; charset="utf-8"


------9CMuN9iDGEr79_UZ9KBz13DO6G9EfLQokAV6LaKoO8yZ8pVk=_14575_--

