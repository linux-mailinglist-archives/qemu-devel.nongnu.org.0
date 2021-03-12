Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADA339752
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:21:13 +0100 (CET)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnLU-0006NU-QR
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1lKnH1-0004L1-15
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 14:16:36 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1lKnGw-0007jT-BH
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 14:16:33 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12CJE8fK100006;
 Fri, 12 Mar 2021 19:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=xNoUaRso7hvvNqFe+pfczGYiApU1w2PbKCOQaa/V19k=;
 b=pN9oD847mX/o6f9d64vkEaW1L2tJiLMnwa/G+Kc8ljKkHDJ20Mvm+vOGw2n20CEiSDyy
 qvR0VTKLwg725XESpfsfIqo27XBg66LjUx37Y7KVqYuwY7vbXnv+QYJvzItuAKJS8VtG
 ZU/tv81PVyvqNSF2+tn8b1XmzJAraZykYCXiBoigpjOr8QLz5h9pHHDOdIRzF+kKUOoM
 ktHEBj1nNrP8QtoyPN+0zaZygTkOR40tUDT62gebk36gUibQG78Wy4SmW7l3vyspQHtW
 M7ssyx1zfAWZyTgq/gSdUhLroUEv9i3iMuCd/q3YgRXO65qz0iBbMBIEGDKZ2SvwwxrO 7w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 37415rjv0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Mar 2021 19:16:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12CJBRin077653;
 Fri, 12 Mar 2021 19:16:11 GMT
Received: from nam02-cy1-obe.outbound.protection.outlook.com
 (mail-cys01nam02lp2056.outbound.protection.outlook.com [104.47.37.56])
 by userp3020.oracle.com with ESMTP id 378cexdxp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Mar 2021 19:16:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhBnvWoigYQYlBrv+nl2JZsWM/gnauaVlmHGBotGmcMEZHoavW0fNQPIWidYHlCjM84tNZTcqt0zulzTb8IReej+KHExH2KgE4larQjf0unNGPPhtugRd9jAeAL4/5OutY/ES2OW8Cgk+Zzys3oKUnA03VVYweFmvh5vVMhrybtLfWVt02kcIPs5mz37HpNxviEEJ+88h/I9GyXL7i56ZRx0OCurv4thqYDcS+oBTZSmVZR0xWIo0utmhLbT34i+jbFRtY3iAA4Ltn+JfkYhc3IDFmKv3fpwrSz48lixpa8EuyhwElSY/dyVWrpLYBLVNRPJw/1Kh6PRhAtxuH8jkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNoUaRso7hvvNqFe+pfczGYiApU1w2PbKCOQaa/V19k=;
 b=KZa9N4FDr7ep/kolBc7gDh+/wie7hp0xAxmqjXsQCYsAsRgOhkY4TBXh+wpa9XYyXsQ+Sj6A9ULvZ4OwYYJJLPCy3QLdRc+hio75MwP2FXR2PiTQVY/aesQtpuSzMN3vxWItkShP4KmWr7NUut2V2X1TSzqRTtl1RunGngvFwdu0nR3pmnnSz9ILn3sTVyR4/WttKHjN8q8vHyun2ofgkxyTIuT0xOcFkYNYjbA4wMHm2UEdLIRHI1vAAYahR42ayn3OSi4FTrCLxNdvrhOs/MoDyx7RXpZmm+AxBU0T61MgHekJr96rHg8ldlXuYETFDJJemREsWMPuzahSosCAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNoUaRso7hvvNqFe+pfczGYiApU1w2PbKCOQaa/V19k=;
 b=rtiWBQwxnFPgGspND7t08wEg55HN6kliw1ch4aDoIP4VPpjtBxFUE4wTTpdAdUSVLVrf7kDkL6Yr2vRRMjWOnREwSlAwIoQv/JmTYIL76ZfIjEckO92aPZ6WIwm8G9DdGWefzy25Twf5GrhjE8oW0qYiH6/lGnSpOXONSELO9qU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4781.namprd10.prod.outlook.com (2603:10b6:a03:2d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 12 Mar
 2021 19:05:03 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::e538:a915:125:2695]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::e538:a915:125:2695%5]) with mapi id 15.20.3933.031; Fri, 12 Mar 2021
 19:05:03 +0000
Date: Fri, 12 Mar 2021 11:05:04 -0800
From: elena <elena.ufimtseva@oracle.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v21 00/20] Initial support for multi-process Qemu
Message-ID: <20210312190504.GA1099918@heatpipe>
References: <cover.1611938319.git.jag.raman@oracle.com>
 <d59d1987-75dd-4a75-c4d1-87b481dda0ee@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d59d1987-75dd-4a75-c4d1-87b481dda0ee@redhat.com>
