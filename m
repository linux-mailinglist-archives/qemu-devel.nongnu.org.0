Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6311036E380
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 05:07:46 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbx1k-0006WQ-WD
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 23:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lbx0T-00065v-1c
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:06:25 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:50075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1lbx0P-0008A7-1H
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 23:06:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619665580; x=1620270380;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Lvy+eBXwueNwiAADyXX+jAPhvaNUQu5Uco6F/MAoI2Y=;
 b=J//HTrr67kRIbpqU2VGIhPw/AXenwy1y54CnYs4j9F2ZijpCEwqtW36J
 lxdO5ty6Zpj9giIOqyYPzmoxDNqaKFwxoXq7IVe7v4xWcjNrY2akG/XEI
 be7uTF6aROU8O7AteQdOXopVdROwFz781xKYYhEKCufPNCPckNNw3eacq 4=;
IronPort-SDR: pflGp/pLPPou3OoRfwzMUDPC5V5kQwVpcANeHpkX9TLwp0JXzluHJgRQdpuKmLNeeobpSksJ2Y
 bQvZPILomBicynMN6bj9WW4OEPitHi/v7tlxPw4Dw54kME7tQV3rm+T4KreJtnVFlau4sz5gUg
 Soah5wiiaaekPbvMKEd4aeXYGrEhJu7kapRZuSnaJg+qcb0rIGmXtaLW6b8gUSheCSGquTKH4m
 xGiQUUjysVmbuWjj7GqLjWmCW8xlhVmP3aJOZ8tD4e3QcIyWEnCmZgM0UV4gw85iPEBJzKoPJ/
 ZWc=
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 31703
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 03:06:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3L2NJLIrek515SRpSbSVYrKlcD15IwDrx9/9kshyOt9N1Pc2lj2V19l+g5rikIGuRoRgPlVVKjTMN5Cka/eLgmHGi1HBRm5roc3nwBZoQ/E1inWwPgVhYrrE/NnDUBYsjLagYMRnm7o+KOlbmi8h6lFJp/zuqdENSud5arwhp3I+ft/0KdO7xE+pEPCnsh7YBHorxne+4VnM3c224KtYbz3JPSBOlSnDv8qCWk4OgwMkOLJ1shua7g0U1F9+BPx+CzxCODkhlAltr3aE6G4lPVchBE597NFZceIQMQHfraoXOO6weR9O65by2fyvQBx9VJHsDC5xOjq9PQwlIjudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG9I+hG00g6mXsZtCTsfWREBeEzLQFSG0k40YwVG6GI=;
 b=n/3Ly5MI0QfC338Gn3IsqSW2OZPKRH65rZ0Jkh14gZ827Xj3sVV7hXTvtqrYxdwYsCld+LosMoIwE+p/tRvP2U5HHvLLgfWkihZLZ7az46I/8hFPW2Qq8rcypACvhBmmlxK0FHdo+kN2qPdVVltTXSs31uFAaAMT3OPkiuUrrvW6kVteg1n+lo8QrD+/0AiXO7zP/TuQQmR2Fug0+tSCUL6S4ZJ9pICMXGMyDnFw4nm1PbQ2n3zyBXuUe1u5WLVqprEmwCBqPp9mjigPZl+dOXZAg4+goJYQwtT4USGKjcWrIykCMLlKST4T2DnW+8e/geZHhv1s5QaheOxNibW0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SA2PR02MB7532.namprd02.prod.outlook.com (2603:10b6:806:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Thu, 29 Apr
 2021 03:06:12 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5485:c29a:8c18:d524]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::5485:c29a:8c18:d524%4]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 03:06:11 +0000
