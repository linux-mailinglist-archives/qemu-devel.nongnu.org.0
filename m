Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E619B6CC748
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 18:00:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phBjj-0004is-Nb; Tue, 28 Mar 2023 11:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phBjh-0004ht-Ae; Tue, 28 Mar 2023 11:59:49 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phBjf-0003Kl-Lf; Tue, 28 Mar 2023 11:59:49 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SFxXbY006553; Tue, 28 Mar 2023 15:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=corp-2022-7-12;
 bh=veIQtdOaHS8IBCSNljGxdtwg9VF7GwcX6aEOCfPovl8=;
 b=NCMJijJVo2kRYLl1khVRmri0ZWhSXuXhL7jUrrz/RPr9eCXfMd1rQCy/+TriPEDYOYO3
 ch6gxhCy+eGvx4k2oG0kmNPoezEwwvySIgT7Dw9uaQNZszpWtlrZ8WOcQsKe7mVUYp8d
 D7IkVEFkfspdX+mF0Zw7+SM2LXopg/2IkM118FpjT7N4eS7SczoFIj7j13BhHxIIlf95
 9CWQ31bQSuFqn9pULdxRRgN5IewavLgPfoIg5lso6k690iOOPYJC8axreewu/5cgPphg
 PPCdxl99BKAKh5oPl9r9F/mLpUXoobecZrG2bU/xMg/VO3U4+TOzthmdhICHwJr56Qd3 4g== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pm3byg012-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 15:59:41 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32SEtMii027837; Tue, 28 Mar 2023 15:59:40 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqd6kj1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Mar 2023 15:59:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTg/UACdVznyugIWDgca3/7Fr3B5WleMKL9plxRCcPYN0w9Uql2rgWzJWxyRZsKB4uvwwo0et10e0WIzF63mlpmN1x1h+afgJOXZMnw3YT08ioFoiDy3evC5L8YN//1SY0BxOofplf/+EZ4Pr89DAShzwZhdhAuV10H3KgWE37sPI7l68vowFIyXoHu3LA35IHs6eb5r0sCPXfX1ThDDpDBDrz/SGGdNuylIjaoMJB3AA20/L801VdsxFt8dxc245JDnBWvJjK+b/jJZyiDBGJz9jdo2qs27240Eotv2KV6WabJZyOpdSSBbVKjapf+ixa8RjjIGXIquZ2SG7OBAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veIQtdOaHS8IBCSNljGxdtwg9VF7GwcX6aEOCfPovl8=;
 b=cbhg3BqsII+md3sdSzZUlr5iVNqRZgX1rLpiR4NqbU9nYekS6EN1arbIjzqcuOdlFE7CMof2b1UzCrg0jx/QvFNv+P/3djTOarFlg+qVZKzJbzio7H1xK7IAc3wammHVJ25DSaykj9BnYUQJ4KbxNIGEi7NN9HSgU1tFbXdC9PKNd5/j1uN2Z043vAeICx9dJNuJNfsIGlaTg+9gOEh4VsCvYPdGzsr7GmZ4cWXpIEOyei2uNrBpv//GtS4m+VPE+fKgl+Ug5UIm6m7oTME/GwSurWxEFqT9K606wAoH79+YnK0iuKLk0Hp8fUvCNukOLcuuRYWUgqOsSg2VjofC1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veIQtdOaHS8IBCSNljGxdtwg9VF7GwcX6aEOCfPovl8=;
 b=UZKYl/5tgJ3YbszUcrNClD56ZtKHay84EYmuPzX/A4AfFx2vRlfaeivf/SnJdFTlWpbAyrIz/Ubuj3tmCM1mj85uWGlRZJr4ffmfuHqiCX97gyyqolseUJq4W9rI2B7hpyCx9ABuLn5MxmdjseZqq9/tlXVAQf0Cjq1V+Wdalco=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB4985.namprd10.prod.outlook.com (2603:10b6:610:de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 15:59:38 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6222.033; Tue, 28 Mar 2023
 15:59:37 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net
Cc: boris.ostrovsky@oracle.com, eric.devolder@oracle.com
Subject: [PATCH 1/2] hw/acpi: arm: bump MADT to revision 5
Date: Tue, 28 Mar 2023 11:59:25 -0400
Message-Id: <20230328155926.2277-2-eric.devolder@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328155926.2277-1-eric.devolder@oracle.com>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0160.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::6) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB4985:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf0d5e0-1f8f-41e9-1a88-08db2fa56e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cqt7cPH9z9ZvxN+5r1rxMI1R/Aj1qFwJLGIhzrC42ET4uOXLe1xhZMCPt6gLP0t+NCNOg23VII2260R2mTP9q4hig1LAmtAHzXULuo/lypo2mLsz3pmkipnWq5D9+3cH0bQLzt3/Myx9YniZoVixhOTJqyFSLGnj7Ts51KrCJAPgBfz5Uj0ka4ISeY5RLcS9EVZ706e6pCutf9CK2B/H+E9obJWEwKdOQjI5+mO6CBWggbZeHhp5xUFr3dsBqyfNaYP9AlEAMOkFz5W+FoDMrkKVvgKOA6Nmaola/ejBjTO/kBrHGspcRhZ4tLfTb1CSwat5Zpk5/qVXzJQVjEwst+Qb+GJQG5FZ9dCuZQQhn4035XcdWMSNI7p+WMpwRrPIQG7T4ZtQGSKRwV7gdr5ilD3YqR8291LiYRJWRqwFFGU9kTostJ6GVwWcSXBEjsJiGanSdrOD3/XloF43cWDI2nINr4mmxYdKzOoBVzuiuwUfKKfSIYMnlpAJNtPHfEdkKPmXR9Mh6IsELTTa4HIosU6Xs2vG3xSIFApLjkGtcXpB1FhJPykfSF7PI9yifkZhvr7adJQ3+SZpUmHuEu97l4jvQntP1vV+JCFFvxN35i8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199021)(6486002)(2616005)(478600001)(6666004)(107886003)(8936002)(1076003)(6512007)(6506007)(26005)(316002)(66476007)(66946007)(8676002)(66556008)(186003)(4326008)(41300700001)(921005)(7416002)(2906002)(36756003)(5660300002)(38100700002)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IIkyahOa2CYjJfMUs1yOPH1YhMhgjmFTM8zDTclEPsvZC/1NcwhRhAo2BVEB?=
 =?us-ascii?Q?NaGQV4iLwRhzWJM07s6KzSWitR4TYLxiHtmjUWlGSUa1udlU3FKw5TREmuey?=
 =?us-ascii?Q?tGGrNvpRpCGJPACz8wU/fVJLuNHCD4rvUWlCPG7iw/74SEModESsr1M/oXrR?=
 =?us-ascii?Q?6vvcxMV6m0BIgZqr6HUa/2i1YDuqCqWx+jz2suzWJ/ss9Xa4vpJrFgAfbhjl?=
 =?us-ascii?Q?s3qHVpViXXiN5FXvhl9jQtJvmNjzHQMEep/3VX6N5e7RpzRYdV9ceS82zXrm?=
 =?us-ascii?Q?49qTQxUtrdCwBhLTx3FN8aUyeOEyUDcoU4FNoEibXsSKthh1gMlreKIDXie+?=
 =?us-ascii?Q?PuYjvjoA0+4O8Ta/l/TFu1wX1wGZIk+3p9/MVN5MU4hGaDXPK53xZTf0J+Bn?=
 =?us-ascii?Q?dCvyMW64WPTIahnzEQxHFRS7pJc9eju3lpYnmkNL7J+PDVlZ+IpeT9tH8iy3?=
 =?us-ascii?Q?QGmBk7ZrqYysBnFb3MpI/3LYHVgVx9jJDZTsXxEsAXUfNIF7UZP+rIkjOB70?=
 =?us-ascii?Q?e34Ug7cOKeVtGvnnNq3P10ugYr7cKuQUAYb9IeWo9DcR4zo8Wf6kZoOdiAwc?=
 =?us-ascii?Q?88sJ5w+zlZ4Wkg8ci4SAFO4lDKR2OKi+9rnSHwE7fQHd8uOgfSTwtn5Zcjqb?=
 =?us-ascii?Q?jHXwHNCA6wauMkK0PcSeRPThPc7FGyAWbIIPlfAjyGxE3gicaFBUjKYSiuOb?=
 =?us-ascii?Q?euiB5T3WrlkNQutF8TLBRC/25pjWotj3vGaH/A8+DM8kDNILC3Py9DREZKJK?=
 =?us-ascii?Q?M0UWFrm/EKpUnDHtjUgMoB8Sj+pAH0JDIF3DsQpjKz7QT+GfW0RpRiZEHPdG?=
 =?us-ascii?Q?lHDSHahrDuJAAzh4J+yCck3zwS7hqzR5amr7QrnuHMkHzOgaX7a/Rm37TcGL?=
 =?us-ascii?Q?UboRU59qgZT0kGInyWCueNv/JA1Qie49uZosBxXZI3EbNEybAZI3NjlNiLZ9?=
 =?us-ascii?Q?WvE5B9tiBW0ScZl7zwiK/Qh3+8AAKbWTaFDfYwlkOOfewW+rsiRBzMUwcqto?=
 =?us-ascii?Q?ITZDnGWNRycavdBKq4y/Lls+Rn2/48sUVPKhXy8sEyr8z/2cMFkIi9al/rh3?=
 =?us-ascii?Q?bvxWTryCltBwKs+LiBfNdF772NXgPK8Xv0s2DIz7olmxAE3hURd+Zb9k79ug?=
 =?us-ascii?Q?xMXRlJwcmVxxNjE2OmeOmJ2HuD99ywYMIyqYcidb7viyPiCtNR3VoB+KoqNW?=
 =?us-ascii?Q?l0vY9tzHaprOv/zZ3GvmEMCMvKZ5tLgFhLSxnozmRbLNhDKfCUS79BPOItnX?=
 =?us-ascii?Q?M/85/VrY7ftDTpz4Q6EWeKrP4LqxZUc12UbztNIWJBvapOBoCRzCnAOVGjf2?=
 =?us-ascii?Q?XFkGzySt7Y2rLfGzFIoOc7ziPgJNPB+HxtjfloU50x4mhVZloWxwoGxwq/29?=
 =?us-ascii?Q?9piYIO5nMiGpdtweUlq4kW4HCVLzAXeOph9zgkPmthrlrQxhDNDymiy2B3FS?=
 =?us-ascii?Q?MNMD45iXwn9WhvuEJgf0dfseosa8YJ4uV9apkPXB/vtBVbFAUB/CmtDpMYVO?=
 =?us-ascii?Q?GjouKH7QQCzmaAw6qWihgPWBxQ9C/fdZe+6Xs9Id6ax4a9S9W4ym8Bh0d/Yf?=
 =?us-ascii?Q?C1TYPgtOqF563Uhws/wa2woZGE54+UCb1sLViw+igsso1yQAMxRDsCb3MUDd?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6Af5OZOR5korqPZwMegtWyffV0Pt6CgqmjE9RjGcakFvV+5FMCL/85xvH87unne/2seZuBuP/UP0p3EmME8I9nf/K3JkzJL0rzt5f1zCaLTgPA4JFXEl+8qwjiwWL4wCJDyTXAR6RDSmIfK2/6uEbw7qaMzId6BhORI36VN9hg1yxJrW8c44+66h+vzLdLsSoRgrOYmuzON3YqGlCGk6Y8dAB2OyUdLhR8MiHkGniUXlRJ87uh+4t3Zww4FoetoyvZV5pUsmMrY93Woz1QsyFKfgs92AfwnsWTzxnAz/SgucJkg5rGkt/6ziSaWteufCaaKkjJ31lkOEKQ11fT/9LQDh7UCYxl0a73UhXBFpLzYH7ZtX1/HVRm9Vyr/0YGzN7xDSLnLuC5PvJtJE1ECLKE2YpAd9cNYpRxTT+eCYBs9KDfup43P09PNTed+PRUzO7aNgW+ib+fX2IXilhYd5zOC6EymRN7nS5iPCGQq66BwVksRw9AMheXUUY1atQxb+PQ+ws5kjIXp0YeT9iKpWMZUCTcNAJInnPTcu+Jt2tETbZt2Cy6pPv1pYQBFxVYHM2UZZySSnsH2r0FlBuUZBLQdlT6LDa0dQ8U3+uj/aNxKr+DXsvbS1GYvozUVGWoEhDhJcDTOUzm2tqjy7S7jr86FXzpQctX+Gk7IATKoHEUOJDuvT1LzJQn61rzwQFN7GYzzvNZjK2764T7U/B65Z4IbQun2mkDjusDS/kjn8ppVV/lMlGujho2dGgiIs3s0wMRSrmlm/2kj+r8adRyc2BN0JFkCLtZeQur1VLkx8itgf1Df0tWdtgCMJbcA9WjK2mOzq6meMw7rKwoXqCbo683Lp6jux7fEarq+lblkJLZG5vJ5ca+0budCHZG/7m9r0dM3EeJlYNnh63UBxUzvTPw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf0d5e0-1f8f-41e9-1a88-08db2fa56e2b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 15:59:36.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lacHqnzuLPvwQjJaAieqgltitMR0XdPmhjSOx40S7jnUMzRFqm+PbK9q6uGVOZiDxmvJIE6y2OEY9PZMG+ZkHL8j8Q/83xyamOwx0+jrp1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4985
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280125
X-Proofpoint-GUID: 9TPc5LnbrgW9fsbiubbOpqoEv9o9jO7K
X-Proofpoint-ORIG-GUID: 9TPc5LnbrgW9fsbiubbOpqoEv9o9jO7K
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently ARM QEMU generates, and reports, MADT revision 4. ACPI 6.3
introduces MADT revision 5.

For MADT revision 5, the GICC structure adds an SPE Overflow Interrupt
field. This new 2-byte field is created from the existing 3-byte
Reserved field. The spec indicates if the SPE overflow interrupt is
not supported, to zero the field.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 hw/arm/virt-acpi-build.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49..23268dd981 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -705,7 +705,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     int i;
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
-    AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
+    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
 
     acpi_table_begin(&table, table_data);
@@ -763,7 +763,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         /* Processor Power Efficiency Class */
         build_append_int_noprefix(table_data, 0, 1);
         /* Reserved */
-        build_append_int_noprefix(table_data, 0, 3);
+        build_append_int_noprefix(table_data, 0, 1);
+        /* SPE overflow Interrupt */
+        build_append_int_noprefix(table_data, 0, 2);
     }
 
     if (vms->gic_version != VIRT_GIC_VERSION_2) {
-- 
2.31.1