X-Originating-IP: [67.180.143.163]
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from heatpipe (67.180.143.163) by
 BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Fri, 12 Mar 2021 19:05:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c20da90-dd9e-4e83-50a9-08d8e589bdf5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4781:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47817FA697BE9FF248E95B558C6F9@SJ0PR10MB4781.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xn3qAiRVWV0h6yofKKb2ud+Y8EqDcJ8qN5BOpT2U3S+c/SzVtuMLrt2UF8phORFv7ftGknVnYNGMOngenwCttYIfNM/8E+SPlm00215mE7dCIsbOmP/JEdkErAf2hQs5op7njYoD2shdL1+i2AlWc5zrsQC9RVcArki9pDZLiXfDvm4i5otXHun0gaR8SCZqSIT0SxpKBpR1OqwWvvVCDzjXzzbX5bbTLEK1/p3Afqm3TeKIAetDR+RHKKA6PY3rsTeDdxm5o23v9ux2NPH2PePi+WMhIWqH5NSlPKigBwbuyudDcPoVp/JpRwhAstE2YcxiGWi0lSK9v4VVML+m/8HxWH8oYV1AhPFFkP2yaq6mSGQQ5jXQsmxAoEtZETzzHYJoR01YBWDS2CxBIY+hLZc0vQmyI1Qg/d/b8RFhoHNtXTJbsNvEERGjCTA1V3lT0GNfc2QzWPZnqNssyWj7wqHgrI4mkFKRUk6bmTsY7byPiNY8yN0oOa3qKoQCiNrALpkyvtq6xbM1uggCDoehpQz+fzcNXJ7IkYp6Qv8GXMBVlmops++u4SAnHq5Ve3uwDa2+OuvmkknHhdAzJs7zmUu4oOWEC3O1UHmRD1SEaeZ7KsykENfjOByBj4RdFMXgIP218atK6ILVBAdF9nzoqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(39860400002)(346002)(136003)(396003)(956004)(26005)(186003)(16526019)(9686003)(4326008)(55016002)(966005)(478600001)(7416002)(316002)(1076003)(8676002)(66556008)(66476007)(86362001)(66946007)(5660300002)(6496006)(52116002)(33656002)(9576002)(6916009)(2906002)(33716001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dfYyLMxhPNeTogo3bmLs3iMovKZYV8QrQ3O9X5kauhddbb/XXm2xk9GBzqDB?=
 =?us-ascii?Q?Vrrtw1Du6EpAIDV8RnpSpG4kB2oWrxzdzWJrydt+MF2OIsVuaK21n/uWaxTM?=
 =?us-ascii?Q?CbcTuO/AdaJdcJd6HKjBOA9qdByLS+ebDA7Tl6CILV3Jn4dENnYCLbrwpKxn?=
 =?us-ascii?Q?OLscxUmAczbAJ+xQx0c0UqGDdCc3AUrKcnq43qZ7FAwhaKCarWQQSeuLM1QA?=
 =?us-ascii?Q?luupl4UjZSKZQ49zyf57/PMj4IVuLovxwI3hsnstkML4DG2hT0UqLaY2Gykj?=
 =?us-ascii?Q?riqmKGZf4xpVzcquASxIEY05k6PTABEtTxfHLDHUgPE6IzVqi3KlfGGHe1Wl?=
 =?us-ascii?Q?kspScmiV8aVyYQ4zPMdBpAfFyHnjW3ikqa4AXD89j3sALLlD7OURngL6JBLB?=
 =?us-ascii?Q?9/kOyzC+urk+r+BBRgF6AoLf2akj0ThS2JZWWsqapC1W4BZaADqjBLQC/F8f?=
 =?us-ascii?Q?bM07gqQj/iTNVWrDekkL9aTJPqYminIT2+lEs/aqIWoPeEEivD9bFmhl1KMc?=
 =?us-ascii?Q?1MQwk16PkbnvpXPEbMvxC+vDRFNmQIsyzcM1/hjVlnuBOQwxyF/O7Nwo3H0C?=
 =?us-ascii?Q?n9agKThXXCDbvPGuNoka0t43JFGUkw7YFX99W4XzdyTLpL6GLSNmESJ6Y92Z?=
 =?us-ascii?Q?SUbG8OwttbxTGhN2fzOnZROAxhjgsT4gLPTnc4iK35PBH8eRe69h4Oyj+41P?=
 =?us-ascii?Q?u6xROt+cULqzce3B0oqLIY7OdHrJShOSRmxsq1NfgoUUpiDOBHTaMEPsJJIp?=
 =?us-ascii?Q?ixfnDt0kFyuB/aUNtX73j3RW2+yxSuEczSvzy6qngnU+2MmHfef5bocqm8c8?=
 =?us-ascii?Q?xcrqcgdSnllOdXRVWbykA6iacJmXAZf/CpCd34f5Cei043AzBIhoOoUp7o//?=
 =?us-ascii?Q?RJZKR1xAUr30Eg1tTsvkP81EmeGAWD9ErqVE0E7d1bGMERa32he+/erUtcLl?=
 =?us-ascii?Q?k0ojDXN769ZQTHjhinB+1daKhIFg4mwJTAsfPO5WECqpJtysMeogDclTTa0r?=
 =?us-ascii?Q?ASKXXRVTWnBZ3P99vI8RlFSOHtVHekQmeBGX9Qi2/HXoCGB8zsHOBovvmobt?=
 =?us-ascii?Q?wFaUJSJ1g7NTkiQDLg+0+4y4ePWCdnj9JD5nrs0PPoi7LvQKyNckDyl3FXs8?=
 =?us-ascii?Q?IaBtCaR2Yx7t48OsqBexwpdYs0O4LsqzOsqsQXkm0s5mwlwxvG2sofeLzF55?=
 =?us-ascii?Q?pjVN6pzFzJftbDoqy+ZorzM/l2KMh4PrmFCVUk6k3h/V7q1wC8E9elz2vr59?=
 =?us-ascii?Q?aCxNUjErzMtdIrEL3k3l0Oe79ehor7+fxk9oWKZjg8ibLhQaw5PDBMTDxq2v?=
 =?us-ascii?Q?Do2VnpkynSXJsfruMVjel7sd?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c20da90-dd9e-4e83-50a9-08d8e589bdf5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2021 19:05:03.7233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXzev4FQU1fbQxNGX/bASYV74smY4aREy6F4nSPK9kVyC+620Dhwfa/gpWuvritiNyKyCsjXJ1J0j0ztgwPFRWfzfYHCD6ZXII7nFe4sMiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4781
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9921
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120140
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9921
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103120140
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=elena.ufimtseva@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 Jagannathan Raman <jag.raman@oracle.com>, quintela@redhat.com,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, pbonzini@redhat.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 01:30:24PM +0100, Thomas Huth wrote:
> On 29/01/2021 17.46, Jagannathan Raman wrote:
> > Hi,
> > 
> > This is the v21 of the patchset. This version has the following changes:
> > 
> > [PATCH v18 08/20] io: add qio_channel_readv_full_all_eof &
> >                 qio_channel_readv_full_all helpers
> >    - Separates out the error handling for (len = 0) & (len < 0)
> >    - (len = 0) does not necessarily mean EOF. It could also be
> >      a case where only FDs are read, without any data with more data
> >      possibly on the way. Addresses this scenario as well, as was
> >      pointed out in the feedback from last time.
> > 
> > To touch upon the history of this project, we posted the Proof Of Concept
> > patches before the BoF session in 2018. Subsequently, we have posted 20
> > versions on the qemu-devel mailing list. You can find them by following
> > the links below ([1] - [20]). Following people contributed to the design and
> > implementation of this project:
> > Jagannathan Raman <jag.raman@oracle.com>
> > Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > John G Johnson <john.g.johnson@oracle.com>
> > Stefan Hajnoczi <stefanha@redhat.com>
> > Konrad Wilk <konrad.wilk@oracle.com>
> > Kanth Ghatraju <kanth.ghatraju@oracle.com>
> > 
> > We would like to thank you for your feedback in the
> > design and implementation of this project. Qemu wiki page:
> > https://wiki.qemu.org/Features/MultiProcessQEMU
> > 
> > For the full concept writeup about QEMU multi-process, please
> > refer to docs/devel/qemu-multiprocess.rst. Also, see
> > docs/qemu-multiprocess.txt for usage information.
> 
>  Hi!
> 
> FWIW, the x-remote machine can be used to crash QEMU:
> 
> $ ./qemu-system-i386 -machine x-remote -device piix3-ide
> Segmentation fault (core dumped)
> 
> ... discovered with the scripts/device-crash-test script.
>

Thank you Thomas,

We will have the patch shortly.


Elena
>  Thomas
> 

