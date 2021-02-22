Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C717320ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 02:01:07 +0100 (CET)
Received: from localhost ([::1]:41906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDzb0-0004xI-8f
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 20:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lDzZj-0004Ma-T1; Sun, 21 Feb 2021 19:59:48 -0500
Received: from mout.gmx.net ([212.227.15.18]:60091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>)
 id 1lDzZh-00061O-VC; Sun, 21 Feb 2021 19:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1613955582;
 bh=NF2IV0ivZjAPjn5DsoOc8xzPFB9oes4xIXk2kC7gSeU=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:References:Date:In-Reply-To;
 b=asM5zglB1PhRgQeKQNhijWFt+E4UeOK/LnW6HInNW9hpJZq9mlzEqN564/Ky0gIUH
 7EIkNufD8xjUf/jSpBo4wdZNwmtE/oi1aen+MjUJC1jlCem4yPPHIvAYmS0eXHpEKl
 yCPLTAbSnq0Mem2vh38faNxuw9M5FR4UYOXi6ijQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.180.210]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bWr-1lvPB70CqR-010eda; Mon, 22
 Feb 2021 01:59:42 +0100
Subject: Re: [PATCH] linux-user: Add missing TARGET___O_TMPFILE for hppa and
 alpha
From: Helge Deller <deller@gmx.de>
To: qemu-stable@nongnu.org
References: <20210201155922.GA18291@ls3530.fritz.box>
Message-ID: <6aed2a0f-2859-af4a-bd67-d0a6dbd68623@gmx.de>
Date: Mon, 22 Feb 2021 01:59:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210201155922.GA18291@ls3530.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VTCCems8tK63sRIYFZQ3dWh+vCeGK/UlX7u/N5UCP+7nT8dnnbH
 AeAuJ50wEu/r9px3o/tNIimDXqGXwnfmx5S0cWmdX/AQd+9Oiqa96/coIcCcOAyfmLBuM+8
 vfLkiQUtTdjD40Zk/SoLsDgIdA0g9UdSx5wS9WrmxXmC3Ww0RC8yteKS3RaEO7EDOpKqe8f
 O6/HatCkT1TUS8okNWT9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:E7qmPpF12xk=:wX5n91WdGl/poMJh8w+G4d
 fqwCt14BBjTf2HEOtuDuu+cKNlUV31N/RDkqXAsFKVpu5WjMCvVIL40QumSqjILb3s+t+9PSu
 vVixtJIyFHFiwH7f6BPIRx5v3iLY1Z/LUSlXQhepFpWRn7PS7VYuAHQRW5i5aLIbky0dvfADu
 IeX4+9RyYwGz/cosLOH5X4iETH0l6j1UojayAfb5IB5pN4X1gh96qxsRPUT8xctmjfTKpyknk
 m6vwt36h9vcAK8sxABqzLDLKq0lACXy3HOC1h86ojAg/LKKkvAqoFiVrMGuyX8iZrSKbrF8fr
 35gg8sf9mZQvH9KmkZ302kcFsX/APA9Po4Kxsp2zbhAwxD24t+mb0IeM08rN0ge5r9fWqR0h3
 kVn8JG3Pk+9eGuCpkg8/WTNnjVuEcjWQA9w9+cqTm/gaDlIKENcn8mGnt6aR9C6foiZaT36P3
 jYXvfceIiYYGVUYrIXX4UhIqf9sLR/r7VF40PrsKCstPLY/MmJXG2GaOvpYE6FFbonJxcIBon
 jmMxqDJj3soLXIOTsqkM9Zm81IBsTi08Kjq9LT+y/16Wt3jaav+M2MoXlgyxlUAjLevWIMlVg
 qL33tP88XmmOw14xeN47BqhhIEqO2OsE0ccD7g9fpyGHdRh3GHY9QlGLOdPIIluWSiM7MSuWt
 3x6oqETdrN7QzBW95T6W3n9tWws0v9PJ6iWgJluzWQwBl4lH/4I0lWERVK+EonzkFfJ3tWvmR
 lXcBU/jkYKC3EvN4/K7DBbD9DDu9klkH/7N6AjhZzkTrhyhWAexwFTIxzrskAINrlf6VBvDeA
 nYtzm2FeDwV/pMMMSciJJnc500RKHcqd/mz26S/OgZOV4LAj3dU+o4Q+jVYOCRqO8MSEZ+jMe
 3I9u3q3K9VK42mrve7cw==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dear qemu-stable,

can you please consider adding this patch to the qemu-stable branch.
Upstream commit 23b311155078bdd5bacc016ff3b3ebb5462b10c0

Thanks,
Helge

On 2/1/21 4:59 PM, Helge Deller wrote:
> The hppa and alpha targets miss the #define of the TARGET___O_TMPFILE
> and as such fail to run a trivial symlink command like
>
>      ln -s /bin/bash /tmp
>
> which results in an -EINVAL return code.
>
> Adding the define fixes the problem.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> ---
>
> diff --git a/linux-user/alpha/target_fcntl.h b/linux-user/alpha/target_f=
cntl.h
> index 2617e73472..0a74807a8b 100644
> --- a/linux-user/alpha/target_fcntl.h
> +++ b/linux-user/alpha/target_fcntl.h
> @@ -23,6 +23,7 @@
>   #define TARGET_O_CLOEXEC     010000000
>   #define TARGET___O_SYNC      020000000
>   #define TARGET_O_PATH        040000000
> +#define TARGET___O_TMPFILE  0100000000
>
>   #define TARGET_F_GETLK         7
>   #define TARGET_F_SETLK         8
> diff --git a/linux-user/hppa/target_fcntl.h b/linux-user/hppa/target_fcn=
tl.h
> index bd966a59b8..08e3a4fcb0 100644
> --- a/linux-user/hppa/target_fcntl.h
> +++ b/linux-user/hppa/target_fcntl.h
> @@ -21,6 +21,7 @@
>   #define TARGET_O_CLOEXEC     010000000
>   #define TARGET___O_SYNC      000100000
>   #define TARGET_O_PATH        020000000
> +#define TARGET___O_TMPFILE   040000000
>
>   #define TARGET_F_RDLCK         1
>   #define TARGET_F_WRLCK         2
>


