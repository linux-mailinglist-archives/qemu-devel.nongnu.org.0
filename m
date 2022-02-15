Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237D4B744C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:21:15 +0100 (CET)
Received: from localhost ([::1]:36708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2Ru-0004ek-74
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:21:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nK2P9-0001bF-0m
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:18:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:3274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1nK2P5-0003pn-R5
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 13:18:22 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FH3sRr003844; 
 Tue, 15 Feb 2022 18:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=k/sKwF73ta6E9gBzu+iImGf3CeMFitjnGbuTF5f7ROM=;
 b=f4GYWIDiHH88m2YsgBc+SVe2a1JDZ7lTR2TjFn0w+opzbHMT9bdJL2NrHay7ues2bslc
 Kx2A/7cLXPdJIgkaO/5tdEchZEULyRKRbEMH+gB/oPIg1ONTyeK6+up2Ey/3WtXem1DM
 TFkvsWPgxgF/Yt5VM1u1FJbXP051fh3Dt+3cc3lpYHYe7FPi8ad8zgruwFJ9Wxe0lb1B
 RE0W8FyQC126GwgHgob6BTROuBOCxQi7Ac0NZ9NRlj2oztZBl9rC7VCXXbN38Ti+rFAR
 BeGT53uRBe1AiBtT4G0fAUjaNw70W/x+QNcjaco7G+lTQn4ZQhs+cDWH3Kfmr9IXcn+1 hA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e88hghtq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 18:18:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FIAUUW040750;
 Tue, 15 Feb 2022 18:18:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3e62xf1tre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 18:18:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2PfNphhAhSOSQzoaMGf38I7DtnCHB8V66ejnwMmaS0HQdYV7NzkA9Cwc9p0r637toDRbhYVKHcDiQkjBSObrROtLayxcBOGtSuvuGl3o9NUq+9JyFcqhdjK16z/rTkpJorqghK7AnQ4NvfIQ17OD1A6l3uPMEgqBt+FlaJ6MF9/Ks8D1KYAB2ZQTeqkhJ4WADR6qevO+W7yB47c7IO5ub/zED9XDgCjOBH++UIXWmVWmdX0qaXRYxJq1y2/0DbUVsaWuneCYatmIwQHGvBzPHuxzivq3XJs/QQbbs9b/qD57W4sNbznvAMWmGbpiuFuUldfnJy3MoDtztFcXknw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/sKwF73ta6E9gBzu+iImGf3CeMFitjnGbuTF5f7ROM=;
 b=ccawltEEsBEKx5uPgQGlsx9WEfTod/OtfCOzH8JI+HlINhIf6/8wA1Mtoh9SaEir9jwp/B+QZSEqI+NL2/zUVYtqAV5rNRRU+AWXq/9cnZVwme5VSeHNqRvhzAvvtX9oA83PdsUdSNSgNpyHedAcvmYA3jVYfHLXv+gD2EhSIlYO++oDdcxhkpGEJUDyfhFM/GyVcbiTtekxJeEPgzrk9m8K/p1CJa6qUf5hv5Y4XZbM+wqpJh98KMI4ZTxeFjCqNsTEJepbyWJW77jxTawWqlqyX/GeX2vtEwSOgdm77ncz1CxnG4GyH/avaLD9RC8n/QdPGSWt0NTJjeqP73p7xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/sKwF73ta6E9gBzu+iImGf3CeMFitjnGbuTF5f7ROM=;
 b=MxNdbLgJjfBR/BZtRWw26ly1uiKrVzHumheW8CAIWpEVr4TaF8aZK+vNJdSPSDl0kznc2dgfizZ6YzTLK+vvJ4d9xy5EDDDZN9eXGWrw4N7U3T/rwMvnDTHKd3uHpIsYVRqTXvphbdbV/pR7Yw2ObK0Z738kZ4FIT/KNGb522E8=
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB5803.namprd10.prod.outlook.com (2603:10b6:a03:427::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 15 Feb
 2022 18:18:15 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::4bd:1cfa:5aee:6c81%3]) with mapi id 15.20.4995.015; Tue, 15 Feb 2022
 18:18:15 +0000
Date: Tue, 15 Feb 2022 10:18:12 -0800
From: Elena <elena.ufimtseva@oracle.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC 4/8] ioregionfd: Introduce IORegionDFObject type
Message-ID: <20220215181812.GB33858@nuker>
References: <cover.1644302411.git.elena.ufimtseva@oracle.com>
 <fa5bc2e2773966fd209a2c866eb95ac8ac60a928.1644302411.git.elena.ufimtseva@oracle.com>
 <YgppIUOpkYUKwB5K@stefanha-x1.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgppIUOpkYUKwB5K@stefanha-x1.localdomain>
