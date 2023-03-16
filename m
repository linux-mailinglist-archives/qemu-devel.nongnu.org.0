Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27556BC9EC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjLC-0002pD-WC; Thu, 16 Mar 2023 04:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1pcjL4-0002iq-AS
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:51:58 -0400
Received: from esa4.fujitsucc.c3s2.iphmx.com ([68.232.151.214])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1pcjL1-0004qN-Rx
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:51:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1678956716; x=1710492716;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8xpVDEA7tIDoU9ODafGSmZ3bhgWlPAfr9z4MWI/U9sQ=;
 b=gWnj87K0zKRW4wn7B5pVDoVQRcIGvcJXvo59V+AkZHuGQWZ0e5DFx27A
 g4OCDY9jeUmSDxyVL5pvEPNdiRjQYnAcCSPO/0cop7MD33BUmP39F8bxl
 cQR6SFMoxYCsOfdpG0T03p3etEEio/CMHYJpvERf9NaaJbAOZ+7YCOuJ5
 KdiEqfTOdT+LXm2J96mpZPBeA4zyb4uyvePZRgG+Mim0nhZyH1tPdi59V
 W4MZS/O/p/YnG0Mq/wD0Pb0taFuDqSi0/cu83kI2ivYCM7/zZ9eTpksGc
 Xv69GIaS9jb48n6q5mLKN6M7rxCVLNfUt0OwzgznhhQnjlwCV6HxBM3Wn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="87258584"
X-IronPort-AV: E=Sophos;i="5.98,265,1673881200"; d="scan'208";a="87258584"
Received: from mail-os0jpn01lp2109.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.109])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 17:51:50 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5XY/cNeuV4tIvRPocMMpcF6U8daqgyZZwA7RbK62Ca3SkunjEi65RGfBguP8/fUlb5w3zVeQawcLSDj6V8xRC39fuPaUouAlmLLd3+55KMVuSlXoxNYZwxn63IxJr5DbHh0m8I9CRt3z/1KNMmR304YRAaXbBagF0pxUjQZUIr3NtmgOB6WJEAZQgHtqsY8zFcBYao+qPLI/4od8IPG84lHX6PopQflyJ1a//c/2PY2ySdhwZOYAr6tK/W/LLV0FN1iwr8WV+XHfUbJx5SP6qFfeaOX7WR9lHnjx8zQ99U/ILW2Tvdcn0D4cs63kJKyX1pQRVdoC+JlrebRlPTj3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xpVDEA7tIDoU9ODafGSmZ3bhgWlPAfr9z4MWI/U9sQ=;
 b=U2K4MkWjf7zXvSr+Rm/ar00E/6DP6bggl5i8VkOW5wxru+peX09eKe2hjkg4Ktoe+eSaO8wJcqLR6nVHL0r2uZVVK8ukzhpnRk/YmIdXVnJeYIRVqvHNeXHUNe2mpNyf/tONPbbCPtMHIPgD/Eu/4Y/gfpQBuGZeLHvGX4vPLmzFuPimcITJoo0zDngqB6b0iLWxt7TnTsFAquwcdPDy3pjbimynFdbHANp414whewKccTiys1ewp0CrfDu6TpNc0ShlR9r7C5PAUGiwb19SaAQRMJgNMWPfxDxZpEXBU+Iu4raotsAS1Dd0U6zE2lLasuZq/y+cyfk6iYBSNWQviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OS3PR01MB10390.jpnprd01.prod.outlook.com
 (2603:1096:604:1fb::14) by TYYPR01MB7782.jpnprd01.prod.outlook.com
 (2603:1096:400:117::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 08:51:47 +0000
Received: from OS3PR01MB10390.jpnprd01.prod.outlook.com
 ([fe80::777c:ddcc:cdd0:7ec2]) by OS3PR01MB10390.jpnprd01.prod.outlook.com
 ([fe80::777c:ddcc:cdd0:7ec2%3]) with mapi id 15.20.6178.029; Thu, 16 Mar 2023
 08:51:47 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "quintela@redhat.com" <quintela@redhat.com>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] migration/rdma: Remove deprecated variable
 rdma_return_path
