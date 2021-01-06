Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8C2EC59B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 22:22:14 +0100 (CET)
Received: from localhost ([::1]:59958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxGFw-0007tY-Ok
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 16:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxGDk-00066g-4m
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:19:56 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:40560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kxGDh-0006nc-KN
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 16:19:55 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106L677a188788;
 Wed, 6 Jan 2021 21:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=kNrZA6V5ZiZbkLGWwixt2hT5z2cdjLG6jghxPaogTNY=;
 b=oUC2CQqxuxMbKH193RNg6u1WwEVDP9JV7XjjlTHhjk20HSou1gon5DiJfDFOsbvAG9WP
 ybszzYtsHH/Zb6zMcAyst1MDEt49WBAGlZpxo8l63Ki6Q9WneQYQx3xuz6r0IDETRNEr
 qBbYqseYiSOjjjj2w5EXJDZMtz1udYPRAEcIq29GyrK/t7LHPXRqrvhfDLaFpbTPwLiI
 bi1Fp0HkSmGX36lWURakHOyySwYJJ56FoxYqs4Nf511J5dcQChDMJyigdxMSJtaMgnsB
 YpJxOwu9mxW6acBgmA5R98j2Uizva8zhB492ZDoJ+7PaDUzImBrXP7e4Ci5KPtGj8Vh7 eQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 35wftx9gmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 06 Jan 2021 21:19:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 106L4p1l002421;
 Wed, 6 Jan 2021 21:19:46 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 35v1fabbav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 06 Jan 2021 21:19:46 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 106LJjIX007013;
 Wed, 6 Jan 2021 21:19:45 GMT
Received: from [10.39.251.70] (/10.39.251.70)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 06 Jan 2021 13:19:45 -0800
Subject: Re: [PATCH V2 05/22] vl: memfd-alloc option
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
 <1609861330-129855-6-git-send-email-steven.sistare@oracle.com>
 <20210105162708.GH724458@redhat.com>
 <d6c1b91e-9c49-3356-554d-39da53a11e16@oracle.com>
 <CABgObfZT9wxJQ9DxVBxFRse7G8zKb6J=MF-Mh9X8p8kZOuBtOw@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <eacc4ee2-5733-367a-5236-a19f81d6a1c0@oracle.com>
Date: Wed, 6 Jan 2021 16:19:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CABgObfZT9wxJQ9DxVBxFRse7G8zKb6J=MF-Mh9X8p8kZOuBtOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101060121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9856
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060121
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/2021 3:10 PM, Paolo Bonzini wrote:
> Il mer 6 gen 2021, 17:37 Steven Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> ha scritto:
> 
>     Yes, I considered that, but there are other memory regions that cannot be controlled
>     by the command line but which must be preserved, such as vram, bios, and rom.  If vram
>     is not preserved, parts of the screen will be blank until the user performs some action
>     which refreshes the display.  bios and rom should be preserved rather than re-recreated
>     with potentially different contents from the firmware images in the updated qemu package.
> 
>     However, your comment reminds me that I must add a few lines of code to preserve the
>     memory-backend-memfd.
> 
> 
> A new option specific to memory is the wrong way to do this. If a special mode must be specified when starting QEMU, you can make it a -machine option and block the QMP commands unless it's specified. Otherwise you can use "normal" migration to marshal and unmarshal across the update those memory regions that aren't backed by shared memory or memfd.
> 
> Also, because of the mess that vl.c had grown into, adding new "simple" options is going to be very very hard. In fact I am working on turning many options like -smp or -m into syntactic sugar for -machine; at some point I would like to (almost) forbid adding _any_ new option.

Will do.  Thanks for the heads up on the future of vl.c.

I defined the option independently of cpr for generality.  Do you think this could be useful?
If yes, I will name and define the -machine option to use memfd;
if no, I will name and define it to enable cpr, and implicitly enable memfd without saying so.

- Steve
 

