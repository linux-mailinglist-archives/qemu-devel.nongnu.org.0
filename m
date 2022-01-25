Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E8049B8A8
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 17:34:26 +0100 (CET)
Received: from localhost ([::1]:50916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCOm1-0002gX-Eq
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 11:34:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nCOd7-0002sY-RI
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:25:13 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nCOd1-0004Tk-Qh
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 11:25:13 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20PG4x7c029474; 
 Tue, 25 Jan 2022 16:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=AfFjrFyOXiYsTka4UQRn5hqYCUZggZIXJHh2jGZ7/f4=;
 b=BWABSID+nwYz/+vogkfLj3SGomGk+XQoceunrZuk+AgoXog8Kh9Ab3JnMo9VzTImaCw6
 pjtsb4TvqzCNLiRKrUKaB1E8XR96diUqShv+ve5vjLbwA+PurgLS2M0YrfJzOTPT+lEp
 rRBfIxDFb4JEOMT/6Dm3puZiYkRwCRILTc+H0+uX1lLfQL53Hvj3viFy8uSg1lkWx0+g
 eVysb7rVElBamBind2z/amUT4y/w9JCinXAAbaBkb4eYgI8lrci+5azjGpgqQZe0IdgK
 rdE9jrVPRWltiuw2/NQy0XBDmd2MTOwVrkihlvbUG+zYbMe0idhSJX+/lzLEScpM2NuO YA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy7aukp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 16:24:58 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20PGB0oL018699;
 Tue, 25 Jan 2022 16:24:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by userp3030.oracle.com with ESMTP id 3dr71y95tn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jan 2022 16:24:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfIIPx6ure6NuW0jVAJUWGuTuqV/yt89ZP2YAgQIu+zcoJyrZMVAX8r+Jo65M+/BbTI+ksvC2XTLRbETBOSU3o5KviQ8TKXtyStMkmQnItmEDx3U+4rDTL46NTxVUJjZooyIQOSwSG+TETsr9U/kHLTYuE3jbgjZTlFNuCkcQBxAbPh9b9LFP0ox0l7YcMg99G0BLw1pWLRdlWANTunmzBl6hyKbooytMK1xYUPyXpfqt002j6PBe250j59hb+f5D7h7Qx4mpo56mvTXaruCsN3vNE0LDcJHpQ2ougJuVe+v1eSNEoGUDdh+Crag+AAuxfTP+m3e/oAxCk+Mp6oaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfFjrFyOXiYsTka4UQRn5hqYCUZggZIXJHh2jGZ7/f4=;
 b=KbFgYiCpqzxOvqreV7B/eV4ZQBc2erDMkdG/QzKtegiQ0tb81XNe3BZHVr7oJgFB7HVRggwI0VuwYA8XD8LdOTfwP0raQ+iccp8SKrxBSxgpjcTUiWt4aQqEKXMQfDskX2oDFB1iyCFlpnHjWTLBgRPl3qfuKyRVgRwoNhwBM3ItDvlM01xClkR676CNJYGyZX6jBaMM898u+QsBbQiTIhiz5vkbeAZbn+Qd/jhp9+featJ37sUVKjSSyXyPaXL67iGkWdmGH3lvePM9pp3Klwq+ZNPtaR2f9eVcLvIUUiJKGIv/5lydN/zwuwq9In+S5JdI9YKyRCQyjmEJT/4Blw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfFjrFyOXiYsTka4UQRn5hqYCUZggZIXJHh2jGZ7/f4=;
 b=IKl46dWxLO408cfzKL54BTg6uhpFLdaVTwPVA4inoQlYQdhMI8irJIqLxdFVMZvgjKnSy8ESqOojyRIn+Mjc/b350srpVuYBQ4LBynCymUdzVnYpILjvBZQMNbli4x4HXdxqZREQWu3hMB5l5iKEe4ZPPdTnMbWakjBB2HgyPEQ=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH2PR10MB4215.namprd10.prod.outlook.com (2603:10b6:610:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Tue, 25 Jan
 2022 16:24:53 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 16:24:53 +0000
Message-ID: <4c680569-bca2-c85b-b0e0-0cfbb5c158fc@oracle.com>
Date: Tue, 25 Jan 2022 10:24:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v13 06/10] ACPI ERST: build the ACPI ERST table
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
 <1643044621-15892-7-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2201251600060.1134355@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY4PR01CA0005.prod.exchangelabs.com (2603:10b6:903:1f::15)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c704ccd9-6e5b-4c7c-3c3a-08d9e01f37b5
X-MS-TrafficTypeDiagnostic: CH2PR10MB4215:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB4215AF773C96C6FAF1C92071975F9@CH2PR10MB4215.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1824;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HaOVr2ZhZOqs+Ty57YaJb/51/bQTJeWzf5lkdxpsvwyCchHgFa7FUHyvhk7fjFAWJERCBKwLOrbqbgHh9v81b7YS2jfOsi08SHP/+6OOyDybGrFVAzc//i+NonecHghuu+Toae1NHQz6IpZJTYgLga2Tg8Sw7Vjg4jIaQZZYFft2WtbEyJSGa1w9S+48eWJ9+rAx2YyZZZBpM6K6Nb7y5H4jX4vA/8eN5CcVNfLmfj/A2Roh+Rbks5bIDVs+D5T6bCBf1iHvGasF/QNgrNDP2SuIzXk2hOlUvJb7mRZnczcdiZkqgz5I/9kbHNdWYtzV3XO9dq/o9wcES8Q0GJrB38jRkTT9jWND9BZUjbxHZH47GNZiD6PAFSo962zVknEgRN30E103tByGz3BF9XaCsswfsS9+YYlqID6QxT+vVcXvXkZajHyvN/55UDAqP0jua64wdKtpwI3tOgLeqSGtyqyxK5JI5JO0rK6Txe4x+lDnZeTHsAU7pEtl8F3MpR8KBbjr4Tt9uQKBUbBLi7Cn8uyB1llwqT8fsSSiMx9EzhUCEDUYKoimI9RjOmGFsr9z0Nc+txK0dPuHgReiXVusaq8Msw99KMY8oySoXmPUj9JzEC2UCnNIrvoayVOUwPsa9dzjgxdComIXI2EAljKaKaodrFwFqqv0KnrX6IEdbOfFNwemesDYge0bLqHSn9Kp0pbKiD8Z3NGzvmndCm2qQM7EaKVLl5RoFAYjXvvDT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(53546011)(30864003)(2906002)(66556008)(8676002)(38100700002)(31696002)(6916009)(6506007)(4326008)(66476007)(86362001)(5660300002)(31686004)(6666004)(2616005)(6486002)(66946007)(8936002)(186003)(316002)(83380400001)(6512007)(107886003)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjRySTlKaTZwakZVUldGM2wxZ3BmaXhCTElqZWdObTVZOFRmajVINkVHZ2Mw?=
 =?utf-8?B?dnFHV0s4MHhoTDFQYk4rRTRUbzVVb29aNjZtK0p3R1JOZzJyOW03YkdXR1Q5?=
 =?utf-8?B?SmZMOXFBekVtZ05pM1MxTGRCM3pxR01LMEtCUllVY0Y2V3JoaUcyRDJYZXlx?=
 =?utf-8?B?SndUbkdTMEU0SFNlSnhqTjZpQlpsM1JLakdGbDFDWXRicWFKU3crcEJaWTEr?=
 =?utf-8?B?ZnJkeWpTSVlXTjlWbHZFeGFIUWd5ZllOcjYrYWladldCWFhjMklnWFJEZmd6?=
 =?utf-8?B?ZHc0ZkVwTXdDemsrNy9XbkVVbXY2TXUwQ3RFeVc1Ym93OVhIdEJrUW1ySE4v?=
 =?utf-8?B?RzIvTHZ5TndTMHVkWC9vMlF3Yjg2a2xzK1phR1dGQkRpZmFMdXBsVEsrVFJC?=
 =?utf-8?B?OTlSNnZBcVMxSS8weVlub3FuYTFNMGlmWnE2OHpHL1VtSGIrTndLTG9DRVgv?=
 =?utf-8?B?NkJ1cXV1a3J3SzVYVHNVaGZTZ1NXMlNtSXZwb1pQVVpYaVJMWnp2bThxV2Iw?=
 =?utf-8?B?dzZTaVdMUE4xbDNJcjdOV2pIMHNDRkdaVVlySlk2b1V4MUNlNC9JbUtzekt4?=
 =?utf-8?B?TVIvWG00Z1N0WHlIVFBvY1ZncnJCRzRPZHNBRitsaStLK3U2MjZZN2JscnA4?=
 =?utf-8?B?Z0E3cTBTNU4xRDVEY0hYeFdOL0hJaTZ6K0RweDk4OTk2bWVTQlNMcFNkdTAr?=
 =?utf-8?B?N2I5ZGRQVjRPbXlZcnl2alJhTUYxSUsrTitjajBOSEh1emF1bDR0c1ZaL2dw?=
 =?utf-8?B?bmhyYmNjVFJGSHlMdUhXQ0oyUlEzQVlxRnJzTXppWGcvZHVialNsWXA1aXRU?=
 =?utf-8?B?d0tObngzUHdRV29qUFB6dkN3QUVrSGhxMzVsd3JTWTBNZzVyOXBJR0hLcmlm?=
 =?utf-8?B?OFUycUIrVFFTVFRhNHRDWWcyNjFRQzFDbUdFcVVRUEl3QUVoSFc5TCs0anBk?=
 =?utf-8?B?VFB0ajFVOGRUOHl0WFgxVHR1YkhVN1lMbEszMjhneUIvVlZjc2FoSFpzd20z?=
 =?utf-8?B?Z0xrQi93WnRZOUZsejVLVVBGL2M5OVBVcExJMzRLNEtCOGJNa1pYekQ4K0N0?=
 =?utf-8?B?K3dnVCtzci83WjgwQzVkVkkzN281VFhXZ2lPVVdEaGc3aFFCeFpwT0ZaQytY?=
 =?utf-8?B?Z3djcTU2d05YVUZQMmV4NmZ2bm5Raks0WTBRNTFISlRkTlE5eEk2Mm9WNEk2?=
 =?utf-8?B?NE1KZk1JSGFMbEdvaGEzbFhzTnNGY3RFTGJtWlRUZ21LQTg0dzJ6bVZpYzZE?=
 =?utf-8?B?dHlTVjNoZ3JlNHB6czc1cnRYU3VyNzlnWVY3UHEvMmFmdWpxUWJEdkdCUWt1?=
 =?utf-8?B?bU9pSjRPekFLMjk2MHBRY0lwQkZhK3M5TUtsYXRBNFQ5SCtrNE1BdWNETFVl?=
 =?utf-8?B?ajZzbXNtOVlKVTJvNUFlMDBGSko2RHdXMlkzcWNaTW1qUUtpV1AwaXcxQkE3?=
 =?utf-8?B?NEJNempnL0pTQzJibVJzN25nckU5OWs4SnhsUEdLSVlGS2cvWUhKQkpDL1hM?=
 =?utf-8?B?NHRBVDJjSklmSWk4N3VQQUsyRlVDblZwQ1pJcWV5clg3eEFqazhoM2ZEaWNy?=
 =?utf-8?B?YjFPMERDZGtTa1VHdFZoUjFFK1NWekNoOEVZMzBrZnlQQ0J5OG5xTUQzN0pS?=
 =?utf-8?B?LzJmYWJLV0ZLUFczR1VBQXkvb2N4TDdlVk1PQmNqZ3h5S0J0SXJ1U3hUbTRH?=
 =?utf-8?B?S0dtR3V3SllHaGdLTUNzdjVNOVFQQ1J4eUozSEFZVXR5dkdwZGpuVTcxQVFw?=
 =?utf-8?B?TXEwVWVRV1grcWc0UCtjMmhWQlBvY0c0VGpreDlDUXFLNGZTSGVDa3BHckZX?=
 =?utf-8?B?dXpmUkhXL3RmK0FzaVJGMElqWUtZQ1ZaWjdzSzFnREtNeDl6bVpBeENmU1ZQ?=
 =?utf-8?B?TEo5cStTRzI5TWg5c21VRDIyTHl1bkYvY2xyblFXR25YZWp4OU95UkZxQ29H?=
 =?utf-8?B?a0dxUlh2bzc5OUMvNENXTWl0cW5OVkJsRWxPaFJXVUVMQUN1eCtuWDgxL2h5?=
 =?utf-8?B?ajhuM3kzdzUya09razNBN2ROZ1FDaHFwZWlmSjhmZlZoNHJ6THN0dHNIb3Jp?=
 =?utf-8?B?S2N1UHM1RjRCaWtDRnp1Qk4zQlorcXpaZENPRFNXNWRtNUVub3dKUFZzQnBq?=
 =?utf-8?B?RnBwWFFub3JoZFZOclppS01lSHh0QXJLemNNNkJxSVF6bDBwaEVKdUt6YldJ?=
 =?utf-8?B?Q1FnUFVQYmJ5TmFFanJiaGJoaE5zN0dMOTFheVhDR3lnejh1QVdXU2lMaTFJ?=
 =?utf-8?B?dUw2U2s2WUQ3OWp4VXIzc21CVnd3Z0ZLNjNLb1E4dUptWmN3VEhmUnJRRGF6?=
 =?utf-8?Q?rFDgUF1fqwWXQFNBMt?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c704ccd9-6e5b-4c7c-3c3a-08d9e01f37b5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 16:24:53.7711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDTqwyL/BR1nTJ4q4YIkoR7FbVwGxPybo/6rg/unirQotFJvog4k8BXMcm1vIMidfEibJpUwr3QlYsRR4FX2ZSDK0Oy9ysDxRssgdaZlW9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4215
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10238
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201250104
X-Proofpoint-GUID: CkF0sFvMBj5uudQOV_FyHyx0aaQ9mEQ_
X-Proofpoint-ORIG-GUID: CkF0sFvMBj5uudQOV_FyHyx0aaQ9mEQ_
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani,
Thanks for the feedback! Inline responses below.
eric

On 1/25/22 04:53, Ani Sinha wrote:
> 
> 
> On Mon, 24 Jan 2022, Eric DeVolder wrote:
> 
>> This builds the ACPI ERST table to inform OSPM how to communicate
>> with the acpi-erst device.
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/erst.c | 188 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 188 insertions(+)
>>
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> index fe9ba51..b0c7539 100644
>> --- a/hw/acpi/erst.c
>> +++ b/hw/acpi/erst.c
>> @@ -59,6 +59,27 @@
>>   #define STATUS_RECORD_STORE_EMPTY     0x04
>>   #define STATUS_RECORD_NOT_FOUND       0x05
>>
>> +/* ACPI 4.0: Table 17-19 Serialization Instructions */
>> +#define INST_READ_REGISTER                 0x00
>> +#define INST_READ_REGISTER_VALUE           0x01
>> +#define INST_WRITE_REGISTER                0x02
>> +#define INST_WRITE_REGISTER_VALUE          0x03
>> +#define INST_NOOP                          0x04
>> +#define INST_LOAD_VAR1                     0x05
>> +#define INST_LOAD_VAR2                     0x06
>> +#define INST_STORE_VAR1                    0x07
>> +#define INST_ADD                           0x08
>> +#define INST_SUBTRACT                      0x09
>> +#define INST_ADD_VALUE                     0x0A
>> +#define INST_SUBTRACT_VALUE                0x0B
>> +#define INST_STALL                         0x0C
>> +#define INST_STALL_WHILE_TRUE              0x0D
>> +#define INST_SKIP_NEXT_INSTRUCTION_IF_TRUE 0x0E
>> +#define INST_GOTO                          0x0F
>> +#define INST_SET_SRC_ADDRESS_BASE          0x10
>> +#define INST_SET_DST_ADDRESS_BASE          0x11
>> +#define INST_MOVE_DATA                     0x12
>> +
>>   /* UEFI 2.1: Appendix N Common Platform Error Record */
>>   #define UEFI_CPER_RECORD_MIN_SIZE 128U
>>   #define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> @@ -172,6 +193,173 @@ typedef struct {
>>
>>   /*******************************************************************/
>>   /*******************************************************************/
>> +
>> +/* ACPI 4.0: 17.4.1.2 Serialization Instruction Entries */
>> +static void build_serialization_instruction_entry(GArray *table_data,
>> +    uint8_t serialization_action,
>> +    uint8_t instruction,
>> +    uint8_t flags,
>> +    uint8_t register_bit_width,
>> +    uint64_t register_address,
>> +    uint64_t value)
>> +{
>> +    /* ACPI 4.0: Table 17-18 Serialization Instruction Entry */
>> +    struct AcpiGenericAddress gas;
>> +    uint64_t mask;
>> +
>> +    /* Serialization Action */
>> +    build_append_int_noprefix(table_data, serialization_action, 1);
>> +    /* Instruction */
>> +    build_append_int_noprefix(table_data, instruction         , 1);
>> +    /* Flags */
>> +    build_append_int_noprefix(table_data, flags               , 1);
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data, 0                   , 1);
>> +    /* Register Region */
>> +    gas.space_id = AML_SYSTEM_MEMORY;
>> +    gas.bit_width = register_bit_width;
>> +    gas.bit_offset = 0;
>> +    gas.access_width = ctz32(register_bit_width) - 2;
>> +    gas.address = register_address;
>> +    build_append_gas_from_struct(table_data, &gas);
>> +    /* Value */
>> +    build_append_int_noprefix(table_data, value  , 8);
>> +    /* Mask */
>> +    mask = (1ULL << (register_bit_width - 1) << 1) - 1;
>> +    build_append_int_noprefix(table_data, mask  , 8);
>> +}
>> +
>> +/* ACPI 4.0: 17.4.1 Serialization Action Table */
>> +void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
>> +    const char *oem_id, const char *oem_table_id)
>> +{
>> +    GArray *table_instruction_data;
>> +    unsigned action;
>> +    pcibus_t bar0 = pci_get_bar_addr(PCI_DEVICE(erst_dev), 0);
>> +    AcpiTable table = { .sig = "ERST", .rev = 1, .oem_id = oem_id,
>> +                        .oem_table_id = oem_table_id };
>> +
>> +    trace_acpi_erst_pci_bar_0(bar0);
>> +
>> +    /*
>> +     * Serialization Action Table
>> +     * The serialization action table must be generated first
>> +     * so that its size can be known in order to populate the
>> +     * Instruction Entry Count field.
>> +     */
>> +    table_instruction_data = g_array_new(FALSE, FALSE, sizeof(char));
>> +
>> +    /*
>> +     * Macros for use with construction of the action instructions
>> +     */
>> +#define BUILD_READ_REGISTER(width_in_bits, reg) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_READ_REGISTER, 0, width_in_bits, \
>> +        bar0 + reg, 0)
>> +
>> +#define BUILD_READ_REGISTER_VALUE(width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +#define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_WRITE_REGISTER, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +#define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
>> +    build_serialization_instruction_entry(table_instruction_data, \
>> +        action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
>> +        bar0 + reg, value)
>> +
>> +    /* Serialization Instruction Entries */
>> +    action = ACTION_BEGIN_WRITE_OPERATION;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_BEGIN_READ_OPERATION;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_BEGIN_CLEAR_OPERATION;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_END_OPERATION;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_SET_RECORD_OFFSET;
>> +    BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_EXECUTE_OPERATION;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
>> +        ERST_EXECUTE_OPERATION_MAGIC);
> 
> except here, on all cases we have
> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> 
> We should treat the above as special case and simplify the rest of the
> calls (eliminate repeated common arguments).

