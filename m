Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF048419EC4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 20:57:51 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUvp0-0000Bl-KB
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 14:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shitalkumar.gandhi@seagate.com>)
 id 1mUvn5-0007LT-CG; Mon, 27 Sep 2021 14:55:51 -0400
Received: from esa.hc4959-67.iphmx.com ([139.138.35.140]:39742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shitalkumar.gandhi@seagate.com>)
 id 1mUvn1-0005Jk-Lo; Mon, 27 Sep 2021 14:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=seagate.com; i=@seagate.com; q=dns/txt; s=stxiport;
 t=1632768947; x=1664304947;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=/jv0tm97c40qW5wopIWa0EJjgg7TX4DEakWXF3jsAJQ=;
 b=RVrg3LnAZV+Stfv1cJCc0b1vLaSI9RtDsIa9ssuFZvEsVY1a3p8t6U3L
 RV9s44Ecd0FT+nrDBy+WJSkfn8+eSMK4r/htY45FD6PEsMfNE+6m2WwKW
 NwL/W5KjC5AMpW9y4uHS1JT0psBXR5Prl/FzVa8zXNwfegWY78uxvWxWw E=;
Received: from mail-mw2nam08lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc4959-67.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 11:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwKyetRXtoMQmrQvLK9+jcBf0fHVxhmd8rlEHsmxOGse2zXwS6w2FT1i5XIHYR/OO+RuepHu75XTXzGSz0HFI9MDaNF8DCjk89F1OC15vjvHhdZ+L4j4g7pHb9eH8zfvZliSOxS1aMCnlCPI8JOsc4BaCGX6yC9QfWJQ0Gg96WXjw7isJSzN7mwcqxDyPjv8XLoHXfFmf4QGoThMzpDT0VwUrSYqp6YX9ttKV2jy/j2vD86OUVPZ580oKmzHp0EJB4EpZyNVDIppq76wPdEygB8EVbVW5JcgrQj25CYGJb5iDbFAZnOG4a2rEn75YEJTnr1qQD3NPy6/WRsqhMyXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=RPmhyPmqZR0mgSKEtya7br1+j9drYWhH+UuQxp9KkLU=;
 b=aWYzx6vl40yi/pshd59h9YBIxjoPi6ypUubFGpJHptrpmpagfZW5H1BuqlrL+2xIZYp+Vp0/aVCmEDCnzT5k0yKNg0Xa/FUxs+/8zgHMc5fG4eb9AeOjAEH1Paa6BV6DQX4hoHSA4Km7+rwkKD51f/YbH/vdac2zrv3bEDKEm5WuB/4UAjpIYfdjph3kZxSXtn6bqtE3qP3EQXvdQJp0/641dhL/VXVtH0n4r9qVCDPSX51MR5l68dwQGcohAhYS5RnWAqQPp7dyKVTdtxnWvhCwyGqdrEW6qgeBWJpX7tFKLRUj0gIAvsUBaIOqzJXfan1tfq7qB2qnPNjByDEKgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seagate.com; dmarc=pass action=none header.from=seagate.com;
 dkim=pass header.d=seagate.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seagate.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RPmhyPmqZR0mgSKEtya7br1+j9drYWhH+UuQxp9KkLU=;
 b=VLGgtP3VzTsGqWX3pGnsCZVV0uzWEhmz9iPB9Ep9a5WaZLHez/SsuQYX/OqwuyppYAqIG4o1iyjJG1j25inbk9Gj0YDiwqEwy1jy0JSafIzj8HHT8Zm7hqI4nCqoAHrw7Fe9bln1vUJ4QY6bGTL9//uF2ywqduGY6w9soQWKAp8=
