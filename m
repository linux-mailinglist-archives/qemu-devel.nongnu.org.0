Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB303586DC3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:30:48 +0200 (CEST)
Received: from localhost ([::1]:48854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXNV-0003dd-2G
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=205475a44=ross.lagerwall@citrix.com>)
 id 1oIXIC-0007uH-0j
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:25:16 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:9950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=205475a44=ross.lagerwall@citrix.com>)
 id 1oIXI8-0004d9-Fr
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1659367512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N+Cbx6Q8ZMGGZrjf2gUbDP3eONZnrH6YACdfyxAUcFU=;
 b=C5LZwRyNoy5QEFGG580XGgCwXlmW+j0lVP/frC51TIpVjOXGdL0SMXxo
 Ss0ZF69vWpoBldS7lu18S/d5cJPit2Z7RTaGvL8pn6BUThzg3EB0oDlcH
 6aNc/P3mHXsdioGt16c8t0qRz3zxtk8WQEMckHhsOUmQqNrzd5vXS8RZx o=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 76361278
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zb/KDqgegN3xJ3X81RTpt88/X161ThEKZh0ujC45NGQN5FlHY01je
 htvDz2EbPqDZWL3Lo9xa96z9UkB7ZLcxtQ3SVBlrSEyEn8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaQr414rZ8Ek15KSq4WtB1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4ePYQg5MQvXnl12
 dMEAykUTjCkiNOS+efuIgVsrpxLwMjDGqo64ysl6A6DSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsG9hTJ/cLb4ECKpOB1+KLqK8GTftWFSN9Kl0Kcj
 mnH4374ElcRM9n3JT+trSz32LaVwnOTtIQ6DOeB7uVwuV+ozEcvKDskcnyDj9iEsxvrMz5YA
 wlOksY0loA3/VagR9/xRRD+pGOesxcBc9VVGuw+rgqKz8L8+BqUCGECRBZFado7pIkoQzE2k
 F6DmpXiAjkHmKSYTG/Y+rqKoDeaPy8TImkfIygeQmM4D8LLpYgyilfKUYxlGavs1NntQ2msm
 3aNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFzFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:JrNSY6Ot8Pe/NMBcT23155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHPlOkMQs1NaZLUPbUQ6TQL2KgrGSpAEIdxeeygcZ79
 YZT0EcMqy9MbEZt7ed3ODQKb9Jr7e6GeKT9J7jJhxWPGNXgtRbnmNE43GgYyhLrWd9ZaYRJd
 653I5qtjCgcXMYYoCQHX8eRdXOoNXNidbPfQMGLwRP0njBsRqYrJrBVzSI1BYXVD1ChZ0493
 LergD/7qK/99mm1x7n0XPJ5Zg+oqqh9jIDPr3NtiEmEESvtu+aXvUlZ1REhkFwnAib0idorD
 ALmWZmAy080QKWQoj/m2qR5+Cp6kdT15al8y7WvZKrm72GeNo3ZvAx+r5xY1/X7VEts8p717
 8O12WFt4BPBReFhyjl4cPUPisa33ZcjEBS5tL7tUYvJ7c2eftUt8gS7UlVGJAPEGbz750mCv
 BnCIXZ6OxNeV2XYnjFti03qebcFUgbD1ODWAwPq8aV2z9ZkDRwyFYZ3tUWmjMF+IgmQ5dJ6u
 zYOuBjla1ITMURcaVhbd1xCfefGyjIW1bBIWiSKVPoGOUOPG/MsYf+5PEv6OSjaPUzve8PcV
 T6ISZlXEIJCjLT4Je1rex2Gzj2MRaAdCWozN1C7J5kvbC5TKb3MES4OSITr/c=
