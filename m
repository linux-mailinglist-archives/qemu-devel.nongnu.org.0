Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AA23B8906
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:11:05 +0200 (CEST)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfc0-0001Hq-Jq
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ3-0006s9-Bi
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:64920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ0-0005jJ-Ub
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:00 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6T04005964; Wed, 30 Jun 2021 19:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=wpGji5wSswCG8QBpt9tKWLMkLM4KpmskNQzXsT+yS/bB5+oBlzVowSaQHrEiNEqsULia
 wYT6et+4A0+x+xw8Hxw697cj07zYHBy0CEuQvuDDankniPb3fD6nXVmlZo5Fc8MavOLj
 NXLBvJqFIkKI99BwBMW9Ib5Q2o5cFfTuHFhflYqRvtgkfSkeu3ijLz3n4wfG66GJ2ekB
 aomUGZgulhA9s6oelK37a8egyxz241/duASAyixyAFqMyVgaDr3lWAR/beZr14wtd8E7
 +VwUeo+ZJTujn6IDW7k38FWOGhLXf0DcKZVk7e6wzZTveCLqEOM1L1xR3aSTbYozhYmq ZQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gb2t26wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UIxv97089833;
 Wed, 30 Jun 2021 19:07:54 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by aserp3020.oracle.com with ESMTP id 39dv28kyaq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I3fKz2A9vLQ4i1+d92+l3L5RqqBpPz4ymFWudzA03kfWm09qea0Q4KXF70AHnKkWwwSmIcxffO1p5fnGCMeWGa7bN4B2MEWrBU+PbaxsI4HyBopaYLjLOF7wC45AZLoa2hQ+OTtzw+Agb8QbGZuPpTqejQUoCFbUGzakl8yXAo6w+/Ua/UHzkbbocovPLhAq2O0wScdmI+pUr5j/axPc9BVpy4u1lA4BMJMam7HOfGk/jcpxwoo8tUwzRh+OLe4n+CWo8kWustPXhtoJpJN77AJQkxYP1Lf3Q9xHdTtxayaEX4owex0JS7gyrtGt7XRQldimMByGY1zcT6d2HpXvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=X0de2MXm5d/LO7YANEaznkJuepjYC94Z3WmXFCeOxvX7OuEmxEYJnKm/YNniPow9vNjeH9Iu7igZaM+lkWJkun8TC9jMk1NxwIPJDagsJPt565dKmRfzeiECW0F5/7I5vBD1EjGOES3pHvZkYGIkytPVXvb1Jo03PcWAtzwp5J6vn1pzJGIk8g7f17nkCG8vsTWKoIvLNhN+PDzcKDBsCJhbrGgPRtU+QylYIoe4kRkE7kjRcc2azkY/Fb4sHksMRUMjTPB0GmGGyY8C+8JywnT29oFk6EZNlWawqhVyl6LfhPuHmMjsV/kmbHrGtqm2cKUtVxvw1mOygU8nITQoRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=jGyjK6qbJU6vBibIDnj5YPSwdyePWmTc4h/Y8Gw6lv7DxBzlgp+Lx4AeRJNuQDjglF2UOeN/IO9DLqS6ElIitnWLf/GT8SivvQVdCbkxoVywBBbf7ZAhoRKXCKOB2p08QURTpKJ4olooKrwsg39BFmuKrJvjbPu71BCqMH/0Bl0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 30 Jun
 2021 19:07:53 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:07:53 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Wed, 30 Jun 2021 15:07:12 -0400