X-ClientProxiedBy: BY5PR17CA0061.namprd17.prod.outlook.com
 (2603:10b6:a03:167::38) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7fb2f0b-4cbe-425f-3f96-08d9f0af88b2
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5803:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB58030143C30BA27ED446FF518C349@SJ0PR10MB5803.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLrsvKjDNuxSFEQfCxMwyvqaotxJR+AZ1AAEv9Dc4FyepqmDp0aaMe5AIiQMMbyFF72TrSeoxQFnVl/0ZSSmIrMAIH/8JULw9PtDNwrxb8dkj3PgcGnoSCu/GmM/l0u9ycF22NZ503qnl8fq5sGk5uhUnDKc4a9ZK3QLpR1/4A+4f8jgnZIjrx11fgzKOv2rbw2JuBv3U2MFyfovjk3FGchEgAyUY7nhgogv3joAPONLtRpDCheT1Eb1QATipId5DcYVnVFsM7n1t+m3EuwveM/ElbD/JIk56rjhNk57XBrqVs2B36FaLVsT/cUMMyuEAiOyPzziy9OnLmfCqCjAtWMhH/v4RZ9fVh3VDx/83ITLQVs5SFGxdbIy2GYFD7jcPs2MepaWtNkk//Lajo5zar240N0du/tCxYmPIt9f1WZC5yBBJfC/cx3Tll+yUImulP90Au0SSpzzrZdNyGGDqCbFvqMr1a98/sqUD5Ue53zUQUvWpZkNKCN1q92Gs66NO75qq1I1baoWxRWK5sQzlY9dmiTBhzNKkpCt7xuBIGWhLly06MkSLe1Pl+gApoYIdPYlAc2Vv8bpLcRG8dgftWI+njQlJkzkFffoeljaaALVwsZqN8DNpCXGT7c+LJ2/1NCybfV258L0438SGX0MZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(2906002)(33656002)(186003)(4326008)(38100700002)(83380400001)(8936002)(1076003)(5660300002)(8676002)(6486002)(86362001)(6666004)(316002)(66556008)(66476007)(7416002)(508600001)(52116002)(6506007)(6512007)(66946007)(6916009)(33716001)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EX6covhPJvIoT5TW+fSaal6yJ2HSTxeC3V0G7/pJZhCw4es0J69hKWJlEirw?=
 =?us-ascii?Q?nXdhYxG0O4kw/i136itPQwE/Vkv6e3WuS4ynQfxUwVboflvR0TqCEjEIIEqr?=
 =?us-ascii?Q?zOUeja1r7MXKcIx+FivliI95WlI7EFnaKezpmX1aWgadAJX3LQlj56LJZ3Er?=
 =?us-ascii?Q?qwWc8UDTu1AEeA2sK77uuXwErgVvWZzgS7ElBKXbP30SBnYarhLADRPeuUNe?=
 =?us-ascii?Q?Q3l6ZcA3ALuge8lfKmQrw2Oyle0lTIKb15hf7YpZmqYw2IrGIywTsB4vaFmW?=
 =?us-ascii?Q?FmX6plahcBJr0f6oDqyxY67+LtB5VfYbOcZoXDa2ikfILNngdpEvfJdo6q/p?=
 =?us-ascii?Q?pDYqBVQYa3VaPpFnUcr4V2DsTJTixHJb6+bVSyqo1xGuUZxW9Gp/DEXA8Ulc?=
 =?us-ascii?Q?CqI74YgcToC+Eak/2VaflWP7VfPV5n3tKw9grmZbHwBS0DUJGk0lMkmTubZC?=
 =?us-ascii?Q?FksOywLjjvg3sNCy/239rf1G7nst3rUZi54mLJ7P2+I1zQ8+Rv6ep0ZEu6Eo?=
 =?us-ascii?Q?l8Xkru4EYg6i6fNnyLcb+7Pb5lQNsb29xKJnsRtgSbPSEayipsEeL8tzul3L?=
 =?us-ascii?Q?6ZI6YUaXyiVzq8Ii7CxmHgRqRAbZscBNQCvUq2WlG7sXBvieO6DBg4FGt1Ed?=
 =?us-ascii?Q?rmmQZbbOn0L0B019U/NRMBgQjGzAqrQ5ocak3rdvDABuouVxzom58gDLmIpL?=
 =?us-ascii?Q?A0OhOMGa6TclUEud/CtbT1o2xXMceC2d1wGtocnqboCus6Ha/Pe3SiqjZU3a?=
 =?us-ascii?Q?FI4hDv6sjd8/McJw5L7e0vewqjyND2sajeGMZpmoEPKLS/hCps40n6T8fm0s?=
 =?us-ascii?Q?SpJcH1KhRrPBAQPY+09gNyCT0+quWN/h0Bxf5NjC2ygeDx5k9v26S/pj+WYT?=
 =?us-ascii?Q?YEH+wq1RfNotWstQF7VPA4Hsg10fnAoBzTQiUBr0SKCffumbKbr3uy9qJoA/?=
 =?us-ascii?Q?7nmDC8g+otzuNYFFQXxa5v3YH18DbOjhyskZIPFigA0X6n+TeGx7wCbhgDiJ?=
 =?us-ascii?Q?asjrN3y4IsZiBGUMmWPpJCQb1EdJsfoAVNCfnTOMHlLdQWHPpMxiaHnC4Wf0?=
 =?us-ascii?Q?OwAY0G7huQZ+nuHpwvgaFjFxg8XzF+6dGSGwCBXCWWUpxfLaV6BjJheaci6Q?=
 =?us-ascii?Q?jI9o5cDBCTwxNs8yYVtmUble5nKuy6NhPrbeaRzM+/pcE44CAMRzLB3UUPcs?=
 =?us-ascii?Q?D+V5Gwf172oaSJiA8PV/ehC8lhe4iydiwLnzHew8NnHwxXY5Z9Svwaz0qIzU?=
 =?us-ascii?Q?x811gj9xcf/vo3GbptDPCDUzinNV665Sj6qKHKLMeNBsoh8jQ7pLW7uq5PcL?=
 =?us-ascii?Q?9+vFXbL8IC4s9KuDzhmZfPR5W319Px8iCoY09GtC5fTGtG2sR5XyGzl2cOtm?=
 =?us-ascii?Q?93vSPauly7fw/LsDhbpXhcLe+5r0R5EN+IUaj56Kf29F9WKbKT4x3tlChNC2?=
 =?us-ascii?Q?gTiQXyKo/ZgxBsHm9021B3EMH14Bz8vI8x0KIpKlQluzdQ2LZp8GzXn6EtPI?=
 =?us-ascii?Q?YXD8Mb+D4VZyRmmkrw66s4KUDXbIUwTMZWJZs1N4fOh3SeJfu5CsVtVbRrCZ?=
 =?us-ascii?Q?zGHlifa8IUPJtCGWXUg1x6f2IGX1UOGzs3mr4ZHWYA92N/vnHdiky6+KeIQl?=
 =?us-ascii?Q?y4hGHM6IamsEyTsF5TVWU+me5Cqk5RKF1EggbyVbUEhxi6wBgrXbpOFGZT+z?=
 =?us-ascii?Q?r9mOQGpUjlTqPvhfE2zlrfGe+bXni/fpHXKkKFwEPn7zIPevAeVrDuXfTt7d?=
 =?us-ascii?Q?/+yhoKVd+w=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fb2f0b-4cbe-425f-3f96-08d9f0af88b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 18:18:15.4993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bM8pt4UMNtoR9GoohcsERHyw54olJwyZWn90olnbMua/rp66txJJ4xS+heajjnCpHU2HqjORsugSyeluh9FQry5aSE+8BAOFMR5zTlCcepw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5803
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150106
X-Proofpoint-GUID: hPlZVr-K7C8jJb5T4yAOdXYGysYiNwN5
X-Proofpoint-ORIG-GUID: hPlZVr-K7C8jJb5T4yAOdXYGysYiNwN5
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, john.g.johnson@oracle.com, cohuck@redhat.com,
 jag.raman@oracle.com, john.levon@nutanix.com, eblake@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com, armbru@redhat.com,
 mst@redhat.com, berrange@redhat.com, pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 02:37:21PM +0000, Stefan Hajnoczi wrote:
