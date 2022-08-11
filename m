Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426E58FCC0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:48:46 +0200 (CEST)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7cD-0002Um-2i
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HT-0002nT-10; Thu, 11 Aug 2022 08:27:21 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1oM7HQ-0002a0-0s; Thu, 11 Aug 2022 08:27:18 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BCMskl025159;
 Thu, 11 Aug 2022 12:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2022-7-12;
 bh=1KRq+eTXPzCXkuTC27L1hSAgR231etRJ9gqIaA4qzEk=;
 b=1P+MNKOZtfdSr/NqqZrAVx3D5rJG2RuTEccG7FuMI0SZwIfItyskib3KghMttCC6NZD7
 HwKBV9VRbmcJdkPox+L5tUM49j1c19r+r2t2E7s3WkhyURfqs5JzbRg/Vszyi+DVr+KU
 lBIcDX5sEn+IpeojH2RzzXBaeyOmdkhnJPNzjOfPlLfdsemMWguWW5+woLJpaCnoPYYr
 JteiPq06NmDRtARLWsS0gbsn6nlv5yqE6/Awy6f0ex3H2ZPtFspnWNWB8b3rFj+jyHTj
 vCscyQAsSpF1lrvSM+7bz02W4j7TZhR7uamMpgiRfhim+nD/0Aa6QUHKgd6p6Gp1XvJ2 ZQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqdvjvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:56 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B9M8Pb035331; Thu, 11 Aug 2022 12:26:54 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqk2tu2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 12:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j07jImYG8qYPnneIuKzx3FN0MAKTOAe+vAKQ2ZUSLq3M0wFpKMLhvM0znxgo3SPwn8QG2mX9s9NprxVpJG0u0bYIh02872xf42wtYATehHsav9vza9a9+oBAunuhV/ZbCHQ+soK086pg0NT1SzwKPueFRakEbNGTw00K/wP9ESFk3vStFwnS0N+cDDnT0IHkBr7gqdHeS/p1fRFaEKXuJ0PDGP9vtJUPnOTkldQpw/+K8tT3S6ZqUMc57SummId9J68c7ZcSWpi3A0c0QyXi9C8fbbd4O+eQdECE7EftG/skMrUeuWm2zuM9RM4VTy3kdFbQawfJP6CKFejX1op95Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KRq+eTXPzCXkuTC27L1hSAgR231etRJ9gqIaA4qzEk=;
 b=dkS7ZqE7vCyiKMTD+MxLmF279Tyu3IMC+gowGURUrnGckkv3xBnQbQ0hTBsv46hoQEujkwehki2JLR6iWEy6PkAxNOre7PI+vT6Zeyy+o4BpqdWf+OgrlUjZvFo/alU6cFxN+f1ht3NSxQBBmxwZ9VG+5YElSVXMEG816Vo/JsfVNWbIyopK2iOo10nEY6AdrnHXcrk6OH5dWwoNeeGRlqG1eABfT7pfErl11XSYAAq9/8drpPopPUvY78H9dNGvUAz4Nk5e4mhSn/guPdlslticV5+XyobsuHb9ru8Ddfe1y9neKeH+4LIbviSu9/pB2gqDuzgUQgKLUgPxcSL8DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KRq+eTXPzCXkuTC27L1hSAgR231etRJ9gqIaA4qzEk=;
 b=p8TQNHol3jU5+4MzVV3u6sWYn3M/1mw6vJoQzX+pWrzqRIHgWDzWQelEMle7bC0SnhuKKwFgfSfhr834oqslPua+jjFHsQIAPc62ADZZhnqVk54bq4MZ9wfzEacUuHyRpS0Pg8ewcTomfFk/yBeyl3fTvOxSdFlLjJ+nbBd2caQ=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by DM5PR10MB1770.namprd10.prod.outlook.com (2603:10b6:4:c::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.15; Thu, 11 Aug 2022 12:26:50 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::a9e2:3c71:4b09:789%9]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 12:26:50 +0000