Thread-Topic: [PATCH] migration/rdma: Remove deprecated variable
 rdma_return_path
Thread-Index: AQHZVtzOFnOGREeWgE6oEkkUF1mZd679G1kA
Date: Thu, 16 Mar 2023 08:51:47 +0000
Message-ID: <baf1970f-d68a-dba4-cb6d-312431f2ff0e@fujitsu.com>
References: <20230315012247.9007-1-lizhijian@fujitsu.com>
In-Reply-To: <20230315012247.9007-1-lizhijian@fujitsu.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB10390:EE_|TYYPR01MB7782:EE_
x-ms-office365-filtering-correlation-id: 50c2e8be-60c2-4a77-d163-08db25fbacfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dtPKB7xVtN0O4fYSg4sIknU84yCQjoHo2UABv7xa6gXZMkfDDm6gl9xEWMRuF2WpIdylBY0uaTrdG2C0G9luf403sSh4tJBhDtAiiyC771G7R5a+lI5STN+vfLimUU70h8wiJod4KLnvmpcs4sIm3hjx/zqgDtI3rBrruP7PA56J+YtPXPkZDrNqDMKkpzOaik96xb4ITgr3aMZnELIL4fjxTWN/6t3EyUVbtZohydjYkW6NEzvgRh44k3zOPxqzjRbEHuFbU9SUstUYPcy6xzLsaDZq1lEsvvoXelvY4/8Dx2TdVhhtFe56sRfsS+WG8Irg+Hx2LZlL30XV5vQVOSpS7ItcVjD15Lzu6D/IpTzi+f/5VVsld/8S0LrkZeav5eu2ZcmiAb7ya6JgXdlqUH0n4gGSSIGNugcex3tHu7DlpIqCaDI07PbgorXDNeq/XYPDbjAwl1/vaMohBb5pDFEw58SXF6wYASiNp2npGfvTp6mLERL9QtIygR8/rZ0cQyE0K9CwOTbSIufE938Do5K34+11QED224uITbmxd7YmLUagmi7mvevwAoCzL9GEMo7X9jzY6JZOQIg5tKzwv+3f3wtNhy7K8zsgxA3ONbbuR0XV7f2fee0urOfCSJJWUBj5b13iIP+lvuS70kK9UxVsmA39zouTsm7qqsB0QtNOD9K9qlaYoWMzHnZxBYW3vyGSonyknEjT+7TkvdAG41fKx5VH30tQfABeLEl6S7VmMZfyg6kNwfD0wNAdNfcdmYNvmjzRHJ17Dr9QhpolPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB10390.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199018)(1590799015)(1580799012)(31686004)(85182001)(36756003)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(86362001)(38070700005)(31696002)(82960400001)(122000001)(71200400001)(478600001)(91956017)(66446008)(66946007)(66476007)(66556008)(64756008)(8676002)(6486002)(2616005)(4326008)(76116006)(110136005)(316002)(186003)(6506007)(26005)(83380400001)(6512007)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0diQ2lEL24yN1VuYnRERUkxc2YreXdQWHBHaFVFdnVQeVZZOEZXR2U4QzBB?=
 =?utf-8?B?WnNTbmVma0l2YjJ5Zm9jRDFiMER0L0RCd25tRzk1d05ydHlMNGF2Y3RjYUJw?=
 =?utf-8?B?RWpFcXpKb1J2bkUrWURoMGY4L1VXT01GTHhCWVgzb20wSWpNY0Vaa0tiNXdR?=
 =?utf-8?B?OFlLb0pzZmN4SjkvbTZUb2NSTXp5YUFJMk1iU3ZQQk40cDZzVngrOFFveXFX?=
 =?utf-8?B?a1R5VWkwRVRIREtPNTJza3JHZFpsUlNjcXFuVzBJdVlRK24xaTMveTI2UWdp?=
 =?utf-8?B?dWp4SWFoRE5ramNsRFNBdjdNd0xybXNmMDFFNXBCTWdUOU5qam1Ed08xajVF?=
 =?utf-8?B?bWM5VlhEZ09FNTgyQ0lqZWoxYldvOWMrQlVmQjZqRmtMeEpsc0hPcCtCWitM?=
 =?utf-8?B?ZE5Cbk9mYm1QZnkvRFZzN0p3enYrQlgwcVFXSXVLdk9rYTM4bFFrYUZ5a2tv?=
 =?utf-8?B?THdVR2tLb3h5cS8yUjlURnpkNVUxYzUvUGNTVUhtcldkUmh6TDg2OWk1RCtM?=
 =?utf-8?B?cEJ4MGR4Z0l1SVdkQ09iby9OblZsaXlhcU1HM0lENUFTOU1nakxSbFpZMTIy?=
 =?utf-8?B?eEVXVUVoQmIyTXJLU2FydTVtOU9ZR0hRWXVvVzV3Zmt1Uy8rbGErMlFvbFVH?=
 =?utf-8?B?OEt3Z1Z3ZGpuRWlBK0RBV3J4WjJRK0VxVmVhNk9jOXdJaWxzMGgxOFRVTnU5?=
 =?utf-8?B?TTJVM1RYMmZVWHJWcDVoM0o4c1BUZ0s1MVU3Y29QSnhLWVQxQlJ5N0VaRmhx?=
 =?utf-8?B?MmVGeGtheEF6T1FJbU1NNmNUSkltRzdBYlFJMGl1czd5L09XQlJrZ2FodzN0?=
 =?utf-8?B?ekpSOHNMOGtaYmp4UmNCY1Rqak4rd3hucVBlaUVQTWJuL2NPN1BMR3FyOG9F?=
 =?utf-8?B?UzhPOHNIcVNOdm1zZUtsQko3SDl3dWM4eWNMa1ZSazJoN2dGNnl0aWsxNUdx?=
 =?utf-8?B?ZVJMcTM0bDBKOWcwSEc3VnpxSEVQWlB0YWpLSGRySFZoc05NV2hwMHkzdk5i?=
 =?utf-8?B?bWo0UUpoOUJxTzN5aGdoL2JqaWtVd2xrYnpkOXJlMVV0MXJVMUljYThZTzRo?=
 =?utf-8?B?MmhFUnRYanBpYlVPZWJ4cEFVTkphM3dkTU10cDlRUEU5RkN0ZTVxdEpnVnl5?=
 =?utf-8?B?QmhqekZ1VXdLRnZwSElmeFlPam5FcGQwWjJUQjEzVkpVSjI3Q3pVYkJsZU0r?=
 =?utf-8?B?WVNTWFBDWXpyNUlodmVvanZnaEwzNzNlRHZpTTA0eExvNm5RS2xxc1hFN1Fq?=
 =?utf-8?B?Wlg1cVBZa0l3TWJlZVowaUZhekVVQmdVKzBsUVdCWmthcWN2d1dhNjZDeDJ0?=
 =?utf-8?B?Skd6ZW9mcUMvYXBoVHY3VmVFbTZ0aFArRkFOYjRSYTNaa3JmYithMnNxY29G?=
 =?utf-8?B?b1lYbG4wZkF0Smd2bTRPRGoya3NBUytZb0lZbnBJaWZWd3djTHdyWFphSFRo?=
 =?utf-8?B?WE11UjYyWmlaemFEZm5lZW55NWxlNUgxTEV6d1VScEN5ZnBWM0xUTEFUVWdX?=
 =?utf-8?B?TlpzTnVzN2FwaGtVMHp3RlJNdDZRYWh1M1BIRllENGloR3ZWQWNQTnRNakRw?=
 =?utf-8?B?ZjFTb3gvTVIrN0x6Yk9lWjlMMXF1bElyenFoQndUWHZjakx2R2Y0M1Eyb1Qv?=
 =?utf-8?B?aEZ3bHhkZzRtSk11ZVV4OVFvbEVwRDE5Z3FRR0xFLzF3Mm9EUHNNaktFSS91?=
 =?utf-8?B?dTlHVnNzV25YU3RmZnEwUlRXN2x4Y2pjRWhESlRZdUlZTFhvZzYzbWRVY3RD?=
 =?utf-8?B?VktZeWh3clZwZEh3UEpkbnFTRnEwYy8xcXZLd2czNmhpWXVOYkg2cVVoQUcr?=
 =?utf-8?B?MmJjUDNDcE4yZjVPaEhGeklxeHd4cFRJVFhrWjBPUnhWNDh3dVE0ekhFSFFq?=
 =?utf-8?B?dzJ4ZXZ3M2k4eGJ6ZHBuTCtmdzQ0Ny9kNEQyeXArS0swSHAwaDZOd1lvY2JK?=
 =?utf-8?B?SkltWEJUeTZnWU9xYVpGNlhzM25ZV3l2ZDJzaFhTUmtBS0M1MW9Jd2hUTzUx?=
 =?utf-8?B?VTZ2ekRWSE9HcFlHWTJkWUI1RmdmY1RqZWk5TjYzZHUxdjNkMEJKQitwUUg2?=
 =?utf-8?B?dUlhUlNnUElPajZ0b1BXaTQrSURnM0VTRzM1QkdnMVJDeTM3eWpKcE1FT2ha?=
 =?utf-8?B?TFZjdXg2MGVldjhRTEpNQkZUYWJtOFVjcFhUUmRQa2NkbTdRTFpBcnZlbXBV?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCC6DAAC5A2D074CA72FB992323FA0CC@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: dqP4hkkByWczhcjEpjonDuICT4lvPLC7xR3RxC1YL2hjDXz+xZGbhySiv5v6Aq8CSeq9E8/P0+RNynqG0mE3M1ntvXasDqma5gjUv8D0kqRn4F2tSV4ha87YKyNoirhDxALqgMBhD9hOhr3w557IgXFBCAuCFwdbCVxSAiVtaONFtFlZhuVG44KKDHi/r/4jDRb9pnuwRiJI2bNQ+/JqBKyLvIoNK6GOMMRrUwjwG7ZtrxRhXjIgpmdobUPrklwHCT8IoMdPCQQSxa/D943DY45GGYLMGAt3Y8s+hAHaiZrMGSMqwT2IoVcOUOqbN0O3i8vfNJDvoiP3eXNcVmY5IygH6yh7ydscacVLAsceZow4eg7Y00InuCZSF1O35AlX244OHSxHdAVL60AdcLQd/ff0eiKnO2JN9KxRKwZHvBbBTN9r3+qZ7G72Ye0DOlfieFRoz0YJb0JEOEI1MLZQqzocYU0o3K3WRNs/geAx8HKp3yi6kS2f0+EFKTAmavYUpaSR69QqVox5HHo5BQszt18OOXxx+uY53KJNkUgozVm44SkRAFrAMtaX5SmMdmZUCsu39K5P/g8qC4Ik+JaCitXf/JZYUAydvSiF8dRp5YJRfCwJFnl0J5nyFL5BzJK086YC9JLHAQUwmZqCiJ6o4WRD4/oK5qxCdF+BtM4XHvQrBuXOgS44PHEEbR9ktOYNruHBhVQUUhlD4q7oAeZziLB4WK4um6oaZ7fz62GtzfFFJDGXzN51QlemXmkJG6cfFN505oUdjcSVCjlWH8ltpNmULq0wpA1mIPS7IB0g3CQ=
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB10390.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c2e8be-60c2-4a77-d163-08db25fbacfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 08:51:47.1544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEP4XTAEaS4YpGTX296mS6a9jWhr9eiWapnBjFihzcd70WbpOOh5h9HYJ1JU9fkVTZV0d7TR0wd/L9DEIv+/5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7782
Received-SPF: pass client-ip=68.232.151.214;
 envelope-from=lizhijian@fujitsu.com; helo=esa4.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQpOb3QgY2xlYXIgd2h5IGl0IGRvZXNuJ3QgYXBwZWFyIGluIHRoZSBhcmNoaXZlKGh0dHBzOi8v
