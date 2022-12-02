Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076736406C5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 13:26:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p155r-00074b-3Y; Fri, 02 Dec 2022 07:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p155m-000724-SB; Fri, 02 Dec 2022 07:24:36 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1p155g-0000BH-3O; Fri, 02 Dec 2022 07:24:34 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B2BKgeI005892; Fri, 2 Dec 2022 12:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=/lVNsinCCOux8v+hfBIDMhZY07VGQXGwy6p9xoLZwis=;
 b=t547K6g2HJynmQGd++pkjBB0K9qESMcUrGntpmYpIoqYpHnET0JZmj2XVQVydmYl0+68
 tbvpdZJdqUbWm1yWxVEMC+kw2FRy2HacZZKnr6tMJgxCbAJF7O1W4GoHWq789ULRXMV8
 ktiTWDpjxM2NGmlEk3IPE9O1BQgg7P2tF630IUH/a/bpJvrZV8Fog2lVsztshyrkEhhX
 jG16TcQ8Myc1VH9Mw4u2cdr3/kGin+RKHt4unZEejGmxAkCaxvpzjhsOpjXiCP5uhKuC
 bg9sIqwXhX9iFwmXXcQ3LomA3rHdUqt2rCJvJ+9OjNicEz5Ls+QamdRRW5Ol1C2+Fkui Rw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3m782j13ns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Dec 2022 12:24:04 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2B2B2IqB020132; Fri, 2 Dec 2022 12:24:03 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3m398k7ca9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Dec 2022 12:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVx6EEX+r6pt8duJiqv5G9xZ0zoeqQeNwQZU1hpJ0WAndPt/9Mrlt3PLgzsNIaLyUt6AM78l0TYT+GFMuk7x8rFHtePlC3xXa0xmp7r6olORNhfOruwBnO9OK2mUchHHQqKzehK2K4BDNAp/0ss64UN6ynpZzdf0lXPQa3rHeMEQxyz1X6vRtiTE4GqTJJh8xVH6Sdz+XfOy9bX2eNDQjVH6/no4UbeHg3yUV1GxL2CAXHBm6UbBR5HhjpJ4uRy2cjH3EOlRV961q4BC0tJax4RRxEavRgXgP9nxWid7Cra2Js+YpIQt+WeMXVbBqBLeiIJ11dx7iwZ7h+pE9DGXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lVNsinCCOux8v+hfBIDMhZY07VGQXGwy6p9xoLZwis=;
 b=T+C+UXcc3Z20KAHLqivtQO93IMfx+0V4VybItL+dOXumEcMvC6CMyGGOSb4ns2ffZZOO7Kcacl8p7LMVle4vTpLl09wiXFqyqQW7ZfibM34n5u4e5cCFqASTbCF8mXLK6uCAUz8Hlc9xQkHzQr2BTcZG9NOLDI0oR7dUlvpzAhujSkij6C62n5XJUaa//9hxOkeuy+GDJehiS12bWCJYmYe/HacDEj17gldVDTDbrNxIG3KW8YYaU6uZe2pE9dZi5AYmgdbrzfQXRzLXnzHtCjos9XGmX9Uoc7+BIhn6HAOALOLfLn8h1Qo6Yb+KS2cMTqQQW2+faMVzCceRjIJsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lVNsinCCOux8v+hfBIDMhZY07VGQXGwy6p9xoLZwis=;
 b=LCkUpeg2O6bpRhnLyRywgRgVCdA7qorFE7zibjAyDzzk1DpasdHc85+y7MgBsrMVhxqXm84Pfajf1LN++9hr5T3MckSx/J3NxVl+g2VccpnLlRJPZjymKNKmIRi2ojS+FUa3mbTdvyo2sOaUc+0Sviaq3L3gNf7OyvnRuq5Nj5M=
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by BN0PR10MB5014.namprd10.prod.outlook.com (2603:10b6:408:115::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 12:24:00 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::141d:16d6:b44a:5482]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::141d:16d6:b44a:5482%3]) with mapi id 15.20.5880.010; Fri, 2 Dec 2022
 12:24:00 +0000
Content-Type: multipart/alternative;
 boundary="------------1DMWwefISCTsqw97Vtbjtx00"
