Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3068DD9C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:10:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQWX-0006Vt-Vh; Tue, 07 Feb 2023 11:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=395e4e3a2=Jorgen.Hansen@wdc.com>)
 id 1pPPVV-0006cG-VP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:03:41 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=395e4e3a2=Jorgen.Hansen@wdc.com>)
 id 1pPPVT-0006Z7-9O
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675782219; x=1707318219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=feBfBzi88O5qbVRs3B01oADkw78VWHj8Wtr8T14DgVw=;
 b=rubIFKFeeGFCKsgTvQiREcJ/vvDFQ2oYHUdaAobrzIGIaesAXsK54lSN
 RQz7yv2NH3PE3yQpPIy4ifY/kMZ42o6eydrt7/8N9gz158FkqhNTCCWny
 w32DGMxOCA0Tcl6WIGNbJyomoph0htOhIwUwvdqgknuNdFaoWbOuvA5Yw
 9hGw+RFfjjEcr2rPT8o2XhLsEfHIBBBmIUB4mavT8pl+BqFQV7MoNfRNA
 OZ6GVbFmQe/bx2gKfXr3s2o2ilk8IGxoXGcaEmhX7t6GAP2ICj+2W4l95
 GshYlX758cDoJRE6FIUSUIDdpKqHgi8kV2SVW6JkODVMTrYK50w53FJ63 Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="327016585"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 23:03:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m61tKnu3xxA8QDN8ftFpF6okcJiW/89fuA1YDF0AcKc0/Sp3uDQyTgs5bATakeDWOfJmKqvCtk5yRAmHpwdB9bvj7FjNnVc5p4UXTVQC2wUUWG+WPQ6BkzS8ks4yU7K+vYi/RxtlGuKeZP/PCFWgYxo74DwIdpwOK1hsOQPSlIx3XipW0MdZ5TM+Y+xvKxkE6+N8VfGslKM9WNriyVOH7gY5HzWO+P5PlHn+c7TaIXfha/JKgfwW3elC19JYWDrX61U4+6Nkr/hE9NyklN3FM/a+atAufXRpIr8Uyv3bBOjttMhNODodO/FLAeqNhQfPu22Imr/jCkSk/zz6U2+KXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feBfBzi88O5qbVRs3B01oADkw78VWHj8Wtr8T14DgVw=;
 b=CyqTOTHrcAyQ9JXN6yKIEX6t1t8GBluA1Nzn4b3IGpfrTDL30a/ayoHz6JOG5wvytSB89m31H0ojUznXLwUeE9m93t0gEG4IR24x68FdUmZzGfvb0/B52QzpdehmdNwke6WrqqIzuWrlCEqlA9RIzmCUmBUMwa3xeuIAUZwPEKS1oLkLlnuUlyDmzhVDFBbOKR3VqoUVxwV8L2alE4AsBJC+nTKiSd67tiXXY/ALhropCFkkedUivf6qYhTqLtBdVe0V4m7xqIVhLouFexq/xmC1GuM/ttaVfxJKrrpbV1s4uignkjNMalL8a0XtQpfLcNPPGEOpmp4Up0UvhFqs4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=feBfBzi88O5qbVRs3B01oADkw78VWHj8Wtr8T14DgVw=;
 b=EXUEH17loZnb0Gtp2744fPr4eZdNgnEc/I26eSMmcEUaZwjl0LdnLZhQETB5KlGUBQz13OsLFxbuxsEfxwemtLOTSqWLnyM0qI9c88VNGbDuJFYyNsX3aF5PeF37qV1bm2JrXPOWjZ+9Uq7tZh7hdUv+1yGlIf4rYExlvuYRFrY=
