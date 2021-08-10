Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6103E7F7E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:41:34 +0200 (CEST)
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVkr-0004us-7o
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mDVhu-00046c-1a
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:38:30 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:60626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samarths@cadence.com>)
 id 1mDVho-0002rg-PJ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:38:29 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17AHalWW017027; Tue, 10 Aug 2021 10:38:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Zvi/3PxM/Kg8cmJiBL1JO68ycoAjVQmeyPhIsoavGoU=;
 b=mUWTMhzTx3rThXsBmvVwnm6+YwuGC7IjEkrIpXIBurceuk4j6umnOUexYCPsCf1chhtO
 Qc+qNyKbmlGu1jTN+lwjDipaglrIEt8n1Ar6sshj3ag4JY0D1FWhAFBqw9ohic1hWj2B
 8RxTQaBj222BC/1BQecPr1ijJ/Ju77FNfYHvx9FPs1eX09ALxXbuogLPSA5plBdRjit+
 U5l+W4r3mV9ocXSaO4o9ES6RklJLc6cQj0rJsj98OOdN8SVwRy5zah9PC015O/2pfI3V
 FDImLW/TExN6qYnrXZiv/4rhBKyIBBR4ulWxisYwUREnQDV9uKjuB0LZtS+VObDVQ8J4 RQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0014ca01.pphosted.com with ESMTP id 3abwtvr1gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Aug 2021 10:38:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpL1aZ0sX7GHDGvvIc+6cC8pedRw02iPb3pm3r16Pf64JSCxhCW0IzecaNv8sPNJfHWKjPuilqj6ZmBQZV/uqPFFyUI862ICtI2/HOgtAE+3uUnfNcH+t+1RzPVe7i2hwyL67kD+L5FJa2oPonOz+l2b85PASBKBFFMKjoArye1bRNQs9ISJD6vaHtd+QFPSRguSfkkozanbF6E45fANcp5NDAOxlc3DHS4WNeianBiudfI1hrZPSVxUvQ/hCBB36pfjXz8gTR4NGbaGGSqhEYYI1Jl900ebbUk+BpA49yW6Sg5nrghCTouU2XjcTd/QNyr3yXu8tBN/Oi0lULDAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvi/3PxM/Kg8cmJiBL1JO68ycoAjVQmeyPhIsoavGoU=;
 b=OsqMm0JxtRCPHAd9WmcpH6XBgkJ2zBoY7XqwuRr0gONESFhNnakNZT/CkMEJtasrZM7j35tCmA+vZ6qN2oDVOMbq7mTPRPl0TKNsIsKeFtpee1jncAD5b3aX0m7Om4wK2aMVBKFho65k97JZS10aGqSPFacbA199rlMlU/4o46xah7noYMy7a7uFnfw9jYV/qY44k71smtuO+zdJ/eZHgmhx5ja1a29VGkpva+YLs7yCVt8Lu3s9Df7ycNZEvh/cfo58JcwsFYT/lsCN03fzkq72VqfIP41m7DeZkuX9AhLogZfztHaoZPMpYQOkn9EvN3IOuWaTQXU+Hp50HhRZDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvi/3PxM/Kg8cmJiBL1JO68ycoAjVQmeyPhIsoavGoU=;
 b=Qi5/rUUoIBMO6Le4akHnmhzi5/ky+bIpLFVsZd+dqoq+Jz97+AHCDREJ5gcCrZI5HA6CbrY2iolZNBmPTH7LGU9Aov6pbfHK40jWhEs0tvO7JISgAjnxJ9dNipMZsm1rYKbR9CzpfAIXe7hWCfdC5AFv4+zRtdepjPvoYLiZJ5Y=
Received: from DM6PR07MB8143.namprd07.prod.outlook.com (2603:10b6:5:20c::12)
 by DM6PR07MB5609.namprd07.prod.outlook.com (2603:10b6:5:76::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 10 Aug
 2021 17:38:16 +0000
Received: from DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f]) by DM6PR07MB8143.namprd07.prod.outlook.com
 ([fe80::4933:4d0c:f4a7:795f%9]) with mapi id 15.20.4415.014; Tue, 10 Aug 2021
 17:38:16 +0000
