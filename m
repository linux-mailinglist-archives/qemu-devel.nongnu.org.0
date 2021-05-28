Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B4239465C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 19:26:13 +0200 (CEST)
Received: from localhost ([::1]:49644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmgFQ-0001qv-2Y
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 13:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgEH-0000jj-1Q; Fri, 28 May 2021 13:25:01 -0400
Received: from mail-am6eur05on2114.outbound.protection.outlook.com
 ([40.107.22.114]:38784 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lmgED-0001fc-Ht; Fri, 28 May 2021 13:25:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1gZVvuAOFMDIRSTCMq71F/2wk06teccoKcUss36omgzwppQChJ7tVvTiGF692sBGq2GECF0THohhpW3sDycyJ7+WRtLN2YP0lYf2a4paZ+jvsa6wefv7OzxGfJDaQuS9FysXdkVl6RD2Ia8PiiqFpA66plxFHeoF7yIXi45D0AzR3zKs8YF9h8KlTRR30f1UdphnPzOin+nrm+A87mSIDOuaw9zGinC3nIw0IjEhcRRMn/1x36ZqZ0bAMygYHaNUayxXk33A8uD4tK9EUabj4+7v1cVOcYE4na4JbzoBWKcAhJY2xE1p0M383QQuUjkT62N6QpiYL0sxkJzqXMJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOn6avpfCs+Xv9GSfzd/TFYxOONEgmAskla0LeHu5Lg=;
 b=I9F2LOl06hfOf366nDUAEy2heZfRzFNljaWA6LPmlfN9YqgLhHc5ANmOScYN6qvnVZb7u/JpDC5BJbjzGEmP0QeCw0ZX9pz4UDMtJYAphXHuCjMXf/SsxkEnMvwDDFPMBVI5stfhXXnKqbjeYYxlXQ9b383rsr0m8pB8yrdN4t3MnskHgI1gvgosjTQ1sOI108DCR9/mN8qFloilKYHXUcBva4cvds+alw7rzKOAhSKKUwsnUJszmYcyhbovUuJmWywvf9CtDqM+KIhY7d2ODd1ujD9CWCVGrPosQy2nPjkT/8PHPGUo26tuwzRAh4ebKc406YH4ywG9e3MAG11Dgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOn6avpfCs+Xv9GSfzd/TFYxOONEgmAskla0LeHu5Lg=;
 b=cXH1PFgXtqD7TML0WQFRmP+AUpAbgxUl1wqh47CDsS05CmlFjmayQoT2iSAQtvlWKRTikJXF6hQNRXNH5d+hSWrJDg30AHS9fTdATyB48sYofCond6gjvH7RAlKhDDhNxL90o6f5Z/hJklPpNlrf2swpY0w7HzxCCRnJJ0souGk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3094.eurprd08.prod.outlook.com (2603:10a6:209:48::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 17:24:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.022; Fri, 28 May 2021
 17:24:53 +0000
Subject: Re: [PATCH v4 09/15] qemu-iotests: extend the check script to support
 valgrind for python tests
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-10-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <1e81d521-803a-e11f-933e-b145432bf6c3@virtuozzo.com>
Date: Fri, 28 May 2021 20:24:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-10-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.226]
X-ClientProxiedBy: PR3P193CA0004.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::9) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.226) by
 PR3P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 17:24:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11a5246c-6361-41aa-1469-08d921fd818d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3094:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3094C337D96710E79156D0F0C1229@AM6PR08MB3094.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWWW3XU83oed0BnM6G03kVcJSHvnco06IZhJI1wPu1mv+KK6iNu+Iq5QpVgGT9EbQjJLVAo1ENcC2OdsGpzablyxi0yjPwyPqW7DlbngUMWZrTy6pEXMB9rFEX+LjT3y1G7HXGmLz+mJ+siYxi0JMfWovAzbyDfkniDZ14cYmi4RR7PQEUVLSvYOTz7x48lpTMIuE2wbxXxzmZYNUo3HDvRn0hSSGOp3ups0j5CBx+Qgh40GWS1hps3DjyR2VqZDkFocSw78sjj8Q/2pLQ+KMdM6ioRY8fw4WXz81rMy8Cw5i//EhjNQNkTNPM0xhXQLTFhGHEguckm0l1jbdwGv/mBHPTtZya9b/SBczIr607Hw2Nkk38m0bWzadogX+BAas/v1w8mMrcepRABeHtzoxc6xTOvqg9sXGvcRWeIg/0AMp9oG7HJGgPnoLkB+0XFLf6DNwI6mFb9UD+OBQQtlI/udSp901vfe8u+5YpdYSqrLUhpcpCGgGrkMHOvYXqB821kYf1nUVN4aavNUKFLVBQtTwV0w+erzMugKl6hoyWnQjzQS8wzqubmBFZ3CYikHgc8O2WsG+Jz68/qaGyZnej/XsqT3fY3oC7LY4wZu0bn7c5mh2xvci3uXxCsQgQ6TfUP3ZAvpx48bGftftNSX7HZRc6F1qt7qrjqNxcq01rMDzBXeICEFm7KS4HwCDtnElmsKutq1fB1apG4DRJ/r1aUBRLLGspPdhpJX/HpusUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39830400003)(346002)(136003)(26005)(2906002)(83380400001)(16526019)(186003)(38100700002)(38350700002)(8936002)(86362001)(8676002)(4326008)(6486002)(31686004)(31696002)(66556008)(66476007)(52116002)(316002)(66946007)(16576012)(956004)(2616005)(54906003)(36756003)(5660300002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a1VvVnM1bnNVb0xUZ3hmYlNQU1VLakFvRWZuWnI3R3Q2SWZjaTJsOE5QUU5y?=
 =?utf-8?B?c04rRnpNMFJaa2IxU01qN09BeDRQTUtGTmJic0F4OVlFcXBnWDhTU0UvTGxJ?=
 =?utf-8?B?ZFBkRkJGTmpaemE2MXMwL1BwOEVTb2JnNXNldnZuaG9uZThNOW5MZnp6Rncx?=
 =?utf-8?B?OEFkNEFRWlBDQkdvV2tUbFY4dVNUQk0ybTFKLy9FeDlkdDE0UElyQ1hKbVNG?=
 =?utf-8?B?ejNsMitDdFRqL1RucGo1NDM5YTcxWkx3dU9jM1daSFZlMnJRNU5lOWZsS1JR?=
 =?utf-8?B?cXRBMnhCMUliY3VkblQyQ3FXck9NUnZJQ1ZsdjFPVmlnWFptbjJ3NzZRZVNB?=
 =?utf-8?B?V21mV2dpR2l2YXEwdFZlVVhjc2JVV3d5bTFSVXE3QnRGZ1BiZEk2L3ZGSDdI?=
 =?utf-8?B?Um9mRTRHZnpJOEtLeHBBRXlXa2lCMnJjTzlGKzgrSEJ1aCszSGg5U1pFRTBU?=
 =?utf-8?B?WFB1dXdLNjRHU1RBeS9VdmRQYUpqdm50V1NTeGM4ejZ5SHpPV2xMUFRFMDNt?=
 =?utf-8?B?OENEQmY2WkxPcHJsTkVRZ3hybXhjUEpham9iRmUxQ1BSUWJXYi8xUi9zeFFP?=
 =?utf-8?B?SXcvRkJtUnFsWjlNcmNEY3NKTDdjbkVJbDRpNDY2R3JMaXBQdW9lblMxc3lH?=
 =?utf-8?B?aFlQVFEvU0RHK1I0a3ZLZGNiNXF3TWE3U205ZWVUS2NleWhnK29MV2ZWcVlp?=
 =?utf-8?B?OFVCb0phcFZvL2JiZ0tPOUtyc3BqbkxRaXI1eEVFelBic05oOEtaZ09NNnFN?=
 =?utf-8?B?ampQOURwSzhRT2hjeDhoVFdPU2RZTVIzRXQrYUxITExIbTFNdHdxbW5URzI3?=
 =?utf-8?B?cko4OWNDSWZ2blA0WngyTHo4YUh6VnNBWjdJckN5cnlpWVowOUlyZFFSanhx?=
 =?utf-8?B?WjBPVzlNdmd6SWJnelBHYzhFYWg1RlhjYXNSMjRxU1A3T1c3UUM2VC9nMGlQ?=
 =?utf-8?B?YlFzaXFhaExsOGtPNTZMSXdnV3UrQ1BPdXR2ZEdaOTF5V3lGOFkzRW04SGR4?=
 =?utf-8?B?KzJqekxnd1FrVXlaZHVRdUVIcXYvUFBrSXdsTCtZVW9uNjE2Q3ZDUzRTQXNL?=
 =?utf-8?B?aUpjY1JHMG1JeU8xc25FN1ZqUjhUOStZSHFYL1JLaUVhUzIvVG8ySHdVK1Yz?=
 =?utf-8?B?TFM5RUpFdVhWT0FTU0hxQ2NTVXRnN1IyT240UHFaVWlMQ3JyMkVHU3VJNXBn?=
 =?utf-8?B?dmJpTWMwNW9rRmJMVjNqS3JrZ3FPZnF3NWh6RDh2N2VmNzNLdXNaOFB3WG5I?=
 =?utf-8?B?NmxGeVljQWxMc293VUhPL3N4dzFDcnNadG5IVm5VZUdvYWNVTFZJeUV5TUhn?=
 =?utf-8?B?cW14ZDE5TnRPYXdTQWN2WXIwUXEzeWlvK21PL1Jtdm80cmZjcE5rYXBnZTFN?=
 =?utf-8?B?UVo0aTZhSGFiUG9tc3dQS3ExVFVCYWxwY3d4RU9QQVBpeTE5eG1zclBNejI0?=
 =?utf-8?B?R1BSbU9HWFFGNHlCZUVKSlRtSDBxRXdxZTNvRWNsdHB5bTlxNzBGM2lWb2hn?=
 =?utf-8?B?aTFwWmNqUGpvVUxEbWJwTFJnRFQvUlFNelY5bEFFVjF2QWFUMGdkMXMrcUx6?=
 =?utf-8?B?MTJreHBuaGJXY1V2M3p6MXpVQURUQVJLNmRuQ29abWQzV2xiakdFWHRnV1Bw?=
 =?utf-8?B?K0VRK2NJS0FvdlZLZ0FrbFo2U2U0aTAwdkgwNnFoQnJFWWVuc0UwMjZEdmhZ?=
 =?utf-8?B?cUdWdThkZ1JLQ2dYTjdFMWtHS3E3eUlJZTgzNDV1YWErYTc2WjlyWC9MRmU2?=
 =?utf-8?Q?GDTYCKsUpZ3iGwk5VwQsFjEiT0djM01u1gh4GnZ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a5246c-6361-41aa-1469-08d921fd818d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 17:24:53.5078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6uXT8HwKHMRlN/iRqgRbKwIFzyhSEf/aoihyF6BqxAudql9XYD5iY3WCicyfR5avJU+E+XhyE34BalhuSK4InsPdevgFKjsP9P5LN/kUgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3094
