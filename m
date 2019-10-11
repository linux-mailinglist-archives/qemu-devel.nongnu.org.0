Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93DD391C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 08:07:01 +0200 (CEST)
Received: from localhost ([::1]:46134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIo4p-0000mB-OE
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 02:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=71878e4925=jglauber@marvell.com>)
 id 1iIo3Z-0000K6-Pm
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 02:05:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=71878e4925=jglauber@marvell.com>)
 id 1iIo3Y-0002J6-GR
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 02:05:41 -0400
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:61172)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=71878e4925=jglauber@marvell.com>)
 id 1iIo3Y-0002IT-4g; Fri, 11 Oct 2019 02:05:40 -0400
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9B65BHw021885; Thu, 10 Oct 2019 23:05:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfpt0818;
 bh=qciT2AYYz0s/IEru+UKwALQhX5VITMb5pvS9TnzPOdo=;
 b=cwbMxT3l1cFZ7U2lh9dvnJBH7rB6c4Llakd2zhcrBpNWjvIlv/x1HfK2Vff0vw7XiFhI
 eBBdisgMQd0zk7goEYEXhvJ2CU9syxhqeUT8HP1TlkLT1qpoPbB+7U68yV+zY5t+8/j+
 Uc56BwVMxTMsMSN2NcPio4416c4P0OI0IwNAcYEgpxx/1jPDDFGBkT/V67i6DHfufOfR
 PBivlh/EHgMZ7Y86JxdQyqqkX42BqR5+jhdlZAdOMpwDCXodaBBS/CYK3E8cfjIl4hLD
 Sw5TWHYI7bHxqS02yyTVpMPdwSb7OzweYM/aQYF5BdvcCl3wCUFZChAznWULD5g02Z8x Ag== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0b-0016f401.pphosted.com with ESMTP id 2vhdxc0dcn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 23:05:29 -0700
