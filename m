Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DF497D77
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 11:54:25 +0100 (CET)
Received: from localhost ([::1]:49156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBwzQ-00041k-Jg
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 05:54:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nBwy1-0002kJ-6l
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:52:57 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nBwxy-0003tl-Jj
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 05:52:56 -0500
Received: from fraeml708-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Jj6Ck41MCz689yj;
 Mon, 24 Jan 2022 18:48:34 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml708-chm.china.huawei.com (10.206.15.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 11:52:47 +0100
Received: from localhost (10.47.74.148) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Mon, 24 Jan
 2022 10:52:46 +0000
Date: Mon, 24 Jan 2022 10:52:45 +0000
To: Samarth Saxena <samarths@cadence.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [CXL HDM DECODER PROGRAMMING] - Question: Does Qemu program HDM
 decoder register of the CXL endpoint?
Message-ID: <20220124105245.00006aa1@Huawei.com>
In-Reply-To: <DM8PR07MB8920E2DE0A0435025B4C0E2FDD5D9@DM8PR07MB8920.namprd07.prod.outlook.com>
References: <DM8PR07MB8920E2DE0A0435025B4C0E2FDD5D9@DM8PR07MB8920.namprd07.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.74.148]
X-ClientProxiedBy: lhreml739-chm.china.huawei.com (10.201.108.189) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Sun, 23 Jan 2022 16:13:29 +0000
Samarth Saxena <samarths@cadence.com> wrote:

> Hi All,
> 
> I had a question about the CXL HDM Decoder register programming.
> Is there any part of Qemu, that automatically programs the enable bit
> of the HDM decoder register in the Component registers of the CXL
> endpoint? The CDR (component registers) are hosted inside the memory
> of the CXL endpoint.

Hi Samarth,

Given upstream QEMU doesn't support any CXL emulation at all currently
the answer to that is a no :)

I hope to post a v4 patch series for CXL support later this week.

Once that's out perhaps we can pick up this question again.

Thanks,

Jonathan


> 
> Regards,
> [CadenceLogoRed185Regcopy1583174817new51584636989.png]<https://www.cadence.com/en_US/home.html>
> Samarth Saxena
> Sr Principal Software Engineer
> T: 911204308300
> [UIcorrectsize1583179003.png]<https://www.cadence.com/en_US/home.html>
> [16066EmailSignatureFortune100Best2021White92x1271617625037.png]<https://www.cadence.com/en_US/home/company/careers.html>
> 
> 
> 
> 
> 


