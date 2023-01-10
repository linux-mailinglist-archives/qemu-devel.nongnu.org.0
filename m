Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013086648FA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:16:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFIOQ-0006V8-Tt; Tue, 10 Jan 2023 12:26:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pFIOI-0006Rk-JN
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:26:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pFIOF-00077K-7F
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 12:26:25 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AHNvHn013731; Tue, 10 Jan 2023 17:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=CQbUSoI9gzFOHEylR1Qwr5P6780lHkpvTSv3kzNV0f0=;
 b=e9MFL3fzyga48FBBVHePpeOuoRsL5HYZGNMUdSW2Jw3ms77LmOHl8nFRw7ewumTC3Li1
 OolaK2jMs6UzRAYISJLH/NVmFzSgWg3rIwmmyAKY5VoHCO0Sg5tHl70bHzryqF2SG2/3
 jKSAM0dtEPs8dGyhFmMkaxO7FKv8SPJYw4G5J1sGr8hrYFoAL229Yzo5f1vWSqwLTPL7
 VQEg8Mv66mKRDvVVmWx9E6LDB0AhLFUjVFs0V8ttHoZ0ghAA+I8QLa8YMxq/ncLvv1UZ
 FdCN0Pw7fGozrMqTUG1OzR9/Dqx7pHqzj6G96oScTP8tfqLit6MogYjRXY9uqosfcDnq ag== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3mxyh3nt45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 17:26:15 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 30AHHRrF008122; Tue, 10 Jan 2023 17:26:15 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3n1a43gpvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 17:26:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKHr9rJrsIthICzpH2AWYQVC9HOjiizw+sjrW0U+ADPy6aTXAuij373PoAZslHPoiQD4PzjMXwkKA8AOHKA09widOO29ObiN4q1DHSfJUm8Gs7WQao4X8ZWMEuj6vRNY1crabG8k7dKzJBs2rxC+sfu6fM+X1TLQFXNEo0zNphMkmIbNR7Y+ecPkpt+xMxDVWrieDT1dwgpeiEqiSYLM5xDGEiylp0UZOxkmLRb98QurqmKvG2rbqJRGOPJYFtnPVyZyy7y7fqICOD3dg0Y0WJLpYcaEAXwxB7Emfu3EH8rBVZdcOPrP4LpSf0mqZLbwO2JWTvT9E8sgNZWmL5BV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQbUSoI9gzFOHEylR1Qwr5P6780lHkpvTSv3kzNV0f0=;
 b=YyngymrhK9FXvGXWrlC6MVMM4ssDwzq1vUulT6ox4AhG33idlRIOZ66Z+s9KInHDS8usXfpvOPfSY1lCUBuFIao5BrnUbnrIBlEQpUf/1dkGDIYmxVRe1ozD3hmg+tzpufsqt877RLqJVixua1AgnlnmGUOmlH2V616LAy9rS3ZDK5g7KRbq+EiemnoK3SC2SQc/Wc4Hnl6NYOOYJqSCo8Kxqaury4S6zZ0gK1ztO8Wer0Ya28QgTAkQEJwhDCBHK8SpGWjgCaZHYvZ9kS3YjZTOLP5z36FoqEmgozRRw1w7UhV1KUcbfLH5TAlsR2vtLV4k+rhw+VCisb1BsCP++A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQbUSoI9gzFOHEylR1Qwr5P6780lHkpvTSv3kzNV0f0=;
 b=vVRGP9a2WlhthYWDmJZRmJur6XBDRwadOoQOGf2HsMh0nLgtR0mAXzf2Q6iLP/mPiBu616fWRaBAT1KpqaLg2J0d6aNmgrntGh6RnSDtZ10MlMSwSN6HJ2ffMkslABCMzt/qrO1WNZbxLxCROir3r2tSlWd0+61XfUp+koxBLPQ=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ1PR10MB6002.namprd10.prod.outlook.com (2603:10b6:a03:45f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11; Tue, 10 Jan
 2023 17:26:13 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b6bd:f4a8:b96f:cf5]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b6bd:f4a8:b96f:cf5%7]) with mapi id 15.20.6002.011; Tue, 10 Jan 2023
 17:26:13 +0000
