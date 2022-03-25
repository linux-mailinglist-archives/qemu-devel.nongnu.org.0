Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD7B4E7A7C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:37:04 +0100 (CET)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpk8-0005k0-0e
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:37:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUH-0007pw-Am
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:41 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUF-00036v-Ay
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:41 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PI9MrD000421; 
 Fri, 25 Mar 2022 19:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=KAUCqMYKFGzPIrC+n+5GA83VbZw8TVXWiiajiZOyadE=;
 b=waq+PFkojraRhp45KPbHU7aEooOaRLhJ/kr+qn/nbXxF1FRcbWY+3k87TYqCGA5EdCNd
 ODmx6g8xmAp6ZMY9nQP524w440lAFVO6H6sUd0RcYH/CIrsXiiiytbgAOZvw2Um8xj44
 ez400cy3HMR+hq6PP/I7e73THhvn8WKKP6cy2VGrbbdyFo0azmU5GSttY6VYKGznujVh
 Sey7zN5Ey8Ao3gzVjFFik5WMPp4IwoRF29QPSApIAnZSU4oqdlvQ+SRErPs1J4/46P3f
 eIqlTAffzpGn3xrTwKpjPoMZ1ito3HbNKa7wz4otB+oAsjtj6ioEC9Az7H1dVAmyGfuV ZQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew72aqns8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGr2f125442;
 Fri, 25 Mar 2022 19:20:21 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2045.outbound.protection.outlook.com [104.47.56.45])
 by userp3020.oracle.com with ESMTP id 3exawjj801-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jszhqgD4jLZuGb7wmwRKDvvByvsZQDJMcM+zz/srBNw5vWjPG+oWWaAc/N/Macda/9CLSzm/ViXuDxkwusVyuWlQMrRNZIjgAsx1Yekaz/HtIHXHU9G5MIiXmy0n18cptn4xFlsEoGCm78elMPSr+VRUJlY6z6EeOjtMdbEXhvInXiHzus0r7WDG5a3TaGoEg9+52411wuYZXugsqCaLvelcYR42xbLeUNLn5qCz1YYohhdNBKdkRqk0NY6RYfjyz63meh75zR8kH4kcw+yf7J9cbU4D3FA3avnoK7wRvxCwJnlLRWpi1g/syDO3Mdg4JRKC8DJLtqVokrJgosCiOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAUCqMYKFGzPIrC+n+5GA83VbZw8TVXWiiajiZOyadE=;
 b=FVgni14myN+otXSwpmB6nnffkYIEtaV7wXxWtvqWE2Dvk91ZbandXviiXKpm1R+YpNupai9hra71kO9xkYmE5Xw0NNnCE7H7hT9Z5u+ha+h5pCQQhLBhTqbVXP50fes6rmsN5j2gKNXcsRwtBTAp8FN8c5WXZiIs1ZP9j/IDsc9hUSHEX9FxbPcVim1s1uDZZLe30Wp2C8rCq/KkzK4wy91y/DbQxf9GRpTXvO8ov68qGzHjzWHhplr+GHFzIifHTMIrhupImg3d4G1ZI9K77E4zUdYPXVDKRSjNFY1X7/S+jW0rHHoX8mZEfasJibDWNXpAXSaPNYomSshXBB+83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAUCqMYKFGzPIrC+n+5GA83VbZw8TVXWiiajiZOyadE=;
 b=F3ldANRVDYfuoZo0wOndV6+namb1Q5BY5k/Gav47YwzDIBItD3Ve9ka2OfmWSEsQ2X8n97qRA2qphwiV/vT4fE1cQxg2jcFx7NwxT+epgH39+BzfLdD9gYk6CONVOMeh6Np7Wd8T7lNLq2jTo6QWm5RBKvnzgEMon0JeTXNjDjM=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:20 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:20 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/17] vfio-user: IOMMU support for remote device
