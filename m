Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8931060983B
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 04:28:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjWt-0004SD-F1
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLQv-00069w-BH; Sat, 22 Oct 2022 16:49:29 -0400
Received: from mout.kundenserver.de ([217.72.192.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLQt-00058C-Q0; Sat, 22 Oct 2022 16:49:29 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MsIfc-1p6lkj3vzu-00tnkB; Sat, 22 Oct 2022 22:48:40 +0200
Message-ID: <2c44912b-6e82-61b5-65f3-c2fe9d5664aa@vivier.eu>
Date: Sat, 22 Oct 2022 22:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] .gitignore: add multiple items to .gitignore
Content-Language: fr
To: "Wang, Lei" <lei4.wang@intel.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, alex.bennee@linaro.org, f4bug@amsat.org
References: <20221020171921.1078533-1-lei4.wang@intel.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221020171921.1078533-1-lei4.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G5CmO9bbS37OZvAxDIwY7ILV1Y/SXiaUsPGPw7BhJMW7+3zePjH
 DLKcRfMDGZoTs+5KA6Ywj0v1UimmNhzhjb9zaZk539ZxlIv6p3HwJ93+3Rr+qtKIhMhnKAw
 eQNrQzNp+GsM5Kaz+kK2BL6c9vmrn23LF2giJrzFfOnBBTUt8LlbN/wAccO74+Rv8iSTxVb
 Ntx8w7iViA84kDO15bjNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y+qs+buk/XY=:ctdSE0i7lYVPjInvxAMHqT
 UAMmtUO3vwT1UiXvcOug4r7389ly45sAxqmQZgmXkirDYrYNG3PAWVt7ddMvWINDf4IZjSfBa
 xHQ/W/bvFkFPoP4NBasyOnWWtpW5RuAYIT7Gn+lJ3AUbaQqgNekdRx8mG0CFbHC+hqZBGe2jm
 r1DBir+VkUpOPGKRQfyJG/3YgzzRGGqZboqA4gyun8t9bs4b5X+GC4BBJgNJsDgegnPgyLM+y
 Ek6NDeiSWRcCcr/u+JTGkrx3GasHShclu/HzKcb3yZbcA3pjSAWlqxO5FYjP4Ozt3Gfxo1ZmQ
 kOlUZzawlHkt01HehiNkUbZmh00LvEvE+NU/w0ikWnt5FWN9mNJKJ+IemoWxvP28sAMgKTld3
 vfsWfsc4c4ICUXGawIPa7B62N2yQz7ZrEgJinRR3YKSRWFcOFd2bzyhVBwFk5j5AAVc9DS0HZ
 YVWMChhY+CQbCxZ1TFlD/eOQcAdaHE8BEL2N+Dmil+O+m3BbZ/6/WFiCz6q7tVQIBGK09C8js
 1NgNbLfsNwGoTDWCGdqPHXsze+RWMuLIJI+n1u/f0WGJ4mIxSN9tQZTmDyzyEAqadXDfXzSKx
 vHDlkuCgQ35FMMnfHEZvYEKjgWxt9SfZR9PU+FYpCy6D7Hecm/iq/sQ7QPj8Ga3X6Yz4tVTDB
 +4GETLjYy8OGT7O32z3ZKKjqpmSLPdspbstkPyGkZ7NfG1erw8G8PewYy7V2+YPHxJNKT0QKf
 GYw4p2nblbxXGGxWJsmzMv0fbNTxmv7OAW3kjl5CIKTjtcKhiSJplrXW1HIFbhbdYU+P2pRJd
 a8+DOM0
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 20/10/2022 à 19:19, Wang, Lei a écrit :
> Add /.vscode/, .clang-format and .gdb_history to .gitignore because:
> 
>   - For VSCode, workspace settings as well as debugging and task
>   configurations are stored at the root in a .vscode folder;
>   - For ClangFormat, the .clang-format file is searched relative to
>   the current working directory when reading stdin;
>   - For GDB, GDB command history file defaults to the value of the
>   environment variable GDBHISTFILE, or to ./.gdb_history if this
>   variable is not set.
> 
> Signed-off-by: Wang, Lei <lei4.wang@intel.com>
> ---
>   .gitignore | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index 8aab671265..61fa39967b 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,10 +1,13 @@
>   /GNUmakefile
>   /build/
>   /.cache/
> +/.vscode/
>   *.pyc
>   .sdk
>   .stgit-*
>   .git-submodule-status
> +.clang-format
> +.gdb_history
>   cscope.*
>   tags
>   TAGS

Applied to my trivial-patches branch.

Thanks,
Laurent


