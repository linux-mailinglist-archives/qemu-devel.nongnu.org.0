Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C93654A5
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:54:51 +0200 (CEST)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYm9i-000445-FA
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roger.pau@citrix.com>)
 id 1lYm8R-0003VI-1v
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:53:31 -0400
Received: from esa2.hc3370-68.iphmx.com ([216.71.145.153]:45095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roger.pau@citrix.com>)
 id 1lYm8P-0000mO-1v
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1618908808;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aiTeHtN7Ds2HYKnXRpCTwsu1eOuzbmckNVUkwW1JGvA=;
 b=hGmpf+4Xa00fBr4GmeRoNxH9+mPcfWeA6JpWQvbgSqiSUbvG9DEBtqlY
 DzYMOoaSq8HkNaZhZ57/UfNc+htCrKDvgZK0bHauDelC/OSJ4qESTPBjV
 FDdBsXuTbCeMkV6laqKjgQ/OdoHBmumQ+gfY0mtUu+8RD44djk9XW7Kyb 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
IronPort-SDR: OqbIk8G9te/lcu8jWfcHpJaEJUW9FDpZi3hijgy1wt2yO4dx4J4vJt/Z1NadPqv1x0HKHFsK7z
 huNfM4QXSGWXmH+W+INVJbw1VjSxK8ax8wuP/hqnYhjOa5dp6dApSeGr7RruiHSPOmtoXigeYC
 Wopi6c3Dr367+FpxlCsrutmVWl0zxvYr0FUVOtbF0LaoBakPNufW4rto2uzgZjGUjFjSdIUfnw
 IOG27h3PVgB0pAEkVkNOOWqJNejeP4SCMGfxDfOHCFjlxBV0JBbwFH5l0OPYtrUpvkw9ywKfRJ
 5IE=