bGlzdHMuZ251Lm9yZy9hcmNoaXZlL2h0bWwvcWVtdS1kZXZlbC8yMDIzLTAzL3RocmVhZHMuaHRt
bCkNCg0Kbm9wLi4uDQoNCg0KT24gMTUvMDMvMjAyMyAwOToyMiwgTGkgWmhpamlhbiB3cm90ZToN
Cj4gSXQncyBubyBsb25nZXIgbmVlZGVkIHNpbmNlIGNvbW1pdA0KPiA0NGJjZmQ0NWU5OCAoIm1p
Z3JhdGlvbi9yZG1hOiBkZXN0aW5hdGlvbjogY3JlYXRlIHRoZSByZXR1cm4gcGF0Y2ggYWZ0ZXIg
dGhlIGZpcnN0IGFjY2VwdCIpDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMaSBaaGlqaWFuIDxsaXpo
aWppYW5AZnVqaXRzdS5jb20+DQo+IC0tLQ0KPiAgIG1pZ3JhdGlvbi9yZG1hLmMgfCAzICstLQ0K
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9taWdyYXRpb24vcmRtYS5jIGIvbWlncmF0aW9uL3JkbWEuYw0KPiBpbmRl
eCBmNWQzYmJlN2U5Yy4uMmJjMmZjZjcyN2IgMTAwNjQ0DQo+IC0tLSBhL21pZ3JhdGlvbi9yZG1h
LmMNCj4gKysrIGIvbWlncmF0aW9uL3JkbWEuYw0KPiBAQCAtNDIxNCw3ICs0MjE0LDcgQEAgc3Rh
dGljIHZvaWQgcmRtYV9hY2NlcHRfaW5jb21pbmdfbWlncmF0aW9uKHZvaWQgKm9wYXF1ZSkNCj4g
ICB2b2lkIHJkbWFfc3RhcnRfaW5jb21pbmdfbWlncmF0aW9uKGNvbnN0IGNoYXIgKmhvc3RfcG9y
dCwgRXJyb3IgKiplcnJwKQ0KPiAgIHsNCj4gICAgICAgaW50IHJldDsNCj4gLSAgICBSRE1BQ29u
dGV4dCAqcmRtYSwgKnJkbWFfcmV0dXJuX3BhdGggPSBOVUxMOw0KPiArICAgIFJETUFDb250ZXh0
ICpyZG1hOw0KPiAgICAgICBFcnJvciAqbG9jYWxfZXJyID0gTlVMTDsNCj4gICANCj4gICAgICAg
dHJhY2VfcmRtYV9zdGFydF9pbmNvbWluZ19taWdyYXRpb24oKTsNCj4gQEAgLTQyNjAsNyArNDI2
MCw2IEBAIGVycjoNCj4gICAgICAgICAgIGdfZnJlZShyZG1hLT5ob3N0X3BvcnQpOw0KPiAgICAg
ICB9DQo+ICAgICAgIGdfZnJlZShyZG1hKTsNCj4gLSAgICBnX2ZyZWUocmRtYV9yZXR1cm5fcGF0
aCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHZvaWQgcmRtYV9zdGFydF9vdXRnb2luZ19taWdyYXRpb24o
dm9pZCAqb3BhcXVlLA==