Received: from SN4PR0401MB3582.namprd04.prod.outlook.com
 (2603:10b6:803:4c::10) by CH2PR04MB7013.namprd04.prod.outlook.com
 (2603:10b6:610:96::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 15:03:26 +0000
Received: from SN4PR0401MB3582.namprd04.prod.outlook.com
 ([fe80::c560:f7c6:f429:a852]) by SN4PR0401MB3582.namprd04.prod.outlook.com
 ([fe80::c560:f7c6:f429:a852%4]) with mapi id 15.20.6064.032; Tue, 7 Feb 2023
 15:03:26 +0000
From: =?utf-8?B?SsO4cmdlbiBIYW5zZW4=?= <Jorgen.Hansen@wdc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "sidneym@quicinc.com" <sidneym@quicinc.com>, "mburton@qti.qualcomm.com"
 <mburton@qti.qualcomm.com>, "bcain@quicinc.com" <bcain@quicinc.com>,
 "mathbern@qti.qualcomm.com" <mathbern@qti.qualcomm.com>, Ajay Joshi
 <Ajay.Joshi@wdc.com>
Subject: Re: [PATCH 1/1] accel/tcg: Allow the second page of an instruction to
 be MMIO
Thread-Topic: [PATCH 1/1] accel/tcg: Allow the second page of an instruction
 to be MMIO
Thread-Index: AQHZOmKTmmtPJubuNUuoZx42PLCri67DleKA
Date: Tue, 7 Feb 2023 15:03:26 +0000
Message-ID: <6d68b400-7aad-d62b-1754-8d80960725b1@wdc.com>
References: <20230206193809.1153124-1-richard.henderson@linaro.org>
 <20230206193809.1153124-2-richard.henderson@linaro.org>
In-Reply-To: <20230206193809.1153124-2-richard.henderson@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0401MB3582:EE_|CH2PR04MB7013:EE_
x-ms-office365-filtering-correlation-id: f76ef4ba-9ce9-4e6e-4f1f-08db091c7728
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jKQSpUTT/Cc8fCpE4JlNqrS7ZCnJR1a095qzl4L5GMe6ifmrLIApI7zXILlUPho12/d96oNztQYLJWznbq8KQ4zjFTq1VJyW0M6jlayU9Yp2Bh2JCuSovRE4lg/t7C6XtdMy3fRyzscCGykqicNRApV7nvVNDmSDgKR0nTxAarGPgogjODPyoXGS+1noVJqxvk9OKboUa/s39jp17ChULYeRtb2kFhv11MK77irigW90F+4r7hkCcuIPLoeXd28Xq8X5mCPPUsEhA6TSq8mNj/JNcqMo36UEolaTAE/vONR/kKzK5AuoxITDuMG7wo/G3jFIJ9P1B9cvoraAwFWQPW2sfZqWG5lwL4YXHqoT35K+fv9q0ROXdgu6J+XHIkhelXh1CGitoLN5Q8CLCNCSHJ8Uluw/VCSonhFwHdYWIur6Ogyg5UHDH2z09mB3MisEwBkcvLvPLZx0gV9NDlRY7Zhaw1xAUG24eK0LmEo//lm9RyF3AW17V2M4s9hyYpdRMP8oiwe3SlVH2Aw909e/OVCeDHoBGVq42Y0BLcbpiCy65Iq9ojFrry1tbcwwb61yKOb87h0/yqT9iiGlhQV2NjBiBQ3GmLY5nKyvxjpdNaGt2fT6+ZYuP5CMdE3VdmCLCNSXyXpifWPfJFiObb+ww75YhuTbwoujWZ+Tn89bNxtYFFy45wxrcO3ec5lNmAJL9EydcRDSwsnJ5xIglTSElKD/qT//fjCMzbe8ur77Lt0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0401MB3582.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(85202003)(6506007)(6512007)(85182001)(186003)(26005)(53546011)(36756003)(122000001)(38100700002)(38070700005)(82960400001)(8676002)(110136005)(54906003)(316002)(5660300002)(41300700001)(2616005)(8936002)(2906002)(71200400001)(83380400001)(76116006)(66476007)(66446008)(64756008)(91956017)(66946007)(31696002)(4326008)(66574015)(6486002)(86362001)(478600001)(66556008)(31686004)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUZYeVRJMk45NWQ3TDVwWGM1L1RreTFONVlCZEFMUkg2MzlaRTFMa24zSUw0?=
 =?utf-8?B?cHdraWRHSnFuYU9ybG9WS2tEa3R2UkhDRWp2WjdkWkVxUVhtOG92ciszWENk?=
 =?utf-8?B?MDR0T2haRGxzSmtLUHBkZTRWVmJRcVBJN2RoS1EyQ0t5YkVmZXRDTWxwY3Ar?=
 =?utf-8?B?cnNIT3h3WW5uaGdQR2VvaUFiWUxYVjd3aXM3TU1vRkVWeHVLc05ZcFZNWGRH?=
 =?utf-8?B?ZnFoWXRNWGdldkt3ZDd3Zzdjc1hpVU5mZEFOcGIvZ0FmZ3E5MTZ6SFhoOU5X?=
 =?utf-8?B?Y1NBY0d3aHRsT09Jd2xqQ3hTZHlrS0pEVEpLZ29EaExFYzVYOWpjOENmSjk3?=
 =?utf-8?B?akV3V0FrOXh2WWNHcGtpUVI3bXdXQkVsOVZiUFJBMmNSMXArKzJQa0lteW95?=
 =?utf-8?B?bzhUYWVKYzZYdHNvaGFkVGo5SmpzNnI0UnZHamRSYXN2aUtJOEZURU1JVkpO?=
 =?utf-8?B?OFJxQkFIZFUxTndjQzk4MzVvdVh3aDZEblUrNEpENTl4RkFRNit2WlQwbTJZ?=
 =?utf-8?B?bk1acVJXeVUyTTZyWXZESmJhbE5LblR4ZEpsOEh6Rzh6SHZSR3lOZnZ1YnZW?=
 =?utf-8?B?ZFVlRmxiUUdqanZXQTZZVy9PSTRvQWtxUnI5bUhCdUN3VDllRUJVWmYxc3pm?=
 =?utf-8?B?Nmt0YmVJRFhWNHgzWm5SVVJVZ1ZDWjNDVzZ2RXFkYTM1clJQUjkyMUFOMVVO?=
 =?utf-8?B?ZmhEL3hrYStqMUtPa3VBcHZuOUtRQnRFem1tNFpNSWcxWnUxYUJvNmJVUXVV?=
 =?utf-8?B?VnBsQ3RlYlorL1NzK3hoc3FvajNTb1phK1NPcmlXUWpBYTFDUkVxSkVNK21S?=
 =?utf-8?B?ZXpUR1BRalpjQmhqTE44NytFSXZ5dU1Tb0pTUTQ2aW5RM05Ea0hoV3dRYlY4?=
 =?utf-8?B?b2RYTC8zYnZTdW5lYTRnWDVNZm9Ca1NTT00yemdYaXRUeUNHUHpwTjZ5blJo?=
 =?utf-8?B?aTRUSmhFUFM0b3VQeUZDOHRWa3VDUEwvc25vbTV4KzdDWmFIVFpsZ01Hd0tU?=
 =?utf-8?B?TDFlakh0bXpIMTNjbmwwMnYrWjBZT25NbGtxTWh4cjNWanV4MmtycTk5dkRB?=
 =?utf-8?B?TXRwSzVWd253ZEN1Z2oxLzhzS1lLeDA2REhqVmphVEpucjlyci9pcTgvM3Rk?=
 =?utf-8?B?bkdBV1d1dGx0RUIvUW9KV3BlOFNFNnJySEV0ZW15aCtCTnpFTzNSYnUyNmFX?=
 =?utf-8?B?VTJHYmZuRDdOdmpMMXFQTmF2Q2JtMk5aUDhmdjVWRjd0ajg4VFZiT3MyTk9P?=
 =?utf-8?B?V2NJcDhrS0pTdFhscHlkUWxOWXdYWDBQQjBSeHFMRUZiVVMvaG5nVjhNL1Nm?=
 =?utf-8?B?WGxRRWVCTHQrZEd0NEdoeEpjVHNhSTh3Uk9EMjM5cHFBNjMvRDc2WFduMlRU?=
 =?utf-8?B?RlhKcVo5WExwSCtrNVdkbklBWlo3S250V2tNWmNwdkdycWs3cm1QRkVXYnY3?=
 =?utf-8?B?NC91Vm52RDNKci9BL3hqaHd3UDIxL0RiV3RNQkFrSFV1NXc5RGhnZHgrUVI4?=
 =?utf-8?B?QUlGRlA2QkV3bUlOL1B3SmpydGMybTRNV0JJWkNiM3ozTmVyM0E2N25rdWND?=
 =?utf-8?B?MFB6d3hNdlVsVmxaMm9Ec2NoWWlLZWRwc0poNW5rVDlZd05aVzIwakpncktp?=
 =?utf-8?B?QkdCblZzZU80ejVsRExKd092U0tDQzdlNFpyMjFNT0c2R1paak8zNEwyRmd1?=
 =?utf-8?B?Tk11bE5yYW9ZblFpK1VwUFJKUVRDNGw3Q2kvQy8vUFM5UW1IeTd4RHFpdVd4?=
 =?utf-8?B?eDlQNGV0TDJJT2ZRb0wrS0hMMUFPNHZ6NFpYbE9ybjVQS0NnVjZOV1pTRGR1?=
 =?utf-8?B?dXhQckJJU3BicTZJTEpkRFRhZXd3UDROVlI4N3d4WThSdlNzTHNVd3I1dnJQ?=
 =?utf-8?B?eVdXdTZYV0FaaytWZkJPVEYxY1J3NGFQWWl0Q2gvZ2hpSEs2UGhWY2tFQmk5?=
 =?utf-8?B?L1JnZUlwQkRBVFlETlN0MFRlMUtsdnAyNGdqNlNCcjFlTk9WVjVxMHREejZh?=
 =?utf-8?B?RHF5eDRkcm1GaTduMmpwZ040QzdlZ3dmV3NrOThENnNaMHVMUzgzdVhQRnVV?=
 =?utf-8?B?TUdXTVRGY3d1Z2NGaDVMSHI5UzNjbTBkSlY3K295akJyN3lNTkEyNGh0ZWZQ?=
 =?utf-8?B?cEZDRTZiR3VlVGxoR2VzYm1xZ1VyRjI1WXJHbzRNSUhnbndrVkpwdnNpMGFX?=
 =?utf-8?B?TkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8DE53CA93B17F409575141045200E32@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NKLhjc6AXmZn7kN8WJM4zNG5Xnf/qgsdoevasmkqD2JGceMntpE6klHekGoAmABhYMf2OQloOXgnQtHnz6KEBF5UQMglC3Yokvu6P1WDaF1khYud2HvZtEocTkk6KUJBInfnqHLNmfZ9M7SruTImz97a8iUemg265NGBhumAhN++MBgWM18purTA9Fomt7XLLU+iMIoLe9GfNpbYj7aAEnyo+mQadNPyYmZHm3cjQyCh/Bcw9N9wGRPs72J6451IrcGrl8SKCX7KTfc/Hl8D0l9p4QAW+EEeTn4q6/YKJxTEqSNB5fovmNIWSNIt1mLIMp9ngqEWc/xaIj17JxJM2fxDqdlkJzIwAnMaMr+ztu9ph7ySHsXV6ShfY28N/5UUx11ZtbWMZbjtGJ9abfatCP0Hr0acXhg3bIfAiPb8aVFWBFZmzH/xSzyHlu4Hs2EybV+dBIx+4GKsNSGvt2PgLb2fCsDB4VRNxjSQyFfF+Bs0Xb1JFMlqU2wr/JSaI1v1zfWOOcr5v8moAcgD8SN/EWICe4ZviKq1hzkY/5+phOJhJK0wxj3/SiuiyLGK7yKzJOmc4PYqJq291Me3GKBpHHolAQ8XyLjacASRs9f4MEpFw38kHT4MnX2Te+dOWf8JEey0xVK6jiB8tCPVyWfsih3CsZETgYOf18mkyWCVxXQj17Ag1ozz9bfONVU73y2bc/5UPG8bBeYOXnQKc41buq+G5BB6TQQS837fxjqmzy+hFuITY4SY9u9NNaB6UhqlBTb+rWq7AxwumRaHYtsVnNns/TzADGpWoIKNdKQSyBehwK4uZFMUzX30jHlaCa8/mop3trKufNL6e2DJrYxgK08i+9VQwiFleqq6k4HdCc3vcT+2Cbz0H9jUJnHvcZ1G
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3582.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76ef4ba-9ce9-4e6e-4f1f-08db091c7728
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2023 15:03:26.5296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4KmAvk0P6V/9hHNAKAekahQYF+mxdTKVoBvr58FwjNoOJvmUnvTLABTCy4fw2LBe+S5JrRf0lnNEXVmUdtsd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB7013
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=395e4e3a2=Jorgen.Hansen@wdc.com; helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 07 Feb 2023 11:08:44 -0500
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

T24gMi82LzIzIDIwOjM4LCBSaWNoYXJkIEhlbmRlcnNvbiB3cm90ZToNCj4gSWYgYW4gaW5zdHJ1
Y3Rpb24gc3RyYWRkbGVzIGEgcGFnZSBib3VuZGFyeSwgYW5kIHRoZSBmaXJzdCBwYWdlDQo+IHdh
cyByYW0sIGJ1dCB0aGUgc2Vjb25kIHBhZ2Ugd2FzIE1NSU8sIHdlIHdvdWxkIGFib3J0LiAgSGFu
ZGxlDQo+IHRoaXMgYXMgaWYgYm90aCBwYWdlcyBhcmUgTU1JTywgYnkgc2V0dGluZyB0aGUgcmFt
X2FkZHJfdCBmb3INCj4gdGhlIGZpcnN0IHBhZ2UgdG8gLTEuDQo+IA0KPiBSZXBvcnRlZC1ieTog
U2lkIE1hbm5pbmcgPHNpZG5leW1AcXVpY2luYy5jb20+DQo+IFJlcG9ydGVkLWJ5OiBKw7hyZ2Vu
IEhhbnNlbiA8Sm9yZ2VuLkhhbnNlbkB3ZGMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBSaWNoYXJk
IEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz4NCj4gLS0tDQo+ICAgYWNj
ZWwvdGNnL3RyYW5zbGF0b3IuYyB8IDEyICsrKysrKysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Fj
Y2VsL3RjZy90cmFuc2xhdG9yLmMgYi9hY2NlbC90Y2cvdHJhbnNsYXRvci5jDQo+IGluZGV4IGVm
NTE5M2M2N2UuLjFjZjQwNGNlZDAgMTAwNjQ0DQo+IC0tLSBhL2FjY2VsL3RjZy90cmFuc2xhdG9y
LmMNCj4gKysrIGIvYWNjZWwvdGNnL3RyYW5zbGF0b3IuYw0KPiBAQCAtMTc2LDggKzE3NiwxNiBA
QCBzdGF0aWMgdm9pZCAqdHJhbnNsYXRvcl9hY2Nlc3MoQ1BVQXJjaFN0YXRlICplbnYsIERpc2Fz
Q29udGV4dEJhc2UgKmRiLA0KPiAgICAgICAgICAgaWYgKGhvc3QgPT0gTlVMTCkgew0KPiAgICAg
ICAgICAgICAgIHRiX3BhZ2VfYWRkcl90IHBoeXNfcGFnZSA9DQo+ICAgICAgICAgICAgICAgICAg
IGdldF9wYWdlX2FkZHJfY29kZV9ob3N0cChlbnYsIGJhc2UsICZkYi0+aG9zdF9hZGRyWzFdKTsN
Cj4gLSAgICAgICAgICAgIC8qIFdlIGNhbm5vdCBoYW5kbGUgTU1JTyBhcyBzZWNvbmQgcGFnZS4g
Ki8NCj4gLSAgICAgICAgICAgIGFzc2VydChwaHlzX3BhZ2UgIT0gLTEpOw0KPiArDQo+ICsgICAg
ICAgICAgICAvKg0KPiArICAgICAgICAgICAgICogSWYgdGhlIHNlY29uZCBwYWdlIGlzIE1NSU8s
IHRyZWF0IGFzIGlmIHRoZSBmaXJzdCBwYWdlDQo+ICsgICAgICAgICAgICAgKiB3YXMgTU1JTyBh
cyB3ZWxsLCBzbyB0aGF0IHdlIGRvIG5vdCBjYWNoZSB0aGUgVEIuDQo+ICsgICAgICAgICAgICAg
Ki8NCj4gKyAgICAgICAgICAgIGlmICh1bmxpa2VseShwaHlzX3BhZ2UgPT0gLTEpKSB7DQo+ICsg
ICAgICAgICAgICAgICAgdGJfc2V0X3BhZ2VfYWRkcjAodGIsIC0xKTsNCj4gKyAgICAgICAgICAg
ICAgICByZXR1cm4gTlVMTDsNCj4gKyAgICAgICAgICAgIH0NCj4gKw0KPiAgICAgICAgICAgICAg
IHRiX3NldF9wYWdlX2FkZHIxKHRiLCBwaHlzX3BhZ2UpOw0KPiAgICNpZmRlZiBDT05GSUdfVVNF
Ul9PTkxZDQo+ICAgICAgICAgICAgICAgcGFnZV9wcm90ZWN0KGVuZCk7DQo+IC0tDQo+IDIuMzQu
MQ0KPiANCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcXVpY2sgdHVybmFyb3VuZC4gSSd2ZSB2ZXJp
ZmllZCB0aGF0IHRoZSBwYXRjaCANCnJlc29sdmVzIHRoZSBpc3N1ZSB3ZSBleHBlcmllbmNlZC4=

