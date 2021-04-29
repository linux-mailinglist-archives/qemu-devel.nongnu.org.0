Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E1636E3AC
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 05:27:03 +0200 (CEST)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbxKQ-0002p9-2s
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 23:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lbxJQ-00026f-RA
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:26:01 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:52785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lbxJO-0005zi-1x
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619666757; x=1620271557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O7FX2rUR6lAbgAL/+eyNIypvZq3uARWqw5HZZYSDJEw=;
 b=Df9Z1lALjleYqLhQtp/pDA8ubwrFJ1Ae6DutYG6fk6miRd7LnLqOGQgF
 bDcfetVpy4CyvfBtflNsVLQgaYBPMsvS5JodgogqDTvYF4dxIzND1DR5S
 K7zfHFMywSrqKDNc3IE1rk4bryA3wohX1yYokgwqIY0ZMyVdd1WNCSHqB 8=;
IronPort-SDR: 3ZZAyqATAs/oq9XA4Yplc2KbCbeZtfwGxnfNrDSV+2q1V+cEuSo7qaB6hu1IlIkSzEPPrviKDz
 7z6vNVy/WVZ9dm28CEAz9eAT8Q+PD8b3I1zywVpqCDnw6P0k1xS0jeJD82FZjKAze6UpSb1j09
 S9JtW5TE7ppYm1wpsGskp2yj4nln8+VWXhXJYZNl3Wlpru2Ol0xrJ712CYO8KewDN5e0J4BxJz
 VtMS3c6tuomXwbUlF0W54O5jRpBd7wM742cl3nybJ/JstES1dYdNNNh7ihS1PCBbx+QELdEGPB
 xAE=
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 31979
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 03:25:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8JvloEdfJiGbh6pKZah/alYjH/8RsbIsRfsyCtEyHg55fTXJWugOG6ItF5CHzN42yDv8djKgIzxIH/hQSvbSPFvbxHcX42u7fv7rbFivS1eZnCdPn09GYgsIIgaANXlnUuLPpXXkHOcLkFFGUBtrgO0YTjT+Danfhs3bhli7me5uEQ8M3mYeFNPN66d+xH5QDl8ysQrd1JNE7JmZrDsbDs/d9b3TDKVYasIaFiC/3S7xbKwX8/N4B6UQz0ypicbdth5MXhoxkTn30ubyN1nDM9gZ3S4a18CVhT2t5/7GdK73Mk+sIrULJE0UR9dJhy+pHJwhg1JCZDnsgBTvJKUoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXzuDXE4rwa+WCmc4+VYq/Hu48d3lA/atSaj9NKllS0=;
 b=Vzi6VNTj4SFDfw4P5ktrUrTZVnUL92mtIfzaRkySSAxuLX7Mfrfgui0pqLIsyijshCu8TL7FC7S4nCyIGauZIVDYfKPiTzD4uQjw+2cg9rAOffVAwVsWwtJJD/QDb36l/2+NjAU06L3TBO3IkEPdGuSJkoUc4hKjxj47L3VvG1Z5DtdxlwYQ2HhwzWWkJVhLTuqSZHvf3NpcpQvHyf328NCr4NMMGqC/gyoucQPRlm52cFaB8Wr/FLzLQI13lMJSWv0Gwd1M6+xYev3F4GwJucapn1YTLRAAr8isy8555Dd/mk03j0BqcZM30B38MPxXADCnr2R0AS7p3b3T5KWEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB5648.namprd02.prod.outlook.com (2603:10b6:805:e8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 03:25:54 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5485:c29a:8c18:d524]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5485:c29a:8c18:d524%4]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 03:25:54 +0000