X-IronPort-AV: E=Sophos;i="5.93,208,1654574400"; d="scan'208";a="76361278"
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Aug 2022 11:25:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eGAuRAhJ942LMZ2LY2i/rBPYp1kF0OcZbJ8ku40PtI2Br1fy3lMKvqBQ/mpa2td0co9GmTm7xZ3iF1XnSew+xdwy/VZ8PJpyLJ+R0QhViZ5NO7ShMZjnZAfCUittZSMwXReThy2MIyPry7mBYqL7Ma0fLYejclesncetLbl2JU9+gcQnlMiN86aqKO1Nkd/+D2lKWxENb5wyoAVnVlm91sWH7FmhkTlLpevAg3kIgyhRglWxvX2OUKkb6trA1B1h2lGgjBrdhxkI6svrvD8wqtEXeH6GndCGY+82AeXX9AbBaEpAt0xzGbDTFqYGxrge799kusiCkha4Q9fZxjmVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+Cbx6Q8ZMGGZrjf2gUbDP3eONZnrH6YACdfyxAUcFU=;
 b=jdm9eInu7eI1TsyAOCc1coKkilSh2VjNHHhgIqSk/xqxwfyQYpPF3Xd6j9hMYjZZ5TWCFimewdar8WF4nylux+8fvYQGkYqo+bJmjNwMzTa1Rc8ijDEwjW1PmDPmd88uhJNgdOl43vwe7b3f1Ln5epPoobKQZGi9XzPnuEamk05scP4lQZqbUMzwS8hv1hDWIdT87ZFpGnsFnVBknUFkvlU8wLx3dtWqyijSS1pS/CFp3L9iQCJIow/yhxAd+Dxo0OAkgM/XPM9iHldZX3UWcM+FQEmfWofLJK+AdvaPkUzf6XSZyBVopTs9DQIkBTl6tRInyBPC7+2cZx6eQp0Kmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+Cbx6Q8ZMGGZrjf2gUbDP3eONZnrH6YACdfyxAUcFU=;
 b=QF/Qczj7t/2H+GUVUUjmNI1/oOwOCY7agLJChk/z47jbwZGtP5oPWqAlbdytkWSEX9uF73YgbU+haJh4aDLDAWDKX5gzqloT4IeXqUf2ExgxA85JDW7LQERp48PCtLbFBYoAz+nyQm0dB+iSNEj43CjWtW7aWYyEEgaczavNwSU=
Received: from PH0PR03MB6382.namprd03.prod.outlook.com (2603:10b6:510:ab::9)
 by CO1PR03MB5762.namprd03.prod.outlook.com (2603:10b6:303:90::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.14; Mon, 1 Aug
 2022 15:25:03 +0000
Received: from PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::98a5:50cc:d31:14b9]) by PH0PR03MB6382.namprd03.prod.outlook.com
 ([fe80::98a5:50cc:d31:14b9%8]) with mapi id 15.20.5482.016; Mon, 1 Aug 2022
 15:25:03 +0000
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@gmail.com>
CC: Stefan Berger <stefanb@linux.vnet.ibm.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] tpm_emulator: Avoid double initialization during migration
Thread-Topic: [PATCH] tpm_emulator: Avoid double initialization during
 migration
Thread-Index: AQHYpbLxUAnYIbcdQkq1gsikBuLW7a2aHKYAgAAL0KE=
Date: Mon, 1 Aug 2022 15:25:03 +0000
Message-ID: <PH0PR03MB6382596A32C135CDDBBCAD37F09A9@PH0PR03MB6382.namprd03.prod.outlook.com>
References: <20220801142725.815399-1-ross.lagerwall@citrix.com>
 <CAJ+F1CL=gvmHx-GTy8JHRfpxeOtu__i8Cta2hUobPg-wYb-FLA@mail.gmail.com>
