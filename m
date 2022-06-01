Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACEB53AC6F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 20:03:43 +0200 (CEST)
Received: from localhost ([::1]:40238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSh4-0007q5-R4
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 14:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nwSfJ-0006Ob-Ng
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:01:54 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:29684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nwSfG-0004KJ-Fb
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 14:01:52 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 251GNZg7020279;
 Wed, 1 Jun 2022 18:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=A5fbWeEOjeH29UhjHC2ZhF3IhM9h8g354uTBDRWUSl4=;
 b=GyURAoF/GP03FYokaIrJA8UBBYL0upJIBEd6MpJ2xh8Inb8KtUIbx84D5osUTKrVs/mF
 aLK/xmWGqBg542cWu8d6iev/AmyRruic2e0yg6WMyMBaXzSCERC6xNss7dWtFZC8NBX9
 7F3ZlcwJ1NrYRIsDUVvJizXo4dVNfbXdUv9DBjYyfQ6MfLaG5QqMz3nCUNZYsisBpSDp
 YRXLAz7NqR7NWcIEiqUezGOheRvwp2OB8w7l7nElpodzEy9OmsiSGE/WQGFABnEYwIht
 Jj9jRcTiYACIOj940UjkIrgYbEh/ar5reFkSLd92nX7KAPWDX5EOzkh1V1o9H0MqnD7/ lQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gbcaurkg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Jun 2022 18:01:42 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 251Htxwh015039; Wed, 1 Jun 2022 18:01:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gc8huaw3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 01 Jun 2022 18:01:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmG//LKJhxQJAxRnFH5+BdGh8CLlrQHbT0RQiy04/1+qzv5P0x3rMM1AF+d7IrBLX7Cve5CRaOMU7GqRfb7eA+7lw9d4+y9R4043LHNloDyF5GDMqsk2PxsUrRSpa4dYGs8GaCG+0x1bPKqHopl0UUNyEU4DEYBybX2Ej2W+l0S+6e8cYwWN2W6VvNSG70hGWlHxJWG6CmYp3f/2e+hOcLcht994P6vr4xSmxjF9/ykrf8iGGyTnaKeDAwgxTFdj9gZBxGgl6TpbEbzrB14lLKR4w67xj9ebY5fzTupu3DKJW1AQTUNjge+RsfGLjY6qetNS4TroDv20p8htNtII/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5fbWeEOjeH29UhjHC2ZhF3IhM9h8g354uTBDRWUSl4=;
 b=DPfYY7DYicgWrNX/6lZzP+L+FxilYzyiumShOt2cWAOwgzB79U2IFdjGj3NM6cyGUT5lcd/bmNqhtOITvU5FtJ9yfa/bPJ9XrSH+fiCeRQ3a+doiZ0sJxs8AbF2gL622Ryl6Kmc3lmS+jf3yRUPaoZhir4S7RT+B9hNElXg7SSn9EyNv5C2lOp43WbsrFE3I2vLlB2IpSsPFftprp2ta7qRLl3mSSktnedG+PV6jflZpjMY1uel1TRipnloaI6hILM7BTiINCannXdhZ+ZYjRiT8zZCjt/7bvrQryGOxXXS9j/z3TVQIS/cm5vzH0eZlFi+UwxDvNyaqBQqWdBbiGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5fbWeEOjeH29UhjHC2ZhF3IhM9h8g354uTBDRWUSl4=;
 b=xntnVr1I9B9a1HI9XSLk3EE+qfAA+1/hoEGvGRD1K78ErUrskM6SsY2DMGjEti4Z1Anq3wX6YkmH8F3FSvbhqXkPSVZQwYGFTu6FATqNJBfRz3YVfZVbVhxOk2SHV6z3Nk+v7H0081ArU91Udk0GDg/+j5aLjqT7STHhprbDUjw=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DS7PR10MB5102.namprd10.prod.outlook.com (2603:10b6:5:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 18:01:39 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 18:01:39 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, John Johnson
 <john.g.johnson@oracle.com>, Stefan Hajnoczi <stefanha@gmail.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>, "pbonzini@redhat.com"
 <pbonzini@redhat.com>, "marcandre.lureau@redhat.com"
 <marcandre.lureau@redhat.com>, "thuth@redhat.com" <thuth@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>,
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, "quintela@redhat.com" <quintela@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, "imammedo@redhat.com"
 <imammedo@redhat.com>, "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, Kanth Ghatraju <kanth.ghatraju@oracle.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Topic: [PATCH v10 13/14] vfio-user: handle device interrupts
Thread-Index: AQHYb4NRI47IPGjvqEq+Oet+ENycma0vr36AgAlwOACAAFZKAIAADqgAgAAL2QCAAULHAIAAB0gAgAAJr4A=
Date: Wed, 1 Jun 2022 18:01:39 +0000
Message-ID: <ACEAC13E-C1E2-4E4B-86F8-2A56D56151AF@oracle.com>
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
 <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
 <20220531154538.6d002124.alex.williamson@redhat.com>
 <B3FC4541-1DB2-4C1F-8CB5-01D8771C8803@oracle.com>
 <20220601112658.07f97a9a.alex.williamson@redhat.com>
In-Reply-To: <20220601112658.07f97a9a.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.80.82.1.1)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75164a5a-6b17-4f1e-ad7d-08da43f8c6e7
x-ms-traffictypediagnostic: DS7PR10MB5102:EE_
x-microsoft-antispam-prvs: <DS7PR10MB5102297ED0CCCA6FD1E4E0DF90DF9@DS7PR10MB5102.namprd10.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4J7LUSd99AlINEOnp/RBi4cfZ+573poOhg/INFQNcz0luLoUp5CIYuqDjFiHRtwJjHhXAsHrTXtM7v8/sTP8wiTUGCb76V8FoHz323ds/sAGdoJNcExlXJQ6rLNG73biVbb4oHAWsvy0hnOUW2BiX00GDWH9pOeOwfZdnmGJpWEz2u28wMa1dKuJS5L8nmmqBF097wdNfgCA1Npx4lJvQdr0xAxA32fq4R7ECExXKbsHGSeaQrkwJzjq8baf7X1/g8530ihl5Gn3SUqZ9lyeaIlV/4ghw4fMSga2ygzB+X0x3NXGKPrnJtSdwJCf5je2UWW8Fs2FTdmlY2ZbfnUXwZdXfrx1O3BqtUsVgw/CD2H8ZoDCO8bSXC+WMloGRUhnGheIbM6fWMaK4UJQarR/d8n9MHjJqn/iRGjBHDEfJyVHt6BLTX4woF9PQ0spJQYmLbXuxb7k54a4PfWrd/LPACTm5xfa0Sq3uQXSHvRona2IisMKLFEyv6PDA8S5rJpq+bCKEx2DerHDwyVsqu9NtDSF9RnI6Mz/e/XcmUN+933pEZ+1jpPhGkd8uIh7aGq8kamExsFBrkKAMjZ7DTTPyTHFJJ3OlSiksDszfaGFk5c1KWnwg3pC6q+xMWxYV7gDOIOtW25f3uIkp15VpDAMeuZCpDhhX462oVaMVPs5zD9RtPvL1AB7VCzXMCUxSFh/bd9ba5chQ/jzNYyoWuvLtxtJYiKc9w1ngqfQgb1t9CQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(76116006)(66446008)(66476007)(64756008)(66556008)(107886003)(66946007)(4326008)(6506007)(8676002)(122000001)(53546011)(91956017)(6486002)(2906002)(508600001)(8936002)(38070700005)(33656002)(6512007)(7416002)(186003)(44832011)(36756003)(71200400001)(6916009)(83380400001)(86362001)(5660300002)(54906003)(2616005)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmhVNHd0UEFEUHpGdjREc0NqaDJ1RW5KQnFOQ3p5ZVFYZWZoZ1FqUzlORlBX?=
 =?utf-8?B?MlFxdDRZUWQ4NnpRT1Y5NVJVdStDeUF0QUFKUThoVVZRZis1WUJzb3Myd0JG?=
 =?utf-8?B?SjZ4MEhnN3lnOEZBMVBmZGxNNDhoT1dtYTNqT3l3azBnK0JldmJIbSs4Rkkx?=
 =?utf-8?B?UThoQm4vV24yR3RnWTZWM3BpVjlLbzl0d2w3dnMvK081NFNZNkJCQklUMW5P?=
 =?utf-8?B?UW82SUd1SVZrU3hEWTN6QVBSQjNaRUFMdFJKdi9SSVd6UG1XOW5Sb1BwSjNO?=
 =?utf-8?B?NXRjckgvYWdmQ2s4Rjl6Mi90WjM0bzNTNGZUWnZ3SWs0bFlPT3pHTTBEdVhN?=
 =?utf-8?B?S2N4WTBjTkxQTjJkTjVLLzhieHU1Z1ROOW5Jc01FSGtmZzAvdFVRalpleTNM?=
 =?utf-8?B?Rk01SjBWMUcrTEJ2eVhPNFJHTlZ0WW93QzVEM3BOMFBFUjhGWitKcGdiYVZY?=
 =?utf-8?B?Mm1ZQWRGa0twRDhMVTBXd0gxVk9rbEJwYUVYRytvRWNtaXZDWW9LSEZlcVVP?=
 =?utf-8?B?Q2Nsb3BuSXY4TjFRTGdhSkNFaFZGb1RrMmR1TXNHL2Z1S2h4NGdiaUphL3hh?=
 =?utf-8?B?WDlzQ2tMSENjODVNT2h6RzJIRVNuMkxwOWdZeEdmT3RVVEM5bjdLN3podnRv?=
 =?utf-8?B?MDgyOW1BZ0VuRXppWklKaFVkUHRMQ2FkZFdobnBQQUIrNjhwaHQ5SC9hMi9O?=
 =?utf-8?B?K0tkS1ltK2ZHa2xTVTRBMm5aeTZVajZ0RFQ4RGp0R1FOa2FnM0RYM3k0b2dh?=
 =?utf-8?B?S1M2a0cvQncyTVZYeTQ4ZjRuZWxpSldkMlN4MHJqZzBodGx5V2J1QXUzUlNC?=
 =?utf-8?B?eURYczdpS2JrTGJxaXU0QWYzVkZzU0FZWTVGZFVMd0hMRkJxblhTL3RLRFBM?=
 =?utf-8?B?aWZvaUVhR2ZsZ24wMWFPR3I5cTBYZlZOWWF5eCtUeDJYQ1orajU1S0tCNWtZ?=
 =?utf-8?B?TGRQNlgyOE44SGRWRTFnTFZYb2duV0pjWG9sSzJaSU9CVkEvR2tBSjR3THpx?=
 =?utf-8?B?Z09UY05LSFZLSjNjdDYvK2pwSjA4V3dGZWtIVy9Pd0d0TnBzQ3Y0VlJpb1Zy?=
 =?utf-8?B?dzU2cC9QSHNrd2VlbnNMUTZPL0k3Qm9YQ1QzMDg4ZE1hSUxab0Y3WkdlK2Vj?=
 =?utf-8?B?UHRmSnFmRlRWN3hYUHFnTVdNK0hSRWVKUE1iV0UrMGdiWkxETC9zUHpqLzFQ?=
 =?utf-8?B?eE5iSWRVcmNTbGJNN1hwNFhyaXNldUNTbmRkalA2S1ZnNXkvenlScXZvVEpl?=
 =?utf-8?B?aGRwNmo3eDBiODM2eTlLMWMwQy9vTzM4VDBWOVkvcjVVa1NhSVduSUlpb1JL?=
 =?utf-8?B?TDZIYndGT2NFODZzdHpvUHhkVVBtcXFhNHIzMVo3bGJzdWFoTlJIV1UzNkZa?=
 =?utf-8?B?Q2tWZGVqQkgyN3ZPelRmczh5cGZiaFNhRDZGLzQ4dWJyRXM0T3hvQTdvMEN3?=
 =?utf-8?B?NkRYczFCS3BxRlgwdURXK0RkVHgxZ3dpOTJwQjNNbjVZVHc5Rjk0V3hXSENC?=
 =?utf-8?B?NE4yN2FUazRqbTM5WlNEZkxwaWNpdzE5a0dHbzlSQjFBbUJKZWcwZVI3WnlM?=
 =?utf-8?B?UGRWb2tKa3ZrLzdERlZwa1lSeldHRVlEQlpZMVdzS3lDdWpvMmVpQUdwZ0tm?=
 =?utf-8?B?dmpsd2NOVmFpTVlNN3hoazZMNUU0M21qQ3pDNmlBSzNVMDdyN0hEZTVzNUNp?=
 =?utf-8?B?ODE3SkFBNE5YT2hVSlQzS2hLODl1aW9Dd2xpR0RIblZWVktDUHp4RFJscW9q?=
 =?utf-8?B?Y1JIZEtrc3NMUnBhb3pNMnV1SFRxc1lnbUtGVC9BcGUyMFhuekFVakZ5RjF0?=
 =?utf-8?B?eGxuUkVncWJZMzNScXRkQWVtMW1CdkpxMFBSTWJSUFBuZVRCZEMrWk9qODEv?=
 =?utf-8?B?cURnaVd4dER1K3p0TlR4cFdtQU9RN29zb0JzRnNySk5LdUk5K0tIUnEwNDBr?=
 =?utf-8?B?b2VWRFhsZk4vNisvTVBqc0pFSkxzMkh5Zncra0JHTDJydnI1QjdkY1hjcnVM?=
 =?utf-8?B?Y2ttM3lLc09IOFF6S1hiaGx4TVJ5ODd6akFSKzB5SWVzOTVud2UxRW5PWis0?=
 =?utf-8?B?QXZ2K3VaaDB4ZUc5Q2hoOWdNVlo0N0JrNWx0Q1NwZ2tYWEx3SVBJUHphekhY?=
 =?utf-8?B?NXcrM2l5NitTbWV1R1RMZ0tMNHVUNzkzQitRU2Nldjl2Tnd3TUlpZG5DVFlL?=
 =?utf-8?B?VEJIVFA4VVp2RlV6OEFVckxIRVlBRnIvN2dqRmF2RnVJZzlFNlhsQVVZSFFW?=
 =?utf-8?B?OVkrM0dGNlk2M3JFQmpQT0J0ZE4wYzhxTlQxamxwbE9SaVRKVkpaeitFdDVm?=
 =?utf-8?B?SXJ3UEZVVllNa0lRQU1ENWEzRzZTcU1WRlkwUmZwT000TkZoYlBaeTU2MmxR?=
 =?utf-8?Q?JMXIBZA5WJvgvgDLoyh83oP9v4Ci+JB/uVwuc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F632E023C0FB6478C159E4F2273DB9A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75164a5a-6b17-4f1e-ad7d-08da43f8c6e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 18:01:39.4212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZUaOIojx0VfVgyURYaXpxK4BNdmaktOzYEZv25n9wmb7uzIW0B1Ag8SAD4OCl58WW0gXAv3P08suTOf2B7PtLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5102
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-01_06:2022-06-01,
 2022-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010077
X-Proofpoint-ORIG-GUID: arNz_YPVzW2YnslypbjiYDJ4wTqinLZA
X-Proofpoint-GUID: arNz_YPVzW2YnslypbjiYDJ4wTqinLZA
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gT24gSnVuIDEsIDIwMjIsIGF0IDE6MjYgUE0sIEFsZXggV2lsbGlhbXNvbiA8YWxleC53
aWxsaWFtc29uQHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAxIEp1biAyMDIyIDE3
OjAwOjU0ICswMDAwDQo+IEphZyBSYW1hbiA8amFnLnJhbWFuQG9yYWNsZS5jb20+IHdyb3RlOg0K
Pj4gDQo+PiBIaSBBbGV4LA0KPj4gDQo+PiBKdXN0IHRvIGFkZCBzb21lIG1vcmUgZGV0YWlsLCB0
aGUgZW11bGF0ZWQgUENJIGRldmljZSBpbiBRRU1VIHByZXNlbnRseQ0KPj4gbWFpbnRhaW5zIGEg
TVNJeCB0YWJsZSAoUENJRGV2aWNlLT5tc2l4X3RhYmxlKSBhbmQgUGVuZGluZyBCaXQgQXJyYXku
IEluIHRoZQ0KPj4gcHJlc2VudCBWRklPIFBDSSBkZXZpY2UgaW1wbGVtZW50YXRpb24sIFFFTVUg
bGV2ZXJhZ2VzIHRoZSBzYW1lDQo+PiBNU0l4IHRhYmxlIGZvciBpbnRlcnJ1cHQgbWFza2luZy91
bm1hc2tpbmcuIFRoZSBiYWNrZW5kIFBDSSBkZXZpY2UgKHN1Y2ggYXMNCj4+IHRoZSBwYXNzdGhy
dSBkZXZpY2UpIGFsd2F5cyB0aGlua3MgdGhhdCB0aGUgaW50ZXJydXB0IGlzIHVubWFza2VkIGFu
ZCBsZXRzDQo+PiBRRU1VIG1hbmFnZSBtYXNraW5nLg0KPj4gDQo+PiBXaGVyZWFzIGluIHRoZSB2
ZmlvLXVzZXIgY2FzZSwgdGhlIGNsaWVudCBhZGRpdGlvbmFsbHkgcHVzaGVzIGEgY29weSBvZg0K
Pj4gZW11bGF0ZWQgUENJIGRldmljZeKAmXMgdGFibGUgZG93bnN0cmVhbSB0byB0aGUgcmVtb3Rl
IGRldmljZS4gV2UgZGlkIHRoaXMNCj4+IHRvIGFsbG93IGEgc21hbGwgc2V0IG9mIGRldmljZXMg
KHN1Y2ggYXMgZTEwMDBlKSB0byBjbGVhciB0aGUNCj4+IFBCQSAobXNpeF9jbHJfcGVuZGluZygp
KS4gU2Vjb25kbHksIHRoZSByZW1vdGUgZGV2aWNlIHVzZXMgaXRzIGNvcHkgb2YgdGhlDQo+PiBN
U0l4IHRhYmxlIHRvIGRldGVybWluZSBpZiBpbnRlcnJ1cHQgc2hvdWxkIGJlIHRyaWdnZXJlZCAt
IHRoaXMgd291bGQgcHJldmVudA0KPj4gYW4gaW50ZXJydXB0IGZyb20gYmVpbmcgc2VudCB0byB0
aGUgY2xpZW50IHVubmVjZXNzYXJpbHkgaWYgaXQncyBtYXNrZWQuDQo+PiANCj4+IFdlIGFyZSB3
b25kZXJpbmcgaWYgcHVzaGluZyB0aGUgTVNJeCB0YWJsZSB0byB0aGUgcmVtb3RlIGRldmljZSBh
bmQNCj4+IHJlYWRpbmcgUEJBIGZyb20gaXQgd291bGQgZGl2ZXJnZSBmcm9tIHRoZSBWRklPIHBy
b3RvY29sIHNwZWNpZmljYXRpb24/DQo+PiANCj4+IEZyb20geW91ciBjb21tZW50LCBJIHVuZGVy
c3RhbmQgaXTigJlzIHNpbWlsYXIgdG8gVkZJTyBwcm90b2NvbCBiZWNhdXNlIFZGSU8NCj4+IGNs
aWVudHMgY291bGQgbWFzayBhbiBpbnRlcnJ1cHQgdXNpbmcgVkZJT19ERVZJQ0VfU0VUX0lSUVMg
aW9jdGwgKw0KPj4gVkZJT19JUlFfU0VUX0FDVElPTl9NQVNLIC8gX1VOTUFTSyBmbGFncy4gSSBv
YnNlcnZlZCB0aGF0IFFFTVUgcHJlc2VudGx5DQo+PiBkb2VzIG5vdCB1c2UgdGhpcyBhcHByb2Fj
aCBhbmQgdGhlIGtlcm5lbCBkb2VzIG5vdCBzdXBwb3J0IGl0IGZvciBNU0kuDQo+IA0KPiBJIGJl
bGlldmUgdGhlIFNFVF9JUlFTIGlvY3RsIGRlZmluaXRpb24gaXMgcHJlLWVuYWJsZWQgdG8gc3Vw
cG9ydA0KPiBtYXNraW5nIGFuZCB1bm1hc2tpbmcsIHdlJ3ZlIGp1c3QgbGFja2VkIGtlcm5lbCBz
dXBwb3J0IHRvIG1hc2sgYXQgdGhlDQo+IGRldmljZSB3aGljaCBsZWFkcyB0byB0aGUgaHlicmlk
IGFwcHJvYWNoIHdlIGhhdmUgdG9kYXkuICBPdXIgaW50ZW50aW9uDQo+IHdvdWxkIGJlIHRvIHVz
ZSB0aGUgY3VycmVudCB1QVBJLCB0byBwcm92aWRlIHRoYXQgbWFza2luZyBzdXBwb3J0LCBhdA0K
PiB3aGljaCBwb2ludCB3ZSdkIGxlYXZlIHRoZSBQQkEgbWFwcGVkIHRvIHRoZSBkZXZpY2UuDQoN
ClRoYW5rIHlvdSBmb3IgY2xhcmlmeWluZyENCg0KPiANCj4gU28gd2hldGhlciB5b3VyIHByb3Bv
c2FsIGRpdmVyZ2VzIGZyb20gdGhlIFZGSU8gdUFQSSBkZXBlbmRzIG9uIHdoYXQNCj4geW91IG1l
YW4gYnkgInB1c2hpbmcgdGhlIE1TSXggdGFibGUgdG8gdGhlIHJlbW90ZSBkZXZpY2UiLiAgSWYg
dGhhdCdzDQo+IGRvbmUgYnkgaW1wbGVtZW50aW5nIHRoZSBleGlzdGluZyBTRVRfSVJRUyBtYXNr
aW5nIHN1cHBvcnQsIHRoZW4geW91J3JlDQo+IHNwb3Qgb24uICBPVE9ILCBpZiB5b3UncmUgYWN0
dWFsbHkgcHVzaGluZyBhIGNvcHkgb2YgdGhlIE1TSXggdGFibGUNCj4gZnJvbSB0aGUgY2xpZW50
LCB0aGF0J3MgY2VydGFpbmx5IG5vdCBob3cgSSBoYWQgZW52aXNpb25lZCB0aGUga2VybmVsDQoN
CkluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIC0gd2hlbiB0aGUgZ3Vlc3QgYWNjZXNzZXMg
dGhlIE1TSXggdGFibGUgYW5kDQpQQkEsIHRoZSBjbGllbnQgcGFzc2VzIHRoZXNlIGFjY2Vzc2Vz
IHRocm91Z2ggdG8gdGhlIHJlbW90ZSBkZXZpY2UuDQoNCklmIHdlIHN3aXRjaCB0byB1c2luZyBT
RVRfSVJRUyBhcHByb2FjaCwgd2UgY291bGQgdXNlIFNFVF9JUlFTDQptZXNzYWdlIGZvciBtYXNr
aW5nL3VubWFza2luZywgYnV0IHN0aWxsIHBhc3MgdGhyb3VnaCB0aGUgdGhlIFBCQQ0KYWNjZXNz
IHRvIHRoZSBiYWNrZW5kIFBDSSBkZXZpY2UuDQoNClNvIEkgdGhpbmsgdGhlIHF1ZXN0aW9uIGlz
LCBpZiB3ZSBzaG91bGQgc3dpdGNoIHZmaW8tdXNlciB0byBTRVRfSVJRUw0Kbm93IGZvciBtYXNr
aW5nIG9yIHVubWFza2luZywgb3Igd2hlbmV2ZXIgUUVNVSBkb2VzIGl0IGluIHRoZSBmdXR1cmU/
DQpUaGUgUEJBIGFjY2VzcyB3b3VsZCByZW1haW4gdGhlIHNhbWUgYXMgaXTigJlzIG5vdyAtIHZp
YSBkZXZpY2UgQkFSLg0KDQpUaGFuayB5b3UhDQotLQ0KSmFnDQoNCj4gaW50ZXJmYWNlLiAgVGhh
bmtzLA0KPiANCj4gQWxleA0KPiANCg0K