Message-ID: <31d76035-3b8c-c9a1-4fd3-d3cc6af5f69c@oracle.com>
Date: Fri, 2 Dec 2022 07:23:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v15 1/6] qmp: add QMP command x-query-virtio
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, lvivier@redhat.com,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: mst@redhat.com, qemu_oss@crudebyte.com, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, eblake@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, michael.roth@amd.com,
 groug@kaod.org, dgilbert@redhat.com, eric.auger@redhat.com,
 stefanha@redhat.com, boris.ostrovsky@oracle.com, kwolf@redhat.com,
 mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
References: <1660220684-24909-1-git-send-email-jonah.palmer@oracle.com>
 <1660220684-24909-2-git-send-email-jonah.palmer@oracle.com>
 <6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org>
X-ClientProxiedBy: BL1PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:208:256::17) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4664:EE_|BN0PR10MB5014:EE_
X-MS-Office365-Filtering-Correlation-Id: 629e9b80-4bf1-4185-b064-08dad4601640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGcglrqRD/edDYB+QgY5Tol23AXnW8/WyLu9doftT1oSd5qKPL0eF37K25+oKt5Kyjd+k/XhFzJFN+nZDq5OzjfNa/hW5wEdzSB9HM2m+dMacKupBmIkCRROpi6PQ6mTIQ6MsEY62pbkPiJSJKw9gl1ZeDQtoZFOWeYbZmPvcqqBNQdznOfY50I7MIF2ZwY71MhIoj9XvoBAv9RLvGDapX3eOZa+XlONl8JXziQ3rcr5xXQn+S+4setjWQLlNHRp9u9fZVMHhlD+r5U0PhBlq51fVJxSimRG0I5ntpIQWNBlZSShm5jqPhOK00LDBH1qadSbM54GgmR0iVWyDhry3WKwLYijd+1GxFk8hZx5Lz35X9AV7dcmRBDtb0em6csRIcAa3dOEsvMAqE9sZx76NZXtQnSGrMaM0D2NHAl7jGNT4Pxx4L7VkRrFldUHSztyfFUjoiQGYnx1lO2PwmqrDPFk5U2O3vD9MCBfV1dbuRBCBxgzro4Qwf5FtPA+FrwD4k5dZv417Sbw1X1mgGX91OCmdfeVKMzoER2D4Othw+u/zvwtc1Y9UZ6sbdFheJu99ugUk6ODOt8KkF8xXNVNMHXeB1OaHSqFlWlejmhJaC62i2AHLJyHF4kMvqfvNClxSNmtNlZbKfLLDdcnyS6OGs9k2Vj8VYABl3L/+FEhsu7lsV3Dfyej+DXcQrLUtek1WGT5gPQSMMCjA3U00jYeHfKpo4vua7IedKlhEfztSko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(2616005)(83380400001)(66556008)(31696002)(2906002)(41300700001)(7416002)(86362001)(44832011)(4326008)(66476007)(5660300002)(26005)(186003)(8936002)(6666004)(6506007)(6512007)(33964004)(53546011)(8676002)(38100700002)(478600001)(6486002)(316002)(66946007)(110136005)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW5GWSt5dzJ3VXZjb1ZRN1RBaFlIVFVXTDZKV1hTanhhVVN1WStlaGFUTWly?=
 =?utf-8?B?UjZaVThJcnJFNXJqNkNUOWJBSnNMVVBWT0Y0b3A5Z0t3ZFhzbDNwd0FOUmhJ?=
 =?utf-8?B?NHlSdzIyZG9sRXpEeURqdU56V3hjempoSFU2Y1FkL0lWdnVMZUlYS0p2Tzla?=
 =?utf-8?B?TzB5S29NOHh5U0d3ZEI0bGU3OHhsa0E2d21iTi90RVZhTWhaK1Bnb3luU3FD?=
 =?utf-8?B?b3NEMFc0RDZmWXcxU0plQmJEcG53RkcvR0lnMnJudzI3dnAwdjBRMFpLQUZp?=
 =?utf-8?B?Ty95QS9uM0JxWEViMmdNQ3lxN29UeHAyUW0wNFlManppSzdNU0U5akc0alJy?=
 =?utf-8?B?K3dTazJDdCsrWFF0cmVlOFBnMUx3MXVSdjhqeU9XQUJueUcwUWYxY1FDMXEy?=
 =?utf-8?B?cGJyeHNneUR3YmVWRlo2MUdwdzAwK2Y5T3puNFJqemoxVitrUjZ1WmlrVEU4?=
 =?utf-8?B?WTBIaEZmMDViaU5KMlpaaFBVSUJjcW1DSkxrcXR0VDRaalIzZllKMkZabTBl?=
 =?utf-8?B?QkgySmt4OEM4NURuYVljWXBkenNwSmFSbDhSZjluUUZySEdxaDg4Mjc2bHhi?=
 =?utf-8?B?Um04N0ZlSGVjLy9mVU10VEpnMjl4TGxXekJTZURpRXQ2d2FnU1dUcW56NWpt?=
 =?utf-8?B?Y2pmcVl0dVppTUdSMHdwdkltNjNZKzNndzdtUGxKSVVqQkFqM1VRbHQrTGV4?=
 =?utf-8?B?V0tjbk9KeEpUSFlIWFN0YmVERW5ualdGempkbWU4RmUwR3RZSGpUYWw3RDc1?=
 =?utf-8?B?a0pzTnpZamZNTG1UMzVEUS9IWHJXS0VIUkpZVHhMOGx2SG92cm1LQmZmU0M3?=
 =?utf-8?B?TGZKOXFuRW4vR201cUhyNytNZ2xpNXdheHI0Vm8rWWVqdGRzeGk3RkZQMTIz?=
 =?utf-8?B?OVVJckJBWFVqV2xKaHNoeFpzSFhsZkRSYmJvMGdQRFhGanE1ckZZdnhTaWll?=
 =?utf-8?B?bGUxbzR0WFc2Si9ZQk9JY2hWZG55SURIQ1htZlZJOERhdWovYURrYnkvWDBK?=
 =?utf-8?B?RUhTSm1vbW1yaHRIMC9kZVhjVi92Sk1DTTRoY0E1M0dqaEVNWDVmZ0E2NjBK?=
 =?utf-8?B?WGVlS1pKd0lzRnNnREF6UUh6ZmV0a0drMUx3VFEzZnlGd21ab3hKNzBEbEpt?=
 =?utf-8?B?UXBGb09DVzFJdGJYaDRmck1zWklCQU1kVFo2UHozN3ErL0pRNXVJYlVNNHhQ?=
 =?utf-8?B?N25KNXh4M28wTndsSjBZSm44L3dmNmRSRFY5Rm5vSzZvankvZ0QvR1E3WXhn?=
 =?utf-8?B?Z2J4Sk5keStiUExsTnhYdU1qTkNGa3FLYmhhU2dyazl6TGQyYXN4dkt4aENr?=
 =?utf-8?B?L1pqb0RuNzBidTlxVlFNTWVvTWlXb2ZtdTFreDNoQXdlc0RaNjlHZnJKbUdI?=
 =?utf-8?B?VURQaVJUWXNyMlpiYUZwUzNOT2NVMEJOTjFLNFZnY0tNTSttWVpHRm00MEt1?=
 =?utf-8?B?blRFSzNBUXhRRktDNGJUOGg2RnpMV1pLT09xdXppZ1g1TEp4aVdjMzdSMlN1?=
 =?utf-8?B?Wk1aTU1lYnBJTEVhU3o0WU5WSEh1QjdSTmZGeTJsdlBkOU9MQmNCMW80T3c5?=
 =?utf-8?B?bjdhR0ExaUJzb0VrakhnNjJpZTkwTUJFK01IYkZ5QkVaRFlrV0Q0TWQxQzRz?=
 =?utf-8?B?SzNWNTZ5c1dIR1daK1d6dk52R292TlVqRzVJUUp5bml4OHlUb3QrYkxtMy85?=
 =?utf-8?B?cklpaEI1WjczKytvNk54WnprM0trM1NPZXN2NXhWMjFCYWlLSElRWTY1Z2M1?=
 =?utf-8?B?TUlkeTIwRGt6V2hHY1ZJSzVrZkFPUHJrbVNsZUdFWlp0UFFwREVRZ3N5RGEx?=
 =?utf-8?B?RjZTbDh3TnJOclBjKzM3TGhzMHcxYldYYmlVU1h0R3lkci9QS0hGMGRlNlZD?=
 =?utf-8?B?aFluMUFtTWZzQkYvSkt1Mjk2VnJBeE9kSFgxSzU0WndSMTVvTWpRcjlTOG42?=
 =?utf-8?B?YXpUcDJBVXZqREhpdnc1Z1VBS2Q5Z1dZcUU5ODdFMStrNWkzWFgvR1NQbjNo?=
 =?utf-8?B?TysvbVdvQS9hcE1EVm5ZWVJqS3VwSHA2UWJsVDdlK0lydi9HWkZma2tHSjd1?=
 =?utf-8?B?b0R3T2x6QjMxOENFYnJ0TG1IUG9vOEFlU2VPV0FYd3FvQ1NlQkRvOUhJRzk0?=
 =?utf-8?Q?NmS2pFptvs2CAHCdbuFlLv1hw?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?L0hEd3ZGd3BQMmJVRXVQRUtqQmw1MVNJN0dTUGxzbTRIcHRXaEp6eTVPdmZi?=
 =?utf-8?B?b0FFNEVxWHhONUVpU2Y1ZjRublRaa2QrQnYzR3FCUExEUzFPYkdDNkljM2ZC?=
 =?utf-8?B?bzZpdys4MjRxRGVaWDRvQzIzYWFSaGFLdWh5TUg3Q2k3cFNPUDRtNnhXb0xH?=
 =?utf-8?B?MTQ0NFljZThoZDBtN1hlclErNzV3c0o5U2MyTEw1VFhrT1B1QjdXcy9pcVE2?=
 =?utf-8?B?clowVTkxWUd1T2JoMWhlN21IdzBmMzE2YXlXb3FiTjh2bWJOSm41WDF0bTgw?=
 =?utf-8?B?ZWlMWkxZNGllc0oweHRWNHdRMXN4VkhnWjVVY0RVODYwNjlFRmttbU1VaHZC?=
 =?utf-8?B?MnpiRnpISjJVOVltalQ0OUNFTVZ4cU9TZGhoeXlIb293ckFWZFZwOCtySGp3?=
 =?utf-8?B?TnJIdFhlWGgzZjhmcWZKQ2NjcXBHMDcyYXBaRUtURyt3MXEwR0did05Dd0lX?=
 =?utf-8?B?VmpTYW5va295bFV1ZnRrbkJuenN6YmtGZUk3U2JMZ3Z2VTgvc1JlVVdYN3Q1?=
 =?utf-8?B?Y0VLZVllZTg3SEdLQUgrRmM5N0J4WVhZcEtPMTZaTHphOWxVdTJUSEo5UkhO?=
 =?utf-8?B?dC9NcW1WUXJCNnk4bGg4bnR6VHhPMXVNRlcyVjhEeVNUY3BNNThYWkFJOVFk?=
 =?utf-8?B?bVZKL3JJdDZoQnhmL0pBSVcrbTBoVjlQaVZsbjg0c2p4L0x2dnRPMndPNnEv?=
 =?utf-8?B?QXVFbWNibWJYVEF5dzFOelZvK3hDQ25kNkF5YmJlY1I3dHVXL1VhamNuMG1a?=
 =?utf-8?B?ak9TaG5KaVZkalFoUXRCR1NNV09vdWdUQk5oVHQ5TTlrdmNIMnp1L2JQMlpo?=
 =?utf-8?B?SllENUhaWm9EUU9TQi9lZnd0S010SUkxYXBWVkVaZFhhNEdHTGIrZFJjcHcw?=
 =?utf-8?B?VEh5aXA2bmtnNUt5ZHVqVjJtQWc4MVlGdXQxRDJIeGR1MmgwWXgwd2NvZjNX?=
 =?utf-8?B?S2tOYkZFOXRXZWhMckJLRW1oQXVZMll2Qk5MNlc3Q2NwK0dZV1pGQ2pPSW5q?=
 =?utf-8?B?SkVrcUtBMGhSTGc3M1B5bkFRVUh4S3ZXak5OUG9tU1hNRGc4WTQ5c3dSTlZV?=
 =?utf-8?B?N0FBN1gyc1U5MzQrRTNjMklvMzBuSWRZL0t5cjBtWUlDb2d1OFdma3hUVXFJ?=
 =?utf-8?B?K3dETjd1YzdxRUIzcHVJdGZOcXowaFBKYUp3S0ZOVWVhWDNtMCtRN0JGc21E?=
 =?utf-8?B?TDNBT2VRQ3ZzNVB5VmExSUNXVVIzNnd6czRrN2VNYkNEdkxWWTJzRUtJK0lh?=
 =?utf-8?B?bE5TQS93eGgzY2d5ZHRyd0QvNXhhSFlubWQyVUJ4R1Y5STV0TVYyLzBFekYr?=
 =?utf-8?B?NGc1MFRaK20rdWR5Q3VkdmtYR05wb2poLzlhQVNwMEIwSXF4WTloS3k3Q1pX?=
 =?utf-8?B?b0ZkRW1NZjF5OG5iYmlRMWxEUGxRdDV5VlRnZWZzZllaNSsrRnlTcEpFcjZa?=
 =?utf-8?B?RHU0UG95dkR3a3c0bnVtcFNYZWpMem83OTU1SU1UalNWRCtqbFZEM3NRaEVS?=
 =?utf-8?B?OUt1aWNGMUlDeXVweVRGdVZuNW0yUzJIbWVNRmptSllqRHBrS3ZaRmx5OXBq?=
 =?utf-8?B?QVJmNWJwYjJOdnQ1ZVErclV0VVAxcFhpdXhrQU13cUFNSmxNMFFsSnNVUHdB?=
 =?utf-8?B?dzBKZ3Y4N0Yzb3FFdnc0d3VaMTd0N1NLQ203akRHZmVrNXkrN1VGdmRQQlRs?=
 =?utf-8?B?WkM3VlJpWC92c2NCM3pFQ0xieHNvRnRDMjIzUWExTmhaR3lqMjhHYWtjeEls?=
 =?utf-8?B?M0JQMVZmRTB4UnF6bDhTejRlNm1NNWEvSC9ZTDc5VHR6SGhuRnJsN1krKzZp?=
 =?utf-8?B?cmt3RnNTNWRQeEJNWGRLcEQvRFNLQ0gxL1llM3JkSVl2SUtOM3ZEUE0rQWwx?=
 =?utf-8?Q?K95YiQQmQRyxS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629e9b80-4bf1-4185-b064-08dad4601640
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 12:24:00.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgK0k09lcWqnYsG0IKjG9BMOjN5lWYdW+BKLBYFX+d6Mapm0LEzPBP2lpanVKlfJUvosX1gmZsZjd2saLgHbPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5014
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_05,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212020096
X-Proofpoint-GUID: CNR9SSQEVq2Mh3i93o1oFrsnwlzjQbNp
X-Proofpoint-ORIG-GUID: CNR9SSQEVq2Mh3i93o1oFrsnwlzjQbNp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, NICE_REPLY_A=-0.258,
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