In-Reply-To: <CAJ+F1CL=gvmHx-GTy8JHRfpxeOtu__i8Cta2hUobPg-wYb-FLA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0d7bd62-e9c2-40fb-1566-08da73d201d1
x-ms-traffictypediagnostic: CO1PR03MB5762:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KY9FzDBLzeyPs0WuE+1Jpn6IUtHivM9nsc17ZlzqMoBZAROmR9eqGnYSlKLmuNk2ShBzVqvhi09hIXOp3hhC5miK1A23TGZqqTmnd1HrYxFa8BWU9gr2K7/DL6wrS6PHO+ONpEK/iQNEqt/Ewb0AUwI9uFcbCTcBMWPktgGBk62K5B8ZxFBPZnGZRxgyKs+c+HFqm9st5Cm0AXDCG/IhwZ/zDktQyKXR1COLTy7LCmv02sSfVyH9Sp8RZXEhpoTgkshhYkJJdtXU3G2IqxaJeuKwuHVsPhZ3sNJCZ72SQ4gqZFdP3atC5b99fbMkSqy4vW4FbboVZfaOom8XnXdhjtb82HXttVZ8Ic+e49xkyez8F2RI0NZeE6YtWCNegM78QTg95pi/ejhwglhetr6Tjk4V0UzqCtv8ehexbNADSgODbUEjdIpX5fV499DCbU9PKc2M5WWx7DtEieN3Y07p8nJQ3n0+qCzWk0j2FVKk/ovTaxSqJj5iyUDh8Qr4MKec2kh92qRfUwt1XhEcIu26CefaCOzvANehNrXPE7TJ7syXClLBQq0U8gkyozADpQVy5BHgdtYlvX1h7w9cc39bmkZLS5Pu4A9qEknaNsRrfxXbFNg6ncW5jBHyXppUvBGmfa4wkbn49YBM9e3vaYUhzDv7TXsUeHphM0ahg60Cf/winS55tpfJGEszsV1zYhLCK56BDPG7p9ThNLxvgODqf+q/2SlOK3nuJ2b7WkwKdiUptcToNsukc4Rx8Ehxzu/iTup+speWLcb6plc0SoF1fvh4j1MbrQwFxgkTcwxvehJguHxNKfomu3kALAaKNGSK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB6382.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(38070700005)(26005)(9686003)(186003)(52536014)(83380400001)(122000001)(38100700002)(82960400001)(5660300002)(44832011)(8936002)(55016003)(2906002)(478600001)(91956017)(7696005)(71200400001)(6506007)(8676002)(53546011)(41300700001)(4326008)(76116006)(86362001)(66476007)(66946007)(64756008)(66446008)(66556008)(316002)(54906003)(6916009)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?O2CGGyE/I9UabPfM8a6nJorWFf/Y2ztNLxzkVJZTfDh9XhySfAeE798urG?=
 =?iso-8859-1?Q?PfViagnfHOlcUhnEsa/UAxRh1tOv6R8XoISvnLH2Bj7Si4zcIT9pB07Huk?=
 =?iso-8859-1?Q?C0zlDKKnNHfoDbYuqcVjEoLgipNJ+ItAi2SeTVP94IfRhypJ7bq6Knwj6G?=
 =?iso-8859-1?Q?x7HSNnF4iETiTCw20U0txYxJAmQ7vargp2V+cJ9b3sK4WB9lSUUmPcRZw/?=
 =?iso-8859-1?Q?ooBb47/X7i+z49j98Qvd7rFS2qZK2hAYWTjImCgSwUglz8/6Y/YjjU9eaJ?=
 =?iso-8859-1?Q?EwZnli8lBb3dMrqx6/LHg0fS8xq/V+ysFQQ0R2nFa6CcLsJgLTsuR/vgE1?=
 =?iso-8859-1?Q?uTgfVEuayb2WuM9yWLAhJUTCUbo94rozUi8I7y0S4ScFwPi2YooRoauf0g?=
 =?iso-8859-1?Q?3wQu6ovWpNdAGq4tFZeqoLGIMKIpo+jzlYjE9Pz2H7ObAYi9CIUrsGu3fY?=
 =?iso-8859-1?Q?0OUmobVts3jy9Rwn3590oc41F4Okk5u+i7EhttTucsdC1zziPqal86/RA3?=
 =?iso-8859-1?Q?iTHTtms31JPNiUC68YlW4/28KiYbDeDQwntAC+gTD00Z3eqwifJS775lg6?=
 =?iso-8859-1?Q?/gcjkJil5rhnYCcGi3HM1xh6GmIzLcILjcp3QAa0VsuMJf6QnhOvgZjmEq?=
 =?iso-8859-1?Q?Wnrgdqa1qLaZc6NXGM5EGt6rFJJm1U8ApO5PQYJu97Df42Shr+gGkDb7d0?=
 =?iso-8859-1?Q?pBw6/DN8NBkdHODz2XGJwunnPufjFdvTebIFuSLeuSHADB5TLVNbgF/NFy?=
 =?iso-8859-1?Q?h96SCodsajxwIbca9h0o4rTCwadTqm1oF4oBvh74U+IODcbzApnq4V+ynH?=
 =?iso-8859-1?Q?T/0JU5nujOTaIU1ZKC7YeMuzsjcxLRcZQXvb/RKCbMorv6jiZz/DG+o7WH?=
 =?iso-8859-1?Q?/8FdrZm0mPjzKrK0puy5Rfd/bfaPTIQHg/rOXXYxkxGdqcxG1BN9LgPsFs?=
 =?iso-8859-1?Q?gB5OpInfKhmxIIA2zzTvmrk0Vk+T0jRnfTJI+btyUQmwsYCoeiR4Pp0pkv?=
 =?iso-8859-1?Q?eqCvDg67Ur412VbQLFbIn9Y+5TJeYJcQYaXFksOXa3Lr1cVt3F9GNNOAw/?=
 =?iso-8859-1?Q?8V9NTckZfcpJHEiS48y+h+BCrLOIC6WfcVcCWxnkePY3bAccwcKVphb6GL?=
 =?iso-8859-1?Q?xwhya7Gj/6p3X4R5ygbu1arSmdwEphSQF4GqNyG7VTlL85kc9F/tshbYN+?=
 =?iso-8859-1?Q?ShvBWXyyg8GuQWjAKWodaQvp790cXUqN2Zw58zEdsMuWsS3+0+WHiigQdN?=
 =?iso-8859-1?Q?QjUY0lhBK/8EzHn65rcJMFUOqfSWTA3QcP6d2TyYOK6ycXBsR95sBA/Xac?=
 =?iso-8859-1?Q?t2lKVkNUh1AgDmvdroty05akGKHNrpW8LTJodH2KvVGs0glgtnk9IGqoh8?=
 =?iso-8859-1?Q?c0tSd3IsbWSTvGSK7fkpUZpt74putK9egUr67WMVFv73/IM+1frb1laneo?=
 =?iso-8859-1?Q?2O0RSC69UHOG1molNobTo6sVWVhA8MCdTfT4uQ4w4XYPg9JwY5pnyYyFLe?=
 =?iso-8859-1?Q?X3Wy4ajdJo04ZE7u64CLR22rB0MGo1cMV1U2XHZu7uMP5CxN4YRwIk4zeI?=
 =?iso-8859-1?Q?oyMHlXfl6nJ9od9hBEQqV32Hu8RGBgYs7zpl17OBtgcaAta9IOP3lN+sO9?=
 =?iso-8859-1?Q?evgp4FhCf/BEQ2TX7/fGEARhbekrm7sK6H?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6382.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d7bd62-e9c2-40fb-1566-08da73d201d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2022 15:25:03.6996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y1VZGjGL/zqYzv/bU8nCkXgA+u/YYIffa4x5AW0v6sUDesb2Jw5RZN94Sp2NIhKEElbuwwqxLfZyOwef3SoTHKZI1Z3M490bZAAd8ac0Ljg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5762
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=205475a44=ross.lagerwall@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
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