Message-ID: <4c13cbcf-252c-ea91-84ea-0c476eb67cfd@oracle.com>
Date: Tue, 10 Jan 2023 17:26:07 +0000
Subject: Re: [RFC PATCH v1 00/15] Xen PV backend support for KVM/Xen guests
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 qemu-devel@nongnu.org
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110123754.1564465-1-dwmw2@infradead.org>
 <d67bb9ad-852f-e38e-d6dd-28de54d7774f@oracle.com>
 <08a790f27c99b15ef9b28bce9139624111aef3bf.camel@infradead.org>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <08a790f27c99b15ef9b28bce9139624111aef3bf.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0090.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::23) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SJ1PR10MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c813c14-aa4b-497b-dcbf-08daf32fc570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q2WaPSL5wcu/YV6NtNdU/xVTjW8DzyXYaGPzmw/UdiVoyGyLwrJV5GbfX1eAgc6VmQcQAdmgE8Tol4gC4RBK10qt7NbKKt1FeTxqwP/j7qfmhUBsUOEvxWk+50WNATs5cFmVceFMwgWb9U2CE4B1LsklJWSv/RSQWIU6Z27UiSdtpBIF2wbUi2fhXu6j7nQjoY8IjV3WXaUO+NOEJM+WOBKne81fXVKbYyFbUjSPKonVnvHo2FQsIJouUOx/DxCjBUij6mbCFF7ISH4jObjBWuYb5P/XTxv1EPNWFIuMH6DfXSuvJ6Qi+GmVmdEbPXJt+swiXqbD9KifpsDuY0CFyhk9oX4xfQ//HzI5ca2Lbr7tf+ccWThZUtSEmRP2qADi3lI7ejogP7OKPMbH44Gp2zVXnQKed8xe3gKuDRXI4bB2FUVoequLgIVWpEtG1cFXyHpsNpbgHcDgmVKYizuF+eZU5bPMEgcaVuyBqE5S8rzU9rmnsNCgXhpiYFl2KoWIIkmAtk9Bqr69H88buchDjfeVJZQ+rm8RgclKSLdoBlTz/abG8yVeMAKPMYnTikSC5w3yANdm5XSuuDGosqXUjBo/cEv3a5yOEhi4qP1Bng+LH9oZokwLV7dX+P8lLKhGVRQ118ioa9WcybokoKwrZcMImrFSzzsB8Vobbg3PIPji7IPhlpqpWw354bPVe13KOvAmrTMl+Y21bxySyhv/AA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199015)(2906002)(31686004)(5660300002)(53546011)(186003)(8936002)(6512007)(7416002)(41300700001)(31696002)(36756003)(26005)(66946007)(8676002)(66476007)(86362001)(4326008)(66556008)(6916009)(38100700002)(478600001)(6666004)(83380400001)(6506007)(6486002)(316002)(54906003)(2616005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXRWMjYvbUs3V1VEUXFORkY0SHBBTEVUYmFzNGViYUY2VlN3OWhKUlBIRWZU?=
 =?utf-8?B?OVFCSVhMQ1czMkNMR2ZmcWlpcnJURVFsKzAwb1A2Q3VhRVAzVUpyZi83RlJ4?=
 =?utf-8?B?UkFDek9DTldyVWtXMVNmT2N5UjZBb3VWSkoxTG50WmtXQ3B3M1FLOXVCOFFs?=
 =?utf-8?B?eWR5cW00anl0cUl6R3Z3MFBwVVR5amppMVBOemVCTmJmRml1bmxpL1ArRldq?=
 =?utf-8?B?QzZwMnpkK0RoVE1CUXoxYllwSHo1K2laaG15K09hbnE2LzNjUWtiQkRsR01l?=
 =?utf-8?B?M2ZLeGZaQlc2QVIvSExqUHpuaDVrcWZxSlh6bThia29raXB2UjRmTjMwOW9n?=
 =?utf-8?B?L2lnTGtUdXBwVCtuY1B1dU1jd1YvdnZjQWR6YnFld1NZVUFFemQ2NkJ4QlJT?=
 =?utf-8?B?WW4xOXhSc2lJak1vU29QQjNZVy8zaVF6OHI1VjVGMHFHNXYrSmV3VUV0STgw?=
 =?utf-8?B?YU5xbnVmSTFhM1BRTUxVcWhiMzR5QmdQelNzeEc2M2lqeWlCRlhVR3dvL2Rz?=
 =?utf-8?B?Z01kVkFaNENNTGxtRzN5emVhcDFRNFZlUlAveHlJenh5OGg1LyswM0c4QldE?=
 =?utf-8?B?dDZFY05CS0cza3JKMWhrWTRzWDduelFXbnRoeG4wRVlXekM3UUJaenR5ZkR3?=
 =?utf-8?B?SWhaVFVqS2hmZWtYeUVwMDhSNFpRV3hrdnV4Q3M4bVdmQnByU1JmekJXazZw?=
 =?utf-8?B?ZjN4RWpoRWtHbFkyc003WEd1UFVFRk0xdEdLVVN5bVV6QklrMHVibzc3dStX?=
 =?utf-8?B?c3U4b0liZk44VDIvUWkxRU1mUGZMTnNsd1JoOWRhTCtmNTZTajBpczFMQVNj?=
 =?utf-8?B?YXVyWjZRSWdBNk1XZlEyWmhpTGJRdXk4RkQxWTNqVmt5NlZkejIwTkFxM29R?=
 =?utf-8?B?OFZNN2ZRYjZ6UUc5dUoyei9WT3VZSHpubzNTbmkvNVNlVGRPUnhFSzVWbEtC?=
 =?utf-8?B?R2FCUUIzeDJQd3czTnQwQnN2V2RxaDcwcENaemExZGpEQ0ZSdWZjbHJxbml5?=
 =?utf-8?B?dGpibW9tWDdkUXR1UTRBNlgrcTlES2lDWmtpQysyVFpNdnFaSUY5VlY4ZmlW?=
 =?utf-8?B?WWRsS3hXcTFKM0xsd0syeldWMHoycGlSNlA2UEhibzdLMG0ySDRqRWVZWGJF?=
 =?utf-8?B?VndYM25JanlQVGZSck55Qk5lZEFBN3lYSXp5a0hXejk4TU9tdGthT2tIbFFn?=
 =?utf-8?B?cDYzVnV5bXhJTzQ1eEkyK1d1N2RabjUyemQ2QUIycTM1M3RTWFNiYW1DR093?=
 =?utf-8?B?dVVRNG9uOVBNTTI1S2phalVVNGVEbnRIQmJMT1ZzK3l0R0JFdnVuZGUwR3Q1?=
 =?utf-8?B?RkkvWHRVWmMzTEx3dzVpOGJBdGlCQTYxL0VxbytiNUJ2b2J5ZXVWVmdzS25a?=
 =?utf-8?B?aDh5aUpDRitnUVNGOXJtZlBvQ3JTN1F3VCtzZTRRaTFwQlU5U1JkbE5BYVlo?=
 =?utf-8?B?bGEzSWRBRkszNlUwTHBCeU1QNm5DT1dvMlpIeFREUzNTbkM1Tk9keHhWSDIv?=
 =?utf-8?B?cVRVUmQzejFPSXpVbTczN1NDWW5ZVlIyWC91azdLN29QME9MaUZDTVh0dUtm?=
 =?utf-8?B?V0R0UUdhb3h2cldqNVBPZ0Rpcnd0RDNxQUllNVB4cmlSbFZvNHgycDJCVHZo?=
 =?utf-8?B?aVdGYWl5dTcxWFJQTzU3T0hYZkVJQzZBUWtPcWx6V0tWSnhiQm03RXl0bGR4?=
 =?utf-8?B?KzhBcHptVDJsdTI1bUpPL05WTXphNlRHcHZUbXNudzQxNTVNcVlYUSs3SlJa?=
 =?utf-8?B?S2F5TjQybzhHQmIvaEdlYnN2aDI1THdpTGxxSlhNbWlKOXkrSUZXaG0wK015?=
 =?utf-8?B?NkZxY2JrMm1PN0FCMlg2K3JpQlpkcjZpQUIvWHoxMWdzYjlTWjNabXA5UDln?=
 =?utf-8?B?dExBbTZQOHJGaGtaY0Y1TTZSUlNRVm5lV3dBS1JRUHRUdjVVQkgyZDZqcVBa?=
 =?utf-8?B?aklMbit1SVpoV0t2V01HNHR5eDZTS1VyU0xvNjlPMEMwa1N5WGZKOG0remxH?=
 =?utf-8?B?Ukp6WGt5d2IvaUh5LzhmeWt4dHlCTGFXU212TmNxaXJDYUpIRER2Uy8vaGdC?=
 =?utf-8?B?enpkRlhuNWJ2YU50WGlOSkNsOHdaNm1peFdSeFpqZWZKRFYxMEJrMHVzWGs3?=
 =?utf-8?B?dC9rbkl1VThlZU1wSlZlZG1PS0RZMW8wS0Z4WWp4UzRkbUhSN3pIMWEzdHJC?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pt/JNE9Ky8vAifn4Zyklszxb3MDV4Zszq84/+A4cyafdoX1yf1p2kJcGSmVXq2w2L0+WGtNcUpB2fPh+uBFgSCAQ0xCeDRhvOlfANqoXaL5OKf+cHUFUVBNJdZNSSkjqcitumkCXBtQn8CHb38J8B1iONPyZ8vm2x+vB833eJYWuoEySpxmCJlglMNoD0HdtM0rJCGBSk6tdGVVjwnw0E9lluwwdu1HH+YroNsKWpus+YNJ4I2Ics5KQFqB4Wf4YqZ/xGqY3h1QHj00yeLANxkn1EKhPTfMtFGvSNJNuJnlftQqq7oTA03wYqg5e+E29I40MVtt65MwKJm7Lu8UhPgR+ORQf6EvhOvEn5PH5vyGitEd3dreQij8mKvkE8OauIhRCCVGx5Pvw4EhrBo2UbcTKoDGO7dNoTKOoUUAlKU29pNEsGhdtEJ0RbScfHTKSsBI3fxI6oyQAmiAUA4ZREpPQ5uO0T1TySyl3lXG4Djj1ll0WLlSI8PPjEDM1NuncXHSR5KRLyaznTgmLCnnREInaqvfDP+A3nP+wFffxQUtM8Vd+x6arPYs+Z8jTLYeKzTOroFUl7cK93LJIdM6rUZi2m1E0Cco3MTf319SbRDE9b2+IfhG65lByfZFe5UEG33ms9V5vz1GPTlb2c43RPUHJaaSkJ1qeAOEPNvOP+ipRQ9x+qxnmC7pUH722DELWxSfGq0uJx47oEqi7Hnmt9OssVkWhqsDw4AOagWLe+5kUX3Fze9NGrHqDLjFke68VoEO8XIbtxezfZAT6D7Rec++phg4F1mVJdeVM/bfgXiCqXYm1Nl7Q1qt7Qq7QTDcWz5cElSHtLqIAqWx7awi7Z/nLUSPOVuroKfrrV4PBUy27FSjqXqKrLMtjSc9TPMFhjkrDMT7ZeGXJWe37x3Idew==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c813c14-aa4b-497b-dcbf-08daf32fc570
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 17:26:13.0138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mENULenCQ+g6seLo5VcHE01xEEahTpL5RNkQuvB1/cr7j3vCyDrVF8jMuNMeo6v2xiX2HZ84Gx8jsI6bp4D4iiYPy2b5HB2kUjDZtA2xXSA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB6002
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_07,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100110
X-Proofpoint-GUID: OdgziFjGaV4GgFth1x_PZTXbKBCV29is
X-Proofpoint-ORIG-GUID: OdgziFjGaV4GgFth1x_PZTXbKBCV29is
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 10/01/2023 16:52, David Woodhouse wrote:
> On Tue, 2023-01-10 at 15:43 +0000, Joao Martins wrote:
>> On 10/01/2023 12:37, David Woodhouse wrote:
>> The only user of multi-gref mapping is the block xen driver ... and only for
>> mapping the shared ring if I understood correctly. But even there you could
>> probably twist it... considering that the multi-gref ring is contiguous is guest
>> address space, thus the gref -> HVA conversion ius contiguous too (?). So that
>> way you could still return a single HVA (provided that map-grant implementation
>> validates the backing frame contiguosity).
> 
> There's no reason a guest couldn't vmalloc its multi-page ring and have
> a virtually contiguous view for itself, while the actual GPAs are
> discontiguous. Sure, that's probably not the common case, but I didn't
> really want to have a multi-page mapping succeed *sometimes*.
> 
Right. I don't remember that ever being the case on frontends, but I could be
very wrong