From: Samarth Saxena <samarths@cadence.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "ben.widawsky@intel.com"
 <ben.widawsky@intel.com>
Subject: RE: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails
 with assertion
Thread-Topic: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fails
 with assertion
Thread-Index: AdeNPFRJO7zN36qiQYqno1sR/jgqBQAnnr2AAAzZ/eA=
Date: Tue, 10 Aug 2021 17:38:16 +0000
Message-ID: <DM6PR07MB814371B8A41F4B387F02C08ADDF79@DM6PR07MB8143.namprd07.prod.outlook.com>
References: <DM6PR07MB8143073FA28EA05BAF7D8B24DDF69@DM6PR07MB8143.namprd07.prod.outlook.com>
 <YRJizxKbMxpwhSrL@work-vm>
In-Reply-To: <YRJizxKbMxpwhSrL@work-vm>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc2FtYXJ0aHNcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1iY2UwZjZiMC1mYTAxLTExZWItODViNy1lNGI5N2EwMWYyYjZcYW1lLXRlc3RcYmNlMGY2YjItZmEwMS0xMWViLTg1YjctZTRiOTdhMDFmMmI2Ym9keS50eHQiIHN6PSIyNTI3IiB0PSIxMzI3MzA5MDY5NDU5Njk0MjEiIGg9InlwS0lhQ3dTbVhzTnBjY2piS281QithS2ZlWT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=cadence.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d3826f3-815c-487f-f685-08d95c25a2d1
x-ms-traffictypediagnostic: DM6PR07MB5609:
x-microsoft-antispam-prvs: <DM6PR07MB5609895B4F5444F105F7630FDDF79@DM6PR07MB5609.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GCxVXXs9AqdLp9y/jhBksO3ZvrUefpRf5Z/RHSgnAJr2UgR18BacqXKGzqCIeDxZ6/8ZqFuP/nHWy22yAKzNhMD8uzu5UutvsTbCecLfv+tmRTkh5UVOiWBfHBKvYTrHwRC5Pn1RechnIQR5pM1sMbWvzjhl3PkY+DCHCdYeIBroasrr1FFQEei2oLiqK9AhJCLtHj92YF0r0zzct+Nb0LfSkVSCDmuLvr8G+Xgmq6AHowXtgufnnZzzXUfCHZck3eG7mVaDl8hhGQT/r2QbgP82E96S3MygtleHcdvAPjFJHM7ug3yC6TaenxD3gLdxQ8wDYyr0QgwS17034OEi4HGdeBHtW3Wn9RqbrO2FdzsHZfybxXVGSCUPwkOAntd50bJDA40ihSUJPLZLezT5xmjFsAC51xwB8jz0P8CXI98FzmBn93rTu2GwDmfaw3xKhLDT+jmYT6rL1zCQy4ho7uKgS8MgIgF7gjlV1Gr0oGslr/nJspms5Cq3rGZ9XlZWLndMIFLL/7B8QDZZrpuLDh/uq/Cp7bf6Z+Li7ibYpO7dJ1LaB+JicUg0Qg4OKKe0Gge/Vvuid6KxOUAMc0K7g4pJKocbRt3gZ+tnDKxOofq50dvfIBTFthl6sP2i1NGjGARJ2o3h3JleyrW5AcfFCVsXJTUaL9vbYLpTBL736Hn5E7BELUf1uC6APDe+n9dJSBOOduYqgR0RB65PRvRGqJPPv15bMUTXX30S8LfF6h38yGr4pgkGodY5hjgHlpN8KOJ4bJ2aUfJ4B7RkNNZjLIrhWcv9FgJaGnb5QQPkDIhCFcOh0ulT1XZv7xXi/3gIjZlA36ImWP06Yu4Okc/Vog/Ju7lP8v2e8QnocOfys98=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR07MB8143.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(36092001)(26005)(33656002)(186003)(8936002)(7696005)(6506007)(2906002)(53546011)(8676002)(5660300002)(38070700005)(38100700002)(66556008)(66476007)(66946007)(76116006)(64756008)(66446008)(52536014)(9686003)(71200400001)(122000001)(83380400001)(86362001)(4326008)(55016002)(110136005)(316002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cde2usrCM0n5m1rjc8doHAlJIiqfTWUpUVS3EYzqzLEeefqo6htH6VGBZ6mr?=
 =?us-ascii?Q?aKVbefFTyhy8AtjReyRMaIwmcEXM23IxWGHTfU0fAfNYzT3c3+TEqYegLIbI?=
 =?us-ascii?Q?Rp27QhK4OBOogTGDUGXd/JuDV7V8cjVk4xlXvjPQfartiRNz3x+gc3gukuRD?=
 =?us-ascii?Q?B+bd3a8Okw4rXKpRo6wYkrc/aFCfd/Yc926IBLWFOBJutOxuT0EAn/OoXcmO?=
 =?us-ascii?Q?6VyKYN8vjjAtdyL4WKb5t6rQFKcHwWn3ieWbtSWAVloajEtel1W4uPSSGupD?=
 =?us-ascii?Q?YoWsCSAiMts7EfC5rYcWsmHBgCo6/WESo11KA8kY+ukxWp4hl4Ey/pz39ZFE?=
 =?us-ascii?Q?inkMwywXWPPmoLS5Cg9mv78cl5hLA7tEQJ98vZt8cKrOIyOwWLGz8+tIrfbg?=
 =?us-ascii?Q?1dU8vuLqZpbsj5dNBUXaxuC4YbVTF4uEWhb3eYRQsF2OKKKM2/dvJZ+C+9hb?=
 =?us-ascii?Q?MRm0l9OVNFmyACrMxaenT9xu1coEIuR5PK2fe6NARyCNJPL5+NUzT/yoXKxr?=
 =?us-ascii?Q?RpbFE0xvwNIOCefFG5124LDPTbCMnHRA7xcvIM0dZL+5v2CAfSZtIvyI3cOk?=
 =?us-ascii?Q?sKhVnDiH7Me34x+tSRQ4ozT2xzOnz2XtvKEDG142dXG5zQ/gdrlXuMm6Rbb3?=
 =?us-ascii?Q?XTOpdQyKNOytIOdBdnGHcb5RLSow07X0iGyXgIUTjN5XEjSSgkabiOu/aQ3K?=
 =?us-ascii?Q?tz1OlsRvNRso+OGbCMese5WaX24xbetYp4EUIBPVvoG1t6tqvD9hf4ObPp9X?=
 =?us-ascii?Q?8KlF9ih0BKvUKA9H4t0b0vxb3LyjVk3994DMQOoRCJqWN3O9T/MnrsIbDzLq?=
 =?us-ascii?Q?FaO5mE0VnLs2WoTEUpeVB2grmTyBcG47uiDZ/HzAf5PlAKz2tHEztgHvyISF?=
 =?us-ascii?Q?tWtsKAOJ32Vc7IbYfDN5VlySfb3613Mae0OQ18IMzdrLg0Xz4VSVMSh8EVEa?=
 =?us-ascii?Q?mlF9UKvyZulp5So93s4Z5qJKxX/dfkw+XldgpMY6TZbR9NUxg3a7PgpoYq4l?=
 =?us-ascii?Q?3dGlnxy2poAFco6WoN0GQk3XCE0qzQ7yGDWpoClunLHSmKz4WnBqP9Ygo9Eb?=
 =?us-ascii?Q?zwRjmRtKL/g7uSKQUkw+azgy5bDNCe3iq2HGMV8D3eh8YEOcoXLoGT43l2uR?=
 =?us-ascii?Q?kPUI1MhiPFaxOeeqIwf5lmmqAoOw1sDmA1xe9lJZG16ibV6y1DGofys6jdpa?=
 =?us-ascii?Q?0gaD2uB3mNU5UXo0J5QX0ubBgpIfWSj5zgk7wEb5JzK3e6ROvl2ctPEpU3aK?=
 =?us-ascii?Q?/yoiJKINUSWxuyDIGfaPS5JuhMmu/bRRobaRVBWZbxxqnS5XbKvFGjBv/+y2?=
 =?us-ascii?Q?SLpATt5xXZ1o1Vc5UTrm7D+m?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB8143.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3826f3-815c-487f-f685-08d95c25a2d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 17:38:16.4004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Rwr2UCbn4fxHPQBbUa+NGhq9LhQVUcWplVK1gl+YG/5Zj7vkDlP/yz11bnl/ZOgNs2yjgZdGCS7cpiV6yrf0gQioKbdOFWZxXLSBODYBto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB5609
X-Proofpoint-ORIG-GUID: cy1qzQr7l5laklgmVSLgHY7kHkIseG_k
X-Proofpoint-GUID: cy1qzQr7l5laklgmVSLgHY7kHkIseG_k
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-10_08:2021-08-10,
 2021-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 bulkscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108100115
Received-SPF: pass client-ip=208.84.65.235; envelope-from=samarths@cadence.com;
 helo=mx0a-0014ca01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Dave,

The Qemu version is qemu-6.0.50.

I am trying to capture the stack and will place it ASAP.

Regards,
Samarth


-----Original Message-----
From: Dr. David Alan Gilbert <dgilbert@redhat.com>=20
Sent: Tuesday, August 10, 2021 4:58 PM
To: Samarth Saxena <samarths@cadence.com>; ben.widawsky@intel.com
Cc: qemu-devel@nongnu.org
Subject: Re: [CXL volatile MEM] - Qemu command to turn on HMAT and NUMA fai=
ls with assertion

EXTERNAL MAIL


* Samarth Saxena (samarths@cadence.com) wrote:
> Hi All,
>=20
> I am trying the following command to run Qemu with Kernel 5.14.

cc'ing in Ben who I think owns the CXL stuff.

> qemu-system-x86_64 -M q35,accel=3Dkvm,nvdimm=3Don,cxl=3Don,hmat=3Don -m=20
> 8448M,slots=3D2,maxmem=3D16G -smp 8,sockets=3D2,cores=3D2,threads=3D2 -hd=
a=20
> /lan/dscratch/singhabh/shradha/ubuntu-20.10-64_with_orig_driver_backup
> .qcow2 -enable-kvm -usbdevice tablet -L $VB_ROOT/etc/vm/common/=20
> -object memory-backend-ram,id=3Dcxl-ram,share=3Don,size=3D256M -device=20
> "pxb-cxl,id=3Dcxl.0,bus=3Dpcie.0,bus_nr=3D52,uid=3D0,len-window-base=3D1,=
window-
> base[0]=3D0x4c0000000,memdev[0]=3Dcxl-ram" -device=20
> cxl-rp,id=3Drp0,bus=3Dcxl.0,addr=3D0.0,chassis=3D0,slot=3D0 -device=20
> cxl-type3,bus=3Drp0,memdev=3Dcxl-ram,id=3Dcxl-vmem0,size=3D256M -numa=20
> node,nodeid=3D0,memdev=3Dcxl-ram -object=20
> memory-backend-ram,id=3Dother-ram,size=3D8G,prealloc=3Dn,share=3Doff -num=
a=20
> node,nodeid=3D1,memdev=3Dother-ram,initiator=3D0 -numa=20
> cpu,node-id=3D0,socket-id=3D0 -numa cpu,node-id=3D0,socket-id=3D1

You probably need to state which qemu tree and version you're using here.

> I get the following crash before the machine starts to boot.
>=20
> qemu-system-x86_64: ../softmmu/memory.c:2443: memory_region_add_subregion=
_common: Assertion `!subregion->container' failed.

It's probably best to check with Ben, but you'll want a backtrace and figur=
e out which subregion and region you're dealing with.

Dave

>=20
> Please help me find what's wrong here.
>=20
> Regards,
> [CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://www.cad
> ence.com/en_US/home.html>
> Samarth Saxena
> Sr Principal Software Engineer
> T: +911204308300
> [UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.html>
> [16066EmailSignatureFortune100Best2021White92x1271617625037.png]<https
> ://www.cadence.com/en_US/home/company/careers.html>
>=20
>=20
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


