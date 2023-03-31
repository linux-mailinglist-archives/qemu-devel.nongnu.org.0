Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADA6D1476
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 02:56:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi32K-0001gE-Th; Thu, 30 Mar 2023 20:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maobibo@loongson.cn>)
 id 1pi32F-0001fv-22
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:54:31 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maobibo@loongson.cn>) id 1pi32B-00059B-1Y
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 20:54:30 -0400
Received: from loongson.cn (unknown [10.20.42.170])
 by gateway (Coremail) with SMTP id _____8DxEzQ4LyZknLkUAA--.31858S3;
 Fri, 31 Mar 2023 08:54:17 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxT+Q4LyZkyJwRAA--.50101S3; 
 Fri, 31 Mar 2023 08:54:16 +0800 (CST)
Message-ID: <67517424-0f32-09f8-6446-53f71ebd59b5@loongson.cn>
Date: Fri, 31 Mar 2023 08:54:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: On integrating LoongArch EDK2 firmware into QEMU build process
Content-Language: en-US
To: WANG Xuerui <i.qemu@xen0n.name>, qemu-devel <qemu-devel@nongnu.org>
Cc: Song Gao <gaosong@loongson.cn>, =?UTF-8?B?5p2o5bCP5aif?=
 <yangxiaojuan@loongson.cn>, Chao Li <lichao@loongson.cn>
References: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <1f1d3d9f-c3df-4f29-df66-886410994cc3@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxT+Q4LyZkyJwRAA--.50101S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFy7Gr17Jw17Ar4rWryfWFg_yoW8AFyxpw
 43ua17JrWkKrW7K348C3W7uFZaqrs5GrW5J3WrGryDCwnIgrn2vryjqay5CF9rGw1fJw4j
 grWjvw40yan8ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I2
 62IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4
 CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
 eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw2
 8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
 x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
 CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
 42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqWUUUUU
Received-SPF: pass client-ip=114.242.206.163; envelope-from=maobibo@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Xuerui,

Thanks for your mail, it is a good suggestion. Now we are planing to move LoongArch uefi bios from edk2-platform to edk2 repo, so that uefi bios supporting LoongArch can be auto compiled and uploaded to qemu repo. Only that process is somwhat slow since lacking of hands, however we are doing this.

Regards
Bibo, Mao

在 2023/3/30 22:06, WANG Xuerui 写道:
> Hi,
> 
> Recently there are reportedly increased general interest in trying out LoongArch on top of QEMU, among both end users and organizations; and the EDK2 firmware port is fully upstreamed since the stable202211 version, and a build suitable for QEMU is already possible with Platform/Loongson/LoongArchQemuPkg in edk2-platforms. I think providing pre-built LoongArch firmware would make it much easier to dabble in system emulation, helping those users. (They currently have to pull a blob from yangxiaojuan/qemu-binary, and remember to pair certain version of QEMU with certain revision of the firmware blob. I'm also one of the users who can't remember which version to use, but I can always build my own; imagine the difficulty an end user would face!)
> 
> So I tried to add a LoongArch build to the list stored in roms/, but discovered that edk2-platforms seems not included, because all other platforms' EDK2 packages are directly under the main edk2 repo.
> 
> The question is: is integrating a platform package from edk2-platforms okay under the current build system, so we can arrange to provide edk2-platforms also as a submodule and go ahead? Or do we (the LoongArch firmware community) have to change the code organization to make necessary parts available in the main edk2 repo?
> 
> CC-ing target/loongarch maintainers from Loongson too as you may have more information.