X-SBRS: 5.2
X-MesageID: 41955054
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:MIkmDq76w2RxdbelkAPXwWqEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBxh8ri/U2cG9Ev3NGI/MmT9Jzj5l1GJDsaCJ1IxQF/FwqdDwlSTA5JGZI2GP
 Onl7B6jhCnfmkaadn+O2kdU4H41pf2vb/FQTpDPR4o7wGSkSilgYSVLzG01goTOgk/posK3n
 PCl2XCh5mLk/b+8RPE0n+W0pI+oqqY9vJiH8qKs84PN3HXpz3AXu9ccpmjmBxwn+218lYtl7
 D30lodFuB+8WnYcG3wgTaF4XiH7B8U53XvyUCVjBLYyKTEbQk3BMZbiYVSfgGx0TtYgPhHzK
 lJ02iF3qAnby/ooSXn69DEEzFsm0akyEBS9dI7sn1FXYMSLIJWtIwUlXkldasoISSS0uAaOd
 grJNzA7PxWdV+ccjTXvmxix9SpUh0IdCuucwwngIi4wjJWlHd2ww8z38oEhEoN85o7Vt1t+/
 nEGr4ArsAAcuYmKYZGQMsRS8q+DWLABTjWNniJHFjhHKYbf1rQtp/M5qkv7u3CQu1H8LIC3L
 D6FH9Iv287fEzjTeeU2odQzxzLSGKhGRPg199Z/Jo8nrHnXrLkPWmiRTkV4oqdisRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXJmIZVMETp9YnS1ODqs/GMeTRx6/mWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9gBW5YQKuRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbTlLsqk8el
 piMKrq+5nL4FWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIEoNWQeWdb2XOdPR9hR8bKEA
 pSzm4HuZ6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IP4YJ8iF40nX6ZwDA3PEBRwlW9R2S
 N+QT5BYnWaOiLliK2jgpBROfrWcMNkhhy3ZeROr2jEiEmarcYzZ3cSUjK0S/SLiQI2Szc8vC
 w3z4YvxJ673RemMy8WnfkxOlwkUhXrPJt2SCC+ILhytp+uUgdqVmuOjSGdkHgICxbX3nRXoH
 fgIy2ScezMGXxHtBljo+rX2Vtpa2SQeF9xYHhmsYt7UX/LoGp3zPXjXNvN70KBLlQF2e0TKz
 fDfH8bJR5v3cm+0FqPlC+FDmhO/ORnAsXNSLAiearUwHWjNcmBkrwHBeZd+P9eRabTm/5OVe
 KUYAmOKjzkT+svxgyOv34gfC15smMtn/+t2Brr6gGDrTcCKOuXJFRtXLcAJd6Aq2DiWvaTyZ
 18ycsvovHYCBSFVveWjaXMKzJTIBLapmC7C+kutJBPpKo38L9+BYPSXzfE3GxOtS9OZ/vchQ
 cbWuB28brBMohgc4gJdyVV8kEgmd6PIEEo2zaGddMWbBUolTvWLtmJ673Hpf4zGUWHvhL3Ik
 Ta/CtH/fvJNhHzp4IyGuY1OyBRZ0c94ng5o7/HeI3UFQmwd+ZMuFC9KWSwdbdBSK6DXbUcxy
 wKk+2gjquSbW7/3guVoD5wZqRJ+GyjSdmpAA2NFfVTmubKTWikk++v+oqrkDzzSTGncEwWio
 1OaFwIYq14+0gfpZxy1jL3V7f+rU0kmUZP+D1rllbi3Y69/WfQdHs2QjHxk9FRRjlcMn+BkM
 TD/6yZzR3GkUZ45aU=
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; d="scan'208";a="41955054"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzPhU/GX/7X0NxhS4KKzF6q3OhKCmLjfZe0Q67Vam+SuHl8jRCocYEWF9wVesLhY3i0tLXETKJWs55yKNMGGGJcDlL84D2uMOsqhkgN9KKoPJ+2rX2soFzyJ7VB4dDuhTffmcLYgZeott79nfyzTj+b7gIO1ZyrOX95lJ27NbrlTljPzGZxkBTkcLb8B3Af0LhQILnwaLSSuUJ2XAfMiQpxiww01qXUcWwCUob/LmTp4g2L/pk29D5CgRz1ckVVBBhxfCu5Q4UmX2rQTuBe+4pjhLeFIysXZJoaXNq3A7ZHKzZ6NjVTxvEYekbHk+resNcumnGHtT5L0K6buHBpSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ey7G9XXPAB/E/8vkwVSZWrgLstwMk9KN77MQwqGHJw=;
 b=dWG5HGkTy4P8TwAvb9e2dIpIcDTpP/HxVyYrLBVGotuAdmrTxSl9GLLbelvoVvGv1To/KGhE7Eu29TdQDx2FtbGjiAJRvb95s55BwFKQClkQwH0gX0ncPjSvHoR69/vMHbppv7xJK/5dZGi4J5gBNrWzVa1xmrQXA0sDbuQsidqgH/BirGu586q6mgrIXBmiblCUWz+sw5n7ZXUbDssRE5SJVi1nU6sURKRpENIkjgxPKb38SYsjI9QE3V+bzgJ5dpKA2KK7qUZicDTMjZV2jDkiNvC+4Ms0XcxP2WL57QmT40+fx96Hl9VCiu5r88gk5JlifSyLle93cpsSVJ3KFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ey7G9XXPAB/E/8vkwVSZWrgLstwMk9KN77MQwqGHJw=;
 b=esvS9JtNjQthw53zmF3lhQGc/fZEDMwP6wl5vFs8QoM6kjsCZY6g4mGKfPZe8vdNIWzoJrV4OqBoNB70DjqlmuhqLUSYQk6jQmN5Ey0eY3jIvBE5WrvoN7B+51KkDruEU46JeohVS5OL8BA8iSrzSQwMLkRJLOGaAyrujJ73o2g=
Date: Tue, 20 Apr 2021 10:53:18 +0200
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <sstabellini@kernel.org>, <anthony.perard@citrix.com>, <paul@xen.org>,
 <mst@redhat.com>, <marcel.apfelbaum@gmail.com>, <pbonzini@redhat.com>,
 <richard.henderson@linaro.org>, <ehabkost@redhat.com>
Subject: Re: [PATCH] xen-mapcache: avoid a race on memory map while using
 MAP_FIXED
