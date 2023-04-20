Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE33C6E96FC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:24:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppVC3-00063M-JE; Thu, 20 Apr 2023 10:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppVBv-00061U-7G; Thu, 20 Apr 2023 10:23:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1ppVBr-00068S-62; Thu, 20 Apr 2023 10:23:18 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KDtaGP019441; Thu, 20 Apr 2023 14:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=JMh+dU9LySzUd0iXLymd67l80NCLQiehZU6oUAkx1/c=;
 b=YxWs2M2ubZStJlHitzHQ8r6kLkgCx15DCtnvcCHnQos1MLSUJuT2Bt54efFiqlU8ivJ1
 ZIgaRPNJnPjm8Hm4sA8t0P0QsMxWKYqEUt/s9RZgTzdIyC5GR9K7yrtRG6FeF+e/vr7j
 vh+mfOrpYC1nmFM9Qi+Hpmy0ZK70QHj/Pw+kJ77MlyThy4uRzxySxwb03rQmgysUkKe5
 9mplfDvxbt8XaBTFH33YYcOIxiciujZTs6rKE7m5X9h3DCRrs3LhjzbW6UmDuLmW7A1/
 /U6oj8PIu24a6K+xM19nhQ6k1+t6mGkmAV3wts812g0KFSpKtGmFtyEPz48ll06ao3f0 yw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pymfujyaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 14:23:06 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33KDkcPQ011136; Thu, 20 Apr 2023 14:23:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3pyjc7uvas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Apr 2023 14:23:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmnf/nI4Auys3Q98y+AM1sQyhpMiA9MI0CP0M3ZO3RD9rHpmNxZeAGFbi2w3xMc9xuAkmqio12mLS5wCsP4y+2EUiZNvBkPMr0ACd0clm4PuCvwSUYm73mkANCjPV6MjF58Z8JzZxvmEyl8UuYwMS6ZlTb6AMi7kjGCypPIsTj8zxl+VfoBVtCHDeooycDmp+t6SB7pj/J8V5o9oLS9weP/Od8I5aFERpBHBxaXcks8y8Xodx5YOBZVNnD2jI3az1makddS6M47hQ6wt2q8dnKazPB1uDMSyIVQHfSRAT9YFDJsmm9+d1xTXYhyxgc4ir1fxULuCMerceCu1RhDL2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMh+dU9LySzUd0iXLymd67l80NCLQiehZU6oUAkx1/c=;
 b=EqRO9q38IQlLRCENsIW+RUFr9yjPoCffLO0Q8RFHGmitj4GB2j3ZKQzWWP1gz+1Kxidk3Q1v118XQi5S6DkUR3/G8xNbXg3V/elPKR7kWgScc9SpvPMt6eAZJQ8vt62JfNkRtooFhOjAKub+uGW0L0Oyui1oefbz7JcyP+YuBJMKEaLtETaadRnLBbX7IJmB7I2T1PKKThkzLcs5WBis9sFe8J9SJWTH3RYGnZLkIWCTcyVkFpo6KZiYgtLQG6PoaKYzSXwkyIiOr34uiJC1Q9U/OtbaMI8WDhTPP5sENHC5fywFv6P0qlJNaAq3HAMLJ4dnT1hqRniayBDVedWbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMh+dU9LySzUd0iXLymd67l80NCLQiehZU6oUAkx1/c=;
 b=YRIRohE4wJz8D0VgtuEL3bGggoHS6diAZko3E7lU08ZnZeOQdOkHgES12uDoaL0Q1ynnS6AOm/Z2FFPOOigBNej8tzOHWlqNOaomwRWsZuwsBl4+RNlgEFPgDQatENirSFN94SMG1ORyGAftM6ZkeFY1oZ1IE/WqYwvBxs2wL7Q=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH7PR10MB6204.namprd10.prod.outlook.com (2603:10b6:510:1f0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 20 Apr
 2023 14:23:03 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac1a:bf88:bdbf:2573%5]) with mapi id 15.20.6319.020; Thu, 20 Apr 2023
 14:23:03 +0000
