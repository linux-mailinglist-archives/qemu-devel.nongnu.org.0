Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7715FB2D4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 15:03:50 +0200 (CEST)
Received: from localhost ([::1]:44840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiEvF-0006tM-Qt
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 09:03:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oiDE9-0006dt-TO
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:15:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1oiDE5-00077U-Sy
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 07:15:13 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B8WrXU007984;
 Tue, 11 Oct 2022 11:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=xC8DyhpbuNL3BK5XPbhZPvXKQpD30HJyFmQeEHJFv7U=;
 b=wU592Tq8Gw88DMZ5BKPr8ILc+QHLSl2BKgXeSOp2i5c/3Qui/GAy7fhGb+YGRPDEMRN3
 N99qAq6pmTOwQ+Zkafpohb9TOnv4T9JdvPn+3F3zfL0Z23DcZwyREai29/MNRrCMKqGF
 BE+gULWbMMUAlgnPO4cTLg51SLVyn4RmI7mjmrWMUPB4tPX1iEzknYwJvgETYDC6f2Nw
 Z/s6QBHwJjRe3RPlegpWIXfjZLcSj07TzNePOrbYdyQHXQ+FcMsA2slIea19vXC7gcxG
 tgfIX3gCIZ5jEELOXEcOKKKEQdn3+YTf+EIbU7FmfHiQM7t/MO/UEVtctMQlE6OtLNjw ng== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k2ymcx758-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 11:14:54 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29B8FBvp027384; Tue, 11 Oct 2022 11:14:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yna3ejt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Oct 2022 11:14:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faeS+cptiDsbd4zeTUeYHc1+2vXiziAyvZiLBw7T0Iz2WlfZKe/4XA79XgSPpKhLhHwTrpr6JZb7Tg4uH8nKPK1ki1O0isBvISXCmgNDt+6WBOTnRtHOD+36JmXqlEhtj6j4Jt+bfqw58+j1hl55AGoZ2neC1yilyYpyOl4SF2FklWgFCcJnxpmG68ZEH2k8NIAff7nE5Bb7iHZ1hbmJSF3ogzUNs11iZ1E+qipujvOh503VHchnS5Lne2t+qKNONWSyr/vxAAIvoApuIe4YJWa+ScsGgDmjrxL2chO+0LGcnMi6+ekGTITOL8YELBPQWHsdbU8ZWCo2WeWKSaAzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xC8DyhpbuNL3BK5XPbhZPvXKQpD30HJyFmQeEHJFv7U=;
 b=lL1yq0RQKgpWGnrDsq1W7CQD9qvO+Ovv7WVJtDZqn9mQqO2OYaPijJBSd2xXcZ9DHj7A8QNPf5SHUV/MsOVRjPwJYLWZtwzHgwtjya76dYbxPNY4lkSZORwcjOztig7y9rB8HGpHHb6Vfx+4j8lPZRYgWfyl+nQc4cfWzqJdI43cZci4vSVV5hqj5FqZDVVvKzuPWQbLuxUG8oL665Bv4SnQRu8OieznN9Q6QRfrRk3NHLWieIGn6T5yL3TkBNcepkqcPvEPfEoP7ECpwTeDPBxW9SNsSiGbiwo6JuOaZ/cuKk5bE04J/cdUA78aDEmz0Ued9YjgLdBm27RcLO2Hpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xC8DyhpbuNL3BK5XPbhZPvXKQpD30HJyFmQeEHJFv7U=;
 b=r2CDboxXfgTjbkwXX5NVGmE6hEwT1HN2nMAYa+EubMwz2VxHf/b/hTX2H22py9NSBs52f1Al6vb1XX28kgvmKW/RxvyA3GGP0rnC9KHFKvi9SonsL3TE2dxucrC19PyZAY7DGqxtr//03BIRqHW1iJ8KtXMijad7jiGVysMOHrI=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by DM4PR10MB6229.namprd10.prod.outlook.com (2603:10b6:8:8c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.40; Tue, 11 Oct
 2022 11:14:51 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5709.018; Tue, 11 Oct 2022
 11:14:51 +0000
Date: Tue, 11 Oct 2022 06:14:48 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <Y0VQKJgeTgqKUkdu@dt>
References: <20221006194946.24134-1-venu.busireddy@oracle.com>
 <20221011103456.320555-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011103456.320555-1-pbonzini@redhat.com>
X-ClientProxiedBy: SA9P223CA0027.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::32) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|DM4PR10MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad11c7d-c50b-4233-c4fa-08daab79d108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cSz2jP1crv41zltCE5ppCoonBSz8sByCuZLLtn8vL1cihSSRcF11GUglMmyhNZOSN+ayH1dEkoWZhj3AgDeqyuvSJw1tI3n0VL8vpTpZMZV9RctDZdp92NbL0mMAgVWLDx2RQ/MKU7DAY04btVRk3Ihu4uNA03BcRk7U/0uY5XO4sc/60ROFXyqYxA+xoLrdl51eSdaIvk0mbSg66zumkMge3HCODJa10F/kyqUidrSJoUyucUfYorgKmTtj32amWkMgSS6ui0PCT5pn5Od5rocBdio8tNV9E7Z7Sv2PjdPcv3c65aPQ9YrSC5uwl5g+NZIAveUlnsFHX/yrRx0hNxAY/6eOQoOhOi1XMHjlPhAyVYKUdcuFZgziK1lFCxheJzE02rXAlhmp5xJhfDg54Zy3VnpSYZr3EzLswVWHpHYZvfn5o1Xl4wK4laTpC0gA8f8wG2hiLHD/hm5w1LwYClPoUK0ZGZ4x/HQyAgiNOb1BHsJTV6mXtu0kCSLLpVOkajEjr1XGsyt/cG4lQrds4mt6TcFbVBiTI/TunCsMdDK+Drwm8MQfKt9ajlWyQQWXjTP7gJmFUDMmPkcKRMs0eVJOxASuNo8kiWzOXVxZOLCVxPNIJ0flF3LgcC0MD2QQa2A8h2T2xud89c487eOaotdc0IWsHeS4CqQ4oNAR40K7NezPKER3h/SAlN1QF4vx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199015)(4001150100001)(558084003)(478600001)(6486002)(38100700002)(44832011)(2906002)(86362001)(66556008)(33716001)(26005)(6506007)(66476007)(54906003)(53546011)(6512007)(9686003)(5660300002)(8936002)(6666004)(66946007)(41300700001)(8676002)(6916009)(316002)(4326008)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5i983sBbCzpzRNc3G1+qXlmqjbFnWSWbEhV986RVB8GwDeZPqDoY78Zauj+D?=
 =?us-ascii?Q?jeDPuEasPBFbP3C4eq+LM9HgpzzDgCFLqCkm7ygktFhqyc45AG65KyFfCbjG?=
 =?us-ascii?Q?7koie3iOassS6GtLBOQ6ZSNl49TjC0uaVZV4PTOBDG0onSjTZZhPONnm0hFH?=
 =?us-ascii?Q?XWwqzNXSbbkOs8C7qFbFlAErv0eLe6OF5o3y+nfiI5CNvNMDXebjjEFQ8hUZ?=
 =?us-ascii?Q?GA+UHUMqYjCo0rKNs9X+gqxVfQoxwoYLT2NX37aMTuejP28ls+7Vht6xwhA1?=
 =?us-ascii?Q?UG93/1jxDim86CmlWogKjP1+XghqH7W23iVq/rzzHsje9HMbYpNANwbdlzYb?=
 =?us-ascii?Q?o4rAkx+8RESukRqkuL3mikM9bfGBU65J/Y9hefW2EZVSUscu6se96yKoEvx/?=
 =?us-ascii?Q?hTK1PEXFxEhwjQUXvuhmoh3G+X7/QugCQ02IPPJonzC3jUQDkoIkNGx+ZOxo?=
 =?us-ascii?Q?8AGVe1w5/Oeeew4QAnweGEhY6iL+rwZTnDM/VOlYg1HXjnhejr4UfiNE1BS9?=
 =?us-ascii?Q?CX+p5vj0d8IJLuhTr2LL9PLAfD4JJUnkg5s2A0/jbyd1KXjMAngvxEHUguis?=
 =?us-ascii?Q?6ySrCJcDvuBgw+M9myFp49qQBYoLIKcmmgAFt/6DVKYw+UISD/R1uUbFQwdn?=
 =?us-ascii?Q?IZPs2Ux27QvmyBVpstez7snyVGPF18O4uDnfGY5/uZBVBYIyDih9/63gxotu?=
 =?us-ascii?Q?19HuG6zldrQ4Ds21FTPhWKVCuIUo72RSwvUFSdWub6xrf/F8KgbEX/imYnbc?=
 =?us-ascii?Q?Q8EJPmG00ZM5dQ9ZMQFv5H7C3eDKWuZ4lForgr/ObzxEcPhyZdU78nXLut5E?=
 =?us-ascii?Q?kyd7fVylabyb2D+avX/1Q5JH1uvnSj6Btgwqde/aTGVCMXnoeBYBN9bW7dgw?=
 =?us-ascii?Q?zPbgbvOBOIRJjtBEw8IailOhwd0lL7/9EIWCP4pX2Q9uKqbNVlCuo0KeNbXJ?=
 =?us-ascii?Q?qEAsslpDUf+63vo8biioeU34Pey8oJWfyBvNXk36NPhhnqAEBT3oZliS0JgG?=
 =?us-ascii?Q?5kq/SOUBILHY+HkFiNlHie9wJhokH2Q4uc+8gRhBd2XMnB7xB0nDQwTZqHx9?=
 =?us-ascii?Q?o6+Q8zp67/hotTPDItJEdEQt501l+f4wMV6Q0ij3THSfopQVZHmNmpLRWGeI?=
 =?us-ascii?Q?+UoGDR+ejIEt2SoPYZ5ty23H06hd8+cICc6cfO7+V6D1/MtlFYNAtTtUHp+0?=
 =?us-ascii?Q?5GkeowWfdpuakLkzJqUiWozGRA9Lhp/C77he6EWFdz4BEMVOh3E9nlfr7nSm?=
 =?us-ascii?Q?Ca9X6CtTg9ssPDdUqGdx5AWMTPWD8ke/vPpiT+6AwZEgv4v+GJ51FYUBJ9Bb?=
 =?us-ascii?Q?JYvPEa8l3zb/0IQRqK7rQUxCi+GM3O2YTHPIacF0P5AOFqgt8f6oElY2LUcX?=
 =?us-ascii?Q?nW3AEk3ahQbb7hgge6qcr7puXqcXl5APWbVAPm59yY/AHmWmia2mwbOpbWSk?=
 =?us-ascii?Q?+GBnqzExLjqT7+r6sNWZLG3qj8ZuI6rKf9qeEiR3Pq6L/e8QI5Y9YAJTFzwP?=
 =?us-ascii?Q?zP2NbwTHeOxIMJFhFbMUCEtqZcqsd7qw9C4OuhbNwOsqSsxOkza0yNXZAk5S?=
 =?us-ascii?Q?gQ2u9G4ewBnXQi5m8JPBsx0s4SuoTyhlkr+mOFb9NfG/C8j7X0Gex5jRcGmx?=
 =?us-ascii?Q?dg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad11c7d-c50b-4233-c4fa-08daab79d108
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 11:14:51.4001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/RY+tU68aC13iG1DerPOfEv8TGweneix+n147bgThYIKeJY3fdKUdaeM1fyDBL6exujYiqfOOBEzTUxuJrENKPrX2oqWWx6z+KQZKbg0cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6229
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_07,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 adultscore=0 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110064
X-Proofpoint-GUID: FMma-iimLKQtTMtz3NU2ojGnyCvr69VY
X-Proofpoint-ORIG-GUID: FMma-iimLKQtTMtz3NU2ojGnyCvr69VY
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 2022-10-11 12:34:56 +0200, Paolo Bonzini wrote:
> Queued, thanks.

Thank you!

Venu

> 
> Paolo
> 

