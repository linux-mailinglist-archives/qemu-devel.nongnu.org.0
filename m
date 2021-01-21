Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CC32FDFF6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 04:11:41 +0100 (CET)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2QNo-0003uk-7U
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 22:11:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l2QMq-0003UZ-Kk
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 22:10:40 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shiliyang@huawei.com>)
 id 1l2QMl-0006JI-7B
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 22:10:40 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DLnR82fjRzl7m3;
 Thu, 21 Jan 2021 11:08:52 +0800 (CST)
Received: from [10.108.235.13] (10.108.235.13) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Thu, 21 Jan 2021 11:10:10 +0800
Subject: Re: [PATCH V4 4/4] bsd-user: space required after semicolon
To: Warner Losh <imp@bsdimp.com>
References: <c75512b3-0665-d686-5ea4-248a9819355d@huawei.com>
 <6bdfc158-0f16-b19f-4c65-8c47338f1dcc@huawei.com>
 <CANCZdfos9ck76mZoaYUOe060ziexTNCH8SJiT_c=MY5=QwoxMA@mail.gmail.com>
From: shiliyang <shiliyang@huawei.com>
Message-ID: <b65b0e5d-f2e8-1dea-b7a0-3583de7b7a98@huawei.com>
Date: Thu, 21 Jan 2021 11:10:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfos9ck76mZoaYUOe060ziexTNCH8SJiT_c=MY5=QwoxMA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.108.235.13]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=shiliyang@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.chen@huawei.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, hunongda@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Warner:
   I might misunderstood it before.
   So, what should I do is to make a new pull request for bsd-user-rebase-3.1 branch. Am I right?
   I have submitted a pull request: https://github.com/qemu-bsd-user/qemu-bsd-user/pull/4
   Please review it.

Thanks.
Best regards.

On 2021/1/18 10:35, Warner Losh wrote:
> Can you submit this to our current fork at http://github.com/qemu-bsd-user <http://github.com/qemu-bsd-user> on the rebase-3.1 branch? Having churn like this upstream just slows us down since we have extensive changes and these will conflict.
> 
> Warner 
> 
> On Sun, Jan 17, 2021, 7:21 PM shiliyang <shiliyang@huawei.com <mailto:shiliyang@huawei.com>> wrote:
> 
>     This patch fixes error style problems found by checkpatch.pl <http://checkpatch.pl>:
>     ERROR: space required after that ','
> 
>     Signed-off-by: Liyang Shi <shiliyang@huawei.com <mailto:shiliyang@huawei.com>>
>     ---
>      bsd-user/elfload.c | 10 +++++-----
>      1 file changed, 5 insertions(+), 5 deletions(-)
> 
>     diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
>     index 2842dfe56b..c89c998c22 100644
>     --- a/bsd-user/elfload.c
>     +++ b/bsd-user/elfload.c
>     @@ -636,8 +636,8 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
> 
>      #ifndef __FreeBSD__
>          bprm->p = copy_elf_strings(1, &bprm->filename, bprm->page, bprm->p);
>     -    bprm->p = copy_elf_strings(bprm->envc,bprm->envp,bprm->page,bprm->p);
>     -    bprm->p = copy_elf_strings(bprm->argc,bprm->argv,bprm->page,bprm->p);
>     +    bprm->p = copy_elf_strings(bprm->envc, bprm->envp, bprm->page, bprm->p);
>     +    bprm->p = copy_elf_strings(bprm->argc, bprm->argv, bprm->page, bprm->p);
>          if (!bprm->p) {
>              retval = -E2BIG;
>          }
>     @@ -739,7 +739,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
>                  if (retval >= 0) {
>                      retval = lseek(interpreter_fd, 0, SEEK_SET);
>                      if(retval >= 0) {
>     -                    retval = read(interpreter_fd,bprm->buf,128);
>     +                    retval = read(interpreter_fd, bprm->buf, 128);
>                      }
>                  }
>                  if (retval >= 0) {
>     @@ -769,7 +769,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
>              }
> 
>              if (interp_elf_ex.e_ident[0] != 0x7f ||
>     -                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF",3) != 0) {
>     +                strncmp((char *)&interp_elf_ex.e_ident[1], "ELF", 3) != 0) {
>                  interpreter_type &= ~INTERPRETER_ELF;
>              }
> 
>     @@ -792,7 +792,7 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
>                  passed_p = passed_fileno;
> 
>                  if (elf_interpreter) {
>     -                bprm->p = copy_elf_strings(1,&passed_p,bprm->page,bprm->p);
>     +                bprm->p = copy_elf_strings(1, &passed_p, bprm->page, bprm->p);
>                      bprm->argc++;
>                  }
>              }
>     -- 
>     2.29.1.59.gf9b6481aed
> 

