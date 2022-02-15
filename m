Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6807C4B74DD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:54:44 +0100 (CET)
Received: from localhost ([::1]:58718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3uN-0006cx-Ga
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:54:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nK3nl-0005ex-1O
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:47:53 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nK3nh-0000zN-Rj
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:47:52 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21FH4Ogt029579; 
 Tue, 15 Feb 2022 19:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RXIr2L4OxxmqWYAekBPj8mLcqklwFEiOxnbiIArbxGc=;
 b=uV2yQnadXpXq4Z8AgVndLh5saKvp9DxGJRB1lHvuuw8MVl+oaLiELo8Iw8zThwYK+xNI
 s4t/TeuEmWqv41DYZSQqeBHubdS9ZY+ZD9TNvx2yOfhZTsywJxDFnLuQydy8RDmnFe1C
 rVUPciyfA5xyUVuZhassvOfBwjQ/vZTEWl0PvH9GW7iZ9D8NvSX/jBZPdBa+8E/IiUeg
 RgpoenWe8ZxACgaSSdw8+jwIY9rJvt7tztRl5TwpceVtKBApRviXtycK0+M58orcauZP
 d83An7QWvG3JynNNbHOHCBLG/GlKzrfeljY276iF8cuAVLdji0gwqZQQJMvEUMAFBbIx xQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8570tfhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 19:47:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21FJjDcd091800;
 Tue, 15 Feb 2022 19:47:44 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3030.oracle.com with ESMTP id 3e620xhkjp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Feb 2022 19:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgiLKrfcPgO4dcc6Ad/zka9hQn8FOY5tCyBDUryQCL+YTqngki5KFhs5XF+lMRBDaThMEbXSNT3NN52yLdKfLt7+/Ghilrtugz2r7eSe/u9uoNa9x1fgHqIb52hvJC7neR0nnpd7uH485ku+hR62+xFdHsxw0yoUpRl8ncbTEj3UN8aS+rgy6OcZ3lZgFBev4EpuFKZRqp3H9hejefAX0t0XgetC6e662bija9VDu6LeJeHBH71bg0F/VqaEhObzBmgg+EWMpLj7BJE0rtO1JTfvyAhEZ/0N55iahmrdlSlMip2636+FnkeOXv1F6/NGsNE5kqk1yzJcRYKCLHJsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXIr2L4OxxmqWYAekBPj8mLcqklwFEiOxnbiIArbxGc=;
 b=Nljyrw4v04HVOYDlGJe6GZ+HZRjHZ1UbFbYJnvLPjRUyE3mBuHdao3opPJNUGHHmzbjx+TIBp0Wt7Y5fd86MUJ7cGFZvhTVE0QJgf6XSc7jX+OdElI0A0gCVC/IoSIEUtnenpBznx76PDbcpBKiEzj3zvn99vClhkkp8qQxlMiV09mmeQirgygKunQOqjzLC3YyPwtWpJa4mQfJNzmgfg+OOZ5Ob4dL3R6bDXrd+0H68aNSHND7L4RpCInPfm87IXEW+Ct1KANmMxGHtMPOSMRcyDfEfpE9R5h8Sa6L1d9Skx7tHIOcfQObg2sjLIeqFZxXj4rv5GmirvUQdb45vPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXIr2L4OxxmqWYAekBPj8mLcqklwFEiOxnbiIArbxGc=;
 b=yvi98bXm/V4b+4oJqUUlDPOsXDr6ORn3BwN69O4eo0VH3l4H8Ifs8TLl/fn2e2r4IcFdLQQtwsmiB3VJU3EYIRvfjcoviJZfnZ7+OG6ml6xQGuNb1jFqubdiHLXWAdezCALg6Ii1mTu6wTV8HF3/0dMhUUeBiP2saXGqlKp/AhU=
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 by DM6PR10MB3657.namprd10.prod.outlook.com (2603:10b6:5:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 19:47:41 +0000
Received: from SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::44cc:8f20:8421:4721]) by SJ0PR10MB4542.namprd10.prod.outlook.com
 ([fe80::44cc:8f20:8421:4721%3]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 19:47:41 +0000
Message-ID: <67215820-c437-649f-86d0-17a6c3bfbfaa@oracle.com>
Date: Tue, 15 Feb 2022 13:47:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] hw/acpi/erst: clean up unused IS_UEFI_CPER_RECORD macro
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <20220215153140.128528-1-ani@anisinha.ca>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20220215153140.128528-1-ani@anisinha.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0046.namprd12.prod.outlook.com
 (2603:10b6:802:20::17) To SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5810b9c3-2337-405e-ec20-08d9f0bc073f
