Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02894607A34
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 17:11:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltfz-0003Vx-JM
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:11:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oltfw-00052V-Gn
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 11:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltfg-0002BI-GZ
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:10:52 -0400
Received: from mout.kundenserver.de ([217.72.192.73])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oltfZ-0000D1-3u
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 11:10:51 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPooP-1oPfoe0SG3-00MtBR for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022
 17:10:43 +0200
Message-ID: <cee5bfcf-aaf4-9962-3334-a8bc65cf7ec0@vivier.eu>
Date: Fri, 21 Oct 2022 17:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] linux-user: don't use AT_EXECFD in do_openat()
Content-Language: fr
To: qemu-devel@nongnu.org
References: <20220927124357.688536-1-laurent@vivier.eu>
 <20220927124357.688536-3-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220927124357.688536-3-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Pzv+SqUAAgVPpHNorPgtAeeMesWdqCSVQqrz61YlNQF5jydDkdO
 EhY+kC9hHUziJqgSb01aT9YDQJUh//Ojt+HtfxVzpOnX1QxXG17XsaovvX6XTRNjqH0iME6
 w1B7z+HEbYiChCPtsvTLhHrFuEAMT7zLDS8uhMjhLM+ny/weVNjESQYpbmbdzweU7BJTeka
 Gzd/vAqu4qPX+AnsmhjFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8DKH84G/UMc=:6hRByrxmNNdGj4KtHDVbNw
 JsJoxxv7XnCtRhixWmf+27n3ldpFcQieBjJpDwTd6T5kHOz+ixOtxjjQjv9Lrw8L308/Wa3xL
 dm6C/SyB1lUyLKnNvVJL+AoEhmpRrfC0Etx0c2kTi34U4w1Uu8WTl+GFpp0E9iE+bvfgenTGe
 lBqCgcEam8N0NYBh/DdSsn4NGADxSXldthFo37NPmDHGUGLVHhtmSqlRK58oILugkQzdk6M+l
 n5Hhfr+45PeYUmmMCBUijmGO2Zb6+p28E9Ya13Z4rY1VLJN7TGKzYIM/OyVlNvieXBPsdcwLN
 auQOJ12u+z8SVUjENN6hJwBkBpEom1UkdFVFCu3uKg98sfG5O+YFQFU5yuj+VeVqlJa8KXzCO
 Dk8nmX4A2FmBvkA21n8twJyLjJXF6Q2KUnh+9dMHiCaM0GGxmZ9VP2F5xv1Lvbh+prFXEzJ5i
 DA+Iywyt6sr+Fz/Zbms3BF0pp/pKr0FsZVTZfTOdPBxz+PXaIMRfLcLr2FGJ+aZ7QiN24AhmU
 2qwaqvAAOGClJkzW0JNQmWXQk2haMI8po/GFYPmUVYUrjzfH6VTy4DQhEUekXf3dEscIRKABy
 EAa8tXdxrdkISEobX1pOOy+Biqf1AmrU10JkTroLH3mB43egUBnEvKaQ0TlmrVVs+6hXvLKF1
 b6fPhuvuIJwdQH9VTOtFUtr/jaH+j6ZOvbr4zZUHNt6Yu+4YGjvOEG1VLw0AXCcrFhSrzOuF6
 rgj2tddyIQQj0KWzybUEO/tzwdAa0zYvMP3vQcnfkjb2tILi2EIrjWmAye4J33rpFlpKNxw3Z
 U8oQEsv
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 27/09/2022 à 14:43, Laurent Vivier a écrit :
> AT_EXECFD gives access to the binary file even if
> it is not readable (only executable).
> 
> Moreover it can be opened with flags and mode that are not the ones
> provided by do_openat() caller.
> 
> And it is not available because loader_exec() has closed it.
> 
> To avoid that, use only safe_openat() with the exec_path.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>   linux-user/syscall.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ddf09d7eb61a..0c80e9d68e28 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8263,8 +8263,7 @@ static int do_openat(CPUArchState *cpu_env, int dirfd, const char *pathname, int
>       };
>   
>       if (is_proc_myself(pathname, "exe")) {
> -        int execfd = qemu_getauxval(AT_EXECFD);
> -        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
> +        return safe_openat(dirfd, exec_path, flags, mode);
>       }
>   
>       for (fake_open = fakes; fake_open->filename; fake_open++) {

Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


