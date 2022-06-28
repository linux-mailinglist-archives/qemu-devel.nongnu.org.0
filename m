Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A4D55C4B4
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:50:10 +0200 (CEST)
Received: from localhost ([::1]:49462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6AfR-0001oS-Ml
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:50:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=171ad38db=Niklas.Cassel@wdc.com>)
 id 1o6AZR-0006yt-U8; Tue, 28 Jun 2022 08:43:59 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:44222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=171ad38db=Niklas.Cassel@wdc.com>)
 id 1o6AZN-00026Z-OS; Tue, 28 Jun 2022 08:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656420233; x=1687956233;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jjXbGn5oXm5UIWoUKc0i3Sxk+bkBzsZjqHAKov/Zuug=;
 b=d1f4FSEkzTW6CS1qtvdBJiLDBnq8Wv19LO/uDhhFoo0t19vBXrylkXPm
 Ype2xqtf7CglWhbplRgYiE52Juqu/Z9eb/B3juoGLyve2elTq+PF4KpBD
 TyH9pOP1DIUO5UzZF6aIcFIzHxos7SPbkvckz0L8E73mIRVnQVKyT0BaI
 r0AC0cNRD/Xz2yZ4QXbGNPPZDjyX3PSlcvVfImzh4EBUuDLUYvQXqAbXV
 TjCXpVqmA1/23/70z+zLaTLgCPYEcIqJCrVeAhrnlnolDjrY62kddPKAT
 btC8MOyihbKPQeE1FxRis+tSiJ+aV0/fyqhqfNuZ6sjnSGYVz95KW8CF/ g==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650902400"; d="scan'208";a="308613466"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2022 20:43:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X1fWo5Xf1/l3VKIWOnHQAglcY3Z7GzvvrkyxFTtLxqkvP+Aa9uaZ7p6zOuVWHVbTmyk/Scw9atcCwrbQzLPaeewZJxAaXIiwjW3aVFOYU9XVLhyYgAWq5kKycqTD+w7z+rQvDK0ibMj7Xb+4EZ95Vh9OMziQeQiawt/eF4BkbCn2PM/01coe0bw1Z1xbs9Et/yh8mLV6PKz7ejsmZInWnqE1V/8M+TPZhhh7NGW9aZcHa8NhwmWjGYk5h4Nv+sbA8AeXFLuIxZ/fdyiheckaVbVU8C6obzCz8BRStHXHERnrK6LAiytDNro065Ci1hLFzpspudAn4mzdbR/ThDlUhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nyrAFEIMYLPQiGK4/tI0rx1AKrpWq5811dMC49UQuTs=;
 b=MnjJIBYG3wilFvVzPQ+DVu1rdkjjcwjIwxCIo+5iqufcObF4HMpCd7z6Y2VWA/aruoONnkdqZuyoRxUm0BPVqdQxsgUZ3470wp2v6p/v+dKfUXWX9Iy2F+rQBPPHInxu7wj1t856pGvnm5JRWTGT5uuba1/+JAiV1IT8NS2Wz5ScZTV3K8wL4N1Jn4xubNnpNq80YGaVgnlT/BZHAe2j4dkzM1XtMcaY4YDF+6m88bxx80r9mY0Le4s5X1LsBJlr7g9znRZzvcXAUlQhQrEYVPwivf/k/K0YRfnCkHL6199RvOGRgbNvnU20uB0TpHZCXzUab0wVCSenQgtPSrY4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyrAFEIMYLPQiGK4/tI0rx1AKrpWq5811dMC49UQuTs=;
 b=ma0XK/ybtKOTVeqYGrvWi4ux/9Ra9+kn7dkDQESfIkoJsQ91W35OvbCkJrEvuG4aaUMyWmIxSzjIV47D/u3ychRe4ExFh8+42Q6dxGmQE+OnJ8liqlLZ0cH+UI55lgGrRSfj/bozZvnb6w9d7EP54YfHbewTuwcw9r3urDHQs/0=