OK, I created BUILD_WRITE_ACTION() to replace this occurrence. I've provided
what this section of code looks like with this and the other below change at
the end.

I have seen the comment from Michael and you about using inline functions, I
will respond to that in the other message.

> 
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_CHECK_BUSY_STATUS;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER_VALUE(32, ERST_VALUE_OFFSET, 0x01);
>> +
>> +    action = ACTION_GET_COMMAND_STATUS;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_RECORD_IDENTIFIER;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_SET_RECORD_IDENTIFIER;
>> +    BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> 
> This one seems reverted. Should this be
> BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
> BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
> 
> like others?

This is a SET operation, so the data is provided in VALUE register, then
the ACTION is written to perform the command, ie record the value.

> 
>> +
>> +    action = ACTION_GET_RECORD_COUNT;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER(32, ERST_VALUE_OFFSET);
>> +
>> +    action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
>> +    BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);
>> +    BUILD_READ_REGISTER(64, ERST_VALUE_OFFSET);
>> +
> 
> BUILD_READ_REGISTER() is always called with ERST_VALUE_OFFSET as second
> argument. WE should eliminate this repeated passing of same argument.

The BUILD_READ_REGISTER is always against the VALUE register, as you point out,
so I've s/BUILD_READ_REGISTER/BUILD_READ_VALUE/ and embedded the offset in the
macro now. You can see this below.