--------------1DMWwefISCTsqw97Vtbjtx00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/30/22 11:16, Philippe Mathieu-Daudé wrote:
> Hi,
>
> On 11/8/22 14:24, Jonah Palmer wrote:
>> From: Laurent Vivier <lvivier@redhat.com>
>>
>> This new command lists all the instances of VirtIODevices with
>> their canonical QOM path and name.
>>
>> [Jonah: @virtio_list duplicates information that already exists in
>>   the QOM composition tree. However, extracting necessary information
>>   from this tree seems to be a bit convoluted.
>>
>>   Instead, we still create our own list of realized virtio devices
>>   but use @qmp_qom_get with the device's canonical QOM path to confirm
>>   that the device exists and is realized. If the device exists but
>>   is actually not realized, then we remove it from our list (for
>>   synchronicity to the QOM composition tree).
>>
>>   Also, the QMP command @x-query-virtio is redundant as @qom-list
>>   and @qom-get are sufficient to search '/machine/' for realized
>>   virtio devices. However, @x-query-virtio is much more convenient
>>   in listing realized virtio devices.]
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> ---
>>   hw/virtio/meson.build      |  2 ++
>>   hw/virtio/virtio-stub.c    | 14 ++++++++
>>   hw/virtio/virtio.c         | 44 ++++++++++++++++++++++++
>>   include/hw/virtio/virtio.h |  1 +
>>   qapi/meson.build           |  1 +
>>   qapi/qapi-schema.json      |  1 +
>>   qapi/virtio.json           | 68 ++++++++++++++++++++++++++++++++++++++
>>   tests/qtest/qmp-cmd-test.c |  1 +
>>   8 files changed, 132 insertions(+)
>>   create mode 100644 hw/virtio/virtio-stub.c
>>   create mode 100644 qapi/virtio.json
>
>> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>> index 5d607aeaa0..bdfa82e9c0 100644
>> --- a/hw/virtio/virtio.c
>> +++ b/hw/virtio/virtio.c
>> @@ -13,12 +13,18 @@
>>     #include "qemu/osdep.h"
>>   #include "qapi/error.h"
>> +#include "qapi/qmp/qdict.h"
>> +#include "qapi/qapi-commands-virtio.h"
>> +#include "qapi/qapi-commands-qom.h"
>> +#include "qapi/qapi-visit-virtio.h"
>> +#include "qapi/qmp/qjson.h"
>>   #include "cpu.h"
>>   #include "trace.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/log.h"
>>   #include "qemu/main-loop.h"
>>   #include "qemu/module.h"
>> +#include "qom/object_interfaces.h"
>>   #include "hw/virtio/virtio.h"
>>   #include "migration/qemu-file-types.h"
>>   #include "qemu/atomic.h"
>> @@ -29,6 +35,9 @@
>>   #include "sysemu/runstate.h"
>>   #include "standard-headers/linux/virtio_ids.h"
>>   +/* QAPI list of realized VirtIODevices */
>> +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
>> +
>>   /*
>>    * The alignment to use between consumer and producer parts of vring.
>>    * x86 pagesize again. This is the default, used by transports like 
>> PCI
>> @@ -3698,6 +3707,7 @@ static void virtio_device_realize(DeviceState 
>> *dev, Error **errp)
>>       vdev->listener.commit = virtio_memory_listener_commit;
>>       vdev->listener.name = "virtio";
>>       memory_listener_register(&vdev->listener, vdev->dma_as);
>> +    QTAILQ_INSERT_TAIL(&virtio_list, vdev, next);
>>   }
>>     static void virtio_device_unrealize(DeviceState *dev)
>> @@ -3712,6 +3722,7 @@ static void virtio_device_unrealize(DeviceState 
>> *dev)
>>           vdc->unrealize(dev);
>>       }
>>   +    QTAILQ_REMOVE(&virtio_list, vdev, next);
>>       g_free(vdev->bus_name);
>>       vdev->bus_name = NULL;
>>   }
>> @@ -3885,6 +3896,8 @@ static void 
>> virtio_device_class_init(ObjectClass *klass, void *data)
>>       vdc->stop_ioeventfd = virtio_device_stop_ioeventfd_impl;
>>         vdc->legacy_features |= VIRTIO_LEGACY_FEATURES;
>> +
>> +    QTAILQ_INIT(&virtio_list);
>>   }
>>     bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>> @@ -3895,6 +3908,37 @@ bool 
>> virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
>>       return virtio_bus_ioeventfd_enabled(vbus);
>>   }
>>   +VirtioInfoList *qmp_x_query_virtio(Error **errp)
>> +{
>> +    VirtioInfoList *list = NULL;
>> +    VirtioInfoList *node;
>> +    VirtIODevice *vdev;
>> +
>> +    QTAILQ_FOREACH(vdev, &virtio_list, next) {
>> +        DeviceState *dev = DEVICE(vdev);
>> +        Error *err = NULL;
>> +        QObject *obj = qmp_qom_get(dev->canonical_path, "realized", 
>> &err);
>> +
>> +        if (err == NULL) {
>> +            GString *is_realized = qobject_to_json_pretty(obj, true);
>> +            /* virtio device is NOT realized, remove it from list */
>
> Why not check dev->realized instead of calling qmp_qom_get() & 
> qobject_to_json_pretty()?

