Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36906917F9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 06:29:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQLxV-00078I-8g; Fri, 10 Feb 2023 00:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pQLxS-00077I-Qj
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 00:28:26 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pQLxR-0001xC-1N
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 00:28:26 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319N4AuH023179; Fri, 10 Feb 2023 05:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=ahGqp9LHZZHlgMaqYRE+oyvatsjmEoQz27wKFlGpTKY=;
 b=GlcDEcRtO06EVievQivJDWUQuXJHdFLv1HaqtkalJ5bzZahsa/pKBv2pNs/SCrPdcCgK
 TsmEkSlBEGUSQbVyAFBCNqlB33B0Y/OCOV05su8UjeRFMxErKic089Jjkokrz1odnau7
 uLIxjMalkHmaQcUzzw4cSAdRHMgiUoja3NJIEZvTpIstg5XgSPzpkd4AZWoPvQmf09Qf
 qL+n+or29VxkS36GcX9mOwtkUiG1ijMM3rMfbeojx8b1R0zhKvxxCgH2R6SXW2WyJQyJ
 vxmI3eI5OA01h/IP6a6+inF41NOZI0Ejnzdrec/dGUjb0aK7Vy65MnZGm5z2hiA1XWYw /A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhe53mg79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Feb 2023 05:28:23 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31A3KHvU002680; Fri, 10 Feb 2023 05:28:23 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtgcetw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Feb 2023 05:28:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZTxrEDRWw8W4n5EywOzH3P4AAiWnmHqB+1HUbyBAI+Q7GoEXFX+xUniuFAspxhfSUhl37SC7CVWX5hnT0ZBa1auCCicesOIM9Z13DIetBFFy4OGuW6QOScp9cBMWwTeQsJoE7ffVc2XiaV4RD/qULryeSe9FXyZQLO7GSi9JdTpNDhWvDjOa+o/Ms1L8UB7oprqTjqXteunlyPPmKWH2IdWvUpW+fPVbUgJWDdNz2+6JTRvk74r6jvoCZiXPQwbaTQekJl6HEsF8G9SGT5TDzwOxjeR/PiLUFXnkjp5uVOSz89g69arvqRZwAEndWJxeioQ9+twwv1oqHlhDUZZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahGqp9LHZZHlgMaqYRE+oyvatsjmEoQz27wKFlGpTKY=;
 b=J85z169tL9w1ZvCMrfqVS+z1oB3+xJe0MFgelZjBu+QzIG6d8+UsY3lws4CHXa/A+n9OoVnFIUk3Awes7C2y0cj1Iw2U7N3yOuWgZWaxl7ItwcD6X5gH8uWNOWgyFhosHy4eXH9X7AcCMbPa8k7QXbBHx11ET4Q9QnlEr3FgrPMc8XJVRnmvCp3MLfTalPnp2DwOrbI8P6RcaLVesbgdoJBbvacqTnCVCxXgSZXuMU73zZEPZFkix7hyoS1E199btwtniC/MKdBhgT2o6D8QQS7rPzZJJPL0//EdBN4V3qMacLz7qh9xCCwm6zPj12KqY0uHBIW7aN9X1nWGfywcIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahGqp9LHZZHlgMaqYRE+oyvatsjmEoQz27wKFlGpTKY=;
 b=zuVyPTFw1BnCm2nIqG/lVYWC62j9BqULVZKYW8DMLG/3nnbMwoNPpB/eqoUMAj+nB5nYSG41z9PdmyJAt8T4IQe+XR1pjlzTzI3ErloIN0f8i9tbJ5xMFexQYGmdb/fWlZJg5kSKHpJMqp9uaUX0J+Y+ESY060Pr8VewgJykVq4=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by SJ1PR10MB5978.namprd10.prod.outlook.com (2603:10b6:a03:45f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15; Fri, 10 Feb
 2023 05:28:21 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::173d:13e2:13f9:efe6]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::173d:13e2:13f9:efe6%5]) with mapi id 15.20.6086.016; Fri, 10 Feb 2023
 05:28:21 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: QEMU Devel Mailing List <qemu-devel@nongnu.org>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>
