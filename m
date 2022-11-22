Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147F633E0E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 14:49:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxTdd-000857-23; Tue, 22 Nov 2022 08:48:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1oxTdX-000810-HW; Tue, 22 Nov 2022 08:48:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1oxTdU-0005qq-4O; Tue, 22 Nov 2022 08:48:31 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AMDfQ3m011753; Tue, 22 Nov 2022 13:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=MNx+gtBVRER9/V7CW5ZlekpoogoYqkZXxOaQyJwHHCA=;
 b=2jZScO1aRbDTGH+1y+chry2j+fueA5sM/FASYkDw5Fow832bfAIAFIoSnoCBNrhZFQVT
 66iRo/pu8ecc2ycnjl/kF0cy7zAIi/sXusgg7kLN3XJvAQGRUik//0sR/N7QhQ8PlvOr
 rTheWgJtxhWtB0T9AT9Vk0uYCN2tky8S1QXDJ0B6u17/qfPPjmeKjhd82mRysMJIE1wx
 jfpRwE/gD2E9hi9O6LhMrlrLQtcjRjZQAJLG9q2oo5bmkLC4TB/kqYQbkMTNF7TPccZ/
 wzN5BY1WD0oZJbfYWWAjP4K0nZMU2RG5l+xeIGAOxuYGadUO803/8hrTYFzNsT1Jth2x lg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m0gas2cxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Nov 2022 13:48:22 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2AMCm4hr039507; Tue, 22 Nov 2022 13:48:21 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kxnkbp1ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Nov 2022 13:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvtPNb/dcNa3pM/zQiTUVyOa95GsDBQHRTMvBh6GmHpb6TOkg9WGyuaM9vevpjrZkm6U1J7Ijq6DCxcp4RUmnF10cC5nnMZvxQPvwAUsh4MuhrDXP+FXg7Mo++Xrw8zJVzKX5a0d8+BTFkpNW4OcGE7WD/j0DQPpfKNO92BWKeICgDFsC00Gt4esgkLk1rSqvq4Q5V+0WekGFZryNhAz1M+2t0YyJ0ZxShgWhU6u6jvGdlsW6WZArq7O2ettq1xuQpz81DFuPuftQ6VrsPh8yRSIVJRE0cryiOl8uSOn/sMTHAAkdeSvz+rv6oBRnSjgSllh0dr8Ue47sZh3YqS1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNx+gtBVRER9/V7CW5ZlekpoogoYqkZXxOaQyJwHHCA=;
 b=hDyN14S7K2RRgPbHNHiHYDoMJRE1vElDIkX0cASalKJQpkDyfKCizHO3tnKINZlw28RFxm1afNo3lyvBFbAeSEXPlftNGQKSuBauSEkByznIXOlY4/U8gcI4OXQ/hA51/giMWKRAj/amcCDRUH46figQNeVX5cW9o2vq9DmoyHa7GUTh1J5b9U+o0xbZ2Gnou4T9k7xYl34PeluFGsaCPSA8KPo28O7g1k0Ii4dpUhB8a7ZgFqbbAGiQcqFG6Srlpzxv6OvAwosIbHyOF6IVb/ob4c2uGiYxlFlwr0GQwnBvPT4kXSjXqOJhHCiBeDC7pQnjd/RGwscsFVgez3RgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNx+gtBVRER9/V7CW5ZlekpoogoYqkZXxOaQyJwHHCA=;
 b=LaDcZYd31xNJNq+QawFUsC4EmQXaImKaVVBzousfj3SW0bNsEcG7bRTvt6IduDAgkzmBK9avylZSTQn48OevCXMruk+DlMSKaCNtQ05Aes736xlYcQNMR5Zc9ZKJxK4XkGdHOUS2I7PwvmxtD3eLDs25coc9CvkZfe+zaQgFc+U=