From: Jonah Palmer <jonah.palmer@oracle.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com,
 lvivier@redhat.com, thuth@redhat.com, michael.roth@amd.com,
 groug@kaod.org, dgilbert@redhat.com, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Subject: [PATCH v15 5/6] qmp: add QMP command x-query-virtio-queue-element
Date: Thu, 11 Aug 2022 08:24:43 -0400
Message-Id: <1660220684-24909-6-git-send-email-jonah.palmer@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DM6PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:333::10) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d0c5a14-a150-41c1-0a6b-08da7b94c43c
X-MS-TrafficTypeDiagnostic: DM5PR10MB1770:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 80A0pOjcEm5n0p5o5RIGYM/4Dw+V72Sq/kIZmuGgMKTDL6YyDfjnytBBlkTxxflL+evLKpBJeHToRzYWZT+FzFR7qpauJhwdncNXsWQUkfryRa12Gcj5ytNiZ+r4y/ohtvTvvpdmMzF9D+fagz+fVsvB6pUlwrur7Wkt6ZKrUAKzm+3hwTi3YE4hkyArQbm44Hh6KH4+cNOSezmyf9ay+YyLe6m6vMiAtPHHS0Khw3ymBJGFHBCSKQlpbDvVw8gUpE/6D9IYmwQRh38dTokmIQAga4WTHMccRLx+5MGz+/R66G6TcpbpNhjJXUiNX7oPyiV7wTUNm3oqmkk3sU0wcJTbqj/DnScetPpakWPnensxUbVas8RxeI/hZpjtxUUqzu5/iBQvon/SXIqUnEYV6z59sr7Q+XbwTTnMi/KFS39eWU43iv5ObUFD9wJUfC3hBArI0tYIwM8JKTvgTJSXYOyALPlAX0RDx1wz6aOatBGvnPp0gv8xgTGxnhUUzP2hBd8zs4iNDqgt1ZnMnLYB9pUBLv1Z89WS0kUZ60UJJmo0TgcB98p8aDEvL6B+ihyq3ttp0ON9fQwWyCDsRgYr5B+OLfBwByo8P23Ao6npPJrEJSd3TblYs2LNbWEjTWYn7kdYpIsuMkEhbUQwLPG1Fy634HHVfUWWqdTxbnVZQ7AKaSY1dN5Lqy12JBYrESxn/sxD2AR791dKAu4WeoAd8Rcm6FQCVz2O8Tdd7wa+finmtlOBHIkOvOoYLWm5RGmiUXMYIH8opw+btmVuyaWrLoVUS+2zoBtb6xKSEOFf/K0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(346002)(136003)(366004)(396003)(39860400002)(6916009)(8936002)(2906002)(186003)(7416002)(44832011)(316002)(66556008)(8676002)(4326008)(2616005)(66476007)(5660300002)(66946007)(478600001)(38100700002)(6486002)(6666004)(38350700002)(36756003)(41300700001)(26005)(6512007)(86362001)(6506007)(52116002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6UGsfL3WkZ5KW+5nE36hEUbEF+ZY2TFPZBZBHs8EpQSMvzydffLNmAbwdsmg?=
 =?us-ascii?Q?W6iSXntvN6O1AzEqByAas314t8Qsl4E9YJTdiwkZ9wSRPsxZNSg0L6ZxWMvS?=
 =?us-ascii?Q?6oN7GxTQlUXn/7BYHsXPTFdyDzGG2wqKpl9d39tu74ccI0KhMs0KPUt0fE2z?=
 =?us-ascii?Q?vZa8AgldWKoQk3XsfGy/jFGDcD/Wqsq0H9uiSM9MeOk2LMIQuH0v1hyeYVal?=
 =?us-ascii?Q?pBj9bKIQt+EBZ9B9+iVLQZo7sbhIa7WL3cgNF7sSe1iIvBPM7oF9t8sf+goO?=
 =?us-ascii?Q?5y6grG+YzDebEbyc4om9e3J2nhI1gPQZwItPd1kU5oOCus2Jhv6NtwcNbqHG?=
 =?us-ascii?Q?0Xg+mQUbEAPsTo8Ps7DPHgLKL68nKcidACOkeNTNDtTVpioOrmbzuBMVlq/z?=
 =?us-ascii?Q?I1RJUIZXUrQ+44LiFe9acsfAVF6FlpikW9ZBmtvlBrxcdGdyW4hvUhFa2Apa?=
 =?us-ascii?Q?pk1qbXEYR+T+dshpIxlVVNhy5fiPeAyr5H0KwfMxLH/To237mJpP7YpJ+NIR?=
 =?us-ascii?Q?wGIEzBt/zJMIxQc0aqyg224B1c+AEoApSGn+IaJJQ76QgYhYxJk8gq3SPQh/?=
 =?us-ascii?Q?PWkhFidtiYBGputUhY/GBd63AT2Qk/z2fJJmqgj8WWlryV/UPsJ1FIoas/PX?=
 =?us-ascii?Q?eFU6dM+8TJ3L9ynS9KyCJfA4lUgiWc29G3KDZpbtBL8PHVbWcvoWUzfOGKHb?=
 =?us-ascii?Q?2xwmOZdp9DEyEQrb/Csnew1SJOqUQgKm044VIfFf9Z9yVYy3rX3RF/0BsoA9?=
 =?us-ascii?Q?DxWSWgLuufMISfNmOhFja6WOuFwaVSDq4DWKIzLM1eoeyswA0uuu5CSv7nbw?=
 =?us-ascii?Q?KTz9DxXWATTMKnoh31RAEbY8TA+4fwmM/lCV1U9Y7rZSsA11PTMlv5dUzL0U?=
 =?us-ascii?Q?2wxsAa/0zWvyuECVs651G4meELOLg8kKhAmzMtrwLPbpoziK6Sn0Tmbpfyd6?=
 =?us-ascii?Q?8+Fl14YQq4/HBVWR0htFZE4Cyg+69vJuG3F9bwYslf9TRhK1KmwU5yCNmxb3?=
 =?us-ascii?Q?g1Paq6JB8KxmlIA2LoWF4H0Uc+fst9qRDSFU/+CebT33YrLGetY1JrmFr2Z5?=
 =?us-ascii?Q?VCKtPgUO3UpBskU443YKsoQwu0h9x0jDCSZWuEETOBqBW+1bQvODJxbkdQUT?=
 =?us-ascii?Q?DRdwePTITKhd8Uc9Hzmu7BoC89KHyMWm/k9yTKP5w2fnTeQ1YqzWn+COIgU8?=
 =?us-ascii?Q?WeXKBdOsotjMepgL4afUdV0NzT4PI9lINcxrgHLTvaxcWV7biBxwhJpKhycb?=
 =?us-ascii?Q?Z6Q5dk727X+fj44AFqEMcRbTNHj3GoUYAPZBXcjaBmkULkz0lwWrhhZ+Tc31?=
 =?us-ascii?Q?5pDdSzm+CJ3kmE3g84VVkj2JgQqO/k9XUJXc9MVL0E3OBa5OWbPK3QRyxAjK?=
 =?us-ascii?Q?6rC9eaGrS80fBoJNU3e+jcNskR8eXWXLsth0qtzdHwSd81Yg2Oix39x3f8/6?=
 =?us-ascii?Q?Yc57p2eaADExdkgfKpbAILsOo/NbbpUa7b4XBjkjIUSWl78N0EyBNQ5qlTFA?=
 =?us-ascii?Q?yA2rm9R29i1tGZ4vDY0yDHXXEJtCWzgDp79ESGJVqWgo3F2LFvsL/zW1cFha?=
 =?us-ascii?Q?sq/qh7cCJ/6XQ9IBUWhuRdbJAcMdAzVETaVEHl0R?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0c5a14-a150-41c1-0a6b-08da7b94c43c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 12:26:50.6335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Elmdstt4kHRrUhOL5WEOuj9+5qenGB+jvZYJFBGssuyEmvJ2mgvzwSmWGd3+DJmfDYDT1z1XfIXfIK9bGGZX+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1770
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110038
X-Proofpoint-GUID: ykVq124CrZea9Tzzjbs8WZ_tVU53hAsV
X-Proofpoint-ORIG-GUID: ykVq124CrZea9Tzzjbs8WZ_tVU53hAsV
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Laurent Vivier <lvivier@redhat.com>

This new command shows the information of a VirtQueue element.

[Note: Up until v10 of this patch series, virtio.json had many (15+)
 enums defined (e.g. decoded device features, statuses, etc.). In v10
 most of these enums were removed and replaced with string literals.
 By doing this we get (1) simpler schema, (2) smaller generated code,
 and (3) less maintenance burden for when new things are added (e.g.
 devices, device features, etc.).]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
---
 hw/virtio/virtio-stub.c |   9 ++
 hw/virtio/virtio.c      | 154 +++++++++++++++++++++++++++++++
 qapi/virtio.json        | 197 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 360 insertions(+)

diff --git a/hw/virtio/virtio-stub.c b/hw/virtio/virtio-stub.c
index 13e5f93652..7ddb22cc5e 100644
--- a/hw/virtio/virtio-stub.c
+++ b/hw/virtio/virtio-stub.c
@@ -31,3 +31,12 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
 {
     return qmp_virtio_unsupported(errp);
 }
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    return qmp_virtio_unsupported(errp);
+}
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index dc73b82b38..c6e244a3c9 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -823,6 +823,19 @@ static inline void vring_used_write(VirtQueue *vq, VRingUsedElem *uelem,
     address_space_cache_invalidate(&caches->used, pa, sizeof(VRingUsedElem));
 }
 