Subject: Re: [PATCH v2 15/23] vfio-user: forward msix BAR accesses to server
Thread-Topic: [PATCH v2 15/23] vfio-user: forward msix BAR accesses to server
Thread-Index: AQHZNsSjCcv8/v03+UC/tH4xYSxkC67CZv+AgAI7YICAAPlDAIACF80A
Date: Fri, 10 Feb 2023 05:28:21 +0000
Message-ID: <35E04821-4879-4B95-A16D-E6A0FDA307DE@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
 <0ad69e4ea3d1f37246ce5e32ba833d6c871e99b1.1675228037.git.john.g.johnson@oracle.com>
 <20230206133327.3b254677.alex.williamson@redhat.com>
 <A4B80A84-DD5D-4B33-AF63-B5F2E221A417@oracle.com>
 <20230208143038.010498c2.alex.williamson@redhat.com>
In-Reply-To: <20230208143038.010498c2.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR10MB3255:EE_|SJ1PR10MB5978:EE_
x-ms-office365-filtering-correlation-id: e74a3a91-6582-4c0c-38ba-08db0b279f7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fStyYBB9X73XkY4EkgljijmRDYQHJrBmj66Fjat3GMAUA8wAEY/fh+b9H4CGHt8c2cXzNtPiktT5c9m7Zrd7u0ISEtvIr7y/qMATGg5BVT0Afs5NsSzxfVkFl6i+JUs4VwIKGL/MpoUBB4FSFmfQDec5UpqcKDseIsIr9Bn/E1OvsFt/LI0XmLO4q7vi+we1O3nTlg2bYrkbjYLB6P/PYIMml84ssDJ1z5CDz5reiSmpvNoj3mwvtYLZRqMeLVDhB5T9Xhrq8bI9SmRFC2aypO/MCikJ615EIK9EscU/G3tdgEROuVq8aCclrv50lVsV4yUHVkHYLvnUsnlbEWqn+P+8xBv6noSFzbYQfuRjgFh0A8OaA/Ucx4893NNw5vMcIpFIkOv4CFep/urG57vKpDMvxiu87GH1Kcc+vBoKBiRCHVOkO7pCxtzAUvi4itysKS5Z3psREM/GUZbWxLRvjfZLehIdMBmlLQJrR4qhqkJreEVjCwSmco19PeRO2kYX5RugWUXVowIxDzULxXCm4pJXfYloZRwUoVFIxX2Wvb8pjmf8tVFQM8arD3WolImXtQfySFrWuS6AVIEAVJqUwTcw+f7se9XnqvaN3MEXLQUplW37sO1fk8LPf8jZ5vRHQMcW19cy2rN3mwOI55HvqdbHRR0swB8cvFufzG4MCOOFjQd+eFIg14iLRB3+RDShqS3jAUTSMYsQZMDSowCU7iM8HASKca4rGq364QTZqg4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199018)(478600001)(6486002)(53546011)(83380400001)(8676002)(4326008)(66556008)(66476007)(6916009)(76116006)(5660300002)(6506007)(8936002)(66946007)(64756008)(66446008)(71200400001)(2616005)(6512007)(186003)(26005)(36756003)(316002)(54906003)(41300700001)(86362001)(122000001)(38100700002)(38070700005)(2906002)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVllNkFQOXpRQllDbDVlSEZNcFZLdWxYRWcwL0Exbll6UTFHTWMwamhrMHlT?=
 =?utf-8?B?MzRac2VsRjE0eS8ybUFNZHgxV3J5YUsrSTl2R1dyYmp3akR0WlgrM0lmUExt?=
 =?utf-8?B?T0RPRjcvUFdXNlJsSWZvcTQrcU5NSVJLWktHTkVHTkJEQmx1T3lTVDZvcm1t?=
 =?utf-8?B?K0hHRjc1N291R1lFVE9wQ3JQaVdUQ3UvbW5QTitoQjYrNHZGc0ZIOVY5SStv?=
 =?utf-8?B?TXZEY2M2c2JBRzJnVDdJNWFMZS9NZGpLaVlxcVY5Z0J2YUorYkx2RC93ZS9C?=
 =?utf-8?B?WFBrSEhRVWhtcXNBbjc0MVIrSitQOXFHN2RSdW5XSWdRQ2RqcWhhbmt1QXB4?=
 =?utf-8?B?VWVuWHYvK2NpUzk2RXB4eDl6U09GcWtQQ0h0N3hBSklmTm9uazRYMC9oMGRH?=
 =?utf-8?B?VHZRc3RQNk9ScHFQR1NJKytXWUVIcCtyNGR1dy9jV29xYXZlQ2hjZ3NHVVQz?=
 =?utf-8?B?a0xWUFVkMzdHTVNKZXhkK0pndEhVWHpGd3p6bFAvek1zY2szZGZGODVCMWYz?=
 =?utf-8?B?RWdWU1EvQ1BraUdFTU9LSGptb1E0c1JTaFZnMHdZNHJ5QXllTEZ6M0YxNWdz?=
 =?utf-8?B?ME9rRGsyMjlZK2VOejJKSGczOE5SekZtemJteEtGazdka0hKays2clhaOU9H?=
 =?utf-8?B?YngwY0x4QTQ5R0hsbkFMS2lkZGdwcjU4YjNVUXpHMzhhNkN4ellLUzlMbVdB?=
 =?utf-8?B?NitQcllpQ1JtZnA3OGlSK3RiRnlxOForMEszZzhSZDhYY0NhQVRmSDk5RkZ1?=
 =?utf-8?B?YjZ5bEpMRjZPaXA0VjR6b0NnZ1g2eFNwYWtVRjdLZkxjdFl0REdwME9ZWWVj?=
 =?utf-8?B?L0g0dE1OdTdMSXZiOWZVMXJ1bWU5QXRtZVhPNlhocGoxOStjUEM0WmRLVjds?=
 =?utf-8?B?OENIUk01SGVaRElzN2xkd2VCdTM1Tm1FOWt1aElNY3J0R21mb3FoNG5sOXpz?=
 =?utf-8?B?TktUSkFFTjRhclZqNXh1ZlZLMXVJNkFFZzR0ZlN6VkFhb2lOV3l0Y0xnai9L?=
 =?utf-8?B?WWVLbWYxc1o1Nk9xQlppZEQxUHpnbFBaMmgzeUtxUVZMb01RMlBkM1NtUEhq?=
 =?utf-8?B?Qm9xL1Z5ZzljTjZVeFZLUHkybVFUcGRQZVYzdVVpV0VoOHZoQmFveElYQnhq?=
 =?utf-8?B?QVQzU05TTzc5SDRjVkp1dDBNdlBUMWR0dndzRkpkT2RWZmt2ZFNyUHFySTZ6?=
 =?utf-8?B?U1ovRzFnOVU2bWtrNTd3cFFQVHVJWkxpZmlETC9kMEhLUFlGbUI1STdlcnVm?=
 =?utf-8?B?WmQvbUF0VCtDdng1WkN3MkFFOEEvaWgyTndlSk9Cc0VQc1FFY0dGQnlYditN?=
 =?utf-8?B?b2lSMEl3QUtUdVQ5K0JpalBKVXUxcG1IT0J6WTh5RmptNTZSOFpOSVI3ZDAz?=
 =?utf-8?B?Y0tkeHhzcmRuQ2c0SXRsK1lBcWlva2x0bkFNMGVNRkplazl5V240Z3d3NzNJ?=
 =?utf-8?B?OWRydkg3aDFYQWRvTmlKcVpLaEJQQ2ZOdkpwQWR6OWFIcVI4MlRVQWp0eExv?=
 =?utf-8?B?Ulc2VDN2WnBnZjZlU3I2VDhnVU9HcjNpQWx6RkZTM0JGNk1PcGwrdE1IUlVw?=
 =?utf-8?B?TlRlOE1CaDFlVGYyWTJQSjBGSWNxOTNFR0phQ3JXOFE5Z3k5SDc3ZlpsbDl4?=
 =?utf-8?B?bXRXclNuOGdkNWtzUWhkcllId0FYWVFQR1VJUlVGUjFPYTlWS1YyQStMMllE?=
 =?utf-8?B?dFYxcVFyNVZzQUlERXkzaUNwblRiYll1aVU1NzV4dDFCVU80K2pWbm1LK2FQ?=
 =?utf-8?B?L3FEekdzM1R2T3lJd2ViUW9RdUdOY0dyT2dBTEI5RmVDZDRzeVNmRU9hZXpN?=
 =?utf-8?B?eG0zcmtOVkF4VlM3TGVKb2pIRktzSXIzTzRyMHJrekt6TUJ2a2dFcS9xbTZy?=
 =?utf-8?B?bUVYUmNPSXdJNm5jaHZWZHM1bnFmM3Q0MzFXMTFBaVNCc09xNDRxTkxmZjZX?=
 =?utf-8?B?ckJWRVZ1Zmdqd3ZBU0JkK1hWNUFLTElWSXRKTFdMVlNXNnhFZWFoRFcyVWU4?=
 =?utf-8?B?UCtlWk5rWjVJRG1KODQ4M1pWZWc2dHk0bEhSd0Z2aXBpMUUwZCtnOTJyVlVN?=
 =?utf-8?B?anM1VzJjNEpJMUlzTkI3ZGdwZFNqb2JLelNhNWRsOEpLSnRGYW5SYlRIeDB6?=
 =?utf-8?B?WmVEVURPK3FHUmw4RWhQZlNvS3p0N1A1ZFBmL1JTbmJQMmNmYk8ra1RnSlpo?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5741D151FB226D4AACCD3A7F811C5179@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ePKrgI4teYGHgH42l2LL0joeLnJVefX9gV7X0s4e1VAMcqrpwMlqsQYNApNECY/IN+5onMiyINgDOg5ydWkgEixuHgWJgdyIULj23TJR0NGOZ+hIWx2cciednSKdLmtEuqhjr4i1UgSmifS7N7IwJ/d4sTnIOnldX4Z7aBy3NhhUxT0RCUnezknQ4ZRDn/gx95MhnKTaTIc2yHQm4jWwy8CPT20CXU6tQjAs84GDALYp6QHDdI//aljCK/uQnQsBPTBtQEyJiW5hymMLj4cfu7eQcLksYAUCCHun3K95IClHvwEdI23vc7oV5DqMf5Xu6UNdRjOv0u9m2RABGMehIYCjqs/APUmTgLveG70Lr8Ez5QGrAWWKCyPycWctJZQuSXiMc5lDYxgQ+Xmk4VQfQW6DNrvI3QN7X4gPV+FSRbt+pcADnC5Z18q5XyQYOPbA3gVengDSgCKhQZLCcDgaNHxmJE2rUah8YsMZFfvrMeEBDN8EqB5CjoWAShx+vlYGaNTwfDYNTykOnECFbEj2U9kKRzdPnMBYQ9aKE3UPaO21gi/2P3fx8l2cxtRpAK9NvPTY+q7xqyI+In6AM9CChVRU11kVdmIHhKXVaJ0yI78kK2ujQpzoHJYLlavTeoqdpZFqVzvYKOljAQJOKnHAAzKEEyZIFQ+vCJhJy3O1GqrsrL07D1Kl1IDz0dUMlVnI7bKHrVBN+zhKyHmLGJgRSsxMjOooZGB8jnDkjWkeS2/L6F1SjGekx0fHN6sptCJzbOoetKD4cS/6+J+QHZP/N2ibhQMjpLqG08gElZYovgxk9TIISt3u008ruVC2jGoB
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74a3a91-6582-4c0c-38ba-08db0b279f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2023 05:28:21.0158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSsJt1iriSJtp4Q5La/OazZdHbuMpVNRf0UhCXENLA4TCL5mU7FT0HFJXGbUvQbmbYqRWy9TxOsguxYlyYr/PrzLksanAMa1+ZdSuxYfYig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5978
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_01,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302100046
X-Proofpoint-ORIG-GUID: rq9_6puiaUH4n4aXH5rs8M1qZZZVWrtz
X-Proofpoint-GUID: rq9_6puiaUH4n4aXH5rs8M1qZZZVWrtz
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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