Message-ID: <b0d86775-f7bc-fe38-c2ae-fc4f53173138@oracle.com>
Date: Thu, 20 Apr 2023 09:22:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
Cc: shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com, MIGUEL_LUIS <miguel.luis@oracle.com>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
 <CAARzgwwVAptvsR1_8ttUKroLuqKdLc1dHWtNe7S0S3N-Nq4otw@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwwVAptvsR1_8ttUKroLuqKdLc1dHWtNe7S0S3N-Nq4otw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:5:3af::23) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|PH7PR10MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: e76f0729-92af-4e74-23cf-08db41aac032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LEqB72VmzH2ygFMBvvSfQ1Ar2pw+euzfsBDn+CnhmXcozlmQmggvl3CUg0O0Om5kjmcWELi6Xjv99OO1KTFSmUcRt9eprHUz9QaMO30fcFzjaUw1tIXXGyTQ9MqUGmZhO2A92JMUsgxYBQsWN3xKjbo5B/N6RqUk2BKelqNWrIdHb2DqD3h8FRsyGkbiIVBeQ1jdE1+fJlUcX5o1WqTnrGsST3EN+SU+A/pX+3ORmQArBOSMM6SAcuE0GjAFeqyqvfUMjL6Cs3jnSfunN24imt/i0nYurBVkCnYs0P7l/2ESkAUFVB1LfOeBur8dgsKtDEyPGgbwI8p9TVlNmwdd70h2COE7o1esowaEK/tqKzj9m2La582FsmAu2TIUbIS/W5wSUfASWLCGuLWmidau9xfTLmGVs6ujzbYAJDUSSjOzXaY/wafNZAmAgrxxySNczzvB6wTvi5pD7SceNze4KgCsR4eRzfUrUBbfU4jyan+Fww5mZIn80cAkkrrC9WqBJuSxTtAmhKBL/3sURezZCmzBqZO8G0Liicqgizpu6h9XLIxUPv8r9zRWSWpYEBEXZTFy1RCWwE4y4Irld/yEgno+Qt6JdWqvyfxuk2sTbrKgBjvwXjlj4F8xan1t+2nNpu4bbqhc8LQpSJYVVC9dJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(6506007)(4326008)(2616005)(83380400001)(6486002)(966005)(478600001)(107886003)(6666004)(53546011)(186003)(6512007)(66476007)(66556008)(36756003)(6916009)(5660300002)(316002)(7416002)(38100700002)(31686004)(66946007)(41300700001)(2906002)(31696002)(8936002)(8676002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDU3dmpaSVNocENQS0VkbEt1UFIycSsyYzl5Zklnb2ZOT1NVelVZZDBqRXFG?=
 =?utf-8?B?c2lRY2J4SUkwRVZQdEEzeFhyeXdZOEtMZWhJTjFwSmlEMjdPblhOa1BvUDNX?=
 =?utf-8?B?K1dFWjdTWFhGbHZuVHdyUkZJUlFqRDRZZzdHWXdVQ3NxMTRPVWhQS3FDUlRC?=
 =?utf-8?B?NXUrSEE4cW8xUmtlVUlxU1dpWWVvTENHblVZN1dKdmhWUnRWZFBqdEkwRFFi?=
 =?utf-8?B?MzZjcVhNc0FDSTlsZ1JVS3Bxdm9yNHl0RVJEQ3RRZGovT0FUSUZ3MEQ4REky?=
 =?utf-8?B?d2RLUHVMRjZzYzJRcFBsNTViOC9kYVFMOGV4NzVrUXdpOTJqbjllOU5Cam44?=
 =?utf-8?B?a1g0eFRjM2pCdlRqWTE3QndzN3FuMXlaUmFBTVJ0Q1dkMFlIYmtXRjFpZ3ho?=
 =?utf-8?B?dVZEUlhYakxyamlZM3hYLzUxeGU1ZEJXNkJ4alBrNkw2ZytDMy8yRklLNlUy?=
 =?utf-8?B?eHMyNUhlTEJmWG94Q1g1NWZucGFQVUlGZ25sd0EzYW9IaGsyR0IrWTBoVXl5?=
 =?utf-8?B?V0ovMmVJN2dobEJLcHF5b0l1WHRhdDI0U3BSTytlbG00K3lPaXpiWGM4THRW?=
 =?utf-8?B?LzVTdHNTbGx6aU1pNSs0MUt4dy9HVENmbi9IUXlacDRiTXQ4YzNkQlFLUkRu?=
 =?utf-8?B?K2FOVlRpZFZTd1QwaDJKakh1N2cwQkZ3bGs1T3dBUkR5bXVRMGNzVTlLbXNS?=
 =?utf-8?B?OHlGWVVvMWxpZEZaemxuNncyNkxqUkNtdTZMRTRkQ2pONm8zc3Z3eThVNHpQ?=
 =?utf-8?B?L09pNGNydGVjOUpVSWUzUHVld1hMenJRZDMvY0tiQXJtUTBxZm1mbDE2ZlNx?=
 =?utf-8?B?Y0czV2ZpNmF1WVFqUzVWQnJWLzBhWXMrV2l5dHVyOTdnaHdScG9zM1ZBQVpC?=
 =?utf-8?B?U3Fra2Q0YU13ckhGQWJIQ0F4LzZIUGlhRUpTY0FUc1JYSDEyUHI4c1FwYW1D?=
 =?utf-8?B?cnRhY2RqVlJwVzFmWmFvY29ZNnRTTDFTckVlYXpkRVRkZmtMRXVDLzBEaFRR?=
 =?utf-8?B?V0lFQ2NCZ2FiRGNqbnM3R05qOHhtM3pTSTFWODNaMXh6Y3Q5cXB6NFd0aFds?=
 =?utf-8?B?WHJXYWVlazNKaFA4dGFkTUZsOUFzY0w4UjV4cHV3MlFRaDZUNHFidHBSVWpO?=
 =?utf-8?B?RklCWllJQlh6MWxHVGZ1VkswSXY1eWVwUmJtdklEWXh3L2c1YW9UMkxaWExz?=
 =?utf-8?B?ZDE5QkdWTHp6QndrNGxEdGNCZzh4NFRmZUh4Z2U3YW9IMFhCSUhBbGVYVFMw?=
 =?utf-8?B?SzZuUHFZbjFXZGdrZDVHYVdJT29FdGJ3RHJHdWdFalBQbG5CL1pGUCtvbUFZ?=
 =?utf-8?B?dEdlVkRlTzd1SWxUUXhnSDFWUUNvVFlVamFzd3I0OXFxMHRESmVRMFNQblFk?=
 =?utf-8?B?cjVzTVhOVXhuRWdzVElUZmpYN0liUkgwUUlGSU8yWHJZMkhFVXJob3BDNW5i?=
 =?utf-8?B?OVZ6Rjc5KzhQWGV0RTZPQnJDcjR0T2Z2WmV2TmhDRUhhZC9sSHFXZ09kcFdX?=
 =?utf-8?B?TDArS2NvY25oOEc3K3h3MTVMVXdMUURaSDhkU0FFbzE5SFhqWXdwZzAvaXBx?=
 =?utf-8?B?bW5UcVNFS0FRUnJObStjSktKcCtRZFRBV21FZUtRY1ZPQzlGU092c05OQ25M?=
 =?utf-8?B?cjhHOG0xSVA3NVp2TjFaMUdMMkJQK0JnVEZhR1J1aW5CbjdJdEFEamhsU3Bw?=
 =?utf-8?B?d0RiT2VoRXhhbmJ6b2F4OCtveWx0MnRldXN5aUU2YVNJbmlwY3pvNXg2c1Zt?=
 =?utf-8?B?Y25WaHRiMTllQXgxZ3dJQ2ZSVFZpeXlpSHljVU1XQ1IxeGJkUm03MGZsTXY2?=
 =?utf-8?B?ZmNKNlpvUDVnLzVLeWxoejR6QkVra0Z2TC8rdFRYZWlqNUxVd0M2S1YxTWJm?=
 =?utf-8?B?MVhIYlMzVy9oM3hiVTJSTmNvU0VHOERYV2hKdVdiVkhoK0JRM1RnWmI4NkV4?=
 =?utf-8?B?c3p6RFpjZHhpUmdYWHNFQTI5R0N0dFdJZ1Qrb3g1ZEN6bDk1cDJrZkJUa3VF?=
 =?utf-8?B?TStQcHFndUU2bkRvdU5JSHUwTTA0WVRwTHFTOURPaXZTQUZRU3RTeUxlK2Mx?=
 =?utf-8?B?Nmo0a2VMQUs4amhsNStES2drd3RoNCtEWXZndmtVQi9KT0FMQTd4bmx5OWtl?=
 =?utf-8?B?RUpvMml0MXlsSWY4R1Bidm8yQVR1d2lnZE9TSWdmS1ZvMktRdnUyN01vSmZo?=
 =?utf-8?Q?uRYmZXPDSDDzZKf32RCrPXQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: C52XB3Uu5bSpSzMNFra++ZG5g4bMf8qtfYikruVb4xmSRzq/mc/6mKSSrmYq4St/6fkQ8wsWA3Zkje/qpIhGZN/eFbyHg2B1p5GdFxrm6bgkwEULZ2TztxetP0b75MAtXvzr4K3NTzXthuVSSgHz4tKDqbyMfj+fJXATXdI9xpdYI96gFih1zXui/rfh/fLXcMhV1lzBb+GFlA66Bojh5gI6cyQmlnisB8IlwuR3A5w2qnUAnhPo9+NRoQ04MHzccsdNmRJCBu3ER205X23Wrh5vQQIGATOH/bdvfqiCYK8vh2/gUeEWH7yWsTtjNzK3Vr09QB65pm4HLinzP8RqOVktjR0nlivipz0jF7IIdE3f+XZvuEDWFSyitTshEAnmDXk07x1sAr4YMQpB89dbXGCxARf7YKbnQ/9hGyFvRRfPaoDIUDGYXulbZHQR5sLJz8iCZWmetVK//2b6YtRcTFvwewqHL2KGAa3yZERcdK/XGnPBNJ1f87CoQafy4MNZp6ahJ1t5FwSdr31augR2jitzVDftNKyQweIIaHr2eutfX/VaN6AItSCC4pCkeMFhHp6I2Tdn8RdvwVdyIz/Odm/sPfZ0X3BJBDLifzeCZCB+XY5M69td5+fGanQ4FriOxN9reQgIatPDNMjt9rqJ5dgwFmVuYq+jm3FaKudia2Pc/hJej6w4wxNv51W8GtSyDb+QU7tZ6VjQLBELa8364F5gsYIHBcUEJRabDfEFmXAaJiyJqlmnKWf/e+Qp4b1EacCJp18k3y+sAEmZA1bvQse1VGsTyJj9kRYLE/tkVTx3rrghhrl5WF7ASbQbEXrx5VsQbMOwAiGK68p+wJ9WdnaaYRjqzLyvtt9PAmpusp9wOfbxqaGjZICDaXog+3T0LNJJnNdgHXHWnkCDvzek/A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76f0729-92af-4e74-23cf-08db41aac032
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:23:03.0263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mZh+rFeDi0ueaL3H1XSQgCBSAvH7gnnzfnmnHlx6v3Zl5MdnsShRgLxux6rOB4Mmucnfxn+twUiUEilHsIA3jazYse84qtAIlpEi6HtOgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6204
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_11,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200117
X-Proofpoint-GUID: oJlcmhMxPjvMtT76d-fHnvzTvM64cZFm
X-Proofpoint-ORIG-GUID: oJlcmhMxPjvMtT76d-fHnvzTvM64cZFm
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/20/23 03:05, Ani Sinha wrote:
> On Tue, Apr 18, 2023 at 10:22 PM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> Currently i386 QEMU generates MADT revision 3, and reports
>> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
>>
>> For MADT revision 4, that introduces ARM GIC structures, which do
>> not apply to i386.
>>
>> For MADT revision 5, the Local APIC flags introduces the Online
>> Capable bitfield.
>>
>> Making MADT generate and report revision 5 will solve problems with
>> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
>>
>> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/i386/acpi-common.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
>> index 52e5c1439a..286c1c5c32 100644
>> --- a/hw/i386/acpi-common.c
>> +++ b/hw/i386/acpi-common.c
>> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>>   {
>>       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>>       /* Flags – Local APIC Flags */
>> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>> -                     1 /* Enabled */ : 0;
>> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>> +                     true : false;
> 
> how about "processor_enabled" instead of just "enabled" as the variable name.
> 
>> +    /*
>> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
>> +     * if Enabled is set.
>> +     */
>> +    bool onlinecapable = enabled ? false : true;
> 
> ugh, how about uint32 onlinecapable = enabled? 0x0 : 0x2 ?
> 
>> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 | /* Online Capable */
>> +                     enabled ? 0x1 : 0x0; /* Enabled */
> 
> then here, flags = onlinecapable | processor_enabled? 0x1 : 0x0;
> 

Colleague Miguel Luis pointed out that this is simpler and equivalent:

uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ? 1 /* Enabled */ : 2 /* Online 
Capable */;

Is that acceptable?
eric

>>
>>       /* ACPI spec says that LAPIC entry for non present
>>        * CPU may be omitted from MADT or it must be marked
>> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>>       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>>       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>>       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
>> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
>> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>>                           .oem_table_id = oem_table_id };
>>
>>       acpi_table_begin(&table, table_data);
>> --
>> 2.31.1
>>

