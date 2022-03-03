Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212B14CC252
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:10:43 +0100 (CET)
Received: from localhost ([::1]:59670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPo2M-0007Y6-6f
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:10:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnnw-0005iT-Jh
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:50 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nPnnt-0005dI-Of
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:55:47 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 223Eop3p003425; 
 Thu, 3 Mar 2022 15:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=B9WVGaVJnHgX9VPqVcbiveH77A5rb2utXv+MSUDNMHo=;
 b=QuOS6xpFjWzrK/VW4y0AGr32BFDymb/XDJR8YyrsQIwcnyRk8je4K10JfyffS4vF5RKe
 UgIE3yMkKXi36Wm2Gz9IzfhZ8PMfQkVs9eOExwBiR1ibPaW8h2C+srtcFHw+yXP6ZJgj
 hoxcMJffCA+XR59csWmGJQLLtdSyYdx4K/P78dmCZVl21phAP6b+ssEpQnd2Jp0eGNJY
 wYPvF1QJwC6IHtyORtNHJK/eBX+AfUexjoTEmen40tJegwSJLH9nbrMOvHy+laPSZGkp
 6mdOsqYbAV5coqJ7TTTtesV/GUlvV+FGRY0PJtQh4uuJmRLk/xyKL0vrfKiXuSh2Aowk vg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ehh2eq5j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 223FtQQN133968;
 Thu, 3 Mar 2022 15:55:28 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by userp3020.oracle.com with ESMTP id 3efdnswrd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Mar 2022 15:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPfXSeMg19zgXJ5joTamlq9DAwBkD4uLKo2gnvm4hCEhRTpUVOGJEapmtmxk++p86gUWL3E/oelnKr+LV/eB23nVFAaU+3gcCz9ncQYdRp87sXO1i9Xqi0c4X7+grZFruzVGeHfT30KXzg0t6+KhKBUe/nIexc73ApuO6vCM3Haqzr0BpLxBivnKK/nBV5o7uoaNB41U2bmuuDXiL+dXCPGqPY9cnMgkLenb6fQlTx8L0vpejeCh2T65Y3Zjs8SOA2oyPHBLFqI3KZ5WHijvwufGRpI8qtdaKQPHVUB4atKNOmQigVviocSCS57+7w0eRQie9Ky2gZYbMB8rEmYj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9WVGaVJnHgX9VPqVcbiveH77A5rb2utXv+MSUDNMHo=;
 b=N16DLeNXTcWrvybOpBNWq8AM3lkH0RzFp9l5VJz56bXnxVKx1kyifvB4AfUIL3++RDtxgAKq2IpBOBf9syKtzllhZ3QJAWJGKF2kYA90/7b153/dX+Nz6l3safpyoqIQys3wRtK+Z9VgeireE16Jjzc0X4a7jGLwoug5ADSC8Uf9ptfU2HHO9MC//1aOjZ4UJXiXnd6f1xsDvzwL8VFtkTyYNvHJpVTYE13tRGFxzI3+byqnAFjQzIRZvuWLRrrfZoOvMIkNJxnMt/vz14bdbMJEJXqS5ja9OYpMh298NgvHI28RJe+zfQnP7Bq920a0j0bsnFTreFWlgSYytU4rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9WVGaVJnHgX9VPqVcbiveH77A5rb2utXv+MSUDNMHo=;
 b=Kwz/Qd1dULMSVnTIS9OvrRlKzQScHvrV1gyAvsUzNkvjpqEhiHq7tU7LsqB65j2cL1+wSuprZn/EnMQDfnQk53Bhx80Z9yD+f0PB6+Ye7YxkfWeXLuQvIxp3+H5xpNU9hUVS+7UdBvZm8+LdVgjtVSfLovrOwI6cfPp7o7jVQdk=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by CY4PR1001MB2200.namprd10.prod.outlook.com (2603:10b6:910:3f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:55:20 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:55:20 +0000
Message-ID: <cccdf86a-b9f4-34bf-e851-b81db14b1d6e@oracle.com>
Date: Thu, 3 Mar 2022 10:55:16 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V7 10/29] machine: memfd-alloc option
Content-Language: en-US
To: Guoyi Tu <tugy@chinatelecom.cn>, qemu-devel@nongnu.org
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-11-git-send-email-steven.sistare@oracle.com>
 <dba8f271d8e79b6748384124a561612d9260a8f2.camel@chinatelecom.cn>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <dba8f271d8e79b6748384124a561612d9260a8f2.camel@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0130.namprd05.prod.outlook.com
 (2603:10b6:803:42::47) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2f32404-1d3b-440a-dff6-08d9fd2e3810
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2200:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1001MB22006AB2EAFC76F4B69D4460F9049@CY4PR1001MB2200.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RL0t2jJ1HZFjx/d9lJQCsWQaGLqgwmKyi8yFfwF3KGT9Z4/XHd765jYUHdm/fGNRc/PdYWEKieLc+ORVVZ0OSwjDX8yVCTR4oLBacZD9GPKNHvU5rXY2k24FPACBEMSu2MIalHpjDD9KRl36q7iBNybucGCQ7ROX48i9uqnFUi6uEOIQddTK118y8dgRufk2frW82GPbVTWDyQCRf5NbYgrQCwcPMldEGNFnYndAC4qSOqIWQTrKauzVNMFim/c2+2RzXAOP1PvLWwmYD+tAn8drGxZsIBpQR6WavM1cGF6ampFSrN7pBnkBgdDknK+F5uOWGsevEPUR+/lwd1Y4OFZtGhoJtNW8MyjGiWTqR1lEb6j2BBBJU9sHzzB7kw5F4ioQ44PpHc6tkq4KcgHU9c783Pj5uVmNUfBXFPMmjSwN/FDMPKBzGuF2zHByWojpSkcGK4sjQwP4BMvYTNGooaiobnQAPRy61kqLxE7S37aqHjYAEtjpJ3Z1ePeHEYVP+upvw7V2gTE+sHKXJjZ0k29P6Z37KtLsQYVsawuWLD7TilY/4ZyVjN6b1bTqikOyo4tz3gAWFbpNKSzxh+GJwBk29cJ1nDcJkdzDhPTu4ngKamrrDpD7U/tYeBbH12hKzQ7pm2wjrsSxNyEw8uo3AsLQBMf71p/jYCZMeQwktEmjVgIkwc/RQ8uhmWnfLsKVyF8tYybtEbFkSbWp0NlHR/GWRJinWuMu8DguGznqnNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(53546011)(54906003)(6666004)(6506007)(6512007)(31686004)(36756003)(2906002)(5660300002)(508600001)(6486002)(66476007)(83380400001)(38100700002)(107886003)(186003)(4326008)(66946007)(8676002)(26005)(66556008)(44832011)(316002)(8936002)(7416002)(86362001)(4001150100001)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGQ2bU91MDk4VjJrZytnY2syWGZ0dllPZ0dmaW16MUdRaEFiT0xzR1MvMS82?=
 =?utf-8?B?dm9jRG9WUlpEajNsdVA0N2lKVlEvakNsMVh1NU5NNkd3Z25LK3QwM1JNY09z?=
 =?utf-8?B?eHl6cXQ3Lzg1Nk5Ic0tSaDliOU5LT3FxUHZ2MGxuSENNOFVWeEpJVWthSWFs?=
 =?utf-8?B?RmxRNDhzVUJzNUVYbTYydVBkK1RDT25ZL0xxMHduR0F1S2FkVmVtN201SW9i?=
 =?utf-8?B?M0xuaHFMenlHQjZOK1Q1MjAwbFdWdjNnMFV5ZFdKbEtmMno3bnczTVBIaVhR?=
 =?utf-8?B?MWpDZnlDSjJEREVIMW5zdnJZWHJEaVVkajNnTXp5SjZPV0gwS3BzVlQyT3Fh?=
 =?utf-8?B?SHdDTlMxZkZJak8vSWJGUHJBN1phY2ZxbHJVNTljRGJUSEc4R3JJZUZFUzZu?=
 =?utf-8?B?MWdzbVVTdUVncUY5d1EyVFhFTzdjQkhVMktOUjBPQlVLTmFhcXV0bVN6N0hP?=
 =?utf-8?B?U3RTa2pybFdTNGZROWdtQk5jMERidkZpUGM5dXNBdDdoSlRreVNRVXRFcWRp?=
 =?utf-8?B?dE55K3BibU9qaTY2b2hrVEFYMVR3Rlo2Y2xrUmN4QnhkbndteFVremVjWnNk?=
 =?utf-8?B?eVBLUVE0Qnk4bW1hT3puZ25UMm95SWxYbDVVTDlKMXVmS0xaWGFmZXkzV0d4?=
 =?utf-8?B?VE5tc2VBU2RORWg1N1MrSVUxSFV1SVBOVnRIN2pRSXhZWVhnclZPNnh5ekdU?=
 =?utf-8?B?VXlrUGdIUmZBdUhWbCtoM1ZUbEpZcTlzamo5akFwMVpHbE1jNXJuUzBERExu?=
 =?utf-8?B?MHdjb1ZHWGFnWnpNbmg1Vms3MEpaTUtIMTdkb0ZrZHFBVW1zdUVmWVNRZ1Fv?=
 =?utf-8?B?eTRtTXRnL0F2bHBEZDNQZ2FNWEJwdEloTThRSTZicjlQZ1dWMXdJc1IwdHA2?=
 =?utf-8?B?V1FlNVV3d3ZjNXAxTnpMMTBscTl5enZHRG1OR01yTWwyRTVVWks5S3cyNXl3?=
 =?utf-8?B?Q0k2WFRkRmNoUGo4TjYwR1IySTJGQ1gvOUZUTWNyczAxdk5WaEZvT01OU1VL?=
 =?utf-8?B?WWN3Q2NQaHdUam5qaVladkhTaTRJL2FDNU1HcnkrQUZpTkZWRDkwNnRISzhw?=
 =?utf-8?B?RTh0WVRiOTdVK29YN2czZ2R4WUsvbFpVR0xqNDNFVGkxZTg2N3oraVd6c04z?=
 =?utf-8?B?MW16ZUFrYUFMazlJcEVhN1Q1UWhlTENoekxmaldvQTgxZnpMUThuZUt4d1hE?=
 =?utf-8?B?Y081YmlrTmpmcXVzbjBZMzlqck9pc2hBdDl3dWhKRXVLVHo4NUFaYXBja3U3?=
 =?utf-8?B?Y0tOUWRwa1V0bWEzeHo0SEdyK2sxcVlEcUpuOUt2V2NSOXdyd2crNUVlUk5T?=
 =?utf-8?B?NzNUalBqcXlxTW9jL2pXYjcyK1RoS00zTzV3aFEvUm02WkN4YVFML095Tllw?=
 =?utf-8?B?eklibnkvejgzTmg4YkVhLzN6QitteUxFV0NCRVhGeW1YcHo3aVlKRkRnaWtC?=
 =?utf-8?B?RmMzR3JYUEw3NHQyUk45dnI5L3hNclhEYlJZWEYxa0RkVWo3UUo5MzBwSHl4?=
 =?utf-8?B?T0hJdGl3ejJDZU5EN3g5d0hTOG5jNHB6RUFlTGpCZFUyeS9GNHRJcUExV1Qz?=
 =?utf-8?B?ZzRGcW01UnlNa0hySWIzMk5vU3hiOWJrN2RWVXdGU1ZtWEZmT3ptRWFUWFd3?=
 =?utf-8?B?N0MyQ285aEs3VjhvaVJma3doWjJDY1ZJTzJIVnJ6S3NoUVBhTGl5VnRzZWN5?=
 =?utf-8?B?Tm9STEpMaGIrZGNyVlBUQU9EajI4TEl0TlUzdUNrMUZRVFg4TXhHRTdqdVk3?=
 =?utf-8?B?eXB0MW4vQnBrUVUwblU0ck52MXhOamFvc1RtbmZFUnpXTUFjOHJ0TjJ1Q2Rz?=
 =?utf-8?B?a2NPZ1p6Z3RESmxuS2JFaE1jaTFUdlZ5S1N1QTRaYTlzNmNJZWxQMDN5S3l6?=
 =?utf-8?B?VFhOb3ZiQm9JRERKdW5wclg3clVDbExrN2ZQRXdtOHdER05KTWNxakNlZnlO?=
 =?utf-8?B?LzV2ZHBXQS9Ia2pxNjg5THRFNlo0UHJRU3dKd2NXRGttTmQ5NTZObkdscDZa?=
 =?utf-8?B?ZkYzM0lTUGZlT08vd1h4bVpRb09xb3Qyb1lxalpSUjJFSmV4aEJKZkNqWG5N?=
 =?utf-8?B?K29Ec3FiL01MUFRxdmlrdFM3WWIxclBudnVvQXhBSVpZRzhZc2d3MW1kS3E5?=
 =?utf-8?B?aExiZjJWRUh0MXNZTlBOSUZVUG1qSFNpNmlOU2hnTHBhREFSSWdyUTRNb0tV?=
 =?utf-8?B?RFJtYSt2TXBxdDJMTS9aSlI3TnFtMktQZW5sTkE4K3BxQW1vbTlrK0JXOUhu?=
 =?utf-8?B?akdiY2g4anFYeDBDNWVmMzk3QmR3PT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f32404-1d3b-440a-dff6-08d9fd2e3810
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:55:20.2776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wi3SrSrgKqA1QY9xE3Rub87n/5stA9khLNj3wIyx6s4ESkZ4a6rb6e4a9JsvOu2UEY7FtdHamml9EI/LTYyGoX9rzRb9k8+wwkpWoQ8Rpzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2200
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10275
 signatures=686983
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203030077
X-Proofpoint-ORIG-GUID: bRC2t06Bu286A0l72g-XDIUZAIKt1uae
X-Proofpoint-GUID: bRC2t06Bu286A0l72g-XDIUZAIKt1uae
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/2022 3:05 AM, Guoyi Tu wrote:
> On Wed, 2021-12-22 at 11:05 -0800, Steve Sistare wrote:
>> Allocate anonymous memory using memfd_create if the memfd-alloc
>> machine
>> option is set.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  hw/core/machine.c   | 19 +++++++++++++++++++
>>  include/hw/boards.h |  1 +
>>  qemu-options.hx     |  6 ++++++
>>  softmmu/physmem.c   | 47 ++++++++++++++++++++++++++++++++++++++-----
>> ----
>>  softmmu/vl.c        |  1 +
>>  trace-events        |  1 +
>>  util/qemu-config.c  |  4 ++++
>>  7 files changed, 70 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 53a99ab..7739d88 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -392,6 +392,20 @@ static void machine_set_mem_merge(Object *obj,
>> bool value, Error **errp)
>>      ms->mem_merge = value;
>>  }
>>  
>> +static bool machine_get_memfd_alloc(Object *obj, Error **errp)
>> +{
>> +    MachineState *ms = MACHINE(obj);
>> +
>> +    return ms->memfd_alloc;
>> +}
>> +
>> +static void machine_set_memfd_alloc(Object *obj, bool value, Error
>> **errp)
>> +{
>> +    MachineState *ms = MACHINE(obj);
>> +
>> +    ms->memfd_alloc = value;
>> +}
>> +
>>  static bool machine_get_usb(Object *obj, Error **errp)
>>  {
>>      MachineState *ms = MACHINE(obj);
>> @@ -829,6 +843,11 @@ static void machine_class_init(ObjectClass *oc,
>> void *data)
>>      object_class_property_set_description(oc, "mem-merge",
>>          "Enable/disable memory merge support");
>>  
>> +    object_class_property_add_bool(oc, "memfd-alloc",
>> +        machine_get_memfd_alloc, machine_set_memfd_alloc);
>> +    object_class_property_set_description(oc, "memfd-alloc",
>> +        "Enable/disable allocating anonymous memory using
>> memfd_create");
>> +
>>      object_class_property_add_bool(oc, "usb",
>>          machine_get_usb, machine_set_usb);
>>      object_class_property_set_description(oc, "usb",
>> diff --git a/include/hw/boards.h b/include/hw/boards.h
>> index 9c1c190..a57d7a0 100644
>> --- a/include/hw/boards.h
>> +++ b/include/hw/boards.h
>> @@ -327,6 +327,7 @@ struct MachineState {
>>      char *dt_compatible;
>>      bool dump_guest_core;
>>      bool mem_merge;
>> +    bool memfd_alloc;
>>      bool usb;
>>      bool usb_disabled;
>>      char *firmware;
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 7d47510..33c8173 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -30,6 +30,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
>>      "                vmport=on|off|auto controls emulation of vmport
>> (default: auto)\n"
>>      "                dump-guest-core=on|off include guest memory in
>> a core dump (default=on)\n"
>>      "                mem-merge=on|off controls memory merge support
>> (default: on)\n"
>> +    "                memfd-alloc=on|off controls allocating
>> anonymous guest RAM using memfd_create (default: off)\n"
>>      "                aes-key-wrap=on|off controls support for AES
>> key wrapping (default=on)\n"
>>      "                dea-key-wrap=on|off controls support for DEA
>> key wrapping (default=on)\n"
>>      "                suppress-vmdesc=on|off disables self-describing 
>> migration (default=off)\n"
>> @@ -76,6 +77,11 @@ SRST
>>          supported by the host, de-duplicates identical memory pages
>>          among VMs instances (enabled by default).
>>  
>> +    ``memfd-alloc=on|off``
>> +        Enables or disables allocation of anonymous guest RAM using
>> +        memfd_create.  Any associated memory-backend objects are
>> created with
>> +        share=on.  The memfd-alloc default is off.
>> +
>>      ``aes-key-wrap=on|off``
>>          Enables or disables AES key wrapping support on s390-ccw
>> hosts.
>>          This feature controls whether AES wrapping keys will be
>> created
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 3524c04..95e2b49 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -41,6 +41,7 @@
>>  #include "qemu/config-file.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/qemu-print.h"
>> +#include "qemu/memfd.h"
>>  #include "exec/memory.h"
>>  #include "exec/ioport.h"
>>  #include "sysemu/dma.h"
>> @@ -1964,35 +1965,63 @@ static void ram_block_add(RAMBlock
>> *new_block, Error **errp)
>>      const bool shared = qemu_ram_is_shared(new_block);
>>      RAMBlock *block;
>>      RAMBlock *last_block = NULL;
>> +    struct MemoryRegion *mr = new_block->mr;
>>      ram_addr_t old_ram_size, new_ram_size;
>>      Error *err = NULL;
>> +    const char *name;
>> +    void *addr = 0;
>> +    size_t maxlen;
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>  
>>      old_ram_size = last_ram_page();
>>  
>>      qemu_mutex_lock_ramlist();
>> -    new_block->offset = find_ram_offset(new_block->max_length);
>> +    maxlen = new_block->max_length;
>> +    new_block->offset = find_ram_offset(maxlen);
>>  
>>      if (!new_block->host) {
>>          if (xen_enabled()) {
>> -            xen_ram_alloc(new_block->offset, new_block->max_length,
>> -                          new_block->mr, &err);
>> +            xen_ram_alloc(new_block->offset, maxlen, new_block->mr,
>> &err);
>>              if (err) {
>>                  error_propagate(errp, err);
>>                  qemu_mutex_unlock_ramlist();
>>                  return;
>>              }
>>          } else {
>> -            new_block->host = qemu_anon_ram_alloc(new_block-
>>> max_length,
>> -                                                  &new_block->mr-
>>> align,
>> -                                                  shared,
>> noreserve);
>> -            if (!new_block->host) {
>> +            name = memory_region_name(mr);
>> +            if (ms->memfd_alloc) {
>> +                Object *parent = &mr->parent_obj;
>> +                int mfd = -1;          /* placeholder until next
>> patch */
>> +                mr->align = QEMU_VMALLOC_ALIGN;
>> +                if (mfd < 0) {
>> +                    mfd = qemu_memfd_create(name, maxlen + mr-
>>> align,
>> +                                            0, 0, 0, &err);
>> +                    if (mfd < 0) {
> 
> the error message should be propagated
> 
> Guoyi Tu
> 
>> +                        return;
>> +                    }

Will do, thanks, by setting errp directly:
     mfd = qemu_memfd_create(name, maxlen + mr->align, 0, 0, 0, errp);

- Steve