DQoNCj4gT24gRmViIDgsIDIwMjMsIGF0IDE6MzAgUE0sIEFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCA4IEZlYiAyMDIzIDA2
OjM4OjMwICswMDAwDQo+IEpvaG4gSm9obnNvbiA8am9obi5nLmpvaG5zb25Ab3JhY2xlLmNvbT4g
d3JvdGU6DQo+IA0KPj4+IE9uIEZlYiA2LCAyMDIzLCBhdCAxMjozMyBQTSwgQWxleCBXaWxsaWFt
c29uIDxhbGV4LndpbGxpYW1zb25AcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gV2Vk
LCAgMSBGZWIgMjAyMyAyMTo1NTo1MSAtMDgwMA0KPj4+IEpvaG4gSm9obnNvbiA8am9obi5nLmpv
aG5zb25Ab3JhY2xlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4+IFNlcnZlciBob2xkcyBkZXZpY2Ug
Y3VycmVudCBkZXZpY2UgcGVuZGluZyBzdGF0ZQ0KPj4+PiBVc2UgaXJxIG1hc2tpbmcgY29tbWFu
ZHMgaW4gc29ja2V0IGNhc2UNCj4+Pj4gDQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gRyBKb2hu
c29uIDxqb2huLmcuam9obnNvbkBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGVu
YSBVZmltdHNldmEgPGVsZW5hLnVmaW10c2V2YUBvcmFjbGUuY29tPg0KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBKYWdhbm5hdGhhbiBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+DQo+Pj4+IC0tLQ0K
Pj4+PiBody92ZmlvL3BjaS5oICAgICAgICAgICAgICAgICB8ICAxICsNCj4+Pj4gaW5jbHVkZS9o
dy92ZmlvL3ZmaW8tY29tbW9uLmggfCAgMyArKw0KPj4+PiBody92ZmlvL2Njdy5jICAgICAgICAg
ICAgICAgICB8ICAxICsNCj4+Pj4gaHcvdmZpby9jb21tb24uYyAgICAgICAgICAgICAgfCAyNiAr
KysrKysrKysrKysrKysrKysNCj4+Pj4gaHcvdmZpby9wY2kuYyAgICAgICAgICAgICAgICAgfCAy
MyArKysrKysrKysrKysrKystDQo+Pj4+IGh3L3ZmaW8vcGxhdGZvcm0uYyAgICAgICAgICAgIHwg
IDEgKw0KPj4+PiBody92ZmlvL3VzZXItcGNpLmMgICAgICAgICAgICB8IDY0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+Pj4gNyBmaWxlcyBjaGFuZ2VkLCAx
MTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBh
L2h3L3ZmaW8vcGNpLmggYi9ody92ZmlvL3BjaS5oDQo+Pj4+IGluZGV4IDRmNzA2NjQuLmQzZTVk
NWYgMTAwNjQ0DQo+Pj4+IC0tLSBhL2h3L3ZmaW8vcGNpLmgNCj4+Pj4gKysrIGIvaHcvdmZpby9w
Y2kuaA0KPj4+PiBAQCAtMTEzLDYgKzExMyw3IEBAIHR5cGVkZWYgc3RydWN0IFZGSU9NU0lYSW5m
byB7DQo+Pj4+ICAgIHVpbnQzMl90IHRhYmxlX29mZnNldDsNCj4+Pj4gICAgdWludDMyX3QgcGJh
X29mZnNldDsNCj4+Pj4gICAgdW5zaWduZWQgbG9uZyAqcGVuZGluZzsNCj4+Pj4gKyAgICBNZW1v
cnlSZWdpb24gKnBiYV9yZWdpb247DQo+Pj4+IH0gVkZJT01TSVhJbmZvOw0KPj4+PiANCj4+Pj4g
LyoNCj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvdmZpby92ZmlvLWNvbW1vbi5oIGIvaW5j
bHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgNCj4+Pj4gaW5kZXggYmJjNGIxNS4uMmM1OGQ3ZCAx
MDA2NDQNCj4+Pj4gLS0tIGEvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgNCj4+Pj4gKysr
IGIvaW5jbHVkZS9ody92ZmlvL3ZmaW8tY29tbW9uLmgNCj4+Pj4gQEAgLTE0Myw2ICsxNDMsNyBA
QCB0eXBlZGVmIHN0cnVjdCBWRklPRGV2aWNlIHsNCj4+Pj4gICAgYm9vbCByYW1fYmxvY2tfZGlz
Y2FyZF9hbGxvd2VkOw0KPj4+PiAgICBib29sIGVuYWJsZV9taWdyYXRpb247DQo+Pj4+ICAgIGJv
b2wgdXNlX3JlZ2ZkczsNCj4+Pj4gKyAgICBib29sIGNhbl9tYXNrX2lycTsgIA0KPj4+IA0KPj4+
IEhvdyBjYW4gdGhpcyBiZSBhIGRldmljZSBsZXZlbCBwcm9wZXJ0eT8gIHZmaW8tcGNpIChrZXJu
ZWwpIHN1cHBvcnRzDQo+Pj4gbWFza2luZyBvZiBJTlR4LiAgSXQgc2VlbXMgbGlrZSB0aGVyZSBu
ZWVkcyB0byBiZSBhIHBlci1pbmRleCBpbmZvIG9yDQo+Pj4gcHJvYmUgaGVyZSB0byB0byBzdXBw
b3J0IHRoaXMuDQo+Pj4gDQo+PiANCj4+IAlJdCBpcyBvbmx5IHVzZWQgZm9yIE1TSVggbWFza2lu
Zy4gIE1TSSBtYXNraW5nIGlzIGRvbmUgd2l0aA0KPj4gY29uZmlnIHNwYWNlIHN0b3JlcywgYW5k
IHZmaW8ta2VybmVsIGFuZCB2ZmlvLXVzZXIgaGFuZGxlIHRoZW0gdGhlDQo+PiBzYW1lIGJ5IGZv
cndhcmRpbmcgdGhlIGNvbmZpZyBzcGFjZSB3cml0ZXMgdG8gdGhlIHNlcnZlciBzbyBpdCBjYW4N
Cj4+IG1hc2sgaW50ZXJydXB0cy4NCj4gDQo+IEkgc3VwcG9zZSB0aGlzIGRvZXMgc2xpcCB0aHJv
dWdoIG9uIHZmaW8ta2VybmVsLCB0aG91Z2ggc3VwcG9ydCB2aWENCj4gU0VUX0lSUVMgd291bGQg
cmVhbGx5IGJlIHRoZSB1QVBJIG1lY2hhbmlzbSB3ZSdkIGV4cGVjdCB0byB1c2UgZm9yDQo+IG1h
c2tpbmcsIGp1c3QgYXMgaXQgaXMgZm9yIGVuYWJsaW5nL2Rpc2FibGluZyBNU0kuICBNU0kgaXMg
bm90IHdlbGwNCj4gdXNlZCBlbm91Z2ggdG8gaGF2ZSBmbHVzaGVkIHRoYXQgb3V0IGFuZCBpdCBz
ZWVtcyBoYXJtbGVzcywgYnV0IGlzIG5vdA0KPiB0aGUgaW50ZW5kZWQgQVBJLg0KPiANCj4+IAlN
U0lYIGlzIHRyaWNraWVyIGJlY2F1c2UgdGhlIG1hc2sgYml0cyBhcmUgaW4gYSBtZW1vcnkgcmVn
aW9uLg0KPj4gdmZpby1rZXJuZWwgZG9lc27igJl0IHN1cHBvcnQgU0VUX0lSUVMgb24gTVNJWCB2
ZWN0b3JzLCBzbyBpZiB0aGUgaG9zdA0KPj4gZG9lc27igJl0IGFsbG93IGNsaWVudCBtYXBwaW5n
IG9mIHRoZSBNU0lYIHRhYmxlIHRvIGRvIHRoZSBtYXNraW5nLCB2ZmlvDQo+PiBzd2l0Y2hlcyBh
IG1hc2tlZCB2ZWN0b3LigJlzIGV2ZW50IEZEIGRlc3RpbmF0aW9uIGZyb20gS1ZNIHRvIFFFTVUs
IHRoZW4NCj4+IHVzZXMgdGhlIFFFTVUgUENJIGVtdWxhdGlvbiB0byBtYXNrIHRoZSB2ZWN0b3Iu
DQo+IA0KPiBMYWNrIG9mIHN1cHBvcnQgZm9yIE1TSVggQUNUSU9OX1tVTl1NQVNLIGlzIG5vdCBh
biBBUEkgbGltaXRhdGlvbiwgaXQncw0KPiBhbiBpbXBsZW1lbnRhdGlvbiBpc3N1ZSBpbiB0aGUg
a2VybmVsLiAgU2FtZSBmb3IgTVNJLiAgSSBiZWxpZXZlIHRoaXMNCj4gaXMgcmVzb2x2ZWQgbm93
LCB0aGF0IHRoZXJlIGFyZSBtYXNrL3VubWFzayBBUElzIGF2YWlsYWJsZSB3aXRoaW4gdGhlDQo+
IGtlcm5lbCwgYXMgd2VsbCBhcyBtZWNoYW5pc21zIHRvIGF2b2lkIHRoZSBOT1JFU0laRSBiZWhh
dmlvciBub3csIHNvDQo+IHRoZSBpbnRlbnRpb24gd291bGQgYmUgdG8gaW1wbGVtZW50IHRoYXQg
c3VwcG9ydCwgYWxvbmcgd2l0aCBhDQo+IG1lY2hhbmlzbSBmb3IgdGhlIHVzZXIgdG8ga25vdyB0
aGUgc3VwcG9ydCBpcyBwcmVzZW50LiAgV2UgYWxyZWFkeSBoYXZlDQo+IHRoYXQgZm9yIE5PUkVT
SVpFIHZpYSBJUlFfSU5GTywgc28gSSBzdXNwZWN0IHRoZSByaWdodCBhbnN3ZXIgbWlnaHQgYmUN
Cj4gdG8gYWRkIGEgbmV3IFZGSU9fSVJRX0lORk9fTVNJX01BU0sgdG8gYWR2ZXJ0aXNlIG1hc2tp
bmcgc3VwcG9ydC4NCj4gDQoNCglJIGxvb2tlZCBhdCB0aGUgbGludXggbmV4dCB2ZmlvIGtlcm5l
bCBkcml2ZXIsIGFuZCBpdCBkb2Vzbid0IHNlZW0NCnRvIHN1cHBvcnQgTVNJL1ggbWFza2luZy4N
Cg0KDQo+PiAJdmZpby11c2VyIGhhcyB0byB1c2UgbWVzc2FnZXMgdG8gbWFzayBNU0lYIHZlY3Rv
cnMsIHNpbmNlIHRoZXJlDQo+PiBpcyBubyBob3N0IGNvbmZpZyBzcGFjZSB0byBtYXAuICBJIG9y
aWdpbmFsbHkgZm9yd2FyZGVkIHRoZSBNU0lYIHRhYmxlDQo+PiB3cml0ZXMgdG8gdGhlIHNlcnZl
ciB0byBkbyB0aGUgbWFza2luZywgYnV0IHRoZSBmZWVkYmFjayBvbiB0aGUgdmZpby11c2VyDQo+
PiBzZXJ2ZXIgY2hhbmdlcyB3YXMgdG8gYWRkIFNFVF9JUlFTIHN1cHBvcnQuDQo+IA0KPiBXaGlj
aCBpcyB3aGF0IEknbSBkZXNjcmliaW5nIGFib3ZlLCBRRU1VIHNob3VsZCBrbm93IHZpYSB0aGUg
VkZJTyB1QVBJDQo+IHdoZXRoZXIgTVNJL1ggbWFza2luZyBpcyBzdXBwb3J0ZWQgYW5kIHVzZSB0
aGF0IHRvIGNvbmZpZ3VyZSB0aGUgY29kZQ0KPiB0byBtYWtlIHVzZSBvZiBpdCByYXRoZXIgdGhh
biBzb21lIGluZmVycmVkIHZhbHVlIGJhc2VkIG9uIHRoZQ0KPiBpbnRlcmZhY2UgdHlwZS4gIFRo
YW5rcywNCj4gDQoNCglUaGUga2VybmVsIGRvZXNu4oCZdCBhZHZlcnRpc2luZyBpdCB3b3JraW5n
IGVpdGhlciwgc28gSSB0aGluayBJIGNhbg0Ka2V5IGl0IG9mZiB0aGUgcHJlc2VuY2Ugb2YgVkZJ
T19JUlFfSU5GT19NQVNLQUJMRSBpbiBpcnFfaW5mbw0KDQoJCQkJCQkJSkoNCg0K