Received: from SJ0PR20MB3643.namprd20.prod.outlook.com (2603:10b6:a03:2e1::14)
 by BY5PR20MB3233.namprd20.prod.outlook.com (2603:10b6:a03:1b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 18:55:39 +0000
Received: from SJ0PR20MB3643.namprd20.prod.outlook.com
 ([fe80::94f7:7038:a27c:5e55]) by SJ0PR20MB3643.namprd20.prod.outlook.com
 ([fe80::94f7:7038:a27c:5e55%9]) with mapi id 15.20.4544.022; Mon, 27 Sep 2021
 18:55:37 +0000
From: Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>
To: =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>
CC: Hao Wu <wuhaotsh@google.com>, Patrick Venture <venture@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Thread-Topic: Need to merge - QEMU patch for booting eMMC image for AST2600
 machine
Thread-Index: AQHXsi8RpibRV/Qva0WR6yL4MOIGOau19JMAgAH7YgCAAAggc4AARdwq
Date: Mon, 27 Sep 2021 18:55:37 +0000
Message-ID: <SJ0PR20MB3643126F9786CFBEA81D5D349DA79@SJ0PR20MB3643.namprd20.prod.outlook.com>
References: <SJ0PR20MB3643750F8FF71E838A750F9B9DA59@SJ0PR20MB3643.namprd20.prod.outlook.com>
 <38e08d56-00b2-8759-a729-4bb6a26e6cdd@amsat.org>
 <4b2c7f4f-f2b5-7990-bcdc-5f9fb19418b4@kaod.org>
 <SJ0PR20MB36433AFB78BA0BAF6DC537649DA79@SJ0PR20MB3643.namprd20.prod.outlook.com>
In-Reply-To: <SJ0PR20MB36433AFB78BA0BAF6DC537649DA79@SJ0PR20MB3643.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Enabled=True;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_SiteId=d466216a-c643-434a-9c2e-057448c17cbe;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_SetDate=2021-09-27T18:55:37.137Z;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Name=Seagate
 Internal; MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_ContentBits=0;
 MSIP_Label_56e366eb-86f1-4645-85a7-f29555b26fee_Method=Standard; 
suggested_attachment_session_id: f0c3263c-27ab-fc02-858d-5c8977e58e3c
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=seagate.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd5405fb-222f-4555-2882-08d981e86502
x-ms-traffictypediagnostic: BY5PR20MB3233:
x-microsoft-antispam-prvs: <BY5PR20MB3233EABC5A426618A27181C79DA79@BY5PR20MB3233.namprd20.prod.outlook.com>
stx-hosted-ironport-oubound: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FiJNcLUv6whHcwl6wWr7TsITyA7bI1m0HbFXhTLOzBYNLvhYUeiDaxeJ07ZHXK16afFA9daXFmYYpSYO4q4ExPU73FB/Uv0OiE4xohmK1eewq9NxXj//U8+Z57RlTr3GAV1m6zoeKuaMef5vJ/g7fHNe7qYSww5zuBXNEO29RnX93BcbA2xj/J03Yp42q7Nng0MSvnES08Knt+8FBUp6AAlpC32rJaou9qnIcUc2cF7mmaU6icE2NS5RcUR1It+WIUIew1Oe/2nWpm46kb4jHsOnFqyhb9VyzFFgr5JqW4eacVu1Y7Sin7agtO5D2m/LtJZyqikGISQ58uQ5bvBrb3A/RxhqTJq79dj8Nhom9T1BSUvdpY/auCp9mxZANRFqw8Skl1n7ZMzEw618qDOd7jSc+xFb765huqEl++XWFFDUF80DFwYsg1y+vua5w0z7hAc6VsuNwA3ntVH7YNvPIGp31ZFydbuBBM5WrS8N+LXv4oilt9VU2loE7MyUJaSOk7+rn3RiNIq/e9EMM0KMQyF9VAN3CdcDUoAHx5LglwdAZfa16Fq2ZZINmSUZoEVas/c2mWjvXfrJ4JrdNYQ/3BHmUpD7/lB07nCK4PWeLzoHEHD+cGPGqjJQ7kpDntOmCKUZyEO8Yaua/8dlKXIkcw3oY7VQP3QFYItxtH3+zSN4JAxXvUONxr1cC8QVIhEiLoKLEhj1R6eJvC0msa6uWBz8HNHKBHTqP7/utwwYnK8/qWWvmoJaRyJfgr+WqIDtH0viR2qBz3e3Of6/8Tj/RfUycMhzNLC0iVdjtN1CHAI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR20MB3643.namprd20.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(4326008)(2940100002)(55016002)(7696005)(38100700002)(76116006)(5660300002)(52536014)(966005)(122000001)(8936002)(91956017)(66574015)(71200400001)(44832011)(508600001)(110136005)(54906003)(19627405001)(66946007)(2906002)(86362001)(53546011)(166002)(8676002)(9686003)(66446008)(66476007)(66556008)(316002)(33656002)(186003)(64756008)(26005)(6506007)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NeJIlqwxL4xirgTv9W6aqGX0qW6I/idgJKg8obBnUq7eX4pQD9uhUbiAzI?=
 =?iso-8859-1?Q?IAQUIQFouGVQQm28aOdjzrv7hs4Nzn+e7lbDv+x7Z19ldWJzI8ZUI79r0P?=
 =?iso-8859-1?Q?LJriiCtl6ouNNG3Q4mkUtILkPlv0zAB46N0EDPOaq7n1xgFJq2jtuJi/vJ?=
 =?iso-8859-1?Q?Cjf5Kz0funke4UsJZksHtCftkX61D36vdP6SO6UX64VkXhHqKUqMfmx1kS?=
 =?iso-8859-1?Q?93maCjQluc4tzpbwMFpHp81va2I1/iBJ7AgfDTzN0DU2VD4nxNFrkNECkj?=
 =?iso-8859-1?Q?RIsvC6YMHSMIwGXW95Od2oDv+9CtA98Dxc0poz0U4Q2bTchONzpXv4kIyV?=
 =?iso-8859-1?Q?SiyaXgURPMJGqZFBEF9fy2BTIB7MxMNswb8Fo2+jEbivx7oCdEWhtXP1sr?=
 =?iso-8859-1?Q?y9iFq43bvIiSzUW53OEczFwGZaJdNYz2OqbpVqLeUgTL1mSrO+9BA1ge52?=
 =?iso-8859-1?Q?Da7Wkue9A0SSeNIvru0e9+OY0j5MDMm7nUHCimycVQeH8FXkBWQwl1UI9P?=
 =?iso-8859-1?Q?DrDLU0ZvuwGwnogspNy0WSM6iHKqD7QPVZCV5jXYNevXjVZ92bIHAxN78W?=
 =?iso-8859-1?Q?Ks3Y+GIZmK9XlEA2c17ui7/D2LM09Lui/4WQQWt8ABo+fazv6zd1LPFAlO?=
 =?iso-8859-1?Q?x+bMhnThV6BVerUnS0iBHU9cRZB8JVqGFwchahyrkdgXH1L91RM1k/x8O9?=
 =?iso-8859-1?Q?jwtSXg5sYgMXtU4lmlDK+bl4Lh/vOaLx7r5AAuqcHr+BWqgha6IucXDWH/?=
 =?iso-8859-1?Q?zqXb9jWVIh9e7utVq0KKD5rcQoqT1IfKPstg3dKlJZUFnN/LtYiX8Auy21?=
 =?iso-8859-1?Q?+wc4BCq4FcT0hWOYqLWcadkSBiaYXpzH5YNI7PaOPM2sFW7usbWcsfTSFg?=
 =?iso-8859-1?Q?MY4kdkt5CAV6+NxsT0ofoLfUb1zyT6jUOYw4tcNLm/4ElkEnTFaKLP288a?=
 =?iso-8859-1?Q?McRLRt49ehH5yDMXhhyWnfHFE44iVivUx/Nx8NPN3zwjYlCfxhkipDIg3w?=
 =?iso-8859-1?Q?a54uNt887tkHmQlGKDGEFIbmAD2Y4Aeppd+tCwV6ni7v+kHk6iH4dPZFO7?=
 =?iso-8859-1?Q?PZdu5ANqooLuRhu4IFpzVhEBfuqVFfcVJxmCnPshR+p+xSR5CpEtS9cM3v?=
 =?iso-8859-1?Q?Rq+fJxnyBqdCq5LXP9y+ok1TwpiOeZtIIntbNWpawc6kGuKPa8IvTfXHtS?=
 =?iso-8859-1?Q?0Ej3HSD2T19dqcpHb+cPPLhJHfqGqcQ4qM/DSi7uksD/EQ0SkpqVMQVqgQ?=
 =?iso-8859-1?Q?NdluvUtlFH5q2+CTtwifRAi87toD3wehsQDz1YnPohluP5wMk/ucAXHFzl?=
 =?iso-8859-1?Q?TTUwiJUIivMYyNNAbLxww0/FFregc7LBl2xCe2f3iDEuNN/2CMysUpguWE?=
 =?iso-8859-1?Q?yadKoW+HGn?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR20MB3643126F9786CFBEA81D5D349DA79SJ0PR20MB3643namp_"
MIME-Version: 1.0
X-OriginatorOrg: seagate.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR20MB3643.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5405fb-222f-4555-2882-08d981e86502
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2021 18:55:37.5656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d466216a-c643-434a-9c2e-057448c17cbe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SJ/fPlNbv/aWErIN+v+vaqhvP5nrP1EFrDnlU1Hcxi+6yjpbzVABILQDqaLy08/AN7TcA+oR2Bsh7Ww//aUHBCvuUe93iGIyhB74UNp7TYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR20MB3233
Received-SPF: pass client-ip=139.138.35.140;
 envelope-from=shitalkumar.gandhi@seagate.com; helo=esa.hc4959-67.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_SJ0PR20MB3643126F9786CFBEA81D5D349DA79SJ0PR20MB3643namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

Please let me know how to get this merged?

Thanks,
Shitalkumar
________________________________
From: Shitalkumar Gandhi <shitalkumar.gandhi@seagate.com>
Sent: Monday, September 27, 2021 7:45 AM
To: C=E9dric Le Goater <clg@kaod.org>; Philippe Mathieu-Daud=E9 <f4bug@amsa=
t.org>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; qemu-arm <qemu-arm@n=
ongnu.org>
Cc: Hao Wu <wuhaotsh@google.com>; Patrick Venture <venture@google.com>; And=
rew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600 =
machine

Yes, I have raised this.

  https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJ=
GRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7=
oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADE=
WJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2=
if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxM=
C6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94Z=
C8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc=
%2Fissues%2F3818

BR,
Shitalkumar
________________________________
From: C=E9dric Le Goater <clg@kaod.org>
Sent: Monday, September 27, 2021 7:15 AM
To: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>; Shitalkumar Gandhi <shitalk=
umar.gandhi@seagate.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; qe=
mu-arm <qemu-arm@nongnu.org>
Cc: Hao Wu <wuhaotsh@google.com>; Patrick Venture <venture@google.com>; And=
rew Jeffery <andrew@aj.id.au>; Joel Stanley <joel@jms.id.au>
Subject: Re: Need to merge - QEMU patch for booting eMMC image for AST2600 =
machine


This message has originated from an External Source. Please use proper judg=
ment and caution when opening attachments, clicking links, or responding to=
 this email.


Hello,

On 9/26/21 09:59, Philippe Mathieu-Daud=E9 wrote:
> Hi,
>
> On 9/25/21 19:07, Shitalkumar Gandhi via wrote:
>> Hi,
>>
>> I am attaching a patch that will fix eMMC image booting on QEMU for
>> AST2600 machine, without this patch it will be stuck after SPL saying,
>> "booting from RAM".
>>
>> Please review and merge, thanks.
>>
>> Let me know in case of any concern.
>
> Thanks for your patch.
>
> Please look at how to submit patches here:
> https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z4Gz5K8rDouTJuL=
6pWtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20DjjENjFLA8jfhI=
XRN_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGLq-3qKResEOEwqE=
kMU5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-CM-GFhJm3h6Vu6=
t1b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClvnOYuRsoEjgnwJH=
-rJn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2EItEsQBr52Wxc5D=
1D_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2FContribute%2FS=
ubmitAPatch%23Submitting_your_Patches
>
>> This patch has been added to boot eMMC image for AST2600 machine on
>> QEMU.
>>
>> Run quemu as follows:
>>
>> ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive
>> file=3Dmmc-evb-ast2600.img,format=3Draw,if=3Dsd,index=3D2
>
> What is index=3D2?
>
> Is this mmc-evb-ast2600.img image publicly available?
>
>> Tested: Booted AST2600 eMMC image on QEMU.
>> Suggested-by:  <venture@google.com>
>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> Reviewed-by: C=E9dric Le Goater <clg@kaod.org>
>> Message-Id: <20210416162426.3217033-1-venture@google.com>
>> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

I don't remember having reviewed or signed this patch.

>> ---
>>   hw/arm/aspeed.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index ba5f1dc5af..6a890adb83 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -148,7 +148,7 @@ struct AspeedMachineState {
>>           SCU_AST2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))
>>
>>   /* AST2600 evb hardware value */
>> -#define AST2600_EVB_HW_STRAP1 0x000000C0
>> +#define AST2600_EVB_HW_STRAP1 (0x000000C0 |
> AST26500_HW_STRAP_BOOT_SRC_EMMC)
>
> IIUC you are not implementing any eMMC code, simply faking the
> controller can support eMMC, but the card is used in SD mode?