Message-Id: <1625080041-29010-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
References: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:07:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8fed60e2-09ef-41a7-3f5a-08d93bfa5c58
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5441486CB584B17DC3430CDF97019@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oz8WjJZrH1e40ucohCmfFnOLeUnRJyjwMFtA2eRh8CQzDc1EeFTCE/Az697PXHuIvVMSjg0ugVPUlsX/qf601KayFDBsVY6nJh5l6JL5UFq4so9l4FTKyjWW9G0aAu9Ac4Ei8OBL8tKDD3G3YyQdPSKFYfBx+jZSp/0ONdJ1eUacgPXTdofdaQZDq+LW7HLb6eVYOhgOyPfXZC7hxtzU1zYPqCd/BkaK3ZhwVaVLlB6Jr7wKNKNAb3mEE3wu4WhMx/ubfUSOFv3D33jM3aXarxB3lwXdGhYMs/5SXXNhKk360NXYd/RsR4C0J+n1YStFrK6rH0LwyAIJU6TGSA5RewDMHcZF7peaVgX3NLK7zlQEEMzYg21WvC3yG8LmxH55nqsgu+HFUZY6qGB1UO3WcxoGQtOds7DTL/5jrngP2YqsQo9SDJ+7rktSubqWwoxfvSlF7ljYiziaJe8QEV1txskSSWUE/tpMWb7adJliuyx9qkBI2nd2CCx0LeMAXwokFbcdTc+Hm3KW1BNQvTrrKSh47ibhwbVKNgOqsCsC6zB3Z5QksDaW8YUVRbH83H0HcTs8FY9DngTX7Q+XCpdRO2e/oZ/15XeYwOqnvImHuT4CBIfK8YzZ1hZ6CTQkFozdYCMg3GiTRElZpJ2uolTV/yOHGd7jZH+uBQ86RL2fRo2eIeO+re+H1pKcYZKMIOEssN9x+TUm9bnFvj1WlVbQVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(8936002)(107886003)(38350700002)(38100700002)(26005)(36756003)(186003)(8676002)(5660300002)(2616005)(956004)(16526019)(4326008)(86362001)(66946007)(7696005)(52116002)(316002)(66556008)(6666004)(66476007)(6916009)(478600001)(2906002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?52N+TTQz1DenpwJxjRorjJfUVb4q0R3O9TYtEXcRhtn0xzRSEsq19aKsnKeS?=
 =?us-ascii?Q?xCa/fUSetgNzd5dumMUNlSgtPYQPVFfw79BS9K1DudJKPog7+9xy8SiMoabp?=
 =?us-ascii?Q?Fr3Mx2iGiq2M0AFvq6xuAwviTsYCd0GhoUqyu8pus9VNNO1ej2HhePNBe0+7?=
 =?us-ascii?Q?EQjfI+WGMi0YxwiTvLd2MqWVI6SjLazq4ZQSdBeqjcunrxz29E7VzoEDLHzh?=
 =?us-ascii?Q?2GmnwoFSW+7Wa4vE+Loccwi0VPWHS/Xy5JGrbQczQjIsvIIVphgd4EVDKh6G?=
 =?us-ascii?Q?hipDozpluH/boMl/lNSwZ4/dnETYGcm2VrZMoeuRExbhQXZzclJefmOuD/Ft?=
 =?us-ascii?Q?bSpokWpvQQPOHUiI1hk+0u+PyZ2VuTt6DIqz2vVN/Vaaq3cf0AoG6gqaacP1?=
 =?us-ascii?Q?v+YuDaBSW+uvJpubRjwNIsS2jr7wN620yqKm+a78WjOZcXzwCopQgFbsSNi7?=
 =?us-ascii?Q?W/1UQFZ43Kr92Bv7bRrq01ixpO6aaAebdmjfXtuGTdejb8FJUUAkIR7FwizA?=
 =?us-ascii?Q?v0A4MW+f3fEUbfzecfHGPXM6E4Gk3DjAt62j6yyu+9uUG25/rUvJQBqiwuqH?=
 =?us-ascii?Q?xo5mabaZkjC91mJfB7FiOkgzj9c8lu9+5yMcZ+B5mUo1xY8DSHOWm93zYmpk?=
 =?us-ascii?Q?qBcOz3yHtk8JV+xhgm/FzjY7zwKYrsb/nsQCV04jfmcf2OLVP4bRPb8/vIJs?=
 =?us-ascii?Q?mINLpMIkJuUtX/WnqCXwfKf75VrMpJYSEOwppxqmyYHcaKLNFqXVHWoISG6V?=
 =?us-ascii?Q?9ey6uvFnwo6dsyThnB7dXEvWhNiDBF8dDpFYGtKblyBeWFKMHos6koeJw0CX?=
 =?us-ascii?Q?znPzs3nDo5WfZBVGZncInxaYSKxUjhoOFZPpfaxtJV8bnIR+FNLLzn55I1vo?=
 =?us-ascii?Q?tioQZZMVYyCWgfFUiWYbwsLLWBTZU9Rly0P1HAyyKvvDh7K/DWl7eX7Q0dEW?=
 =?us-ascii?Q?3/Yogh7/z1w0GUVR2w6Ijb4QLLEbztQJgApIKwivTw4T+nlAxbFxf1a0sYM5?=
 =?us-ascii?Q?BqgMjW8RSIlFG6LkUPAf6XcskrH1xLMLUA+VOTj1qMOtvUx1meSVZbL91uIT?=
 =?us-ascii?Q?bjZM5xhqknF5THLETJeeojlo63MH5n0MAmMWd8qfdgE1+vCBmH37XSRbhbJW?=
 =?us-ascii?Q?12WRg/UFkkr/4I9zBw0YIqEdyq8LyIKs6kzF5kZQiDwShuzfGAUtJXdf+pWw?=
 =?us-ascii?Q?MOnuPfkRiS69bkPRVImaWSxNrpcQ8cqMDkVrMvTbBRSV6b4I/EJiW5qw6FAS?=
 =?us-ascii?Q?YhqYTHUEMAIy9QV9v9SEFxqOLoUuQff+59sJ7VZneUAHqIDEPzjdXeeqVuar?=
 =?us-ascii?Q?W6wrj9x14AUOgdNa7+zvuaDr?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fed60e2-09ef-41a7-3f5a-08d93bfa5c58
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:07:52.8777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eF/PHjKNzt2oFuEItwtKIILZxYrj9zISVceUEbWp+cywBkf5Vm7z1VJ3V6zLVMfCy+ajIdnOjoKjq7/h4YpsEK+8cagmXZJfPykkZ3Oh2zA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300106
X-Proofpoint-GUID: vjlqrhbzZjEUg9CXGoqk1dxhWChqNJ5N
X-Proofpoint-ORIG-GUID: vjlqrhbzZjEUg9CXGoqk1dxhWChqNJ5N
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/ERST                | 0
 tests/data/acpi/pc/ERST                     | 0
 tests/data/acpi/q35/ERST                    | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 4 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST

diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..e004c71 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/ERST",
+"tests/data/acpi/q35/ERST",
+"tests/data/acpi/microvm/ERST",
+
-- 
1.8.3.1


