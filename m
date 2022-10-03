Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C65F39B5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 01:18:52 +0200 (CEST)
Received: from localhost ([::1]:35174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofUi3-0003kR-40
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 19:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ofUcx-0000aX-VB
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:13:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venu.busireddy@oracle.com>)
 id 1ofUcr-0003g3-BT
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 19:13:34 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 293MOFLQ007860;
 Mon, 3 Oct 2022 23:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=mlT8DpWMMcrLylpVanmiAt9grDqDh4a+2mMoK8jGZ5Q=;
 b=P7VhKtJNPG/4nEBu2FvHVa0Antn/PrZ1Kmw8y2nf1Ijb2tVhSAWcQcsFd7go5flSK3WL
 vBBLFad6RkzjGa2+1QWwU5AV3YAfhPRQz4/MhmkWm/CiIFiZ1Kncdtn64a+lK2N+MA72
 RrsmrtyvHDC74hFTFjaeiIcOgcdCQv+ljBQaBC31zUWeyV9YcwEAeqpRl5tJCoWfVmps
 EtBT4bMpTisrUfZJBScSG8OaY74wMe7sf995d5jsMQt1zqOdq/hNV9r3FOnJ7IQIltHb
 RHb0l1td4ojrV458uChI+pLlhqL3MW1rRmqbdMqr3pZlRp4znFx9VEwqlvFeDQqhQ4JD RA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jxcb2n1w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Oct 2022 23:13:14 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 293LSAK5014835; Mon, 3 Oct 2022 23:13:12 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3jxc046b9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 03 Oct 2022 23:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxYisRNrY5aArgjZIM8W6Sdth1HeU05UIa6MNi49Fidcrx1CtPNp8o2jyg5k1LOQZzFJf18zUUXTpxpsVFpKH7LSg2mlHydk2iJr61f2RZYthjOByWw5HojdSy2bNjzagX3CG+AYFE8rcUU7/mqdL+LpZWP5JO5NDOiacC7GCng4czxpX2+sW6g/JF+n06YrLlm8JoWfurEHlEBQ8a6s27rh2hcg1P5ZF13a8RPT08f61Gc+TaG6HFwLazOUjLyOYdJ8D4PLUbH5VacHn02wiQeYJeo/vzBOlpCdJDqMpt+8yXq1E8nPK8Exk+UCmweVFEjw8aHqa2c7phh4IsIQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlT8DpWMMcrLylpVanmiAt9grDqDh4a+2mMoK8jGZ5Q=;
 b=MKeFRuAQiUe2lRet4cUpRfOS+218/iAk1ca2TSJwbD3T+BSFBJVqOgqG5TjkhTKNpTqaJZBWta7/2EONWCT9pf/n3EPLHHw6cT3b+9QnJEZOGzODBHyRZKWihn01T2DNA0oHL7admha5aQ2ZX3FhsPyIIpIaLiK9KONKimyUgl+HzsqzzDrzfe1mee47DKNTTRDGoqhsIQ/CX4FQtXAsshDP7xKCT16+RYd8tOqSW9ppiEK1xEwuh6r/Ww/04VKMdxwkbBANEy8U8JXBpYEIsvmx0RWaJ1koRygMVHBIzDtOPYyPLqwvk+G9Wv+6KPqnhzETD8ayq2x95Iw3WyHs9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlT8DpWMMcrLylpVanmiAt9grDqDh4a+2mMoK8jGZ5Q=;
 b=njCiD+bVXsIh5JlblA0V+Vwwdp57QF7Fs3mXEKyAShO/GvYeLt1hmBBEkN/c/Ozk5f2UzQnz72sz394nhqfKyypFw0gyQgcsWSD1OtVyW92oUWfRzRuiD57y2/q8WbjA51ltbkdTBCjAcY6aTZiLMNY+JCn2ztTUHQ5hybRVnro=
