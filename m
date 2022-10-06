Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2CA5F6E34
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 21:27:39 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogWWv-0000Kc-KK
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 15:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ogWUS-0005Bm-8R
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 15:25:05 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:53414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ogWUM-0003EY-Ob
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 15:25:03 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296IDIQH011296;
 Thu, 6 Oct 2022 19:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=YvofjScAB1VRq29gwvz5Tu+U6YfqGrPhDhfUR65RHCk=;
 b=mKUm413i6KlbLGucB36UFEB5dKXjKvxQGkrgHrBo3sMnCzbl4M0F7LGwbwKddVA3NR+R
 ITy5ij931RaHBYZ76+DvAC7zRsil981HIRvkGGGr5IpzXbm3VLK7/ZCc4sJfFIbSJYSu
 u2IADZMSBZH9Ypd5vPlq1BqkTBHJGLu6T6u+HiSKfVTx4tMRurj0/e7MWSFBcYP9q13N
 Oy2vQ5RaITNKg1YAEiY+QJarK+3lXJbN4Ol6gU5bnBUpryfDioyzNnmQLHHPXwAgD4nX
 wYJaq65fsSZrgKHVg6+CGSdS0iWorl9yQZkOsgyxriyTeVkDPzc4o0qkQpS2K/pWnpiU gQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxe3twj89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 19:24:44 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 296HG3Nc002632; Thu, 6 Oct 2022 19:24:42 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0cf506-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Oct 2022 19:24:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DeI+m5BQhINkeBmMSk8QzW/qXPfCu0LFQfNedPBzXdwu0ZxmU9ho8G6TnauButbqJcOBD5EKwXJ0KmPsnDE3P0/LWcnMJzZl/zSTv94MDB2ucgvy+6pc2rYyIFXAt2EQJYTY71KrEc5+Mv+qkRnv+2nzJzx3Vp4w+tgYwL7SZpEd/1P0GXESmI6POudQXtlnNAXihxDfgP9oXlQMzeY5pDfY2RLe2OANFxSMTMvUfcQITBeBm7rOwUNG+VnKssOsFxpeZry3w5y6PnlBApC+IVCwZuPA0zlz78T1pwsIsbEdTqmdm9vSW6UNYkjS/kpxXtl08x4vgnhBtdC815EvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvofjScAB1VRq29gwvz5Tu+U6YfqGrPhDhfUR65RHCk=;
 b=ZHz55dzQWoPwdOHHfFTNOTc6weo755dSN7y+rJ06BlJciBH7idirJiNnaeNj9MSA00I8Oqli46UetHnvob8+gq6Cz07jRPZp+n/BTh/jy+v33RxICb/R6/DLvizuM0Wb8quboqDLrOdisDeWnJWZSeGiHeFNjFoHICKvgmZS/ODlMtJuXC9VFVbdTcW7LBC8rcJrLyNlP64kUHsnI2F+uzs5+l6GRweG1frzGXB++zCovWLZi6BMX6I/cjsNUz8d2OEpJ1Nn98o6f1SODjbRqQ2mm8sG4CGPyRwAKhA6afYH/X5JR4YQ0ULE035cH/co4QbsS47+R031qmdW7dl1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvofjScAB1VRq29gwvz5Tu+U6YfqGrPhDhfUR65RHCk=;
 b=VYkdKnxghHgAvNqLQYY9E+shuiPwN9PmVAjE9Eyh9iGcSJ+zdy0MgXYpLIi6DIlpxKVE4lpIpqU6zwEIuSMRDx3iqwo0bUSTEOjsZUZ0j+/9b0cMwl6+/cTpzT8f/sbJMCYXzXTWSlbwnewOJi0gFUJIlK+B7OVtJHNMVN2BI68=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by PH7PR10MB5856.namprd10.prod.outlook.com (2603:10b6:510:131::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Thu, 6 Oct
 2022 19:24:40 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 19:24:40 +0000
Date: Thu, 6 Oct 2022 14:24:36 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <Yz8rdO34FowbLH/c@lt>
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
 <YzcAK23fRnohvXNT@lt>
 <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
 <YztsgiapfWC78BG+@lt>
 <bb2d1de3-5622-076a-7282-06c812bb4804@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb2d1de3-5622-076a-7282-06c812bb4804@redhat.com>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|PH7PR10MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: a13dde5b-cad8-460c-0538-08daa7d06a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iVhEC1Fn1vs1h0Fc6o48+1aLTF+vgbzNitKgg0WTMoJAnuJ60j0GA4uvfczoBe5nUA50yguj/8DkildnEgV2EFuyHiXgbJ337oHvngNNMP/qJQzEBeiB8JWHejkglBo27v9+KfmhHkKCgyixh4GAtnL/NANqOXzcx9ddRtIq6dTXKMRpD450pewQ3vrgi/R9dh+DbC6kwGaoAkwDqY2IzFGHap6kU43/SywW0hfUD+GuzNXzzq0oeVL03KpKDWfAhb6l+wtRMwM8vAdBxAC0pt9yBCujM/Q1fi+WtU9dKb9gDMVax1ECK0J9TobKRDCDG+ciIHGfrYOaM10P8xxv7gSRyV5Ri0wUFCF6RQAytbuGmb8KCWknlUelj1vcEwhg+Ax3YjrgRDas12DFrhUeG9I0faCuNpZ5bXr14fYvbFpm62JfO2DNeIK49+e+7cBdRpUDIlpPYKRhge5rhWDEJ0sjfVPRnWgUpkM9JTCDqPT3FKKbMlpVkKTZnWIQpnVTIqcxOJ2PY9LqISeFk5iP5vc9cdMkT2y3Lg2x1VP4E1ZrjiQHM64htAKO2imRBAmvceqElBms8fzmBphFbZZc6LEl8/8fn9qLmOvYUv6007ajw4c1hG0QoJt2QshkOr9F2Pfr74KuoYXJPlfdWS577HieHJnjDXWf0wJ69+6IX6cdEZcuYfcwBI99y8LZDwkfrpyhlRUR9Vbx/ctHIq6VlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199015)(8676002)(38100700002)(44832011)(9686003)(41300700001)(33716001)(26005)(83380400001)(5660300002)(8936002)(6506007)(2906002)(478600001)(6512007)(66556008)(4326008)(66946007)(66476007)(53546011)(6666004)(6486002)(186003)(316002)(6916009)(54906003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IBLYky5fR+MsKMX5HTOSr4wt1Hh0Vfs/fZ9zWvH5IRMUcEPPvsWzDJdMfMp9?=
 =?us-ascii?Q?XIYd9EuwjN++livndpBY+HH60PF6c0mdDZUXJ+tMhfTgPwuWDcifk5sBqTRQ?=
 =?us-ascii?Q?seJyR44/3QAy1/B4YE/EWocVH/9rpO6v9q0lE8UCOsf1zAyFUfX1zsNYrzH+?=
 =?us-ascii?Q?IQzX8UqCKzWeOiL53nRw3w4kJyjpFdiVjIHq7AYEok9EpxVaEY2JIK7Ap5/7?=
 =?us-ascii?Q?6MwNK3NEu3f9PqkLhkVrPlrdu1FjgIWy7dRiRMKy9n+6np9FnMThacp8b9ux?=
 =?us-ascii?Q?ewf0MyhRWhkKrwuYvtXIBiYzgI13gUyRZHBBmahWbGDZM7O4/w5J84EaaPjZ?=
 =?us-ascii?Q?DhmikrO6pw1ebFUilRLNUy6sBIEtLk0jQWC2WOBbPpPhJSlpXrbm7uX4Ub4/?=
 =?us-ascii?Q?GaA44GPIaSFbA60vn3OfmLSEGIvxagNWWGKgPxCo2J5ya1166KkT0mB8tlCt?=
 =?us-ascii?Q?5ozEXKpNXXujB75llyiGYPSTmHgg7M7+22MBZXqK1IF/5Av3hAnFg3B5iZHL?=
 =?us-ascii?Q?t5/2HrowkbupRJ3046+Rlk+1CqjwHm+tTJjRjiASYjJkeXWUyXYQG8xJXpxd?=
 =?us-ascii?Q?efC6D/oeILp4IOBtxfkzWCu66UT6fC6AD5/CKZrh56On5ltCZijSSzaHP0s3?=
 =?us-ascii?Q?hTWfZKOYaRoT2LJHWVXK6EaQxotcxZZQwcB9NEH8SZ3tw7xCwmtWyXipv9ax?=
 =?us-ascii?Q?HO/i8zrHWD4In56P3XqSkK9p2dXTPGJs3d//FtQhze5ioU2eDMbkRULXAaFO?=
 =?us-ascii?Q?N9yIPClIFP1o3OpULvmhDP13PhT9m7JE0g7mh77uRIjsUYUByP2IbeOPqCo3?=
 =?us-ascii?Q?MKIYjtLKIZTm4Mc07IF9Yt62k2UPpBujM7ehxY40gfCpXa9scqvkn2bjkO5P?=
 =?us-ascii?Q?N66msh/WHjIagLfwJoxcdDNGgoMKMSTcTLB65u8KzAYGJzyqmi6Pk8Ac9XoW?=
 =?us-ascii?Q?jVYDOJP36V2jFYsvkwTdiTwGvv9DVxUrCBxXuTZKvqoD4SzURop/+gbbKxiH?=
 =?us-ascii?Q?WcUzNeKqMSbV8EpjnKTxTvLxaUv3VhRU8SfWyO3DNHhqh9wRWHHYyDgOC4hV?=
 =?us-ascii?Q?nPswoyBAprdAKhrHu2jFvc0RujaiqgF5DeolTqtO2auE02AYow4gjYdes+Au?=
 =?us-ascii?Q?Kv7wg9ScboS2Oj4gzfkayL9xbop8g5SIAjmegFR7J42iOFvbJdyo8avLORzw?=
 =?us-ascii?Q?a/PyEV0VWDiojJaxCQEUP6v7AQxMSUq3yy5QQimBubL6hZsnIB3dAZzuhfJw?=
 =?us-ascii?Q?aieJUS8bPDdvd4VEgUlC+nccGw+07otuXJZ8rkSmJ6DQ8CYktUHMg4WvBtjg?=
 =?us-ascii?Q?DjM84JcCjEy6NE/Y+355m2Q70H9Z5j6J5jQgCi6HdwJowLRR5vAkym+nF3Vo?=
 =?us-ascii?Q?rUt/JPaJJJkUPg6/1nFC7VBqzcZy3Oq8P7A5Tbjo6XZmfoHLOUmX2RQJfh7L?=
 =?us-ascii?Q?iiD/ubt8dYFLXPdm/vh6PK4vI/fikGHVhTm7nxdW0Zq3NObPpbcQdujTyALY?=
 =?us-ascii?Q?4Ygan+EM/8M1WR2Fm9v5Yp4R4eNKULME5kmuFbpYHvgFVkjCwk4r0vcJum99?=
 =?us-ascii?Q?oVRnHhN1aQb0721quVfpY6zhweg8aqQE/HxHZW5hxwG3e5veVFqpitq0KwC2?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /BVdAyeXamqGd44YX2L3klblk/w09WLd0aqE338Q9sAsCDDS1XuSN4XJ1ENr2gayHbqHbPvccZvdJkfIPtFfn3AX6R6nYkhcGQMgDl8zRPFy0uy7VoNZzqx2P/G4CUiFoVdj+5kMbz2sdAMPKXgAHGJxEwTFN81hv6js4pn0dyR8+ptX8yvGd+v4tFQRG+8NEtFG1WsKHmbssZ14m2HIiCmRV1NqkA4kv+5GZKuAvd7hM7kQYFkSd5m1JHMxIHU/QLDebENC6GIcuvquJR2VaQG2CbhzQzPJzCPesLrtm529crT9Ag8uKt/Ya/VtzuiSkHPSeOY2stY0P8N0Oktp01r4bnrD6h0trlM9pLeb4EPJdxvqPniwqJqLueRIKKADFB529P1TobPupdOWg0MWfpOctWM+GGLoQu8Q+t7hC9PZ/r3rXa6dIaNBwqWLQY5+lOwgrqUQQHTWan9JTh0gJgGx0e8i3cYss1da/K3Xpl4JutJ+RLUE3wuRcXox/DKwMivpcFu50Abvg8VUBu/227/z0HSv64qR23vwP7N7krXKhdY0HYoQR8EYclgTfxAI2VuM9zXQAn6/KvNHp47sHHVlhrNjlb3gVPvoC6lJorDYj9sF3rRnwtytnDI5uua3NSSdL93gGZjBURpW0p3MWmBiX1D/iwzE72feEz2UCADFoLU8Y6PnH9Zs1AolAP7ozf7ENop1N4ypd/XEyhaw0DQEPWszxLX1/GE9Qyka6w5s6lR6O4gj1KUtt++n0f3RM0Eap3HV4kh1HGj8vQ6lb+8JMAqwlT0bak39WRXwWiurs0yrwfwx8rrJ0sxlHKZuYviws8k+Tazr4EWsLle3IQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13dde5b-cad8-460c-0538-08daa7d06a3d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 19:24:40.5641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+zdLQojM2Z2yc28K6TZIhnhEcgJ7zAyDtADasTpRw3g4PDTRgnrYRw7+j1AfKuIrd+efzBRbT+LxY7DLJLNze6Mezw10mOTABUqJlMeT24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210060113
X-Proofpoint-ORIG-GUID: cotO5kyGxrUGV4NxzwMAo3rY4YEnwZj-
X-Proofpoint-GUID: cotO5kyGxrUGV4NxzwMAo3rY4YEnwZj-
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022-10-05 23:37:33 +0200, Paolo Bonzini wrote:
> On 10/4/22 01:13, Venu Busireddy wrote:
> > > script? Something must be putting the SCSI command in the queue.
> > > Perhaps the driver is doing so when it sees an event? And if it is
> > > bypassing the normal submission mechanism, the REPORT LUNS commands is
> > > hidden in scsitrac; that in turn retruns a unit attention and steals
> > 
> > While SAM does say "if a REPORT LUNS command enters the enabled command
> > state, the device server shall process the REPORT LUNS command and shall
> > not report any unit attention condition;," it also says that the unit
> > attention condition will not be cleared if the UA_INTLCK_CTRL is set to
> > 10b or 11b in the "Control mode page."
> > 
> > It doesn't appear to me that virtio-scsi supports "Control mode pages."
> > Does it? If it doesn't, is the expected handling of REPORT LUNS command
> > be same as the case of UA_INTLCK_CTRL being set to 00b?
> 
> In QEMU, all HBAs except for esp.c and lsi53c895a.c support autosense. As in
> the comment below, 00b is the right value for virtio-scsi.
> 
> The code to build the 0Ah (control) mode page would be in scsi-disk.c for
> example.  Nobody ever wrote it because the values mentioned in the comment
> below (00b if HBA supports autosense and therefore calls scsi_req_get_sense;
> 10b for HBAs with no autosense, typically very old emulated parallel-SCSI
> hardware) are the ones that make the most sense and OSes will just assume
> them.
> 
> 00b is also the default UA_INTLCK_CTRL value, so the mode page is not needed
> at all for virtio-scsi.

I do see that the Solaris driver does send the 0x1a command during
the initialization, perhaps (?) seeking the value of UA_INTLCK_CTRL.
Since QEMU currently does not support it, QEMU sends back a
key/asc/ascq=0x05/0x24/0x00 response, indicating that 0x1a is an Illegal
Request. I am assuming that the Solaris driver does not handle that
response well (I still don't have access to the source code to verify
that), confuses itself about the value of UA_INTLCK_CTRL, and hence does
not handle the response to the REPORT_LUNS command correctly. Maybe the
Solaris driver assumes that QEMU will retain the unit attention condition
(UA_INTLCK_CTRL = 10b?), and will respond with a REPORTED_LUNS_CHANGED
for a subsequent command?

Based on your confirmation that we want to handle the REPORT_LUNS command
as if UA_INTLCK_CTRL is set to 0, I will proceed with the assumption
that the Solaris driver is at fault, and will work with the Solaris
driver folks.

In the meantime, as you suggested, I will post v4 with the bus unit
attention mechanism implemented. We still need that.

Venu