This was just a suggesting not trying too hard to fix the problem while
maintaining single/contiguous gref limitation (if it didn't meant much more work
to you). Provided this only happens when configuring device. An alternative is
to /try finding GPA contiguosity/ and should it not be, then you switch device
xenbus status to error if you fail to map the guest grefs (This is a valid
scenario still in Xen kernel backends IIRC). Sadly backends don't re-read
features when re-connecting so probably not exposing ring-order at all as safest
if it can only be supported "half way"

>>> So for now we'll limit the
>>> back ends to mapping a single grant ref at a time.
>>
>> Which is not a practical limitation right now.
> 
> That sentence can be read both ways. I first read it as "that
> limitation is impractical". But prefer to read it as "that doesn't
> limit us in practice", and I *think* the latter is what you meant from
> the rest of the paragraph...
> 
Correct. The latter sounds like proper english on what I wanted to say

>>  One grant ref is actually fine
>> for the everything else that is not the block shared-ring.  Xen devices in Qemu
>> seem to be using the legacy backend interface, and thus (un)mapping one grant at
>> a time, or otherwise copying grefs.
> 
> Right. We can absolutely live with that limitation for now; we'll teach
> xen-block not to advertise a higher max-ring-page-order if ring_order
> if the MAP_MULTIPLE feature isn't set.
> 
> And I absolutely don't give a crap about 9p or usb just yet. :)
> 
:)

9p is actually for rings as well (same as block). USB is the only one where it
uses it in the datapath, which is likely to see issues more often.