Received: from SN6PR10MB2576.namprd10.prod.outlook.com (2603:10b6:805:44::15)
 by PH0PR10MB4422.namprd10.prod.outlook.com (2603:10b6:510:38::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 23:13:10 +0000
Received: from SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4]) by SN6PR10MB2576.namprd10.prod.outlook.com
 ([fe80::8701:4505:8274:afd4%6]) with mapi id 15.20.5676.030; Mon, 3 Oct 2022
 23:13:10 +0000
Date: Mon, 3 Oct 2022 18:13:06 -0500
From: Venu Busireddy <venu.busireddy@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
Message-ID: <YztsgiapfWC78BG+@lt>
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
 <YzcAK23fRnohvXNT@lt>
 <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::16) To SN6PR10MB2576.namprd10.prod.outlook.com
 (2603:10b6:805:44::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB2576:EE_|PH0PR10MB4422:EE_
X-MS-Office365-Filtering-Correlation-Id: 51afb026-4c7e-4653-9902-08daa594d690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/kux+FNpgxg20QUYjWN6RbZEygN9JHvPAoOsH3b9TOIWlljcH/oF0GCYH48V4xT36WXzty3aYD/2P30D2lAtiQgDy9PMH0qvF6V/ACLmgQe01aNsUaTLFSzsB2NMIxlrflHGvCKoFidqWlJgOmAdZTjM7TkISXKFX5zMI8JQBqOtpyJSIdNdIxgRXfCjD18R84W/c9jHkBywRhFvQciwVmvxt6QMIsgmSLMig3qUAj0e3N9N1F/3xUPf3K7XdDK6ZztTnSDjv2XOoLFzyjvtFEO7Gw+07DoAIg+c4lSO/cEiXnLkH1Y3rDTNYlKWgSojnKDPfDHiXq0wJDhjSW3TGvPowp9vsaqNU/B/l16hnYzfV2cTMrHt/NxfrrRWAMpi3N5QNGyReaL3CftTbZR5sx1dAB8XvltJatsXJZ7hTGUEVBRJAfIutyKHlfgdVV6Yu3IucUqg+HHBKgNF+B9OQsJm5FGZq57i+8Nj8wnHBFrZ2bjc4gh+cfX7bZJwqpTAjeHqeJ6LiZvjDfuOsntULEzkBCBbjOL3fb8bxO7ZalwRfIOhyKGUqJX5oCGm7nGkcaJlktQIr0BfbRd7Nd1QVkZV5g1Z7JBoD69G8wbEkbiea059ZkWrsGVz6kEap0KzIbw0K+hm7OIjmVyn5XIidvrVifSRXlvzoYnqI4YkmD8QGBJxVJdUMqKP/OxZwpj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR10MB2576.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(346002)(376002)(396003)(366004)(136003)(451199015)(2906002)(38100700002)(33716001)(478600001)(8676002)(4326008)(6916009)(54906003)(6666004)(86362001)(6486002)(66476007)(66556008)(66946007)(316002)(6512007)(9686003)(5660300002)(26005)(8936002)(44832011)(6506007)(41300700001)(53546011)(83380400001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MdgZaeduQmM7BMFm63R5hyL2mfZ27GIk3wMrCZW5UT046ZCwHA3kQxpLLey1?=
 =?us-ascii?Q?g545y4aOumF4kC0cdgkcolN+y01fVXb9yOJ3tDz8QMjsI1top+6HgkH2zBK5?=
 =?us-ascii?Q?9oxHKGbEgwXI21S8X3qwFWKTWL2uTYFV4o6xNn4eXEEJSIoI8TsBi1gB689d?=
 =?us-ascii?Q?yDqa0+Mbb9Kz4vyN2XmoxTBVd3VBffUAVyDdxkYmk/77r2BF5LyPE70l2BLs?=
 =?us-ascii?Q?5rA1fa930km8u4baFck0+7DLqooI8QfXMYK064AksZX1aw0q96qFynbUsXvM?=
 =?us-ascii?Q?z3Dvgv1MbQVwDK1kce421z5zscAqDkjr1WvjQSm+P6mCLbNTbfyrHtybTPOU?=
 =?us-ascii?Q?ftCX2OHuYIqBUpuRuZ7frlePinJOFteFjBJg5PX/n+XjYjAt3X5risw1toNR?=
 =?us-ascii?Q?SoTtcrYWdL4lnAR19yBScXOm/Ul8K1xo0epE4e0H9I17je9ugpTXnWXmL53r?=
 =?us-ascii?Q?ifWkto0BLMU23p/gsl8z8WGkVsDsgY3WJ8SjyB5wl7BK8nIhQogDACA3zyHA?=
 =?us-ascii?Q?pb/bMgY7K7547TAiD4977/PAG/wM+zHbA2XVn/v+uBGKwIJNn06fAznWpDBb?=
 =?us-ascii?Q?f9GxjRNrQmMK0LsxTEoiZt7BwqZaKF/FvV1xvV6K1ZTUrlgjCN2mFTZisnQG?=
 =?us-ascii?Q?B9sdAYTOg/gxetwiC2NEzn5UQ3txV7pTVWW3hx3hlj+olHuHc3X/6iD51kRT?=
 =?us-ascii?Q?/bZi8qLG/2DKVjPQrS+NEvz+H9qQ6H5+5VmAvLpcPX2TL+4fPnElUHyRfsas?=
 =?us-ascii?Q?AvxMNG8YVKjDfmMF8FUiM7hyGmUKQA9C+8tW6eeq+zluuHv6CP1/UfUFXFY8?=
 =?us-ascii?Q?r6wRCAtgFliuprAjX05ERFO4FVRwQI7OIJy+jZ0tumG3LMOlxG02yAfWsHMi?=
 =?us-ascii?Q?J3nWwl6IyylllYAT0cWWqSgMtBX8jRljNijUUQW8unlimlGe+KvbxpkZUeGH?=
 =?us-ascii?Q?11Ut/8LWTzmTZw8jWvq5RTYQ5YBPNAt4tzgJRX0gNwW7NVNa/XdrRjhWokud?=
 =?us-ascii?Q?vzU1OtMG0ATvgox7VFo7zJQ5BR1ZDSC/8lPZifwLlL5w87Q0b0jXg9PZ7pDH?=
 =?us-ascii?Q?x9V7ZcAQLwSzRLB0WK38b4acbXrJ4KesrI7lY2tKYGcHRAH/iobmWcJ5M56H?=
 =?us-ascii?Q?/rDjbq7ZGhQTi3LpSb06b5tmDkD/IhPynNI+bj+bRjM2H0k3olhTptZMKnLE?=
 =?us-ascii?Q?4kXZ298lbP7Gl7cdU3xkWtWse6PTAKwIDe2/vvD+5ajDmh+rmGI+wz3e0+4j?=
 =?us-ascii?Q?fNtz/wkDWiW/X7izteLuwKlULc9lFbk5JQ9WD+/JxtS7+1a8cLuL7eWrIROQ?=
 =?us-ascii?Q?24utH0/Xyfm8D0LYNqOk1CHYTxlbpcYFwunOyrJ39cA76gFx4IPSCUWXIZW0?=
 =?us-ascii?Q?luLVaouhylPYOsKCC5v3+H5J3piP1q6Vj6t0WACKsukf/HO0i8UK/ztTYpCD?=
 =?us-ascii?Q?25dRrp2YYf1h9yducTsIaXBU2Eu9zji1E+NjN4f5AXQCwcFecTa5HrDMot3o?=
 =?us-ascii?Q?Q4oimPeJi+i71EmRs1PzNpziJZBSPKwlMPRX38Py/vYRws+L4yZbfrEhzabW?=
 =?us-ascii?Q?3NkADLjCddwkQzXxA44XN/nAujfa5Kdy80GKN0zhfzupbNKKIz7xSvLtI/Ra?=
 =?us-ascii?Q?lw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51afb026-4c7e-4653-9902-08daa594d690
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2576.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 23:13:10.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gner2GVXtE5JDiYq+xHyYsr46hsLs1UmNBO4Y/yo6sVCd+aI6Ki0CHAlcG+cwPDKEqIV/53DwFTs04WJ49pgM0bF/AmGsNmaPpSWxxxjTJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4422
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-03_02,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210030137
X-Proofpoint-GUID: 1hjb_x1Mbv1TnQSJAZuetwpQjSpbCho4
X-Proofpoint-ORIG-GUID: 1hjb_x1Mbv1TnQSJAZuetwpQjSpbCho4
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=venu.busireddy@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 2022-09-30 18:25:48 +0200, Paolo Bonzini wrote:
> On Fri, Sep 30, 2022 at 4:42 PM Venu Busireddy
> <venu.busireddy@oracle.com> wrote:
> > > > Immediately after a hotunplug event, qemu (without any action from
> > > > the guest) processes a REPORT_LUNS command on the lun 0 of the device
> > > > (haven't figured out what causes this).
> > >
> > > There is only one call to virtio_scsi_handle_cmd_req_prepare and it
> > > takes the command from the guest, are you sure it is without any
> > > action from the guest?
> >
> > I am sure, based on what I am observing. I am running the scsitrace
> > (scsitrace -n vtioscsi -v) command on the Solaris guest, and I see no
> > output there.
> 
> Do you have the sources to the driver and/or to the scsitrace dtrace

I do not have access to the source code. I am working on gaining access.

> script? Something must be putting the SCSI command in the queue.
> Perhaps the driver is doing so when it sees an event? And if it is
> bypassing the normal submission mechanism, the REPORT LUNS commands is
> hidden in scsitrac; that in turn retruns a unit attention and steals

While SAM does say "if a REPORT LUNS command enters the enabled command
state, the device server shall process the REPORT LUNS command and shall
not report any unit attention condition;," it also says that the unit
attention condition will not be cleared if the UA_INTLCK_CTRL is set to
10b or 11b in the "Control mode page."

It doesn't appear to me that virtio-scsi supports "Control mode pages."
Does it? If it doesn't, is the expected handling of REPORT LUNS command
be same as the case of UA_INTLCK_CTRL being set to 00b?

And while trying to understand this, and reading the code regarding
the handling of UA_INTLCK_CTRL, I ran across the following comment in
scsi_req_get_sense():

/*
 * FIXME: clearing unit attention conditions upon autosense should be done
 * only if the UA_INTLCK_CTRL field in the Control mode page is set to 00b
 * (SAM-5, 5.14).
 *
 * We assume UA_INTLCK_CTRL to be 00b for HBAs that support autosense, and
 * 10b for HBAs that do not support it (do not call scsi_req_get_sense).
 * Here we handle unit attention clearing for UA_INTLCK_CTRL == 00b.
 */

If virtio-scsi doesn't support "Control mode pages," why does the above
comment even say "assume UA_INTLCK_CTRL to be 00b" or address the case
of 10b? Also, other than the reference to it in the above comment,
UA_INTLCK_CTRL is not used anywhere else in the code. This comment
confused me. Is the comment just wrong, or am I missing something? I am
just trying to understand this better so that I am better prepared when
the client driver folks start asking me questions about the qemu support.

Venu

> it from the other commands such as TEST UNIT READY, but that's a guest
> driver bug.
> 
> But QEMU cannot just return the unit attention twice. I would start
> with the patch to use the bus unit attention mechanism. It would be
> even better to have two unit tests that check the behavior prescribed
> by the standard: 1) UNIT ATTENTION from TEST UNIT READY immediately
> after a hotunplug notification; 2) no UNIT ATTENTION from REPORT LUNS
> and also no UNIT ATTENTION from a subsequent TEST UNIT READY command.
> Debugging the guest is a separate step.

