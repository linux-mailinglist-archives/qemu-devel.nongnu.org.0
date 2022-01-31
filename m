Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770334A507F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:49:56 +0100 (CET)
Received: from localhost ([::1]:51158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdcZ-0002FM-Gx
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1nEd3c-0003wU-Tn; Mon, 31 Jan 2022 15:13:49 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1nEd3a-0005fA-Cz; Mon, 31 Jan 2022 15:13:48 -0500
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JnfPW6BD4zccld;
 Tue,  1 Feb 2022 04:12:47 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 1 Feb 2022 04:13:42 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.021;
 Tue, 1 Feb 2022 04:13:41 +0800
To: Oleg Vasilev <me@svin.in>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH 1/2] target/arm: move regime_ttbr helper
Thread-Topic: [RFC PATCH 1/2] target/arm: move regime_ttbr helper
Thread-Index: AQHX91QLoO0Anzq6a0eSuPmah3gWdA==
Date: Mon, 31 Jan 2022 20:13:41 +0000
Message-ID: <0e02f13052ac4e50be500c2d63579021@huawei.com>
References: <20211222164947.634759-1-me@svin.in>
 <20211222164947.634759-2-me@svin.in>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.163.112]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=vasilev.oleg@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, PYZOR_CHECK=1.392,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Vasilev Oleg <vasilev.oleg@huawei.com>
From:  Vasilev Oleg via <qemu-devel@nongnu.org>