I think this is related to this issue :

   https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1y=
JGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X=
7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjAD=
EWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t=
2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2Zx=
MC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94=
ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbm=
c%2Fissues%2F3818

> I'm surprised your guest is happy and boot that. If so, then
> what is the point of announcing eMMC is supported if not used?
It should work on the aspeed branches I maintain which include the
emmc support but this is not for upstream.


Some comments,

I don't think the AST2600 evb boots by default on emmc. I agree
it's nice to have for tests and there are other ways to modify
slightly the default behavior.

We could add a machine property to define the 'hw-strap1' register
but it's a bit difficult to remember the value.

A custom '-boot' value setting the 'hw-strap1' for the AST2600
machine seems a better alternative. We could merge such a change
even if emmc is not ready.

Thanks,

C.






Seagate Internal

--_000_SJ0PR20MB3643126F9786CFBEA81D5D349DA79SJ0PR20MB3643namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(23, 78, 134);">Hi All,</span><br>
<br>
<span style=3D"color: rgb(23, 78, 134);">Please let me know how to get this=
 merged?</span><br>
<br>
<span style=3D"color: rgb(23, 78, 134);">Thanks,</span><br>
<span style=3D"color: rgb(23, 78, 134);">Shitalkumar</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Shitalkumar Gandhi &l=
t;shitalkumar.gandhi@seagate.com&gt;<br>
<b>Sent:</b> Monday, September 27, 2021 7:45 AM<br>
<b>To:</b> C=E9dric Le Goater &lt;clg@kaod.org&gt;; Philippe Mathieu-Daud=
=E9 &lt;f4bug@amsat.org&gt;; qemu-devel@nongnu.org &lt;qemu-devel@nongnu.or=
g&gt;; qemu-arm &lt;qemu-arm@nongnu.org&gt;<br>
<b>Cc:</b> Hao Wu &lt;wuhaotsh@google.com&gt;; Patrick Venture &lt;venture@=
google.com&gt;; Andrew Jeffery &lt;andrew@aj.id.au&gt;; Joel Stanley &lt;jo=
el@jms.id.au&gt;<br>
<b>Subject:</b> Re: Need to merge - QEMU patch for booting eMMC image for A=
ST2600 machine</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Yes, I have raised this.<br>
<br>
<span style=3D"font-size:14.6667px; background-color:rgb(255,255,255); disp=
lay:inline!important">&nbsp;<span>&nbsp;</span></span><a href=3D"https://se=
cure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAt=
sVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5d=
wIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ5u87lD25OU=
NSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFc=
YebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0=
gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPd=
FanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fissues%2F=
3818" target=3D"_blank" rel=3D"noopener noreferrer" style=3D"margin:0px; fo=
nt-size:14.6667px; background-color:rgb(255,255,255)">https://secure-web.ci=
sco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls63=
7SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmT=
I8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6L=
GiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS=
10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJ=
b2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cg=
ic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2Fissues%2F3818</a><br=
>
<br>
BR,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Shitalkumar</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> C=E9dric Le Goater =
&lt;clg@kaod.org&gt;<br>
<b>Sent:</b> Monday, September 27, 2021 7:15 AM<br>
<b>To:</b> Philippe Mathieu-Daud=E9 &lt;f4bug@amsat.org&gt;; Shitalkumar Ga=
ndhi &lt;shitalkumar.gandhi@seagate.com&gt;; qemu-devel@nongnu.org &lt;qemu=
-devel@nongnu.org&gt;; qemu-arm &lt;qemu-arm@nongnu.org&gt;<br>
<b>Cc:</b> Hao Wu &lt;wuhaotsh@google.com&gt;; Patrick Venture &lt;venture@=
google.com&gt;; Andrew Jeffery &lt;andrew@aj.id.au&gt;; Joel Stanley &lt;jo=
el@jms.id.au&gt;<br>
<b>Subject:</b> Re: Need to merge - QEMU patch for booting eMMC image for A=
ST2600 machine</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText"><br>
This message has originated from an External Source. Please use proper judg=
ment and caution when opening attachments, clicking links, or responding to=
 this email.<br>