Message-ID: <YH6WfgdFpFaMYtvC@Air-de-Roger>
References: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1618889702-13104-1-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: PR0P264CA0087.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0a7ebaf-ba79-4ceb-3cd5-08d903d9c14b
X-MS-TrafficTypeDiagnostic: DM6PR03MB5324:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5324C38E75597C9AC5A209C88F489@DM6PR03MB5324.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/DkqTXxL5hmmuHyOGIgRLZZj7lYlwze/7kd797INZ7/EaIskEXAZeEM8L98Lw4Gg0h7geF62OZGsyNVnJ0gVdv/hx2vdQkvdztkC7GvHUYkm2gFJOlYk+gcxZt3HxpSj4cpN6FFxbkT3FTa5lZHWTggYItlcfN0iyhTJFi5KTSocpA9jC8A0VYh5nQ3vVgSqCoDOYs6NOPCRNcveqMbbLmAJMSCmU4HP8xFnML02KsbpKBvITU0vY8CHvktXM9ynDrpEn0vp3TfSb2ukCYVsJn9HWpojRI4O/saLCWASMg35WYB3M55kl1key3BMp/ztrmnn2108hEXxWPgkUdfXNwiI4h8mHmPyQlCN/xvfUJljMkfyhlfH0QYChasx+lk9GULvyFC4i81z+bpvba4N0LokKySzWjAf7O8zQgiBViP7q/4A50e9wXcr7tCjRFVNRdNvMzzqEJIARois0P9SE4NApxgWQE7eoUysCtbn8Zzj9JCUqcQQYr5jwC1rQ8LqrQC3RVagusk5jQownJ6ixLpXS1Y5bvxPrgKj9STdJs996PuuSqUjnqGJoN4y50DMAkYbooG6TAMqdGPJRE/vISHUG3snnV1msTaj10hqM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR03MB5608.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(366004)(376002)(39860400002)(396003)(346002)(136003)(4326008)(186003)(16526019)(478600001)(6636002)(8676002)(5660300002)(2906002)(86362001)(38100700002)(83380400001)(6486002)(66476007)(8936002)(316002)(9686003)(956004)(6666004)(26005)(6496006)(85182001)(6862004)(66556008)(33716001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U3NJM1Y1WitNcDdlSmdUakZIelk5bk4weFFpUk5SNVprYnYySWtZV0ZjNTNV?=
 =?utf-8?B?eEpoamdsazlJVzNuQ3BNT01QQUtEUm5YZTNXTzB3MlBXUUEzNEdZbjkrVkhU?=
 =?utf-8?B?UkJzRUNwc0V1bzRGL0lFR0xpYVNTSllLZDZtRU8zajFNTHNUUVVWSENIaEdx?=
 =?utf-8?B?L2ZNTnVMV0JrNXlubUFvODlzMlRvRE0yZFBhbkJvRHlzdUQxV0ZoTzl1cTFy?=
 =?utf-8?B?WHdpVUhFd2Flb29ZZU41RnFOMVVQbnpLTXNlUlF6RGl4YUFjaXFydDVyWDQz?=
 =?utf-8?B?Rkl6VnJkVU11SG5SMVlUblZmVDZVZG5sQkh3WFAyTVgwczdwcytkZXNDTlpi?=
 =?utf-8?B?RndtMEZsM0VVODROYWlDS3ZxQXV0ZGRKdzR5bW5Kc1BCK3Y5ZmZ6bVEyVER0?=
 =?utf-8?B?VnR3TjVxU2NxRiswNmY4c1FZN1M2RmxOTlFGcGhoRWQzRlp2ZkptL1laVmtr?=
 =?utf-8?B?Z1hFeitJaDlBcjV1VWpHRldLMmpVR0w2dFN5S2VaUytrTDd0aGs0aWhkT1N6?=
 =?utf-8?B?L21PUElOeHR6UFA4U2N2WTFGS2pRUjJnZXo3eTJ4NmhWZWl0SjRpZllzRThx?=
 =?utf-8?B?NVRoSU1RZ3RtbFZ6ZFlZN0VNbmhjOFA5NHNkcUtDNEhTRWFSSmtWUUdEcTRw?=
 =?utf-8?B?ZlhBanhjTXFpeVBNMlJLcm1pbndsMVNwZ085eTJtU0luN010cmJscU1oOHM2?=
 =?utf-8?B?dEVWVDVQSENKbWp2b1RMNVNuRjVNYXpZSWxtalI0d2dIN05wVnczQ25LNVJx?=
 =?utf-8?B?RTgydkdLTE5yMlNZcElCUDBseW5jdDhxUktucW5lUDZtTEh0VkVQdjhkWHV3?=
 =?utf-8?B?elQwb0x2S21ZSzkvOXd2TGE0dk5oRmdGVWh1VkxGUndhSnl1WHhKMlVGN3BS?=
 =?utf-8?B?WlNIajV0Z20zaFFzZjRqRFRtdXdORSs1M1FOQW5TbWc0Smg5dzNOYll5YWhx?=
 =?utf-8?B?elphT2ppTWZoVnJnSHNBdkZuOS9XZzRubVVFWm9mRTJabTM2clgzamFGeCsy?=
 =?utf-8?B?aVBibUZobzVHSk5ySHVYYUZkU0EyajlLa0p5RzBqSWNKSytGYTZnV1RjZk1v?=
 =?utf-8?B?REpRV0ZCNkY2ZWNlMk5acnZNVEFGbkhlVis2d253WC94MTJyUlA0S3dHVkVH?=
 =?utf-8?B?TFNxVExvczhXR09OaWhLSTRIYjJ3WXBSekxtMzdXKzZJNUlWWm90dE42L21M?=
 =?utf-8?B?Q0hxNHJ5azdSVWxoRjFZeThBdm03aGlyVUFmMVBTM2lNdE40UjZmU2V1UlMz?=
 =?utf-8?B?TXUzWnMvVWhiQVptU25adFA5VkRNWlhrYVAxQmNFeks0UjNCNUJHVVBmV05Y?=
 =?utf-8?B?SzZWcGMzT1lJWHVUNXpvSlhwT1Ixd2V6dUJlQjU3cmR0ZGpnQnVXR2pIaXpW?=
 =?utf-8?B?ZmRCdVVnZHM2Z3o3bFY5R1Z5QjJWRFUxMnBDcVliNUJJTmY4bHFXTS9TZFhs?=
 =?utf-8?B?bnhhbUQ5QWdSUkN0ZHMxaThNRUFYMENwYStiNllKNi85K2h1cmoyVXAxaGNu?=
 =?utf-8?B?bTk4MklFdjFDaW5Rb1A2d0Zic1BsUUI5Z3N0MUlnRVZYWkd5U1laM1ZvT2hx?=
 =?utf-8?B?YUwzdHIxMk9RSXpTWEthaDdwNEdXeFJNSW1oZzZCbGU4d3JmdlV6aEdiR0JC?=
 =?utf-8?B?VkNpTXFFb3lmOVdIZXlNdmdMOU1BRFo0ejE1a2VlanE4eDA1YVZxb0loT0Fj?=
 =?utf-8?B?WW0xRGoxVFlnQlhpVkM1SmZab2R1ZHBaYkZsK3FiOFIwZFVrVndjekgwOWZV?=
 =?utf-8?Q?PLyihoGKPLc/2XBQQZh2V7xTT+v5GPIgCg0rsgd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a7ebaf-ba79-4ceb-3cd5-08d903d9c14b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 08:53:23.6660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QedRFRjYJuIjUE6ukXkb29lWDtO5ji3o7vX9EaqkZ8XCN7zCYCuvh2m7necC56m6IrH1ZOPgEpLlCk3FtSa1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5324
X-OriginatorOrg: citrix.com
Received-SPF: pass client-ip=216.71.145.153; envelope-from=roger.pau@citrix.com;
 helo=esa2.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
From:  Roger Pau =?utf-8?B?TW9ubsOp?= via <qemu-devel@nongnu.org>

On Tue, Apr 20, 2021 at 04:35:02AM +0100, Igor Druzhinin wrote:
> When we're replacing the existing mapping there is possibility of a race
> on memory map with other threads doing mmap operations - the address being
> unmapped/re-mapped could be occupied by another thread in between.
> 
> Linux mmap man page recommends keeping the existing mappings in place to
> reserve the place and instead utilize the fact that the next mmap operation
> with MAP_FIXED flag passed will implicitly destroy the existing mappings
> behind the chosen address. This behavior is guaranteed by POSIX / BSD and
> therefore is portable.
> 
> Note that it wouldn't make the replacement atomic for parallel accesses to
> the replaced region - those might still fail with SIGBUS due to
> xenforeignmemory_map not being atomic. So we're still not expecting those.
> 
> Tested-by: Anthony PERARD <anthony.perard@citrix.com>
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Should we add a 'Fixes: 759235653de ...' or similar tag here?

> ---
>  hw/i386/xen/xen-mapcache.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
> index 5b120ed..e82b7dc 100644
> --- a/hw/i386/xen/xen-mapcache.c
> +++ b/hw/i386/xen/xen-mapcache.c
> @@ -171,7 +171,20 @@ static void xen_remap_bucket(MapCacheEntry *entry,
>          if (!(entry->flags & XEN_MAPCACHE_ENTRY_DUMMY)) {
>              ram_block_notify_remove(entry->vaddr_base, entry->size);
>          }
> -        if (munmap(entry->vaddr_base, entry->size) != 0) {
> +
> +        /*
> +         * If an entry is being replaced by another mapping and we're using
> +         * MAP_FIXED flag for it - there is possibility of a race for vaddr
> +         * address with another thread doing an mmap call itself
> +         * (see man 2 mmap). To avoid that we skip explicit unmapping here
> +         * and allow the kernel to destroy the previous mappings by replacing
> +         * them in mmap call later.
> +         *
> +         * Non-identical replacements are not allowed therefore.
> +         */
> +        assert(!vaddr || (entry->vaddr_base == vaddr && entry->size == size));
> +
> +        if (!vaddr && munmap(entry->vaddr_base, entry->size) != 0) {

Oh, so remappings of foreign addresses must always use the same
virtual address space, I somehow assumed that you could remap an
existing foreign map (or dummy mapping) into a different virtual
address if you so wanted.

Thanks, Roger.

