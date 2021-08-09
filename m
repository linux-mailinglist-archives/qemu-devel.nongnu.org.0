Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08F3E4978
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 18:08:48 +0200 (CEST)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD7pX-0001wH-9L
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 12:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mD7kX-0002uL-A4
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:03:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1mD7kU-00074T-3B
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 12:03:37 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 179G1R2N029292; Mon, 9 Aug 2021 16:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Cw7TQySZDNq1H7yiD3uwGAO+rvFVDcYN9ftTDwx3Cz0=;
 b=x/8AWMLxF/BiLW8NxuvKtcH0bnq5p5uHpJQiC5meumxJO49SRZN/12g6eEoWcdTTq/Yd
 beXJh/C+MUquUMsiYLYzbhphrM8wS5yY+zJfuVRfJaddKSSa7nUajo+pCHXstCqwbHEe
 y0/99N3Z15vMcS9nMDtknRH2zt1G9JXH0P4yQwws3PrnmVzv+fUvhIQ+XCCK/GMb8nvd
 7fBFHxkkZsJ+AiT/S60stroB+41OVhlDpfiA8tAYnjTe4QjUV+SGtArvXK4UTw0mzx4v
 4mCAjrDOtGO6flO5S0VhmI9wkpJHWRtul1v2dqRi0NulbO+V2ZVz7QW6CF6hd4jzyUfW lA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Cw7TQySZDNq1H7yiD3uwGAO+rvFVDcYN9ftTDwx3Cz0=;
 b=rxFws+nHcdTSGHz1VxIGZwWt3cPF9/miQWmmEYJdIUTjWLe8z607Ar9raQsTsuZQpN3f
 vCGG3Wxl17a9KthCC9IMKXzx2JhooS6qS2j+gih9PeywbPTc+TLcSEohyvtJjWkceOrg
 DASdH11ju6gCoclndx4K2qcvUsPGprZ14WKOvKSWKW94CXsuXUTW6Vu9Ri9Z7WPc4Yf/
 /gz9DXD+oPUJx6AVt9h7SyVnXUDoWu8erVv29qSBl5lp1y6Q9IyqR1Mlt3kZ8qCu/KO8
 /l0+PQJVEoSdr7w1EJJXGZtql5bPAjYEjVag10h5pSrNLceQmvX6iTz+04hV5FkmdUdv dg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ab17ds02t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Aug 2021 16:02:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 179Fu66h003133;
 Mon, 9 Aug 2021 16:02:16 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by userp3030.oracle.com with ESMTP id 3a9f9v95wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 Aug 2021 16:02:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTmBwEuk78V1Y9/zqJd9OnApZqMDBv2YN8I3JqgE5Fnlda5WIq4hVpuSC0p5zfNzbfoJHuAVPD4RqDBAsX4fLherVasqy0NMUyU4eukrcO4RTmoP9nxfVSGcbjwEWhijFNmj+8+ouNgBpA++RvDyRL8ilK7FkNxIGrS1lbrej8SG4Vu3inNAmQl8q/4UhNVryvmAjkENnFeM6+7GHXpJ52dPyB3ox89js38C1kTX8Xr0c0rWU/Ihl+Ako8lJIMR5kxC+jyHOTMmt+nRvnDyPov6GqG6IcpHcPclmEQstAoLdEAL15KI/zno5u6ee6rb6vRKM4KcmshEme43txbyqWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw7TQySZDNq1H7yiD3uwGAO+rvFVDcYN9ftTDwx3Cz0=;
 b=DELEyTA21BctbW25yZDPdemBzlVO+Rm3fyrm/GQAHVHor6Li2UyOIGcGM6+SmmgYvzB6tlXjBeuU79ZFjhN8de4HCLMhjV/pYFLctP3aH6HtWxayiFybGVBGy8oj0ttBMcl9deBMa+jxbg+EntTR6n1nK2w541MdeS0E3hnqupawYCIotwXKhkS8N1zljwXD75pSvbmAi5xJ43MUib40EiebQXIOh5LpmB8QDhYCFg02GuuVU9qLOJlCgLTHfHJu2eha1MYjZwY7tBAwBQ4C4eb+Gi7cWCzEsT7J4MxwQ2c/lRMC4aPoVcOFF7PfzA6xW7LRR/kven5ibqNXDKeDbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cw7TQySZDNq1H7yiD3uwGAO+rvFVDcYN9ftTDwx3Cz0=;
 b=XZ54Y5P/Rmvkw5X4Uq8mRkpeXU0AwX4gMSd8hUtbcj/AXiuSkwoeZnB5jM8fJ51qV6M7q4G//vl0PR75TgkwrebLXR9iMYy8Ox7B7I4GJKhZZNMoWs4QAWObO43wbmCO1duja4I9v9BMipZ7zxSHVigQCPG55iRp8T0uFsIvqPE=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3939.namprd10.prod.outlook.com (2603:10b6:a03:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Mon, 9 Aug
 2021 16:02:12 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::5cdb:a037:dbd1:dcac%6]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 16:02:12 +0000