Received-SPF: pass client-ip=40.107.22.114;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
> Currently, the check script only parses the option and sets the
> VALGRIND_QEMU environmental variable to "y".
> Add another local python variable that prepares the command line,
> identical to the one provided in the test scripts.
> 
> Because the python script does not know in advance the valgring
> PID to assign to the log file name, use the "%p" flag in valgrind
> log file name that automatically puts the process PID at runtime.
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      |  7 ++++---
>   tests/qemu-iotests/iotests.py | 11 +++++++++++
>   tests/qemu-iotests/testenv.py |  1 +
>   3 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index b9820fdaaf..2101cedfe3 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -36,6 +36,10 @@ def make_argparser() -> argparse.ArgumentParser:
>       p.add_argument('-gdb', action='store_true',
>                      help="start gdbserver with $GDB_OPTIONS options \
>                           ('localhost:12345' if $GDB_OPTIONS is empty)")
> +    p.add_argument('-valgrind', action='store_true',
> +                    help='use valgrind, sets VALGRIND_QEMU environment '
> +                    'variable')
> +
>       p.add_argument('-misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> @@ -86,9 +90,6 @@ def make_argparser() -> argparse.ArgumentParser:
>       g_bash.add_argument('-o', dest='imgopts',
>                           help='options to pass to qemu-img create/convert, '
>                           'sets IMGOPTS environment variable')
> -    g_bash.add_argument('-valgrind', action='store_true',
> -                        help='use valgrind, sets VALGRIND_QEMU environment '
> -                        'variable')
>   
>       g_sel = p.add_argument_group('test selecting options',
>                                    'The following options specify test set '
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index c9628e6828..41462a80fc 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -97,6 +97,17 @@
>       sys.stderr.write('Please run this test via the "check" script\n')
>       sys.exit(os.EX_USAGE)
>   
> +qemu_valgrind = []
> +if os.environ.get('VALGRIND_QEMU') == "y" and \
> +    os.environ.get('NO_VALGRIND') != "y":
> +    valgrind_logfile = "--log-file=" + test_dir.strip()

a bit strange that you need to strip test_dir here.. Why?

> +    # %p allows to put the valgrind process PID, since
> +    # we don't know it a priori (subprocess.Popen is
> +    # not yet invoked)
> +    valgrind_logfile += "/%p.valgrind"
> +
> +    qemu_valgrind = ['valgrind', valgrind_logfile, '--error-exitcode=99']
> +
>   socket_scm_helper = os.environ.get('SOCKET_SCM_HELPER', 'socket_scm_helper')
>   
>   luks_default_secret_object = 'secret,id=keysec0,data=' + \
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 49ddd586ef..319d29cb0c 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -282,6 +282,7 @@ def print_env(self) -> None:
>   SOCK_DIR      -- {SOCK_DIR}
>   SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
>   GDB_OPTIONS   -- {GDB_OPTIONS}
> +VALGRIND_QEMU -- {VALGRIND_QEMU}
>   """
>   
>           args = collections.defaultdict(str, self.get_env())
> 

commit subject sais "support valgrind", but actually we only add a variable. valgrind is not actually used yet.. I'd reflect it in commit subject somehow

-- 
Best regards,
Vladimir

