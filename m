Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50A5F7C1A
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 19:13:57 +0200 (CEST)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogqv6-0006xZ-0Z
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 13:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ogqra-0003NE-8C
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:10:18 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:11892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ogqrT-0006uL-AD
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 13:10:16 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297Ev0qt023337;
 Fri, 7 Oct 2022 17:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=o1aubhE02PntygwUnRpwg/Dpn7HelBQgIzGdOxp7kbw=;
 b=sgYTSgt/PGSoX4Mgoi8onGYPrQQ6fYTPiqWQk+sushTPnJejetXPij2Kd9mgUZZ07re5
 +8yG5YyVPRcBbmD6e8QaemwVCwaOp1DjbJL+HF/B1edAg/xw44P8oy3eesmAxsRAEM6w
 zNDHYP5dM9nloc3s17dkl6S8Ev1ybQnyFAgVAuPsDZIasVO6GNidTtC2AfV7DJ0RsrnJ
 yTbxYgRTkhJDdwKUXXtLsppuC9DX5Fz7c1eFqI4gR+O+TunoB3jTpyFS2EveJxqbr6i9
 +8PuyUTsLCQsxEoZGSdLpXdLg1Q65TI99ZYteHx70aj4wRu2BOnKDbIei+2Qarsk84O5 ig== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxe3u0382-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 17:09:59 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 297GhLsw003045; Fri, 7 Oct 2022 17:09:57 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc0dkmct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Oct 2022 17:09:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cv7YjYEskxyYqVtLuaVwee46kn8TVVOKAk0OQvniSKQwyVFZB0DQAYMtvFJi5lUZFW2uKEryjKTLUe6uIIMhWep8lmprAUbHUEIZYZax9JDw3axdPQe+NkjniFPch0vP3sMOM+oVSJwoxtZYvo6gs6AW0cT5qBlglEQtlA2bIY2dcKPbXKdlkQCDQ6nDcyFj8Ic43H3WsyyIaAFppmyZmkfRhRI4QKzmH1I+4wNltP40mu3sBeNEnH9I5k0YKVUSuGvlvkUexli+arHJ2XIB2bpeBjgUpILmYBqM9OjKFcke5/vSYxeOKjSqeM/pGKJS+rx9fvT4Vtlh6k6lWzD6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1aubhE02PntygwUnRpwg/Dpn7HelBQgIzGdOxp7kbw=;
 b=AnCrXw45jRILMh4mC1yzZqwGMVYSneKb50wcYnmHQknnlNWTnqOnBGL6n5FrjuIwVzYIxpE1Mq4/S8M2NfgzGYR63aI8Pk+zeZmY6Z3cVC24FgJU8SIsFGpdnL9j5eyoCSPkUMAYE/qrjcfj2bBFmTF/xDg+ZGvK86RSW8vnCZi24U7H2RVn7m0nYUviCj0D5Wc1PS96xnz4GAasNy41Cq1Bv3OgiBE8bvxqbjcLXQYnM0Ow18kFY+50tsBO1KcmxOjXi88SfViSK1EymBAoNmXf3r+mzrDHZRiOQzFsbHxpbH7hs2Y7FhCvHAj2kKbGga8tDIcPoKsHYLPW8Of2cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1aubhE02PntygwUnRpwg/Dpn7HelBQgIzGdOxp7kbw=;
 b=CQUejhno6jjjB8gvh2maIAqmdxyngn5ot5I4UwnoEvYeq4u/Lv2eVrGgUUtOBAm1xhkKBdGqpzZMKsmgOx28EmQtPyOa7e9RX5XbF6vFBmtKwsB3IPhWbmsbZeWZeJnAVkdSiFooFuSkCmlJbG+965ahqbe4MYd0ojUl1LA/4ns=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Fri, 7 Oct
 2022 17:09:55 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.036; Fri, 7 Oct 2022
 17:09:55 +0000