Received: from PH0PR10MB5894.namprd10.prod.outlook.com (2603:10b6:510:14b::22)
 by CH0PR10MB5225.namprd10.prod.outlook.com (2603:10b6:610:c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 13:48:19 +0000
Received: from PH0PR10MB5894.namprd10.prod.outlook.com
 ([fe80::6d72:4f59:e5d5:1de5]) by PH0PR10MB5894.namprd10.prod.outlook.com
 ([fe80::6d72:4f59:e5d5:1de5%9]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 13:48:19 +0000
Message-ID: <0db559b1-259c-5f66-4c18-c20deb458119@oracle.com>
Date: Tue, 22 Nov 2022 15:48:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] target/arm: build smbios 19 table
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
 <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
 <CAFEAcA8isy4_0iYHWX+3RksCNQwT3U_SH14xg6t-KUPx4b9d=Q@mail.gmail.com>
 <4b4ea622-871f-749a-1de3-b260e1d64b1f@oracle.com>
 <CAFEAcA8BpE2N_91J1HXRvC0CqWLwpMhgU6prh6aO3PLO1C4Lww@mail.gmail.com>
 <CAFEAcA_LYASx7t9pNJs8BsQUwdEsNNq8P-a38PhJ36ivJFLRDg@mail.gmail.com>
Content-Language: ro
From: Mihai Carabas <mihai.carabas@oracle.com>
In-Reply-To: <CAFEAcA_LYASx7t9pNJs8BsQUwdEsNNq8P-a38PhJ36ivJFLRDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0455.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::10) To PH0PR10MB5894.namprd10.prod.outlook.com
 (2603:10b6:510:14b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5894:EE_|CH0PR10MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: b38286c4-1886-4371-911f-08dacc903690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZNcqhHizsYd2nV17ly4MIPDYT30zCESAuOLCKWMzHzByWAVgMV6abpqU7Oo4SAJfK3YgFuzTiGEwUMlZd/ABW49GkaAePJZ32hDZJaAIf3rfuxlneKHh0oFC6HiiNHa5P/53vY/u0oZqvvAPD75RJVTDQy6u4gwkIDf6ZSbhh821HBarQ/ROZl6LCmLGW1ecZN8I3P52bPo5VSA/gJW0902DsWvz/kwOXVJK7nEj5X8VgaYqzn4sDj4wroxhl4sFPYnEWl6aUUJwB1gjbxT4viQueq7bvDyLXTFwzIG2wm7EeNQztjkq7rIHJNZyiIA6XeffXKQVLrT4JmLkurJJESNc8f84mZFQS6z/owZsvmUfDYFxWR19xU6up2skCS+Q7uLV6USMZXwdcSDRcYtjP776a60kBE9Kay3d+vE9k1qCSeLbcaQ78r0K5PWy1CEoMeuP+IaF7L/TGsCYC6YDLjywzc0VzQd3YEvjoHmNHNy+I/vvhwKi7OkMxxAhWONNGlyOibHcP8uhR2gM9CrEZIi2lEhbJ3HY/szbnhOWsyX5rKMhMyGb71c1nfzpkK/I6EpCvJVxycRkgbbbAfH9CcFxMgkSH1n+FwBqHfMrzCfDQ4bMvom0ZO0F65z0nCl3/NUzCi8ld7UBN7fiwGEXxeo5k4aiSuZmhCS4X+vWVl9jrOZJY3EwzGGpV1p4HrToMYB78Md57eu893gYo/vU5coL5zIiuXVOtbY8o1SaGRPmJjVSHXMKpJDM5UiLrKh8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5894.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199015)(83380400001)(966005)(31686004)(6486002)(36756003)(8936002)(86362001)(2616005)(5660300002)(31696002)(38100700002)(41300700001)(478600001)(26005)(6512007)(44832011)(186003)(66556008)(2906002)(316002)(6916009)(66946007)(66476007)(4326008)(6506007)(8676002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NocURrMWxZREM2RDQ1VG5OalVFTzNaRm91RFAyamlTMkVUMXpla2xZMG5D?=
 =?utf-8?B?YlcvUkRlYy94a0JDUmJETHdZN3VRM093SXBEeHRIM2FVUTF0R2E4T29GRWZC?=
 =?utf-8?B?Rm1XYUFBbW1RYWNmelVnME9udUlCU2g2czZzUzNTelBRNDNSU00vQVlORzdj?=
 =?utf-8?B?Ym9OdUNIL2ltS1ZXUGoxUy9IL3VzNGVPaHIwdU8wci9vYXUrcS9kZWtXemJJ?=
 =?utf-8?B?MHpLbHdiYnJNUS9KV3BhMmR4d0g0MU9oL0JDMjRISElCeFlHTFpWYlRkeXF4?=
 =?utf-8?B?Vm5JL3JqSk1FeUN5M1hrWlM1eTdIdkF5SDNqNDdQdW9KWG1iSVU1ZU54eTMv?=
 =?utf-8?B?dWZMM3FkKzgrS1J0TG1wM1ZpbzV2M0R3SUNncnVyR0I1dDhDZEg2QVJaZm5t?=
 =?utf-8?B?SHlrTTdvVmNaT01tQmhhRC9wYmUxN2FVOHRES25NS1FzOUFwSEI5UENuREls?=
 =?utf-8?B?T3dLdHlFVUlyWnpMNTc3bHZkVWF5bGVJeFZBdStydUxrMEV4aGV3QmZ4Y3JH?=
 =?utf-8?B?OGxncnBCcVhqN1ppdnNEY3FXRnV4L2x6ekdFN09jbE5HaGdJTTZsMklaVnJK?=
 =?utf-8?B?bEp2OTZuMjhkeStOVEJxL2VWNTdUUUFSWmEzQzAwL2RwT2p5L2hWVEZwZ3Nv?=
 =?utf-8?B?Ukl4cnZidUtsWHN1bkFqeVB6eFVqdGg3MmRRUE5UellEK2UyS1ptQ3JBNHoy?=
 =?utf-8?B?VDFrSmg3RFlnV1JlSjdOd1FXblZ4UStCV2g1YlJlL2kycUxCVWNXTWFNalVO?=
 =?utf-8?B?eVZnZU5DM1BZcEpSeUxGOURNUVRmcnJPNHJvUkVTNVoyb1RoaUpaNmVMTS9u?=
 =?utf-8?B?ZXh2dTNrM1QrWHkybVJLNFdpVk5wbmVVVkxmZk5RV29GdHdWTkpyU3pYemh5?=
 =?utf-8?B?dm05Vi91S2llZWZ5bWk3aTlVeUFyeTd4Q2NMaHFMclV3cFBWZVZFKzdKaDdx?=
 =?utf-8?B?VHFtSW9IZWV3ODIvUzZubVloUWhXdjAyOTZuSXd3YWFTOXRPeXZOK3preWZS?=
 =?utf-8?B?Ymp5TUN6Z3BCWnIrQ0w2QXdBUnZydm1CaDZTK2xLTHVENzlJTVFwZ1phQzhh?=
 =?utf-8?B?KzFwb2UzbHVMUUkzaFRFU3J3WXRodzVhL1VCZG1TTXA5NnFhOTViK3EzZDBH?=
 =?utf-8?B?YkhDdkZEaURLcHhaQmVnZlV1UGV4SG5YU251U1hlU2wwcDZrQm4rMS9aeEJk?=
 =?utf-8?B?ZTdicXlJUzc4YW5FNVVzNWlXcnArdUswbGtKR0xJRkxwMnhpVXNxRWdIdW9q?=
 =?utf-8?B?SnBseXpFa3hwOXN3a2ZZNzN2NVhlSUthbGg0NHpCd010M1kvMUwxZWd6blJM?=
 =?utf-8?B?UWxrQWlJWFdrTjZ4NUQ4ejlxbXFSRVNTZnNsMXZWdDZjZ25qMHNlUVVEVndR?=
 =?utf-8?B?anlKeFp2S2xuMm1GWG5nNjFhbW52QytQaDZoc1R6WVVtZGloVkcva2VFbitF?=
 =?utf-8?B?VTFXNld2MUN4TkYxWnY4b3l1eXpBNzFtRkN6RmxMMUlQRzByUnZ5M0duWXlt?=
 =?utf-8?B?NDFYZHBud2NCOG1JYVhlcVR3K3ZISjVMcy9HQk0wV20ya1hKU2xGRUYvdncz?=
 =?utf-8?B?RUVaQTNRbmFZSGw3eTUzV2NySmZmMnVZT1ZXOXV1ZTM2c2dzUUE1ckJUSTRO?=
 =?utf-8?B?TlduNFpnMXh2WFd2MWF1T2NGUStMS1k0UnozbC9zb25scnM5VVlxdjduNTlk?=
 =?utf-8?B?TUMwRm9xNXZwanlPOVk2Q0tEUVltdFdmS3BFYUNsUmM5U2tVeDN2OWRKd2h4?=
 =?utf-8?B?UHJBaFFacmZNYlh1UVBPcEhJRkVlM1NMZkNjNVA4ZDZVNkJQRnFtQ2F5TFhO?=
 =?utf-8?B?T1Z4SUJlUHYya0h6aHVjZERpV0RrY1BpNWIzZ01XZFBDMTlWbXhLNUJQNjJ6?=
 =?utf-8?B?Q0pXdjNDN2tISnEzMmQzTTRLTVA5c3hoSEVvN3kvOWtDbWV1Yzdpb0M3VXZP?=
 =?utf-8?B?Q2VLTXlwWS81bVNKMi9tY2hUbWoyY040ZWRpaHhnUDhmd2RnVWtTNWdNRjZH?=
 =?utf-8?B?Sm0xY1lVT29nWS9FMUtoYWJHdVlxMkhqQ0NWV3l2b0hzZDVBaWp2RUxJRkhu?=
 =?utf-8?B?d2RtMlNGK2tscWRsRW4xZUtjcFNtZkJnTUlOdVE5cm91Z0dVNGhhbEFaZUpz?=
 =?utf-8?B?Y3BFSkZZL2F1WjcwcVo0Mngwd2hiMCsrNnhYRVROdE1xdUVqeXpoRVU3QVFt?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 6YlDLuRZ96Z03jh3blt36pDA+pCOP+nGC+o4szZndya78Mn32dedwu8PWihg9hULYlwE4U4Y/B0iOFa6dtB4qJoONcNg7E4U957WTU56O/LUIvZ3RPxynFQws9ofPFGELB3xZ6Yog7kPW7njbKSlLj5yBMU8TDcfeTBXSUmgZfH+jYL+dXbNSO8nb6T9J0W3/TvJ4wnrTsnlJoYAtjTqpjBDPsrwLAW7L3HDxwoLPOMHJ2DzBObyPSJT0vHx6St2ue1CqdVqBdlejjP5MthZncirWLJfYmG6vpLcB1wcoEVg7r6b/ZT6b76uhB8j0fCsGIAzYst7XkQsw50MSu1rPjMuB9pB8tbtwiuSpRBEdjWbDJDbo2C/zSmhizl6Wkul5v2lh3xmaZUwFRrGsubgMGcLI7GDJKOjT8WSM03WVyiquus3Lrg4uhvU4gLvkSBk91F8zy7wwYgvHtuce7oFJsluWwfzsEvtDD0ujqTeBKqEcU9qfeuAM8WyqpaxTVZsqcsoSw7HCClaEKP9iNjTcPmuksKjVMsWvXqhNNhD292oJE95ATh+MmcuKDxkg++oikNfBWWFlsUbYWRfgHd5ps2TBeb6wiGhAHiMJos/jQgtBC6gt7D4TVzHTVgbCMfn92jXbW6OPJmPmJIIMUKbAzHKXsCl31FCX9rXqyfrucnTXTsWAnBUj9K4+F7SgmgF9ZpSxB0EQI1zfxGALLN+20v3On831zZQMT2zv6wf1CjnWr7COB82sWMnXz+dIupRLZpx3uOwBHRcCtjT+cQozORxH0QOfmq4wXcrWPKIczuyc+LYe1P49OedFrrvjGKP
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b38286c4-1886-4371-911f-08dacc903690
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5894.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 13:48:19.1803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klDuwLS6V/TKEhy1BNR+NaRvZE9atMQZ0HP+iAZULonUXZLvdtG/7Ky5iuNfkdFqqoQzRqYApO+J2lQubnlgVhKYQtkAzGTvWOr0Z/KFIDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5225
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_07,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211220102
X-Proofpoint-GUID: zvOe1OFIXdsYU27GCPacKW4OxW6zLbXP
X-Proofpoint-ORIG-GUID: zvOe1OFIXdsYU27GCPacKW4OxW6zLbXP
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mihai.carabas@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

La 22.11.2022 15:40, Peter Maydell a scris:
> On Mon, 21 Nov 2022 at 11:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Mon, 21 Nov 2022 at 11:24, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>>> La 21.11.2022 13:02, Peter Maydell a scris:
>>>> On Sun, 20 Nov 2022 at 17:53, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>>>>> La 18.11.2022 21:11, Peter Maydell a scris:
>>>>>> On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>>>>>>> Use the base_memmap to build the SMBIOS 19 table which provides the address
>>>>>>> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
>>>>>>>
>>>>>>> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
>>>>>>> ("SMBIOS: Build aggregate smbios tables and entry point").
>>>>>>>
>>>>>>> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
>>>>>>>
>>>>>>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
>>>>>> Is this a bug fix, or a new feature? What are the consequences
>>>>>> of it being missing? Is this important enough to go into the 7.2
>>>>>> release? (My default position would be "no", given this has been
>>>>>> like this on the virt board for a very long time.)
>>>>> This is required by ARM SystemReady Virtual Environment [1]. As
>>>>> described in the Arm SystemReady Requirements Specification v2.0
>>>>>     [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0
>>>>> requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts
>>>>> checks for the presence of SMBIOS type 19 table and fails the test in
>>>>> this case.
>>>> OK, so it's a spec requirement. Are there any actual realworld
>>>> guests that don't work because we get this wrong ?
>>> We do not have a clear example. The thing we hit was the ARM SystemReady
>>> certification based on fwts.
>> Thanks for clarifying; in that case given we're quite far along
>> in the 7.2 release cycle I think we shouldn't try to get this
>> patch in to that release but instead put it in for 8.0.
> I checked how x86 sets up this smbios table, and it doesn't
> put any pluggable DIMMs in it, only the initial fixed RAM,
> so I'm happy that virt doesn't need to do anything special
> there. I've applied this patch to a target-arm-for-8.0 branch
> that will eventually turn into target-arm when 7.2 is released
> in a few weeks time.
>
> I've tweaked the commit message to make it clear that this
> is fixing a spec issue which doesn't to our knowledge
> cause any guest OS problems.
Thank you! Also talked with my collegues and confirmed that SMBIOS is a 
static area that is not updated during OS running.
>
> thanks
> -- PMM



