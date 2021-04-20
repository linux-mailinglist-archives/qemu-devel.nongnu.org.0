Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA43655C7
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 11:53:08 +0200 (CEST)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYn47-0007pS-TW
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 05:53:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <igor.druzhinin@citrix.com>)
 id 1lYn34-0007PE-Vq
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:52:03 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:10884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <igor.druzhinin@citrix.com>)
 id 1lYn31-0002DX-Kp
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 05:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1618912319;
 h=subject:to:cc:references:from:message-id:date:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N9fJbDgLGOngQziq23gVUBSC97A1kZ8gfRwwjPrXTCs=;
 b=di4jw137vicZx9m6ewmYtPSzbpoy+ArZVF7uwcBJyBEcZkJe9cwrnAmC
 astWCB655RZE3l2d4k+JlFAxXoFANYDbdSpCO6ej5RtklBiN65p9Urw5C
 IZIctFCe3du3TWmpY8ytM+b6u19xvZA9Tais/pRMLVU1jK/5undysVUDL k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: hz+oqp6Y5UDMSMeQHky7ukxusaKUPvCr+nVDCIwOYpmPjUFhZ7xCBrmNSrbv6xr/ao20ivPtll
 bu4vPntDQo6ZpMODkKunEXJH8tHbpz7oAd3f4lu31Gb2YC9nv5wLvZzTOOyjz97VCxykWvbQl4
 iYJymfwwBnyut0PMlt9B0VXfsNwhM1mqVdnWP6e+ZfRi9pTQQwkyXjO8X+zEJZ5xYpp/LC/WDO
 0IvhJxursKSx2GxDCAG/arQu77XNDfmtBv6NJKS2jSGgjsP5M/MXaE6QgmER9UYNxn+qW5K9pb
 AAU=