Received: from PH0PR04MB7158.namprd04.prod.outlook.com (2603:10b6:510:8::18)
 by DM8PR04MB7768.namprd04.prod.outlook.com (2603:10b6:8:37::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 12:43:39 +0000
Received: from PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::6177:a7ca:8caa:d19c]) by PH0PR04MB7158.namprd04.prod.outlook.com
 ([fe80::6177:a7ca:8caa:d19c%4]) with mapi id 15.20.5373.015; Tue, 28 Jun 2022
 12:43:39 +0000
To: "kbusch@kernel.org" <kbusch@kernel.org>, "its@irrelevant.dk"
 <its@irrelevant.dk>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "hch@infradead.org"
 <hch@infradead.org>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>
CC: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH] hw/nvme: force nvme-ns param 'shared' to false if no
 nvme-subsys node
Thread-Topic: [PATCH] hw/nvme: force nvme-ns param 'shared' to false if no
 nvme-subsys node
Thread-Index: AQHYium7aeYol+NPPkCa+/IKufsQIK1kw4wA
Date: Tue, 28 Jun 2022 12:43:39 +0000
Message-ID: <Yrr3emLTQvJuEh2v@x1-carbon>
References: <20220628122209.415725-1-niklas.cassel@wdc.com>
In-Reply-To: <20220628122209.415725-1-niklas.cassel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b31dace6-2efa-44ec-6a6d-08da5903d361
x-ms-traffictypediagnostic: DM8PR04MB7768:EE_
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cRFyoj1tZEDcP/XJCyhhPtipZ/xr00UvVEKYa1Mg0SfCUxM1nSAWl12bLlVaLnXrLZs2rnYDiCP4Pnub5tby3CJwE8e1i3SG0XyMDrzENpUk/IR6wQebtr7EdKvfAlHmoTIMesQe/Ez69ob8l5VKnZf4CQyAJaoV+Uc8vkeypjQlIczIP2yotaj8QMJPH2xVfZYJTEz4dzAF9te4QCGJ4h2nPvJZAGeTM0e5GAtUPeJ8XYcEY0TqOrkQwn4Mu+EWt9hwvkKojJDFL9y6iekS+MBruKbt8CeHBcdEu53ByDdrl2Lj2Kz6auMD0t7l+m0YAqAR+zbLjEHZcKDF9DbetXBn0MojBrWSJSJbrIEZrFnzBN+PGj+/WjNT9kJx8ZcLCQmoVfzSuth1d2e06yYk01xXXQSeRnWvTsSctRDTuseqzPikHU6V7P8iPdLRUq9Rv/ukvxssG+gi2YECcIlqHhJohGDlxzsFzZ3dZ5MsRbHtnw56BedoB8tpufiGWYWnd8GA8CiZiRydHh73S5Ki0SXxQ/8GA8paO8Ek7SQmEo9sxVvhYpf1y9furTDB7pU99ge/tfmFlWDgHSghievQdkGmjMWNQ2KibvzxQhTSCtFVv9GZHFZNuI2SpCqEXdwfPdYpomVDCsDkXEKMRpBUhZxKeHg87q2auvHgMdAcN7uKqREKZBX4HFrRxS/6/20t+6bdrQkgQ1Ehr5tAZb1VpuCw4dFghrnl5MZASGsLDTx/WPUdjJm4tey+P5EJbmktLO1idwx4ggs9JTuLg4dk2WWNJaUTkh4iO9R8qQsdv7yJuxRi1UpxS12sYpGwUjgNfoJrwZZAknkDMUmMlH8/rA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR04MB7158.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(7916004)(346002)(366004)(136003)(396003)(39860400002)(376002)(4326008)(110136005)(82960400001)(38100700002)(38070700005)(316002)(33716001)(966005)(45080400002)(66946007)(83380400001)(41300700001)(76116006)(6486002)(66446008)(2906002)(122000001)(26005)(64756008)(71200400001)(5660300002)(478600001)(86362001)(8936002)(6512007)(8676002)(66556008)(91956017)(66476007)(6506007)(186003)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BX8UZYtcS6vu3KNabfdsrwluGA3TkJlG//LogZ3D0zx64H1zeSmmafXt2q8d?=
 =?us-ascii?Q?7grApZLfQkQnjtPCfn0y38tgpbn8vbvLMkRnw8gBOZXGX1YhHEOpHZsRCTDY?=
 =?us-ascii?Q?GwKMj/qiQK2Qj2RtPBQ1BDoUm7NO+JkuCklqF6tkc5diOo5m2xG1GzAl3n5k?=
 =?us-ascii?Q?Bgdnsv4iCmTPK9Mp6jtaxgvAUYDBI9Tel4/trfzifeKDUKj/B4a8LWlqtL8d?=
 =?us-ascii?Q?UixGnZAjVqWcUtSBk1U/mKCQP8frqYbIL/lf1e2wJpkFnrQz8nG3+6ExeqKm?=
 =?us-ascii?Q?fA2nvZp6GrEeD6+l448GCyzcuzJYsqdCFq3++DN0mHQKSEqyC+OjabIVi+4U?=
 =?us-ascii?Q?c7QWUQG0Dl3cRTLFBPGY8yN6ihh4jjih8bl/PLcLz0TUrM2x1JhvuklOH4sW?=
 =?us-ascii?Q?zUK/fizSwcGKf3awczf8l7G+jovUT9OUVCIxYbyTqgXD3oONikECcsKYIPsC?=
 =?us-ascii?Q?PRiXS6emajOiJs/D+cdqOMfBlACJo5rGOi4peS74YWnDw2I+BB+RKkQPFwH8?=
 =?us-ascii?Q?YU1Y3//Y/F4L08vZDjowhKIu+HdRVWig2WYZyHkIOQCYsJ72f4uSytYqmZeV?=
 =?us-ascii?Q?+NNz8tIBY9z8/zDW26cibJtKpA4J56N6g4sDWMbjug5zd3PYgrlSp/I63RDr?=
 =?us-ascii?Q?DZBx6WDtil69Ni3UyGrblcneGGVoNPlGxCuI+brXA05MPkZM4/HamVMceTSO?=
 =?us-ascii?Q?GwqrYgGZ9Kg866KJhn2smv5aW+2MSreeGYRFtS0YQC+VlJ2WoOUHl8TMi4UR?=
 =?us-ascii?Q?Rb+voP4IgxXcIJuhBq4FbUDLyR0c4X07VdbLI0ijGd+IKw3zT1hieXJGZUo4?=
 =?us-ascii?Q?91DtTgeEwi+s8M6iEIp8SOS5U7hL0AbhfE1fJDOrESDfVBMMX97wV/7cKSgx?=
 =?us-ascii?Q?TDQUZjGhg+YgzpaoJfN7d5I23Oph88WYQHt8N/UCrBVr/VEY8vhIZ88KdeHA?=
 =?us-ascii?Q?8gCMsY9kGyrtSC35SqKj9EqSMjmEkyo362yaWshNUkq7r6CKu3vR8spQ6gc5?=
 =?us-ascii?Q?LJFqt4+dp3sY+YAEKnMQceOk/lQkFmVMIkUpIBT5zpM9ta6V8l5O3AHH97Pj?=
 =?us-ascii?Q?1lS6Jjyr8pokEyWTUNi5/rFlDNo5CqX6gJdD39dD0Hsodyg2Eey3VddmypPe?=
 =?us-ascii?Q?4PIXk8BtpNmNjLJ+QO8dTAON+oq/jEYW14kv284CpbsEyxDDPsld29FO+qI5?=
 =?us-ascii?Q?kv59cJdOeyzrlP1yYBWnWGA6iVNpSW85ZH7PVcS420r2hijB45Wmy85LzDGI?=
 =?us-ascii?Q?fDQIJdJI2kBjpiBmuhB3mU5LHCmmtWq1RgzCBbm/8ylLB/OyROHE+w/DYxoW?=
 =?us-ascii?Q?Qpuhfu8avEzSSvdGwOb+LRMO/sNU9Jw4vXEBWXKpvHLSUOLhOW4v1mn2jNWK?=
 =?us-ascii?Q?LJknMcFY+FmmBAD0SZW+wvrY+5RXYEaaNO3lwFeCFHgveqS7jxoReeXE+R6d?=
 =?us-ascii?Q?7fhcLeKvpUAiH3uATvQ5V07AHfnHaPtVxV3NW/ZA7yySvvxEBaWAJQuGCPGa?=
 =?us-ascii?Q?s91wdK2ms10dSRkEgSA5LnCe93hlzjBqdragMWHD85Nzea2aNURJwrgKUCDT?=
 =?us-ascii?Q?HX/C11eMffuj7VNZK7MUmA421edTvv/0BNqlHZN3f+S6+uezZvoZLc7NCkMK?=
 =?us-ascii?Q?1w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08C92EE2004FCD4B91FE35DE066A1F5D@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7158.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b31dace6-2efa-44ec-6a6d-08da5903d361
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 12:43:39.2184 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lp7TeneYGNYZ1ZHgKD3S/oUiVL+J8xp23ltnkRAre/fHuky9cvJPde0G8ukDRki8nr+20/WuNDW1Gb3KR/rJ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7768
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=171ad38db=Niklas.Cassel@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Niklas Cassel <Niklas.Cassel@wdc.com>
From:  Niklas Cassel via <qemu-devel@nongnu.org>

