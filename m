Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B129368C02D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2YF-0005uX-Kj; Mon, 06 Feb 2023 09:32:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Anton.Yakovlev@opensynergy.com>)
 id 1pOwvz-0002ot-N1
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:33:07 -0500
Received: from repost01.tmes.trendmicro.eu ([18.185.115.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Anton.Yakovlev@opensynergy.com>)
 id 1pOwvx-0007j2-O9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 03:33:07 -0500
Received: from 104.47.17.173_.trendmicro.com (unknown [172.21.183.236])
 by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 1A548100017B7;
 Mon,  6 Feb 2023 08:33:02 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1675672381.314000
X-TM-MAIL-UUID: 583f613e-43fd-4504-849b-bb028e768801
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [104.47.17.173])
 by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id
 4CF1710000E58; Mon,  6 Feb 2023 08:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ld552OfjzfBaw29OBt7uu+Y51D5GxyqNixitF+HJzJZ4+35g45sLQrXfh0/CjqbL0zFaZo6ZvyXn6RO8sux7L/wvTncTUatT+L70/9nqDzGgUK9OSXzaJrOXdIKhvxvNRe/sOfV94F/JQC2acEDcrDs2+DD3qEMU5kcZ2Mc6OYF5Ve/DP5udBD8gaU6J1RPy/6lYh3tGIAoXL44gbQ8L1MvGy/5m1hs/nuw/WlziXF18VSqvGhkvRqGtE4PSR+s5X6WQ3tEnw3t1OCAHF7c0CxlzJly7wm+EeMYsMp4hIG3ivRiYQJBAdB9jlp75I1w14+JsqK+AVGxZzOK+2sbjpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqDzEiw3OY7t/zlcE1txhW3+odC+AdtCou95k6Fag6w=;
 b=XjY7E5+zSqEbxt9qL++WPFVfUQQ99nKHGQ1JlYl8Xs3TDdRCVfqRHUaq6CG5TW1RV3tzRxQiutnTk5WXsz0wBl+BE69ys7d6R06DLzpKYGYcduOcXoLgPwrPFhs9WZ+Y369QcjubWrZYXaQqNaA/D/gMzSAjuH2lKDukdWV51yoJjfJ9ZxkR239WzIJZ+E2lHB6e1OPfXbUcYl9VCpK6Pnt+0t6LsovfdiE2X8hieHTgTyeoArfnAfOTfBOv/QfwNH/cE1uPeSIKPycDFEuR5LnDZHly7PDUsH5yqeSX1dH9skuE4TVHrpdXA90iu2RvYwDa0F4qusUNhwODzSxzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <affc5c9d-5d66-4a27-ad94-bfb105a12bef@opensynergy.com>
Date: Mon, 6 Feb 2023 09:32:58 +0100
Subject: Re: virtio-sound Google Summer of Code project?
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>, chouhan.shreyansh2702@gmail.com,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <Laurent@vivier.eu>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <CAJSP0QXBKPXj2vf3wuK2QGdX+HZa_Nu3A+RT6hYnXJrUKTY4Fg@mail.gmail.com>
 <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