<br>
<br>
Hello,<br>
<br>
On 9/26/21 09:59, Philippe Mathieu-Daud=E9 wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; On 9/25/21 19:07, Shitalkumar Gandhi via wrote:<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I am attaching a patch that will fix eMMC image booting on QEMU fo=
r<br>
&gt;&gt; AST2600 machine, without this patch it will be stuck after SPL say=
ing,<br>
&gt;&gt; &quot;booting from RAM&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Please review and merge, thanks.<br>
&gt;&gt;<br>
&gt;&gt; Let me know in case of any concern.<br>
&gt;<br>
&gt; Thanks for your patch.<br>
&gt;<br>
&gt; Please look at how to submit patches here:<br>
&gt; <a href=3D"https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z=
4Gz5K8rDouTJuL6pWtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20=
DjjENjFLA8jfhIXRN_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGL=
q-3qKResEOEwqEkMU5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-=
CM-GFhJm3h6Vu6t1b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClv=
nOYuRsoEjgnwJH-rJn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2E=
ItEsQBr52Wxc5D1D_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2F=
Contribute%2FSubmitAPatch%23Submitting_your_Patches">
https://secure-web.cisco.com/1oJkyJ6o1FSjeLofNCk-SJBvHe8F5z4Gz5K8rDouTJuL6p=
WtzenJ1yE0imiWoNBJUx5BooSaYSkvQfHj1aTBxq2d7eD-xZyztLaT2DS20DjjENjFLA8jfhIXR=
N_hJPLa8vikrdvz9p60Jy7kojB3AJRD9ZzEL6NwZS2AZfc2ElH7-meAzFGLq-3qKResEOEwqEkM=
U5ocivYTBkJpgcJLPiR34MZr3ZUdMsFnYCLYImWZ9TxlbUyo742xmCDQdg-CM-GFhJm3h6Vu6t1=
b8LHALySrJqK4dUdKPfzYgkDmhH11RMEXwPNMW19QNF62MbxEDFcekCoClvnOYuRsoEjgnwJH-r=
Jn9B-D54vVPbAhqsCkjjd8wBCwBCjbWuq2kovWRZC9hl7URdTe2-F3JVb2EItEsQBr52Wxc5D1D=
_tnuboaCIzn1osTeVB2_nJbwIIKc/https%3A%2F%2Fwiki.qemu.org%2FContribute%2FSub=
mitAPatch%23Submitting_your_Patches</a><br>
&gt;<br>
&gt;&gt; This patch has been added to boot eMMC image for AST2600 machine o=
n<br>
&gt;&gt; QEMU.<br>
&gt;&gt;<br>
&gt;&gt; Run quemu as follows:<br>
&gt;&gt;<br>
&gt;&gt; ./qemu-system-arm -m 1G -M ast2600-evb -nographic -drive<br>
&gt;&gt; file=3Dmmc-evb-ast2600.img,format=3Draw,if=3Dsd,index=3D2<br>
&gt;<br>
&gt; What is index=3D2?<br>
&gt;<br>
&gt; Is this mmc-evb-ast2600.img image publicly available?<br>
&gt;<br>
&gt;&gt; Tested: Booted AST2600 eMMC image on QEMU.<br>
&gt;&gt; Suggested-by:&nbsp; &lt;venture@google.com&gt;<br>
&gt;&gt; Reviewed-by: Hao Wu &lt;wuhaotsh@google.com&gt;<br>
&gt;&gt; Reviewed-by: C=E9dric Le Goater &lt;clg@kaod.org&gt;<br>
&gt;&gt; Message-Id: &lt;20210416162426.3217033-1-venture@google.com&gt;<br=
>
&gt;&gt; Signed-off-by: C=E9dric Le Goater &lt;clg@kaod.org&gt;<br>
<br>
I don't remember having reviewed or signed this patch.<br>
<br>
&gt;&gt; ---<br>
&gt;&gt;&nbsp;&nbsp; hw/arm/aspeed.c | 2 +-<br>
&gt;&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt;&gt; index ba5f1dc5af..6a890adb83 100644<br>
&gt;&gt; --- a/hw/arm/aspeed.c<br>
&gt;&gt; +++ b/hw/arm/aspeed.c<br>
&gt;&gt; @@ -148,7 +148,7 @@ struct AspeedMachineState {<br>
&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SCU_AS=
T2400_HW_STRAP_BOOT_MODE(AST2400_SPI_BOOT))<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp; /* AST2600 evb hardware value */<br>
&gt;&gt; -#define AST2600_EVB_HW_STRAP1 0x000000C0<br>
&gt;&gt; +#define AST2600_EVB_HW_STRAP1 (0x000000C0 |<br>
&gt; AST26500_HW_STRAP_BOOT_SRC_EMMC)<br>
&gt;<br>
&gt; IIUC you are not implementing any eMMC code, simply faking the<br>
&gt; controller can support eMMC, but the card is used in SD mode?<br>
<br>
I think this is related to this issue :<br>
<br>
&nbsp;&nbsp; <a href=3D"https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA=
8NY1sIBiajir-UA3dTP1yJGRWy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf=
1xefPAKWL8QzKFY4phI7X7oyU8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexy=
XTLqSOW11D3kpi0OSLjADEWJ5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6S=
YEfc2lBf2j8mjnP-w8K-t2if_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_A=
gH2U6beeWJ4r-VOi9-2ZxMC6iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGq=
gQbCu8pOW2e9njyXPvG94ZC8uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.c=
om%2Fopenbmc%2Fopenbmc%2Fissues%2F3818">
https://secure-web.cisco.com/13Y5NFuOyUgdDUpPwn5OgA8NY1sIBiajir-UA3dTP1yJGR=
Wy2THA4rAtsVnZgvUls637SkO3gba7qmnDzMaxpGKwioLHRH2wf1xefPAKWL8QzKFY4phI7X7oy=
U8rhzQaj5dwIgY_y_WgmTI8SDnnzBRgQ8R742s0fb89kXTBSexyXTLqSOW11D3kpi0OSLjADEWJ=
5u87lD25OUNSiSQIFBC6LGiiYQbD2oxDTFeForuIGaT5fpAiI6SYEfc2lBf2j8mjnP-w8K-t2if=
_hfV0tPeFcYebcRDXoovS10ww85LEADDvpRReejBwftxZK6b5_AgH2U6beeWJ4r-VOi9-2ZxMC6=
iHuIZ1RBM0gzCMZpRFxgJb2E44ETONZneg1HJheeiEqDqyoLVGqgQbCu8pOW2e9njyXPvG94ZC8=
uh4ZodtuPdFanbmvOb6cgic0tZ4Q/https%3A%2F%2Fgithub.com%2Fopenbmc%2Fopenbmc%2=
Fissues%2F3818</a><br>
<br>
&gt; I'm surprised your guest is happy and boot that. If so, then<br>
&gt; what is the point of announcing eMMC is supported if not used?<br>
It should work on the aspeed branches I maintain which include the<br>
emmc support but this is not for upstream.<br>
<br>
<br>
Some comments,<br>
<br>
I don't think the AST2600 evb boots by default on emmc. I agree<br>
it's nice to have for tests and there are other ways to modify<br>
slightly the default behavior.<br>
<br>
We could add a machine property to define the 'hw-strap1' register<br>
but it's a bit difficult to remember the value.<br>
<br>
A custom '-boot' value setting the 'hw-strap1' for the AST2600<br>
machine seems a better alternative. We could merge such a change<br>
even if emmc is not ready.<br>
<br>
Thanks,<br>
<br>
C.<br>
<br>
<br>
<br>
<br>
</div>
</span></font></div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;" a=
lign=3D"Center">
Seagate Internal<br>
</p>
</body>
</html>

--_000_SJ0PR20MB3643126F9786CFBEA81D5D349DA79SJ0PR20MB3643namp_--

