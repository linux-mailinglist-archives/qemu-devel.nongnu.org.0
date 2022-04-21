Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DD6509BE5
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 11:19:35 +0200 (CEST)
Received: from localhost ([::1]:45932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhSyM-0005rf-CV
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 05:19:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nhSQC-0007vW-G0
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:44:16 -0400
Received: from smtp59.i.mail.ru ([217.69.128.39]:36054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nhSQA-000219-BC
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 04:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=a9StmsQpa5U0wmIBPiYEhV1WL36AzjEtfGB9kdMAeJY=; 
 t=1650530654;x=1651136054; 
 b=fxsWiZK8Bl0tNATCvNbfN42byjgH5OnW66TwBu5mr3C3dnHLBRnibEv0vWdwNzg1QBtbICnABYr0pGNwJV9/WIoSf5wbFMawpbc6EyHlMvhOuPWUnO3nMWsoycsjesAbaRaBXimmh2zzxsdJdjZFSd9emlPpUVSZYMKuThw7d8d2bzjxw/hILPY+RjQI7TaL2pCrlWnANcSjn+i+zYUcJ/NIYzHgDHCDaGZjvS7Nh9IGXhWFIn7Uhq0ujgGcUgRMErjEAPVqjFaaMUzt2eynSRLoirxAKduOaOw0QigfwvmYIdJMOP1XyES2ZwfCdtd/EbdRW+e2DdMpoX8RV5Nl3Q==;
Received: by smtp59.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nhSQ3-00020h-S5; Thu, 21 Apr 2022 11:44:08 +0300
Message-ID: <d7d44746-3505-633e-0ec4-eed7991e3ae0@mail.ru>
Date: Thu, 21 Apr 2022 11:44:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 0/9] Machine type compatible properties
Content-Language: en-US
To: Maxim Davydov <maxim.davydov@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, eblake@redhat.com,
 armbru@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 xiaoguangrong.eric@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 marcandre.lureau@redhat.com, chen.zhang@intel.com, lizhijian@fujitsu.com,
 berrange@redhat.com, jsnow@redhat.com, crosa@redhat.com
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp59.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD916C41472748AFA0418E5F15F975514243DEB9D0E61FCDC0F00894C459B0CD1B9FC6248F35F415821443157C05C70DCE60F2BCA268B883B345E6CE7239E2C5700
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76ABD3380F320B62CEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377E85B0EC44E8FD73EA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA6F1EB44F11905681C993EE22F5DEED88A20879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C06FD1C55BDD38FC3FD2E47CDBA5A96583C09775C1D3CA48CF53FA85A707D24CADCC7F00164DA146DAFE8445B8C89999729449624AB7ADAF37F6B57BC7E64490611E7FA7ABCAF51C92176DF2183F8FC7C04CF195F1528592878941B15DA834481F9449624AB7ADAF37BA3038C0950A5D3613377AFFFEAFD26923F8577A6DFFEA7C54AC55A5269ED3177B076A6E789B0E97A8DF7F3B2552694A1E7802607F20496D49FD398EE364050F9647ADFADE5905B18FBB52F5C7ECD1BBB3661434B16C20AC78D18283394535A9E827F84554CEF5019E625A9149C048EE9ECD01F8117BC8BEE2021AF6380DFAD18AA50765F790063735872C767BF85DA227C277FBC8AE2E8BC507A3C1F16EC57375ECD9A6C639B01B4E70A05D1297E1BBCB5012B2E24CD356
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5C53C591A49C6B8FF96A94B19ECEB9BC404CC3B8AA68C6D10D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34F1257DC9690AEBA11481E75DB0CDAE5C83B2A9166DD74BCBBE5771D11B25C742F68EAB96499FE6471D7E09C32AA3244C47061F370F3F26C521BC81D69A3A3BB605AB220A9D022EBC4A5FEE14E26358B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMZageuMAik3hNZNBStPmFw==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913DC1AA1392691403265DFDF773477DAA8105CDF6DE23CC357E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.39;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp59.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

29.03.2022 00:15, Maxim Davydov wrote:
> We need to be able to check machine type after its definition. It's
> necessary when using complicated inheritance of compatible features. For
> instance, this tool can help to find bugs in the machine type definition
> if the name of the device has been changed. Also, this tool was created
> to help with MTs of other projects such as vz branches.


We discussed verbally two points to change:

1. Instead of workarounds to avoid crashes, which are unsafe (we avoid crash, but is data that we generate this way valid or not?), let's require to call QEMU process with such options so everything that needed is initialized and we avoid crashes and still get valid information

2. We want not "default" values, but "current" ones. I.e., we start QEMU with same options like in production, and we clearly get all real values of machine properties.


> 
> Maxim Davydov (9):
>    qmp: Add dump machine type compatible properties
>    pci: add null-pointer check
>    mem: appropriate handling getting mem region
>    msmouse: add appropriate unregister handler
>    wctablet: add appropriate unregister handler
>    chardev: add appropriate getting address
>    colo-compare: safe finalization
>    qom: add command to print initial properties
>    scripts: printing machine type compat properties
> 
>   chardev/char-socket.c       |   9 ++
>   chardev/msmouse.c           |   4 +-
>   chardev/wctablet.c          |   4 +-
>   hw/core/machine-qmp-cmds.c  |  25 +++-
>   hw/i386/sgx-epc.c           |   5 +-
>   hw/mem/nvdimm.c             |   6 +
>   hw/mem/pc-dimm.c            |   5 +
>   hw/pci-host/i440fx.c        |  17 ++-
>   hw/pci-host/q35.c           |  17 ++-
>   net/colo-compare.c          |  25 ++--
>   qapi/machine.json           |  58 +++++++-
>   qapi/qom.json               |  69 +++++++++
>   qom/qom-qmp-cmds.c          | 121 ++++++++++++++++
>   scripts/print_MT.py         | 274 ++++++++++++++++++++++++++++++++++++
>   tests/qtest/fuzz/qos_fuzz.c |   2 +-
>   15 files changed, 613 insertions(+), 28 deletions(-)
>   create mode 100755 scripts/print_MT.py
> 


-- 
Best regards,
Vladimir

