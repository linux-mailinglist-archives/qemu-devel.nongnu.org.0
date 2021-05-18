Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB0387D26
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 18:13:52 +0200 (CEST)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj2Lv-00056z-FQ
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lj29q-0006va-HK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:01:22 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lj29j-00086X-W8
 for qemu-devel@nongnu.org; Tue, 18 May 2021 12:01:22 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IFVRDt024733; Tue, 18 May 2021 16:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=PB/JgdkH6cp6DPi50r42p/ylgcdLxVgWT5saekOykzU=;
 b=v/Ha2Fs8tn6vOfqS7gGZ/GkqVGSTfS3eo+Z/7d67xUsp/O7ZO/xW195U40+JrgBPY8iv
 ft79C1diUYZEUgIgmJwauHQQ98UtNsy4GpcFDUxJ0MFk0xmiDwrptFhetUMhfzuzZp0W
 +fe/dA1OL0gYdtKl7v2RLJk69JibgtRvEe6axH9BP5ExSSvzBgUygPy2V6l+7yoL+LZQ
 S7S2DBfGB0BH97FDs5ADZjFjLe2lf9Hwa4GVsYT2SsRCBqmb0P8I3ELWA4ASGC1E1T7I
 YdjZCaoBdS+pCiT6hZdDyIbRl9fTkhVf4H2PjFtmqEx0gSqIwqLszw692qT58XF3bwFX Xg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kfhwgr7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 16:01:08 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IFvvld164805;
 Tue, 18 May 2021 16:01:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by aserp3030.oracle.com with ESMTP id 38meefc5gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 16:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOMAd+aJPpq2ySUEiVFYWHIHmShKs1DqWb4zcMyGmfNMd9DccH2kNJL2Nsp9jf4OntAD5kvWggdvQYpTJBHaoNqSmLC2gBrfc4Ni8Pe1DdPXF91lUYqcs2/3WvmM0aABlgDd6aqVLjm3LGY8I5yL2zY2c6xiqBcLLo2USl0hOBc/Cp4rZIHIxlef5lvDB5B6xGs6ZWVzO96bzo2Bt/JmkrERlsCP2BNqPr3CdbicqmUX56GEeFfiLbQ7d7bi0NJioKTuaMdxJeD4rg17La5oHe7bHN2tmuSQhwS64Rc5qcwmiqOiAtO/lWZVLRWOKcab1SB76u+1hybTXr+bh5XjGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB/JgdkH6cp6DPi50r42p/ylgcdLxVgWT5saekOykzU=;
 b=H14Ns09ZIGFjLWLbDkNq+ZHno4fxhSY3QSV6oADZ375D/QGm1ADBUm/YQkPH8hAwuBcCzZRnY58AFPCFzbRINqMo/aMW9fNyJhDeoFHDuO0CqM3Inz0GNehWbZj6CAxj7PbGOhR2dxGESoq7Ogt/kLpoALvHg7VqjFhstx/KrlKTJpk9E/FCK7I7xPaVgSBqjJd16K0io4T0zKHRzG9hzhxpEYduTFVEf9i0FwEzhBQaqqKYG4el9V7QFkAjVUHdhJ8qfqdX2zmhBw/n/AyLfj2ggyH3rEY51JGNOn6E5sPKbnuuUkTo4y7h7lp3/kO8t6M0YKc2usZGrwheswQ8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB/JgdkH6cp6DPi50r42p/ylgcdLxVgWT5saekOykzU=;
 b=VpQrz1B3B6e5wDT2Ybtu7gPXiCrw8+OCZiHr5x/VkvoiCSOGXlDKMH/0drbKwizGPyXovB2UynMYW3aFGxVqkMQ3VY8CnhnNSzatfsItjX7qE7bBjeRkqru5hCuqDOOIsWPSa+ZijMzqZT6ztaEHCuJXelmBHcuzMpw6rB/pZHM=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4717.namprd10.prod.outlook.com (2603:10b6:a03:2ac::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 16:01:05 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 16:01:04 +0000
Subject: Re: [PATCH V3 00/22] Live Update
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com>
Date: Tue, 18 May 2021 12:00:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKOPnkefxgRZ8PoQ@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN4PR0201CA0022.namprd02.prod.outlook.com
 (2603:10b6:803:2b::32) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN4PR0201CA0022.namprd02.prod.outlook.com (2603:10b6:803:2b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Tue, 18 May 2021 16:01:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b08f9c3-b036-4b47-a950-08d91a16239a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB47175CE2DA7F9EDE6BEC90ECF92C9@SJ0PR10MB4717.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wkAo8OKNTnidrv5CGibASf/H0f9D0ubGhoSdSuYDcth8FUNk8ZakPOizpre9o7Q3+9dHw91m4Hz2m/oD9HIRRiBGRnkrDSpuspp5YDbTbpTkARbYkhGSsFaRNHWo/jO47t/5qvv/TY8FeFBEwC/vmTE7xOtSPo3l+RI+bFmtxvl0qt9Ic/sj+sNOyx1q23wM+poGdvHayf5l2yJ7x3PBHhBQrgLICPG9Et1MoW2pZhKbZ80cuLCjiRPNZPiato+xgsHRmcY01qlhHLZbTe2hDNi8g55ymBQ3SrFkzvknvXuaRBB3szY1c/O//EdieHzUf/7wgEv4todL0l/PQ7TcgjopjZ2n/M9Uxu90DxyWCyzpq6A3fV4pHxTZPt7Lc2nkLpFJwNKav+91csPPGLc2+rtJOpPDYYEMzk4VP1A0/3hxKPJLqlDeo3AjQzFRZTwvYKMEtheRggY5YbustKL86Mt4la1KkAdw3/rdFEQYmF94PrsA1WeFQfrucIHiqR+VESBN2grzkbCnTZ2nslScozikVgf6nc+9QF71lIkqD0yJvl2N4j1ExuyU+OcM6+VaaXm/yEMHSZMHzfPs/aPuAolppItEKK849vQNVOmvFaXAC4UF44othBXJw6elzUzkwV6npF1lfakdF44iGILHV3C/sWGy5osr4T8JvW1mW5RJirsM3VffBnO5BB6zRRKY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(66946007)(6666004)(53546011)(66476007)(66556008)(26005)(8936002)(36916002)(4326008)(7416002)(107886003)(956004)(44832011)(54906003)(316002)(8676002)(15650500001)(6916009)(6486002)(16576012)(5660300002)(478600001)(2616005)(86362001)(38100700002)(2906002)(16526019)(31696002)(83380400001)(186003)(36756003)(31686004)(84040400003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZktOdnhITWMrVUFLeDBVK25Kak1uUWlMeFZxd20zOHZiSGtxZTlKUnNIOXBS?=
 =?utf-8?B?RCtuWUQ0UUF2bDdTd2RRQ0hCMFluNkMwazhqb0ZyVTl0cWN6d0c3VjNZUHdS?=
 =?utf-8?B?UmxGSm9Pbkthc2tDeFUvdVd3c0dWNDhRekpUY0tHOFNEazZJc3JQVjVEQjZE?=
 =?utf-8?B?NVZGd0tjZ0hmYXpHbS9JczN3eFpETC9TOXErRFZMR2lNc29ka2hKVVZTTVlk?=
 =?utf-8?B?S1RwS3pmaTJmV1JYQklneFZieFFsSVgvMHA0dzNYbVdjRWRSUjNuSzZScUV4?=
 =?utf-8?B?Z2ZGaHBqUm12TzU3Rmg1b0o0b3RoaWI5RzErZWtscXZuRWFwOStuTks4Wi9U?=
 =?utf-8?B?MnBvaWJxNkxFVmRtU1FlQjlRek91UERtNzNuV1FvblJQa3N4RHVlNVVpS25Q?=
 =?utf-8?B?bzh1aUJrN0QycmxVYzJ3WGN0MTdrdWFIN2xTUkFwMHQ1VWtnaUpGMHdVOUFD?=
 =?utf-8?B?VUh4ekdmOWNieXVQUVBKRkpIMVBxYVkxekt5ek5MV3FYR2JSV2NhdStXYTY1?=
 =?utf-8?B?TUxSY05CYURiRUxSRnpqTTBONDFGUTNSK3dDV3FLRVgybHFDdGZIQTNDeVN1?=
 =?utf-8?B?RW5sOEtUV2wzZmVySzFhUW9weFRmamxWcmxpSUdoVW9FY1EyYXNuallxT2VC?=
 =?utf-8?B?WDZTaHgweEJZOVpHOUtUQ1VPMk9McGdtRmNINHhiZnlScGNkVS9Ma2k1T2Q2?=
 =?utf-8?B?WWdUaFZSM1dNeTdWa28xQTc2c3pSRk8yVnZNVk9uUkhlR0U0VzhvcU5vei9q?=
 =?utf-8?B?c3YyRWQyQkVwaGIxMmhXWU5WR2VhV0ducmZEdXBVa2o3Zk0zZjF4bzdBOTh2?=
 =?utf-8?B?K0Zqano1N21mdllURzJ5N09JcWd6QkNuZW11Y3ZpZUdSUTNRUTFBbFh3V1ZU?=
 =?utf-8?B?MnBOdXhKYnFUaHlldGEwWCtaaHVrWjZiQjlkRmhHR3JpWDlrS1AvbytjS0hU?=
 =?utf-8?B?OCtzQ0F4R3ZNR2xUVnBzUi8xRVBRekl0aE91TkFqSEttdjR2Q2N4T1NXYk5s?=
 =?utf-8?B?bXZBUTE4akRCNDBPcGlHVzdJZmJoREpGYXBZK3RBM1MxdkJiTjMwUVh6VVp5?=
 =?utf-8?B?Zmdnc3RTdW5tUUdMTFdiUnFjU1JncTBJQ2cxdUlQdS9IZHhzWUsyZ2FGSDkw?=
 =?utf-8?B?S2JWdlpNK1hRci85Z3NWTlVTNkdaOWRFNk85WXV2aGRWWHZFU3AxazV5Mi82?=
 =?utf-8?B?RXB4TVFBRzZFcStZUkkxRkFUWXVpWnBWUThBNnAycGs5Q0lmN2pNNFAwNVN3?=
 =?utf-8?B?UnZZMkRpaWtiLzl4SkVSa1laWmswU0QrZi9NN2QzZTZzWFYyWkYzMUZlbXBk?=
 =?utf-8?B?Sk96WGJ5OHV5d0M3RzVTVytNREdmekJPMll6akRZZGVtcHppNmNGWm10cDJY?=
 =?utf-8?B?Y1RIeXV3MXdWU21KcWduQkphbWVxSkY1MVRqZmpXYzV6QUNlbVMrT1lKTSt2?=
 =?utf-8?B?UkJUR2NlZDBDWGttOVc2VTI5RnFpeXR5a1VpTHd5aDdCYUlwV0VGalpFdUVz?=
 =?utf-8?B?eVcwRktSQUZWcGRGcHRFT3lYcE5yaHZJSG5WVnFDa0E5azI5dktLSDd1TDhY?=
 =?utf-8?B?bStoUnVzK1VPbkV6OUk0aVlVbWo2WWQ4TDNVZ1ZjaHI1SG5OMHhPQnpwZnpj?=
 =?utf-8?B?YzFhQk5jcWp5MGVFeXRxa1BnUjI3cERuK3I0aFAvbzlHWHltZWlRRXl5V3Vr?=
 =?utf-8?B?cksrRjVKOWliMWxiNDQrUEZLcWNvanF2S2xma1hjSUgvZXpPeGdnS3ZWeVli?=
 =?utf-8?Q?B+MxOIxvbXQwo2B1tMt2YjRXbVOJxn9odWetWdL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b08f9c3-b036-4b47-a950-08d91a16239a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 16:01:04.1985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0SinV9fDTRgS86u+Z1csdfsAvn3xpttfNTGhVNXlL4PJrpaqG9kotI+9Qzc9ukLDqmhJzI+8bCnjr239/6iPuAZSuVnDi2Scrm7FK8OTQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4717
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105180111
X-Proofpoint-GUID: MxYQZs1sxrInY0fVFRzFkYMccNmbHJiF
X-Proofpoint-ORIG-GUID: MxYQZs1sxrInY0fVFRzFkYMccNmbHJiF
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/2021 5:57 AM, Dr. David Alan Gilbert wrote:
> * Steven Sistare (steven.sistare@oracle.com) wrote:
>> On 5/14/2021 7:53 AM, Stefan Hajnoczi wrote:
>>> On Thu, May 13, 2021 at 04:21:15PM -0400, Steven Sistare wrote:
>>>> On 5/12/2021 12:42 PM, Stefan Hajnoczi wrote:
>>>>> On Fri, May 07, 2021 at 05:24:58AM -0700, Steve Sistare wrote:
>>>>>> Provide the cprsave and cprload commands for live update.  These save and
>>>>>> restore VM state, with minimal guest pause time, so that qemu may be updated
>>>>>> to a new version in between.
>>>>>>
>>>>>> cprsave stops the VM and saves vmstate to an ordinary file.  It supports two
>>>>>> modes: restart and reboot.  For restart, cprsave exec's the qemu binary (or
>>>>>> /usr/bin/qemu-exec if it exists) with the same argv.  qemu restarts in a
>>>>>> paused state and waits for the cprload command.
>>>>>
>>>>> I think cprsave/cprload could be generalized by using QMP to stash the
>>>>> file descriptors. The 'getfd' QMP command already exists and QEMU code
>>>>> already opens fds passed using this mechanism.
>>>>>
>>>>> I haven't checked but it may be possible to drop some patches by reusing
>>>>> QEMU's monitor file descriptor passing since the code already knows how
>>>>> to open from 'getfd' fds.
>>>>>
>>>>> The reason why using QMP is interesting is because it eliminates the
>>>>> need for execve(2). QEMU may be unable to execute a program due to
>>>>> chroot, seccomp, etc.
>>>>>
>>>>> QMP would enable cprsave/cprload to work both with and without
>>>>> execve(2).
>>>>>
>>>>> One tricky thing with this approach might be startup ordering: how to
>>>>> get fds via the QMP monitor in the new process before processing the
>>>>> entire command-line.
>>>>
>>>> Early on I experimented with a similar approach.  Old qemu passed descriptors to an
>>>> escrow process and exited; new qemu started and retrieved the descriptors from escrow.
>>>> vfio mostly worked after I hacked the kernel to suppress the original-pid owner check.
>>>> I suspect my recent vfio extensions would smooth the rough edges.
>>>
>>> I wonder about the reason for VFIO's pid limitation, maybe because it
>>> pins pages from the original process?
>>
>> The dma unmap code verifies that the requesting task is the same as the task that mapped
>> the pages.  We could add an ioctl that passes ownership to a new task.  We would also need
>> to fix locked memory accounting, which is associated with the mm of the original task.
> 
>>> Is this VFIO pid limitation the main reason why you chose to make QEMU
>>> execve(2) the new binary?
>>
>> That is one.  Plus, re-attaching to named shared memory for pc.ram causes the vfio conflict
>> errors I mentioned in the previous email.  We would need to suppress redundant dma map calls,
>> but allow legitimate dma maps and unmaps in response to the ongoing address space changes and
>> diff callbacks caused by some drivers. It would be messy and fragile. In general, it felt like 
>> I was working against vfio rather than with it.
> 
> OK the weirdness of vfio helps explain a bit about why you're doing it
> this way; can you help separate some difference between restart and
> reboot for me though:
> 
> In 'reboot' mode; where the guest must do suspend in it's drivers, how
> much of these vfio requirements are needed?  I guess the memfd use
> for the anonymous areas isn't any use for reboot mode.

Correct.  For reboot no special vfio support or fiddling is needed.

> You mention cprsave calls VFIO_DMA_UNMAP_FLAG_VADDR - after that does
> vfio still care about the currently-anonymous areas?

Yes, for restart mode.  The physical pages behind the anonymous memory remain pinned and 
are targets for ongoing DMA.  Post-exec qemu needs a way to find those same pages.

>> Another big reason is a requirement to preserve anonymous memory for legacy qemu updates (via
>> code injection which I briefly mentioned in KVM forum).  If we extend cpr to allow updates 
>> without exec, I still need the exec option.
> 
> Can you explain what that code injection mechanism is for those of us
> who didn't see that?

Sure.  Here is slide 12 from the talk.  It relies on mmap(MADV_DOEXEC) which was not
accepted upstream.

-----------------------------------------------------------------------------
Legacy Live Update

 * Update legacy qemu process to latest version
   - Inject code into legacy qemu process to perform cprsave: vmsave.so
     . Access qemu data structures and globals
       - eg ram_list, savevm_state, chardevs, vhost_devices
       - dlopen does not resolve them, must get addresses via symbol lookup.
     . Delete some vmstate handlers, register new ones (eg vfio)
     . Call MADV_DOEXEC on guest memory. Find devices, preserve fd
 * Hot patch a monitor function to dlopen vmsave.so, call entry point
   - write patch to /proc/pid/mem
   - Call the monitor function via monitor socket
 * Send cprload to update qemu
 * vmsave.so has binary dependency on qemu data structures and variables
   - Build vmsave-ver.so per legacy version
   - Indexed by qemu's gcc build-id

-----------------------------------------------------------------------------

- Steve
 
>>>> However, the main issue is that guest ram must be backed by named shared memory, and
>>>> we would need to add code to support shared memory for all the secondary memory objects.
>>>> That makes it less interesting for us at this time; we care about updating legacy qemu 
>>>> instances with anonymous guest memory.
>>>
>>> Thanks for explaining this more in the other sub-thread. The secondary
>>> memory objects you mentioned are relatively small so I don't think
>>> saving them in the traditional way is a problem.
>>>
>>> Two approaches for zero-copy memory migration fit into QEMU's existing
>>> migration infrastructure:
>>>
>>> - Marking RAM blocks that are backed by named memory (tmpfs, hugetlbfs,
>>>   etc) so they are not saved into the savevm file. The existing --object
>>>   memory-backend-file syntax can be used.
>>>
>>> - Extending the live migration protocol to detect when file descriptor
>>>   passing is available (i.e. UNIX domain socket migration) and using
>>>   that for memory-backend-* objects that have fds.
>>>
>>> Either of these approaches would handle RAM with existing savevm/migrate
>>> commands.
>>
>> Yes, but the vfio issues would still need to be solved, and we would need new
>> command line options to back existing and future secondary memory objects with 
>> named shared memory.
>>
>>> The remaining issue is how to migrate VFIO and other file descriptors
>>> that cannot be reopened by the new process. As mentioned, QEMU already
>>> has file descriptor passing support in the QMP monitor and support for
>>> opening passed file descriptors (see qemu_open_internal(),
>>> monitor_fd_param(), and socket_get_fd()).
>>>
>>> The advantage of integrating live update functionality into the existing
>>> savevm/migrate commands is that it will work in more use cases with
>>> less code duplication/maintenance/bitrot prevention than the
>>> special-case cprsave command in this patch series.
>>>
>>> Maybe there is a fundamental technical reason why live update needs to
>>> be different from QEMU's existing migration commands but I haven't
>>> figured it out yet.
>>
>> vfio and anonymous memory.
>>
>> Regarding code duplication, I did consider whether to extend the migration
>> syntax and implementation versus creating something new.  Those functions
>> handle stuff like bdrv snapshot, aio, and migration which are n/a for the cpr
>> use case, and the cpr functions handle state that is n/a for the migration case.
>> I judged that handling both in the same functions would be less readable and
>> maintainable.  After feedback during the V1 review, I simplified the cprsave
>> code by by calling qemu_save_device_state, as Xen does, thus eliminating any
>> interaction with the migration code.
>>
>> Regarding bit rot, I still need to add a cpr test to the test suite, when the 
>> review is more complete and folks agree on the final form of the functionality.
>>
>> I do like the idea of supporting update without exec, but as a future project, 
>> and not at the expense of dropping update with exec.
>>
>> - Steve
>>