On Tue, Jun 28, 2022 at 02:22:09PM +0200, Niklas Cassel via wrote:

Hello Peter,

It seems that mailman configuration on qemu-devel is rewriting the
"From:" field to "From: Niklas Cassel via <qemu-devel@nongnu.org>"

If found this old thread about the same issue:
https://qemu-devel.nongnu.narkive.com/6hm8Fbvz/mailing-list-vs-dmarc-and-mi=
crosoft-com-s-p-reject-policy

Which says that this can happen when using p=3Dreject policy.

However, doing a bcc to another of my personal addresses,
it looks like the SKIM/SPF/DMARC is all passing,
and non of them seem to have p=3Dreject:

ARC-Authentication-Results: i=3D1; mx.google.com;
       dkim=3Dpass header.i=3D@wdc.com header.s=3Ddkim.wdc.com header.b=3DT=
TwPBUcS;
       spf=3Dpass (google.com: domain of prvs=3D171ad38db=3Dniklas.cassel@w=
dc.com designates 216.71.153.141 as permitted sender) smtp.mailfrom=3D"prvs=
=3D171ad38db=3Dniklas.cassel@wdc.com";
       dmarc=3Dpass (p=3DQUARANTINE sp=3DQUARANTINE dis=3DNONE) header.from=
=3Dwdc.com
Return-Path: <prvs=3D171ad38db=3Dniklas.cassel@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com. [216.71.153.141])
        by mx.google.com with ESMTPS id sd33-20020a1709076e2100b00711f20051=
f2si13306645ejc.697.2022.06.28.05.22.25
        for <nks.gnu@gmail.com>
        (version=3DTLS1_2 cipher=3DECDHE-ECDSA-AES128-GCM-SHA256 bits=3D128=
/128);
        Tue, 28 Jun 2022 05:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of prvs=3D171ad38db=3Dniklas.cassel@=
wdc.com designates 216.71.153.141 as permitted sender) client-ip=3D216.71.1=
53.141;
Authentication-Results: mx.google.com;
       dkim=3Dpass header.i=3D@wdc.com header.s=3Ddkim.wdc.com header.b=3DT=
TwPBUcS;
       spf=3Dpass (google.com: domain of prvs=3D171ad38db=3Dniklas.cassel@w=
dc.com designates 216.71.153.141 as permitted sender) smtp.mailfrom=3D"prvs=
=3D171ad38db=3Dniklas.cassel@wdc.com";
       dmarc=3Dpass (p=3DQUARANTINE sp=3DQUARANTINE dis=3DNONE)


Any idea why mailmain is rewriting the "From:" field for my messages?


Kind regards,
Niklas=