+/* Called within rcu_read_lock(). */
+static inline uint16_t vring_used_flags(VirtQueue *vq)
+{
+    VRingMemoryRegionCaches *caches = vring_get_region_caches(vq);
+    hwaddr pa = offsetof(VRingUsed, flags);
+
+    if (!caches) {
+        return 0;
+    }
+
+    return virtio_lduw_phys_cached(vq->vdev, &caches->used, pa);
+}
+
 /* Called within rcu_read_lock().  */
 static uint16_t vring_used_idx(VirtQueue *vq)
 {
@@ -4773,6 +4786,147 @@ VirtQueueStatus *qmp_x_query_virtio_queue_status(const char *path,
     return status;
 }
 
+static strList *qmp_decode_vring_desc_flags(uint16_t flags)
+{
+    strList *list = NULL;
+    strList *node;
+    int i;
+
+    struct {
+        uint16_t flag;
+        const char *value;
+    } map[] = {
+        { VRING_DESC_F_NEXT, "next" },
+        { VRING_DESC_F_WRITE, "write" },
+        { VRING_DESC_F_INDIRECT, "indirect" },
+        { 1 << VRING_PACKED_DESC_F_AVAIL, "avail" },
+        { 1 << VRING_PACKED_DESC_F_USED, "used" },
+        { 0, "" }
+    };
+
+    for (i = 0; map[i].flag; i++) {
+        if ((map[i].flag & flags) == 0) {
+            continue;
+        }
+        node = g_malloc0(sizeof(strList));
+        node->value = g_strdup(map[i].value);
+        node->next = list;
+        list = node;
+    }
+
+    return list;
+}
+
+VirtioQueueElement *qmp_x_query_virtio_queue_element(const char *path,
+                                                     uint16_t queue,
+                                                     bool has_index,
+                                                     uint16_t index,
+                                                     Error **errp)
+{
+    VirtIODevice *vdev;
+    VirtQueue *vq;
+    VirtioQueueElement *element = NULL;
+
+    vdev = virtio_device_find(path);
+    if (vdev == NULL) {
+        error_setg(errp, "Path %s is not a VirtIO device", path);
+        return NULL;
+    }
+
+    if (queue >= VIRTIO_QUEUE_MAX || !virtio_queue_get_num(vdev, queue)) {
+        error_setg(errp, "Invalid virtqueue number %d", queue);
+        return NULL;
+    }
+    vq = &vdev->vq[queue];
+
+    if (virtio_vdev_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
+        error_setg(errp, "Packed ring not supported");
+        return NULL;
+    } else {
+        unsigned int head, i, max;
+        VRingMemoryRegionCaches *caches;
+        MemoryRegionCache indirect_desc_cache = MEMORY_REGION_CACHE_INVALID;
+        MemoryRegionCache *desc_cache;
+        VRingDesc desc;
+        VirtioRingDescList *list = NULL;
+        VirtioRingDescList *node;
+        int rc; int ndescs;
+
+        RCU_READ_LOCK_GUARD();
+
+        max = vq->vring.num;
+
+        if (!has_index) {
+            head = vring_avail_ring(vq, vq->last_avail_idx % vq->vring.num);
+        } else {
+            head = vring_avail_ring(vq, index % vq->vring.num);
+        }
+        i = head;
+
+        caches = vring_get_region_caches(vq);
+        if (!caches) {
+            error_setg(errp, "Region caches not initialized");
+            return NULL;
+        }
+        if (caches->desc.len < max * sizeof(VRingDesc)) {
+            error_setg(errp, "Cannot map descriptor ring");
+            return NULL;
+        }
+
+        desc_cache = &caches->desc;
+        vring_split_desc_read(vdev, &desc, desc_cache, i);
+        if (desc.flags & VRING_DESC_F_INDIRECT) {
+            int64_t len;
+            len = address_space_cache_init(&indirect_desc_cache, vdev->dma_as,
+                                           desc.addr, desc.len, false);
+            desc_cache = &indirect_desc_cache;
+            if (len < desc.len) {
+                error_setg(errp, "Cannot map indirect buffer");
+                goto done;
+            }
+
+            max = desc.len / sizeof(VRingDesc);
+            i = 0;
+            vring_split_desc_read(vdev, &desc, desc_cache, i);
+        }
+
+        element = g_new0(VirtioQueueElement, 1);
+        element->avail = g_new0(VirtioRingAvail, 1);
+        element->used = g_new0(VirtioRingUsed, 1);
+        element->name = g_strdup(vdev->name);
+        element->index = head;
+        element->avail->flags = vring_avail_flags(vq);
+        element->avail->idx = vring_avail_idx(vq);
+        element->avail->ring = head;
+        element->used->flags = vring_used_flags(vq);
+        element->used->idx = vring_used_idx(vq);
+        ndescs = 0;
+
+        do {
+            /* A buggy driver may produce an infinite loop */
+            if (ndescs >= max) {
+                break;
+            }
+            node = g_new0(VirtioRingDescList, 1);
+            node->value = g_new0(VirtioRingDesc, 1);
+            node->value->addr = desc.addr;
+            node->value->len = desc.len;
+            node->value->flags = qmp_decode_vring_desc_flags(desc.flags);
+            node->next = list;
+            list = node;
+
+            ndescs++;
+            rc = virtqueue_split_read_next_desc(vdev, &desc, desc_cache,
+                                                max, &i);
+        } while (rc == VIRTQUEUE_READ_DESC_MORE);
+        element->descs = list;
+done:
+        address_space_cache_destroy(&indirect_desc_cache);
+    }
+
+    return element;
+}
+
 static const TypeInfo virtio_device_info = {
     .name = TYPE_VIRTIO_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/qapi/virtio.json b/qapi/virtio.json
index d9050f3584..e47a8fb2e0 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -755,3 +755,200 @@
   'data': { 'path': 'str', 'queue': 'uint16' },
   'returns': 'VirtVhostQueueStatus',
   'features': [ 'unstable' ] }
+
+##
+# @VirtioRingDesc:
+#
+# Information regarding the vring descriptor area
+#
+# @addr: Guest physical address of the descriptor area
+#
+# @len: Length of the descriptor area
+#
+# @flags: List of descriptor flags
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioRingDesc',
+  'data': { 'addr': 'uint64',
+            'len': 'uint32',
+            'flags': [ 'str' ] } }
+
+##
+# @VirtioRingAvail:
+#
+# Information regarding the avail vring (a.k.a. driver area)
+#
+# @flags: VRingAvail flags
+#
+# @idx: VRingAvail index
+#
+# @ring: VRingAvail ring[] entry at provided index
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioRingAvail',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16',
+            'ring': 'uint16' } }
+
+##
+# @VirtioRingUsed:
+#
+# Information regarding the used vring (a.k.a. device area)
+#
+# @flags: VRingUsed flags
+#
+# @idx: VRingUsed index
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioRingUsed',
+  'data': { 'flags': 'uint16',
+            'idx': 'uint16' } }
+
+##
+# @VirtioQueueElement:
+#
+# Information regarding a VirtQueue's VirtQueueElement including
+# descriptor, driver, and device areas
+#
+# @name: Name of the VirtIODevice that uses this VirtQueue
+#
+# @index: Index of the element in the queue
+#
+# @descs: List of descriptors (VirtioRingDesc)
+#
+# @avail: VRingAvail info
+#
+# @used: VRingUsed info
+#
+# Since: 7.1
+#
+##
+
+{ 'struct': 'VirtioQueueElement',
+  'data': { 'name': 'str',
+            'index': 'uint32',
+            'descs': [ 'VirtioRingDesc' ],
+            'avail': 'VirtioRingAvail',
+            'used': 'VirtioRingUsed' } }
+
+##
+# @x-query-virtio-queue-element:
+#
+# Return the information about a VirtQueue's VirtQueueElement
+#
+# @path: VirtIODevice canonical QOM path
+#
+# @queue: VirtQueue index to examine
+#
+# @index: Index of the element in the queue
+#         (default: head of the queue)
+#
+# Features:
+# @unstable: This command is meant for debugging.
+#
+# Returns: VirtioQueueElement information
+#
+# Since: 7.1
+#
+# Examples:
+#
+# 1. Introspect on virtio-net's VirtQueue 0 at index 5
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
+#                     "queue": 0,
+#                     "index": 5 }
+#    }
+# <- { "return": {
+#          "index": 5,
+#          "name": "virtio-net",
+#          "descs": [
+#              {
+#                  "flags": ["write"],
+#                  "len": 1536,
+#                  "addr": 5257305600
+#              }
+#          ],
+#          "avail": {
+#              "idx": 256,
+#              "flags": 0,
+#              "ring": 5
+#          },
+#          "used": {
+#              "idx": 13,
+#              "flags": 0
+#          }
+#      }
+#    }
+#
+# 2. Introspect on virtio-crypto's VirtQueue 1 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral/crypto0/virtio-backend",
+#                     "queue": 1 }
+#    }
+# <- { "return": {
+#          "index": 0,
+#          "name": "virtio-crypto",
+#          "descs": [
+#              {
+#                  "flags": [],
+#                  "len": 0,
+#                  "addr": 8080268923184214134
+#              }
+#          ],
+#          "avail": {
+#              "idx": 280,
+#              "flags": 0,
+#              "ring": 0
+#          },
+#          "used": {
+#              "idx": 280,
+#              "flags": 0
+#          }
+#      }
+#    }
+#
+# 3. Introspect on virtio-scsi's VirtQueue 2 at head
+#
+# -> { "execute": "x-query-virtio-queue-element",
+#      "arguments": { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
+#                     "queue": 2 }
+#    }
+# <- { "return": {
+#          "index": 19,
+#          "name": "virtio-scsi",
+#          "descs": [
+#              {
+#                  "flags": ["used", "indirect", "write"],
+#                  "len": 4099327944,
+#                  "addr": 12055409292258155293
+#              }
+#          ],
+#          "avail": {
+#              "idx": 1147,
+#              "flags": 0,
+#              "ring": 19
+#          },
+#          "used": {
+#              "idx": 280,
+#              "flags": 0
+#          }
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-query-virtio-queue-element',
+  'data': { 'path': 'str', 'queue': 'uint16', '*index': 'uint16' },
+  'returns': 'VirtioQueueElement',
+  'features': [ 'unstable' ] }
-- 
2.31.1


