Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C21F331AD0E
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 17:21:19 +0100 (CET)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAxfa-0004xX-T9
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 11:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxdB-0003Wk-4a
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:18:49 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:43539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lAxd8-0003Sf-VD
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 11:18:48 -0500
Received: from [192.168.100.1] ([82.252.149.54]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MxDgs-1m87kZ29yy-00xcqD; Sat, 13 Feb 2021 17:18:35 +0100
Subject: Re: [PATCH] linux-user: Add missing TARGET___O_TMPFILE for hppa and
 alpha
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20210201155922.GA18291@ls3530.fritz.box>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cedb0ccc-ff19-56ce-eddc-dba2017a614b@vivier.eu>
Date: Sat, 13 Feb 2021 17:18:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201155922.GA18291@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:i28CfIH1daU89Vpjj7oNVw1u60PdlNkBWzJmKynCyYJFMvOhDYx
 BgWCqRJmc/ZRjOrjQWH++UD/07pDF7EZwzjRvFJWRGd4dEvvjmEKrVQ2qMTk4erEe6Qti3u
 ozkDUuOHAi5Rg6cmvoBwCtsFUwslwCijY4DSLn8Nzev2xrmVO57jdheGQvurl06yWD/wr5t
 4FKsThuJx6PEd+9RELJgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AEKLL7CnLJ8=:jodm4d7+Aruo8SO7TnD6CM
 vs20SKdo3IbK8GehkUScJF+aggvCDBaGihgbQToJw0rp+sJd+LZ5JbcA8lZWfdPiufv21HFFA
 jydYudjk1S+Rd2FyfKsHiW9uO//d1NiY44THTYcKAQSgrorlYvMZUCPiIwT3DkTtubY460tAP
 +zI/GfYslGt82AQw+WoIHjprIINpOU9Jb2RWA9l2nQUSdMC/MkjKoupu1XDtp3LuxW97VPVr2
 CZYpF+hzzwOHKYwh5b9WpCqZcz/ng+yEsXo0sXBrYN+mB6uSOpLxufW9yqj6cWqKpwL3+Tarr
 JZK2EgHjfmCHl2ARz9czqYL4cjxQG0BCG5S+Pqus+oTrYAo+zA+6BTm+LhjQpnGqFLDNaJLgj
 RewXsJe7MKPIISSjVb3C4Jau6LChHbHp/RTgEzMXOS6Vv8g4pj+MhTXrt3+nPznuClPHu0YTz
 hYpyXIvp2Q==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/02/2021 à 16:59, Helge Deller a écrit :
> The hppa and alpha targets miss the #define of the TARGET___O_TMPFILE
> and as such fail to run a trivial symlink command like
> 
>     ln -s /bin/bash /tmp
> 
> which results in an -EINVAL return code.
> 
> Adding the define fixes the problem.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> 
> diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_fcntl.h
> index 2617e73472..0a74807a8b 100644
> --- a/linux-user/alpha/target_fcntl.h
> +++ b/linux-user/alpha/target_fcntl.h
> @@ -23,6 +23,7 @@
>  #define TARGET_O_CLOEXEC     010000000
>  #define TARGET___O_SYNC      020000000
>  #define TARGET_O_PATH        040000000
> +#define TARGET___O_TMPFILE  0100000000
> 
>  #define TARGET_F_GETLK         7
>  #define TARGET_F_SETLK         8
> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcntl.h
> index bd966a59b8..08e3a4fcb0 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -21,6 +21,7 @@
>  #define TARGET_O_CLOEXEC     010000000
>  #define TARGET___O_SYNC      000100000
>  #define TARGET_O_PATH        020000000
> +#define TARGET___O_TMPFILE   040000000
> 
>  #define TARGET_F_RDLCK         1
>  #define TARGET_F_WRLCK         2
> 

Applied to my linux-user-for-6.0 branch.

Thanks,
Laurent