Date: Fri, 7 Oct 2022 12:09:51 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <Y0BdX6smW68IqpOb@lt>
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
 <YzcAK23fRnohvXNT@lt>
 <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
 <YztsgiapfWC78BG+@lt>
 <bb2d1de3-5622-076a-7282-06c812bb4804@redhat.com>
 <Yz8rdO34FowbLH/c@lt>
 <CABgObfbznb1Yn1TK-4AU5vVd_-fhNqrxjVKJCBbu19_+1Z=mcg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfbznb1Yn1TK-4AU5vVd_-fhNqrxjVKJCBbu19_+1Z=mcg@mail.gmail.com>
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|DS0PR10MB6918:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afab3d2-8f26-4b09-8add-08daa886c145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4YY/mBULOBMq97TPH6Df7r44EEHGrdRuZV9g+cgK4HLTfA0K4o1bZZl3gyEQvrpKtDmlx4hMtQqlG9NiiWzgrYEH/MXUIRpkvdnFELsrmeg4Jc5jEAZg3Hf55O4SSNWsmnN3UFS99Q/CgPKbftsCjTHpyv5CdszgW5umrq32CyY+YjQoOMNAKdUWcAUgpkoBuXpaFO5B3ynqkuq9RctlhzINTf6xez4vIvTN/IBnxXpE8eUVRykCLxeBUUHAcYHcVe0domDagScIaiPsMkXwfLrooAgPgS5a2UhkRXW5cJdn6bIZd0Qu/+sCyWqamjtnL61y3uGmO3nv+EBB59PHo/0kmxsXUdRlcTF9FvrQnDVGmEAX4yY/uD2D5nEDZ9ZwDdD/wGWFRAbMEajRdrPdwc9ui7k7DzFo+PyzERY5omWyn7gFWtMuBpPEXO1d+vCcyy5PCISOPEpyrv54N1webJRUexS9agjEYDc7ncL+FuRUHXrsllTc689e7QiujzwM7wKgSB4Ico7YsW/wSd3RXZjzm4OzxcgsSi0JE9csUl/g+oITM8ltYb0N3eSHjUZP7jZD9GJUVpxxtvPL4Y5vb2Xqy3FyOdR+5neBVa65dsTP2DKa1gG1yl1P7Rp646oiL8/KjRoc3PV4VA24bSe4L/xCfuxqmo9otfFRS1lWiJSNPvEvoyFytEkoKDbPPZcC/9u7Al1srfSra2DbP6Kfwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199015)(6666004)(86362001)(9686003)(41300700001)(33716001)(26005)(6512007)(8676002)(4326008)(53546011)(6506007)(2906002)(316002)(54906003)(66556008)(5660300002)(38100700002)(478600001)(66476007)(8936002)(66946007)(6916009)(83380400001)(44832011)(6486002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2XZF6rvdJZpQFexCCc1Aro4dRasrZ90/L6IG3yGHxVuJ4gBOqnzOkV9GprrC?=
 =?us-ascii?Q?B1cpI3PJOcliKXT92QJrRbzf1y8OAACUsYxt6z97fJW71ottCFwW6iSUM5qR?=
 =?us-ascii?Q?ZMvkhFopO0rO0c8PsgPwP/FzDNFGyB2urjchD5kJanUHWWH8NbbIGptoiW61?=
 =?us-ascii?Q?wDt6R2QaRdrF2r+1+CIaA1nJEeLSydp5yfXFizLloUzohZczYDsADtvLoU0O?=
 =?us-ascii?Q?S7P2bEaxiHMvurLwWzL5CFjG1sSIHfxS13AGDYrXDjNLmWG6XgBNbqWB6bo5?=
 =?us-ascii?Q?mLybtVhnWR2vynzNGSvt4OVon5vZz3g16MTuSSmC34Jq0+zXOGfI+2Z3zb7j?=
 =?us-ascii?Q?K78wn/wIR/1130zIWp/JF2D22UHXpBHo5IqBO+9/jdDH4JqSo4rw2fr4wgz4?=
 =?us-ascii?Q?IsRM6xEm25JEgB4MX/Wuffdr2aevWBnRjDLcD/Lec4jCKdTINm8OnT8g7Kes?=
 =?us-ascii?Q?osPuH4CTkP7rOIUwWzwlTqEE/VY7IgEKZcrHY/NFGfqRwSc0V4M0ayRUnrFl?=
 =?us-ascii?Q?SAbpSyBHmTIjtnAI/XH9QUxSp8RlHNjXjO5BmmK+Yle6JVDmyy7hntZt+wru?=
 =?us-ascii?Q?hwoPeIwZpY4fy0oJT3/m6uXX2ofxBzSgPUbuMOzD9u+2+5tZlY6nElYuXzNP?=
 =?us-ascii?Q?F8mZbne3oy5Q82NT9UaVG4apgdI3z751C9dCB44iZ/k9Qo0wlwTZUO7HjGdd?=
 =?us-ascii?Q?JhTYm1q6kbeWqPoSFyKOZ6xKLihfws9R8NI5VrD4b62KjldUDzCl7Tcd6T3O?=
 =?us-ascii?Q?XQy+HVtdz8ggSBxY3kl00dvligOCC0MBv+y+7M6gK7bTA4qUTIuCsEvzdWZ8?=
 =?us-ascii?Q?NwtvZiNAzco0bwGFX9NRugp9xEKhMUPtMX3KLXB9L4FyMB9GrgWmO70AjScp?=
 =?us-ascii?Q?ny+s9hRwL02FrbtylHzEutVqJMTj/vFEu3DRR8NFQ7UwK04qqmOTeBCz7d3U?=
 =?us-ascii?Q?m7A2/mttSmpsWJY0uQv5kiiAZI5Nd02N9RBczg0Sz7+TUcAtIFpKrxxuOtsH?=
 =?us-ascii?Q?kCSIxv+HaGb4syN8aTGWfGnC4W4cScwvcQAN92+L/y63YzTeh6b1DecSYDZ/?=
 =?us-ascii?Q?4zCmfYwSRes8sKG0t8uwQgiKdsvjGrqyaQ7fhq+uTg8VFpx0tD+WBSDFK92z?=
 =?us-ascii?Q?s0u7zjk7uyHnlQC8phLsv5g5bCDpiojqTL7a8JAijzXrt76DclDQ2MO5VNsV?=
 =?us-ascii?Q?soN8kAWVjqwm2/DnG5GhzKowtuVqFCPFmr7Mxj+vAErn3SGMSgfelJi4gQCx?=
 =?us-ascii?Q?oeLF55XpCnfJuePhyvvCMh+9uYQqy9N+iaf7dSiPDZQ2MMdlrdW7wTPEEp0F?=
 =?us-ascii?Q?ZzsGM+J8jol5nWQZARTTQN5prK8+nA3dPAOSVUVYbBdJWdMHaaebX0cdXI93?=
 =?us-ascii?Q?yBmLPllud7g8OondG64aSZXnw9sCCQDoW1+fKHc77lxRhSK501N1cz9WpfAB?=
 =?us-ascii?Q?0h8lgjv66Qay2IhahUGFhfJVMbb2cWe46as6hn5eoZHGoesva+srQKe27ou3?=
 =?us-ascii?Q?s801vr9mzcxGGyAXeYOQzyu0OzB2qXsINF13Hz0lLSTuqWQntUGY1ij4+mnd?=
 =?us-ascii?Q?xEWKZ1i9GaNPrUwoyOSQH7HAIkquzIkKXDQO+xKuraFwa4/ukaShWigcit9+?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afab3d2-8f26-4b09-8add-08daa886c145
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 17:09:54.9865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Jk3/v4TcGl2mrjcWSJErm552YFnaPOCOnzVrEJKzlR002FAme3qaoStK1O8uptpfrIjpIC1gVYQuHOk37X1DKEXCJ0EaDps73CDSNIhOEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6918
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210070101
X-Proofpoint-ORIG-GUID: 3_6Hed8_zW0ZOA4owaPLxkVg0uxZDptW
X-Proofpoint-GUID: 3_6Hed8_zW0ZOA4owaPLxkVg0uxZDptW
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 2022-10-07 06:55:15 -0400, Paolo Bonzini wrote:
> Il gio 6 ott 2022, 15:25 Venu Busireddy <venu.busireddy@oracle.com> ha
> scritto:
> 
> > I do see that the Solaris driver does send the 0x1a command during
> > the initialization, perhaps (?) seeking the value of UA_INTLCK_CTRL.
> > Since QEMU currently does not support it, QEMU sends back a
> > key/asc/ascq=0x05/0x24/0x00 response, indicating that 0x1a is an Illegal
> > Request.
> 
> 
> What is your QEMU command line and what is the full CDB (apart from 0x1a)?
> 
> I am assuming that the Solaris driver does not handle that
> > response well (I still don't have access to the source code to verify
> > that), confuses itself about the value of UA_INTLCK_CTRL, and hence does
> > not handle the response to the REPORT_LUNS command correctly.
> 
> 
> No this has nothing to do with what's happening. The most likely reason for
> the bug IMO is simple: the event is causing the driver to send the REPORT
> LUNS command, but it does so in a way that does not handle the unit
> attention when it is reported.

I had a developer with access to the Solaris code review how the response
to REPORT_LUNS is being handled. And they do see that the response to
REPORT_LUNS is mishandled.

With the fix proposed in v4, and fixing the handling of REPORT_LUNS
on the Solaris side, we believe we will have a complete working
solution. Therefore, I believe we can conclude this thread on v3.
Do you agree?

Venu

> 
> Maybe the
> > Solaris driver assumes that QEMU will retain the unit attention condition
> > (UA_INTLCK_CTRL = 10b?), and will respond with a REPORTED_LUNS_CHANGED
> > for a subsequent command?
> >
> > Based on your confirmation that we want to handle the REPORT_LUNS command
> > as if UA_INTLCK_CTRL is set to 0, I will proceed with the assumption
> > that the Solaris driver is at fault, and will work with the Solaris
> > driver folks.
> >
> > In the meantime, as you suggested, I will post v4 with the bus unit
> > attention mechanism implemented. We still need that.
> >
> > Venu
> >
> >