> 
> 
>> +    /* Serialization Header */
>> +    acpi_table_begin(&table, table_data);
>> +
>> +    /* Serialization Header Size */
>> +    build_append_int_noprefix(table_data, 48, 4);
>> +
>> +    /* Reserved */
>> +    build_append_int_noprefix(table_data,  0, 4);
>> +
>> +    /*
>> +     * Instruction Entry Count
>> +     * Each instruction entry is 32 bytes
>> +     */
>> +    g_assert((table_instruction_data->len) % 32 == 0);
>> +    build_append_int_noprefix(table_data,
>> +        (table_instruction_data->len / 32), 4);
>> +
>> +    /* Serialization Instruction Entries */
>> +    g_array_append_vals(table_data, table_instruction_data->data,
>> +        table_instruction_data->len);
>> +    g_array_free(table_instruction_data, TRUE);
>> +
>> +    acpi_table_end(linker, &table);
>> +}
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>>   static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>>   {
>>       uint8_t *rc = NULL;
>> --
>> 1.8.3.1
>>
>>

And here is what the main snippet looks like with the above changes (a diff
is quite messy):

     /*
      * Macros for use with construction of the action instructions
      */
#define BUILD_READ_VALUE(width_in_bits) \
     build_serialization_instruction_entry(table_instruction_data, \
         action, INST_READ_REGISTER, 0, width_in_bits, \
         bar0 + ERST_VALUE_OFFSET, 0)

#define BUILD_READ_VALUE_VALUE(width_in_bits, value) \
     build_serialization_instruction_entry(table_instruction_data, \
         action, INST_READ_REGISTER_VALUE, 0, width_in_bits, \
         bar0 + ERST_VALUE_OFFSET, value)

#define BUILD_WRITE_REGISTER(width_in_bits, reg, value) \
     build_serialization_instruction_entry(table_instruction_data, \
         action, INST_WRITE_REGISTER, 0, width_in_bits, \
         bar0 + reg, value)

#define BUILD_WRITE_REGISTER_VALUE(width_in_bits, reg, value) \
     build_serialization_instruction_entry(table_instruction_data, \
         action, INST_WRITE_REGISTER_VALUE, 0, width_in_bits, \
         bar0 + reg, value)

#define BUILD_WRITE_ACTION() \
     BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action)

     /* Serialization Instruction Entries */
     action = ACTION_BEGIN_WRITE_OPERATION;
     BUILD_WRITE_ACTION();

     action = ACTION_BEGIN_READ_OPERATION;
     BUILD_WRITE_ACTION();

     action = ACTION_BEGIN_CLEAR_OPERATION;
     BUILD_WRITE_ACTION();

     action = ACTION_END_OPERATION;
     BUILD_WRITE_ACTION();

     action = ACTION_SET_RECORD_OFFSET;
     BUILD_WRITE_REGISTER(32, ERST_VALUE_OFFSET, 0);
     BUILD_WRITE_ACTION();

     action = ACTION_EXECUTE_OPERATION;
     BUILD_WRITE_REGISTER_VALUE(32, ERST_VALUE_OFFSET,
         ERST_EXECUTE_OPERATION_MAGIC);
     BUILD_WRITE_ACTION();

     action = ACTION_CHECK_BUSY_STATUS;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE_VALUE(32, 0x01);

     action = ACTION_GET_COMMAND_STATUS;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE(32);

     action = ACTION_GET_RECORD_IDENTIFIER;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE(64);

     action = ACTION_SET_RECORD_IDENTIFIER;
     BUILD_WRITE_REGISTER(64, ERST_VALUE_OFFSET, 0);
     BUILD_WRITE_ACTION();

     action = ACTION_GET_RECORD_COUNT;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE(32);

     action = ACTION_BEGIN_DUMMY_WRITE_OPERATION;
     BUILD_WRITE_ACTION();
     BUILD_WRITE_REGISTER_VALUE(32, ERST_ACTION_OFFSET, action);

     action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE(64);

     action = ACTION_GET_ERROR_LOG_ADDRESS_LENGTH;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE(64);

     action = ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE(32);

     action = ACTION_GET_EXECUTE_OPERATION_TIMINGS;
     BUILD_WRITE_ACTION();
     BUILD_READ_VALUE(64);

     /* Serialization Header */