Received: from SC-EXCH01.marvell.com (10.93.176.81) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1367.3; Thu, 10 Oct
 2019 23:05:27 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.53) by
 SC-EXCH01.marvell.com (10.93.176.81) with Microsoft SMTP Server
 (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 10 Oct 2019 23:05:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkCQK1wvqmF129E/+y/RGHyb+pTu+B2XWuKzj6uCs6bD45aYMwEbvxcguoVcRw0wBUTx8pOPkbFAWMPl8kYXvx5/6k75cK0MfRCNuH3mSRuV28yYLmRqRXHjUTewwxJIfNWddIX/azwO4JWR6LAeKZ9H6b2mG9nm8x3g3UFawCfTs4BSfjiK+rR2LsTXvB7k0VmGmX4sakHgRkeNNFSgGGQHtWEuhZ3nrCWhQ/dM8JDNObnm1SSexk6BiFAdI6bLCQH4E2G5j9IXQoyE/btUI1U5Zkrc1QDyOMrAVRkU9Viq6fT0xGHNOZp5/EzJBtsgj2Ye/+VLVyNWNn2s5ggdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qciT2AYYz0s/IEru+UKwALQhX5VITMb5pvS9TnzPOdo=;
 b=Ys8Sz8c9NVhk2Vz7xpGnZmipIngNPjDgGFK2sZCTJoN3aE5ooF9LQsH0/JsHr4rIBUZ6oAknshNUw/bGLhDxKfsv1P9Jm8UUMfUe72DRJSBtGDL4qnlmYLVo8VQLuEKp3RnTimBAf6Wp9+GjGDQc/FvnFdFMBt6/9ZW5fQxBs/vx1k/10Twq6sKWAlKuFm5w/E0mP0MyXBQFAKNRhyhQerN/qy0d9Tz9AmBLob1Dz4GPi2OVxA2sqRCyt16OyXyoq60m+n5cHiZm7VdOGLvZ4p7fjvGlDYK9uCq3JiHv12I3+TiLGD89kn9DezixoKt5Py6s5Ufhp3WZ8bIDmQZhrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector2-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qciT2AYYz0s/IEru+UKwALQhX5VITMb5pvS9TnzPOdo=;
 b=wyzoO5zd31QsCE0IUgFwlzHkKQtUy/RHQcg5nJq8WIk9OYdB+Z97VwBUbK38So2e6m3/GdZZ9Q4s9JzeFcZk0bEYFCWNtlwemx29jU38sCnA35IYlkldjrchl1yxLlW3/sikPGp7eVZAJ8N97FWBz2uBqML+S47Q4dbjyD0RG/Y=
Received: from DM6PR18MB3001.namprd18.prod.outlook.com (20.179.104.143) by
 DM6PR18MB2889.namprd18.prod.outlook.com (20.179.52.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 06:05:25 +0000
Received: from DM6PR18MB3001.namprd18.prod.outlook.com
 ([fe80::11c2:98e0:b9d9:5dba]) by DM6PR18MB3001.namprd18.prod.outlook.com
 ([fe80::11c2:98e0:b9d9:5dba%5]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 06:05:25 +0000
From: Jan Glauber <jglauber@marvell.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible issues
Thread-Topic: [Qemu-devel] qemu_futex_wait() lockups in ARM64: 2 possible
 issues
Thread-Index: AQHVf/nf7N0H/m6eGUG8sJlCZcRBEw==
Date: Fri, 11 Oct 2019 06:05:25 +0000
Message-ID: <20191011060518.GA6920@hc>
References: <cbe46ad6-ef6c-d155-e79a-672182c725ad@ubuntu.com>
 <d94f18f1-986f-ec19-02c0-e83e5e7af3d0@redhat.com>
 <1864070a-2f84-1d98-341e-f01ddf74ec4b@ubuntu.com>
 <20190924202517.GA21422@xps13.dannf> <20191002092253.GA3857@hc>
 <6dd73749-49b0-0fbc-b9bb-44c3736642b8@redhat.com>
 <20191007144432.GA29958@xps13.dannf>
 <065a52a9-5bb0-1259-6c73-41af60e0a05d@redhat.com> <20191009080220.GA2905@hc>
 <d5367b2a-84ee-1211-a2dc-7d631c94fe3f@redhat.com>
In-Reply-To: <d5367b2a-84ee-1211-a2dc-7d631c94fe3f@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0202CA0022.eurprd02.prod.outlook.com
 (2603:10a6:200:89::32) To DM6PR18MB3001.namprd18.prod.outlook.com
 (2603:10b6:5:182::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [46.5.207.169]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1969f899-6e47-4f01-1a9e-08d74e1101e2
x-ms-traffictypediagnostic: DM6PR18MB2889:
x-microsoft-antispam-prvs: <DM6PR18MB288942E210511F2769850DB9D8970@DM6PR18MB2889.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(7916004)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(33656002)(9686003)(71200400001)(66066001)(6116002)(2906002)(256004)(6512007)(6246003)(53546011)(6916009)(386003)(6506007)(52116002)(14444005)(3846002)(71190400001)(1076003)(5660300002)(4326008)(25786009)(76176011)(8936002)(6486002)(99286004)(11346002)(81156014)(305945005)(229853002)(8676002)(33716001)(186003)(81166006)(14454004)(7736002)(26005)(102836004)(6436002)(316002)(446003)(486006)(66476007)(4744005)(66556008)(66446008)(64756008)(66946007)(54906003)(86362001)(478600001)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR18MB2889;
 H:DM6PR18MB3001.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AJ1F6muPbqBXWV71fNM3v1UP3+Dk4l+GXXy0Ujk9JM0uyUHOmmLAd5GhHHC828K0d7Px93DYPoI43nwKhalljoAbiPOnGPEIATRiuZqmVlcYUDRuH3rYKPtbvZqSI6nH4+IfVXc2F3jjFptyoEnKk0WwXFcMeRgzIphssFXdX+0BPG+tBYuI1zUoN1k68g5kRdPiS1xCkf2vBC4SSGppebodRHHZYkLcQqwvj1gdPoAKVjnErxOrrT/YqNVFeca+hCoJ7cFUUztWwS8k+pKrJmSZpya5R4B1fS5D5wgUbE1xtCmePBcfrK8bttqdPnfaVuFx8K+8Gu76OERtILPR36guZTWZXhFvSlyI/CeMkuFMdtJizXbEQ22pDUgbYBTzQKPcQQ1hY14+r5KuivD1y/LbU8p8dDZcVxVXjuB20eg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <37F7632E33FDBD4A8FE4B6D47AED726A@namprd18.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1969f899-6e47-4f01-1a9e-08d74e1101e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 06:05:25.3327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1QO57VpLdZBa6//WUyO9GQreHQnZKZuGTNJwn2BUQIY65dW67Y5ZZzaH7KWYozbfSSlrSOY6fRKnbg5zQySZJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2889
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-11_03:2019-10-10,2019-10-11 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 67.231.156.173
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
Cc: Rafael David Tinoco <rafaeldtinoco@ubuntu.com>,
 lizhengui <lizhengui@huawei.com>, dann frazier <dann.frazier@canonical.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Bug 1805256 <1805256@bugs.launchpad.net>, QEMU
 Developers - ARM <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 09, 2019 at 11:15:04AM +0200, Paolo Bonzini wrote:
> On 09/10/19 10:02, Jan Glauber wrote:

> > I'm still not sure what the actual issue is here, but could it be some =
bad
> > interaction between the notify_me and the list_lock? The are both 4 byt=
e
> > and side-by-side:
> >=20
> > address notify_me: 0xaaaadb528aa0  sizeof notify_me: 4
> > address list_lock: 0xaaaadb528aa4  sizeof list_lock: 4
> >=20
> > AFAICS the generated code looks OK (all load/store exclusive done
> > with 32 bit size):
> >=20
> >      e6c:       885ffc01        ldaxr   w1, [x0]
> >      e70:       11000821        add     w1, w1, #0x2
> >      e74:       8802fc01        stlxr   w2, w1, [x0]
> >=20
> > ...but if I bump notify_me size to uint64_t the issue goes away.
>=20
> Ouch. :)  Is this with or without my patch(es)?
>=20
> Also, what if you just add a dummy uint32_t after notify_me?

With the dummy the testcase also runs fine for 500 iterations.

Dann, can you try if this works on the Hi1620 too?

--Jan

