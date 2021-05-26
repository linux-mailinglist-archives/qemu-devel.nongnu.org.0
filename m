Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877383915C4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 13:14:37 +0200 (CEST)
Received: from localhost ([::1]:37558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llrUi-0003jC-KZ
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 07:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrTi-0002uT-Ir; Wed, 26 May 2021 07:13:34 -0400
Received: from mail-eopbgr50119.outbound.protection.outlook.com
 ([40.107.5.119]:58110 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llrTf-0005By-2b; Wed, 26 May 2021 07:13:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtQ50Oa/Oxb7clqCP2fl6VxUTz3yJr7CXfrZDUECwG9VYMZSV+HXuUPhl/THzJOzFPs/c7eYeO4NUHtiYhqXa0GXLabBY2AJh9uJnfp3a/1PV9ovAtxR/y0wkn6L88TRrP5xgdt4OnEITgcAcAwKYsikXOuERYM5zvLhJ97scHin4sFci0HCMLnbqRWPuFwFY0LuyGJN5U10O+EkdvZQSzMQZhgCgDkG5zHr8meN0WMwRKw4hRUgUDea/QhnuJ4otgwyyF1B2kedrnpqTkmu80I96OQ7XfhW8Fcdw3AIZ1pPLqTZjdvj990B/FSkZ4OZ/AXV6D9xgwRM48jx3jjMJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YIMnvxHqe1hTbGyff7nxgKWORN1ZaoJpbOq7jKpfm0=;
 b=QRenw3UUEJozJ4kckXLXiJO3q4WDIr60WF7vDHRKqtxyVjRD0D9ny9ooTBssP1eQ3bHvHVPquJ8jElwyEUACoU/nL2lu3Rt282aFQpJ2f8rWpNH8cB+n3a0aqsqfzeCSqKSDocOIkWvLgKWMGlCAR9OSToqsSHi0UzMTf/z+ChyJikZoB8ie+OwxpJ+/DE/ISR5BTixqBPZ8+3PG5OGE3qRbVZfqlBD+hOkzuTAmkmPIl/s8tpWxvkQOaHFCVKdD71YxwsWr89nI3TjjsFhMlnKiXY3ROuh3+gzouRGH8dKlc9oXZUgh8NzNFDqomu4otfzRWeayFrMQT12embLOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YIMnvxHqe1hTbGyff7nxgKWORN1ZaoJpbOq7jKpfm0=;
 b=trWu9C01zF5qBH49hnvkTiD/1A1yYTRiDT8603eXWGA213clGziE1XjiP0qQay38mODtWkb5qmuvm7BwhdP+tf8EDoUOdzaO3e2kGcdXoOp5uXLq/yCs2Zin8aCPWLSF7hq5V0JpFWih0B+/WeFcZfgD4sbeda+2mNje7KDDa1U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2033.eurprd08.prod.outlook.com (2603:10a6:203:4c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 11:13:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:13:27 +0000
Subject: Re: [PATCH v4 01/15] python: qemu: add timer parameter for qmp.accept
 socket
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-2-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <2e9f2165-451d-48a7-c8a0-4e5eb29787d2@virtuozzo.com>
Date: Wed, 26 May 2021 14:13:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-2-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM4P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM4P190CA0008.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.24 via Frontend Transport; Wed, 26 May 2021 11:13:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dfb9773-1d4a-409a-f2fc-08d920374915
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2033:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB203348AD4B7041BAFFACF73FC1249@AM5PR0801MB2033.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdMXICXRkW6b3iqwYbZpgqOumIhBRRaAD8XB++41PnY5Wx7+/Oxl2CQ9PWmq94RR7jyQRaVu0PXCA8ADr9g2ILVts+ECWloOwPk65LBs7yKZGk8QbPwd3ADFo3I+wjTGg0Wsr9VTBejo9TosexBm8z5joH+k80agtqLw/zsRXLAaSS9LXJI8Jt64LtaG6aDdMHj5LMCsA3wVQVkmTSLKFSjk7rye1rkHzowFOPjAQslXB9NTEa0fI3g9ztnlgqh9UrL7Xv2DszOoAaTn+czY97z5TOxMPWwV2F//JR4UkvVU+FQ9Mj4Kge4QlgNWUJCZakq9oIR/t1WnFHeCvKKM1qI/L5iX5lAsBWoJCzdALVXgnkX/AqjOnVGua74QmEDaqbWrd5F9JgC6flpZ8hE3rcrW1cS00tEYGDVVfdNi7PG620o2Bw6xcbcHFbqIwXw5UdxQw3jbNzmPP1SEQGlRgQGB+9cIRP691OCGZ6RLqt7NLCr5QHmL+d+4/0TyWMvB40NNf6NGRFmOtXVJvnJHMYe3iBLwkd6Rv5IMKg4rU23mDVFNt0y3z3RbQ+wCFgPgmi49YufXMC346P3NCNnHkuW5IygcRz27P0hGIpHRsRmBzWmCtN4q3/aE82wu/8R6ny8M+IBbx4vg/e4zVcCySw8HNEPuvIv2JlBgehiU1tv3TYprruH2Tphh3+GoCpcLzUB1EYGpVpaGqFgBXnr48TAUKSNw/Z8TYHK18PEF0AA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39850400004)(136003)(346002)(376002)(478600001)(31686004)(16526019)(26005)(36756003)(16576012)(5660300002)(2906002)(66476007)(52116002)(8936002)(8676002)(6486002)(956004)(316002)(4326008)(186003)(83380400001)(31696002)(38100700002)(66946007)(86362001)(38350700002)(66556008)(54906003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZjRsbHk2Z1RJY3ZGdzRVcGh0ZC9vNVR0NFEvZ0NsTTlTNjNaRVJzTjlCdDV2?=
 =?utf-8?B?eWdEZkZqNUhGb1B6QzRBWVo0US9kbTN5OXY5cEM4a2tESjdSdmxTMDF4Rm9l?=
 =?utf-8?B?dVJ0WXNNQ3RMNWR2MU5hUUJXU0l3ZmFKcXV6WmhzZHJLSndHNEo5VTZFV3or?=
 =?utf-8?B?RXcrVXVxNWNIb25YNU1tRUZ2NGZqZndRdVZmS1BrRmEzakEvQVlBb0ZaUk1j?=
 =?utf-8?B?dE54TzRpSks5enBXU2lnbzhpNkZkZC91TlAzRVdLWFdHaEJ3bUNkbS91SGRQ?=
 =?utf-8?B?YlUxczRhWDZWb205OVdnbEpQaWtPMnJwYml2engyZ2lzSnRNQ0U1aXBaMGJO?=
 =?utf-8?B?WXhoUTdMdEZnUE4xQkpDbEVYNU5zWWp2cVFJdDlCbnMwL0NiWnQ5Nk90Q1NG?=
 =?utf-8?B?Zkk2aC9sbkZRRzBHbGNhVXhHaElFMzg4V3BMNENxVy8rSmR6SCswa2MxRDJK?=
 =?utf-8?B?T0JLdHRMTmJqMFJIeW9IWWVuNmNTLzNYaGdROHp3RnhKNURWd1BDMlFvSkpM?=
 =?utf-8?B?SHlYUGoyRElkRWNJdFM2bHAvYUdHQXB5RENsQUhJMXRxb2ZGZmpnN1ppMG5I?=
 =?utf-8?B?UGY3K3VBZ2ZyalZsR2pCNGhrMDQvT1hMSElEbWppVFppVlU2TkhhU09CeXBy?=
 =?utf-8?B?WFZtZHhDTkExWlFuaEcvZ1YrcXRaQmUyNHEzdnFXSmFwdG95c2FueWJUa3N1?=
 =?utf-8?B?YmtTVlR3Nm9xa2lTdzNUUFRYNjZuWTAvbmlLOGtyV2FnWERnR1QwV1dNS3cw?=
 =?utf-8?B?UHhqb1JyZ1FQNjVJcngvTk9FdUR1aXlSUzFXUXZIMUNqRFBWV0E5ZHRTbWJZ?=
 =?utf-8?B?d3hVTXFmWXlGTUpBckJrZUptRkJqQTZxcDJBRUFtTWszUVVCYzF1WW9KN2Fp?=
 =?utf-8?B?MFRoeUh2RzJLb1RJWnlWMmFFNEdzZWRyakNKeVdMK0JoVVZXbm96UFp3bWsx?=
 =?utf-8?B?aXBZNERoOGpSczE3SWlTK0t4WXNGRTRjWVZicllUdnp2WjF4VGRSNW53T2dO?=
 =?utf-8?B?ejVIbER5QWdIN0dpbnpNcHZ2SXMyR05JQ0x0SmFZZjlVbGJDMHFYSzczUzgr?=
 =?utf-8?B?MkFTc09LaDJYMyswQzcwSjNxcis1cDJQZ0Y2UFNBR0NUa09HZWUva1k5ZU1Q?=
 =?utf-8?B?L3J3MU5VNXVJcGhGMVZId1B2OEt2K295bHNxYkhuSFo5b1ZxTmJROE5sNGZH?=
 =?utf-8?B?by9HenNjbjRYdnFlTUZ3WXV5VENad2VCai9oWWNoaTJCclEwejFVZENwYVVO?=
 =?utf-8?B?OFZFVHNSSytHRHRsZTlTTFA1cnBKNW9DemUvaWgremJpRWF6TFlKZWhWUU44?=
 =?utf-8?B?R2x1MTZ5UGpvU3NnemRyd1FCUWhUUmFhL2VsZW1hVXZvb0NDTE9wSTNmbVZM?=
 =?utf-8?B?aGdOSmZxLzRxN3VualNrbTJSTGU2UmJNeE9DNjJvSFRKLzJzaVdQQ3pmbEh2?=
 =?utf-8?B?UGI2dnJYYTFvSitTTnJTcnc1U0VxczlTUzhTaktvd0M1dUNuZ2p2U3RJOW1i?=
 =?utf-8?B?MFp5R1FrWXFMZzFvOTJFcFV4MWpSb291V2tGdFUvUFhOTExZTVdpY1pJeDhJ?=
 =?utf-8?B?VW9ETmgxaWpBVFhadXpuL1NhMUl0a3B3MHNRN0NYOStjS2pCdDVzUy9panEr?=
 =?utf-8?B?dnpvZDlaakdObUhnQU84ZTZHdkNBZlF0VkhKT1JEYTNDTzMyTnBBME9ZM1ZK?=
 =?utf-8?B?NmtLekQxb3YwVDg4YXMyQzZ5b0s4Ykkwb1lmOXVtZFV0M3JyeDRsZVlubnJs?=
 =?utf-8?Q?jTsaZBdx+LuhpTDx23DkQrIN7Ao+S7DJc3JLBZu?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfb9773-1d4a-409a-f2fc-08d920374915
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:13:27.2923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRYFTcwXsGhsFnuSlACYU9eaQ218JmtJi8WrGrOy5Zy0smR30KCiiczw43fCoyQ28JuhOjEfzJiE57gGhKkki2sAsfB9DPkUQajziuVIhK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2033
Received-SPF: pass client-ip=40.107.5.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

20.05.2021 10:52, Emanuele Giuseppe Esposito wrote:
> Alsp add a new _qmp_timer field to the QEMUMachine class.
> 
> Let's change the default socket timeout to None, so that if
> a subclass needs to add a timer, it can be done by modifying
> this private field.
> 
> At the same time, restore the timer to be 15 seconds in iotests.py, to
> give an upper bound to qemu-iotests execution.

Hmm. Not to qemu-iotests execution, but only to connection to qmp monitor, isn't it?

> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   python/qemu/machine.py        | 7 +++++--
>   python/qemu/qtest.py          | 5 +++--
>   tests/qemu-iotests/iotests.py | 3 ++-
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/python/qemu/machine.py b/python/qemu/machine.py
> index 6e44bda337..df32de4377 100644
> --- a/python/qemu/machine.py
> +++ b/python/qemu/machine.py
> @@ -89,7 +89,8 @@ def __init__(self,
>                    socket_scm_helper: Optional[str] = None,
>                    sock_dir: Optional[str] = None,
>                    drain_console: bool = False,
> -                 console_log: Optional[str] = None):
> +                 console_log: Optional[str] = None,
> +                 qmp_timer: Optional[float] = None):
>           '''
>           Initialize a QEMUMachine
>   
> @@ -103,6 +104,7 @@ def __init__(self,
>           @param sock_dir: where to create socket (overrides test_dir for sock)
>           @param drain_console: (optional) True to drain console socket to buffer
>           @param console_log: (optional) path to console log file
> +        @param qmp_timer: (optional) default QMP socket timeout
>           @note: Qemu process is not started until launch() is used.
>           '''
>           # Direct user configuration
> @@ -110,6 +112,7 @@ def __init__(self,
>           self._binary = binary
>           self._args = list(args)
>           self._wrapper = wrapper
> +        self._qmp_timer = qmp_timer
>   
>           self._name = name or "qemu-%d" % os.getpid()
>           self._test_dir = test_dir
> @@ -323,7 +326,7 @@ def _pre_launch(self) -> None:
>   
>       def _post_launch(self) -> None:
>           if self._qmp_connection:
> -            self._qmp.accept()
> +            self._qmp.accept(self._qmp_timer)
>   
>       def _post_shutdown(self) -> None:
>           """
> diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
> index 39a0cf62fe..afea210d9d 100644
> --- a/python/qemu/qtest.py
> +++ b/python/qemu/qtest.py
> @@ -114,14 +114,15 @@ def __init__(self,
>                    name: Optional[str] = None,
>                    test_dir: str = "/var/tmp",
>                    socket_scm_helper: Optional[str] = None,
> -                 sock_dir: Optional[str] = None):
> +                 sock_dir: Optional[str] = None,
> +                 qmp_timer: Optional[float] = None):
>           if name is None:
>               name = "qemu-%d" % os.getpid()
>           if sock_dir is None:
>               sock_dir = test_dir
>           super().__init__(binary, args, name=name, test_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
> -                         sock_dir=sock_dir)
> +                         sock_dir=sock_dir, qmp_timer=qmp_timer)
>           self._qtest: Optional[QEMUQtestProtocol] = None
>           self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index ec3c69daf1..5d78de0f0b 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -571,10 +571,11 @@ class VM(qtest.QEMUQtestMachine):
>   
>       def __init__(self, path_suffix=''):
>           name = "qemu%s-%d" % (path_suffix, os.getpid())
> +        timer = 15.0
>           super().__init__(qemu_prog, qemu_opts, name=name,
>                            test_dir=test_dir,
>                            socket_scm_helper=socket_scm_helper,
> -                         sock_dir=sock_dir)
> +                         sock_dir=sock_dir, qmp_timer=timer)
>           self._num_drives = 0
>   
>       def add_object(self, opts):
> 

I'd call it qmp_accept_timeout to be precise. Anyway:

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>


-- 
Best regards,
Vladimir