From: Brian Cain <bcain@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: sysemu SMP scheduling
Thread-Topic: sysemu SMP scheduling
Thread-Index: Adc8n0itzR/EMJiXTqeVhMIxQYfjfA==
Date: Thu, 29 Apr 2021 03:06:11 +0000
Message-ID: <SN6PR02MB42050931F622257CB4DF8C02B85F9@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [172.58.102.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be9941af-9cd3-4dba-af04-08d90abbbe62
x-ms-traffictypediagnostic: SA2PR02MB7532:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB7532C47EC09D89FCC56C0878B85F9@SA2PR02MB7532.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Po0F/sJU3fK7MQJLppVSCtAZfOcRp0ZKfsoN6XeQtj2AL9boSPZyldasn02XA1tEruda5w2EbfIiel3Xy9BgtHHGClZF/3xFr4Iq7N1pDlI0C6alQ3RZ+MdpmnkBr4cD79uKV75f3kMyNxv6aTogeO5wpuI/9Ab51T0uU+TCVbfVCVPY08n6PWrNDvF5ydSk4ivW7flFLJNKaemV/ELnCCDnx1GHUCcnnR+qv22gByskAJP4jDg18bWcT7UQx+fpDmxq8gI+eLVtRzwdWtmQM3DITf6RiZY8r3FQT3/cln1zTZBRy7se69S/OJAYziGlG8JPE+vhXUfGJh/0FCOOAk42fBsrLLs/NDvyvuXanCXXSLuYJtKZCd1O9i+Pwu64sFAGdp7siYE8rSjwYXbXZwA0dny1zGM/0s4UntK4t4Hqamt/J+o8Q1w9qahj4MVfyjZ1WDkRkwZckWRBTqECoz5939GCKx061No7ze+3YrrJJx6OGi8w854DsV6CMRnDGUvG+G+399HlfHFWFxz1GxxZqhNGn+i6zgIBLOuzSH5BgFY2DT/xoGGltHQuY+ZHIuDPnIg4H1zMoF4ZyLRKECgBTpQL32dNFV2gFB/p4R0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(9686003)(26005)(7116003)(7696005)(38100700002)(3480700007)(83380400001)(66946007)(55016002)(6916009)(316002)(54906003)(66476007)(8676002)(4326008)(2906002)(71200400001)(64756008)(86362001)(66446008)(186003)(76116006)(8936002)(6506007)(66556008)(478600001)(5660300002)(52536014)(122000001)(33656002)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FhxuQUh2+6QcFN+E1FV6mFxWdU0EYMdLa02C08DveqbPYJrn7v9Gn74aApvZ?=
 =?us-ascii?Q?/TAVnB9wlxjuiQXF+zmdh8pZFiERS8v7YBgJRiNTxlfuUAZPwfOv0JDuCI1K?=
 =?us-ascii?Q?IiOQBmu6gaw/nVwmQ32jgwPJymvbbTPNGcS0MGbqAREh6C7vkw7S9Z03G0XC?=
 =?us-ascii?Q?Rte4skPQXUmtrWEq1cyyinYC8+H42o4a9AyQGPJJeK/9nTg4yXJOsAvX9/Vo?=
 =?us-ascii?Q?BdpQMVzoDcVagC6/rWpvBeie720VjiGcLCh2k3Fj/6DI2+pBlJKkZZU0WZ5w?=
 =?us-ascii?Q?z0VKTR2av9WN0pZ8eMhb6Ouy801Rns+5PigyPQptO/eV+nk0XSo4BgoSYuYM?=
 =?us-ascii?Q?3r2rtqcuVJUPDApZRtp6FTecUoos3OdutK5DOC43CTwW9FQdCHvscBrYwcQb?=
 =?us-ascii?Q?7pUayC4C5AQKjG+Qgp6u5pI+cubJlfOtqYalVqBICy8jRazzvkEWDDh7UzLi?=
 =?us-ascii?Q?xa9XH5i9fP8OV2zuIs2uRqRTGk8x2y3z4NWMeXO4rymT2r20oMlz7QvvufsF?=
 =?us-ascii?Q?2SZdTUk26N/6g0+D9d29hGC0S0QuhUe5pCoWmMfJKuK2qEWpwcBGpRwfO7Hy?=
 =?us-ascii?Q?PbBg7R9EBwOrekq1zOl8ewbyDzFpFIj7y4yY6ZmzYmT+04WXVkBMZX7rFhcS?=
 =?us-ascii?Q?b5STu7emvP26Ns6JWTlmmfB5TyeyCI64eRdHWdl73wCJM0bzCdo6o6xQ2E6n?=
 =?us-ascii?Q?AfpvgQPHTCoR1lYWm4Mq9MUSmdx3ZtwMmOMuYrx4/DKj1BIJbv+pEmbrfNRY?=
 =?us-ascii?Q?YrPMKZ8BeIPIT961lZPrN73tj1nDjvVcP7tJV3s3bvCEcpH1U8RBXh40wZkX?=
 =?us-ascii?Q?BLVq4rT4rFNI2ZajtzT+zVkB9Vg0OrVZ6P9qfM2yAWdkPfKyzKhZxwUeQnQD?=
 =?us-ascii?Q?3u0SaG6iBfzDS552+ogxnf0wRNw1P4qafdhsbgvQeCJzkZnlschK/SnBxhx2?=
 =?us-ascii?Q?zOK0rmuETaOSVWbwa+sYVSbLV13Wp5uGkWQYPAsOy7egxnUW8Hen7iIxEot4?=
 =?us-ascii?Q?N76uU6jaYUYEs5DAuTSfoh4ZQZ3Gebx9xXC4pOqbtBCQDoSnBicb3Q9tTxNf?=
 =?us-ascii?Q?Im+N00qT0gdoxnsEZp9oOYlwS1RLvMMxRLIY5mEuFS8Md5EtJgOTJGPcgAjv?=
 =?us-ascii?Q?pH24b1CF1kLAnWHxWnPCttoLUuAZAuZlxBp3c86Osb3oUg0YZS/GrP9UHxDV?=
 =?us-ascii?Q?r4PJN+hSAn4Lgyysvs0jlUB8L3H7wzxSKr2kd6yYrVb9jGPRlw58ZC10WQ/v?=
 =?us-ascii?Q?t+rb5qkV581TQQI1HcR5G8x16yVzEcQRj8bBLYd3r9bu7aEWZmX9CKZxHsig?=
 =?us-ascii?Q?GqQ2utCaudquoxN57bq3nSLe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be9941af-9cd3-4dba-af04-08d90abbbe62
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2021 03:06:11.7397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLJ2FjG3GXQ1u7odDeqBsl9MPcfEfFsjLE9pMvzTMIkKpfEsY+RCsd8yTjKlGX5XrRxMa2rsBY3oyumO248lxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7532
Received-SPF: pass client-ip=216.71.142.165; envelope-from=bcain@quicinc.com;
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

For some hexagon use cases, we would prefer to have finer grained schedulin=
g among multiple guest cores/threads.  We haven't been able to determine ex=
actly what kind of scheduling algorithm is operating in the baseline case. =
 If the current hw thread is ready-to-run and is spinning over a tight loop=
 that never hits any exceptions, would it ever yield to another thread afte=
r so-many iterations/TBs executed?  Or perhaps since we're executing transl=
ated blocks there's just no yield opportunity available?

We came up with a design for this finer-grained scheduling feature, but are=
 re-examining whether or not it should be necessary and if it is necessary,=
 whether it should have been designed like so.  We haven't seen a similar e=
xample in other targets, so we'd love to get feedback on the approach.

In the TranslatorOps .tb_stop() we generate code like so:

	if the current count of ready-to-run threads >=3D 2:
		tb_count++
		if tb_count > THRESHOLD:
			gen_exception(EXCP_YIELD);
			tb_count =3D 0
			gen exit_tb

- "current count of ready-to-run threads" is based on the values in the CPU=
 state.  When entering a wait/halt mode, we set the appropriate state and c=
all cpu_stop_current().
- Is EXCP_YIELD an appropriate mechanism for this feature?  It seems like m=
aybe it has no special handling, but any exception can trigger a yield?

-Brian