> From: Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com>=0A=
> Sent: Monday, August 1, 2022 3:36 PM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>; qemu-devel@nongnu.org <qe=
mu-devel@nongnu.org>=0A=
> Subject: Re: [PATCH] tpm_emulator: Avoid double initialization during mig=
ration =0A=
> =A0=0A=
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments=
 unless you have verified the sender and know the content is safe.=0A=
> Hi=0A=
> =0A=
> On Mon, Aug 1, 2022 at 6:28 PM Ross Lagerwall via <qemu-devel@nongnu.org>=
 wrote:=0A=
> When resuming after a migration, the backend sends CMD_INIT to the=0A=
> emulator from the startup callback, then it sends the migration state=0A=
> from the vmstate to the emulator, then it sends CMD_INIT again. Skip the=
=0A=
> first CMD_INIT during a migration to avoid initializing the TPM twice.=0A=
> =0A=
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> =0A=
> lgtm=0A=
> Reviewed-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>=0A=
> =0A=
> There are no visible bugs/symptoms, I suppose?=0A=
=0A=
I started looking into this because swtpm would complain about=0A=
"tpm2-00.volatilestate" being missing during migration. This happened=0A=
during the first init because the volatile state only got set by=0A=
QEMU before the 2nd init. I'm not sure if there are any other=0A=
negative consequences to sending init twice (I suspect probably=0A=
not?).=0A=
=0A=
Ross=