From: Brian Cain <bcain@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: sysemu SMP scheduling
Thread-Topic: sysemu SMP scheduling
Thread-Index: Adc8n0itzR/EMJiXTqeVhMIxQYfjfAAB4tQg
Date: Thu, 29 Apr 2021 03:25:54 +0000
Message-ID: <SN6PR02MB42054C4AEEC503F1105335CBB85F9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <SN6PR02MB42050931F622257CB4DF8C02B85F9@SN6PR02MB4205.namprd02.prod.outlook.com>
In-Reply-To: <SN6PR02MB42050931F622257CB4DF8C02B85F9@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [172.58.102.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 005bdf6b-9e17-4beb-7263-08d90abe7f13
x-ms-traffictypediagnostic: SN6PR02MB5648:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB564852238843B8CCC3886D6AB85F9@SN6PR02MB5648.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VDIZuGuBlmOabNJQvgkv7WFdF1G83aYdLQz2Q7kpjN56p91/9c7Im49/Xkk6k12BfS6sKZ4/NhpqlXR12Deg4sNJQilftSRA+1J1yBTnYRJPw2IrF3UgtLj7Hj/bavYXmIlbBC44pdmy/HnOdXzc/fLd68RmgJDr5mNbnCMrbfgNY99imRmHq+1xtIzuaB2chjtm6SlDai7bpuO0wqtgRUVp4/xUCFdqy3Opuv7ZXCMUHoyvx7mjMrcU1Nqho0DEDehC2stC7W7skWfAmga+HV8JFbuQng4W1Zl/tZJfGOiwTSHrwDP4uRg61UiP2tLKWUykUOQSocVbIqb4ZRGJF11bAa3obnwAy/lgZRTvCpEU6oh9Nbk/IFOBk8dbGfBmxCwHVzLGtnWv20+VINYcBqS7+4oT8DE5hxk0cP36FK3xl6LZMxPO3qqxYNmv8o9Fkg4cVZIuf6oi+jcwr1RL4v6NYxtjAe/ECTWOC5gbWGs9Oh05CZQ417Je8Af40dNWi8GwE1v+jvrFMvDcCrzkSa7qxBMuqcRosJK/l2NsFWVtG4lZ5FOi56A89ticago18625JwrZt/62P//A4d+MwVRCV7GexEGZPKd7nYm1h2M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(52536014)(55016002)(53546011)(7116003)(8676002)(6916009)(9686003)(8936002)(38100700002)(54906003)(66946007)(186003)(86362001)(2940100002)(83380400001)(6506007)(7696005)(478600001)(26005)(76116006)(3480700007)(4326008)(66556008)(33656002)(66476007)(2906002)(66446008)(122000001)(5660300002)(71200400001)(316002)(107886003)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IWilLpj2TmDScmHJXHHI+XcyLbfqj7BGojJ2Q237+xRuOSbtLHb1ui/rgO5l?=
 =?us-ascii?Q?SMlHcTBXT442mSSLjJjcFQixArq2jHtQ4ygPExn2RNKw+EsAjLE5xCRXMf7P?=
 =?us-ascii?Q?FEtNzNiaSLJE4cXRlp7Wge/hYTg7UajTGqcaVAIE5YFGJw19EKfwQVpmCDON?=
 =?us-ascii?Q?1hfn20Y+tJWXDKjF5U90lbRJi0gFXOJfLnw0EttLR636bx1tY/FhUKHxH+Ds?=
 =?us-ascii?Q?fKHfqwQ/P8PqH7tzanRiFj8U9r6srd8HJdi019/fqOLtFk7estzPZbp4H+iI?=
 =?us-ascii?Q?jTTiqNhfaLAKzfoPwxgMWdSLYcTw/8ZySZqCT3oZ1UNgbeQZHlRZGucipBay?=
 =?us-ascii?Q?gAz1I4ionNd8VpwFpbsBB1JPlzMkKzOMfMB1J+H/9ar09ziMB2gMIwI5RvE5?=
 =?us-ascii?Q?B8eoaPt8mFq/qOJKgL/JwFAxrs6yTJtfKvb1h4iFb8J3LWGWMZn3Eh1BfhOK?=
 =?us-ascii?Q?0CuA7KZEMyVeGTqEMGKAoPL3ErGEp6SUaRSGfHxbSjl9qPrkrXq6//xu9UPk?=
 =?us-ascii?Q?NSxgVc1gyXWh8dwTiU+dK3s244iMP4GJ/1fOez+PJjO/Y2bg+SOkdtDmi4a6?=
 =?us-ascii?Q?wKxMCpNRhszJnITO0fC3Y9PsUgLDkb1IxYkClegFITfiwBDM2UcyLYhSyQ4z?=
 =?us-ascii?Q?9hA1u/d0mWZkBrsAdPG+ZpwuYLojUo+Drq7CV0QOESynHGieVF8+qCq/1vBh?=
 =?us-ascii?Q?z8eksEhMPX38FPAsVvgcCKAMYHcG6W5rYw5Yqc6OiM16HZ9iR7Zot/gT0i7y?=
 =?us-ascii?Q?3UIDRm1fBolRWpmf56LvovbkYpZEw4Yxv9x69YSobW2g1t1dlu72JxD1sqra?=
 =?us-ascii?Q?3BFdoPL0SpPAVGA/zCmo3wyjU1E6ubsDc4hqIJvHK9/1oLnu+PYLyjgIAXoW?=
 =?us-ascii?Q?Ywm56yGPtcODI5h6O3+oRnWVYMUVYVLfzX+EshZJzxTjm+HVdqmhMh8CCxyn?=
 =?us-ascii?Q?aINuuDuqs5vq31Y+DIUHVZcWjOhO8t2z+mJbyZhgfDAdZznxPHo9+v3uc+P8?=
 =?us-ascii?Q?x+92DpyoIZGKmoUXS8nqZYU30V8UP1UmnjhsLKkFMSUFfuB/W9LdSPbP3ypm?=
 =?us-ascii?Q?e4Tr+D6oDOGgjPuKDkJonDFDQenIEdw9ORUZj1wGY7nceI30gEniQ9zShiBI?=
 =?us-ascii?Q?/ZhuZM5CYoob7soQ3I2MRz9vz6L3op4I9ZqL6nLe0pfx2EgCcjhgAWhheDpc?=
 =?us-ascii?Q?uSJ3D4HY0zuvduMnSxJoJvyOnuvRhFo0N8qO49KKf++2fM4285gUA7E8a7Bz?=
 =?us-ascii?Q?TT/Oha1nH1LKLyTXrbTNhrEL3SRn9vEPKjjzJZNdf2UmPBh5OZSxa7p70ga6?=
 =?us-ascii?Q?ztQDwQ3MPEESGN3UGch6tSNt?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 005bdf6b-9e17-4beb-7263-08d90abe7f13
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 03:25:54.0541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZmth/9XvulcXzjR9Lc4X7ZIVOzdORnUKC6K0scEL/YH8XwWxBSJccUg6dnKM9ghJyI4sKULP/+RiBFRJfYzGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5648
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sid Manning <sidneym@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> -----Original Message-----
> From: Brian Cain
> Sent: Wednesday, April 28, 2021 10:06 PM
> To: qemu-devel@nongnu.org
> Cc: Richard Henderson <richard.henderson@linaro.org>; Taylor Simpson
> <tsimpson@quicinc.com>; Michael Lambert <mlambert@quicinc.com>;
> Manning, Sid <sidneym@quicinc.com>
> Subject: sysemu SMP scheduling
>=20
> For some hexagon use cases, we would prefer to have finer grained schedul=
ing
> among multiple guest cores/threads.  We haven't been able to determine
> exactly what kind of scheduling algorithm is operating in the baseline ca=
se.  If
> the current hw thread is ready-to-run and is spinning over a tight loop t=
hat
> never hits any exceptions, would it ever yield to another thread after so=
-many
> iterations/TBs executed?  Or perhaps since we're executing translated blo=
cks
> there's just no yield opportunity available?
>=20
> We came up with a design for this finer-grained scheduling feature, but a=
re re-
> examining whether or not it should be necessary and if it is necessary, w=
hether
> it should have been designed like so.  We haven't seen a similar example =
in
> other targets, so we'd love to get feedback on the approach.
>=20
> In the TranslatorOps .tb_stop() we generate code like so:
>=20
> 	if the current count of ready-to-run threads >=3D 2:
> 		tb_count++
> 		if tb_count > THRESHOLD:
> 			gen_exception(EXCP_YIELD);
> 			tb_count =3D 0
> 			gen exit_tb

Hmm, I omitted some critical details of this algorithm.

tb_stop, corrected:

 	if the current count of ready-to-run threads >=3D 2:
 		consecutive_tb_count++
 		if consecutive_tb_count > THRESHOLD:
 			gen_exception(EXCP_YIELD);
 			consecutive_tb_count =3D 0
 			gen exit_tb
	last_cpu_id =3D this_cpu_id

tb_start generates code like this:

	if this_cpu_id !=3D last_cpu_id:
		consecutive_tb_count =3D 0

> - "current count of ready-to-run threads" is based on the values in the C=
PU
> state.  When entering a wait/halt mode, we set the appropriate state and =
call
> cpu_stop_current().
> - Is EXCP_YIELD an appropriate mechanism for this feature?  It seems like
> maybe it has no special handling, but any exception can trigger a yield?
>=20
> -Brian