This check queries the QOM composition tree to check that the device actually exists and is
realized. In other words, we just want to confirm with the QOM composition tree for the device.

This was done to have some kind of synchronicity between @virtio_list and the QOM composition
tree, since the list duplicates information that already exists in the tree.

This check was recommended in v10 and added in v11 of this patch series.

>
>> +            if (!strncmp(is_realized->str, "false", 4)) {
>> +                QTAILQ_REMOVE(&virtio_list, vdev, next);
>> +            } else {
>> +                node = g_new0(VirtioInfoList, 1);
>> +                node->value = g_new(VirtioInfo, 1);
>> +                node->value->path = g_strdup(dev->canonical_path);
>> +                node->value->name = g_strdup(vdev->name);
>> +                QAPI_LIST_PREPEND(list, node->value);
>> +            }
>> +           g_string_free(is_realized, true);
>> +        }
>> +        qobject_unref(obj);
>> +    }
>> +
>> +    return list;
>> +}
--------------1DMWwefISCTsqw97Vtbjtx00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/30/22 11:16, Philippe
      Mathieu-Daudé wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org">Hi,
      <br>
      <br>
      On 11/8/22 14:24, Jonah Palmer wrote:
      <br>
      <blockquote type="cite">From: Laurent Vivier
        <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
        <br>
        <br>
        This new command lists all the instances of VirtIODevices with
        <br>
        their canonical QOM path and name.
        <br>
        <br>
        [Jonah: @virtio_list duplicates information that already exists
        in
        <br>
        &nbsp; the QOM composition tree. However, extracting necessary
        information
        <br>
        &nbsp; from this tree seems to be a bit convoluted.
        <br>
        <br>
        &nbsp; Instead, we still create our own list of realized virtio
        devices
        <br>
        &nbsp; but use @qmp_qom_get with the device's canonical QOM path to
        confirm
        <br>
        &nbsp; that the device exists and is realized. If the device exists
        but
        <br>
        &nbsp; is actually not realized, then we remove it from our list (for
        <br>
        &nbsp; synchronicity to the QOM composition tree).
        <br>
        <br>
        &nbsp; Also, the QMP command @x-query-virtio is redundant as
        @qom-list
        <br>
        &nbsp; and @qom-get are sufficient to search '/machine/' for realized
        <br>
        &nbsp; virtio devices. However, @x-query-virtio is much more
        convenient
        <br>
        &nbsp; in listing realized virtio devices.]
        <br>
        <br>
        Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
        <br>
        Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; hw/virtio/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++
        <br>
        &nbsp; hw/virtio/virtio-stub.c&nbsp;&nbsp;&nbsp; | 14 ++++++++
        <br>
        &nbsp; hw/virtio/virtio.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 44 ++++++++++++++++++++++++
        <br>
        &nbsp; include/hw/virtio/virtio.h |&nbsp; 1 +
        <br>
        &nbsp; qapi/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
        <br>
        &nbsp; qapi/qapi-schema.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +
        <br>
        &nbsp; qapi/virtio.json&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 68
        ++++++++++++++++++++++++++++++++++++++
        <br>
        &nbsp; tests/qtest/qmp-cmd-test.c |&nbsp; 1 +
        <br>
        &nbsp; 8 files changed, 132 insertions(+)
        <br>
        &nbsp; create mode 100644 hw/virtio/virtio-stub.c
        <br>
        &nbsp; create mode 100644 qapi/virtio.json
        <br>
      </blockquote>
      <br>
      <blockquote type="cite">diff --git a/hw/virtio/virtio.c
        b/hw/virtio/virtio.c
        <br>
        index 5d607aeaa0..bdfa82e9c0 100644
        <br>
        --- a/hw/virtio/virtio.c
        <br>
        +++ b/hw/virtio/virtio.c
        <br>
        @@ -13,12 +13,18 @@
        <br>
        &nbsp; &nbsp; #include &quot;qemu/osdep.h&quot;
        <br>
        &nbsp; #include &quot;qapi/error.h&quot;
        <br>
        +#include &quot;qapi/qmp/qdict.h&quot;
        <br>
        +#include &quot;qapi/qapi-commands-virtio.h&quot;
        <br>
        +#include &quot;qapi/qapi-commands-qom.h&quot;
        <br>
        +#include &quot;qapi/qapi-visit-virtio.h&quot;
        <br>
        +#include &quot;qapi/qmp/qjson.h&quot;
        <br>
        &nbsp; #include &quot;cpu.h&quot;
        <br>
        &nbsp; #include &quot;trace.h&quot;
        <br>
        &nbsp; #include &quot;qemu/error-report.h&quot;
        <br>
        &nbsp; #include &quot;qemu/log.h&quot;
        <br>
        &nbsp; #include &quot;qemu/main-loop.h&quot;
        <br>
        &nbsp; #include &quot;qemu/module.h&quot;
        <br>
        +#include &quot;qom/object_interfaces.h&quot;
        <br>
        &nbsp; #include &quot;hw/virtio/virtio.h&quot;
        <br>
        &nbsp; #include &quot;migration/qemu-file-types.h&quot;
        <br>
        &nbsp; #include &quot;qemu/atomic.h&quot;
        <br>
        @@ -29,6 +35,9 @@
        <br>
        &nbsp; #include &quot;sysemu/runstate.h&quot;
        <br>
        &nbsp; #include &quot;standard-headers/linux/virtio_ids.h&quot;
        <br>
        &nbsp; +/* QAPI list of realized VirtIODevices */
        <br>
        +static QTAILQ_HEAD(, VirtIODevice) virtio_list;
        <br>
        +
        <br>
        &nbsp; /*
        <br>
        &nbsp;&nbsp; * The alignment to use between consumer and producer parts of
        vring.
        <br>
        &nbsp;&nbsp; * x86 pagesize again. This is the default, used by transports
        like PCI
        <br>
        @@ -3698,6 +3707,7 @@ static void
        virtio_device_realize(DeviceState *dev, Error **errp)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;listener.commit = virtio_memory_listener_commit;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;listener.name = &quot;virtio&quot;;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memory_listener_register(&amp;vdev-&gt;listener,
        vdev-&gt;dma_as);
        <br>
        +&nbsp;&nbsp;&nbsp; QTAILQ_INSERT_TAIL(&amp;virtio_list, vdev, next);
        <br>
        &nbsp; }
        <br>
        &nbsp; &nbsp; static void virtio_device_unrealize(DeviceState *dev)
        <br>
        @@ -3712,6 +3722,7 @@ static void
        virtio_device_unrealize(DeviceState *dev)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;unrealize(dev);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; +&nbsp;&nbsp;&nbsp; QTAILQ_REMOVE(&amp;virtio_list, vdev, next);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free(vdev-&gt;bus_name);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdev-&gt;bus_name = NULL;
        <br>
        &nbsp; }
        <br>
        @@ -3885,6 +3896,8 @@ static void
        virtio_device_class_init(ObjectClass *klass, void *data)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;stop_ioeventfd =
        virtio_device_stop_ioeventfd_impl;
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdc-&gt;legacy_features |= VIRTIO_LEGACY_FEATURES;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; QTAILQ_INIT(&amp;virtio_list);
        <br>
        &nbsp; }
        <br>
        &nbsp; &nbsp; bool virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
        <br>
        @@ -3895,6 +3908,37 @@ bool
        virtio_device_ioeventfd_enabled(VirtIODevice *vdev)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return virtio_bus_ioeventfd_enabled(vbus);
        <br>
        &nbsp; }
        <br>
        &nbsp; +VirtioInfoList *qmp_x_query_virtio(Error **errp)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; VirtioInfoList *list = NULL;
        <br>
        +&nbsp;&nbsp;&nbsp; VirtioInfoList *node;
        <br>
        +&nbsp;&nbsp;&nbsp; VirtIODevice *vdev;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; QTAILQ_FOREACH(vdev, &amp;virtio_list, next) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DeviceState *dev = DEVICE(vdev);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Error *err = NULL;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QObject *obj = qmp_qom_get(dev-&gt;canonical_path,
        &quot;realized&quot;, &amp;err);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err == NULL) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GString *is_realized = qobject_to_json_pretty(obj,
        true);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* virtio device is NOT realized, remove it from
        list */
        <br>
      </blockquote>
      <br>
      Why not check dev-&gt;realized instead of calling qmp_qom_get()
      &amp; qobject_to_json_pretty()?
      <br>
    </blockquote>
    <pre>This check queries the QOM composition tree to check that the device actually exists and is
realized. In other words, we just want to confirm with the QOM composition tree for the device.

This was done to have some kind of synchronicity between @virtio_list and the QOM composition
tree, since the list duplicates information that already exists in the tree.

This check was recommended in v10 and added in v11 of this patch series.
</pre>
    <blockquote type="cite" cite="mid:6c7189cd-b6dc-e954-f39e-b90ccb6e0361@linaro.org">
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
        (!strncmp(is_realized-&gt;str, &quot;false&quot;, 4)) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QTAILQ_REMOVE(&amp;virtio_list, vdev, next);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; node = g_new0(VirtioInfoList, 1);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; node-&gt;value = g_new(VirtioInfo, 1);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; node-&gt;value-&gt;path =
        g_strdup(dev-&gt;canonical_path);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; node-&gt;value-&gt;name =
        g_strdup(vdev-&gt;name);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; QAPI_LIST_PREPEND(list, node-&gt;value);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_string_free(is_realized, true);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qobject_unref(obj);
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return list;
        <br>
        +}
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------1DMWwefISCTsqw97Vtbjtx00--