X-SBRS: 5.2
X-MesageID: 41958512
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8bZDpalXECVSdlVqeRMJvuUM/QvpDfODj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW57LLA+E4
 eR4dcCgjKmd2geYMjTPAh7Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLQ9n67Ek7G
 TDjkjF9ryu2svLtiP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUbZ5SspzYwydvfkWoCsN
 6JmBs4OtQ21nW5RBDJnTLI+y3NlAkj8GXjz1jwuwqQneXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znms7UeNham9azhQmkW5unYkm+II5kYvN7c2U7NNsZcZuHpcDZZoJlOI1KkcDO
 JsAMvAjcwmFG+yUnaxhBgK/PWRRHgpWj+JTk8e0/blqQR+rTRSyksVw9EnhXEQ9J4xYIks3Z
 W1Do1Y0J5JVcMYdqR7GaMoRta2EHXERVb2PHuVOkmPLtBIB1v977rMpJkl7uCjf5IFiLM0hZ
 T6SVtd8Uo/YVjnB8Gi1IBCmyq9AVmVbHDI8IVz9pJ5srrzSP7AKiuYUm0jlMOmvrE2HtDbc+
 zbAuMVP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5urWN4zRsPDBevq7HsuvLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmPl+5ZdF7Xb4vgzxIABOpYkiHlQtX2JouWwbRFSuK0/e0
 VzZJn9lLmgmGWw9WHUq0VlUyAtSXp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1taR8PSGw
 hPmkRv9cuMXtqt7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KZo6RqprF0HuGwZukQhn7E
 dPATV0BnP3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAG7vsEgRnwSWha0Ss6JiQMSRz5Z72
 cBtpM3sf6lo3KCOGE/iOM3PBlnc2KMGo9LCwyDecFpgLzxQRpxSm2LnDSerBk2dgPRhhwvr1
 2kCRfRVeDAA1JbtHwd9qrx6lt7el+QeF9KZmlgvZdwEnnHvXhPwfaGD5DDple5Wx8n+KUwIT
 vFaTwdLkdVy9e72AW8tRyCGX8lr69ec9D1PfAGSfX+y3mtIIqHmeU6BPdS5o9iL82rmPQMS/
 ijdwicKy7YB+sl1xeOnGssPDB5pRAf4KvV8SygyFL98G80APLULlgjeqoSJMuE6XP4A9mPy5
 d0gLsOzKONG1S0TuTD767ZbzROcEyO5UG3SvwlspBSs+YZsqBpE5zSTDvP0zVm0XwFXbHJvX
 JbZJ4+xrbLfrJLVYg1XQly+1IyjtSBLEcxqGXNc6UDVGBoq0WeBs+D5rrDlKEmDUKArjbhIF
 X3yVwrw971Gw+4kYMAA60+IW5qeFExxXRr8uSFbZDRAmyRBqh+1Wv/Fn+2a7lGTqeZXZ0Wsx
 Zh+tmN9tXnOxbQ6UT1vTFhJLhJ/HviacSuABiUEeoN19ChI1yDju+L58G05Q2HBgeTWgA9hY
 dfc1YXYdkGoj4+jJcv2iz3c5fJmCse4hBjyAAisEXs1Iig6HraGk8DETSxuOQmYRBjdl6Sjc
 rE9uCE0m/a+zYt4+iZKHtt
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; d="scan'208";a="41958512"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyGpvH/lK0yNVnJ5TTwnmSkhGsZbuwe9tXm2mLFBx1csg+hxFXbe6IysDRkTIfV56vxK0MiSMySHwDzp+9To5sLvmeKUz1rrHh2mnnp93DFvmeQCc87Q51SoC4LSZ9J6irwfVqgCxUwIRbeFZ1EQRZTFUzDUR5SfpaaLTG7BX+EIMI80oifkpLzbY0HJDL5y4Uz+n5DRTZnK9tUWn066tm6VTpx6Sy4SGdKy4berC12PCkwGuGPwaT8ovM3fBpqaJWQhaCLjOFO6ruhX8loQsoB+433BqpThykJIoBhJdgs5WTL3DyZuzE7eR1VkxIZiMPsV52x95sH7JgIH9ajI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xhBfndjzOI6Bx3CmiqjD1VqkS8zdHxSFSRNYVPhurQ=;
 b=IOvQGzqg3SjBYsL+MOYAlaca9PIbzBoFrQy+7TxbBk8J4oP3+/mh4vgMwehJakeLziVAidq+qfN8fQk/l3di3xBg8iYejgta8BExxKH1ZID8kRYMe9OID8myYNa5akYMjn5Vqusw/OZw7r0MIi6ZGzREO5RX2nYK3+5NPGxkfZA9u31xsGrhMit24y9yOwHYylxUIN7TBfkIt8YnLEZ5gqFT/N13Avtd7vLiCBVL23duNrPVCCnswhjzQlwpxzPd0FLt5Mq7GhvSfwXUXrH35r+YoH/C59xHeEMVcwzqK82D0EHF802yUqK5eh1LFz3WHLO7N650tzQpfLW6k2XvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xhBfndjzOI6Bx3CmiqjD1VqkS8zdHxSFSRNYVPhurQ=;
 b=IBHyxred1QuV3+QJ+R52XvhgB/6Pcf+jm26wOchFZGQV12umLk3NbjxBDsTW859H4N+W/JS6syMhgF3x2zDpEGR04gRPiPcgdhr3zfde44Ft/rCOwUrOO2bD+Gk3HU759RSy22tg1YvSY8uAWSG7lwHx/mq1hqlOu2HaGpeZzos=
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
To: <qemu-devel@nongnu.org>, <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <paul@xen.org>, <mst@redhat.com>, <marcel.apfelbaum@gmail.com>,
 <pbonzini@redhat.com>, <richard.henderson@linaro.org>, <ehabkost@redhat.com>
