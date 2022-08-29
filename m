Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A25A535E
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 19:40:46 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSikf-0002Lq-Fm
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 13:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSigi-0007VJ-A5; Mon, 29 Aug 2022 13:36:40 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1oSigf-00060B-Ie; Mon, 29 Aug 2022 13:36:39 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TGiNY1019780;
 Mon, 29 Aug 2022 17:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=nVXurOdq8mGHUj9W39yS4+K995/3jpRzMrKhUiStQ6s=;
 b=VTdEo9G0+iyg8MVXNkOcDIsnrfWmNKB2ZtR5vOaHS0RjHZTj7LuCx9roVUBCsC8ditnd
 ul6iWoCMf1B+bHljAni/5CpMWFL2t0KlGNIYW2sTtaWj945tXdc3i5hvhurc5lfmRkMO
 cBXoL1b/PrPz8YvTqQhbX99PNEm9r/My+kpw/fw5rmD18Fv2NcoKsa7sjXZOcN79F54N
 nywiXOb6sTGIlMJg2+CXvCX14OgE0JnBEBV6bvWIMUeOJGOLod3PKkcox4A2bvcQda+e
 RmDT009b0GWVtWfjin0WxmzxWxoB816cS4gBaX8VMhyLK+47yeEQCwqellKbrL+Y9Z0E oA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j79v0m3vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 17:36:33 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27TFo1Gm003211; Mon, 29 Aug 2022 17:36:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j79q2ygk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 17:36:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGtGeWjb/b4x+WtjlqN2ZZ3NLpg0fbGb8jNCjEr48T4/z6XySTJYXV2Z16tArYKsnOyZzKQKqK8nSeoXZ3P6ko4SAb144TdMWBy8MaUMUpRCpCiyHWFM6tpN5BM9DEtHNCMdKV8xNtyEtEcTliGPklNZupT6hyYro9msozrC+u2+8Lsx76vTrZDZAaqGKfEXLzBYphEU4oX3Go658aOxawXi+kpbJeZ2OerDnMJ2Q//zuxTEzLGOFtnvnFXcyFZ9VvecxuypfZxm6tXYc+SvCqzszrP+J0IOEOQzsfHbIgu3VSkVMimB8cwC9mcRM8vQXixWKCpPUpOB7bLiC1uxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVXurOdq8mGHUj9W39yS4+K995/3jpRzMrKhUiStQ6s=;
 b=Y5RjxYJfaN6T/j/A6NGzxk+xutFMzclGIYXNW7Pd6yVvlUi0zHKXSCFOG1hAV7mrslvYBRowrB6BWXpArVi2IlBYbAb0A35j858U32fVv+ikuMy27ijx3oN71x+4zCnOfk+qBNyqXakIANYLCPdN12G1JKzFm5/XNnAqhPtTYYz8llC7dQ+gMyUTXf7hIr6nl7ALtXJu98HyAMhUXqaYOaMEHaNVFTqqpPLn44D51GybDKJ1HXQgcttDgdTXfBU7Q08rbr/PPl1UmmuDHsKQV4fVo5MTS0vQs+DTcEyYpz2RJAumt+RC28pxLUidGzBCAPJFL/+nOSeTuE3ITVpWzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVXurOdq8mGHUj9W39yS4+K995/3jpRzMrKhUiStQ6s=;
 b=T4I6bjWy2WG+Cc3l9oOy0WGiGebBghj2kCead+8ZJRR8QnV2QPy+sXJlQB9eNHy6scQJprhYdnwwq3h1BrD2MGRXiHcCuEoVZ03WVndzjgUZ1GLug4ZBOP9v7tWQnE7iIZWep/TCF7AI1qWBeWbbhU4Czm7JEr5/N7L7JapUntU=
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by MWHPR10MB1517.namprd10.prod.outlook.com (2603:10b6:300:23::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Mon, 29 Aug
 2022 17:36:30 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::95ab:eb8e:a0a7:3f0d%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 17:36:30 +0000
Subject: Re: [PATCH 1/1] monitor/hmp: print trace as option in help for log
 command
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: dgilbert@redhat.com, joe.jin@oracle.com
References: <20220829100447.1530-1-dongli.zhang@oracle.com>
Message-ID: <b5244f97-fbef-49d3-afac-1baa680b538e@oracle.com>
Date: Mon, 29 Aug 2022 10:36:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20220829100447.1530-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:805:ca::22) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89ca254d-d87d-4fcc-f76d-08da89e501c5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1517:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L9bzhtaTkaktmu3HhCHA/CUQE6DNujryf66XO1CvJhjyf03isYjn8sJ6UYxi0810RDnCWYIVoRPqSyeLDMfPsUd9xFC2xydk+iS9HmmfVwoFjNTSgvToikqjc9cFxVyRAPKPNg/l+07CPbOrBIbI5eHWdCU7KSs20tirD0GOW8s96K5LrSVF0wjueD8zQrKEat9o88qz2exyom4Ayg8hIo9jYTyhxo+pdFjMrEEHTTcRu28BuF6l2rMP/r+vrHltmH/dO6WhVe9e2lBGZkhbFdEZTeh+4Ib7oXiz8qhFCAi/Jpa7gPDjtxQs6vWlNxE2JyZdK+EeL9CmAimrnmJVe1TQHt79EUYh17OvzlCFcIC57FFpL1ceCPX2wstQsbsDhB1FN7LM/RQUGhYPke8U+XCtTO1R8nSRvGjAHzSjZ4Q5YuRaGSD9wdk/89J+4ykLGCSs2gyKXOKG4NuqweMZ93re+lOR7LRFBvygAOaF7muUUmbGx35mt98bWFeOxOUz/7D72aNgJX6YT9KG+IWDi9okewE7fWy1zrPixZBsBFjWnuRtD3A6eMosfw9HrBKsUQtgi+cSbiLE2JjJuNFvUSdIQBvkLN5wZYbxqH6vQuHeI4vz8DcJbpygtClf5vgKChWAW5BpKSXuhf4bNAtbl0oY/LgMlwNKSh9YvUFasDEJ5Png2zGRR4ne4Yx3EqEA9PnZycmUzF4xFz52uI5RqMJRWSasApFd0cC+DfmIdZ0O8RikFytCsRY+Q8pjgjFBfytfOMlGXNEBiekW3csumOspnRd91+VjBYTmt4uPHoaElHN5vc2jtTrV64DN76Hq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(136003)(39860400002)(396003)(346002)(41300700001)(107886003)(53546011)(6506007)(478600001)(6512007)(6666004)(83380400001)(966005)(6486002)(186003)(2906002)(2616005)(66476007)(8936002)(44832011)(5660300002)(316002)(4326008)(66556008)(8676002)(66946007)(31686004)(86362001)(31696002)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YklRdUhIZ1krUWswbG9qcUgzS2t4Yk9QZmEzZlBhRHBPckNLaXhsTDJadnB5?=
 =?utf-8?B?SHczeWgvSGhDZUdFaDNKUnlmNnRkQzBhQndLK2J3RFE4MXczQjBRajZKelBz?=
 =?utf-8?B?UWRUOTNJNFRnVGFKN1BuNkJDd1k2QmdCZXJmeFNCQWxUeWoxZWJna29MaGlB?=
 =?utf-8?B?Z3gyVkV1L056aWh0WTZSQlc2VkJnc3FhYjBMNk80dFNHYmg0U3lBcTlDVk13?=
 =?utf-8?B?V1J4RFY0QWl6N2sxRytTaHZJRGJpR2k0L2o3c3o3Rk5NZlBXSG1RNGd4NmVG?=
 =?utf-8?B?TTg0RTI2eVQzOTlRZ2ttKzRGL21lNC9wbDlUeXFrU1BRMU5BTnNuWkk3cWts?=
 =?utf-8?B?VUNpQzZiNWV4d0ljc3NaWUliYmwya1IwdklKMzVhcGNVWVJtYTlhQkxJU0RT?=
 =?utf-8?B?QmYrbEg2UHJTb2ErUnIzR09RSGRYSHIxM29iUURhSU0xNzV5NFJ1Qzg0K213?=
 =?utf-8?B?ZmJ5RlNweTZybW83L0t1czBrMk9xbTJGVFVlYXp1NmJmWU9Xa3hjYnVFVkg1?=
 =?utf-8?B?QmZZaVVYZUVkdXIwWk1PalZqckRqSjAvVkowSys5bG1QakxoK1lIb0lHSFpM?=
 =?utf-8?B?cU1tNE45bEdHWEQ2RGNYWW9VQmRJbk9oeW15eEZMR2I3aDhqeUptUzl6U0F6?=
 =?utf-8?B?K1kxazhnbndpR290bUZEemkrODVhVHQxcDNlTFNWbGR3V2JxVnpBZkszZUpM?=
 =?utf-8?B?NW9Fd1pvNEdZcTUrS1RWeEhMVEZ5MTVBSStLWnJUb2t0RGZ1b2cxYnFROVR1?=
 =?utf-8?B?TEoxcW9MazZFNGZpRytERDRwZzg0U0dlNWhiUGxVZkZHMGNjcWN0VlROWEQz?=
 =?utf-8?B?TS9jZmRsMGlMREs1VjFNazlpcmZlV08rU25TMGx2NUVpVjdWb3ZLdU95THEr?=
 =?utf-8?B?MHFLSGtNS3ZrVHB6d0tYck50QlFKSXk2RjhxZFcwUWJRbnJOcTkzK1BTTXox?=
 =?utf-8?B?L3hBWGJFdjdVZUpkVHB3Kzd6YVlpbTM3TXdYb2Irc3M1NzBqRjg0MkxGQzN6?=
 =?utf-8?B?TlRjTEVZVzMyWVdaM2s0dHpQRjlLTjg4dEFCM1g2UlRmdVhWdDFuMEthM1U0?=
 =?utf-8?B?OGpZYkU5NGZzdTZUL1h4ODQyV1dZa05HSFQvR0doQ0FWa2J4OHpUZ1VXVFJI?=
 =?utf-8?B?R2N3YWZOa0R3TXlQS0NDSGFCYjJPamJVdXI3RkhIaXlzQlJabUJ2QTVvb2I1?=
 =?utf-8?B?ZkhVWWJuYktzRURpK2FtTFBCTUgzL1lGUnpJdVlVK2srMW5nWXByZk11aTVQ?=
 =?utf-8?B?QjByQ2tnbkJhQm9xOWhGU0ZMaGx4R3M1VmdrL0ZiM1lvYTY2ZDhYZFV5ZEpw?=
 =?utf-8?B?VWV3UDZTVWhEUjZGUENReVlwQVlVMjVwdndtSjErTjBQd2g5SGNabVdiRlcx?=
 =?utf-8?B?bDBmbGZaREhQOHZWZXc0VkJIc1Z2NkhtQkh2MVU5TG5vS0lvMXVuclJIVVF1?=
 =?utf-8?B?clFSWUovQmRobHp5K3ZuWmdqQlE2YWRkR2hQRkFnVXZ2Q01MaC9kUm9JWWU2?=
 =?utf-8?B?SkM5QVVES2RWWVpnZVNKY1NYbWVnakV6N1dyelU1OHRwcmtkQzdNcXV2UmRC?=
 =?utf-8?B?dVc2ejVaeExVRWxHSUNiNklkZEpwWmJFbUVKMUFVS3lXb1pTQWpQN1Fqc1Np?=
 =?utf-8?B?V0NQQWhYem8zYTFscEZJM0xHV2xaaVUwNmt2a1lIeXY2UUJnSmNDY1dkaUZv?=
 =?utf-8?B?RHA1RVNpd1NWcXFsR0VmWUxxdFU0QXJxMi9hc0UreDlYUTFhWGp2L3UxYzhr?=
 =?utf-8?B?UmhMeEVZYUxFSWlodEl2TDVyUmdhS0lHYWZWaGoxSjdVd0lGOXluWWRoYWZx?=
 =?utf-8?B?N2lEbExOVERHMzFYM2VxNDBCUXlDK3UydmVxcmxoeGZjUUpSNk9FNHR3RU9t?=
 =?utf-8?B?ZUZ5UnNQTWxJeHNGSjdTc1ZxczVZQnkyNDVLdHRYZFlqMmdKbzNBQkU1Nlpl?=
 =?utf-8?B?MnNUclBBVEk2VjlOY2tEVDJzWFVSZDBkd2x5aFRFUVVtMkdXL285RnI4aFc5?=
 =?utf-8?B?dEFvZVhnblEyeVFLai9oL0ZRYnkya2xrUVRZOFoxTGdKakh1NnVPVHFxbUlS?=
 =?utf-8?B?UWxiZnI0MTd1ZEpZVVV6a3NoQWhXTzhvY0hlMnJjRWIvMTUzT2c3L2l0bUx4?=
 =?utf-8?B?TXhucXcwYjIzWU91Ujd0QnprbUFpZG1lUlhhbk1HVkVhVU1tOGpuS3pDM2Q2?=
 =?utf-8?Q?qRJYy4iozw8f1Kj3jqvmxUY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ca254d-d87d-4fcc-f76d-08da89e501c5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 17:36:30.0832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ3A9XXAdQPQ9o5wbuHvDaq5zQLFRq0QDay16CqgBh0VsBA+hwT5LofUlvpG493FGDweUOp2ILYpGzvTii96og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1517
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_09,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290081
X-Proofpoint-GUID: sQyPUNEHQIVNQmxsAsCN8eGZgEX6oTQF
X-Proofpoint-ORIG-GUID: sQyPUNEHQIVNQmxsAsCN8eGZgEX6oTQF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Sorry that the format for "none" should be changed as well.

I have sent a v2:

https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg04445.html

Thank you very much!

Dongli Zhang

On 8/29/22 3:04 AM, Dongli Zhang wrote:
> The below is printed when printing help information in qemu-system-x86_64
> command line, and when CONFIG_TRACE_LOG is enabled:
> 
> $ qemu-system-x86_64 -d help
> ... ...
> trace:PATTERN   enable trace events
> 
> Use "-d trace:help" to get a list of trace events.
> 
> However, they are not printed in hmp "help log" command.
> 
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>  monitor/hmp.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 15ca047..9f48b70 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -287,8 +287,13 @@ void help_cmd(Monitor *mon, const char *name)
>              monitor_printf(mon, "Log items (comma separated):\n");
>              monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
>              for (item = qemu_log_items; item->mask != 0; item++) {
> -                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
> +                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
>              }
> +#ifdef CONFIG_TRACE_LOG
> +            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
> +            monitor_printf(mon, "\nUse \"info trace-events\" to get a list of "
> +                                "trace events.\n\n");
> +#endif
>              return;
>          }
>  
> 