X-MS-TrafficTypeDiagnostic: DM6PR10MB3657:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB365759FF6333FEF724FDBFE297349@DM6PR10MB3657.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u5crXqoX90UvMsCNzTSBN3bWAf8ZMJrgHZmXXflEZ9AXNPQh3mzmmK+AkGl71ZAjAbQ1Myzh5a2JyMG+q2exDih1S4nqca3WyNSJgG4+ILLsTgyb0Z6NqS/8EvY3TpP0aeidgTCnwymLwaLe27h2hif6ZCSmQVg17+UscU+wwKXTEgu1NcePbudF54KyFi1vMweriTIM57WLoo5/hOVoiYzq4eLp7PXr2rT68vm2h4D4IWJD5gaZe5Jp+V2WcacjIPLeVtJ82qNe5zZSk7hNFUfHWm+kOqfNSpLjrniHlfrm4O1CAzpY+nYz4TO038p2nDaZQI5OxUwBo+6vx4qh86ulXxV7Ca2Jb5mhfF1zLz1p3UcxiTkWlwEYBhhnf4oawuJ6Q65Hu60Jj/+L2v5ckzkHSxCMm1SF4+zG026o6E42khEUz6TcDXxEcliRruZtgIS6wrQ/s132+ONgmpNGFdW30g5mHPxwc3KhKwR7eYh+gzc1PCsuLJ+G1WCqpK2r9/jphD5OY1QfjzGQmcV2EJ7eT38lMiyhHsqGJUmikzEOgLWSBbafFjL4vhKu4sMHQlpsqQEwZaly6PYiYxn3ba3eoQZUzthCM+iizd7dSVRoPgPcfBU/3lTHShl6mON3pOLx0WpdomM7tr/UKMdtY4mSFHPrw+vQzd6Ov72UaVPyu78wHc9EEgXln+h+whAP5yA0souq+vWaV73Z3/rIJGWP6Wp48LxuSvgxEkuPP/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4542.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(86362001)(2906002)(8936002)(31696002)(186003)(38100700002)(508600001)(2616005)(6506007)(6512007)(4744005)(53546011)(66476007)(66556008)(83380400001)(316002)(6486002)(110136005)(31686004)(8676002)(66946007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei9CLzNCWmYrRFdVaEpmVDZRci94VXRCdEh5NE85M1h6TCs0KzNOVVVmS1lN?=
 =?utf-8?B?WVRjWVE1OWlvQ2Z0blBaSUNPa1pWZnF3QUlDcG44U0pEdE9lYVpsRGZwMGlM?=
 =?utf-8?B?Z2swb0J0eHNmZTg2S3dxWE1BRVFtSDY4WWFCMUVHMFdUT1FuVGJxVEZOYWpu?=
 =?utf-8?B?QytEMG9YZ2xOOVJYc3lBNERoUHBRV3V2YldZY2h6Mm1IMUdySjdsd2hOZkV5?=
 =?utf-8?B?ZXpXaitUWWRORVBWbVNpa24vVUt0L2hsbE5iNWo4elIyb2Eva3VzbnJ4bWxu?=
 =?utf-8?B?N3VyRUJkM2pIUk9jdjRNZjZBcDBnTmMwWUkyOXhlQXpHSDkvamRuYnFtVk5i?=
 =?utf-8?B?eWtrL0R4YXF1RzY2UlNScFlZbXh3aVpGVDduSm82YlRjZ21GSzJDcXg0RUpm?=
 =?utf-8?B?OS9qSnpDS09abXFWTm16ZGEzaXZsQmxLZDIrWThkZENjWjRnTEMvb0Ezbzdk?=
 =?utf-8?B?dHpDVTZxeS8vMkhEeEdZejBZd0pjY3piVUQ5YTNWODhwekhPVjNkUE9aRWYz?=
 =?utf-8?B?T2lCMERycVozSDV3TytIYjM3ZkdMZWl6Ni8veVJqcGhXVE8wQ2NhSWNQNUht?=
 =?utf-8?B?aDVNRXZ4WkNCRUdPYUhTbkZ1V2x1MkxCVzFJSzE4R1lOa0pNSzAyY2hXMEEy?=
 =?utf-8?B?c3dWYUREUnNRSUFCTGwvUklISlp6NTVKWGhnYlRBMFNmS3hsbFpXSiszdFk5?=
 =?utf-8?B?dyttaytqN2h6U2VkZnNoQ01iMjBxYTUwendxV2tVR0Rta3VaNjMyWmZoWTB5?=
 =?utf-8?B?NFdhQ05SNXdFTXEvR0x5aW5uVjIxdEVnQkFGeStWcFZWSE1vTFM2Q25kNVU5?=
 =?utf-8?B?a0EzYUxrckdTYVplVjFwL2RZY2M0bDF5UUI1b0tmZDRPV1pmRXBsb2U3WUJ0?=
 =?utf-8?B?dTNXNk5LVDZCQnVha3N5bzI1L2ZJZ0lib0VmbGVZdkhIRStvSlNsWG4zZVA4?=
 =?utf-8?B?RStyM05vNTJDS3ExR1JMVG9ZdWtVWFo5N1cyTXZ5bFhxWFpiTDBxVFdWTjVo?=
 =?utf-8?B?Y2VYcVRWYWZqbzQxWFhSUVd4RVBWOXhkQi9vYlphSlIrT25zYWx1ZXVjT0hs?=
 =?utf-8?B?bWxobTc1bllRcndBTEJaakRqRnR0My9TOHc4UkZlS0FkbmdjaDdOMm84dVNr?=
 =?utf-8?B?Nlh4RkVVWENBa1lVNEw0ejVLc3I2VlFxRzdXb3pPZi9laHQ3TG9CMG1NN3My?=
 =?utf-8?B?Mk1BTmRpdEN6aU81ci9hS0EyK01tZHF1YzVpZW53alhwWTEvSGdldE1kblVP?=
 =?utf-8?B?MWxvZG9QaEt4Z3cvVHluMFZSbU5iWTU2RUJTSE43dCttT2pGUWYwdldlaXph?=
 =?utf-8?B?SkVqNDRiOWxGMTNJUEtqMDNxcFNFV0p1d2RsejJxWDZvVHd1SUJMOGVnMWIx?=
 =?utf-8?B?WVBYSWtqUDFWVVlTM1NGcWJnZ0ZybE41cHNIN3NDUmpEK21hMHVkSXhqemkv?=
 =?utf-8?B?cnd0dDk4WE9lTS9GS1dvZnhyV09EK0lIZUMxWElTVkM3TW9iTTR0VUNhaXo4?=
 =?utf-8?B?Z0R0VDVYV1hNbUk0cGJ0dUROZ2RuRG5UNW5WVGorZzBHbjBjc1l1NW9KNzdY?=
 =?utf-8?B?N1BtTFhZeEpvUm9lSXNqYzRteGVMS25tSW9wTk8zS2M1VC82OUdmU3kzQnlN?=
 =?utf-8?B?ZWdRQzlIM3VCUFJaRHdIVXpuZWhjNlp3Q2xhRzlJdmEweXhDNmtweDdtMHFm?=
 =?utf-8?B?Z2JrV2ZOTDhkNm4ydWViYUcwdS9hc0lDTXNVdlZTejNOaVdLV2R3L2hrSkJm?=
 =?utf-8?B?TUxYSkF5bkVZbEVaMy9ubjhUaG1sd2pTMys0dlVNWUtXazlwS2h4S1hFVGhB?=
 =?utf-8?B?bktIQjN6UXVoZENhekduMG5RcERZTGVDV0QxRks3cVJBWHFuR2tySGRmSWU5?=
 =?utf-8?B?V1hrdklwZGZLVm5wcXBsd3dOcnFRaksrNjdKNU5KM3JrZlZhZlllZGxkU1Ro?=
 =?utf-8?B?endEcVNyV21kaE5lNURVTmRwOEtRb3dQZmhUWkx1MGFSTkNBa3pWbWpPVmhJ?=
 =?utf-8?B?SGt4UWhyZm9wb2ZCL00yNjF0eEF2TS9yZFgwWkRUWkpLeVVUTitRZDBKd2Z4?=
 =?utf-8?B?bmxEYys4enN0WEw4WHlraGJOTks5WXpURk9rYUYvVEN6ZVBaWS82eFZ5TllU?=
 =?utf-8?B?M0RJZmF4NzFhbktlTWN6UUZ0Wkt1V1RxTDVCeCtNWmZnb3FzQlpTTDF2NWY2?=
 =?utf-8?B?dEs0VDd1SWEyRlRzejUwRW9JeUNiRjJEc2pzUk1vZGpWemtyZnVySDNlQkJV?=
 =?utf-8?B?aGJBdlJaTXh3OWZxWXVRSVlhS01hNTh2Z1FkMmJRcUlDWm5rM2dIT0c5Slo0?=
 =?utf-8?Q?dkUMm8tu86V5NNvRif?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5810b9c3-2337-405e-ec20-08d9f0bc073f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4542.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:47:41.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvKiWyVLR073nPeZ9uTMzh6S2vGt3dZuX6RdLhdEy0jZhjMdXPZWUe6doAOz1DpmBAQoKTXPpl95MtUD9rRXs5dlVt+dH8YBA/JA/sVU5GQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3657
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10259
 signatures=675924
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150115
X-Proofpoint-ORIG-GUID: mySZfWrvSs3MaOIxRhvF1l3yg4Th7lS-
X-Proofpoint-GUID: mySZfWrvSs3MaOIxRhvF1l3yg4Th7lS-
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/15/22 09:31, Ani Sinha wrote:
> This change is cosmetic. IS_UEFI_CPER_RECORD macro definition that was added
> as a part of the ERST implementation seems to be unused. Remove it.
> 
> CC: Eric DeVolder <eric.devolder@oracle.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Thanks!
Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>

> ---
>   hw/acpi/erst.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index c0a23cf467..de509c2b48 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -80,11 +80,6 @@
>   #define UEFI_CPER_RECORD_MIN_SIZE 128U
>   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>   #define UEFI_CPER_RECORD_ID_OFFSET 96U
> -#define IS_UEFI_CPER_RECORD(ptr) \
> -    (((ptr)[0] == 'C') && \
> -     ((ptr)[1] == 'P') && \
> -     ((ptr)[2] == 'E') && \
> -     ((ptr)[3] == 'R'))
>   
>   /*
>    * NOTE that when accessing CPER fields within a record, memcpy()
> 