Subject: Re: [PATCH V6 00/27] Live Update
To: qemu-devel@nongnu.org
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <a54c4e60-6153-82fc-4b3d-eead2239c406@oracle.com>
Date: Mon, 9 Aug 2021 12:02:07 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:208:236::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.21] (73.219.99.178) by
 MN2PR05CA0050.namprd05.prod.outlook.com (2603:10b6:208:236::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend
 Transport; Mon, 9 Aug 2021 16:02:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c425f0b-c3aa-48f5-395c-08d95b4f0c1c
X-MS-TrafficTypeDiagnostic: BY5PR10MB3939:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3939C88132F5E1D9950516CDF9F69@BY5PR10MB3939.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ia+8ZL6WcczKIzN1qQwsYtpEeq5Xcj9XNVtA2GqT8v41t2rtlUjN3oovoAJk1r1Eo4WntvK5BbvwbPdWqctBxF7r17n0QQNiRHdGV762teMviBWEs/CoIw5wuoBp4gffHgISySgYZ7hifjIpUt7zVmOznes21EncxJK3Y6KqoktEJlpTtmRwt9peT4134PTgFaFoiegydJhQK1r4GmJWZfIGD83tgUuHlk+obIkG+/908++09tqYlNfuAfUrrcchTusVVZzRuM4JbZU0ZGnc6gtVIsO4w2kQYUrXsCww/wLZuriVXeRS/rk6aUs33MzkUTVXL2lhM66mGbQdGO5TsiTNzddXdL4m9nMMrrl5k0Ucx1Fj+JGUrafoZdB8RXzE/ZmaWvm143sJIOIU3zHGPawWMyfzPwyZHo1NuM2xuBy8pTjjecL1vmo5jtmCZAq4T4rPdJ0M5LWaOsb4Sf5g+moeRgjVxi/WW8O1wRig5XD/JrpIUtwGG6rXjKpwQdeilWlbyw1rb8EH4Y2Lh65iD1Cr/IyfFRXSotXpp/ZfVsTbywfdc+TdZgzHf+DNsE7Qzb/dfn0cwoUFRziqU3vOMvN0pTa3Y0YERrik1cZiCOnuTYgItmpgbrsmvd3bwyHhIrC78h0mYvZUAv3Co7niOEXWme5cRby6fWxurBZjGtjmv6zmLEUmHlzxOZMpTU8gMe0ImNcivecnV5dMEAW/GZEm6sMVG/vvl0cNoWj3YC60Pw3mnTLq+5Pc1m3z9LSVkIatNPFINUXNH8UwGyTTGVAKK82rf/at0CvFaLBK3AjVlYX/vQNcp6ao0kCI20T84IUkH1oKYr/ayuVRfgleVHuTkjIVezU2heSxZPkxDos=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(396003)(376002)(136003)(366004)(966005)(36916002)(478600001)(16576012)(86362001)(316002)(38100700002)(31696002)(4326008)(15650500001)(7416002)(54906003)(2906002)(31686004)(8936002)(83380400001)(53546011)(8676002)(107886003)(6486002)(186003)(6916009)(5660300002)(26005)(44832011)(30864003)(2616005)(66946007)(66476007)(66556008)(956004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STVZbU40TS8xMmtOY09laHB2Z0NWUFlIM3A1a0wvNVorZ1NwOCt6MnBmUjFz?=
 =?utf-8?B?aHVHZXU2bzRvT095V0o1VHRyWFdUUDFkeXJncUV1bTlndWtNYmhHT3dPTlls?=
 =?utf-8?B?Z3pHa2QwYitleVBtQlIwYlJydTlveU1TRGh4TEFudUt6NnhBMVA4R3ZIT3o1?=
 =?utf-8?B?Mmhwb0NpV3dKdlZNWCttcHl1SkR5ZWdpN0d6dnVCRFRCUDh2MHozbk5VZmxB?=
 =?utf-8?B?Sy9FV3huN3BFbVc5SFdhU3VNR2Fza0hMVW84UlA1ZnpvNFVPVHZDMndITjBo?=
 =?utf-8?B?L09ZZ1Vvb1pscmp3eXk4RkhiWXMrVzUvNE9XTWpKWlU3NzlQbkM3TU5Db1Mz?=
 =?utf-8?B?eTVtVklNQ2UvUUp2U1FxZXI4ckl1aGdlc0RtMGxCMmFFWHlabHNmWHhnMnIy?=
 =?utf-8?B?TDRQUXRzdFo2bGlQbzFBQ2xUMG5hN0d1UCtaZUtMRDNBaWlGQ1M3N1hFa2Mw?=
 =?utf-8?B?TlFpSFVzOGZOM2c2UWVFY29kdWpTbzMxSUZYcFhJeGVqeEErYTVFR2VBMEo2?=
 =?utf-8?B?cVZyeXdaOWZNY2o1OGZ3ZWd3TmFMbURXRGdoSG03WkRtTlAvdkoxSXg0dU04?=
 =?utf-8?B?TFR5Y1RmOVFtYzI3SGxreVMrZ2xNeXpGT1hrbW0wRXROcER6cjZzeVF1TGl6?=
 =?utf-8?B?dGZjeWRnWXgxZ2IrM3cyNGdXVE5WdlVWWElHOXQyb1ExM3R5clF0Q1plekIy?=
 =?utf-8?B?ZXM5QUlGMUxaTkFaRUtoTzFTRHQrY1RVUk50eGVjWW1LdU90T3UvSnRWb0VV?=
 =?utf-8?B?RHh1dTNLTTNQb0sxZ0x4Mk1peTBHNVFsUGxFMVZyMDdGQWdiem53NHc0T2J1?=
 =?utf-8?B?LzVoTHcxTlNyd1h6MzBib3F5alB1Y05mSzdidGNFYmFDUjNhRmdMcGJUMFRu?=
 =?utf-8?B?V01TZ2s0cC9TWms4VzA3azI4WWtaVEx5VEJxY2xBbjdSY3RENUJjQlBRUzIv?=
 =?utf-8?B?KzhmclQ1WFBWZlBuL1ZSUlYyNitKaFdwUUpON0tjNUtGZFVaWFJoZHpvZ2VC?=
 =?utf-8?B?bUptak9IU1UwSjVsUktzbGdjT0p3V1NaWTdRN1Vidm1HRytjQ05Hdy81bHlB?=
 =?utf-8?B?aTFSTko2VWhqNFdxRTBRa1Q0UnRIVjBYalZKdDZKNnBRcExuZmwwVVNBWFM0?=
 =?utf-8?B?Tm0zMlFYS0Joc3pCakJhMmJpb1U2aDM2SHU1YzNPRVk5Z1B0WDFVQ2JWbnRP?=
 =?utf-8?B?TmhrUCtsWmpqZ0dFNXJMVFp1SitudDd4THBlWTcvbkFHUVhaT2g4ZEt0eTc1?=
 =?utf-8?B?SDIrZHVpeGpzdFJIUWtkMm1jMWowWCtjZ0QzMjdqSmlJc080eVBLQStSL1hN?=
 =?utf-8?B?a1lOUlA0bDY0QzREWkhDaXhaZUVkZjlDN2Fwc2hIV0o3RWM0SFV0c09xT0Jn?=
 =?utf-8?B?MUZaR2xHdkhyZVVSVEFvZ3Nad2R6MmJxSlNRMjRSY0VUc2VmanpGN3hrR1BH?=
 =?utf-8?B?cThHVjRWZ1dxZnBHNkVYcEV0a2hnTGtmUGI2Z2VRWC9ldkVRWWhhdmxnbFlC?=
 =?utf-8?B?Z1FNRXlQbU81b2UxUTFnMnZsaUJJb01IYStZS01hN1R6RVFoNnI5c0xYcjA5?=
 =?utf-8?B?dk1HUzlldmxSNllNWTc2c1o1QWlnQlJtNzNwbkdWcmJCNVRhS25FZjZNZzU2?=
 =?utf-8?B?YUsxZTZvckxiRGsvTnYxcThOUDVqYmRWM2RzRDJhZCtSYzJrNEhBYkpXWmxw?=
 =?utf-8?B?c2VOQzlVSE92NE9Mdkt3R042RlRBUXhVb3ZaQmJ5NTJxQmliVTJ5K25STVph?=
 =?utf-8?Q?YrbfLqxBVgxyf9WxqOo3JOqvgMlhaZGKgDzFBDg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c425f0b-c3aa-48f5-395c-08d95b4f0c1c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 16:02:11.8942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UeyI4Cl+4T78Ex8TxP9ZIdcL3EOY2aIidB/RYzDfXi+0FLIFI5ehQFp9nAA8zCM09ZZv0dH/TA/pFE/93feTtwCPS12Rf73lWJwrqqXUF3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3939
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10071
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090116
X-Proofpoint-GUID: q7l0BkJNwSkZ-knC1T_w7GMIQGh_C2D2
X-Proofpoint-ORIG-GUID: q7l0BkJNwSkZ-knC1T_w7GMIQGh_C2D2
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

I forgot to mention in the changes list: I added a new mechanism to save fd values,
in lieu of the environment.  See [PATCH V6 13/27] cpr: preserve extra state

- Steve

On 8/6/2021 5:43 PM, Steve Sistare wrote:
> Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
> These save and restore VM state, with minimal guest pause time, so that
> qemu may be updated to a new version in between.
> 
> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
> any type of guest image and block device, but the caller must not modify
> guest block devices between cpr-save and cpr-load.  It supports two modes:
> reboot and restart.
> 
> In reboot mode, the caller invokes cpr-save and then terminates qemu.
> The caller may then update the host kernel and system software and reboot.
> The caller resumes the guest by running qemu with the same arguments as the
> original process and invoking cpr-load.  To use this mode, guest ram must be
> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
> 
> The reboot mode supports vfio devices if the caller first suspends the
> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
> guest drivers' suspend methods flush outstanding requests and re-initialize
> the devices, and thus there is no device state to save and restore.
> 
> Restart mode preserves the guest VM across a restart of the qemu process.
> After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
> which directly exec's the new qemu binary.  The arguments must include -S
> so new qemu starts in a paused state and waits for the cpr-load command.
> The restart mode supports vfio devices by preserving the vfio container,
> group, device, and event descriptors across the qemu re-exec, and by
> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
> and integrated in Linux kernel 5.12.
> 
> To use the restart mode, qemu must be started with the memfd-alloc option,
> which allocates guest ram using memfd_create.  The memfd's are saved to
> the environment and kept open across exec, after which they are found from
> the environment and re-mmap'd.  Hence guest ram is preserved in place,
> albeit with new virtual addresses in the qemu process.
> 
> The caller resumes the guest by invoking cpr-load, which loads state from
> the file. If the VM was running at cpr-save time, then VM execution resumes.
> If the VM was suspended at cpr-save time (reboot mode), then the caller must
> issue a system_wakeup command to resume.
> 
> The first patches add reboot mode:
>   - memory: qemu_check_ram_volatile
>   - migration: fix populate_vfio_info
>   - migration: qemu file wrappers
>   - migration: simplify savevm
>   - vl: start on wakeup request
>   - cpr: reboot mode
>   - cpr: reboot HMP interfaces
> 
> The next patches add restart mode:
>   - memory: flat section iterator
>   - oslib: qemu_clear_cloexec
>   - machine: memfd-alloc option
>   - qapi: list utility functions
>   - vl: helper to request re-exec
>   - cpr: preserve extra state
>   - cpr: restart mode
>   - cpr: restart HMP interfaces
>   - hostmem-memfd: cpr for memory-backend-memfd
> 
> The next patches add vfio support for restart mode:
>   - pci: export functions for cpr
>   - vfio-pci: refactor for cpr
>   - vfio-pci: cpr part 1 (fd and dma)
>   - vfio-pci: cpr part 2 (msi)
>   - vfio-pci: cpr part 3 (intx)
> 
> The next patches preserve various descriptor-based backend devices across
> cprexec:
>   - vhost: reset vhost devices for cpr
>   - chardev: cpr framework
>   - chardev: cpr for simple devices
>   - chardev: cpr for pty
>   - chardev: cpr for sockets
>   - cpr: only-cpr-capable option
> 
> Here is an example of updating qemu from v4.2.0 to v4.2.1 using
> restart mode.  The software update is performed while the guest is
> running to minimize downtime.
> 
> window 1                                        | window 2
>                                                 |
> # qemu-system-x86_64 ...                        |
> QEMU 4.2.0 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update qemu
> (qemu) cpr-save /tmp/qemu.sav restart           |
> (qemu) cpr-exec qemu-system-x86_64 -S ...       |
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: paused (prelaunch)                   |
> (qemu) cpr-load /tmp/qemu.sav                   |
> (qemu) info status                              |
> VM status: running                              |
> 
> 
> Here is an example of updating the host kernel using reboot mode.
> 
> window 1                                        | window 2
>                                                 |
> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update kernel-uek
> (qemu) cpr-save /tmp/qemu.sav restart           |
> (qemu) quit                                     |
>                                                 |
> # systemctl kexec                               |
> kexec_core: Starting new kernel                 |
> ...                                             |
>                                                 |
> # qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: paused (prelaunch)                   |
> (qemu) cpr-load /tmp/qemu.sav                   |
> (qemu) info status                              |
> VM status: running                              |
> 
> Changes from V1 to V2:
>   - revert vmstate infrastructure changes
>   - refactor cpr functions into new files
>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
>     preserve memory.
>   - add framework to filter chardev's that support cpr
>   - save and restore vfio eventfd's
>   - modify cprinfo QMP interface
>   - incorporate misc review feedback
>   - remove unrelated and unneeded patches
>   - refactor all patches into a shorter and easier to review series
> 
> Changes from V2 to V3:
>   - rebase to qemu 6.0.0
>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>   - change memfd-alloc to a machine option
>   - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
>   - close monitor socket during cpr
>   - fix a few unreported bugs
>   - support memory-backend-memfd
> 
> Changes from V3 to V4:
>   - split reboot mode into separate patches
>   - add cprexec command
>   - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
>   - add more checks for vfio and cpr compatibility, and recover after errors
>   - save vfio pci config in vmstate
>   - rename {setenv,getenv}_event_fd to {save,load}_event_fd
>   - use qemu_strtol
>   - change 6.0 references to 6.1
>   - use strerror(), use EXIT_FAILURE, remove period from error messages
>   - distribute MAINTAINERS additions to each patch
> 
> Changes from V4 to V5:
>   - rebase to master
> 
> Changes from V5 to V6:
>   vfio:
>   - delete redundant bus_master_enable_region in vfio_pci_post_load
>   - delete unmap.size warning
>   - fix phys_config memory leak
>   - add INTX support
>   - add vfio_named_notifier_init() helper
>   Other:
>   - 6.1 -> 6.2
>   - rename file -> filename in qapi
>   - delete cprinfo.  qapi introspection serves the same purpose.
>   - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
>   - improve documentation in qapi/cpr.json
>   - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
>     qemu_ram_foreach_block
>   - rename handle -> opaque
>   - use ERRP_GUARD
>   - use g_autoptr and g_autofree, and glib allocation functions
>   - conform to error conventions for bool and int function return values
>     and function names.
>   - remove word "error" in error messages
>   - rename as_flat_walk and its callback, and add comments.
>   - rename qemu_clr_cloexec -> qemu_clear_cloexec
>   - rename close-on-cpr -> reopen-on-cpr
>   - add strList utility functions
>   - factor out start on wakeup request to a separate patch
>   - deleted unnecessary layer (cprsave etc) and squashed QMP patches
>   - conditionally compile for CONFIG_VFIO
> 
> Steve Sistare (24):
>   memory: qemu_check_ram_volatile
>   migration: fix populate_vfio_info
>   migration: qemu file wrappers
>   migration: simplify savevm
>   vl: start on wakeup request
>   cpr: reboot mode
>   memory: flat section iterator
>   oslib: qemu_clear_cloexec
>   machine: memfd-alloc option
>   qapi: list utility functions
>   vl: helper to request re-exec
>   cpr: preserve extra state
>   cpr: restart mode
>   cpr: restart HMP interfaces
>   hostmem-memfd: cpr for memory-backend-memfd
>   pci: export functions for cpr
>   vfio-pci: refactor for cpr
>   vfio-pci: cpr part 1 (fd and dma)
>   vfio-pci: cpr part 2 (msi)
>   vfio-pci: cpr part 3 (intx)
>   chardev: cpr framework
>   chardev: cpr for simple devices
>   chardev: cpr for pty
>   cpr: only-cpr-capable option
> 
> Mark Kanda, Steve Sistare (3):
>   cpr: reboot HMP interfaces
>   vhost: reset vhost devices for cpr
>   chardev: cpr for sockets
> 
>  MAINTAINERS                   |  12 ++
>  backends/hostmem-memfd.c      |  21 +--
>  chardev/char-mux.c            |   1 +
>  chardev/char-null.c           |   1 +
>  chardev/char-pty.c            |  14 +-
>  chardev/char-serial.c         |   1 +
>  chardev/char-socket.c         |  36 +++++
>  chardev/char-stdio.c          |   8 ++
>  chardev/char.c                |  43 +++++-
>  gdbstub.c                     |   1 +
>  hmp-commands.hx               |  50 +++++++
>  hw/core/machine.c             |  19 +++
>  hw/pci/msix.c                 |  20 ++-
>  hw/pci/pci.c                  |   7 +-
>  hw/vfio/common.c              |  79 +++++++++--
>  hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++
>  hw/vfio/meson.build           |   1 +
>  hw/vfio/pci.c                 | 301 +++++++++++++++++++++++++++++++++++++++---
>  hw/vfio/trace-events          |   1 +
>  hw/virtio/vhost.c             |  11 ++
>  include/chardev/char.h        |   6 +
>  include/exec/memory.h         |  39 ++++++
>  include/hw/boards.h           |   1 +
>  include/hw/pci/msix.h         |   5 +
>  include/hw/pci/pci.h          |   2 +
>  include/hw/vfio/vfio-common.h |   8 ++
>  include/hw/virtio/vhost.h     |   1 +
>  include/migration/cpr.h       |  31 +++++
>  include/monitor/hmp.h         |   3 +
>  include/qapi/util.h           |  28 ++++
>  include/qemu/osdep.h          |   1 +
>  include/sysemu/runstate.h     |   2 +
>  include/sysemu/sysemu.h       |   1 +
>  linux-headers/linux/vfio.h    |   6 +
>  migration/cpr-state.c         | 215 ++++++++++++++++++++++++++++++
>  migration/cpr.c               | 176 ++++++++++++++++++++++++
>  migration/meson.build         |   2 +
>  migration/migration.c         |   5 +
>  migration/qemu-file-channel.c |  36 +++++
>  migration/qemu-file-channel.h |   6 +
>  migration/savevm.c            |  21 +--
>  migration/target.c            |  24 +++-
>  migration/trace-events        |   5 +
>  monitor/hmp-cmds.c            |  68 ++++++----
>  monitor/hmp.c                 |   3 +
>  monitor/qmp.c                 |   3 +
>  qapi/char.json                |   7 +-
>  qapi/cpr.json                 |  76 +++++++++++
>  qapi/meson.build              |   1 +
>  qapi/qapi-schema.json         |   1 +
>  qapi/qapi-util.c              |  37 ++++++
>  qemu-options.hx               |  40 +++++-
>  softmmu/globals.c             |   1 +
>  softmmu/memory.c              |  46 +++++++
>  softmmu/physmem.c             |  55 ++++++--
>  softmmu/runstate.c            |  38 +++++-
>  softmmu/vl.c                  |  18 ++-
>  stubs/cpr-state.c             |  15 +++
>  stubs/cpr.c                   |   3 +
>  stubs/meson.build             |   2 +
>  trace-events                  |   1 +
>  util/oslib-posix.c            |   9 ++
>  util/oslib-win32.c            |   4 +
>  util/qemu-config.c            |   4 +
>  64 files changed, 1732 insertions(+), 111 deletions(-)
>  create mode 100644 hw/vfio/cpr.c
>  create mode 100644 include/migration/cpr.h
>  create mode 100644 migration/cpr-state.c
>  create mode 100644 migration/cpr.c
>  create mode 100644 qapi/cpr.json
>  create mode 100644 stubs/cpr-state.c
>  create mode 100644 stubs/cpr.c
> 