> On Mon, Feb 07, 2022 at 11:22:18PM -0800, Elena Ufimtseva wrote:
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > ---
> >  meson.build                    |  15 ++-
> >  qapi/qom.json                  |  32 +++++-
> >  include/hw/remote/ioregionfd.h |  40 +++++++
> >  hw/remote/ioregionfd.c         | 196 +++++++++++++++++++++++++++++++++
> >  Kconfig.host                   |   3 +
> >  MAINTAINERS                    |   2 +
> >  hw/remote/Kconfig              |   4 +
> >  hw/remote/meson.build          |   1 +
> >  meson_options.txt              |   2 +
> >  scripts/meson-buildoptions.sh  |   3 +
> >  10 files changed, 294 insertions(+), 4 deletions(-)
> >  create mode 100644 include/hw/remote/ioregionfd.h
> >  create mode 100644 hw/remote/ioregionfd.c
> > 
> > diff --git a/meson.build b/meson.build
> > index 96de1a6ef9..6483e754bd 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -258,6 +258,17 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
> >  endif
> >  multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
> >  
> > +# TODO: drop this limitation
> 
> What is the reason for the limitation?
>

The idea is to limit use of this acceleration until the API is more
generic and does not need mutliprocess.

> > +if not multiprocess_allowed and not get_option('ioregionfd').disabled()
> > +  error('To enable ioregiofd support, enable mutliprocess option.')
> 
> s/ioregiofd/ioregionfd/
!

Thanks Stefan!



