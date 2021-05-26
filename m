Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3596739160A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 13:26:05 +0200 (CEST)
Received: from localhost ([::1]:50022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llrfn-0004A9-VA
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 07:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llreK-0002dL-Ro; Wed, 26 May 2021 07:24:32 -0400
Received: from mail-eopbgr00107.outbound.protection.outlook.com
 ([40.107.0.107]:43438 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1llreF-0003vr-NZ; Wed, 26 May 2021 07:24:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ln8Yr17HwY5HUc9Ed8DKC5juP/wze02qrEsI17A7GoDDbSwIHo/wctXWTFfE7zeD2fMJEcT/bW8F66HS8P5zX3+oN911WOhmGCTN2iZXMWDVj2h7JyHQ1hKIqpBfSYPjMP8FMcinJLFA2VEnhe/lLaso7+H3tmKZ1PV5ZjLpxIhAx148PwpVF9iltFQb4OPjkVBKX0X2teJnKdVjj2h20ctS9gGpsMgEwCj2n0mjdOviao4NMWDE3ZRSNBf3C1MXd3fqG743EEv4Ke/DfpP3X5vQGFDCCZRDkQ+W7Ew6k7/2xvtFWvekBzRg/poi28J0ThfGht8LKm4NPEiSg/77qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWB6NUwPncafHeNi0RUVGb92GztiEVEIJKcOFAnOffU=;
 b=J3aQA19b6PlKL9jR7EIAN0QDluXPnQk62G96zIepVapkbZbkur72DwGMrsfzIm3bu3RL7pUE6zX3oGGvHcIFnFgD0GJ/Bx1srA+XVwCfY3Mv90ERSfXX+sGaWBV9nzAA25taKbwBsmnmDXT4JlxqquSiCIDNh3HNzupS/mACUBNcktX0Akj1p5zKNXdxOb8NQuijLhBAKz+ZUo1Gk3sJVYpOQDYy7QjBxtQ6ucoXzQ1cXbj+Dgo4XyMv/ykxHdfIhteCr74l6U0byEJIfTOSiGyqpQNb3uM34oU0KQtDr+Ju8gzskRphAditqJ+gw08cPObIgnBz/0BMy6KXxbuc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWB6NUwPncafHeNi0RUVGb92GztiEVEIJKcOFAnOffU=;
 b=lA0MiFGyqdoUNweRt/dOWA3tGj7RkMbpUe61I5GFKZpHUAJRGlYJ8Fz1awnFoIAe7IF/bm9/zu1Rq0cOy89WxSgy+6YRAnOYUm0btrEOMTwUvZpL1//tIk8s759zgrGBn+yJsk7/gYv6Qzm8IlkpK/5xtoPhD1sDBwvvF1xIuLM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6855.eurprd08.prod.outlook.com (2603:10a6:20b:398::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 11:24:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%8]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 11:24:24 +0000
Subject: Re: [PATCH v4 04/15] qemu-iotests: add option to attach gdbserver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210520075236.44723-1-eesposit@redhat.com>
 <20210520075236.44723-5-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <becc0bde-5de8-7cd3-0b5e-76bdb830af11@virtuozzo.com>
Date: Wed, 26 May 2021 14:24:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210520075236.44723-5-eesposit@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.195]
X-ClientProxiedBy: AM0PR04CA0017.eurprd04.prod.outlook.com
 (2603:10a6:208:122::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.195) by
 AM0PR04CA0017.eurprd04.prod.outlook.com (2603:10a6:208:122::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Wed, 26 May 2021 11:24:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ec13ac3-98d2-4cf3-1d75-08d92038d06d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6855:
X-Microsoft-Antispam-PRVS: <AS8PR08MB685512A3B2EF1D94F8493458C1249@AS8PR08MB6855.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dJS5pjceukQT36/Et3qPfsWPiqXewC07AB3hPHLbfzKzUA0iLvJPA5HJ8TXDUn09SqDp2+8AoLiFeGX2RYxi/XdjnxafR3NmKwZRN25YDtDzqnnMqTMlf3b5wtYISh1b0iV1nPn92Bx22eeubULWEjuxq2cEGSdvVDh+eqJwS90tQrtBjnupbRm5hyKwQRh0XJlL6V6TMPC6j33O53Zob0LqN06GRanQAz8GUO1yramL4Ygt2xPmTPeWMy4Potof5YjVVvGcaLL6esl9h6Q6/EuspuUickPegyDEJDV8byvYOHdcSO/gmItcegd/SlEHwHMSQiGvMEElqr7lvHGBilkzvdaSDfGGPLOUUAoiCtCvQaAxmxyCJwYhbRWMCAAYLCPbe6Ra25I4WTTC1PdX8+pvNTnC6hkMHMUkmQ9rnwNNS9FiYh6nl9jWV4c9hbFWUXpYSeDOEBZUNH2UwXACuvYUwI+dTGhrr2HgKJIVdfbs7a8soTzLng+Vu/z7M7wxy41BRe8k1LIH6OPIt1IExyyCcSKkHYjdFTMr+AylC4zopI7EO2uuJC8JXD0mkAX9tdzQ+s6yGEMZ0y8qqKvJopBkaeBzOWPgCA7vQX+MxLsGDtl876bR5iF5ZRdUUQvPeCaFtsYpgkScTZrvxuas6zZM1QBc1WEP4F3GizwOhHSQbYYFtx1nkuPOpdR32o43tf+kHI0Px+9nSc9KjsgJFHMe9Ss4WDHuvn0Ksw79wR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39850400004)(346002)(396003)(54906003)(4326008)(186003)(38100700002)(52116002)(6486002)(26005)(8936002)(36756003)(38350700002)(316002)(2906002)(66946007)(16526019)(478600001)(66476007)(86362001)(31686004)(2616005)(83380400001)(956004)(66556008)(5660300002)(16576012)(8676002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Y2JNSGhCTFpucXROQzNJTE1mZWxKWmgxeDNUNHFyZTFFSFBhS0M0WndMTWhS?=
 =?utf-8?B?aWFtNE1ueGlZbnpPS3creXMvWEhlaFJKOUNscWl6KzloT0d2My9hdHN0cjgy?=
 =?utf-8?B?S0dJTnZYSFlCSlJjZlovOHdjMmFHNXhzOXZ6a1R0S1FHODR6VWt3L0VxclIw?=
 =?utf-8?B?TXBNaEZrNzdlb0h2Skt0ZXRoR05vVXZHV3JSdXU5SkorOCswdWFIbFgzZktw?=
 =?utf-8?B?QmNzaDRySldaa0xraFRTKzZJVWR4cStZeVN3b3pMSlE1VFQ4S1ZCMUtYNGY3?=
 =?utf-8?B?Qjl4TTZKb2g4NFg1RjYvSzhJQThvYjRPbVBFSmlyRnk2YVgzam95VVEyeUs0?=
 =?utf-8?B?d21PQkhhZ2w1Q1ptZVIxTWJycU15SzVra2NnVnliKzh6L3orbXllK01TSEk1?=
 =?utf-8?B?YzQ0T1U2QTEyZkc5UFlyQ0xGcUNXTHBjdW40LzJGUW81andaSTRjNmxIb1Ns?=
 =?utf-8?B?YStSSDVxdEFta1h6UUU5VjJ5S1RaekZWcjQva2pIcUpHQlFNckpSM1VNaWtW?=
 =?utf-8?B?NSs0THlySnUwWDNFdVFYWnVSaWNpVEs3QXlEbS9pZW9XNW9KUHk2Y0lFYlBV?=
 =?utf-8?B?emZxMjU3WUYyb1NmSTJuZE5ZSGFwbGg4YVBCdWIrVklxbmVva0Y0NTFoR2Y1?=
 =?utf-8?B?OHNxT04yUWhRQmEzZ1FwZE5iUlBseEg3cmF2OC8vZnVKRVNtNENNS2krNllv?=
 =?utf-8?B?dzlpUEZ6bUozSU9zcDBRVlJhZTdLcytHQStqdGhpYkQyeEg3WWNkTVhyVEZR?=
 =?utf-8?B?bFlVeFU4ZVdKQWp1MWFpbXQvL3BjRU90L0dXNXZUSnBGZ0ljZ0JLUUNGK3pU?=
 =?utf-8?B?VXJhelo2QTU1c1Q0ekhuZzU5L1g1OEZXN00zbU4yU1cxRE1aVzJjc0paU0dl?=
 =?utf-8?B?R1FuTWFtbGdVQTl3SEQxSFcyckNxbUg0V0dlREM4aFJ5TmZnUFdDUTVNOWtE?=
 =?utf-8?B?dFJxUXRacGxFZUpMdEZ0TU9EUVdnVGsrc1RTR2lpSEhraDNpNW4rZERBWVRU?=
 =?utf-8?B?MCtpc2NpT3hGSURaYzU4bm00N2pRTEhOS1NBcDJDSlRQdjY3bHZLTVJQU2hv?=
 =?utf-8?B?aUw5cllZUlpKNkRkeGFmbUcvZ0NQMEEwYklIVlEzL2F5V0c4Zm9vZTVsbjdz?=
 =?utf-8?B?SytZVU9XaTJEZDZXR2RxMTV0TmRHbVEwZEo5UTRhUHRBR3ozeUpwSXp5eEVl?=
 =?utf-8?B?ZzF2NUlXanNJTEpGWXlZTjJJc2t1YVY2alZQbUcrelhmKzdnczg1REloWUFo?=
 =?utf-8?B?NStJZU5XeVdPS1V2MFpLR1ZTU29jbXVJUDFiOG0zTk5TeE55bHhFUDVNdjc5?=
 =?utf-8?B?MUllQy83R3JTTjFMSCtoNm10enRtSHF1c0toS0RlYmcyQi9UTWlvelh0aDJC?=
 =?utf-8?B?SkRyMDg4bzNTS1NzN2E4a2NPMFliSGtqcmlJUUNVNGwydVFqYU5tYlROd3h5?=
 =?utf-8?B?OEdaSnMzWm9UdXJGM2xybThVaFJ1OGFhb1RnVE51a1RUZjkwVkd1ZTZlTjNp?=
 =?utf-8?B?M1h5SDNvUE1CakpEY0RFUEFTQlcyWm0zNUxTUm1ZOGY4QXlYblZzd0FOTkMr?=
 =?utf-8?B?T1QzTHhXMGhDc2JGVTlycG95Qm51UkUycHNxa0JKSlAzNGxNS0ZNRFVlYVNP?=
 =?utf-8?B?d1hFQk9HYkJjcWUyaUVERlNLdTVvVGNmbEt2WGpDK1gvTGdNMkxZVkp6WVov?=
 =?utf-8?B?QlR0VFNSdS95SnYxbjBtVnVNMjBwSytMenM2QlJ3ZlFuY2s0NWVjRGkzWnNZ?=
 =?utf-8?Q?AbQN9bHDNKieMSB1p3HtRWfmO+YaneNXG/gKijI?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec13ac3-98d2-4cf3-1d75-08d92038d06d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 11:24:23.8586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9daQmvArAelKncar8EOkAp5a1QIMB45tDNkka0kFlQeM1oVaVjLk/8hkWdn23CrFrXPlNClQGcw74ylnjgoYyqSP4MHlR+Wj6BKgSJ7RUJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6855
Received-SPF: pass client-ip=40.107.0.107;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
> Define -gdb flag and GDB_OPTIONS environment variable

Let's use --option notation for new long options

> to python tests to attach a gdbserver to each qemu instance.
> This patch only adds and parses this flag, it does not yet add
> the implementation for it.
> 
> if -gdb is not provided but $GDB_OPTIONS is set, ignore the
> environment variable.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   tests/qemu-iotests/check      |  6 +++++-
>   tests/qemu-iotests/iotests.py |  5 +++++
>   tests/qemu-iotests/testenv.py | 19 ++++++++++++++++---
>   3 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
> index d1c87ceaf1..b9820fdaaf 100755
> --- a/tests/qemu-iotests/check
> +++ b/tests/qemu-iotests/check
> @@ -33,6 +33,9 @@ def make_argparser() -> argparse.ArgumentParser:
>                      help='pretty print output for make check')
>   
>       p.add_argument('-d', dest='debug', action='store_true', help='debug')
> +    p.add_argument('-gdb', action='store_true',
> +                   help="start gdbserver with $GDB_OPTIONS options \
> +                        ('localhost:12345' if $GDB_OPTIONS is empty)")

Hmm.. Why not just make --gdb a string option, that defaults to GDB_OPTIONS? This way it will more similar with other options.

>       p.add_argument('-misalign', action='store_true',
>                      help='misalign memory allocations')
>       p.add_argument('--color', choices=['on', 'off', 'auto'],
> @@ -112,7 +115,8 @@ if __name__ == '__main__':
>       env = TestEnv(imgfmt=args.imgfmt, imgproto=args.imgproto,
>                     aiomode=args.aiomode, cachemode=args.cachemode,
>                     imgopts=args.imgopts, misalign=args.misalign,
> -                  debug=args.debug, valgrind=args.valgrind)
> +                  debug=args.debug, valgrind=args.valgrind,
> +                  gdb=args.gdb)
>   
>       testfinder = TestFinder(test_dir=env.source_iotests)
>   
> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 5d78de0f0b..d667fde6f8 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -75,6 +75,11 @@
>   qemu_prog = os.environ.get('QEMU_PROG', 'qemu')
>   qemu_opts = os.environ.get('QEMU_OPTIONS', '').strip().split(' ')
>   
> +gdb_qemu_env = os.environ.get('GDB_OPTIONS')
> +qemu_gdb = []
> +if gdb_qemu_env:
> +    qemu_gdb = ['gdbserver'] + gdb_qemu_env.strip().split(' ')
> +
>   imgfmt = os.environ.get('IMGFMT', 'raw')
>   imgproto = os.environ.get('IMGPROTO', 'file')
>   output_dir = os.environ.get('OUTPUT_DIR', '.')
> diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
> index 6d27712617..49ddd586ef 100644
> --- a/tests/qemu-iotests/testenv.py
> +++ b/tests/qemu-iotests/testenv.py
> @@ -27,6 +27,7 @@
>   import glob
>   from typing import Dict, Any, Optional, ContextManager
>   
> +DEF_GDB_OPTIONS = 'localhost:12345'
>   
>   def isxfile(path: str) -> bool:
>       return os.path.isfile(path) and os.access(path, os.X_OK)
> @@ -72,7 +73,8 @@ class TestEnv(ContextManager['TestEnv']):
>                        'QEMU_NBD_OPTIONS', 'IMGOPTS', 'IMGFMT', 'IMGPROTO',
>                        'AIOMODE', 'CACHEMODE', 'VALGRIND_QEMU',
>                        'CACHEMODE_IS_DEFAULT', 'IMGFMT_GENERIC', 'IMGOPTSSYNTAX',
> -                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_']
> +                     'IMGKEYSECRET', 'QEMU_DEFAULT_MACHINE', 'MALLOC_PERTURB_',
> +                     'GDB_OPTIONS']
>   
>       def get_env(self) -> Dict[str, str]:
>           env = {}
> @@ -163,7 +165,8 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>                    imgopts: Optional[str] = None,
>                    misalign: bool = False,
>                    debug: bool = False,
> -                 valgrind: bool = False) -> None:
> +                 valgrind: bool = False,
> +                 gdb: bool = False) -> None:
>           self.imgfmt = imgfmt
>           self.imgproto = imgproto
>           self.aiomode = aiomode
> @@ -171,6 +174,14 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
>           self.misalign = misalign
>           self.debug = debug
>   
> +        if gdb:
> +            self.gdb_options = os.environ.get('GDB_OPTIONS', DEF_GDB_OPTIONS)
> +            if not self.gdb_options:
> +                # cover the case 'export GDB_OPTIONS='
> +                self.gdb_options = DEF_GDB_OPTIONS
> +        elif 'GDB_OPTIONS' in os.environ:
> +            del os.environ['GDB_OPTIONS']
> +
>           if valgrind:
>               self.valgrind_qemu = 'y'
>   
> @@ -269,7 +280,9 @@ def print_env(self) -> None:
>   PLATFORM      -- {platform}
>   TEST_DIR      -- {TEST_DIR}
>   SOCK_DIR      -- {SOCK_DIR}
> -SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}"""
> +SOCKET_SCM_HELPER -- {SOCKET_SCM_HELPER}
> +GDB_OPTIONS   -- {GDB_OPTIONS}
> +"""
>   
>           args = collections.defaultdict(str, self.get_env())
>   
> 


-- 
Best regards,
Vladimir

