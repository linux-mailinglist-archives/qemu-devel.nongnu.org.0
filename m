Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C16406CBD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:12:33 +0200 (CEST)
Received: from localhost ([::1]:49186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgKV-0003ig-TL
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:12:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mOgIx-0002Ok-Ks
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:10:55 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:31467
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1mOgIu-0007wL-4l
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:10:54 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AAVBURqOkE3absMBcTiejsMiBIKoaSvp037Eq?=
 =?us-ascii?q?v3oRdfUzSL3hqynOpoVj6faaskd1ZJhNo6HiBEDEewK7yXcX2/h3AV7BZniFhI?=
 =?us-ascii?q?LAFugLhuGOrwEIWRefygc378hdmsZFZuEYQWIK6foS/jPIb+oI8Z2W9ryyn+fC?=
 =?us-ascii?q?wzNIRQFuUatp6AB0EW+gYzdLbTgDFZwkD4Cd+8YCgzKhfE4cZsO9CmJAcPPEo7?=
 =?us-ascii?q?Tw5e/bSC9DFxg68xOPkD/tzLb7FiKT1hAYXygK4ZpKyxm/rzDE?=
X-IronPort-AV: E=Sophos;i="5.85,282,1624291200"; d="scan'208";a="114289319"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 10 Sep 2021 21:10:36 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 728024D0D9DE;
 Fri, 10 Sep 2021 21:10:34 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 10 Sep 2021 21:10:36 +0800
Received: from G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) by
 G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 10 Sep 2021 21:10:34 +0800
Received: from [192.168.122.212] (10.167.225.141) by
 G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.23 via Frontend Transport; Fri, 10 Sep 2021 21:10:32 +0800
Subject: Re: [PULL 0/7] Migration.next patches
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "quintela@redhat.com"
 <quintela@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210909103346.1990-1-quintela@redhat.com>
 <CAFEAcA-LSVj3B-xgPFMTz49D=KoRx1W7_HKjFf1bHEYdBGVgPA@mail.gmail.com>
 <f02237fb-852d-8449-e90d-97a59bcf51e8@cn.fujitsu.com>
 <87fsudn30g.fsf@secure.mitica>
 <14fbe8b5-0212-c0fd-e0fd-4198ab5d217b@fujitsu.com>
 <dc771570-e47d-9926-6a10-11ad3bfa69ae@fujitsu.com>
 <b5b57f82-4dba-53ca-ba18-51f0f6386c44@redhat.com>
From: "Li, Zhijian" <lizhijian@cn.fujitsu.com>
Message-ID: <67d6411e-341b-b3d6-c395-1e69b0a6a3d0@cn.fujitsu.com>
Date: Fri, 10 Sep 2021 21:10:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b5b57f82-4dba-53ca-ba18-51f0f6386c44@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-yoursite-MailScanner-ID: 728024D0D9DE.AEAA1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


on 2021/9/10 20:55, Philippe Mathieu-Daudé wrote:
>> BTW: Does QEMU provide any mean to set http(s)_proxy to building vm ? Currently, i have to
>> hack the code like:
>>
>> -        self.ssh_root_check("pkg install -y %s\n" % " ".join(self.pkgs))
>> +        self.ssh_root_check("setenv HTTP_PROXY http://myproxy; setenv HTTPS_PROXY http://myproxy; pkg install -y %s\n" % " ".join(self.pkgs))
> This is supported since commit b08ba163aaa ("tests/vm: send proxy
> environment variables over ssh"). Maybe we only pass lower case
> variables and should consider upper case too?

Great, I'm glad to know this. Thank you.
Lower case variables also work well on FreeBSD, so it's sufficient i think.


Thanks
Zhijian