References: <161888998361.15979.8661085658302494664@72b6d80f974b>
Message-ID: <91dc07bd-fc34-56fa-4c3e-684626a2e8d5@citrix.com>
Date: Tue, 20 Apr 2021 10:51:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <161888998361.15979.8661085658302494664@72b6d80f974b>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::8) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26859240-e944-4bf0-74a1-08d903e1ec0d
X-MS-TrafficTypeDiagnostic: BN8PR03MB4756:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB4756E01AE6DB4AE522DFC4FAE4489@BN8PR03MB4756.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JxRTskovc5TcabncqQX3uMCq9gPfaI65AC3+14D6/2WH57y+qObjkS0XzWbKovJhQt6X1z87WbbU27PhyZtLmw7NiAAJ12iK2w2oFF8RKRvauTvUJYqstNxgugUPYaAszKom0hZAi3xSpyCVIU0rQwSt4JEtaMpiaTRKUaoeA6tsbslSbftLPCYpc7L/gc2q3lQGpHmHJdQfcWiu3npbrGFJLyUUA2Jf/5P2BvW9lgN3MiC2YEB20QTHh7mqEVISxLMsoEqfioIeG9UxYHCy74iVAo3QRn6npbWnQnJVuBH6Kk9IaN3600ZoFDOxyEUhu+GzK8i+rXCzu0FY6/5C5/ky6bjEIKuIrIiCAvGtAv64J6w2bp/f7LJcOf/3UhxaFaSCFtu3C2tx8lIOkGAbJoqyhX2TbB9PrFI1Xud0sIDCEJhzibNjLDf/yoZM7jjBhWP0lYDvQsxyLPhLetr4+jvbd1LSredOXUCmkKWdsnvJg/FiBenQbuf4w2AX5cy/ObgYwOINHddxv+1pwa0ODbzzXUvKrjmvIL0j20tdcNU+o13yYAMYrQX9eiHKk/BKnhxpaj+VlBIlwl65XW+zLbmAfa+hjSEz82rUZiI17vq3J4qOpb/Dy2h0+VfxToHNpXcxWiad0VKIgfcBuZjZh8RbqR/uxipG2BrKx4SGYRv+stQvFNUIJApOdboTuo3C/z2iX8D5InSU0zS+8fdGqHYLt9Ofl6VN6UHB46ynESAsS3ykqdi1XKRst9GE4yWhirGg3nbSpt/OwCf154kwmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN3PR03MB2401.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(66476007)(8676002)(66556008)(66946007)(83380400001)(956004)(2906002)(31696002)(6666004)(6636002)(38100700002)(316002)(8936002)(44832011)(16526019)(2616005)(16576012)(186003)(31686004)(478600001)(6486002)(53546011)(26005)(36756003)(4326008)(86362001)(966005)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkpKUStDc3pyZ3drdHVJeTloOUJ3R3EySlhRNkM4UjY1SmduZlNsRDJyT2xx?=
 =?utf-8?B?cnY0MkpZVzJCaWZwM1o0ME5nTnpJaGJwZkdySytQQk4rUVU0UVlLcHM0ZmI1?=
 =?utf-8?B?SXIwNm8yMG5XMENiNitjb2VkMmVETXNpWjcrWFIvMGtjRFdUUHpNdEdpMlJ3?=
 =?utf-8?B?L0tBaEVkUVFCUU15WlpINjJMTUI2blJyNFBLMTZmclFYcVErUmthdjhLOXRK?=
 =?utf-8?B?NDFDazdnSUs1YjQrMGh2RzlDSWNWcURldWo3eU5sK2xSSjdSOEc2NXZ4ZUdP?=
 =?utf-8?B?ZElRUEJRQ2V4eDQvd0JJNUU0eGpZTkppYzZTeG0zcFNpSnMxN3NaWHMzdVVY?=
 =?utf-8?B?b043UHpLQjArVnpGSmdVZUtIQmpES3BHeWVtNUtiMXNHeHBMWmpQVE5rV3RW?=
 =?utf-8?B?a0VmanVibU96dm1UWjQzK1hReTZLSDlsMVdFbC9KMm9Ba3JLa0ppVGg0WVVX?=
 =?utf-8?B?S2FXcHRWNlZscFI4TUtVVEhyL3JWNCtpUVZIT3JJMFBtblhURUtZNE96My9U?=
 =?utf-8?B?d29pZUFhbE5lNmRNaDc5eWt5UTBrdEFnZU1hQWhDWGRMYjJNNUMzZC9wVGln?=
 =?utf-8?B?REUvbkJSTkdMeTMzdXo2K1lQalp4S3BSZEN2dTNDUVpQMnZvdEhrRnk0L0k1?=
 =?utf-8?B?ckYveEZsZUZQSHIzNWtDMXoyNFVsNFB0ano0ZVlWVEQrTWtvMmFNK1RncmQ4?=
 =?utf-8?B?ZUZEOFp4VjhBWHFpM0llbUV6ZGlLaWIrdVYzd1ZleGlQU2F6dFNCQmw1VzAx?=
 =?utf-8?B?NFIvanZWZjEyT3YyS29aTnFLQi9meGI1ZmhkWi80WVc0Mk1aaEF6YlpuVkxj?=
 =?utf-8?B?b09IMmxsQTErMmFCRWlEQXI0b0t0NTRWTmdGbTlIT2I4ajFwYVBVc3lZd1hl?=
 =?utf-8?B?a2U4c2s5VkR6dndZM0NWS1FHUGtHNEFGNFhrZnNvT1p3MHlXUEJoaHFVTmdF?=
 =?utf-8?B?RlRzRlJCKzkzaVlEWEMxYjlRSG1VM0NrTGNQN0tvQzY0bk1Qb2h3Ky9IbVBL?=
 =?utf-8?B?RDlaV05Tcjlwd0tBcDNTUHVhbmY4WnRnbVd6eGJiVWFIYWp1M3JOcm5jaHd5?=
 =?utf-8?B?ODcvd1EyRTJSNkczdGE1Nkh1WEJZNGtXUjlXalM0Rk9MekdBdk1XNTM2MDdG?=
 =?utf-8?B?TW5scU5CT3BOTWZKUlB2QU5Mb3RHalNWdGhUZndzSlh2QU1rZ3NKa3N2L3gy?=
 =?utf-8?B?TTU2bG0wSWF1STVWNEMxVWhxTTlyUXdlN09teHRpOVVXWjVleFlvZmVFUkIz?=
 =?utf-8?B?Z3JmaGVxMlE1YzRFdFRTOEhudVpMV0preXlzUjNXN1VBWW80ci9uUkxoL1RX?=
 =?utf-8?B?eHFvWVhDdFlnemY3aFRUSUhyRkd3ZS9CNFBEc2ZHWlVhTTN3dkhSUVExNVRQ?=
 =?utf-8?B?L1JOM0NqMit4Wnp3NTN2T0NEMFdYMmgza3JpeitNNDdqU0U3L2R0Yy9UQkxE?=
 =?utf-8?B?UkVGL0N6K29uWkw2N3A1TTAwRk5zeXU1R0syYmUwSVJXMnMzUVRMdGVwOEFJ?=
 =?utf-8?B?cC9aaUZEQ0Y0emw1RkllelplOE9vTlIvRUZoSWorZlRKT2dBTVpjWjJvNysw?=
 =?utf-8?B?ZGNodHVtcjMyN2NWcG1QVnIvYXA0SWxJejhqU01udW1tb3pwNGRra1ltcWRl?=
 =?utf-8?B?S0NVc0djV2lxSDZFRFVEWWUvZHUzaE00cDhxZnIxL2xmbXo1U2lWeUE4V1NG?=
 =?utf-8?B?Tm5hYjAxNTBwOE14UkdlVy9NR2ZneHNYQTVGbWtjQjE4UGRkOTdibGRtNity?=
 =?utf-8?Q?trr2xyV2tBCuaYEp/b6pZlTsdIVOWsazKAcqJrq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26859240-e944-4bf0-74a1-08d903e1ec0d
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 09:51:51.4024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I5deqkWI6obFmvDUIRrF60TEZtHoJ2Q1A9FynKLDQlJWonJhOcnebyW42VvauNbeVHnQVXXqnrLGKI3x5po4CxQu3PotG/DOBpcc+2tqlcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4756
X-OriginatorOrg: citrix.com
Received-SPF: pass client-ip=216.71.145.153;
 envelope-from=igor.druzhinin@citrix.com; helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Igor Druzhinin <igor.druzhinin@citrix.com>
From:  Igor Druzhinin via <qemu-devel@nongnu.org>

On 20/04/2021 04:39, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com
> Subject: [PATCH] xen-mapcache: avoid a race on memory map while using MAP_FIXED
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>  From https://github.com/patchew-project/qemu
>   * [new tag]         patchew/1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com -> patchew/1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com
> Switched to a new branch 'test'
> 3102519 xen-mapcache: avoid a race on memory map while using MAP_FIXED
> 
> === OUTPUT BEGIN ===
> ERROR: Author email address is mangled by the mailing list
> #2:
> Author: Igor Druzhinin via <qemu-devel@nongnu.org>
> 
> total: 1 errors, 0 warnings, 21 lines checked
>

Anthony,

Is there any action required from me here? I don't completely understand 
how that happened. But I found this:

"In some cases the Author: email address in patches submitted to the
list gets mangled such that it says

     John Doe via Qemu-devel <qemu-devel@nongnu.org>

This change is a result of workarounds for DMARC policies.

Subsystem maintainers accepting patches need to catch these and fix
them before sending pull requests, so a checkpatch.pl test is highly
desirable."

Igor

