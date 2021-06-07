Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CE839DD46
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:06:38 +0200 (CEST)
Received: from localhost ([::1]:52980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqExh-00029o-43
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1lqAzs-0002It-I2; Mon, 07 Jun 2021 04:52:36 -0400
Received: from esa9.fujitsucc.c3s2.iphmx.com ([68.232.159.90]:38825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1lqAzm-0005Re-3x; Mon, 07 Jun 2021 04:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1623055950; x=1654591950;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ObLHyk3beniFjJk9jIDZJnzV/nTLS4492X6JOtAaxCk=;
 b=iLZ5Cn6S2Qykmm7FUskqBHcVCCurpIPgo8jCndkIyw804yv8ZiILnQES
 9NpYUrTh9vkYKFOu/jxtsAB3TE9N0qiw0BfNVrhJ4DFA6vfvLQA88D2VK
 IHbKPjR7bUvj4H4XeA6hp1+8td4mJHGbidshUdrA+jiSV6HZ6PI2kT7FK
 NRDjF6iSZBH2SoY7JYzx23Opad0mU43+f6gDP+BW3otypRxjDV+wxYaLj
 bx0vyfgLc5n5F3Bcvnf5V0RzPRVxTqL04HtlW9OJ3LBN4tuPL+x+oSGgb
 KN3+rFOwiyq+mnfSvA1dlUQ+AOY34sl60tVHMj8/Z6e5ptnV9D+KrB+Bj w==;
IronPort-SDR: J32RWgffNeLTnMcmWbUOi9d6qbrIWeNX9yiRSPtXdq14VowiMZijLBtNToP7iDm5Bb19njm91B
 HNRl22CrHckV0dZIrCQYn6eQyHWdw+bx2EFCDuw2umeCwvNaNuW2jZFTC2v7W42ed3jmT+XkVh
 igyOBMchtVG0KCAvZKnjPF0TWKCKaFnIhWPlpDLXOwTO9D3xbRxAu0V2rLtHZu5uR9B3Y2DdKm
 nyq5PofJ3fXKnOcwllgPKggvyy76qQ8ZJKPZMeICQHsW5PFbI4+UneZp/ddSO9tZ54MK9esiKx
 C0Y=
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="32666694"
X-IronPort-AV: E=Sophos;i="5.83,254,1616425200"; d="scan'208";a="32666694"
Received: from mail-os2jpn01lp2053.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 17:52:22 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDVvcqhGySs/j+o9/hKEc/Qyd0hj8b+ZoXCIaEwV5O0PdKlRqv3Y4v5xGlxGmu+1cFqxV0odNcDk6rg1E8l5BUsUA1xU+SSufich/ir5uLX9yYWda6Vc1d38zxEtKM2RFFn9nSzuArOHyA+g2FQlsF1TN70bBYwEO4s702SsE2hQBQuAabDkMsN8qzwwlntbLSbGO0CIBzyGF920wg8pw1Ce26p56YCjhNv4N+h6Q7K3oeTtQ2Cs/xjcW+Zo5jydCSkFqnIWfO80r5bvQ8X6QlIs7bJJ8DYSLb3xgW2YiVzY/Dazc7Jn6VgMvjtCU+OeAlKOAPDHiCi9QPVs1qoJUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VHq/ef2e+SsyQoSX2lGXAVzWoQdFl572RPT+wdKHbc=;
 b=cMvoEQupDacnqNeSBYyiT8lxGGCPlftIDPi0Pgn/NpkgphaQOfwq+5VGk2ICVTYWMC5S8tybgJ46l2bpGS9Pvjai8tJawbNwBadu9STFo6yvpTR+k/v38CJER4M3FwNbT3x7lTVUJlPB3sQrBsx3KGev//9oWmneeJE1M7ddG6l9KbthySWq6Y93L0n2YoM+FBXZg+IXrJ/7xfkLtnbBwvBv2IdFg+yv6ln1ahM4jMMW+QfPdEGyUadV7pyGfLrLw5lI11ROzXj0e/3DmGX/q3hbvxJ2AAUP43ZezWMXuzACzvZGNmMKJAMMgK1xPTuusnMLhSFCexhZh+Mm0TKLqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VHq/ef2e+SsyQoSX2lGXAVzWoQdFl572RPT+wdKHbc=;
 b=Fe370ydmN43isi4YClL5gW6Q841yT9GByDg1F3uHWAD+ZAssTk2ZlQMOMhUWY4/s/HAuuUdWgosocQP629qCcNTfD0IRfWto1ckI8i/J833oEpH04t46MSoZDf3xoOXR1ZClaVCMcf3MhsD+DsZh6jglwpTwJQJPTlA18N8bspc=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYAPR01MB6523.jpnprd01.prod.outlook.com (2603:1096:400:a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 08:52:19 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::4934:aef5:d5a8:482e]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::4934:aef5:d5a8:482e%4]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 08:52:19 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Peter Maydell' <peter.maydell@linaro.org>
Subject: RE: [RFC] Adding the A64FX's HPC funtions.
Thread-Topic: [RFC] Adding the A64FX's HPC funtions.
Thread-Index: AddR72HvX+KHC7w5TWeyXhvxcP1CJAEsiw9gABYQM4AAOf27gAALWxOAACk/Z4AACluOUAAQmXiAAJQ+c/A=
Date: Mon, 7 Jun 2021 08:52:19 +0000
Message-ID: <TYCPR01MB6160FA8EC9A7FC23CDE67166E9389@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
 <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
In-Reply-To: <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2021-06-07T07:44:49Z; 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=c45a0629-17a0-427a-83fe-4e41f4eae54e;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [210.162.30.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 902bbf97-b79a-43e8-285e-08d929918f33
x-ms-traffictypediagnostic: TYAPR01MB6523:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB65239990175D3406984CB841E9389@TYAPR01MB6523.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O3DN1FnX9PiGDuZkP4eXxqYb8xKW/Z0B9WyJp2zlh3s+VDvpDir+Mq8vgLcphECKL/Io3ZtYCTYu3qOUZtsjpNQKMemq3uSYXDQ9tyiaC+yKB0DUjHTBsuo6iCcfXq1n0pcmh6YT2Trgvko4pS2PjXVJHppVqzYel99rgoQRJX19i8P8XDOwCLokMlPHOQBFHcLR/fznURkW4eVQRv5r/oPln/41m0oBydksiO8rtlhdLSBzlc2vOed9wG79p4DV+I0xBXxOVpGsztIp7H4E6ICcV9CyziPgb/kiEJHuP6cd6OGkVxvnptysRZOnDdWlZydyvjB51hT/AuQ/VPsaxko1oY7zoI5v3TRV5oAHKQTs1TS7mnDTy2U97vzIL4Vnlj7yAvkJ/djxoiQXiCXAIgsIvwl0EzHjdQviCM10lqelhMmgRki7kMt2Qs7CLNKYLVuWokb4jpTvyH0VCaosbAHqlhNGk66r/TNuzsboh8puFI6dEusFFh3uh7iui8qQg1feE3vvFJIaHVifglHMAMOCXzCrmpbFKm/Wv7arZ24DMbWTE7WNwJ3s/1fDfx/Li73IqaQLlWMGdsMf/K6RVTHhrH+P+bH39iY1rNfuIyyhtAS8RKsXT1QhpFLz8AgnFJsuNd5pgLM+pgbJwCJHw8Sqzik/P2eB+qw4AP1fSWYPRB7Tc/Nv0NMiZw/w+sh8WR36XAbZgyt1P8mSDsLMlElA28IafgmZxZDAaBGD4fo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(107886003)(8936002)(478600001)(8676002)(6916009)(7696005)(966005)(26005)(6506007)(2906002)(122000001)(71200400001)(53546011)(38100700002)(4326008)(54906003)(76116006)(9686003)(64756008)(66556008)(66446008)(66476007)(5660300002)(66946007)(83380400001)(86362001)(316002)(52536014)(85182001)(55016002)(33656002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-2022-jp?B?dG9mZlhEK3NaVVRVTnY0ck5sOVRLcjFoWFZsdExqQWlka0hXLzQrT3hQ?=
 =?iso-2022-jp?B?OW9qMkJST3JORy9EMXBFQURRVUpSdzV4SHFzdmxyZCtrQ01BK1BLdklI?=
 =?iso-2022-jp?B?bldOcU93V3g4bnpySXQvQ1V1NGhqVk8vazBYMXhJUi9xdFRmTjJnTTVQ?=
 =?iso-2022-jp?B?L0tLVml1U3poTHozbDVOS3pjaCtYaFRPTnFLMmRrL3pQZU9yNk1EdU1y?=
 =?iso-2022-jp?B?NXB3dFkxNWtWcW85VWQ0TDlpRk9lTCtSQ3kreXEzOE1BTTRDQ3VUMmU0?=
 =?iso-2022-jp?B?Tm10QjhOQjI5UVcwemsxT0FlbWVhSlNzMXluWDNrb1BtcWZ0elJzY3Rw?=
 =?iso-2022-jp?B?MGtTSDgwMjJGTHhJdG84Mm51bFFYVHZKS2lkZW1MckpqQWhIdnRDUy9u?=
 =?iso-2022-jp?B?anp3Y09IelBWQk1KTjJLaHpza2d6TWRockl5dXoxZ0wyNDI5NjdaTGpU?=
 =?iso-2022-jp?B?RmJ1Q1NOMFBHUTJmRXcxSUs1OWVmdit1WWZXRi83QlpPbnFOQ3Flek1Q?=
 =?iso-2022-jp?B?OWcxa3VwVHZyS3ovdmZ0NVRZYVpaWkZocUdFV1Q3OTlRdnQzRlZvYVFs?=
 =?iso-2022-jp?B?U3ZtTXpwSHlYQmY4RzRVeGVZU3UyWDlNVjIwT0NIUUhYUTdpZm1UbC9F?=
 =?iso-2022-jp?B?bkpBNWNXMWU3dE92Qk11cmczM1NPOGVkcmRNeFJ3NlB2em1uNU9uUEhC?=
 =?iso-2022-jp?B?Zll4L1NMZUpOZDBYbVI2cDJTdC9wak1UU1RNOXZCNkhzSjBnb0ZnSHFs?=
 =?iso-2022-jp?B?K1hhbGN2bmxJdHRaVUxDVmlteWU1U0RKLysyZm9DMjVraGM4eUovSlcv?=
 =?iso-2022-jp?B?d0tTaUV6N2lrazNwbGNBd0NaL28vWmJKa1VKUFhjODZacnM2c3Z6elRx?=
 =?iso-2022-jp?B?bUZOT1dJRTlCcTREQ2tlT2VYa3M2RUJvNE9Pc1ZzV2VRd1o3QVI2ZEJG?=
 =?iso-2022-jp?B?QjlBK21DeEhkMFlEV0VjM0dyLzNYdHdwYUQ2bTRGeStkQnF1M3NlZlUv?=
 =?iso-2022-jp?B?NWxWaHloQk03MDJlZ0VVWHVqY0pyZ0dJQVBMRHNzMlBJWEhXNm1VeVlk?=
 =?iso-2022-jp?B?bDNXMW44dUVFRXhNY2dKdFZXeFF5cjFPTzJnZW1GRG05dDBySXN4Qm9B?=
 =?iso-2022-jp?B?bSt5b3J0ZXRhU2xWZWJPVk14aklCa1ptc01FTGJUZU9xekk5b25Xa01s?=
 =?iso-2022-jp?B?cUdUMklScCtncmhKK21zQm5FTjVyWTRUOFhFZlF4cU9raWlMalg2QVh6?=
 =?iso-2022-jp?B?WXIzOEhlemJnTkVyYkVQVGc5dC9EZ250VktWemxCRW9KOUFyWjFyVHJi?=
 =?iso-2022-jp?B?OXMxRDBJdXlOV3ovTWgrMnQ1Tk5EZkZBV0crdEJJdzNMUDJGOGdSTjFO?=
 =?iso-2022-jp?B?RDRta0lZTE5XRlJwUEJpdTZhWVl3L0tabE92MTkwZTZWZm43dXZweGlH?=
 =?iso-2022-jp?B?NjU0ZXFmTEcwNXNLMkx2cDhvMmxXSU5DQXV6Z29ydmNNYVNFeDRVWG1I?=
 =?iso-2022-jp?B?WmtBQThXNjdtYW1ReloyWUJyRlYrdjJxa2xvclpxdkFNK3dvMHFoUUlO?=
 =?iso-2022-jp?B?ZlB1WnhUVmtDOEtBTU16dXlDcG9kWnhFTE0wV24yRCtITUJkOTBmOVV4?=
 =?iso-2022-jp?B?eGNPcU5kbWhkYXAyenFoUS9iNk96STBiZzNPRDllZDhSZ1FFVUxWYmVO?=
 =?iso-2022-jp?B?Y084dWFLWDlLR0dZa05jZzlHNjFwS0hQcGZRR3RTQWdpK0dNSE5QdEh2?=
 =?iso-2022-jp?B?QXladmhqRFVrMEhUdXdFZVRhTTdkajVuY2hzMUR4dmk3dXgrQWk1Mk9J?=
 =?iso-2022-jp?B?Znc5ZmRteGJORElQdlAwMWxiVmhEbHZYWDYzSk1IOVloVWQrVmV6TEU1?=
 =?iso-2022-jp?B?SVVSU0NCa2dRWm54ejBSN1FDd2wrVUV5YkM3SmlwdjhWUXNwUitVS3d5?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902bbf97-b79a-43e8-285e-08d929918f33
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2021 08:52:19.8609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YB+5r3tOKUcd10nc7FFJlj6rbe168xCJoNS7GVhBhpBMhPyQEAWv48Jhj2zrH4QbtVy2+FU5xgMxaYNvLlKO1b0OgZjXHubdTBuVm280GaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6523
Received-SPF: pass client-ip=68.232.159.90;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa9.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 07 Jun 2021 09:04:41 -0400
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> If somebody has access to A64 hardware they could write a minor kernel
> patch to just print the values...

Yes, it's an ARM standard system register, so it's information that
users can find by checking. As you said, it is possible to check it that wa=
y,
and we would like to consider implementing the "-cpu a64fx" option based on
that information.

Thank you for your advice.

Best regards.


> -----Original Message-----
> From: Peter Maydell <peter.maydell@linaro.org>
> Sent: Friday, June 4, 2021 6:00 PM
> To: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>;
> qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [RFC] Adding the A64FX's HPC funtions.
> Importance: High
>=20
> On Fri, 4 Jun 2021 at 09:29, ishii.shuuichir@fujitsu.com
> <ishii.shuuichir@fujitsu.com> wrote:
> >
> > Hi, Richard.
> >
> > > Well, Peter disagreed with having them enabled by default in -cpu max=
, so
> we
> > > might need at least one extra property.  I see no reason to have thre=
e
> > > properties -- one property a64fx-hpc should be sufficient.  But we mi=
ght
> not
> > > want any command-line properties, see below...
> >
> > I understood.
> >
> > > For comparison, in the Arm Cortex-A76 manual,
> > >    https://developer.arm.com/documentation/100798/0301/
> > > section B2.4 "AArch64 registers by functional group", there is a conc=
ise
> > > listing of all of the system registers and their reset values.
> >
> > Thank you for the information.
> >
> > > The most important of these for QEMU to create '-cpu a64fx' are the
> > > ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all
> of
> > > the
> > > standard architectural features,
> >
> > The values of ID_AA64{ISAR,MMFR,PFR} and MIDR are not listed in the
> specifications published at this time.
> > Of course, they are listed in the A64FX specification document managed
> within Fujitsu,
> > but we cannot tell how far these setting values can be disclosed
> > without checking with the A64FX specification staff within Fujitsu.
>=20
> If somebody has access to A64 hardware they could write a minor kernel
> patch to just print the values...
>=20
> -- PMM