Date: Fri, 25 Mar 2022 15:19:41 -0400
Message-Id: <2fdb90acd40a1f79d571d4e68c56e6b08aded60d.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c703a68-5ebb-4b45-004f-08da0e948051
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB5206485AA440BEFBACEBB89B901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRhL2iSMel1+Y0AgH2FinAlhUQcf6bw0gxCNre/Nw8wMwNfqQ2hcXgzFHp3ORGeYbLK0SaEOWzX3qwtimt+lYuiW3Sn7ChRBJCxln0euAmkeuUyPLpD/xWsn6FxkoH8KqKTPZ5/U1onshEGkO4C2IY04VlDeTSQvMWrJWeexP2BwamuQzfE2kLACg06yRbYSFX4OwHmqZH3glQqKAMm04JWM+sIwUhTY7Qjbz6ltufdn0hqofJyo4+10JcrjDYr1xKYYN8Ut+MdkkankQZaonF94uhavvaS7Idzzg/wIwQLFm50ZFlWAohKD4v616hinT2Ta8Oe4p+Gjr1klHfQexpW9FnNxGclXVPKvE5orbLo0yXv3+qA8MuC8rlzbYqE0UTcJsb5aQ2wok2b2weG9FdnYk8yoDwStDG5cKsmU8GapcqwIEj3M6+xbEjw+R0T84t2m6UFPHxlcEV6dS5utaYxYk+OrV7Ip0u847rJht391RU0q6YFVQ4qpL0XfBGrsf62ma0v4nVokvaTSUSgk+utZ9gtHd5RjHX2XcIbYwTg4FrfbRSSw+FS4RFy6zL7l429SdmHGA6zWNZEcs6fky9CIunDKGFVon8G6IvPxhgXkkO+bP2GnPkYzfJoFm0r91H1cILv95Odfc1UxeGW+izdUM4inmpRY0R4fp7Py5XX/EWfJRW4EocQhPbJUabhykag7EVGxx07JxzmCaW8TJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUc3L3lXbS9YYWE3OXdYeUNEUWt5eVBROGpDeXRSZFZxSXJ3SjFiQzUwb3lO?=
 =?utf-8?B?UXh0SUNtTzhlNnFGQTFqVkZBczg2c2pjamR6cEhOMDBzRmNmWGFML2MwWmpQ?=
 =?utf-8?B?UWE2TGwyZzBRQVlrNWNkQnNGZ2tZM3JySkozOFNJOGpWOTFPWlhpWnhSMXY2?=
 =?utf-8?B?YnhtZnU2WHZGSUJncFFpQnJrcnJibjI5NEY2dGU1cEhYZjV1SS9ZVTVLRTdY?=
 =?utf-8?B?UXFFcVF0cHhMYmRFTmdmZFlreGJKUHBCUmRaekpteDVteEJUbUNveVNWazNO?=
 =?utf-8?B?N1VKZTFUWUU2SVhneDVQNzkxdlB1S21sa09EM0x6MEk4bVgxd3NOSlNKWU9p?=
 =?utf-8?B?dHh4QURpV0F4Wk9XSUt1R3BzTHcrZHQvM1YzcTVwM1FVMlluV1BCUWVoK1Zo?=
 =?utf-8?B?Ukw2L251dUpBVzBGdkc2NUZwZ2hmTEdrUVRJVGR6VnRQTHVJVG0yRXJ6eVNu?=
 =?utf-8?B?U21JZFpielh5TFhnT285djlLWWxOMDBOK0NRdGJkRC9jd3IzVlRTVXZBbW1Z?=
 =?utf-8?B?c25KRGJ5Z1kwTjRRSS9rYVRLYUlhdUs0QjhobFJySVhobHJzRmN0SVBhRW14?=
 =?utf-8?B?SjZuV01qVGFZR0dIN2Y3bVpNMHM2TUxueVlKYWMyVmUxWGFFamFJYUFteUx6?=
 =?utf-8?B?elBMck96a04yZzlmOTltSUZwYkovV2lRYS9YYVNFeURLbnJZR21yOGxHZktT?=
 =?utf-8?B?Z0dMMzZwQ0NpVFNoU2sxOFlRY1dZNHBsRHNjOUxQdW1WSmdBSTZYemY0NFZy?=
 =?utf-8?B?a0o4KzhXUUd0bUxhZjJNYkpIaGtsK0Z5TEtqWE4vdkg5c1pRODczOEVwRGRq?=
 =?utf-8?B?c2ZZQnorTEh0U2NaSU5idlZCMUxpS3hQUkMvU3k5c0xiNmhkd1h3MDlKem9E?=
 =?utf-8?B?bXFNa1Z6TEJiTVBYdzJkdHVmcTh1V0pVNkRQRWhWZHZmdFJtTmR6ajhYbmxO?=
 =?utf-8?B?ZzJ2WUp4TzdKZjM3cThJbWczaUc1UzZ3Q0pFZ1NvNTBOVlZ0cVFxaFFXYUo4?=
 =?utf-8?B?dDJHclY2OXU4M2ZTa3kxbzJjTEZVRjVXMWVEWEFYMWo3eHdHbFUvcUVLQ0p3?=
 =?utf-8?B?UTFjNm9JUzBscjhUTHBYaU5uay8wb3IzU0htRFZpS0RIU3Bhano5ME1FdlJ5?=
 =?utf-8?B?dXpaMnZZdUI0MXFyUzBKekVNbnEvLzlHbTJMb2MrNURLbDdPeGdsUGNSdmx1?=
 =?utf-8?B?UkJLT0VJTitoazVVQy9KalVpMisxY1dxdmhBbXZsN3FtMGgzeUh4ejlZVEdT?=
 =?utf-8?B?b1YvRnN4ODRuVGQxendBTVU1ZkpOS0xFS3VlbER4aC9uOHd5V21BOHFoVkhY?=
 =?utf-8?B?Z1FQeXdPVWVWd0FKZ1d4enVEMDRWNWFnbkJObjBiNWozOVRPYzIwQ3RQU25J?=
 =?utf-8?B?dkNzN0NPSG03QzhILzRLQVlwc2xsMHRvYjZCbFZnWGE2SVUrWWNRdE9BMkpO?=
 =?utf-8?B?QXFjZG9CNHM5WFJKYmRXOEVkaEd0a2dVUmJVYUlXTHlOOWJBbFZ5ei9PSVVm?=
 =?utf-8?B?YzNlRnhYRS8xcFFaRjFwZlBqd2RoVXh5enU4aGVEaDNDczlmb3FVdmlUMUsx?=
 =?utf-8?B?RmplOVBvL3RBZ281UXM5TFNKdXNseC9EVFlGa0lhbG5zTXJMc2k1V015ZjFO?=
 =?utf-8?B?M2FadjFGaStYZWM2b2Izd3RFUnlwUGdCZ3NVYVlGL1hWRXk1YmJnbDBVVGV1?=
 =?utf-8?B?eERQam5BYTRiVDV4ZHBWdU9LR1dVQWFPdnFpMUpuWVdTTmYxTmZNY2E3UUNs?=
 =?utf-8?B?VnVyV2xjc1ZZY0MxNHpDSjlkTWtuenRxY1dUV3cxaVkyM2NNK0FhaEwxY2tq?=
 =?utf-8?B?ZmpZQ1N0YzJNMUxwVnR0TEtiQkJwcEF4azlZTTYyT3REbzZhbGxSaVY2a3Rx?=
 =?utf-8?B?Uk1kNmh3UGMvZ3hlWm5Mdk1CRjZUeVgwcnAzR0pxNlVoZng3czFWc1NGdndq?=
 =?utf-8?B?RmZBdCtjczFkcFFsYlZRalZXdlM2UVhOT2NnYkNZTVYzZ0xWcFVmN3lzalRC?=
 =?utf-8?B?QS9wUXZ1Nmh3Z25BVUlwUVBPVExZY0ZxM2pyTmcrZG9oNGxsdWVDZTlDOThW?=
 =?utf-8?B?TTZIZ2tFbDZjdDV5anBOT1Qrd1VjUmMxa05wY1l4VG8zTjkzMG9RZ3NCUkxB?=
 =?utf-8?B?cS93Nm9EZEczSDhhYWtDY3pXRU5QeGVwVjN2TU1xRUgzNXpzTFpKcmhTS0dO?=
 =?utf-8?B?T0JwS1lSREE3SXdpNEx3cklRWE9mZTdRM1kwc3ljWSt4RHZFOWx6NjBWR1pM?=
 =?utf-8?B?NHBsb0RhTXZnTG1XWHk3YkFRVnBoRUMwVGF0Um5nV2FNaGRUd240Q3kzZXdy?=
 =?utf-8?B?VGdTWU1VRXY0bFRua3dsTC91L09sb3VINkFDV0psZ0ZjVDZSeTc5cmtsR0po?=
 =?utf-8?Q?vXB+xs8ue9ncC0ho=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c703a68-5ebb-4b45-004f-08da0e948051
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:19.9118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uAX3NoKEThjwQabJP05NDMBlLwva5QkqwH4EybclvZDyLz8TuP1bjZv2WytTj6GbOXk6Y+CCVf3vA5hqj0pOBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250106
X-Proofpoint-GUID: ENRtw5d64bn9I6lwOx0lBt98g6XB2uwJ
X-Proofpoint-ORIG-GUID: ENRtw5d64bn9I6lwOx0lBt98g6XB2uwJ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/remote/iommu.h | 18 ++++++++
 hw/remote/iommu.c         | 95 +++++++++++++++++++++++++++++++++++++++
 MAINTAINERS               |  2 +
 hw/remote/meson.build     |  1 +
 4 files changed, 116 insertions(+)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..8f850400f1
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,18 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+
+void remote_configure_iommu(PCIBus *pci_bus);
+
+void remote_iommu_del_device(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..13f329b45d
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,95 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+struct RemoteIommuElem {
+    AddressSpace  as;
+    MemoryRegion  mr;
+};
+
+struct RemoteIommuTable {
+    QemuMutex lock;
+    GHashTable *elem_by_bdf;
+} remote_iommu_table;
+
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    struct RemoteIommuTable *iommu_table = opaque;
+    struct RemoteIommuElem *elem = NULL;
+    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_bus), devfn);
+
+    elem = g_hash_table_lookup(iommu_table->elem_by_bdf, INT2VOIDP(pci_bdf));
+
+    if (!elem) {
+        g_autofree char *mr_name = g_strdup_printf("vfu-ram-%d", pci_bdf);
+        g_autofree char *as_name = g_strdup_printf("vfu-as-%d", pci_bdf);
+
+        elem = g_malloc0(sizeof(struct RemoteIommuElem));
+
+        memory_region_init(&elem->mr, NULL, mr_name, UINT64_MAX);
+        address_space_init(&elem->as, &elem->mr, as_name);
+
+        qemu_mutex_lock(&iommu_table->lock);
+        g_hash_table_insert(iommu_table->elem_by_bdf, INT2VOIDP(pci_bdf), elem);
+        qemu_mutex_unlock(&iommu_table->lock);
+    }
+
+    return &elem->as;
+}
+
+static void remote_iommu_del_elem(gpointer data)
+{
+    struct RemoteIommuElem *elem = data;
+
+    g_assert(elem);
+
+    memory_region_unref(&elem->mr);
+    address_space_destroy(&elem->as);
+
+    g_free(elem);
+}
+
+void remote_iommu_del_device(PCIDevice *pci_dev)
+{
+    int pci_bdf;
+
+    if (!remote_iommu_table.elem_by_bdf || !pci_dev) {
+        return;
+    }
+
+    pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_get_bus(pci_dev)), pci_dev->devfn);
+
+    qemu_mutex_lock(&remote_iommu_table.lock);
+    g_hash_table_remove(remote_iommu_table.elem_by_bdf, INT2VOIDP(pci_bdf));
+    qemu_mutex_unlock(&remote_iommu_table.lock);
+}
+
+void remote_configure_iommu(PCIBus *pci_bus)
+{
+    if (!remote_iommu_table.elem_by_bdf) {
+        remote_iommu_table.elem_by_bdf =
+            g_hash_table_new_full(NULL, NULL, NULL, remote_iommu_del_elem);
+        qemu_mutex_init(&remote_iommu_table.lock);
+    }
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, &remote_iommu_table);
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index e7b0297a63..21694a9698 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3599,6 +3599,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 534ac5df79..bcef83c8cc 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
-- 
2.20.1