From: Anton Yakovlev <anton.yakovlev@opensynergy.com>
In-Reply-To: <CAJSP0QWDMv2yFkORzKt+p45ykiY=AmZCbrS464nZOqEtOz-NqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0125.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::22) To BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2374:EE_|FR2P281MB2876:EE_
X-MS-Office365-Filtering-Correlation-Id: 55027121-24dc-41d8-6a86-08db081cc136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6+eFuwg87Dxtm4xWcbmVawdWzAierEgn3pFhfXOqogLl4hmHhTye8SOYcAkU7ChlBC21+6keK+I9FmX72cAtrXKzu9KVutyKcHnBdqcyf8UCaHygR6Y7falsjWZsv/Z2aBikQ59AzEdpx+DeZ9nxx9wtqr5MayU7RgZ/wuXRgBMBitXl3nTmkL7Y6DsvVspO5xj+3luZ1mUOixV3HdlZFAHAgWEW9D6WJD1s4WXWS4gEvQtTAAploKBYkVUeHB+OjnkUe7V16mHxX4XVbm+t00cSzEL6QmBIStNKATLaKRhUbfNI+LiW5wXx2Viku78eYP075jYYPAVqwZXsf4kSgDXa9gpsr00XCz808J5p0yRDwoCjNqyk1cVAcdhPLiE44ucx7KHJe1slnUf5DAj/rpTwrdRMNMJW7kxFSOc9yLEAirIryI4oFDk3bUSXqIIc+9OW9GWHG55xpyfwWNbuCtY/axoKesPnaQ2i3re3suBxjt5oQLk4/LK+7UlnTYw4T0BP3IjYrPgofxB5d+z5plSK9veesQRtEMIdA4/H0KOeq1ZRd/qfRxcWfuQ8kwFqH4/GeOA0Rrn5VoyubX0TJ9fsHuDgdTfD9kAh/bNIzELSG38YWd55e5p2ETnHMLAbS4rp1MFbA6hxmdFfXifKJb7K/bcbt1acMAIOL6ANhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(376002)(396003)(39830400003)(366004)(451199018)(66899018)(53546011)(2616005)(966005)(478600001)(8676002)(186003)(26005)(4326008)(110136005)(66946007)(66556008)(316002)(66476007)(42186006)(86362001)(36756003)(31696002)(38100700002)(83380400001)(5660300002)(44832011)(41300700001)(8936002)(2906002)(31686004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXZVcXlpZERYNGNzdmJJT2lCc24yeWNodjhPbWxWMEQxMzNiVjU4K2NTZXNv?=
 =?utf-8?B?QzAva1B1WTAwWFE5OTlnTGlUY2ZSQldYY00ycklyZk9aQTJNRHRZZFZPc1RT?=
 =?utf-8?B?L21mZnprNDJZUjYwVDBiMTgzMUh5RitJVVVpbnNGUmN4bHNjM1FqeVpzbzNs?=
 =?utf-8?B?K0RRMjNtS3k0elJQeGsvbFRpcmVOYkhBNEZsUFdXYVJMdFdXcERIdlRPSTVO?=
 =?utf-8?B?a2Y4RlVCZ2JrQ3lyODhYNDZyYWtsZHV3WElhQmNveGgxK05taHgzSkJvb1ZK?=
 =?utf-8?B?NzJHZExZOVdNNlcrY2NTZVdOTmh0Y0dkcnBnMmEwenhpU2hNcEN6OWg2RjRw?=
 =?utf-8?B?aFpWNENySG9sRVBsUkd5TEtBTUxvaTdZSGU2dFRNbDkrQktISmc5WXJQN0VT?=
 =?utf-8?B?L29ldnpLTys1c1NxZHdaeTEranE4ZVJvbmNhaTNGMVVwSFhZL0dFdk00QjRl?=
 =?utf-8?B?R0pZSU4yMkxUaUo5Y2w5dlIrcTB4RjhrZDhySGwwM2taZ0VCbnZ2czcrbVpO?=
 =?utf-8?B?K0hwMVdTbksxeGFvVHlLQ1pmbUZ4aVhENkNsVDJsK1VRbzNHbERNUGdvNHRH?=
 =?utf-8?B?NDZFTGZrbTBGd2xIUXVTbS84NjVDL0hHUHFrTVdZbFlpVzhqSmVZSjREQTFH?=
 =?utf-8?B?OFBFTjlIYXpENWYxRjVXZjhmejhkYngwakZFTEZxNzlyczkvbDFVWXF2Sk5B?=
 =?utf-8?B?cFU1bENrajFENmxWTFFtemtxZUJJcDlqK0gxYzRTYXBtSnE0M3N4RjY4K0FG?=
 =?utf-8?B?OXZRU0tFQXA3ZDhhWEdUZG1DRWtaUmRiUGxSTHRidm4wRng3cWU5S3dwMHF2?=
 =?utf-8?B?MXhtQUN1N0dETnMyNWpRZUhnaTg1aHVCbVZKSXppempxNmk4dk9iazcwQTdP?=
 =?utf-8?B?SHVKVm1sekJzMnNsVWFXajZGK0tFdlA0R29uR1lhU0ZNTmprRC9sTzlnRHNR?=
 =?utf-8?B?ZlRnNHd2U0lQTXkxdW9HK2lWN014RTBLK0hpVWlZWTlvU2JKMU5pV2J0Mi9l?=
 =?utf-8?B?VElCa2dLOXUxZXRtVkxzcUlmdTY5Z09SZHo3clQyU0g2aXVCemhQeUVDMSsx?=
 =?utf-8?B?d2ZTOUd6QVB5MW9xNnk1UXcvaEpja1JMOWpVRGJ2QzBDcDQ0dWVQbXJNSzFR?=
 =?utf-8?B?eGJDMTdpQVU0cGlrNzBoTUdLaEc1UnN6RDBXTXpZY0x3UXlDS0xrSUtFSnFn?=
 =?utf-8?B?bFBtWkVkNGQ0ZXdpTjRtMlRHOW1BQ2pOcGFYL3RUSjV4SDJjTldJQ1ZWTU5x?=
 =?utf-8?B?WDlVYk4wZlNTeE53WWtoQ0ExNzRiRnlGSEpoZlVWWEZXR3BIdVhNQTZRTzVn?=
 =?utf-8?B?TzBCdUF4T0Y3Y2g2T05YZHh0ajlGeUJLZmtjQ1VaT2FlbGczN3NSQTJsRHho?=
 =?utf-8?B?cmRhazhFZ1BOODFqcXpXTnhhdm0yZDFTdjhObEdwT00rQ0lZQXhudDk5NmEz?=
 =?utf-8?B?TlJRbWZRSzZiOUVBSzlnakc2QU5UT2Zya08yKzIwZk44TGIydTFIKzZsZTJP?=
 =?utf-8?B?M3JDVDY4T1IrRERiSERhclBVWmVBZERjU0lGeHJhKzFSQndtbzRaOFdaNVpu?=
 =?utf-8?B?dmJFRURvNzF4YTZ0NllJTmprK2p5VHcrUGdUZ0FTOFdWd3hyNFBoSjRiSHhp?=
 =?utf-8?B?MFFINFpEQ29Dc01qMFBxMm1BMEdTSlZGYlRueHMxZkltNjI1b2hFSGdBTnJk?=
 =?utf-8?B?TUdCSDdWb3prRld1VTBKUkpKcVg1bXVpY2VWdVI4NjFKN2FYS25haERMNkEy?=
 =?utf-8?B?S3BqMXRYTGNWUlFHQ1BFNGlXbHc2SHZ0Nm4xdkd2cTFZUWk3ZXlTVFlva2k1?=
 =?utf-8?B?UW1VYkc0Slgycnc2TmxGWGJYMUE5Tm9ZR0JsMzI4ZmxUY0s0cnZOSzl2VnRV?=
 =?utf-8?B?UStDaGdyblovTjZLcXFsVnB2aW11b0VBTGt3UkJnUnhyeWNkckhsd0U0Qk1Y?=
 =?utf-8?B?QWJxMFhDMzRJdTQ1RnoySWhmU0IzeDBKdDR0aEVhalhFMndPOE5TcFFXRGNo?=
 =?utf-8?B?SDEwNktDY0Iwdk1nUFdjc2pzVWw5N1BKVVgyMjl2L3BLZkZ0djkzOXV4blMy?=
 =?utf-8?B?ZjI1TUNTTEVTM1dvREVUZ3pWbHpoRWRmRzBEN1RITUxjb2NLTHNpQlJaOW5n?=
 =?utf-8?Q?0VpQ2Hqm2M0Xgl/0I5nCbfMaY?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55027121-24dc-41d8-6a86-08db081cc136
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2374.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 08:32:59.7669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+4BG5U6sBe1+S16NeUnsKIonvJfHg4Ax2GZPBhYNjYQvi+slwKvUUfrWsb007OaKfqXfmdLy6328wLXxtLdXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB2876
X-TM-AS-ERS: 104.47.17.173-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.0.1006-27430.006
X-TMASE-Result: 10--12.816300-4.000000
X-TMASE-MatchedRID: 8+bhjh9TQnG1TiWqZWCoj/SG/+sPtZVkodQJXaDex6ctferJ/d7Ab21A
 +PyfVi9Veez4oHhYoxm7xzMaKbzCxYGPhODXVRLh031Nfxfj2zM4ptE5KnVLXjYgHxNNAM3Eeev
 ydFaExT0kGoBrODPcEBhLcNjoUT5GxoqlTanWp/gauwHwtbBRCjUDvpRQufxVP4H+2nyK0FNcVM
 ejXN5JL9qGjcxE8ErOz6JErkPuJbfcLfcGrpLL2blu+/8vPerIIfyQNHR2nabL9b903kllw865Q
 ern2w9CwjPe6OzQ3nO1Yo1HZ6kAVrPHp4ylMlFLfsrJIMK37At9LQinZ4QefL6qvLNjDYTwsuf7
 RWbvUtxXSLjBghTWKQtuKBGekqUpIG4YlbCDECtruV6hT84yE1iwJprBIi4pW5t+y7F2Xk5igMm
 Tu+1gKp63TCR6X0YKVaHbSonfiM9+3BndfXUhXQ==
X-TMASE-XGENCLOUD: 21b5d6fa-a713-4bb4-bc6b-642e29ccb8d9-0-0-200-0
X-TM-Deliver-Signature: 70CFC663F957FFC0D1092DF35E207BEE
X-TM-Addin-Auth: KdDXzUHWT/rH6T5DPIfbddO8eUAOXnPAgL8eY7MbC+H8devFqUY1UatRxrP
 oyfG3p194C2ZT3IavMHlSCFprirsdo9u02SxrrtTCAE94XVADmYfzPy5hTRM+TuQT+6S/h9bpGj
 hE8HkTF3UDeKnN26Sb+zwjoIbHRoRnx+TyPjj/jy/R1fXi8FxHf9lwkQwG1xKoaVqrZhFF9KnB7
 v4qE60FE+PXFwD5G0QE6hNlC23V3TCuCeVDNxktcRjaEHj1tYwaGyl0ZvuIqLdXTULlLFLYmUxH
 Qnghdpd38iNIlIU=.HqtqOhDDN4qT6qLg6Y+0po74abHQsYltKpMH9TBmltULYTBAw3Sjw9Pv1h
 SSYirXREadYjMKlaK8It7AHNHBut460ScgxfqQ1ZlpeFwoXPT1iBxKRdHxtxcNVmN0dCvShqjGu
 xiudGKGaccZZPraH08LA6NrP39c23/ON4q/qETF+FwBA/1CPNmJhjBY9+HmtCcRjDnSXC3WLJ+X
 qAyWYak6b+vCgcHbNyi+5aWEjbm4C3GU/AEw8xfjpDCMQusf9DCFDAzjEcvCzjbye6EogMy9KUO
 2jHvMuKx4zZSpSIy/BQ7oX0befk5w04VS8DMFmR6Q81bSaGQLo0E7+sUlAg==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
 s=TM-DKIM-20210503141657; t=1675672381;
 bh=OFA3qzgSxAlEbMZ+CfnvK3J+kZ0cQcrcHsO1sj4RJe4=; l=1664;
 h=Date:To:From;
 b=s0+f/KeFRnzdOwRDNWxRVLkWvzO4VplX3caZ4Uz65zRC/X9Wyqok80tEvnxyb5+a8
 UaD61W78thyXkimeSc8s3fBEjYnH7pbxfjacJpFn/o0wu//GYj+DO88u7g1RYhZsdH
 ad8h2zC9cuAnNHePg2F9vHRoxEYQxxFlFnmMzIw19WZJdAm4EySctAakluOANUORFU
 xDWu0glOYioWIwVc2heflT7Fmd48VfldIm0mNTN/DdcjdSst920wWOPPN0jnThkMeg
 Vi8Cr+uHzpqm457u0OuMTcGlgeVdrX+txzozHB1RBvLd6NQwROc86TcTljiK3jjRsn
 W62EMrrKg9YUw==
Received-SPF: pass client-ip=18.185.115.12;
 envelope-from=Anton.Yakovlev@opensynergy.com; helo=repost01.tmes.trendmicro.eu
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 06 Feb 2023 09:32:51 -0500
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

Hi guys,

If anything, I'm here. Not sure I'll have time to be a mentor, but if there
are any questions I can answer, you're welcome.


On 31.01.2023 16:35, Stefan Hajnoczi wrote:
> On Sun, 29 Jan 2023 at 17:10, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>>
>> Hi Shreyansh, Gerd, and Laurent,
>> The last virtio-sound RFC was sent in February last year. It was a
>> spare time project. Understandably it's hard to complete the whole
>> thing on weekends, evenings, etc. So I wanted to suggest relaunching
>> the virtio-sound effort as a Google Summer of Code project.
>>
>> Google Summer of Code is a 12-week full-time remote work internship.
>> The intern would be co-mentored by some (or all) of us. The project
>> goal would be to merge virtio-sound with support for both playback and
>> capture. Advanced features for multi-channel audio, etc can be stretch
>> goals.
>>
>> I haven't looked in detail at the patches from February 2022, so I
>> don't know the exact state and whether there is enough work remaining
>> for a 12-week internship. What do you think?
> 
> Adding Anton.
> 
> I have updated the old wiki page for this project idea and added it to
> the 2023 ideas list:
> https://ddec1-0-en-ctp.trendmicro.com:443/wis/clicktime/v1/query?url=https%3a%2f%2fwiki.qemu.org%2fInternships%2fProjectIdeas%2fVirtioSound&umid=dfa27714-6bd5-4f51-afb5-d0561afc03c8&auth=53c7c7de28b92dfd96e93d9dd61a23e634d2fbec-45bc593563b7a9935517db85a53255e7b79f3550
> 
> Please let me know if you wish to co-mentor this project!
> 
> Stefan

-- 
Anton Yakovlev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

